Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0504AE8A9
	for <lists+nouveau@lfdr.de>; Wed,  9 Feb 2022 05:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0F10E17E;
	Wed,  9 Feb 2022 04:54:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BE110E13C
 for <nouveau@lists.freedesktop.org>; Wed,  9 Feb 2022 04:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1644382450;
 bh=LJt0sqL+fXd0VLrW+ZcV//gkrD8GoyFyhZL0BFbooew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A/1urvwqyH4rI9/yqBSJjtFlYcTcMv9cg1ML23FSvkcM50HIdmZsh8QKFUTwH1E3D
 b1Gf+/wccEdoZXqv50HPCzJaoW+OgLUlSdEDXH19PZsMZ7mlO/yKimls71akdunPC5
 EX+pCLXksvzPxwU4MZr+F6F/dSGuG4kZSMqihG2k=
Received: from liwg-ubuntu.lan ([111.193.130.237])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id D7B2526A; Wed, 09 Feb 2022 12:53:59 +0800
X-QQ-mid: xmsmtpt1644382439tn94orwxv
Message-ID: <tencent_E031AB3C4FA72E11303AF8DF672315229E08@qq.com>
X-QQ-XMAILINFO: N0opbxSOYLeWyU0U/Zk5NzzK2nOhykjcUT6kFADlJyZJx9pVXD8eChoVPLVd75
 HKG8eV/6n6X1Q74uURU+8xbIg7gIIqYSIvRocDxJjPIscAEYyUBrk/OO9Bc5Vp8DEgqD0lv9ntNw
 JQT2uPNeXU05rjyASFkBwoyK2EY0MnhPAknyYo7cLd8JeQrHimNBPRQcnUKJpBM2ojhGgfNTUrxI
 KDDpCtZhW27+LeXVkVEhpMcggViHoWn7cwz0YdTx/6cp3GMAuq5Ky0AZlzN5IY6iV+0EFTOfNuVs
 r+d4wQO0QYJsxxXPsyccGmW/PwHyTGyx8kVV9yDZzP6f3Q1Ev4+5Nk3LRUYt63QA8O8F99yg5+TG
 mA3YZmCwwfebSgGglgA2iilqEbX8aOekMMA/mQkcIeRtCOPs+mfQ8PsiWJn5LYFC7jI6P24KIowl
 qoaRAISmjaMNNJx4mIpsDMKXDjL+2bSSsBMkWnW66D+ywyMp6cX1Z7d9GtvxpDSOykk5ap1K12Kl
 uIhsm0wDPH+SfyBC2TVXmj0A5WVU5Cdn2B/A5aOfC4IMnP5N15ujz9tmDcN0JqKUbs7gSiqhphHF
 OGvjk9MqxPqby4NRO4C9U2W49A451afH7kn8L87e58ccXRr0tkjNce3ejGjocM0am91xtQhhFA6p
 iijTY1Rz6Hu/BYREhcZgLQMChGw2yoBuNkSjFV/jLaBkh9ixbySWOUSuer0MoEU2tMsGLHj32sXc
 8uzGwWXkgBQoWKziPkHmmSohUMZTeUh51nKpSpHoJ3yAc57Q9wIa8DbqtoJZD7+0KyWZ6SEH9YVj
 0qFt53LPdau6tdYinUf1UYi+V3hb56eY3x1pDcjArC9dz1/lGJ1MLOAVaNW5IH04M=
From: Weiguo Li <liwg06@foxmail.com>
To: kherbst@redhat.com
Date: Wed,  9 Feb 2022 12:53:58 +0800
X-OQ-MSGID: <20220209045358.3805467-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_783A87DF782324222331783C3DA7CC110C08@qq.com>
References: <tencent_783A87DF782324222331783C3DA7CC110C08@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2] drm/nouveau/nvkm: fix dereference before null
 check
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

Move pointer dereference after null check.

Signed-off-by: Weiguo Li <liwg06@foxmail.com>
---
v2:
* update commit log
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

