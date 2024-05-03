Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0F8BB258
	for <lists+nouveau@lfdr.de>; Fri,  3 May 2024 20:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A91131BA;
	Fri,  3 May 2024 18:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="F/tft0H0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F7BF1131BA;
 Fri,  3 May 2024 18:15:14 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
 by linux.microsoft.com (Postfix) with ESMTPSA id E89C5207DBCF;
 Fri,  3 May 2024 11:15:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E89C5207DBCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714760114;
 bh=RgiCQNHrwKIU7zhDFVCblheJAkvGZ36PnrZ7zESY2bY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/tft0H0P/aRQiz9ebsQr+LH7HUVs0Y5EeJy/3Wlm4snNsfWXcKl+if5PfBJ8fb1L
 /QioEaI//qvxDKqKF+MkxOJi5TEKUOqkFj/JcUkhpPirvS2B+VC84Tz9D2LwhzbxR7
 wO3Gd3I3cIoiJwTel8n1v2KBijytqQX6RM35q5/w=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:CX18 VIDEO4LINUX DRIVER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v2 06/12] media: cx18: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:27 +0000
Message-Id: <20240503181333.2336999-7-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

I2S specification has also updated the terms in v.3 to use "controller"
and "target" respectively. Make those changes in the relevant spaces as
well.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx18/cx18-av-firmware.c | 8 ++++----
 drivers/media/pci/cx18/cx18-cards.c       | 6 +++---
 drivers/media/pci/cx18/cx18-cards.h       | 4 ++--
 drivers/media/pci/cx18/cx18-gpio.c        | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-firmware.c b/drivers/media/pci/cx18/cx18-av-firmware.c
index 61aeb8c9af7f..906e0b33cffc 100644
--- a/drivers/media/pci/cx18/cx18-av-firmware.c
+++ b/drivers/media/pci/cx18/cx18-av-firmware.c
@@ -140,22 +140,22 @@ int cx18_av_loadfw(struct cx18 *cx)
 	cx18_av_and_or4(cx, CXADEC_PIN_CTRL1, ~0, 0x78000);
 
 	/* Audio input control 1 set to Sony mode */
-	/* Audio output input 2 is 0 for slave operation input */
+	/* Audio output input 2 is 0 for target operation input */
 	/* 0xC4000914[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000914[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
 	cx18_av_write4(cx, CXADEC_I2S_IN_CTL, 0x000000A0);
 
 	/* Audio output control 1 is set to Sony mode */
-	/* Audio output control 2 is set to 1 for master mode */
+	/* Audio output control 2 is set to 1 for controller mode */
 	/* 0xC4000918[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000918[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
-	/* 0xC4000918[8]: 0 = slave operation, 1 = master (SCK_OUT and WS_OUT
+	/* 0xC4000918[8]: 0 = target operation, 1 = controller (SCK_OUT and WS_OUT
 	   are generated) */
 	cx18_av_write4(cx, CXADEC_I2S_OUT_CTL, 0x000001A0);
 
-	/* set alt I2s master clock to /0x16 and enable alt divider i2s
+	/* set alt I2s controller clock to /0x16 and enable alt divider i2s
 	   passthrough */
 	cx18_av_write4(cx, CXADEC_PIN_CFG3, 0x5600B687);
 
diff --git a/drivers/media/pci/cx18/cx18-cards.c b/drivers/media/pci/cx18/cx18-cards.c
index f5a30959a367..4a04bc984578 100644
--- a/drivers/media/pci/cx18/cx18-cards.c
+++ b/drivers/media/pci/cx18/cx18-cards.c
@@ -82,7 +82,7 @@ static const struct cx18_card cx18_card_hvr1600_esmt = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_target_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -129,7 +129,7 @@ static const struct cx18_card cx18_card_hvr1600_s5h1411 = {
 	},
 	.gpio_init.initial_value = 0x3801,
 	.gpio_init.direction = 0x3801,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_target_reset = {
 		.active_lo_mask = 0x3801,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -176,7 +176,7 @@ static const struct cx18_card cx18_card_hvr1600_samsung = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_target_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
diff --git a/drivers/media/pci/cx18/cx18-cards.h b/drivers/media/pci/cx18/cx18-cards.h
index ae9cf5bfdd59..a886ff735e89 100644
--- a/drivers/media/pci/cx18/cx18-cards.h
+++ b/drivers/media/pci/cx18/cx18-cards.h
@@ -69,7 +69,7 @@ struct cx18_gpio_init { /* set initial GPIO DIR and OUT values */
 	u32 initial_value;
 };
 
-struct cx18_gpio_i2c_slave_reset {
+struct cx18_gpio_i2c_target_reset {
 	u32 active_lo_mask; /* GPIO outputs that reset i2c chips when low */
 	u32 active_hi_mask; /* GPIO outputs that reset i2c chips when high */
 	int msecs_asserted; /* time period reset must remain asserted */
@@ -121,7 +121,7 @@ struct cx18_card {
 	/* GPIO card-specific settings */
 	u8 xceive_pin;		/* XCeive tuner GPIO reset pin */
 	struct cx18_gpio_init		 gpio_init;
-	struct cx18_gpio_i2c_slave_reset gpio_i2c_slave_reset;
+	struct cx18_gpio_i2c_target_reset gpio_i2c_target_reset;
 	struct cx18_gpio_audio_input    gpio_audio_input;
 
 	struct cx18_card_tuner tuners[CX18_CARD_MAX_TUNERS];
diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index c85eb8d25837..85546e0a01c1 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -204,9 +204,9 @@ static int resetctrl_log_status(struct v4l2_subdev *sd)
 static int resetctrl_reset(struct v4l2_subdev *sd, u32 val)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
-	const struct cx18_gpio_i2c_slave_reset *p;
+	const struct cx18_gpio_i2c_target_reset *p;
 
-	p = &cx->card->gpio_i2c_slave_reset;
+	p = &cx->card->gpio_i2c_target_reset;
 	switch (val) {
 	case CX18_GPIO_RESET_I2C:
 		gpio_reset_seq(cx, p->active_lo_mask, p->active_hi_mask,
@@ -309,7 +309,7 @@ void cx18_reset_ir_gpio(void *data)
 {
 	struct cx18 *cx = to_cx18(data);
 
-	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
+	if (cx->card->gpio_i2c_target_reset.ir_reset_mask == 0)
 		return;
 
 	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
-- 
2.34.1

