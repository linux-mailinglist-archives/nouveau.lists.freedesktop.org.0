Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA764CDDCF
	for <lists+nouveau@lfdr.de>; Fri,  4 Mar 2022 21:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6C113756;
	Fri,  4 Mar 2022 20:24:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF0113754
 for <nouveau@lists.freedesktop.org>; Fri,  4 Mar 2022 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646425480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQnecUCi6JtX5H2+Imm8lSOq7dsr4zLE9x/tjqn4RLU=;
 b=OVvzavNVbTmMoXp+qApyQjyScbw39LnNGoBQgvHvWOWaSD4J2D1YCxuMfORKn8pvLc57Em
 6hxSfhwYCVjFbVBfI+UqETVPZSCm9KAxUB6GEctLP0sh04LWYg6sE/vLaxizhJU0D4r1l8
 LUh7fZHejZ+IO50NhMzssRzOvT2iq7s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-aZnbIL5-PUO6njPNGOkl1Q-1; Fri, 04 Mar 2022 15:24:39 -0500
X-MC-Unique: aZnbIL5-PUO6njPNGOkl1Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 g11-20020ac842cb000000b002dd2c58affaso6970288qtm.12
 for <nouveau@lists.freedesktop.org>; Fri, 04 Mar 2022 12:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qQnecUCi6JtX5H2+Imm8lSOq7dsr4zLE9x/tjqn4RLU=;
 b=5AU7m4e1WlVLdmnbSE+mxY/eWuOixOxLYu6tA2J350Chd/Au1R9DbfsPgPv/n+SQxi
 lZnE29RRcsFuWcu2CAMPudbylLeqtaD61UwDZOaqERkzb6pQbdcME2YXpUjjkOx3EqMb
 dM1ov0UUdRzBsTdkeeSTxTdGSKKnXdndXSCpGIeUR04Xy8UW2HLKPt1DPGDudd65X9mm
 guaU09N1sGkDeIL1rMjBV37KS0Ji1AjC57PD/x9EAHNebdnkRe+2yy14dWDUFL0PLqbI
 FBYc/9704T2aX/hwi7T3aut1PUl0YJehalts097OAWCIXZppwcmAJVZNNv8NSgcqKAF/
 3ZHg==
X-Gm-Message-State: AOAM531nNJs6JcUx881ue86lZiGr8TAvwTdkI8rlgk+8/tZZZFi7wE1+
 3hUoug2Vxa8sxZWjSEPppMqvaxbE5WpCNNb3hELLM0FJzg6E0TMttOpYTxRpY5EMietocDVC74v
 emzMQAEsGU5sXwm0v85dCPCP4cw==
X-Received: by 2002:a37:492:0:b0:47d:e1d1:baca with SMTP id
 140-20020a370492000000b0047de1d1bacamr248072qke.247.1646425479136; 
 Fri, 04 Mar 2022 12:24:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgLMhureMazbApcHxoId0ovHTPxZ6IY2TMXkHtaF62KtRhKSEPCfFTIpWUImpKhXu+6GtUPg==
X-Received: by 2002:a37:492:0:b0:47d:e1d1:baca with SMTP id
 140-20020a370492000000b0047de1d1bacamr248054qke.247.1646425478849; 
 Fri, 04 Mar 2022 12:24:38 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 y16-20020a37e310000000b00648c706dda1sm2874739qki.6.2022.03.04.12.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:24:38 -0800 (PST)
Message-ID: <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 04 Mar 2022 15:24:37 -0500
In-Reply-To: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
References: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: Rename prom_init() and
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

This mostly looks good to me. Just one question (and one comment down below
that needs addressing). Is this with ppc32? (I ask because ppc64le doesn't
seem to hit this compilation error).

On Fri, 2022-03-04 at 18:20 +0100, Christophe Leroy wrote:
> While working on powerpc headers, I ended up with the following error.
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
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> index ffa4b395220a..9c951e90e622 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> @@ -25,7 +25,7 @@
>  #include <subdev/pci.h>
>  
>  static u32
> -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> +nvbios_rom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
>  {
>         struct nvkm_device *device = data;
>         u32 i;
> @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct
> nvkm_bios *bios)
>  }
>  
>  static void
> -prom_fini(void *data)
> +nvbios_rom_fini(void *data)
>  {
>         struct nvkm_device *device = data;
>         nvkm_pci_rom_shadow(device->pci, true);
>  }
>  
>  static void *
> -prom_init(struct nvkm_bios *bios, const char *name)
> +nvbios_rom_init(struct nvkm_bios *bios, const char *name)
>  {
>         struct nvkm_device *device = bios->subdev.device;
>         if (device->card_type == NV_40 && device->chipset >= 0x4c)
> @@ -57,8 +57,8 @@ prom_init(struct nvkm_bios *bios, const char *name)
>  const struct nvbios_source
>  nvbios_rom = {
>         .name = "PROM",
> -       .init = prom_init,
> -       .fini = prom_fini,
> -       .read = prom_read,
> +       .init = nvbios_rom_init,
> +       .fini = nvbios_rom_fini,
> +       .read = nvbios_rom_read,

Seeing as the source name is prom, I think using the naming convention
nvbios_prom_* would be better then nvbios_rom_*.

>         .rw = false,
>  };

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

