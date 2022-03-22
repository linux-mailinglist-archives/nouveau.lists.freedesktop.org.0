Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690C4E45EB
	for <lists+nouveau@lfdr.de>; Tue, 22 Mar 2022 19:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF4310E0AD;
	Tue, 22 Mar 2022 18:25:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9A10E0AD
 for <nouveau@lists.freedesktop.org>; Tue, 22 Mar 2022 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647973527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXgow+Fz8VabLqwfX1YnqBgMgAP8Ti50IVG/j8LoHic=;
 b=IuV/wIVN70hk/ql4WzWrrM11mjj8ZKkgjsRcu+C5TLjWehVyfVZUxLmLapNWpL7yPl4U2b
 WKVODo31YOOTNbypeuWRZO1sOcUteV2wec+SNuvy2o9uVVZ01OZAPuFmiMTGtkLOJc5atN
 uuE1V6tGYbtS/E/uHDyu/A4J2jWwavI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-lTA_P4y4O4a8Ckm46qaAIA-1; Tue, 22 Mar 2022 14:25:26 -0400
X-MC-Unique: lTA_P4y4O4a8Ckm46qaAIA-1
Received: by mail-qv1-f70.google.com with SMTP id
 d11-20020a0cffab000000b00440f965f77cso10312842qvv.4
 for <nouveau@lists.freedesktop.org>; Tue, 22 Mar 2022 11:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rXgow+Fz8VabLqwfX1YnqBgMgAP8Ti50IVG/j8LoHic=;
 b=1YXCeNDgEZRLExzcZm5ZdkmMBKTPEkyGk4j5U0CpTlUKzIX/kJZN4KKqQ+qV3BFGnh
 NNRA98be7gDdxZh8NlLqkE9j9TIwcUtPvGDDDcIaFIwAzxrFlWQDWubsywykKGj8rHbL
 SbWwcd3gqEGNxukP5QWSXXxgvWrIw7/B9KTPdRcb/JP2Flgm+I5Ly+CPWAJPwy0YY4gY
 qZm2xYvrFzkfk1L7arQ3ihSkkIhB2n/C6CBTKfdj+JO/bBAvfJWTGuFAuQPAJeqFh+Xa
 PV+rqgXE2NM5DzSldtYBJxBCK2cp1yrS5+XlEehCYspcWi9SI9XvHiemu3A35BVm/rih
 C68w==
X-Gm-Message-State: AOAM5318P9dEULjt+iLOO3lGQhkfLnBl74i8WxsDqKyKZiWspoa2Q+N/
 kpnN6Qebm87ot20r+A9gM+3yiuBm2boNjusEw5OXitvn17zfcoZkhCFkx66fLxUyG3QcyBZ4AMV
 n5INanjwT7ZUZbfCPoqLrYBSKIg==
X-Received: by 2002:a05:6214:29ef:b0:441:4a7a:4c9e with SMTP id
 jv15-20020a05621429ef00b004414a7a4c9emr2654881qvb.119.1647973525204; 
 Tue, 22 Mar 2022 11:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6T8sOKqIqpt6ZuCZug9+YoVTnq3+e/xMkvpjYvSkbwVcTedcsYTtRt1S+tnn4xKVvozA1LQ==
X-Received: by 2002:a05:6214:29ef:b0:441:4a7a:4c9e with SMTP id
 jv15-20020a05621429ef00b004414a7a4c9emr2654861qvb.119.1647973524924; 
 Tue, 22 Mar 2022 11:25:24 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 i7-20020ac85e47000000b002e22bad4717sm525995qtx.1.2022.03.22.11.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:25:24 -0700 (PDT)
Message-ID: <f6e72c6e6d9ae9019ad675081493372f745cbbf5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Mar 2022 14:25:22 -0400
In-Reply-To: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
References: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau/bios: Rename prom_init() and
 friends functions
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next

On Sat, 2022-03-19 at 11:27 +0100, Christophe Leroy wrote:
> While working at fixing powerpc headers, I ended up with the
> following error.
> 
>         drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1: error:
> conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *, const
> char *)'
>         make[5]: *** [scripts/Makefile.build:288:
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
> 
> powerpc and a few other architectures have a prom_init() global function.
> One day or another it will conflict with the one in shadowrom.c
> 
> Those being static, they can easily be renamed. Do it.
> 
> While at it, also rename the ops structure as 'nvbios_prom' instead of
> 'nvbios_rom' in order to make it clear that it refers to the
> NV_PROM device.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: using nvbios_prom prefix instead of nvbios_rom. Changed structure name
> to keep things consistant.
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |  2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   | 14 +++++++-------
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> index fac1bff1311b..cfa8a0c356dd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
> @@ -19,7 +19,7 @@ struct nvbios_source {
>  int nvbios_extend(struct nvkm_bios *, u32 length);
>  int nvbios_shadow(struct nvkm_bios *);
>  
> -extern const struct nvbios_source nvbios_rom;
> +extern const struct nvbios_source nvbios_prom;
>  extern const struct nvbios_source nvbios_ramin;
>  extern const struct nvbios_source nvbios_acpi_fast;
>  extern const struct nvbios_source nvbios_acpi_slow;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> index 4b571cc6bc70..19188683c8fc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> @@ -171,7 +171,7 @@ nvbios_shadow(struct nvkm_bios *bios)
>         struct shadow mthds[] = {
>                 { 0, &nvbios_of },
>                 { 0, &nvbios_ramin },
> -               { 0, &nvbios_rom },
> +               { 0, &nvbios_prom },
>                 { 0, &nvbios_acpi_fast },
>                 { 4, &nvbios_acpi_slow },
>                 { 1, &nvbios_pcirom },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> index ffa4b395220a..39144ceb117b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> @@ -25,7 +25,7 @@
>  #include <subdev/pci.h>
>  
>  static u32
> -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> +nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios
> *bios)
>  {
>         struct nvkm_device *device = data;
>         u32 i;
> @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct
> nvkm_bios *bios)
>  }
>  
>  static void
> -prom_fini(void *data)
> +nvbios_prom_fini(void *data)
>  {
>         struct nvkm_device *device = data;
>         nvkm_pci_rom_shadow(device->pci, true);
>  }
>  
>  static void *
> -prom_init(struct nvkm_bios *bios, const char *name)
> +nvbios_prom_init(struct nvkm_bios *bios, const char *name)
>  {
>         struct nvkm_device *device = bios->subdev.device;
>         if (device->card_type == NV_40 && device->chipset >= 0x4c)
> @@ -55,10 +55,10 @@ prom_init(struct nvkm_bios *bios, const char *name)
>  }
>  
>  const struct nvbios_source
> -nvbios_rom = {
> +nvbios_prom = {
>         .name = "PROM",
> -       .init = prom_init,
> -       .fini = prom_fini,
> -       .read = prom_read,
> +       .init = nvbios_prom_init,
> +       .fini = nvbios_prom_fini,
> +       .read = nvbios_prom_read,
>         .rw = false,
>  };

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

