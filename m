Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C05A2F8D0
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAEE10E3A0;
	Mon, 10 Feb 2025 19:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RqNmGrTJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671E010E3AD
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTNkd4QUaFJn8BXhdNDgA0x2CIZMe/1M0YGUP/Aku4s=;
 b=RqNmGrTJlFDUZVrqYEPbHQP3Q/eS3QQRcZuIxZ8jxbF/XrySbipuM9h9XJUJd4/peHHpy6
 YdRXNdVUeDREHmqVFhR5TWckVDhbG2X7wHJPkDAXiUMnT75qwU6sY90UgQPJ9/rFTE79ie
 YvQOeBtSJ6aw7N3MM7FOxsiIK8JNFUc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-1hGtlej0OLyCry3vr6osGQ-1; Mon, 10 Feb 2025 14:38:21 -0500
X-MC-Unique: 1hGtlej0OLyCry3vr6osGQ-1
X-Mimecast-MFC-AGG-ID: 1hGtlej0OLyCry3vr6osGQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so8286175e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216300; x=1739821100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTNkd4QUaFJn8BXhdNDgA0x2CIZMe/1M0YGUP/Aku4s=;
 b=tO65cDbSvbUAAt7lTA1hwDGJZzADTcGR5lwQRKiaIz7WRWtsC9XRMFCJ1X9X1Mf8gh
 z5Z0ouOXFMtanPe7UvcnL/Nc5xaChPEiA9EpyVfEgIbmNjjqHkWdBjkgEy7/exK8bDvr
 LVnnHgAPIiDTJ0yuRqrHuu2Lsce1vsl/B9ijDi561hPQUfCtf1JRb2sHWJItYm+4F0I9
 gltagPukBuQQh4/lMTAvQ0TWiFWGULdofJIxNtNkkyUSOkdM6+qehHVHeiDUfxoZ0dfL
 xqEwjTb9BisS8QjTaDQ6ElOtbZ4aCPDJlpenE8YZoQwxXjE3QLYHgC6m1BzacFKiw+rN
 Ev2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeQTEJiLT7LrmZcUHrNSDgu2ukjlxH6iThU3mDbLJpIYwnjUu6CrPC/1v+7FpvFcIDF3ISgU98@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi7XZW2E7LDBhSJIYN5TzEKpAsy0/H83QhCtsA6rqybVQoVFzt
 G2zsHQihLr5J7s2ntGloA7E6ckwjUmC1k03exuACZJDB2LYy2tIXo5FbWudkgCC4y4EZaNNNwm8
 4HQgo+ejXmsvGrE7U/Q3gMF+D6ItaaizcvcgTHgNnvIWCXcosK8aMiGLprqF6wG4=
X-Gm-Gg: ASbGncvOlk+tdEuc8PbyC37DZ/4VFO2n1O3fEMuZxM5Bhqfp+CVvpaW27s/8V2OSb0x
 iAT7nPv08/lkIvjfaArNeut1qowgpx9o172g2Kdwnoldl7aZSmcNVDkq5EZj8aU6nkM2rSfDypv
 ojnD89onmrgBC/7ExKhv0Ez2iMR370fn23SYUpIDxXcL90Pw5b1Re7PH9o09b3i/1hreEDmXmMb
 foDz1hfT2ogOaZO7cQHTnQ3hm4lyfM5W5zRa3JiCph2FWOmbKIq5DEbVFE+pM5AMOK7kNNz+OfW
 ZBjLDe9HNyRS2VwN4KiTXJjf/ho2nSSh10DAe8XVvnlK06MeOVpDGuS29IbqqL62hw==
X-Received: by 2002:a05:600c:490f:b0:438:9280:61d5 with SMTP id
 5b1f17b1804b1-4394ceb21e5mr4501815e9.5.1739216299921; 
 Mon, 10 Feb 2025 11:38:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc0kj/uTsAeIklzzlg0/rE3LVYXx2C/9ALcZ7/TUEZYAL5lOHh0P4FpVZlZXUmD9AHXTDheA==
X-Received: by 2002:a05:600c:490f:b0:438:9280:61d5 with SMTP id
 5b1f17b1804b1-4394ceb21e5mr4501495e9.5.1739216299521; 
 Mon, 10 Feb 2025 11:38:19 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dc2f6aeafsm11910943f8f.20.2025.02.10.11.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:19 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 04/17] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
Date: Mon, 10 Feb 2025 20:37:46 +0100
Message-ID: <20250210193801.781278-5-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: En_L1963Y0Xl14eNXRxezp5_eLt_qPxzB9MbfnfvoVw_1739216300
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

We require a writable PTE and only support anonymous folio: we can only
have exactly one PTE pointing at that page, which we can just lookup
using a folio walk, avoiding the rmap walk and the anon VMA lock.

So let's stop doing an rmap walk and perform a folio walk instead, so we
can easily just modify a single PTE and avoid relying on rmap/mapcounts.

We now effectively work on a single PTE instead of multiple PTEs of
a large folio, allowing for conversion of individual PTEs from
non-exclusive to device-exclusive -- note that the opposite direction
always works on single PTEs: restore_exclusive_pte().

With this change, device-exclusive handling is fully compatible with THPs /
large folios. We still require PMD-sized THPs to get PTE-mapped, and
supporting PMD-mapped THP (without the PTE-remapping) is a different
endeavour that might not be worth it at this point: it might even have
negative side-effects [1].

This gets rid of the "folio_mapcount()" usage and let's us fix ordinary
rmap walks (migration/swapout) next. Spell out that messing with the
mapcount is wrong and must be fixed.

[1] https://lkml.kernel.org/r/Z5tI-cOSyzdLjoe_@phenom.ffwll.local

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 200 ++++++++++++++++++------------------------------------
 1 file changed, 67 insertions(+), 133 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7ccf850565d33..0cd2a2d3de00d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2375,131 +2375,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
 }
 
 #ifdef CONFIG_DEVICE_PRIVATE
-struct make_exclusive_args {
-	struct mm_struct *mm;
-	unsigned long address;
-	void *owner;
-	bool valid;
-};
-
-static bool page_make_device_exclusive_one(struct folio *folio,
-		struct vm_area_struct *vma, unsigned long address, void *priv)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
-	struct make_exclusive_args *args = priv;
-	pte_t pteval;
-	struct page *subpage;
-	bool ret = true;
-	struct mmu_notifier_range range;
-	swp_entry_t entry;
-	pte_t swp_pte;
-	pte_t ptent;
-
-	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
-				      vma->vm_mm, address, min(vma->vm_end,
-				      address + folio_size(folio)),
-				      args->owner);
-	mmu_notifier_invalidate_range_start(&range);
-
-	while (page_vma_mapped_walk(&pvmw)) {
-		/* Unexpected PMD-mapped THP? */
-		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
-
-		ptent = ptep_get(pvmw.pte);
-		if (!pte_present(ptent)) {
-			ret = false;
-			page_vma_mapped_walk_done(&pvmw);
-			break;
-		}
-
-		subpage = folio_page(folio,
-				pte_pfn(ptent) - folio_pfn(folio));
-		address = pvmw.address;
-
-		/* Nuke the page table entry. */
-		flush_cache_page(vma, address, pte_pfn(ptent));
-		pteval = ptep_clear_flush(vma, address, pvmw.pte);
-
-		/* Set the dirty flag on the folio now the pte is gone. */
-		if (pte_dirty(pteval))
-			folio_mark_dirty(folio);
-
-		/*
-		 * Check that our target page is still mapped at the expected
-		 * address.
-		 */
-		if (args->mm == mm && args->address == address &&
-		    pte_write(pteval))
-			args->valid = true;
-
-		/*
-		 * Store the pfn of the page in a special migration
-		 * pte. do_swap_page() will wait until the migration
-		 * pte is removed and then restart fault handling.
-		 */
-		if (pte_write(pteval))
-			entry = make_writable_device_exclusive_entry(
-							page_to_pfn(subpage));
-		else
-			entry = make_readable_device_exclusive_entry(
-							page_to_pfn(subpage));
-		swp_pte = swp_entry_to_pte(entry);
-		if (pte_soft_dirty(pteval))
-			swp_pte = pte_swp_mksoft_dirty(swp_pte);
-		if (pte_uffd_wp(pteval))
-			swp_pte = pte_swp_mkuffd_wp(swp_pte);
-
-		set_pte_at(mm, address, pvmw.pte, swp_pte);
-
-		/*
-		 * There is a reference on the page for the swap entry which has
-		 * been removed, so shouldn't take another.
-		 */
-		folio_remove_rmap_pte(folio, subpage, vma);
-	}
-
-	mmu_notifier_invalidate_range_end(&range);
-
-	return ret;
-}
-
-/**
- * folio_make_device_exclusive - Mark the folio exclusively owned by a device.
- * @folio: The folio to replace page table entries for.
- * @mm: The mm_struct where the folio is expected to be mapped.
- * @address: Address where the folio is expected to be mapped.
- * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
- *
- * Tries to remove all the page table entries which are mapping this
- * folio and replace them with special device exclusive swap entries to
- * grant a device exclusive access to the folio.
- *
- * Context: Caller must hold the folio lock.
- * Return: false if the page is still mapped, or if it could not be unmapped
- * from the expected address. Otherwise returns true (success).
- */
-static bool folio_make_device_exclusive(struct folio *folio,
-		struct mm_struct *mm, unsigned long address, void *owner)
-{
-	struct make_exclusive_args args = {
-		.mm = mm,
-		.address = address,
-		.owner = owner,
-		.valid = false,
-	};
-	struct rmap_walk_control rwc = {
-		.rmap_one = page_make_device_exclusive_one,
-		.done = folio_not_mapped,
-		.anon_lock = folio_lock_anon_vma_read,
-		.arg = &args,
-	};
-
-	rmap_walk(folio, &rwc);
-
-	return args.valid && !folio_mapcount(folio);
-}
-
 /**
  * make_device_exclusive() - Mark a page for exclusive use by a device
  * @mm: mm_struct of associated target process
@@ -2541,22 +2416,31 @@ static bool folio_make_device_exclusive(struct folio *folio,
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		void *owner, struct folio **foliop)
 {
-	struct folio *folio;
+	struct mmu_notifier_range range;
+	struct folio *folio, *fw_folio;
+	struct vm_area_struct *vma;
+	struct folio_walk fw;
 	struct page *page;
-	long npages;
+	swp_entry_t entry;
+	pte_t swp_pte;
 
 	mmap_assert_locked(mm);
+	addr = PAGE_ALIGN_DOWN(addr);
 
 	/*
 	 * Fault in the page writable and try to lock it; note that if the
 	 * address would already be marked for exclusive use by a device,
 	 * the GUP call would undo that first by triggering a fault.
+	 *
+	 * If any other device would already map this page exclusively, the
+	 * fault will trigger a conversion to an ordinary
+	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
-	npages = get_user_pages_remote(mm, addr, 1,
-				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
-				       &page, NULL);
-	if (npages != 1)
-		return ERR_PTR(npages);
+	page = get_user_page_vma_remote(mm, addr,
+					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
+					&vma);
+	if (IS_ERR(page))
+		return page;
 	folio = page_folio(page);
 
 	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
@@ -2569,11 +2453,61 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EBUSY);
 	}
 
-	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
+	/*
+	 * Inform secondary MMUs that we are going to convert this PTE to
+	 * device-exclusive, such that they unmap it now. Note that the
+	 * caller must filter this event out to prevent livelocks.
+	 */
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
+				      mm, addr, addr + PAGE_SIZE, owner);
+	mmu_notifier_invalidate_range_start(&range);
+
+	/*
+	 * Let's do a second walk and make sure we still find the same page
+	 * mapped writable. Note that any page of an anonymous folio can
+	 * only be mapped writable using exactly one PTE ("exclusive"), so
+	 * there cannot be other mappings.
+	 */
+	fw_folio = folio_walk_start(&fw, vma, addr, 0);
+	if (fw_folio != folio || fw.page != page ||
+	    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
+		if (fw_folio)
+			folio_walk_end(&fw, vma);
+		mmu_notifier_invalidate_range_end(&range);
 		folio_unlock(folio);
 		folio_put(folio);
 		return ERR_PTR(-EBUSY);
 	}
+
+	/* Nuke the page table entry so we get the uptodate dirty bit. */
+	flush_cache_page(vma, addr, page_to_pfn(page));
+	fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
+
+	/* Set the dirty flag on the folio now the PTE is gone. */
+	if (pte_dirty(fw.pte))
+		folio_mark_dirty(folio);
+
+	/*
+	 * Store the pfn of the page in a special device-exclusive PFN swap PTE.
+	 * do_swap_page() will trigger the conversion back while holding the
+	 * folio lock.
+	 */
+	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
+	swp_pte = swp_entry_to_pte(entry);
+	if (pte_soft_dirty(fw.pte))
+		swp_pte = pte_swp_mksoft_dirty(swp_pte);
+	/* The pte is writable, uffd-wp does not apply. */
+	set_pte_at(mm, addr, fw.ptep, swp_pte);
+
+	/*
+	 * TODO: The device-exclusive PFN swap PTE holds a folio reference but
+	 * does not count as a mapping (mapcount), which is wrong and must be
+	 * fixed, otherwise RMAP walks don't behave as expected.
+	 */
+	folio_remove_rmap_pte(folio, page, vma);
+
+	folio_walk_end(&fw, vma);
+	mmu_notifier_invalidate_range_end(&range);
 	*foliop = folio;
 	return page;
 }
-- 
2.48.1

