Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E806A6F6BB6
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043310E479;
	Thu,  4 May 2023 12:32:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from luna (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 [86.15.83.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FD210E3EF;
 Thu, 29 Dec 2022 15:55:13 +0000 (UTC)
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1pAvFP-002oFi-2h;
 Thu, 29 Dec 2022 15:55:11 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Thu, 29 Dec 2022 15:55:10 +0000
Message-Id: <20221229155510.669817-1-ben-linux@fluff.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:36 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: make gf100_fifo_nonstall_block
 static
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
Cc: Ben Dooks <ben-linux@fluff.org>, bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Make gf100_fifo_nonstall_block as it isn't exported, to
silence the following sparse warning:

drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: symbol 'gf100_fifo_nonstall_block' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
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
2.39.0

