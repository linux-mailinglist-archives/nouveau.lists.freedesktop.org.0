Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B417233B31
	for <lists+nouveau@lfdr.de>; Fri, 31 Jul 2020 00:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543966E4D0;
	Thu, 30 Jul 2020 22:19:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575AA6E4CF
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2020 22:19:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v12so209239ljc.10
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2020 15:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=STwaQ5Ntxsqp6QopFuNsUtbtwpBpMRacm9NK7jlSzDs=;
 b=BMlzv3WPfLQlK0qRWi0Uzt5hMl4vmln1jBZRjdpUk+TB5GTnnVQv3TQ0BDx7GNx74n
 vY1QafdI3+B47V6sJYg4MlL8z1xv/D8H/Ro+BJokbFpqcZvKNUHhgkTViIP5Sj6g04ac
 LNAY+BTu2+4uTtR24BL/au6vOi6h3BIelCQcCzPhkiQn5tzBW2ZpneSKeDD5j/d2jxd5
 ZWFF6QHf2PWuL0vFkTxb12Qsfhs69A+Ip3dHAphiThHY1jzIk7fJWb20QmdO4u8u2Fpb
 v722Oo4ii3oaqQ9SBLy/0ttEHBxBoRWUl0tjMYJLFPWxngKxYpWG2w9Bpzx3fkZUjFG2
 6Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=STwaQ5Ntxsqp6QopFuNsUtbtwpBpMRacm9NK7jlSzDs=;
 b=sHdqX3LWZWVaVjD/I1osdTY55x8Vw+CKDPy8kN/GVUT+K3sEVKGRV6BPREiqMUKFQx
 TRjHBo7XopHYxrv0zWDaANqFj/kilZXs4w06MMVQqxbSYwQl043ZROKG/fJqA5EmWSFb
 zYm1n+zFcfk6ffcVWBolbdqMsvn1xzQDrCiqRVU647oAsmwgXzsy7qlahBVRdG/9d/Wr
 qQ0AxuLtn9fbf2bG0MYej9iSTLuLVa9AT4o84CBA64Dfr4DL8yzDdnbPhztOFyizsDAm
 dud7SMsz8SQpySFOLfnmyVbsv8IgWQhzgPAwP09bmZVd6cxwNFYhkOnt66rE2RPXUC9x
 tsFg==
X-Gm-Message-State: AOAM533opyGuC7XEReJkxJHFgjiiff1PUXvjGGsC45BWmb43XdSkI5O8
 VzL9iVGa49tT9XSDFCWs8RxOEg==
X-Google-Smtp-Source: ABdhPJwwh8VRiV1Iw4Di5s5loy/Yk1hZar+Rf/448yHssNkobl2yrf2gztJQLwI8N40LTl7kLR8lJA==
X-Received: by 2002:a2e:7d0b:: with SMTP id y11mr559809ljc.134.1596147574606; 
 Thu, 30 Jul 2020 15:19:34 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id h5sm1473132lfm.70.2020.07.30.15.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 15:19:32 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 9C04E1021DB; Fri, 31 Jul 2020 01:19:37 +0300 (+03)
Date: Fri, 31 Jul 2020 01:19:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: James Jones <jajones@nvidia.com>
Message-ID: <20200730221937.kcy7synseuedn6qf@box>
References: <20200730172617.4158-1-jajones@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730172617.4158-1-jajones@nvidia.com>
Subject: Re: [Nouveau] [PATCH v3] drm/nouveau: Accept 'legacy' format
 modifiers
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 10:26:17AM -0700, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers. Existing Mesa
> drivers are still aware of only these older
> format modifiers which do not differentiate
> between different variations of the block linear
> layout. When the format modifier support flag was
> flipped in the nouveau kernel driver, the X.org
> modesetting driver began attempting to use its
> format modifier-enabled framebuffer path. Because
> the set of format modifiers advertised by the
> kernel prior to this change do not intersect with
> the set of format modifiers advertised by Mesa,
> allocating GBM buffers using format modifiers
> fails and the modesetting driver falls back to
> non-modifier allocation. However, it still later
> queries the modifier of the GBM buffer when
> creating its DRM-KMS framebuffer object, receives
> the old-format modifier from Mesa, and attempts
> to create a framebuffer with it. Since the kernel
> is still not aware of these formats, this fails.
> 
> Userspace should not be attempting to query format
> modifiers of GBM buffers allocated with a non-
> format-modifier-aware allocation path, but to
> avoid breaking existing userspace behavior, this
> change accepts the old-style format modifiers when
> creating framebuffers and applying them to planes
> by translating them to the equivalent new-style
> modifier. To accomplish this, some layout
> parameters must be assumed to match properties of
> the device targeted by the relevant ioctls. To
> avoid perpetuating misuse of the old-style
> modifiers, this change does not advertise support
> for them. Doing so would imply compatibility
> between devices with incompatible memory layouts.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> kmscube hacked to use linear mod, and sway 1.5
> 
> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> Link: https://lkml.org/lkml/2020/6/30/1251
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>  		   uint32_t *tile_mode,
>  		   uint8_t *kind)
>  {
> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>  	BUG_ON(!tile_mode || !kind);
>  
> +	if ((modifier & (0xffull << 12)) == 0ull) {
> +		/* Legacy modifier.  Translate to this device's 'kind.' */
> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +	}
> +
>  	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>  		/* tile_mode will not be used in this case */
>  		*tile_mode = 0;

Em. I thought Ben's suggestion was to move it under != MOD_LINEAR. I don't
see it here.


-- 
 Kirill A. Shutemov
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
