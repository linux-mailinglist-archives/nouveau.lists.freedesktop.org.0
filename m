Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E219A21CD3
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1D510E7D5;
	Wed, 29 Jan 2025 11:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AUfGPf6b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372A10E7DA
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
 b=AUfGPf6b3rHxYlgicVPzaQFk6ENa9AGqO/Z5gQPByNknmJbJBzywyyI02hCyAa13dmVie7
 /nsTIxTRoQql2F/LUg2uOAn0HD4szoFxY1syboP904XOulbXhUUUBE5Knz2HcRjS3O2Fth
 tESeuMEMNzKErlIRXGfJfm0io6lg79A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-ks5Vv8WtPTqxeWuslzXZpQ-1; Wed, 29 Jan 2025 06:58:17 -0500
X-MC-Unique: ks5Vv8WtPTqxeWuslzXZpQ-1
X-Mimecast-MFC-AGG-ID: ks5Vv8WtPTqxeWuslzXZpQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so4683894f8f.1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151896; x=1738756696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
 b=NTc/UEiuMU2jC7FGkJvG3IFTprc14J3tuxiVwszOLeJF1IlxKrCdiUfP2pn9kyUuKH
 KQNIzfQhbKxnCIhlmKi7sN1U/PeS6xMPplVjduBOMd3sXpqUxqxkBF4soUR14v0tlsKm
 C9zDw5DbLMf34dlPdhiGx1JjHwByXWBPiLY1VZylLKz4M9LmZUSa98KVktirW6U5eaP5
 ATUM0u8bvxG2J+SQDiJvlqTgNxMrYL9m5dazl0ikKsvj7vGHnSw/e8AYBrISwo0qZYtF
 /gBNMssB6tr2J9njX6Sd/YW3TF1Ia2GsM9zv1UGtMyzoGDAS9iIgbi4/PW4ARZcRShdX
 kZjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3sArcDFBBuVzobUHb/asunFAvXksMO3KJdNxE1e5ahj3b+Zh4EKVw4mJt3XTwN6xQVgbaJJU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEMWtBIw83Am1pmGWfMJuCz3NvIvVZvqZbbK87JUWrZtoOA2/2
 myXhlRtU9homtWqLC4PtpE16sOzxa/r4rF7k3bbO6UfW0O9viFA4OFAJUTUATFPuyRTBjKAC3ZS
 FvB6YY+B2dDcwI5/mtxFs2lG/7swzinEKciSK6CBbmK3EvmofgqtI8X5jGOrgBVM=
X-Gm-Gg: ASbGncugqQNGXKU1WT+3SJdW4jaqO1izQr6N2fhfDkoX+im/oI/ukjuuLVGtmS0pQzo
 mLARoU3PDZsTeaVXWl5VX34QTmnSDxhcNiPvNnrSwJwp2FLeejdLKFW/e9cF2Ql7MZ4oL82kStu
 X6bYPknp+82U2/Vx+6NQ9/35bKAgGnOfytqUrUPnpP82b5jAGpvpBXUcCCYcAPJj69bwi+cWIuw
 DdEmuE3s2/s6uoWLPGfAR4ZmHdmHF1J8ZyxM/9SBDUxjgRkoP+8I+nBSzq2biFKIPBPEuVht7rk
 SvwvIIug59FQ+uTo1kD2G+7TsEJ3uwLIx5IwO1bW0egQpLDRbyeJkXHGNlYUVVH3jA==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id
 ffacd0b85a97d-38c52096289mr2025160f8f.54.1738151895830; 
 Wed, 29 Jan 2025 03:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEON5WkoaxoRH3qtkNX0vn2oqksdlJtc4nZs+NotAXeIJk4vQvUCQu3rl+CihtRV9gH+gpH8w==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id
 ffacd0b85a97d-38c52096289mr2025126f8f.54.1738151895421; 
 Wed, 29 Jan 2025 03:58:15 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1764e9sm17070487f8f.17.2025.01.29.03.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:14 -0800 (PST)
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
Subject: [PATCH v1 3/4] mm/memory: pass folio and pte to
 restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:01 +0100
Message-ID: <20250129115803.2084769-4-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sZL9ocSgHeniqpPLHJACtIagay1cGWYfuyBlDChJmIE_1738151896
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

Let's pass the folio and the pte to restore_exclusive_pte(), so we
can avoid repeated page_folio() and ptep_get(). To do that,
pass the pte to try_restore_exclusive_pte() and use a folio in there
already.

While at it, just avoid the "swp_entry_t entry" variable in
try_restore_exclusive_pte() and add a folio-locked check to
restore_exclusive_pte().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index cd689cd8a7c8..46956994aaff 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -719,14 +719,13 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 #endif
 
 static void restore_exclusive_pte(struct vm_area_struct *vma,
-				  struct page *page, unsigned long address,
-				  pte_t *ptep)
+		struct folio *folio, struct page *page, unsigned long address,
+		pte_t *ptep, pte_t orig_pte)
 {
-	struct folio *folio = page_folio(page);
-	pte_t orig_pte;
 	pte_t pte;
 
-	orig_pte = ptep_get(ptep);
+	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
@@ -756,16 +755,15 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
  * Tries to restore an exclusive pte if the page lock can be acquired without
  * sleeping.
  */
-static int
-try_restore_exclusive_pte(pte_t *src_pte, struct vm_area_struct *vma,
-			unsigned long addr)
+static int try_restore_exclusive_pte(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, pte_t orig_pte)
 {
-	swp_entry_t entry = pte_to_swp_entry(ptep_get(src_pte));
-	struct page *page = pfn_swap_entry_to_page(entry);
+	struct page *page = pfn_swap_entry_to_page(pte_to_swp_entry(orig_pte));
+	struct folio *folio = page_folio(page);
 
-	if (trylock_page(page)) {
-		restore_exclusive_pte(vma, page, addr, src_pte);
-		unlock_page(page);
+	if (folio_trylock(folio)) {
+		restore_exclusive_pte(vma, folio, page, addr, ptep, orig_pte);
+		folio_unlock(folio);
 		return 0;
 	}
 
@@ -871,7 +869,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 * (ie. COW) mappings.
 		 */
 		VM_BUG_ON(!is_cow_mapping(src_vma->vm_flags));
-		if (try_restore_exclusive_pte(src_pte, src_vma, addr))
+		if (try_restore_exclusive_pte(src_vma, addr, src_pte, orig_pte))
 			return -EBUSY;
 		return -ENOENT;
 	} else if (is_pte_marker_entry(entry)) {
@@ -3979,7 +3977,8 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 				&vmf->ptl);
 	if (likely(vmf->pte && pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
-		restore_exclusive_pte(vma, vmf->page, vmf->address, vmf->pte);
+		restore_exclusive_pte(vma, folio, vmf->page, vmf->address,
+				      vmf->pte, vmf->orig_pte);
 
 	if (vmf->pte)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
-- 
2.48.1

