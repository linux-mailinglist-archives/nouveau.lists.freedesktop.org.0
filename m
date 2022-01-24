Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB424985D4
	for <lists+nouveau@lfdr.de>; Mon, 24 Jan 2022 18:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B06F10E394;
	Mon, 24 Jan 2022 17:06:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1DE10E385
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643043997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UErGN2T0IhE+6OhawTY+/XFQm12Pkh6aUTIrM8GlvyY=;
 b=PF9q4lvsT2AM4TTFUbaytnw6GHJS7XtSUutiBhHesHYK/MiSC61O4q5+w937uZjxiOBhsk
 WkV+/l3AZpfliZR+0A3hYjjixvqxou1f3KkhbJTl5FMU3tjNGuvbGW8+YJsxLMu09jE2Ke
 h/fxMd3PV1g/I+HNasEi1RqZ1ZP+ePw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-cfK3-sZHOMGUW0OJKPst1Q-1; Mon, 24 Jan 2022 12:06:36 -0500
X-MC-Unique: cfK3-sZHOMGUW0OJKPst1Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so2136827wrg.8
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 09:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UErGN2T0IhE+6OhawTY+/XFQm12Pkh6aUTIrM8GlvyY=;
 b=uB8amo0Fv99Ig/wiQzA1zFoEHTNuzxMGpul3RlgSvSzL6h3k2HgYXUP1dJego86P9c
 SFI3BlLH9ENSPxjUYN4wSIEu+15IFhrp+RyMannlvx1w/UT3x4TEUOMa4ZxkWWzjaOJn
 01YP95MxUYDHo88xRvtxILLQtJh5Srbau/bcFqg+A/JTJr0FMAB1ExT7qReS2OucoXKg
 IBkK4JQd3zD6pU0qQcGtAHybZNdum+j8vqoA/Sqgxg4feSNmGGtV77lGRr1KUENSXShe
 WAB8C6UZ6jtP41vzkLEMSadUDhcnnRUyf2lI+Mt4VghQeNHWzcCVRZFUfKnVzaaE+kga
 gPRQ==
X-Gm-Message-State: AOAM532BQpmThGBsS0etpdPv2TNCnqasp9/2offGf3q9g3C9lM0/M7J6
 1ay+7xJ6j6wI9e1tW8TVEAt+lSHGJ0n0N9ZVp8j6VRLqbS0BgNBTjjnjovhMvyvnZZBvEyoScvy
 HAKAttkBNccWMGASH13kmPf5OvbyhRPKiV2Zv+ObxDg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr2611279wmj.74.1643043994619; 
 Mon, 24 Jan 2022 09:06:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT7CfJ63GZsHay5dLvTT5HRfgE2bs1/YXBmB4qhn6Hh7jRm2+hTv8xtS0EyMSkutgb5mMRV/U1cokQPOQC5cA=
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr2611264wmj.74.1643043994378; 
 Mon, 24 Jan 2022 09:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20220122081906.2633061-1-github@glowingmonkey.org>
In-Reply-To: <20220122081906.2633061-1-github@glowingmonkey.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 24 Jan 2022 18:06:23 +0100
Message-ID: <CACO55tvQrOeF4oXLa2kCKv_Sz5JmEgeQjoPe5MNPB=FToGj_zA@mail.gmail.com>
To: Nick Lopez <github@glowingmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix off by one in BIOS boundry
 checking
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jan 22, 2022 at 11:44 AM Nick Lopez <github@glowingmonkey.org> wrote:
>
> Bounds checking when parsing init scripts embedded in the BIOS reject
> access to the last byte. This causes driver initialization to fail on
> Apple eMac's with GeForce 2 MX GPUs, leaving the system with no working
> console.
>
> This is probably only seen on OpenFirmware machines like PowerPC Macs
> because the BIOS image provides by OF is only the used parts of the ROM,
> not a power-of-two blocks read from PCI directly so PCs always have
> empty bytes at the end that are never accesseed.
>

small typo nitpicks: provided and accessed

Also, I think it makes sense to add

Fixes: 4d4e9907ff572 "drm/nouveau/bios: guard against out-of-bounds
accesses to image"
Cc: <stable@vger.kernel.org> # v4.10+

so it gets automatically backported to applicable stable kernels

Anyway, whoever picks the patch can make those adjustments as well.

Reviewed-by: Karol Herbst <kherbst@redhat.com>


> Signed-off-by: Nick Lopez <github@glowingmonkey.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> index d0f52d59fc2f..64e423dddd9e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> @@ -38,7 +38,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
>                 *addr += bios->imaged_addr;
>         }
>
> -       if (unlikely(*addr + size >= bios->size)) {
> +       if (unlikely(*addr + size > bios->size)) {
>                 nvkm_error(&bios->subdev, "OOB %d %08x %08x\n", size, p, *addr);
>                 return false;
>         }
> --
> 2.30.2
>

