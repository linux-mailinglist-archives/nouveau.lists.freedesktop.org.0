Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537E1401AA
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2020 03:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923036F37A;
	Fri, 17 Jan 2020 02:01:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07A6F37A;
 Fri, 17 Jan 2020 02:01:16 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 26CDE1C1F5589BC9F48E;
 Fri, 17 Jan 2020 10:01:13 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 10:01:05 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <wambui.karugax@gmail.com>, <yuehaibing@huawei.com>, <sam@ravnborg.org>
Date: Fri, 17 Jan 2020 10:01:02 +0800
Message-ID: <20200117020102.56636-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Subject: [Nouveau] [PATCH -next] drm/nv04/disp: remove set but not used
 variable 'width'
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

drivers/gpu/drm/nouveau/dispnv04/arb.c: In function nv04_calc_arb:
drivers/gpu/drm/nouveau/dispnv04/arb.c:56:21: warning:
 variable width set but not used [-Wunused-but-set-variable]

'width' is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index f607a04..9d4a2d9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -53,7 +53,7 @@ struct nv_sim_state {
 static void
 nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
-	int pagemiss, cas, width, bpp;
+	int pagemiss, cas, bpp;
 	int nvclks, mclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
 	int mclk_freq, pclk_freq, nvclk_freq;
@@ -65,7 +65,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	nvclk_freq = arb->nvclk_khz;
 	pagemiss = arb->mem_page_miss;
 	cas = arb->mem_latency;
-	width = arb->memory_width >> 6;
 	bpp = arb->bpp;
 	cbs = 128;
 
-- 
2.7.4


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
