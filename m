Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD873CF58
	for <lists+nouveau@lfdr.de>; Sun, 25 Jun 2023 10:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4249810E11B;
	Sun, 25 Jun 2023 08:29:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sun, 25 Jun 2023 08:29:39 UTC
Received: from out199-17.us.a.mail.aliyun.com (out199-17.us.a.mail.aliyun.com
 [47.90.199.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC4C10E11B
 for <nouveau@lists.freedesktop.org>; Sun, 25 Jun 2023 08:29:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VlrlpwT_1687681454; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VlrlpwT_1687681454) by smtp.aliyun-inc.com;
 Sun, 25 Jun 2023 16:24:23 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Sun, 25 Jun 2023 16:24:13 +0800
Message-Id: <20230625082413.111375-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau: Remove the unused variable entry
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Variable entry is not effectively used, so delete it.

drivers/gpu/drm/nouveau/nouveau_connector.c:1298:7: warning: variable 'entry' set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5596
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f75c6f09dd2a..3a267b793afa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1295,11 +1295,8 @@ nouveau_connector_create(struct drm_device *dev,
 	/* attempt to parse vbios connector type and hotplug gpio */
 	nv_connector->dcb = olddcb_conn(dev, index);
 	if (nv_connector->dcb) {
-		u32 entry = ROM16(nv_connector->dcb[0]);
-		if (olddcb_conntab(dev)[3] >= 4)
-			entry |= (u32)ROM16(nv_connector->dcb[2]) << 16;
-
 		nv_connector->type = nv_connector->dcb[0];
+
 		if (drm_conntype_from_dcb(nv_connector->type) ==
 					  DRM_MODE_CONNECTOR_Unknown) {
 			NV_WARN(drm, "unknown connector type %02x\n",
-- 
2.20.1.7.g153144c

