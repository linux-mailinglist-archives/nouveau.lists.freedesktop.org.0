Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE93640DA
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ABE6E255;
	Mon, 19 Apr 2021 11:49:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE20C6E255
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nly+1DO6xtNI7xIJZQr0CwBL9odu8O2pnwWHw5PL2Fk=;
 b=IWbM7XCutl77mrKsg0+uKe3NGY5TOOuMIVvXC9gJ4O9rLyzr3P2MUEuOgCJaXWVE9pussH
 ZWF40qSqc9nK0Gei/G/rrmgO3/SvYfOZgc25HN3d6gbneh1J/i+BCca0Bir1ZdsZAUPeg/
 PzkVwZbjx/YDFdQQxyXQU+Ylxr5Bvx4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-ruJIii_GO0-oQsZP97FjcA-1; Mon, 19 Apr 2021 07:49:26 -0400
X-MC-Unique: ruJIii_GO0-oQsZP97FjcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v20-20020a5d59140000b02901028c7a1f7dso8922732wrd.18
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nly+1DO6xtNI7xIJZQr0CwBL9odu8O2pnwWHw5PL2Fk=;
 b=YxambT/PaibSFWrDKa3i/YF5BsmjP9ZhfR5bEu13lvNHoO8mXOO5eDPrCMLwTd13l0
 lg4eisezjcBPw0BGcFI7FnoJpWb+Vrgz4MVv8g5y/yPVAbgCRDCqMFTNbF3JFc3G9g/A
 MGsasVmz/rwSQ5TDvjUD6plJIeIBWH2heTXh3hrhFU02nkIvffKvwdxZrLspxkicZej9
 Fc1AOfPCwpbeiPOhv+I3lIawWuUJIID8kJrvC1clJjz5rn2VTQTHxvZ7uQ8ILuDgeBhV
 f8OZEfgP3Roit9r681JdVOSjGJH/6l175YnRRHXKyyBycEv2VD9vm4KtIe2w4c6/g+KJ
 LjgA==
X-Gm-Message-State: AOAM533VuvEGz+ZAKziIkK6SCPMEbSWnFqiSVxKQp1Ldy9N2QkB+COUU
 mgiSi4IpGWmapHq77v0DNEJyyy8VR89nWKcoOpbHCHPAmC7dgYuZRffn4Of2RlKHTQnlXuv9Pnq
 GK95ORxHV9nmmxUky732vUEJXwbfJ2wKaIzlCexEyDw==
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14503026wrc.113.1618832965218; 
 Mon, 19 Apr 2021 04:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo70JbUkSOXLnCMJ/q0c/kasxJbjovwmjfD+BmIDk5mqXW5hGpIhL7aPNl6r8rZpHGwg8WLg/vphWP4pcCf1U=
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14503007wrc.113.1618832965102; 
 Mon, 19 Apr 2021 04:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-17-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-17-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:49:14 +0200
Message-ID: <CACO55tsRq3dMrmw+msxnGf4e5=30m0R+XyAX4AMtgNrMNv284w@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 16/40] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> index 8ddf9b2325a42..2af3615c5205c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> @@ -38,7 +38,7 @@
>
>  #include "nouveau_ioctl.h"
>
> -/**
> +/*
>   * Called whenever a 32-bit process running under a 64-bit kernel
>   * performs an ioctl on /dev/dri/card<n>.
>   *
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
