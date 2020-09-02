Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428AF25B246
	for <lists+nouveau@lfdr.de>; Wed,  2 Sep 2020 18:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722946E945;
	Wed,  2 Sep 2020 16:58:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54936E945
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 16:58:36 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4fcf2e0007>; Wed, 02 Sep 2020 09:58:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 02 Sep 2020 09:58:36 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 02 Sep 2020 09:58:36 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 16:58:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Sep 2020 16:58:36 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4fcf3b0008>; Wed, 02 Sep 2020 09:58:35 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 2 Sep 2020 09:58:27 -0700
Message-ID: <20200902165830.5367-5-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902165830.5367-1-rcampbell@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599065902; bh=dCUG4bgoirMBpflmLrJ/KTpD+YYMqXcLGdeB9eDElwI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=KgNXIWa3dydD1nLyndFPRgAwTpSS68S4NpUGGnPi7ujNiD91ehwvZsyZD/0jz+4FA
 iX1NV+ruzovygBPJ79a26Rs2/2C8ZHxtJydBAPRP/dnuu3laLhj82eD/EVPPjiZ5i5
 YrQdfEi5kigizcy4XEQJGLOtdfkL5HBOIWQqzTkghKpItTrIr99wyWQvkH0gPnTtFJ
 YXcb42pfLnVkW7K6m4Ax7whpLi3UuWz2kUQywfECGuRu1k4YBBfBbOrXJGIFsZAVXy
 yO6H+5VJUpRE03ysemZLSBxym/Ix/iz6W7Ja1aLqFI37HWwl3sSHZNzWURfCf3Kefc
 +jxpQacNGDvaQ==
Subject: [Nouveau] [PATCH v2 4/7] mm/thp: add
 prep_transhuge_device_private_page()
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add a helper function to allow device drivers to create device private
transparent huge pages. This is intended to help support device private
THP migrations.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/huge_mm.h | 5 +++++
 mm/huge_memory.c        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 87b42c81dedc..126e54da4fee 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -187,6 +187,7 @@ extern unsigned long thp_get_unmapped_area(struct file *filp,
 		unsigned long flags);
 
 extern void prep_transhuge_page(struct page *page);
+extern void prep_transhuge_device_private_page(struct page *page);
 extern void free_transhuge_page(struct page *page);
 bool is_transparent_hugepage(struct page *page);
 
@@ -382,6 +383,10 @@ static inline bool transhuge_vma_suitable(struct vm_area_struct *vma,
 
 static inline void prep_transhuge_page(struct page *page) {}
 
+static inline void prep_transhuge_device_private_page(struct page *page)
+{
+}
+
 static inline bool is_transparent_hugepage(struct page *page)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a8d48994481a..1e848cc0c3dc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -498,6 +498,14 @@ void prep_transhuge_page(struct page *page)
 	set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
 }
 
+void prep_transhuge_device_private_page(struct page *page)
+{
+	prep_compound_page(page, HPAGE_PMD_ORDER);
+	prep_transhuge_page(page);
+	percpu_ref_put_many(page->pgmap->ref, HPAGE_PMD_NR - 1);
+}
+EXPORT_SYMBOL_GPL(prep_transhuge_device_private_page);
+
 bool is_transparent_hugepage(struct page *page)
 {
 	if (!PageCompound(page))
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
