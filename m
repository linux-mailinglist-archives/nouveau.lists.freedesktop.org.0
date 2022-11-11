Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDB6F6B3D
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B5210E3B6;
	Thu,  4 May 2023 12:31:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471E10E0CA;
 Fri, 11 Nov 2022 09:48:16 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VUX1Y0n_1668160086; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VUX1Y0n_1668160086) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 17:48:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:48:04 +0800
Message-Id: <20221111094804.103459-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/svm: Remove set but unused variable
 'priority'
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

Variable priority is not effectively used in the function, so delete it.

drivers/gpu/drm/nouveau/nouveau_svm.c:115:24: warning: variable 'priority' set but not used.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3028
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..2b1f600ed723 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -112,7 +112,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_nouveau_svm_bind *args = data;
-	unsigned target, cmd, priority;
+	unsigned int target, cmd;
 	unsigned long addr, end;
 	struct mm_struct *mm;
 
@@ -136,9 +136,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	priority = args->header >> NOUVEAU_SVM_BIND_PRIORITY_SHIFT;
-	priority &= NOUVEAU_SVM_BIND_PRIORITY_MASK;
-
 	/* FIXME support CPU target ie all target value < GPU_VRAM */
 	target = args->header >> NOUVEAU_SVM_BIND_TARGET_SHIFT;
 	target &= NOUVEAU_SVM_BIND_TARGET_MASK;
-- 
2.20.1.7.g153144c

