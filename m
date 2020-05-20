Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4561F854A
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ED96E46D;
	Sat, 13 Jun 2020 20:54:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1F2789F97;
 Wed, 20 May 2020 10:48:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app3 (Coremail) with SMTP id cC_KCgCXOQTYCsVeqwPgAA--.5693S4;
 Wed, 20 May 2020 18:47:56 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Date: Wed, 20 May 2020 18:47:48 +0800
Message-Id: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCXOQTYCsVeqwPgAA--.5693S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWrZF15CFyUGr4xXF1UKFg_yoWDurXE9r
 4kua12gr4YkrZ2qw47Cw4rZryI9ws8u3WxXr10qrySy3y7Awn8WryUGwn5Zr43Wa4xXryq
 yFZ8WFyUArWI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbT8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
 67AK6r4DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
 6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUOlkVUUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/dispnv50: fix runtime pm imbalance on
 error
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a pairing decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6be9df1820c5..e670756664ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1123,8 +1123,10 @@ nv50_mstc_detect(struct drm_connector *connector,
 		return connector_status_disconnected;
 
 	ret = pm_runtime_get_sync(connector->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(connector->dev->dev);
 		return connector_status_disconnected;
+	}
 
 	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
 				     mstc->port);
-- 
2.17.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
