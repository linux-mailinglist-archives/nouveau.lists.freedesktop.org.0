Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C487912B2AB
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020F589E05;
	Fri, 27 Dec 2019 08:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D006E11A;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yv-Re; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hm-9A; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Tue,  8 Oct 2019 12:35:57 +0100
Message-Id: <20191008113559.29569-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] [PATCH 3/5] drm/nouveau/fifo/gv100: make
 gv100_fifo_runlist static
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
Cc: David Airlie <airlied@linux.ie>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Do not export gv100_fifo_runlist as it isn't not used
to remove the following morning:

drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c:56:1: warning: symbol 'gv100_fifo_runlist' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
index 6ee1bb32a071..1f6ddf880179 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c
@@ -52,7 +52,7 @@ gv100_fifo_runlist_cgrp(struct nvkm_fifo_cgrp *cgrp,
 	nvkm_wo32(memory, offset + 0xc, 0x00000000);
 }
 
-const struct gk104_fifo_runlist_func
+static const struct gk104_fifo_runlist_func
 gv100_fifo_runlist = {
 	.size = 16,
 	.cgrp = gv100_fifo_runlist_cgrp,
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
