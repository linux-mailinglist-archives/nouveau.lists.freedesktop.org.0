Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070C4B070C
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E5910E75E;
	Thu, 10 Feb 2022 07:29:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8E10E74C;
 Thu, 10 Feb 2022 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JF4vxivs61H3BQ2kwEvqaObshMiGuhjwB0Vb6uVLhnQ=; b=pWH9G4R3FuFCi6BPR8Aydszuy2
 aVX1hsx3Q4Yx3NId7eCffi0fH+/Us5qYuZbEIvHJuojBPQx8fv7FveMHHGPrJB5WwM/STvQ99GSd9
 fsMGwLYVaj6y59WU64LRi7qS5ePWSiHI739n4y/4nQGRH4J+6Q1M8gNgQnFUkeD5Hz88KXRMsN6GZ
 AiXORMzot//UeikmdcFwmLXTc+dZb3uY7Q1fD9N/UlSAFzo56Xg8a319X3Iixge9JDzj3UN04L+O+
 /wahWZFtx/GqzxDHceLTJRONLXZYBZ39iI+ESHxbRxCmRpNQAwJ2xKTKPn+MfOfrLiTL/8mO3nDKn
 rSsF4MkQ==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3t8-002s3W-TU; Thu, 10 Feb 2022 07:29:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:15 +0100
Message-Id: <20220210072828.2930359-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 14/27] mm: build migrate_vma_* for all configs
 with ZONE_DEVICE support
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This code will be used for device coherent memory as well in a bit,
so relax the ifdef a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 6391d8d3a616f3..95d4aa3acaefe0 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -250,7 +250,7 @@ config MIGRATION
 	  allocation instead of reclaiming.
 
 config DEVICE_MIGRATION
-	def_bool MIGRATION && DEVICE_PRIVATE
+	def_bool MIGRATION && ZONE_DEVICE
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
-- 
2.30.2

