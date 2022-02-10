Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E764B0709
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37610E742;
	Thu, 10 Feb 2022 07:29:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCE310E742;
 Thu, 10 Feb 2022 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wCdTPi8sABXHaeJsId/JTSLi+c8Rwwiec5m8oAEznlg=; b=0e+HFPbe1yvFskke6QJO8jYN43
 BL27P4rhMpZrOyRnm/Q2IFdFK02AdjcEHuLHbNOgqaLpJ3k/+8sdPvBcS5BMSWbYwm818f8/pHJQ9
 N6oYv7ggwmp8pNG9UCE+nV9x3jkbmqJnBv5FDZzSl++H9pOEAFWok4hWRhxOgmkhE64XUtmaenhWA
 Lh/ETXt+Tg9Ly39G8h9Zs+lMnNyI8iCH6l06TLjGId++3ApOcROW1jra68QUFiTSPijOLQlJqTfYy
 PPFccOKbpQRr0/fwy/8IDnvxqIcU/bJJQOB6XJcncTYxCVdGbrUPwCTMYwjK/GOD7R6PdxZnOrdmu
 srX0uIbw==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3t0-002ryS-8V; Thu, 10 Feb 2022 07:29:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:12 +0100
Message-Id: <20220210072828.2930359-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 11/27] mm: refactor the ZONE_DEVICE handling in
 migrate_vma_insert_page
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

Make the flow a little more clear and prepare for adding a new
ZONE_DEVICE memory type.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8e0370a73f8a43..30ecd7223656c1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2670,26 +2670,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	 */
 	__SetPageUptodate(page);
 
-	if (is_zone_device_page(page)) {
-		if (is_device_private_page(page)) {
-			swp_entry_t swp_entry;
+	if (is_device_private_page(page)) {
+		swp_entry_t swp_entry;
 
-			if (vma->vm_flags & VM_WRITE)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page));
-			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page));
-			entry = swp_entry_to_pte(swp_entry);
-		} else {
-			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
-			 */
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pte(swp_entry);
+	} else {
+		/*
+		 * For now we only support migrating to un-addressable device
+		 * memory.
+		 */
+		if (is_zone_device_page(page)) {
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
 		}
-	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
 		if (vma->vm_flags & VM_WRITE)
 			entry = pte_mkwrite(pte_mkdirty(entry));
-- 
2.30.2

