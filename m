Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7BA326508
	for <lists+nouveau@lfdr.de>; Fri, 26 Feb 2021 16:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DD6EE06;
	Fri, 26 Feb 2021 15:55:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A2589D86;
 Fri, 26 Feb 2021 10:07:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UPdKhw-_1614334036; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UPdKhw-_1614334036) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 26 Feb 2021 18:07:20 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Fri, 26 Feb 2021 18:07:15 +0800
Message-Id: <1614334035-33886-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Fri, 26 Feb 2021 15:55:58 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: make tu102_fifo_runlist static
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fix the following sparse warning:

drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c:53:1: warning: symbol
'tu102_fifo_runlist' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index e417044..260b197 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -49,7 +49,7 @@
 	/*XXX: how to wait? can you even wait? */
 }
 
-const struct gk104_fifo_runlist_func
+static const struct gk104_fifo_runlist_func
 tu102_fifo_runlist = {
 	.size = 16,
 	.cgrp = gv100_fifo_runlist_cgrp,
-- 
1.8.3.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
