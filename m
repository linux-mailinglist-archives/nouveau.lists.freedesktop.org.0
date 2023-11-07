Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C77E41E0
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 15:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E777B10E0A7;
	Tue,  7 Nov 2023 14:32:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486A110E0A7
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 14:32:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso856251566b.1
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 06:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699367533; x=1699972333; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4FfF5WQCHWIYk3J5QH4Ife+igz0Hy47QMYKP9OUchs=;
 b=e+cFbki80Fa6MjNP3AxqRhE/jzJbfw0LYGc8686Chm86PoR1NL4Lz8CeSwV/mfvaIF
 HGzTcTQXWyh7T8wbERUuj+xyClDgoIlgQlGGRyS1Em0EjdORS+G9wUqSCo2aZgttmat8
 3GfVA3FfKoPyc3Grj5Dp8EjVgVAYifxAJv+UukAA/yn0r7yOVUTI3OyzUWYfyDZCSn0V
 C+NWdeEdf7KU2MQwC943Wr1GljhprlSwBj4EZoQUOuojsGozcdyNYPWagaXJIH/QDeyY
 BhtuwIYdAcER+otPJVwNrbLwJbfSoCPuOIaKCcgOo9Vkwt0W+0r8hDRh8vklioHF1Sqn
 F+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699367533; x=1699972333;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4FfF5WQCHWIYk3J5QH4Ife+igz0Hy47QMYKP9OUchs=;
 b=DXphKmiYMsjyjzVWyO22mPVBBP+8e4g3IUWNr5KM2lSCie2d3qPcqsOiND4RmodfjO
 G75YnSX3oGLsYqliY+ZpxSsKsb2GfePCfMj8vPJtRpMFDEV54uTEetWJxYE52JCrKcYR
 mFNNNQP6WdniKJJBJqjctqqGk/v9kP+owY0yYeg4TCz25qD2sqBC9IenozWML+4GjYWK
 31FcFc3NReLQa2kyvaqBlQwD24F+aRzDo0Xy10wGHEIpYivfI3FbKwDeWkFI+P38kXn2
 32etgzUhx9depvi+6syCWKVyGU8/v56B1Brmp0wcJCfZESchXhCme3L9LJ6Ckzh86hWu
 ImaA==
X-Gm-Message-State: AOJu0YwUnLqdBjwgNruOf5mm0HWpYGZjJACO3S9B3YEgFCI0oo9XX+CL
 8x8yByTtKMZM6OFz8jO15jsJ4Q0LuuGai3sWiFt6m0uj
X-Google-Smtp-Source: AGHT+IH/gCLjSiidQHkz0LPvm/M8bYzVu6fmQEMvMskJHnVxOhpT7gyRbNx961gZTMcyYD+oYwfqJw==
X-Received: by 2002:a17:907:26cd:b0:9e0:4910:166a with SMTP id
 bp13-20020a17090726cd00b009e04910166amr5541355ejc.32.1699367533194; 
 Tue, 07 Nov 2023 06:32:13 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w1-20020a170906184100b009b64987e1absm1099211eje.139.2023.11.07.06.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 06:32:12 -0800 (PST)
Date: Tue, 7 Nov 2023 17:32:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bskeggs@redhat.com
Message-ID: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Ben Skeggs,

The patch 5bf0257136a2: "drm/nouveau/mmu/r535: initial support" from
Sep 19, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c:171 r535_bar_new_()
	error: uninitialized symbol 'bar'.

drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
    147 int
    148 r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
    149               enum nvkm_subdev_type type, int inst, struct nvkm_bar **pbar)
    150 {
    151         struct nvkm_bar_func *rm;
    152         struct nvkm_bar *bar;
    153         int ret;
    154 
    155         if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
    156                 return -ENOMEM;
    157 
    158         rm->dtor = r535_bar_dtor;
    159         rm->oneinit = hw->oneinit;
    160         rm->bar1.init = r535_bar_bar1_init;
    161         rm->bar1.fini = r535_bar_bar1_fini;
    162         rm->bar1.wait = r535_bar_bar1_wait;
    163         rm->bar1.vmm = hw->bar1.vmm;
    164         rm->bar2.init = r535_bar_bar2_init;
    165         rm->bar2.fini = r535_bar_bar2_fini;
    166         rm->bar2.wait = r535_bar_bar2_wait;
    167         rm->bar2.vmm = hw->bar2.vmm;
    168         rm->flush = r535_bar_flush;
    169 
    170         ret = gf100_bar_new_(rm, device, type, inst, &bar);
--> 171         *pbar = bar;
    172         if (ret) {
    173                 if (!bar)
                            ^^^^
If gf100_bar_new_() fails then bar isn't initialized.  Do we really
need to initialize bar to NULL on error?  If so then we should do it
before the "rm = kzalloc()".

    174                         kfree(rm);
    175                 return ret;
    176         }
    177 
    178         bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
    179         if (!bar->flushBAR2PhysMode)
    180                 return -ENOMEM;
    181 
    182         bar->flushBAR2 = bar->flushBAR2PhysMode;
    183 
    184         gf100_bar(*pbar)->bar2_halve = true;
    185         return 0;
    186 }

regards,
dan carpenter
