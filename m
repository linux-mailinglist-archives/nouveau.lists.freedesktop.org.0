Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B3A21C98
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283D10E7C3;
	Wed, 29 Jan 2025 11:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zpb216Np";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2A10E7C3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttFA6KXnCKLshNnRCUvMdxdw/LdWUHfs73bnazzKqOM=;
 b=Zpb216NpH/sUU2pg2OhcpVWgpR/MPjBbgHOTVyNPeSKx7XzRG8NdhPUjIklayJ8tNTMpo2
 RBX5buQC2xWiqXw59gEfQX+xhN6gacARjUA1FfrqIWpvYWvFhzmz84TjChpyy3kIJT2sgA
 H/UV0Ge71Ex1+gDX+/+HhXH3dIyo0HE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-xGIo_XUhO4uHFB7jMwnUNg-1; Wed, 29 Jan 2025 06:54:27 -0500
X-MC-Unique: xGIo_XUhO4uHFB7jMwnUNg-1
X-Mimecast-MFC-AGG-ID: xGIo_XUhO4uHFB7jMwnUNg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862a49fbdaso2427767f8f.1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151666; x=1738756466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ttFA6KXnCKLshNnRCUvMdxdw/LdWUHfs73bnazzKqOM=;
 b=u7ndt0bxBi8wVcO+fnikYFsjNF4I8QN3stqAdqY5pO93DDtagfyeYlkMD/PfEkkPFK
 i4Ypj4xHn37crzy0hQKA81uxK7ZV9hIlxthvrcWIEtvS6MFyXL/HW2FF0bCqa61nnRx+
 nCG3P/bs7LlIOrYWWQDCARaOOqzbdBzxY1j7f7pCF2l+GG3Vm7wMuUU32L8L09uFRXTT
 WOP8PJSu4WwL+BZEkqt1OiFhGFS3L1g1309xF1cW+Yr+SeztnMj7NE1u76ouy5OzCzAF
 k8iIo/gnXiDDadfDC4xVduynoYbNcVRBznr+f7VnVcBZ8GGU7kcKzV9vsn+JXVK4nWV5
 I1Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJFdQGr3SuO8BXw7c5ommLd5TlCfMGMlfjsxbWkF3wIEttjHk/qDb2bt1+FE6Ikl2BRVAZ1H6a@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDVfqRoL5gw6nege5Jr4xzhwm1GQTyhD3I/QAy2ZLNKRWxhhub
 +V3nHVFK2+pLyYDaAVCxYjI5Rg0yUfS6fMcmDKUU+1Fhip9QE5XDH4p1AMWBlP2YkRLyeGlkXNh
 qWu8FaNOZNILNSG8PaShQV37nMHm8hrYcHK3FiwccGTK1b+nh+cuvA9vmp7oom6g=
X-Gm-Gg: ASbGncs/ZZXL98vv3x8PaTW1D+uS07oRu2ah2nyuRvwv8Qqae7lR6//bTufuYDqjZbp
 /3jUJC+eS4bVLvFwHjLA7o8QVHGV2diEfDSO3bRqg4NrTFvdY+QHWKbJifFRynfoYxN+9UYg2mR
 lZImpaLzxVhH1xy5SbI7mjEGDPq4xbNYo+vxBFXe6o8AqOZ4QZ5zUJ1Q+CQWI8GPzeopJsdOfOE
 IQjwJCYdI3lWVUIcUsu/hbf/J7GPe0sOn5dyFBqo9uBfK0m4fX4naTHiUyszUOsVCUftjaivd4Y
 XX+peALEsme+Qs+dnFtBOjNKH070qjCS7aYoALC23T+68P/PpQWRlxR1TdW3tDj1JA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id
 ffacd0b85a97d-38c520b7c7fmr2019773f8f.46.1738151666560; 
 Wed, 29 Jan 2025 03:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExNZpiTenD6CJ57erMOTnO5s4zsyHNUaMa/bCtN9QyTRZVkdeAROPCHCw+IAs2gC6Ff7tvTA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id
 ffacd0b85a97d-38c520b7c7fmr2019743f8f.46.1738151666064; 
 Wed, 29 Jan 2025 03:54:26 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bb0besm17079668f8f.79.2025.01.29.03.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:25 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
Date: Wed, 29 Jan 2025 12:54:02 +0100
Message-ID: <20250129115411.2077152-5-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DXiZX9nr-JHrXdbPcJpCAW8fJIpp6EMJZKOgGnQfPrQ_1738151667
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
non-exclusive to device-exclusive -- note that the other way always
worked on single PTEs.

We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
that is not required: GUP will already take care of the
MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
entry) when not finding a present PTE and having to trigger a fault and
ending up in remove_device_exclusive_entry(). Note that the PTE is
always writable, and we can always create a writable-device-exclusive
entry.

With this change, device-exclusive is fully compatible with THPs /
large folios. We still require PMD-sized THPs to get PTE-mapped, and
supporting PMD-mapped THP (without the PTE-remapping) is a different
endeavour that might not be worth it at this point.

This gets rid of the "folio_mapcount()" usage and let's us fix ordinary
rmap walks (migration/swapout) next. Spell out that messing with the
mapcount is wrong and must be fixed.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 188 ++++++++++++++++--------------------------------------
 1 file changed, 55 insertions(+), 133 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 676df4fba5b0..49ffac6d27f8 100644
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
  * make_device_exclusive() - Mark an address for exclusive use by a device
  * @mm: mm_struct of associated target process
@@ -2530,9 +2405,12 @@ static bool folio_make_device_exclusive(struct folio *folio,
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		void *owner, struct folio **foliop)
 {
-	struct folio *folio;
+	struct folio *folio, *fw_folio;
+	struct vm_area_struct *vma;
+	struct folio_walk fw;
 	struct page *page;
-	long npages;
+	swp_entry_t entry;
+	pte_t swp_pte;
 
 	mmap_assert_locked(mm);
 
@@ -2540,12 +2418,16 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * Fault in the page writable and try to lock it; note that if the
 	 * address would already be marked for exclusive use by the device,
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
@@ -2558,11 +2440,51 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EBUSY);
 	}
 
-	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
+	/*
+	 * Let's do a second walk and make sure we still find the same page
+	 * mapped writable. If we don't find what we expect, we will trigger
+	 * GUP again to fix it up. Note that a page of an anonymous folio can
+	 * only be mapped writable using exactly one page table mapping
+	 * ("exclusive"), so there cannot be other mappings.
+	 */
+	fw_folio = folio_walk_start(&fw, vma, addr, 0);
+	if (fw_folio != folio || fw.page != page ||
+	    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
+		if (fw_folio)
+			folio_walk_end(&fw, vma);
 		folio_unlock(folio);
 		folio_put(folio);
 		return ERR_PTR(-EBUSY);
 	}
+
+	/* Nuke the page table entry so we get the uptodate dirty bit. */
+	flush_cache_page(vma, addr, page_to_pfn(page));
+	fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
+
+	/* Set the dirty flag on the folio now the pte is gone. */
+	if (pte_dirty(fw.pte))
+		folio_mark_dirty(folio);
+
+	/*
+	 * Store the pfn of the page in a special device-exclusive non-swap pte.
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
+	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
+	 * does not count as a mapping (mapcount), which is wrong and must be
+	 * fixed, otherwise RMAP walks don't behave as expected.
+	 */
+	folio_remove_rmap_pte(folio, page, vma);
+
+	folio_walk_end(&fw, vma);
 	*foliop = folio;
 	return page;
 }
-- 
2.48.1

