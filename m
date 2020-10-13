Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C897328CF96
	for <lists+nouveau@lfdr.de>; Tue, 13 Oct 2020 15:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407A06E123;
	Tue, 13 Oct 2020 13:55:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED636E123
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 13:55:03 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id v23so24388vsp.6
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLUCdlOd7CVCwsSkeZ62CisRSRKajEtaY56t9XPqXtQ=;
 b=SuGd1E8DzFEFIh2cA1fZUri/5SuKZ6fgRCgsWSBcYOxBInLlTOLdi82g/hKOB0RHQa
 Xwvc479fxNwzbJl+0vPU/0oKW9iGNlvsIRcygOP98iBKVV+da3erL4HiPOkFxsSQ81OZ
 UnulUnWyfB1e828Eax1x2VkKhxTD0Id9r2ZC6PkGvXUCpc3OLaThoYrYATNp6tsDK3Ko
 0ubNWHizsSObAAYmpQ7zIbu+GU7Rad8dH6/GA7V6hzfbaXpXzP920MQD6aEW5lMKFmoo
 GUUkbg5jS47I3Ur9+KKbA4zlJdBjfJk6yyqA58DD9fVYRT/mNF4mXHjKiH9u1dty03zM
 2jxw==
X-Gm-Message-State: AOAM5320VrV7zauxxiVA51u20ZObYj+Z/+xlxh2zCX+ZxPSDdy67adr2
 zPrWwheTlYYVR7/npHR8mMX3vx7DmJVH8R8DMgBWZQEP
X-Google-Smtp-Source: ABdhPJypMO8zWFA9JuoBkzYKf20UaCPySYm6vuL4H+v6Kft/jWtdVuTh9CbGOn7UBO0x1BFegE8mjrmdstE1up9W7ho=
X-Received: by 2002:a05:6102:82e:: with SMTP id k14mr68429vsb.0.1602597302797; 
 Tue, 13 Oct 2020 06:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120126.59411-1-kherbst@redhat.com>
In-Reply-To: <20201013120126.59411-1-kherbst@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 13 Oct 2020 09:54:51 -0400
Message-ID: <CAKb7UviY1aYvvCk_yK6eHfvR322XG3b_Aq60XcGb0NUNBAw7Gw@mail.gmail.com>
To: 202010101049.37663.linux@zary.sk
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ondrej Zary <linux@zary.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 8:01 AM Karol Herbst <kherbst@redhat.com> wrote:
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

Are you sure there are no other bits in there, esp on newer GPUs?

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
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
