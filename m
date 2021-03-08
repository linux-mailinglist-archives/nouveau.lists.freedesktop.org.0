Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BC331E16
	for <lists+nouveau@lfdr.de>; Tue,  9 Mar 2021 05:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2116E461;
	Tue,  9 Mar 2021 04:53:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150CF6E199
 for <nouveau@lists.freedesktop.org>; Mon,  8 Mar 2021 16:50:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so8254722wma.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Mar 2021 08:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=csdGRTC/fqgxsx3MqD2CY30jxKKY88IrwPuEZV8x6Ik=;
 b=DX98jyr5QLOmJ8E7yGn6bjv/PpieA9Cosj5ziznlKkeYgIlkJgCfrI0YrEgh0j8I6/
 twMC2UTSK3Z1ow3Kg345iexCRbOdFO2B/f8UzcxqaaKGs4kLepGlpue2mnXWMo5u89GI
 PKatd4km02S4zeQap6wAKbamucP7/ijFuuZGdlCDH4hzu8xcLT6nXY0yGS06xYW9QUOq
 7YRR+PERcI7f3pfmIEdEvU9zTB9TdYviHHQFYUId/RdzTCs0T5t29AdLqQWFQ1TyqbwT
 zJ43clxhaQ9Od+geafT84c4b1f+5fT395Ovnee2HEqyyO2cHO6waLoXu1/b/NjhC1NwJ
 iGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=csdGRTC/fqgxsx3MqD2CY30jxKKY88IrwPuEZV8x6Ik=;
 b=l+8RQJXdYdDxbE7NZursWldKngXTRj1lkqg/t7tBMqaE8FxQVj+C/+HUaEECMUOVcy
 5+elduau1PC9mLdboJl/zzohR/qmhNCbjhIREUYEQ2UgMgtgN0OgGibSoGyXNGF20B6R
 zaQWUQnfsoWsyE3GqJr7KFDe9IysfeWdrRVPFlRRFu14zLGlU9BXFMXyRXqLKcO/etV+
 pqLaOtax1sul0Pp2lKxN3+plol6dX0j0GAGwBrjPVxFMrD6FD596rvoWQazFjvi361aK
 2U6bjTD8e61kSVe7A5OAaYndjLD623lUw1AzpOlfH8Zg5IXr2RWxE9XGCjgNy0mR2O49
 1WYA==
X-Gm-Message-State: AOAM533vJSx9G6k0kL90fcQKv3UdfEeIRjdOIdBVydZ88JUtJVVSNvnH
 WqQo82CuimVkV/CTyre51nrO3A==
X-Google-Smtp-Source: ABdhPJwiGAFh2Sq055ZPR+B0t2Vb4lvtPttu/FfPEwa5HdoRsCuHmy/uMDSJ943qk0DgZb+bSLnPhg==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr22868798wmk.101.1615222252666; 
 Mon, 08 Mar 2021 08:50:52 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b15sm20536789wmd.41.2021.03.08.08.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 08:50:52 -0800 (PST)
Date: Mon, 8 Mar 2021 16:50:50 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20210308165050.qhhf5aqdcldet5p6@maple.lan>
References: <20210305015242.740590-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305015242.740590-1-lyude@redhat.com>
X-Mailman-Approved-At: Tue, 09 Mar 2021 04:53:12 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nve4-nv108: Limit cursors to
 128x128
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 04, 2021 at 08:52:41PM -0500, Lyude Paul wrote:
> While Kepler does technically support 256x256 cursors, it turns out that
> Kepler actually has some additional requirements for scanout surfaces that
> we're not enforcing correctly, which aren't present on Maxwell and later.
> Cursor surfaces must always use small pages (4K), and overlay surfaces must
> always use large pages (128K).
> 
> Fixing this correctly though will take a bit more work: as we'll need to
> add some code in prepare_fb() to move cursor FBs in large pages to small
> pages, and vice-versa for overlay FBs. So until we have the time to do
> that, just limit cursor surfaces to 128x128 - a size small enough to always
> default to small pages.
> 
> This means small ovlys are still broken on Kepler, but it is extremely
> unlikely anyone cares about those anyway :).
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: d3b2f0f7921c ("drm/nouveau/kms/nv50-: Report max cursor size to userspace")
> Cc: <stable@vger.kernel.org> # v5.11+

I was experiencing problems with the mouse cursor on my system in v5.11
and after a bisect to help me search the web I found my way to this
patch, which fixed the problem for me.

Mine is an Armv8 system but there is nothing particularly exotic from a
graphics card or software point of view: Debian bullseye/wayland
(gnome-shell 3.38.3, mesa-20.3.4) running on a GT-710.

However FWIW:
Tested-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 196612addfd6..1c9c0cdf85db 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2693,9 +2693,20 @@ nv50_display_create(struct drm_device *dev)
>  	else
>  		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>  
> -	if (disp->disp->object.oclass >= GK104_DISP) {
> +	/* FIXME: 256x256 cursors are supported on Kepler, however unlike Maxwell and later
> +	 * generations Kepler requires that we use small pages (4K) for cursor scanout surfaces. The
> +	 * proper fix for this is to teach nouveau to migrate fbs being used for the cursor plane to
> +	 * small page allocations in prepare_fb(). When this is implemented, we should also force
> +	 * large pages (128K) for ovly fbs in order to fix Kepler ovlys.
> +	 * But until then, just limit cursors to 128x128 - which is small enough to avoid ever using
> +	 * large pages.
> +	 */
> +	if (disp->disp->object.oclass >= GM107_DISP) {
>  		dev->mode_config.cursor_width = 256;
>  		dev->mode_config.cursor_height = 256;
> +	} else if (disp->disp->object.oclass >= GK104_DISP) {
> +		dev->mode_config.cursor_width = 128;
> +		dev->mode_config.cursor_height = 128;
>  	} else {
>  		dev->mode_config.cursor_width = 64;
>  		dev->mode_config.cursor_height = 64;
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
