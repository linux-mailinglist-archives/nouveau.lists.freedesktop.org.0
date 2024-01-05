Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2182EE5E
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9810E500;
	Tue, 16 Jan 2024 11:47:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jan 2024 21:19:04 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DF010E6AA;
 Fri,  5 Jan 2024 21:19:04 +0000 (UTC)
Received: from [192.168.1.114] (unknown [185.145.125.130])
 by mail.ispras.ru (Postfix) with ESMTPSA id A64A440F1DF8;
 Fri,  5 Jan 2024 21:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A64A440F1DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1704489208;
 bh=FlEa4522VZdZ1YxHNtrr3RlZjAu47jub/SKcUbhgne0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=elURLvWM2R+W2sXvbnDz4yjHrY16N8IpFq79W7EMGRzvJoEc8dMrCRctSn9sjd0+U
 /woxhCucAlP8rtdCMojyX0PLD0O7WYXL1/+YZoyTSc244W6+kLdA4+9UngmQis0J9r
 3gDjd+wITq/RuM4RGxvSF+N+t0Nj6UZ/ClSeD2HE=
Subject: Re: [PATCH] tvnv17.c: Adding a NULL pointer check.
To: Andrey Shumilin <shum.sdl@nppct.ru>, Karol Herbst <kherbst@redhat.com>
References: <20231116065159.37876-1-shum.sdl@nppct.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Message-ID: <5609ce98-9bbb-29f4-0c4c-a4d3654152f7@ispras.ru>
Date: Fri, 5 Jan 2024 21:33:07 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20231116065159.37876-1-shum.sdl@nppct.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> Subject: tvnv17.c: Adding a NULL pointer check.

As

$ git log --oneline drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
874ee2d67fc9 drm/nouveau: Remove unnecessary include statements for
drm_crtc_helper.h
80ed86d4b6d7 drm/connector: Rename drm_mode_create_tv_properties
1fd4a5a36f9f drm/connector: Rename legacy TV property
09838c4efe9a drm/nouveau/kms: Search for encoders' connectors properly
2574c809d7c0 drm/nouveau/kms/nv04-nv4x: Use match_string() helper to
simplify the code
...

shows, a better prefix should be
drm/nouveau:
and there should not be a dot at the end.

e.g.
drm/nouveau: Avoid NPE in nv17_tv_get_XX_modes()

On 16.11.2023 09:51, Andrey Shumilin wrote:
> It is possible to dereference a null pointer if drm_mode_duplicate() returns NULL.

I would suggest to add a little bit more details:

drm_mode_duplicate() may return NULL in case of error, e.g. if memory
allocation fails. It leads to NULL pointer dereference in
nv17_tv_get_ld_modes() and nv17_tv_get_hd_modes(), since they do not
check if drm_mode_duplicate() succeeds.

Otherwise, looks good.

Reviewed-by: Alexey Khoroshilov <khoroshilov@ispras.ru>


> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..1f0c5f4a5fd2 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -209,7 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
>  		struct drm_display_mode *mode;
>  
>  		mode = drm_mode_duplicate(encoder->dev, tv_mode);
> -
> +		if (mode == NULL)
> +			continue;
>  		mode->clock = tv_norm->tv_enc_mode.vrefresh *
>  			mode->htotal / 1000 *
>  			mode->vtotal / 1000;
> @@ -258,6 +259,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
>  		if (modes[i].hdisplay == output_mode->hdisplay &&
>  		    modes[i].vdisplay == output_mode->vdisplay) {
>  			mode = drm_mode_duplicate(encoder->dev, output_mode);
> +			if (mode == NULL)
> +				continue;
>  			mode->type |= DRM_MODE_TYPE_PREFERRED;
>  
>  		} else {
> 

