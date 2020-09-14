Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35421269064
	for <lists+nouveau@lfdr.de>; Mon, 14 Sep 2020 17:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF506E507;
	Mon, 14 Sep 2020 15:43:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AAB89DC2
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eBdiOi8NPtkzomu53YzYl2srwsK9DIz9xkGY00o46Kk=; b=mhT31ujOX1b/Ylsrk64JksEtAs
 9CsPlcH5hAWD0aGXvHImC3hCRVvIHTJrcou6cXnGT54zAGvwj93b4D9EhPcRhshY3Bs3eyUJoDDyp
 /nP9B5kyV1bnmLEL7rLke8gT4SbmI5kPok0oRcdYsOzZhnvD9awZgmS7snbozBo6+h50CW3ovdNEQ
 rNvm9WYDfrFebi3DEiL1j7UwRmtNNj8nVOQuwfdDkaun+xRqe4fJEwflFg4tSbH6LwHenuvtKtx+3
 Mi3qOKO7kSBa3khR/+Da8yUmsINC/i/NvEQMvxt0qK0LL1lZ69X5uBkVi4w6Gw41ABUYpEPOn6KWS
 UikZ1UiA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHptG-0001vR-DT; Mon, 14 Sep 2020 14:55:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Mon, 14 Sep 2020 16:44:20 +0200
Message-Id: <20200914144433.1622958-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 14 Sep 2020 15:43:42 +0000
Subject: [Nouveau] [PATCH 04/17] drm/nouveau/gk20a: stop setting
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

DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
configs, so don't set it in this ARM specific driver part.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 985f2990ab0dda..13d4d7ac0697b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -594,8 +594,7 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 
 		nvkm_info(&imem->base.subdev, "using IOMMU\n");
 	} else {
-		imem->attrs = DMA_ATTR_NON_CONSISTENT |
-			      DMA_ATTR_WEAK_ORDERING |
+		imem->attrs = DMA_ATTR_WEAK_ORDERING |
 			      DMA_ATTR_WRITE_COMBINE;
 
 		nvkm_info(&imem->base.subdev, "using DMA API\n");
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
