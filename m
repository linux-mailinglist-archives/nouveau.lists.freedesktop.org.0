Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DCA30DC71
	for <lists+nouveau@lfdr.de>; Wed,  3 Feb 2021 15:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6273A6EADB;
	Wed,  3 Feb 2021 14:17:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114506EAC6;
 Wed,  3 Feb 2021 14:17:04 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l7Ixp-0003XD-MI; Wed, 03 Feb 2021 14:17:01 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed,  3 Feb 2021 14:17:01 +0000
Message-Id: <20210203141701.23342-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH][next] drm/nouveau/fifo/tu102: Fix potential array
 out of bounds access error
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently the for_each_set_bit loop is iterating index engn from 0..31 and
calls to tu102_fifo_recover_engn can potentiall access fifo->engine[engn]
where engn is larger than the array engine (which is currently hard coded
as 16 elements).  Avoid any potential array out of bounds accesses by
replacing the hard coded value 32 with the number of elements in the array.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: 26a0cfc163ab ("drm/nouveau/fifo/tu102: FIFO interrupt fixes for Turing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 14e5b70e0255..1f33f8c757bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -366,7 +366,7 @@ tu102_fifo_intr_ctxsw_timeout(struct gk104_fifo *fifo)
 	engm = nvkm_rd32(device, 0x2a30);
 	nvkm_wr32(device, 0x2a30, engm);
 
-	for_each_set_bit(engn, &engm, 32)
+	for_each_set_bit(engn, &engm, ARRAY_SIZE(fifo->engine))
 		tu102_fifo_recover_engn(fifo, engn);
 
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
