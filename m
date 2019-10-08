Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A132B12B2D7
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554456E103;
	Fri, 27 Dec 2019 08:14:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881056E115;
 Tue,  8 Oct 2019 11:36:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iHnma-0007Yt-I5; Tue, 08 Oct 2019 12:36:00 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iHnma-0007hg-6Z; Tue, 08 Oct 2019 12:36:00 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Tue,  8 Oct 2019 12:35:55 +0100
Message-Id: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] [PATCH 1/5] drm/nouveau/gr/gf100-: make undeclared
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

The following functions are not declared outside of the
file they are in, so make them static to avoid these
warnings:

drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:745:1: warning: symbol 'gf100_gr_fecs_start_ctxsw' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:760:1: warning: symbol 'gf100_gr_fecs_stop_ctxsw' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2071:1: warning: symbol 'gf100_gr_ctor_fw_legacy' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index c578deb5867a..f1d1174ce67a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -741,7 +741,7 @@ gf100_gr_fecs_ctrl_ctxsw(struct gf100_gr *gr, u32 mthd)
 	return -ETIMEDOUT;
 }
 
-int
+static int
 gf100_gr_fecs_start_ctxsw(struct nvkm_gr *base)
 {
 	struct gf100_gr *gr = gf100_gr(base);
@@ -756,7 +756,7 @@ gf100_gr_fecs_start_ctxsw(struct nvkm_gr *base)
 	return ret;
 }
 
-int
+static int
 gf100_gr_fecs_stop_ctxsw(struct nvkm_gr *base)
 {
 	struct gf100_gr *gr = gf100_gr(base);
@@ -2067,7 +2067,7 @@ gf100_gr_ = {
 	.ctxsw.inst = gf100_gr_ctxsw_inst,
 };
 
-int
+static int
 gf100_gr_ctor_fw_legacy(struct gf100_gr *gr, const char *fwname,
 			struct gf100_gr_fuc *fuc, int ret)
 {
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
