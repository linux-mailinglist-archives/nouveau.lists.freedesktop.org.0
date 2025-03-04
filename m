Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1FA4EF49
	for <lists+nouveau@lfdr.de>; Tue,  4 Mar 2025 22:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3880710E6B6;
	Tue,  4 Mar 2025 21:16:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 21:16:30 UTC
Received: from rudorff.com (rudorff.com [193.31.26.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B871B10E6B6;
 Tue,  4 Mar 2025 21:16:30 +0000 (UTC)
Received: from [127.0.0.1]
 (dynamic-2a02-3102-8418-1620-0000-0000-0000-04cc.310.pool.telefonica.de
 [IPv6:2a02:3102:8418:1620::4cc])
 by rudorff.com (Postfix) with ESMTPSA id 06AF5406E5;
 Tue,  4 Mar 2025 22:08:40 +0100 (CET)
From: "chr[]" <chris@rudorff.com>
Date: Tue, 04 Mar 2025 22:08:19 +0100
Subject: [PATCH] drm/nouveau: fix hibernate on disabled GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nouveau-fix-hibernate-v1-1-ee4433546030@rudorff.com>
X-B4-Tracking: v=1; b=H4sIAMJrx2cC/x2MSQqAMAwAvyI5G6ixrl8RD61GzaVKa0UQ/27xO
 DAzDwT2wgH67AHPlwTZXYIiz2DajFsZZU4MpKhSpdLo9nixibjIjZtY9s6cjKS7lupZU2MtpPb
 wnIT/O4zv+wFYq6LKZwAAAA==
X-Change-ID: 20250304-nouveau-fix-hibernate-249826d427bb
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Hibernate bricks the machine if a discrete GPU was disabled via

echo IGD > /sys/kernel/debug/vgaswitcheroo/switch

The freeze and thaw handler lacks checking the GPU power state,
as suspend and resume do.

This patch add the checks and fix this issue.

Signed-off-by: chr[] <chris@rudorff.com>
---
I got an old MacBook having a defective nvidia GPU

So I put this in the initrd scripts to turn it off asap:

mount -t debugfs none /sys/kernel/debug
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch

which powers down the nouveau.

Suspend and resume works,
but hibernate locks up the machine.

The handlers are not checking the GPU state.

Signed-off-by:
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5664c4c71faf1ced30f38d9874244db80d58194a..0958d1b940c2533bfadc29e098045db6f0170c79 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1079,6 +1079,10 @@ nouveau_pmops_freeze(struct device *dev)
 {
 	struct nouveau_drm *drm = dev_get_drvdata(dev);
 
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_suspend(drm, false);
 }
 
@@ -1087,6 +1091,10 @@ nouveau_pmops_thaw(struct device *dev)
 {
 	struct nouveau_drm *drm = dev_get_drvdata(dev);
 
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+		return 0;
+
 	return nouveau_do_resume(drm, false);
 }
 

---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250304-nouveau-fix-hibernate-249826d427bb

Best regards,
-- 
chr[] <chris@rudorff.com>

