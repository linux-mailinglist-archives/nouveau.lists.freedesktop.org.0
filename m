Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0361BEEF0
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 06:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B2E6E9E4;
	Thu, 30 Apr 2020 04:10:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB146E9E4
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 04:10:55 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id l5so2485296ybf.5
 for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2020 21:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KyINCIXNTiNmKvn3ipDxi04WHH7QcFk6SIExmgQ0bmg=;
 b=C85z+8P5Xqkoc9OsL/kDc5RuSg/VUhLPASSFzv39zLLJN/GPcx86Mut+zZ8msyH1yV
 cFreBCEXj7nBeOJl0SRe52x9f/z/RME+6Ygd6KpR3430NrHSh3HFpVjBzsUEu4XoPD6u
 /3mhu5wpTVsuCCGj8t3h+YJhJn0ww0uvxz/EYItanGsD0IaJULpgyK303UNb3xpepI5H
 75cIfsfORD7DPqXQozNQbskNznIivO7jdNS2i8+WAuwjpIH5uFq6JQux2zD7EjlOZBe8
 lX2tSqR8eb//EVm7fNPAJPf5iWGjxzQtKT4vYZILaL0aNvOqtdJV0hUQ4yjvwg7LSz5x
 A61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyINCIXNTiNmKvn3ipDxi04WHH7QcFk6SIExmgQ0bmg=;
 b=lIcisy8X2/xAe3IpfYNRycPr8fOq4bUVBoO/SVPPRsemtumtW1KXk9yjanl9xXOurE
 ft8TkLzulXuNdBpq5j9F/BXTkPbCF5Py23QcOs1OxC/YNvhKdUF49RGKD8ePAXesqKCA
 jS3dz7U6wcifI3ctsdue0t0/hufq58FfegKIo7FDtjbYcP3O504G+i7Lce5/jVHodFYZ
 voGOOIcKE4hDHJ2bfyOYogOtOJhP56oh14UC1XLKb9/wMYurXMM/TWROAr0Zr9m4hT9k
 uvx4TgqPMe7oBj6vj+gnqgNq4SgZ96jvLkngLnPd26u6uMusyI71ZAUlwhF7TS2u7wDX
 DOLw==
X-Gm-Message-State: AGi0Pua6xst39YocXDRE6jxGnKsSW59gfZTWTZCx9OmfolidQr8f4RCl
 7SHSwTgpCKWcbfAX36j2DKbyiu06x31LQxTUR30=
X-Google-Smtp-Source: APiQypK5HWAbv8YSv55B6Lv+iHZkVuGMh37qq46xz/J5pkAbEbnm0B7xbIsVK5I2a8fHfZt1Q464PknTFZy/qLoTI7o=
X-Received: by 2002:a25:5381:: with SMTP id h123mr2608287ybb.470.1588219854391; 
 Wed, 29 Apr 2020 21:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200428165404.936235-1-kherbst@redhat.com>
In-Reply-To: <20200428165404.936235-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 30 Apr 2020 14:10:43 +1000
Message-ID: <CACAvsv5ZPB53bm6nhmDioT05jW-8EeVzbP3jDiR_uQ5+8g5Y2Q@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH v3 1/3] device: rework mmio mapping code to
 get rid of second map
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Merged all 3 patches.  Thanks!

On Wed, 29 Apr 2020 at 02:55, Karol Herbst <kherbst@redhat.com> wrote:
>
> Fixes warnings on GPUs with smaller a smaller mmio region like vGPUs.
>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drm/nouveau/nvkm/engine/device/base.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> index 8ebbe1656..37589f365 100644
> --- a/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drm/nouveau/nvkm/engine/device/base.c
> @@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>         struct nvkm_subdev *subdev;
>         u64 mmio_base, mmio_size;
>         u32 boot0, strap;
> -       void __iomem *map;
> +       void __iomem *map = NULL;
>         int ret = -EEXIST, i;
>         unsigned chipset;
>
> @@ -2961,12 +2961,17 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>         mmio_base = device->func->resource_addr(device, 0);
>         mmio_size = device->func->resource_size(device, 0);
>
> -       /* identify the chipset, and determine classes of subdev/engines */
> -       if (detect) {
> -               map = ioremap(mmio_base, 0x102000);
> -               if (ret = -ENOMEM, map == NULL)
> +       if (detect || mmio) {
> +               map = ioremap(mmio_base, mmio_size);
> +               if (map == NULL) {
> +                       nvdev_error(device, "unable to map PRI\n");
> +                       ret = -ENOMEM;
>                         goto done;
> +               }
> +       }
>
> +       /* identify the chipset, and determine classes of subdev/engines */
> +       if (detect) {
>                 /* switch mmio to cpu's native endianness */
>  #ifndef __BIG_ENDIAN
>                 if (ioread32_native(map + 0x000004) != 0x00000000) {
> @@ -2980,7 +2985,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 /* read boot0 and strapping information */
>                 boot0 = ioread32_native(map + 0x000000);
>                 strap = ioread32_native(map + 0x101000);
> -               iounmap(map);
>
>                 /* chipset can be overridden for devel/testing purposes */
>                 chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
> @@ -3159,12 +3163,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 device->name = device->chip->name;
>
>         if (mmio) {
> -               device->pri = ioremap(mmio_base, mmio_size);
> -               if (!device->pri) {
> -                       nvdev_error(device, "unable to map PRI\n");
> -                       ret = -ENOMEM;
> -                       goto done;
> -               }
> +               device->pri = map;
>         }
>
>         mutex_init(&device->mutex);
> @@ -3254,6 +3253,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>
>         ret = 0;
>  done:
> +       if (map && (!mmio || ret)) {
> +               device->pri = NULL;
> +               iounmap(map);
> +       }
>         mutex_unlock(&nv_devices_mutex);
>         return ret;
>  }
> --
> 2.25.3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
