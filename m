Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19365A21CAC
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17BF10E7D1;
	Wed, 29 Jan 2025 11:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hIpLnsqD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E609F10E7D1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
 b=hIpLnsqD5RbDU8gw0WGmPPyfiIak/MxLjmueg0GlNudyinRIKdeyXdoeBzP8T/S5FY8jRP
 bsk7YaIEj60jfF+hUeWx/lHDtFZjuc030VsLFF4s3IzrLB28o660Wgey2nxtDQrMJEcZYN
 SbDZWpLXGxYPz/D491Io2+TH7dvuSfc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-6-ngW_SHMnS7S-ddvFXBdA-1; Wed, 29 Jan 2025 06:54:50 -0500
X-MC-Unique: 6-ngW_SHMnS7S-ddvFXBdA-1
X-Mimecast-MFC-AGG-ID: 6-ngW_SHMnS7S-ddvFXBdA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38a684a096eso3012919f8f.2
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151689; x=1738756489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
 b=BeHP2vJSvNJd+ZVQ+ru08Oa+LfVWXBd6ZT3Kd4IuaoyUC/tNBVBA2X2mT/GEISpFMB
 nlhsrv0WfIZ5ENFr4L6NbRYpLT9lVMdcRhEy3eL9sa2/gXg1hOjLnchKStHqBbSXVht0
 yfGNgyCBXc15hxJPBxkqBawLxo1/Si96nZuKF0L24owN1Mf7oMI7SSipteWDE+o//U6f
 CqTsXY4+KFEwtu5dwCTJrUKJUu0DbNZ9et/xW4KeZab5Y5pYZ3J9mHIKWj7/YfaY8fzh
 LMgvLkmtyg+1eFLThtJSocIYPr5qAvzwPQ1MrDjOCS+DuXkauRgb7z2LWeoecBAlpK1Q
 sZ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+gs9BUdLJzj3MZV3bN7cHKn93EpgCuXlPTtXyO8Es4TDy/fxPWUwR5jmvenS+OB/wi4Sk4rc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWzVWdlJLrOfefSwlkNLy/mrZF7zj9YlANBGfmTD4ymWSrKmSj
 vbKf7XQytgucV80MGBSYZR37LD+B6Cln8Lg0eFmdJCLD832xtFLZEGUnjaH1MPOxejkdyDd0jUc
 jkgKZTOesVi+RuKI5ZHnQlf5sHJgEgV2JMQEasqxA5MZ0Raqo3+hl91nhoDoyynY=
X-Gm-Gg: ASbGnct4t4F8LPZ/PqGxFhvz3zOm3Rc9MYlf7AEesyO5sx5alRIfAlNCEx7c0NAYF8k
 eNRZiIZ7+Zi4ljT7cpWjXzBvbN2y1yrjKkbNBXv2QO+AF2/2NQlNZsVP7jcVqsq3WMXddK+OyKT
 SPuJ762zvU5XQbypV0a7rzvC+1sf1bOHRWtRWujNR7JMaQ8FIc6tGFpae4Lkx9rbAhWtgF1KaT9
 1idj2EjSLUtA0SyOy4VFBK1uEkCeoVKWi/GYnlNGxIMMxtJaVyyMMmKpX/MJhCRWy6hXL/9n9Ne
 +wtvBAClokZwHPub6JdDH93JTH53XdVlc4i8uXwm9v3apTqOrpmWX7/PUu5VvvTziQ==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38c520bdb45mr1846653f8f.46.1738151688836; 
 Wed, 29 Jan 2025 03:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQObdLJ4S/sxdMO/dY9vI6fd5p4fQOJgmwgX26yitgXbCNTkIYH7aPDZgCkfY36quLJ2o2xA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38c520bdb45mr1846636f8f.46.1738151688502; 
 Wed, 29 Jan 2025 03:54:48 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1c4006sm17020800f8f.94.2025.01.29.03.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:47 -0800 (PST)
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
Subject: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Date: Wed, 29 Jan 2025 12:54:10 +0100
Message-ID: <20250129115411.2077152-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PMIzPoPfLfPhavRxx6bh0OqIrx9Cdtb6nGX3wdKMXGs_1738151689
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

Now that conversion to device-exclusive does no longer perform an
rmap walk and the main page_vma_mapped_walk() users were taught to
properly handle nonswap entries, let's treat device-exclusive entries just
as if they would be present, similar to how we handle device-private
entries already.

This fixes swapout/migration of folios with device-exclusive entries.

Likely there are still some page_vma_mapped_walk() callers that are not
fully prepared for these entries, and where we simply want to refuse
!pte_present() entries. They have to be fixed independently; the ones in
mm/rmap.c are prepared.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 17 +----------------
 mm/rmap.c   |  7 -------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index db38d6ae4e74..cd689cd8a7c8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-
-	/*
-	 * No need to take a page reference as one was already
-	 * created when the swap entry was made.
-	 */
-	if (folio_test_anon(folio))
-		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
-	else
-		/*
-		 * Currently device exclusive access only supports anonymous
-		 * memory so the entry shouldn't point to a filebacked page.
-		 */
-		WARN_ON_ONCE(1);
-
 	set_pte_at(vma->vm_mm, address, ptep, pte);
 
 	/*
@@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
 		 */
 		WARN_ON_ONCE(!vma_is_anonymous(vma));
 		rss[mm_counter(folio)]--;
-		if (is_device_private_entry(entry))
-			folio_remove_rmap_pte(folio, page, vma);
+		folio_remove_rmap_pte(folio, page, vma);
 		folio_put(folio);
 	} else if (!non_swap_entry(entry)) {
 		/* Genuine swap entries, hence a private anon pages */
diff --git a/mm/rmap.c b/mm/rmap.c
index 9e2002d97d6f..4acc9f6d743a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	/* The pte is writable, uffd-wp does not apply. */
 	set_pte_at(mm, addr, fw.ptep, swp_pte);
 
-	/*
-	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
-	 * does not count as a mapping (mapcount), which is wrong and must be
-	 * fixed, otherwise RMAP walks don't behave as expected.
-	 */
-	folio_remove_rmap_pte(folio, page, vma);
-
 	folio_walk_end(&fw, vma);
 	*foliop = folio;
 	return page;
-- 
2.48.1

