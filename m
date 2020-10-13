Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D472728CDBF
	for <lists+nouveau@lfdr.de>; Tue, 13 Oct 2020 14:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567F86E8D0;
	Tue, 13 Oct 2020 12:03:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516A46E8D0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602590584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ny1IKApUTmBUHnT9+0vR74KhYvi22exnEnzZ1oYBxhk=;
 b=jWaHTlDytIA4PsQPRaHNRcrbD0k6xxCiawZ4X7cp5TPP2meUzZLFhua8eHmqWJShX/6yrV
 6EmvJSll1mRWkHxppn3XstcEGvE1EahJU5MrD840kyx6k4ytVppPtVvR1+5GYE5nZz5ITI
 fKI2Ftj9THYCxhRuxabM5x/zlOHbtbo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-ARMoN6qbMiuU0neiU3100w-1; Tue, 13 Oct 2020 08:03:02 -0400
X-MC-Unique: ARMoN6qbMiuU0neiU3100w-1
Received: by mail-qv1-f72.google.com with SMTP id k6so12586926qvg.9
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 05:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ny1IKApUTmBUHnT9+0vR74KhYvi22exnEnzZ1oYBxhk=;
 b=LJMzOzNheltVic1xjT+aKhfRjamnhVhq+DRUkqbeER6ztV6SFnA5yKAR/XE/+FZBf7
 H69ghfRLxcBKbFBnyRW11IP62MiLYn4JaGRAUakoXplokIHIarrZ0XATa3AR5j3Orvte
 0cTo8dYdhVK5k5Mu+LGoby3ytP+n9L2IPPlH7MSLtZ7mWwPN5Q3KgUqPWF1t78TcQoDt
 KrMAAKsfLiofnDtgDhMUOs85Xz5DiEpKZMuI8JEGRKwp3PtTEYx2PHR968PYXmZSGtvD
 nrgqlcsHMCthosA1Fz+rxsn1VKsT6uz39Zn6UvLAEPI9OEHNPVNAklBWn/Fcp0rbDQ9P
 jVrw==
X-Gm-Message-State: AOAM532r+sjq3Nnvc0pFHFOVL8NtejMWwgT6ha96vYqhemF7/RVPPODm
 yWvrKPTA6io5hMHtx0QS/9janJ5UaHadfrTOQ2T2vD1Tj8BxBYzkxipw08tjORnWmunvDAScP50
 xSlTnhQgxvB7orsr78EnLIs2NTFqUid+qrH5D1X4GNA==
X-Received: by 2002:a05:620a:1f3:: with SMTP id
 x19mr14516840qkn.62.1602590581862; 
 Tue, 13 Oct 2020 05:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX3hygbIb/K+2WVe/xPw1GwLBae8X5UiW6eZeUcrWh0Anugd93+0qmTqiFN4vZH7EImmi7wtIcKPLvswG+OpQ=
X-Received: by 2002:a05:620a:1f3:: with SMTP id
 x19mr14516807qkn.62.1602590581518; 
 Tue, 13 Oct 2020 05:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120126.59411-1-kherbst@redhat.com>
In-Reply-To: <20201013120126.59411-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Oct 2020 14:02:50 +0200
Message-ID: <CACO55tufuidje-SRmfqjLi4bWMCszypqGVE9iZdVxi7NTpbFnQ@mail.gmail.com>
To: Ondrej Zary <linux@zary.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/device: fix changing endianess
 code to work on older GPUs
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ehh.. messed up sending it against the other thread, but mind testing
this patch and verify it fixes your issue? Thanks.

On Tue, Oct 13, 2020 at 2:01 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> With this we try to detect if the endianess switch works and assume LE if
> not. Suggested by Ben.
>
> Fixes: 51c05340e407 ("drm/nouveau/device: detect if changing endianness failed")
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 39 ++++++++++++-------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index dcb70677d0acc..7851bec5f0e5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2924,17 +2924,34 @@ nvkm_device_del(struct nvkm_device **pdevice)
>         }
>  }
>
> +/* returns true if the GPU is in the CPU native byte order */
>  static inline bool
>  nvkm_device_endianness(struct nvkm_device *device)
>  {
> -       u32 boot1 = nvkm_rd32(device, 0x000004) & 0x01000001;
>  #ifdef __BIG_ENDIAN
> -       if (!boot1)
> -               return false;
> +       const bool big_endian = true;
>  #else
> -       if (boot1)
> -               return false;
> +       const bool big_endian = false;
>  #endif
> +
> +       /* Read NV_PMC_BOOT_1, and assume non-functional endian switch if it
> +        * doesn't contain the expected values.
> +        */
> +       u32 pmc_boot_1 = nvkm_rd32(device, 0x000004);
> +       if (pmc_boot_1 && pmc_boot_1 != 0x01000001)
> +               return !big_endian; /* Assume GPU is LE in this case. */
> +
> +       /* 0 means LE and 0x01000001 means BE GPU. Condition is true when
> +        * GPU/CPU endianness don't match.
> +        */
> +       if (big_endian == !pmc_boot_1) {
> +               nvkm_wr32(device, 0x000004, 0x01000001);
> +               nvkm_rd32(device, 0x000000);
> +               if (nvkm_rd32(device, 0x000004) != (big_endian ? 0x01000001 : 0x00000000))
> +                       return !big_endian; /* Assume GPU is LE on any unexpected read-back. */
> +       }
> +
> +       /* CPU/GPU endianness should (hopefully) match. */
>         return true;
>  }
>
> @@ -2987,14 +3004,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>         if (detect) {
>                 /* switch mmio to cpu's native endianness */
>                 if (!nvkm_device_endianness(device)) {
> -                       nvkm_wr32(device, 0x000004, 0x01000001);
> -                       nvkm_rd32(device, 0x000000);
> -                       if (!nvkm_device_endianness(device)) {
> -                               nvdev_error(device,
> -                                           "GPU not supported on big-endian\n");
> -                               ret = -ENOSYS;
> -                               goto done;
> -                       }
> +                       nvdev_error(device,
> +                                   "Couldn't switch GPU to CPUs endianess\n");
> +                       ret = -ENOSYS;
> +                       goto done;
>                 }
>
>                 boot0 = nvkm_rd32(device, 0x000000);
> --
> 2.26.2
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
