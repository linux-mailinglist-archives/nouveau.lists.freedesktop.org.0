Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3126B9EB
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EDD6E95B;
	Wed, 16 Sep 2020 02:22:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8116E11B
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eona0AYiSh/znPkSOpw3Nw8CD1xNwL4V1h0yfTAB4Hk=; b=Wsus/ivqm8grfYeSP6z68xdX1x
 /cIm0jtfGbhk+VmVtqSQ/iY5d+5djYDyuxa98INla0l2ETi1N1/0w3Ed/q3rtAKOzQ3uqj19Eys1O
 +6nIyWduDpAErX2tZFPICqd6V05JwBWMeGOCnu6ggpHA8J1vk4TnT/p8eBFTfM5QUctfAAYPHJkgk
 5jWuDY2Vb2n+Cu977sssSRrWhpE1cTmcpeCYbGl08RhkwlS2gldOQ+gcQVR3AT//4wh6UZmOTq9nY
 mGq2nXZFdSXvf0xLyK6EEBxoSCZuO0CLFHLLqiBlPkIg92/ahUA3uyJSYhU6hc5HQjGFSIktXN22R
 m3mk/5qQ==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDNH-0003mr-4Y; Tue, 15 Sep 2020 16:00:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Tue, 15 Sep 2020 17:51:07 +0200
Message-Id: <20200915155122.1768241-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: [Nouveau] [PATCH 03/18] drm/exynos: stop setting
 DMA_ATTR_NON_CONSISTENT
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

DMA_ATTR_NON_CONSISTENT is a no-op except on PA-RISC and a few MIPS
configs, so don't set it in this ARM specific driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index efa476858db54b..07073222b8f691 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -42,8 +42,6 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (exynos_gem->flags & EXYNOS_BO_WC ||
 			!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
 		attr |= DMA_ATTR_WRITE_COMBINE;
-	else
-		attr |= DMA_ATTR_NON_CONSISTENT;
 
 	/* FBDev emulation requires kernel mapping */
 	if (!kvmap)
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
