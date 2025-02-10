Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA19A2F8DA
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AE10E3B4;
	Mon, 10 Feb 2025 19:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PdE02XrA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243C10E601
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sC+CKPivo9nJ2nwAVN+E4SAgEKJPEiCVQrD/mzwcqM=;
 b=PdE02XrAQ0Z3/Ks7U0EExqc5jHg+iXq8xaygP2zD56pBR0wV0Xp9iIJZLOARoAfeLZDwTi
 h8Za3ZPWLahslaLCX/0DTXTI+vBvT1koONkJyptkdL10130Sp+aoYjPXHh90X4coRYib3u
 +Nj62xbcvj14Jd8gYNiHMowR1L6wwAA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-egbQxrHYM1WvxDS47wKzeQ-1; Mon, 10 Feb 2025 14:38:36 -0500
X-MC-Unique: egbQxrHYM1WvxDS47wKzeQ-1
X-Mimecast-MFC-AGG-ID: egbQxrHYM1WvxDS47wKzeQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4394c489babso2566045e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216315; x=1739821115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8sC+CKPivo9nJ2nwAVN+E4SAgEKJPEiCVQrD/mzwcqM=;
 b=ccUxuyC15LBEHNAJc8nRnTIVm2yiKVf/sFBoNg8Jakj30SRtcfJZpL7hcru+MPbCg/
 0A+3G+RDebiw5C2UzVX9LFbyF2nycFkyxV6Xk9ITQGu4Qt+A0HWkpG4tb4eiXST/4J+s
 O8r0VyGCvqgAgXakXjxHPSg7JtbFbYOd2ft21+TId+H61puHMsfZaeutg5ssF+Ebtdsr
 mQpuvCvp6jpOY1BHn/qsZI5ZwgUqOVz8i71aZU4GTC3vVk9qWgWpQ47IWfNx5Pz5h4Q/
 qrCoT5XA9wd+Y3RdYHikQ1Z+Lh7+Tj+dHCCIq4u3235PNnFNDWTsB0B0vWVES/eRp09L
 NUWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuke6csFOpmQ29bINzm8v07qfQ2nd6Lq3lHG+vMLWWBMQZwOuohUuaxwGS11uHQ3mMEuPqNtT6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydxbFj6BshM4NfyCo1QKn3mmc0PgolTbn4dlYhz5b6KzVIJYA5
 r++ODX8b5tLozjh4Tvt/dEja3SrGULd9bogzxkFCbSKdBvbsdchifSTfH2d4104LnT0c46FcUUX
 xPSRaMNjibo4ym2JkNVy9c5+BxYKIAF22IhF2KEUf+a8By85ocqluz81GCu64K8U=
X-Gm-Gg: ASbGnctoX35Dfo20cMT1vRMAVW4JX8vojfO3iHCWZPS7C06B908L3WW2Z4OTHU0Qawo
 HFD6HkpXqaKZkzyOPzaje/NsZvJm3s/LaojK6qWXY2Zk67wQVRncmolMZsrsgP6V6meeDNNCokT
 z5K6+SUt5hZL8eW0BqIE13RDVYb5Rn603txCTigi7NcBGYXZ6s0v18SRL2nEDbUrmte3DggYOKn
 diDnAOH4NHwss+zXKe5z0RMGHFmmq6tR86TFB+nJ+IvRi2ZuMI06N/ea31vV1MYnTCJE0p9pGbN
 6168gK/06bRtB7xxMKhDCsdXthHaM1Vz65ejOxljnRRPtQeRqMCuRpBAQEEcmWgtpw==
X-Received: by 2002:a05:600c:4e91:b0:439:4637:9d9 with SMTP id
 5b1f17b1804b1-43946370d97mr43287285e9.12.1739216315592; 
 Mon, 10 Feb 2025 11:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6B7q2dhfsb9dj8LY+8M1CJU6DFUQTZK7m2VERaPDmly8AB+qIiZRItOcPeyw5uy4LKosd2g==
X-Received: by 2002:a05:600c:4e91:b0:439:4637:9d9 with SMTP id
 5b1f17b1804b1-43946370d97mr43287075e9.12.1739216315147; 
 Mon, 10 Feb 2025 11:38:35 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d94d802sm195260345e9.12.2025.02.10.11.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:33 -0800 (PST)
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
Subject: [PATCH v2 08/17] kernel/events/uprobes: handle device-exclusive
 entries correctly in __replace_page()
Date: Mon, 10 Feb 2025 20:37:50 +0100
Message-ID: <20250210193801.781278-9-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M4aEzB8H8Ml0p4TChA_h5o-pIOPIecMIsk9mNdR0r28_1739216316
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

__replace_page() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, because GUP would never have returned such
folios (conversion to device-private happens by page migration, not
in-place conversion of the PTE).

There is a race between GUP and us locking the folio to look it up
using page_vma_mapped_walk(), so this is likely a fix (unless something
else could prevent that race, but it doesn't look like). pte_pfn() on
something that is not a present pte could give use garbage, and we'd
wrongly mess up the mapcount because it was already adjusted by calling
folio_remove_rmap_pte() when making the entry device-exclusive.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/events/uprobes.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 2ca797cbe465f..cd6105b100325 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -173,6 +173,7 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	DEFINE_FOLIO_VMA_WALK(pvmw, old_folio, vma, addr, 0);
 	int err;
 	struct mmu_notifier_range range;
+	pte_t pte;
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, addr,
 				addr + PAGE_SIZE);
@@ -192,6 +193,16 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	if (!page_vma_mapped_walk(&pvmw))
 		goto unlock;
 	VM_BUG_ON_PAGE(addr != pvmw.address, old_page);
+	pte = ptep_get(pvmw.pte);
+
+	/*
+	 * Handle PFN swap PTES, such as device-exclusive ones, that actually
+	 * map pages: simply trigger GUP again to fix it up.
+	 */
+	if (unlikely(!pte_present(pte))) {
+		page_vma_mapped_walk_done(&pvmw);
+		goto unlock;
+	}
 
 	if (new_page) {
 		folio_get(new_folio);
@@ -206,7 +217,7 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 		inc_mm_counter(mm, MM_ANONPAGES);
 	}
 
-	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
+	flush_cache_page(vma, addr, pte_pfn(pte));
 	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
 		set_pte_at(mm, addr, pvmw.pte,
-- 
2.48.1

