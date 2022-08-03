Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C4588EAB
	for <lists+nouveau@lfdr.de>; Wed,  3 Aug 2022 16:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C0F1124BB;
	Wed,  3 Aug 2022 14:28:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AD72AAD1
 for <nouveau@lists.freedesktop.org>; Wed,  3 Aug 2022 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659536870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jMDeq5W3wuzFQptZuNbKzVBS/9VCgpXFXC4FBRH7hbo=;
 b=CXwXvNBwqdYndp9zxiXWL7Ns//ec1REC5amZ2YuJi4W9qifH0SDg9TWfpboTKpJop48+PB
 3hU9SD5SZ9MTsBhRNYBA7xJv8w3HNmJXJiUMgv5UQ9J/HLZzs8zTEkrotMKFWeDf44dYxh
 3H24EIKNIWbrtdpxeqX2TrlKzCTZVX4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-_282KRDbMBKxspsCpafpfg-1; Wed, 03 Aug 2022 10:27:49 -0400
X-MC-Unique: _282KRDbMBKxspsCpafpfg-1
Received: by mail-qt1-f199.google.com with SMTP id
 k3-20020ac86043000000b0033cab47c483so2155450qtm.4
 for <nouveau@lists.freedesktop.org>; Wed, 03 Aug 2022 07:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMDeq5W3wuzFQptZuNbKzVBS/9VCgpXFXC4FBRH7hbo=;
 b=QUKCFZXkMHTM5WcIKLsZHraftVaVTKWFiNcPEEmmhI++gtEgnwaB2FXwWz+9mGo9Yt
 Z2Uan/Kckw1TznPuaW1NYbzNmMuSEP/Ioe7NuBOOO2u1wnrUbOh83/OWA55/hydVRDIw
 dA0hT1cMqItqfyAGVvpeA1nM3lpdqeZc/bn+f9dLfT3nWkgB7u+acPqiaqPLCu9TrPs/
 k9+MpZpcaY6fFkghYVPoR42D1KfQPIrcLleNobvcIyP/6oO2lDXNPz/vA0qldO8IZX2u
 7bR7ubUnYqJ6WtWN/M8D3jQTr6WpUUMdrcAmZSn9KChkdpDti0O+tmJJjXaOowS2FfLG
 O7gQ==
X-Gm-Message-State: ACgBeo0dGOwFYT09XRROyfQ8/a1u9f/z3k4srR4dHXKATLVZeaDdoweP
 14Di3DhJl0XmrE79kXUfHvkKyC7MOqPimxy/seALpQ9p64gTAav0xFQ+Zn3kEA6fl8UaBXfDWv3
 Dj87lPaAmXaR/QSS2cmrJRkWfQQ==
X-Received: by 2002:a05:6214:b6c:b0:476:8321:db81 with SMTP id
 ey12-20020a0562140b6c00b004768321db81mr12651659qvb.100.1659536868576; 
 Wed, 03 Aug 2022 07:27:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IlwlhOPpAaKuzndenntMKIemsZndWQNZCHgv70HCa/VmiEGcfUdUOkdlm30gAkODQ8TtTAg==
X-Received: by 2002:a05:6214:b6c:b0:476:8321:db81 with SMTP id
 ey12-20020a0562140b6c00b004768321db81mr12651642qvb.100.1659536868321; 
 Wed, 03 Aug 2022 07:27:48 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72]) by smtp.gmail.com with ESMTPSA id
 q31-20020a05620a2a5f00b006b8e8c657ccsm1121040qkp.117.2022.08.03.07.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 07:27:47 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Aug 2022 16:27:45 +0200
Message-Id: <20220803142745.2679510-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau: recognise GA103
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Appears to be ok with general GA10x code.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: <stable@vger.kernel.org> # v5.15+
---
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 62efbd0f3846..b7246b146e51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2605,6 +2605,27 @@ nv172_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 };
 
+static const struct nvkm_device_chip
+nv173_chipset = {
+	.name = "GA103",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gpio     = { 0x00000001, ga102_gpio_new },
+	.i2c      = { 0x00000001, gm200_i2c_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mc       = { 0x00000001, ga100_mc_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.privring = { 0x00000001, gm200_privring_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.top      = { 0x00000001, ga100_top_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
 static const struct nvkm_device_chip
 nv174_chipset = {
 	.name = "GA104",
@@ -3092,6 +3113,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x167: device->chip = &nv167_chipset; break;
 		case 0x168: device->chip = &nv168_chipset; break;
 		case 0x172: device->chip = &nv172_chipset; break;
+		case 0x173: device->chip = &nv173_chipset; break;
 		case 0x174: device->chip = &nv174_chipset; break;
 		case 0x176: device->chip = &nv176_chipset; break;
 		case 0x177: device->chip = &nv177_chipset; break;
-- 
2.37.1

