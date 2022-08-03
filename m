Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84D58920B
	for <lists+nouveau@lfdr.de>; Wed,  3 Aug 2022 20:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9B318B174;
	Wed,  3 Aug 2022 18:07:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA5F1122EF
 for <nouveau@lists.freedesktop.org>; Wed,  3 Aug 2022 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659550013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rh/D//LpX2EQSZeExryw0yfWU5X+yGvodAZfXC00FRk=;
 b=Ulrh6H41Y/U5woryt2wWSjl+QNkcIJ844XUKDhlULo0J9+tmvkWvpjh+aXa2Mvh6H3XhEp
 iOB483qdoy1GC56g58gt5JSJ17Jk8w0Lt48GwNirADESCXmGsT62zNGR1/4nbq4RH52jLw
 NNYcp9bTl9oFAnQca5l/PDkbs30g09k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-m8aWe4l7MtmbAGjlQqrzzA-1; Wed, 03 Aug 2022 14:06:51 -0400
X-MC-Unique: m8aWe4l7MtmbAGjlQqrzzA-1
Received: by mail-qt1-f199.google.com with SMTP id
 v6-20020ac87486000000b0031ee0ae1400so11567495qtq.14
 for <nouveau@lists.freedesktop.org>; Wed, 03 Aug 2022 11:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Rh/D//LpX2EQSZeExryw0yfWU5X+yGvodAZfXC00FRk=;
 b=JO/rX4SHwFSKIV/fqQkT8bLFdnRBF2+gb+2Bqf7/LDHow4olcIZv/s373fPxpJpY9a
 UwAIhuKyU8nuMQzJh9gIRpHd1feMQWPdaU5atQZM0Ki8Mo72ZZw2/D7rMjAaMijOwgEl
 KAb+q6An66Ch68ROCE/SQyvpnS1JwS9ZiE+HSf8LsM+iQg2b61hl1SuCkjV83tqQnyZb
 L5KFWm2Ly9gJ8CteMyoHYpYDiWMLsXSXRy+AW6Qj+bqWP2JMjjdhOVP6LkoVm9wU0TBo
 U8XPg1Ls2IZxEh029Hk0vdtC0Bl6aPcEAsudaaz2hUuAFgZJ46weK1HA0K1kFLbkPkMt
 39cw==
X-Gm-Message-State: AJIora+taHGSbnArW+fH2fKetmwxxqK/yh9uArlaOZMvxbHOscCha5a5
 Puqq286Yo5h5UXjqr+kNOTwhHvFYeniHb9aXXiWubG3ZsAAI7zthEETiJSbJQdUlBDjlcwK5EG1
 h8IFrgEW1DXuuwljz5ITuUwtqbA==
X-Received: by 2002:a05:620a:28cf:b0:6b5:e32f:febb with SMTP id
 l15-20020a05620a28cf00b006b5e32ffebbmr18518179qkp.258.1659550011427; 
 Wed, 03 Aug 2022 11:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1wP4M+hCDHMvv7zAVXU8ZZsm0m0Hr8gMyZl3KqH9ZCDJtIXmNHrJmFeE8kKzevcYazksmzg==
X-Received: by 2002:a05:620a:28cf:b0:6b5:e32f:febb with SMTP id
 l15-20020a05620a28cf00b006b5e32ffebbmr18518161qkp.258.1659550011181; 
 Wed, 03 Aug 2022 11:06:51 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 g1-20020a05620a40c100b006b55036fd3fsm13720397qko.70.2022.08.03.11.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 11:06:50 -0700 (PDT)
Message-ID: <4fd72edfab4cfb6e8ca9731f1087c2209299bdd2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Wed, 03 Aug 2022 14:06:49 -0400
In-Reply-To: <20220803142745.2679510-1-kherbst@redhat.com>
References: <20220803142745.2679510-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: recognise GA103
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-08-03 at 16:27 +0200, Karol Herbst wrote:
> Appears to be ok with general GA10x code.
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 62efbd0f3846..b7246b146e51 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2605,6 +2605,27 @@ nv172_chipset = {
>         .fifo     = { 0x00000001, ga102_fifo_new },
>  };
>  
> +static const struct nvkm_device_chip
> +nv173_chipset = {
> +       .name = "GA103",
> +       .bar      = { 0x00000001, tu102_bar_new },
> +       .bios     = { 0x00000001, nvkm_bios_new },
> +       .devinit  = { 0x00000001, ga100_devinit_new },
> +       .fb       = { 0x00000001, ga102_fb_new },
> +       .gpio     = { 0x00000001, ga102_gpio_new },
> +       .i2c      = { 0x00000001, gm200_i2c_new },
> +       .imem     = { 0x00000001, nv50_instmem_new },
> +       .mc       = { 0x00000001, ga100_mc_new },
> +       .mmu      = { 0x00000001, tu102_mmu_new },
> +       .pci      = { 0x00000001, gp100_pci_new },
> +       .privring = { 0x00000001, gm200_privring_new },
> +       .timer    = { 0x00000001, gk20a_timer_new },
> +       .top      = { 0x00000001, ga100_top_new },
> +       .disp     = { 0x00000001, ga102_disp_new },
> +       .dma      = { 0x00000001, gv100_dma_new },
> +       .fifo     = { 0x00000001, ga102_fifo_new },
> +};
> +
>  static const struct nvkm_device_chip
>  nv174_chipset = {
>         .name = "GA104",
> @@ -3092,6 +3113,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 case 0x167: device->chip = &nv167_chipset; break;
>                 case 0x168: device->chip = &nv168_chipset; break;
>                 case 0x172: device->chip = &nv172_chipset; break;
> +               case 0x173: device->chip = &nv173_chipset; break;
>                 case 0x174: device->chip = &nv174_chipset; break;
>                 case 0x176: device->chip = &nv176_chipset; break;
>                 case 0x177: device->chip = &nv177_chipset; break;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

