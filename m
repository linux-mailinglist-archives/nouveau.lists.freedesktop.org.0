Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39012B2DC
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2996E14C;
	Fri, 27 Dec 2019 08:14:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15206E796;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yw-SX; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hp-As; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Tue,  8 Oct 2019 12:35:58 +0100
Message-Id: <20191008113559.29569-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
References: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] [PATCH 4/5] drm/nouveau/disp/gv100: make undeclared
 symbols static
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

The two objects gv100_disp_wndw and gv100_disp_wndw_mthd are
not declared or used outside the file, so make them static to
avoid the following warnings:

drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c:120:1: warning: symbol 'gv100_disp_wndw_mthd' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c:140:1: warning: symbol 'gv100_disp_wndw' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
index 5d3b641dbb14..e635247d794f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
@@ -116,7 +116,7 @@ gv100_disp_wndw_mthd_base = {
 	}
 };
 
-const struct nv50_disp_chan_mthd
+static const struct nv50_disp_chan_mthd
 gv100_disp_wndw_mthd = {
 	.name = "Window",
 	.addr = 0x001000,
@@ -136,7 +136,7 @@ gv100_disp_wndw_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da4, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wndw = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
