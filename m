Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66672A2F8E9
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0210E60C;
	Mon, 10 Feb 2025 19:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KnvVN5IM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F1C10E60C
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwHnciP+OvnJG9alUSG9/jEypyVF3ZPTXQLV9dVcfyg=;
 b=KnvVN5IMxtkcDDowFZqh8kQ42q8NrSJE/w9c6lx64bRs/ftMieqW5Fku5dXR6/AXHzliy9
 g8GFOHvit0FYelXwJteVtcIbv8VG8gbgbzJMAmyu9Slv+QzYhyRU55gGdwfpvPdDO1MhfU
 zksoefqjEMs0O5gRtjGL4O9R67iDvvY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-To97hXcjPvKf3UJaFwMSTw-1; Mon, 10 Feb 2025 14:38:55 -0500
X-MC-Unique: To97hXcjPvKf3UJaFwMSTw-1
X-Mimecast-MFC-AGG-ID: To97hXcjPvKf3UJaFwMSTw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dc709f938so1785924f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216334; x=1739821134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwHnciP+OvnJG9alUSG9/jEypyVF3ZPTXQLV9dVcfyg=;
 b=DaJsgUI6VBBUkRw5/KdHzNIOn67JoF6KhXv16K0FOo4U0k8PQQIYlF+ITn8yU0j3Mj
 l/OZ2eb3IrIuf3jiwV2A30VfG5FS/b9b9dnHIK0UWgF6fkO11XzFzfIKJ+02ebHSuqNS
 RbI1F3mW6ZeaTIEjk3kAmP7DHoE8FaNKIXQvfI2ilGHXNEx8qkCz6fMGgwh1J2TBtJWf
 IN2LB325es9sr3TyRvPTYHM1/3ttS8LbugqoxOtsSoQjpagNeH5L5MualjxiUhdPQA5F
 PB0QbKT2gXHxbs/ZDLI/4sHZfUAXRBkIjVHQWNLtYyJ8acwSTZemC4gPLSscro9bl2pn
 Af2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOk0dDR/InDOKdMCNWQxBUpez27UNI3wM5fJF36D1ZAjAcArNL272h5IMJ2YDDt+oWmWVSr5Fe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZkeXT9s3AtAko2jrpPIh1Aw0UGrKBwW5MKWZ1A9A5MYngjCB3
 3pD0V4uN/+o1W6Zq+PAH0yKkoVKqPvtky5nAxfgn9FKB2MnWXs0CQ++ck1KP0G1QT5XOmxGx+Jx
 4M3fhKzD2dd7yKodFjCKwf+carEcLom9cT/y5B2KeMoDXpeE2yqfFE8tUemZcnJc=
X-Gm-Gg: ASbGncunY4/pzXOyU6W/B0JK+UIzvAKSfRl1bQjqFpL6j2YElZOr5H6B/kiClb6xsu9
 b6mz2xp4QBaC9oeSPKXN7aba4ZltXWsDp2O/bF5iTcq9WOC4Bl3gkeeJPf1md8jC9I7m0nILuUl
 QH5auDLHs9c+MqY1+SrkwsifKW5d+GG/rA4r2mpiOL/dNZPPAHfwS5ImuWzS67m6sfcM5CISfIQ
 x9qRYVWBgaTdiScZcN8JFO2b6++aehPGiZm1n0cqax6gWb0Rj2Rwzi1/75W0TYCojPr3X60X4I+
 j2dI/UVwUgUM1M5qHYsNpLxC06QnUUu7Oh4tcQUdbENhKBG+6vJHc3PBzwoMUS2ycQ==
X-Received: by 2002:a5d:5f42:0:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38de432d90fmr568622f8f.0.1739216333908; 
 Mon, 10 Feb 2025 11:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ8jI3Pr0PhgIrX5XFi88nBpwoaMc1TLFqexlyUt/iDFsCN9k6Hzlrlovdfu0/+3mYproMTQ==
X-Received: by 2002:a5d:5f42:0:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38de432d90fmr568579f8f.0.1739216333460; 
 Mon, 10 Feb 2025 11:38:53 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390db11200sm187831345e9.38.2025.02.10.11.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:52 -0800 (PST)
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
Subject: [PATCH v2 13/17] mm/page_idle: handle device-exclusive entries
 correctly in page_idle_clear_pte_refs_one()
Date: Mon, 10 Feb 2025 20:37:55 +0100
Message-ID: <20250210193801.781278-14-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IZYx2DZ-ukwix-Qty2fA_9BzCg1T6k6ACWEHYNYOU20_1739216334
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

page_idle_clear_pte_refs_one() is not prepared for that, so let's
teach it what to do with these PFN swap PTEs. Note that device-private
entries are so far not applicable on that path, as page_idle_get_folio()
filters out non-lru folios.

Should we just skip PFN swap PTEs completely? Possible, but it seems
straight forward to just handle them correctly.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_idle.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/page_idle.c b/mm/page_idle.c
index 947c7c7a37289..408aaf29a3ea6 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -62,9 +62,14 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
 			/*
 			 * For PTE-mapped THP, one sub page is referenced,
 			 * the whole THP is referenced.
+			 *
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are "old" from a CPU perspective.
+			 * The MMU notifier takes care of any device aspects.
 			 */
-			if (ptep_clear_young_notify(vma, addr, pvmw.pte))
-				referenced = true;
+			if (likely(pte_present(ptep_get(pvmw.pte))))
+				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
+			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
 				referenced = true;
-- 
2.48.1

