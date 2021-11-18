Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73A45530D
	for <lists+nouveau@lfdr.de>; Thu, 18 Nov 2021 04:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0D36E1F4;
	Thu, 18 Nov 2021 03:04:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4386E1F4
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 03:04:22 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id m15so4011720pgu.11
 for <nouveau@lists.freedesktop.org>; Wed, 17 Nov 2021 19:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=znXolq0VkbXE1txLA7L+l/SspX40qUXxuCiR9MMroys=;
 b=Vb47Es6qJXpf79bgawItYV7LyLt0jm/+Am8+ekyqpvTalWx6oTKdv9zPcrjES2rAPZ
 cVFjTebDg7QxQl9yHrWsLBWck7kpYk+/V7YLA8n25VAVPl66dnyPr9oFWBJATeeQ3B81
 RgJdF4SVHtcUVLNSkdAU4GYCphjWvyjq92ieM8BpIKYKkwsGruGE54Mg1qGgK7xBDWYK
 sz4aMv3w5PKBOPkuEex+EbGV2tWf0/hKLeqQ9Gm2O79rHGaEBZUCf0az24znDocsaUbc
 RS6lkTpG7LMeNqOeqdwYi1eYX0GjDqSazlddLBZFkGbcby8+iLQGd3wukCJafMGtWfdz
 bOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=znXolq0VkbXE1txLA7L+l/SspX40qUXxuCiR9MMroys=;
 b=0KXbpumpEpDGldX2W2wautavSwezvHMIZdfaXI5AAQ1t+18UmdvyPaSUt56Lv9BXUb
 EFNICRjnpDZ4rfqOD54o/vEQxoA+XxaxwUfDAZCWxISgl+hh5/RTZeYJcF1J26g8j0ZM
 z74Zfa6YkvJ+2BfH6wwsthwkuRfliD2IxDhJjE/HUF9n5xELhWlhs/tnr+CCg8APumWa
 KmqGve0Vn5ZgA7dbh4vEW/63QkE5yp0GRZv7xttju9VzL7+MMWcX0rdSBl7GCH+YTCcU
 lnuInDDJobwcahbx/9qupiBw+pBKw6jp1dzBfeCrzw2uMk8DicAyJeXhT7gw8aq/zzsp
 jVmg==
X-Gm-Message-State: AOAM532JR5JEqbnBTN3k0jzXKVD+ElyWL9jGwqy0pnQJ1NeUbigUA/MG
 Rnp8O2zA+STRndeZwu5omd7KBhz02Zw=
X-Google-Smtp-Source: ABdhPJxCpro7IZwUp6+dcV5hUBmFpyHK66KGJuvkCF6SAmnUt8aIHFMHXwrw3GdLPxdyot1HoYRPew==
X-Received: by 2002:a63:c61:: with SMTP id 33mr8626199pgm.415.1637204661420;
 Wed, 17 Nov 2021 19:04:21 -0800 (PST)
Received: from localhost.localdomain (52.55.96.58.static.exetel.com.au.
 [58.96.55.52])
 by smtp.gmail.com with ESMTPSA id om8sm7010952pjb.12.2021.11.17.19.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 19:04:20 -0800 (PST)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Nov 2021 13:04:13 +1000
Message-Id: <20211118030413.2610-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau: recognise GA106
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

I've got HW now, appears to work as expected so far.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index b51d690f375f..88d262ba648c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2626,6 +2626,27 @@ nv174_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 };
 
+static const struct nvkm_device_chip
+nv176_chipset = {
+	.name = "GA106",
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
 nv177_chipset = {
 	.name = "GA107",
@@ -3072,6 +3093,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x168: device->chip = &nv168_chipset; break;
 		case 0x172: device->chip = &nv172_chipset; break;
 		case 0x174: device->chip = &nv174_chipset; break;
+		case 0x176: device->chip = &nv176_chipset; break;
 		case 0x177: device->chip = &nv177_chipset; break;
 		default:
 			if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
-- 
2.31.1

