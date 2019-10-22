Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A212B2AE
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079B89E5F;
	Fri, 27 Dec 2019 08:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9C6E8F9
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 20:08:19 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id p187so1118020ywg.3
 for <nouveau@lists.freedesktop.org>; Tue, 22 Oct 2019 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=X4y+DxWDbbu78QM7yfbLF2A6Kni0aYg/fpkIRsTM57s=;
 b=TlIUELKZrwSyVj8PCSvz9fXvx/Xdj4HJvSTVKMO9Wpb8PXAutJ6ulqwrcytHT2f9WM
 yHfvlgjDHG8BXr3H2ZA8mkuumqwbpNr2ezqr9/VReeNf612vCE9YOHAJDxavHRMC3l+c
 4MsGZ7MWhUsnGDMLSzPExzkdArvt7eqlXGUY7nZrye0D90yePZocjFHToqfkvaCYrcwa
 fKjrS54FKpbvq3u3wlUVGOyNy+49vNMsJ/lHVjvqM0sDPq4PF2WIJp7do3L/jgZFlYxE
 L36FkqMaYbr2azjUAvQ3U5IkkPWX1RRbmWXbp+Vd/uTkBu74ma0iGYS1S5qBudQQBd6y
 9ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=X4y+DxWDbbu78QM7yfbLF2A6Kni0aYg/fpkIRsTM57s=;
 b=rVd9UKDHVaE2nJWTQvbHgRDw1VwtzmeuZCl7dgmE181IKzzeWmN6jBvpxjY7NnD+O5
 2ru9aXFMJLkDGWmIfnlYqYBNAMIEVXX7aE9sJHaKL9969tnIzlgFweQsfzivp6CPOZGE
 Xzenn003kKDeK7E/ykUGW4o+3zq6ZZxsJ6Y2IFuT/bG+gD4xpJVv+4bkQBlMD3BNthqq
 lnlpO5JTX094Z1TWBjDjLFWQGdkpFX1MVbr6tuI8o3PbRW1iWDLJ/rhchUrcombZ33Js
 NWi1WSTxWr1nQoXTXC6GKuUyGfpwVw/rXFTVNUHzPODkvdoe8RvSeTLDWlh/XOvt4knr
 HLUg==
X-Gm-Message-State: APjAAAUFiOP9pyLK8KOq6SLomjcHuC11kOEcp7rZwtKmChVD7qZ4uY7e
 QaoUtPPFsdQ2jh3sdOrg8VKiGg==
X-Google-Smtp-Source: APXvYqybDpMCuMzJDVisJ5wjUv95xhXJSwT76Swchhn553Kue1nbTjiT+v/v3aXDg7oQpffQZ+bhZA==
X-Received: by 2002:a81:9216:: with SMTP id j22mr172352ywg.223.1571774898592; 
 Tue, 22 Oct 2019 13:08:18 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m62sm4388235ywf.70.2019.10.22.13.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 13:08:16 -0700 (PDT)
Date: Tue, 22 Oct 2019 16:08:15 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20191022200815.GC212858@art_vandelay>
References: <20191022023641.8026-1-lyude@redhat.com>
 <20191022023641.8026-7-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022023641.8026-7-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH v5 06/14] drm/dp_mst: Protect drm_dp_mst_port
 members with locking
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <hwentlan@amd.com>, David Francis <David.Francis@amd.com>,
 amd-gfx@lists.freedesktop.org, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Juston Li <juston.li@intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>, Thomas Lim <Thomas.Lim@amd.com>,
 linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mathias =?iso-8859-1?Q?Fr=F6hlich?= <Mathias.Froehlich@web.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2019 at 10:36:01PM -0400, Lyude Paul wrote:
> This is a complicated one. Essentially, there's currently a problem in th=
e MST
> core that hasn't really caused any issues that we're aware of (emphasis o=
n "that
> we're aware of"): locking.
> =

> When we go through and probe the link addresses and path resources in a
> topology, we hold no locks when updating ports with said information. The
> members I'm referring to in particular are:
> =

> - ldps
> - ddps
> - mcs
> - pdt
> - dpcd_rev
> - num_sdp_streams
> - num_sdp_stream_sinks
> - available_pbn
> - input
> - connector
> =

> Now that we're handling UP requests asynchronously and will be using some=
 of
> the struct members mentioned above in atomic modesetting in the future for
> features such as PBN validation, this is going to become a lot more impor=
tant.
> As well, the next few commits that prepare us for and introduce suspend/r=
esume
> reprobing will also need clear locking in order to prevent from additional
> racing hilarities that we never could have hit in the past.
> =

> So, let's solve this issue by using &mgr->base.lock, the modesetting
> lock which currently only protects &mgr->base.state. This works
> perfectly because it allows us to avoid blocking connection_mutex
> unnecessarily, and we can grab this in connector detection paths since
> it's a ww mutex. We start by having drm_dp_mst_handle_up_req() hold this
> when updating ports. For drm_dp_mst_handle_link_address_port() things
> are a bit more complicated. As I've learned the hard way, we can grab
> &mgr->lock.base for everything except for port->connector. See, our
> normal driver probing paths end up generating this rather obvious
> lockdep chain:
> =

> &drm->mode_config.mutex
>   -> crtc_ww_class_mutex/crtc_ww_class_acquire
>     -> &connector->mutex
> =

> However, sysfs grabs &drm->mode_config.mutex in order to protect itself
> from connector state changing under it. Because this entails grabbing
> kn->count, e.g. the lock that the kernel provides for protecting sysfs
> contexts, we end up grabbing kn->count followed by
> &drm->mode_config.mutex. This ends up creating an extremely rude chain:
> =

> &kn->count
>   -> &drm->mode_config.mutex
>     -> crtc_ww_class_mutex/crtc_ww_class_acquire
>       -> &connector->mutex
> =

> I mean, look at that thing! It's just evil!!! This gross thing ends up
> making any calls to drm_connector_register()/drm_connector_unregister()
> impossible when holding any kind of modesetting lock. This is annoying
> because ideally, we always want to ensure that
> drm_dp_mst_port->connector never changes when doing an atomic commit or
> check that would affect the atomic topology state so that it can
> reliably and easily be used from future DRM DP MST helpers to assist
> with tasks such as scanning through the current VCPI allocations and
> adding connectors which need to have their allocations updated in
> response to a bandwidth change or the like.
> =

> Being able to hold &mgr->base.lock throughout the entire link probe
> process would have been _great_, since we could prevent userspace from
> ever seeing any states in-between individual port changes and as a
> result likely end up with a much faster probe and more consistent
> results from said probes. But without some rework of how we handle
> connector probing in sysfs it's not at all currently possible. In the
> future, maybe we can try using the sysfs locks to protect updates to
> connector probing state and fix this mess.
> =

> So for now, to protect everything other than port->connector under
> &mgr->base.lock and ensure that we still have the guarantee that atomic
> check/commit contexts will never see port->connector change we use a
> silly trick. See: port->connector only needs to change in order to
> ensure that input ports (see the MST spec) never have a ghost connector
> associated with them. But, there's nothing stopping us from simply
> throwing the entire port out and creating a new one in order to maintain
> that requirement while still keeping port->connector consistent across
> the lifetime of the port in atomic check/commit contexts. For all
> intended purposes this works fine, as we validate ports in any contexts
> we care about before using them and as such will end up reporting the
> connector as disconnected until it's port's destruction finalizes. So,
> we just do that in cases where we detect port->input has transitioned
> from true->false. We don't need to worry about the other direction,
> since a port without a connector isn't visible to userspace and as such
> doesn't need to be protected by &mgr->base.lock until we finish
> registering a connector for it.
> =

> For updating members of drm_dp_mst_port other than port->connector, we
> simply grab &mgr->base.lock in drm_dp_mst_link_probe_work() for already
> registered ports, update said members and drop the lock before
> potentially registering a connector and probing the link address of it's
> children.
> =

> Finally, we modify drm_dp_mst_detect_port() to take a modesetting lock
> acquisition context in order to acquire &mgr->base.lock under
> &connection_mutex and convert all it's users over to using the
> .detect_ctx probe hooks.
> =

> With that, we finally have well defined locking.
> =

> Changes since v4:
> * Get rid of port->mutex, stop using connection_mutex and just use our own
>   modesetting lock - mgr->base.lock. Also, add a probe_lock that comes
>   before this patch.
> * Just throw out ports that get changed from an output to an input, and
>   replace them with new ports. This lets us ensure that modesetting
>   contexts never see port->connector go from having a connector to being
>   NULL.
> * Write an extremely detailed explanation of what problems this is
>   trying to fix, since there's a _lot_ of context here and I honestly
>   forgot some of it myself a couple times.
> * Don't grab mgr->lock when reading port->mstb in
>   drm_dp_mst_handle_link_address_port(). It's not needed.
> =

> Cc: Juston Li <juston.li@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Overall makes sense to me. Thanks for the comprehensive commit message and
comments, they definitely help :)

Just one nit below,

Reviewed-by: Sean Paul <sean@poorly.run>


> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +--
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 230 ++++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  28 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  32 +--
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  24 +-
>  include/drm/drm_dp_mst_helper.h               |  38 ++-
>  6 files changed, 240 insertions(+), 140 deletions(-)
> =


/snip

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 11d842f0bff5..7bf4db91ff90 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c

/snip

> @@ -1912,35 +1984,40 @@ drm_dp_mst_handle_link_address_port(struct drm_dp=
_mst_branch *mstb,
>  {
>  	struct drm_dp_mst_topology_mgr *mgr =3D mstb->mgr;
>  	struct drm_dp_mst_port *port;
> -	bool created =3D false;
> -	int old_ddps =3D 0;
> +	int old_ddps =3D 0, ret;
> +	u8 new_pdt =3D DP_PEER_DEVICE_NONE;
> +	bool created =3D false, send_link_addr =3D false;
>  =

>  	port =3D drm_dp_get_port(mstb, port_msg->port_number);
>  	if (!port) {
> -		port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> +		port =3D drm_dp_mst_add_port(dev, mgr, mstb,
> +					   port_msg->port_number);
>  		if (!port)
>  			return;
> -		kref_init(&port->topology_kref);
> -		kref_init(&port->malloc_kref);
> -		port->parent =3D mstb;
> -		port->port_num =3D port_msg->port_number;
> -		port->mgr =3D mgr;
> -		port->aux.name =3D "DPMST";
> -		port->aux.dev =3D dev->dev;
> -		port->aux.is_remote =3D true;
> -
> -		/*
> -		 * Make sure the memory allocation for our parent branch stays
> -		 * around until our own memory allocation is released
> +		created =3D true;
> +	} else if (port_msg->input_port && !port->input && port->connector) {
> +		/* Destroying the connector is impossible in this context, so
> +		 * replace the port with a new one
>  		 */
> -		drm_dp_mst_get_mstb_malloc(mstb);
> +		drm_dp_mst_topology_unlink_port(mgr, port);
> +		drm_dp_mst_topology_put_port(port);
>  =

> +		port =3D drm_dp_mst_add_port(dev, mgr, mstb,
> +					   port_msg->port_number);
> +		if (!port)
> +			return;
>  		created =3D true;
>  	} else {
> +		/* Locking is only needed when the port has a connector
> +		 * exposed to userspace
> +		 */
> +		drm_modeset_lock(&mgr->base.lock, NULL);

Random musing: It's kind of unfortunate that we don't have a void varient of
drm_modeset_lock for when there's no acquire_ctx since we end up with a mix=
 of
drm_modeset_lock calls with and without return checking. =


/snip

> @@ -3441,22 +3516,31 @@ EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
>  /**
>   * drm_dp_mst_detect_port() - get connection status for an MST port
>   * @connector: DRM connector for this port
> + * @ctx: The acquisition context to use for grabbing locks
>   * @mgr: manager for this port
> - * @port: unverified pointer to a port
> + * @port: pointer to a port
>   *
> - * This returns the current connection state for a port. It validates the
> - * port pointer still exists so the caller doesn't require a reference
> + * This returns the current connection state for a port.

"On error, this returns -errno"

/snip

> -- =

> 2.21.0
> =


-- =

Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
