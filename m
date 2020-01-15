Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166F140536
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2020 09:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BBA6F43B;
	Fri, 17 Jan 2020 08:21:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936C66EABD;
 Wed, 15 Jan 2020 14:38:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 06:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; d="scan'208";a="273659015"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Jan 2020 06:37:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Jan 2020 16:37:57 +0200
Date: Wed, 15 Jan 2020 16:37:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200115143757.GZ13686@intel.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115121652.7050-3-tzimmermann@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:21:04 +0000
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v2 02/21] drm: Evaluate struct
 drm_device.vblank_disable_immediate on each use
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 eric@anholt.net, amd-gfx@lists.freedesktop.org, benjamin.gaignard@linaro.org,
 alexandre.torgue@st.com, David1.Zhou@amd.com, thellstrom@vmware.com,
 sean@poorly.run, patrik.r.jakobsson@gmail.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 harry.wentland@amd.com, mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, rodrigosiqueiramelo@gmail.com,
 philippe.cornu@st.com, yannick.fertre@st.com, robdclark@gmail.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 01:16:33PM +0100, Thomas Zimmermann wrote:
> VBLANK interrupts can be disabled immediately or with a delay, where the
> latter is the default. The former option can be selected by setting
> get_vblank_timestamp, and enabling vblank_disable_immediate in struct
> drm_device.
> =

> The setup is only evaluated once when DRM initializes VBLANKs. Evaluating
> the settings on each use of vblank_disable_immediate will allow for easy
> integration of CRTC VBLANK functions.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3f1dd54cc8bb..abb085c67d82 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -481,19 +481,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  =

>  	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
>  =

> -	/* Driver specific high-precision vblank timestamping supported? */
> -	if (dev->driver->get_vblank_timestamp)
> -		DRM_INFO("Driver supports precise vblank timestamp query.\n");
> -	else
> -		DRM_INFO("No driver support for vblank timestamp query.\n");
> -
> -	/* Must have precise timestamping for reliable vblank instant disable */
> -	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp=
) {
> -		dev->vblank_disable_immediate =3D false;
> -		DRM_INFO("Setting vblank_disable_immediate to false because "
> -			 "get_vblank_timestamp =3D=3D NULL\n");
> -	}

Which drivers are so broken they set vblank_disable_immediate to true
without having the vfunc specified? IMO this code should just go away
(or converted to a WARN).

> -
>  	return 0;
>  =

>  err:
> @@ -1070,6 +1057,15 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_get);
>  =

> +static bool __vblank_disable_immediate(struct drm_device *dev, unsigned =
int pipe)
> +{
> +	if (!dev->vblank_disable_immediate)
> +		return false;
> +	if (!dev->driver->get_vblank_timestamp)
> +		return false;
> +	return true;
> +}
> +
>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> @@ -1086,7 +1082,7 @@ static void drm_vblank_put(struct drm_device *dev, =
unsigned int pipe)
>  			return;
>  		else if (drm_vblank_offdelay < 0)
>  			vblank_disable_fn(&vblank->disable_timer);
> -		else if (!dev->vblank_disable_immediate)
> +		else if (__vblank_disable_immediate(dev, pipe))
>  			mod_timer(&vblank->disable_timer,
>  				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
>  	}
> @@ -1663,7 +1659,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
>  	/* If the counter is currently enabled and accurate, short-circuit
>  	 * queries to return the cached timestamp of the last vblank.
>  	 */
> -	if (dev->vblank_disable_immediate &&
> +	if (__vblank_disable_immediate(dev, pipe) &&
>  	    drm_wait_vblank_is_query(vblwait) &&
>  	    READ_ONCE(vblank->enabled)) {
>  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> @@ -1820,7 +1816,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsi=
gned int pipe)
>  	 * been signaled. The disable has to be last (after
>  	 * drm_handle_vblank_events) so that the timestamp is always accurate.
>  	 */
> -	disable_irq =3D (dev->vblank_disable_immediate &&
> +	disable_irq =3D (__vblank_disable_immediate(dev, pipe) &&
>  		       drm_vblank_offdelay > 0 &&
>  		       !atomic_read(&vblank->refcount));
>  =

> @@ -1893,7 +1889,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *=
dev, void *data,
>  	pipe =3D drm_crtc_index(crtc);
>  =

>  	vblank =3D &dev->vblank[pipe];
> -	vblank_enabled =3D dev->vblank_disable_immediate && READ_ONCE(vblank->e=
nabled);
> +	vblank_enabled =3D __vblank_disable_immediate(dev, pipe) &&
> +			 READ_ONCE(vblank->enabled);
>  =

>  	if (!vblank_enabled) {
>  		ret =3D drm_crtc_vblank_get(crtc);
> -- =

> 2.24.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
