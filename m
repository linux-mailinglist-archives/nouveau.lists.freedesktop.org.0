Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AB49E905
	for <lists+nouveau@lfdr.de>; Thu, 27 Jan 2022 18:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E6110E420;
	Thu, 27 Jan 2022 17:30:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0828010E53F
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1643304635;
 bh=e11dB2BJ9AY3PYSyZ2MjU9cabO8INslyAEItoezynYI=;
 h=From:To:Cc:Subject:Date;
 b=LI1zDRkeku+upynMZGnoP6+Ol7gYJnpBxL8FjZM0Jwg8TdHlqxco0BOssMSWar5U2
 OZlsfPwp/KP5d6Jw88v2qOwMLqDe19WPnr/buEIo0IzXLtY1qEqjlZcAfRaF/i8G5g
 ChWB6OhM5sZx85jeaITTztfnEfkB0xh1qZUOIRaI=
Received: from localhost.localdomain ([111.193.130.237])
 by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
 id 788B6C4D; Fri, 28 Jan 2022 01:30:08 +0800
X-QQ-mid: xmsmtpt1643304608tzyi88a6b
Message-ID: <tencent_783A87DF782324222331783C3DA7CC110C08@qq.com>
X-QQ-XMAILINFO: NO7nxmS7l766gPWqKqL8KP8aWqE1eYgaMKCcarCBWn9fIe2rS8N522ziyJROJJ
 0wstddFCWSWXSwFeIzcnNuzO6PT0AgRjGvceZDkrLFFWJU6qDx7YRoa2jJsRyyIBJAl3zx7Iwip2
 xlqRaUBC1i5o1FCPjJB2MyNN1P3RzrJ9zlHeyja5WlR0zrhp1tf5O5lTTd+QJCLZYFq9FYlcfwtR
 gymv2p2LmmEucKjZ9WX0xjFfHxbQ+1BjrDUtSFvkvtINtP1hUPnWBkjSuKNkoDx+Ps77YArfHbOz
 ohnXmjht5K3+ikjLCXm0ykeJIdjRyEZQBU98gWov4fDJyK5F5JEnlQYsLm3+uQu++T33lcX8xvOe
 NmKcndKM5Kx3gyE/TzV7ljQpENmfUaI2WEzxVICy4dSsWqZE6CdIbBpOLFQFQLGuLcuoJSb9cH5B
 t5VdQksoqk8ivJAYQ7yVIjG6wwZ96grCYN/kNRN5DlObmKRnlQrkp1dD+AwLMPrMJdFOzUOqXirG
 qmlB3VKRGqNxO20ElSKNnyRJto8HEbLwvEMC1m1W1bbDj6DV7aqa2xbwX02VmxOsS5mowBmR+K9Y
 bc11j/qQ+/3cig3YHJ6e2z4eKIIGtPhl2eBePSZgpwulJYJQdI5D7+FghUTY7gQig5eWmIhViCpv
 zuBTU6eiMBuZpmfHDuHOLjNbC2OAKldf0L7wuPS5RFAsVABhAsAYzLYPQGOoKwl20ZlUCGizW5oi
 1/4bytAvd7qydS7f0/cN2GBgvFIKdoYa9ltCq7VtS2nYVoqcxLaf3dsFuLO/+DdCFogZ1afkvLnL
 VaFNnG1a7BsWq8IUmCl4MxFdil8ugeWP+dxJIpyyAmJ0TxBjfrbCQunmdJDrV/6ZpzBLzL7vsbOC
 4xn9VMH56B7BY6L6hPFwY=
From: Weiguo Li <liwg06@foxmail.com>
To: kherbst@redhat.com
Date: Fri, 28 Jan 2022 01:30:08 +0800
X-OQ-MSGID: <20220127173008.44639-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau/nvkm: adjust memory check and use in
 proper order
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Weiguo Li <liwg06@foxmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 57199be082fd..e83715873ffc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -416,9 +416,9 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
 		return 0;
 
 	pstate = kzalloc(sizeof(*pstate), GFP_KERNEL);
-	cstate = &pstate->base;
 	if (!pstate)
 		return -ENOMEM;
+	cstate = &pstate->base;
 
 	INIT_LIST_HEAD(&pstate->list);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
index 340f37a299dc..f4b34ebdcae5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
@@ -98,9 +98,9 @@ nvkm_fanpwm_create(struct nvkm_therm *therm, struct dcb_gpio_func *func)
 		return -ENODEV;
 
 	fan = kzalloc(sizeof(*fan), GFP_KERNEL);
-	therm->fan = &fan->base;
 	if (!fan)
 		return -ENOMEM;
+	therm->fan = &fan->base;
 
 	fan->base.type = "PWM";
 	fan->base.get = nvkm_fanpwm_get;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
index ff9fbe7950e5..71a1e56d0d99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
@@ -100,9 +100,9 @@ nvkm_fantog_create(struct nvkm_therm *therm, struct dcb_gpio_func *func)
 	}
 
 	fan = kzalloc(sizeof(*fan), GFP_KERNEL);
-	therm->fan = &fan->base;
 	if (!fan)
 		return -ENOMEM;
+	therm->fan = &fan->base;
 
 	fan->base.type = "toggle";
 	fan->base.get = nvkm_fantog_get;
-- 
2.25.1

