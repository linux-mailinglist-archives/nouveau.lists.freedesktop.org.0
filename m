Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475646F6BF5
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9778310E4E1;
	Thu,  4 May 2023 12:33:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141D10E7B1;
 Fri, 11 Nov 2022 09:11:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R761e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VUWiU1j_1668157910; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VUWiU1j_1668157910) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 17:11:54 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:11:29 +0800
Message-Id: <20221111091130.57178-4-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: [Nouveau] [PATCH 4/5] drm/nouveau/fifo/gf100-: make
 gf100_fifo_nonstall_block() static
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

This symbol is not used outside of gf100.c, so marks it static.

drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for ‘gf100_fifo_nonstall_block’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3021
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
index 5bb65258c36d..6c94451d0faa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 	spin_unlock_irqrestore(&fifo->lock, flags);
 }
 
-void
+static void
 gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
-- 
2.20.1.7.g153144c

