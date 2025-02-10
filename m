Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADFA2F8D5
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2F10E5FF;
	Mon, 10 Feb 2025 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N4xEI4HK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107DC10E3B4
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
 b=N4xEI4HKgAUyhJ1hSAUbnh+sP3h/Po4FRq2tgBcjAS0D+LVO2WY/wh4XYrSeD70zw7IktQ
 TFcc3MSU0RVEifp/erR1WVLiIHctTqAy1CXStrTePe7zyg2kKXwtzld/lzaRcqDwrN49x1
 PeDwf+1ZXoqoxqS6OSE1js7hDTCYNQs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-frFeoSxoPO6bPGYbdZxH4A-1; Mon, 10 Feb 2025 14:38:24 -0500
X-MC-Unique: frFeoSxoPO6bPGYbdZxH4A-1
X-Mimecast-MFC-AGG-ID: frFeoSxoPO6bPGYbdZxH4A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-438e180821aso27982485e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216303; x=1739821103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
 b=gR/SSdpGJ3rTRx+w1i6JhD/YVMyt01AUInrAyZPXFePMkU5d8LNizE2vb+WxBz5Mo0
 xNStV9dVecO+19D/w0tKk0XebPwiJDD779448UNut39HogiEIt61lHhHyo5YzbuH1yQ/
 jT+GqWu6WlLO/YzEyxrqEylFsOnG6IgF/bE2MoZr6nmXrwZvNhHERtL1hiSR+WtkFLcd
 MXk4byfww3D0fypjph8v2YmS2g8KBXWx0pB2ArODHYtecBQrjlndU3WhBytRWtfP9/Dt
 5kbgOmp4u5Qn9uTZDVfSY1QE4/oY+0HkhEcVObNgI/+R5X8hUMd5xWbMiU8SAwho6UKO
 KnFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOWepBzR5+W1DHSPyeB3BCc8p0D+/g6h/tH0ugdh1FxVKeSgF9MKZqehLHKB/g6wGgDcGPYraP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyznNFOkn55KZy6Y82tZYtwYX22Ya/d2Ozpf2tBzYtd/mFRxyGA
 N/hn6fySaiGzmdMmQxyVQ7sBuKXp9LRjYSUmY8xDaHm77H3IbEXt58iMxg4fjLVBDY3fEKdKiJg
 brVxrE+7g9CqbdgZRh4qwvVawD5/Xer5FeONwM4q/FkRzneQeyjurG9qwugW2NoM=
X-Gm-Gg: ASbGncuSHVCq07H8EapZxDO131KAUq5O0Auos1naeqcMGKJbEpSiaI9ohrsKk2q64WS
 H/klVE04Pf0vYjxkDSrle7iaKN+38YMWC3RwbFt3WKWKjPX90pg8ChhPeqlTrn/D2/8F43U0Rs1
 LEXMBFcxCGRueoQv9hutAh8fuVp38OgpS5as+JjcvdpXhe1FgihWqDFlDr0k07ALwTm+p3bSqJb
 yYTjVUXdDQW4MJb1ekFA+KcDbN9AtSy2ej8iCqt4brp6rJnvwL5AyqB57SAqqr9O72Lg85K6wtj
 3EnotEoB5TjLj7VhSRrvHr3fDak87xRMNt9LHzPc2O5PWfDFiM8ALmZkPddS3xAoPg==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id
 ffacd0b85a97d-38de33dd2b2mr2312787f8f.14.1739216303477; 
 Mon, 10 Feb 2025 11:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Llhtf765OHh3Rdp8g77cDKhZyIe7rPLF3LamWfRFHXBXmPgwl/7uacqNHueSdZU9tH9+kA==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id
 ffacd0b85a97d-38de33dd2b2mr2312758f8f.14.1739216303053; 
 Mon, 10 Feb 2025 11:38:23 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dd3fc7ee5sm7734941f8f.39.2025.02.10.11.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:21 -0800 (PST)
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
Subject: [PATCH v2 05/17] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Date: Mon, 10 Feb 2025 20:37:47 +0100
Message-ID: <20250210193801.781278-6-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8MCvCKTNWlVbcFqpU-cZcN6HGkOV3LGy7E6wKWN_yw_1739216303
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

Let's do it just like mprotect write-upgrade or during NUMA-hinting
faults on PROT_NONE PTEs: detect if the PTE can be writable by using
can_change_pte_writable().

Set the PTE only dirty if the folio is dirty: we might not
necessarily have a write access, and setting the PTE writable doesn't
require setting the PTE dirty.

From a CPU perspective, these entries are clean. So only set the PTE dirty
if the folios is dirty.

With this change in place, there is no need to have separate
readable and writable device-exclusive entry types, and we'll merge
them next separately.

Note that, during fork(), we first convert the device-exclusive entries
back to ordinary PTEs, and we only ever allow conversion of writable
PTEs to device-exclusive -- only mprotect can currently change them to
readable-device-exclusive. Consequently, we always expect
PageAnonExclusive(page)==true and can_change_pte_writable()==true,
unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
can_change_pte_writable() for now is cleaner.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 539c0f7c6d545..ba33ba3b7ea17 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -723,18 +723,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 	struct folio *folio = page_folio(page);
 	pte_t orig_pte;
 	pte_t pte;
-	swp_entry_t entry;
 
 	orig_pte = ptep_get(ptep);
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
-	entry = pte_to_swp_entry(orig_pte);
 	if (pte_swp_uffd_wp(orig_pte))
 		pte = pte_mkuffd_wp(pte);
-	else if (is_writable_device_exclusive_entry(entry))
-		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	if ((vma->vm_flags & VM_WRITE) &&
+	    can_change_pte_writable(vma, address, pte)) {
+		if (folio_test_dirty(folio))
+			pte = pte_mkdirty(pte);
+		pte = pte_mkwrite(pte, vma);
+	}
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-- 
2.48.1

