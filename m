Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B69A2F8DF
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834E710E603;
	Mon, 10 Feb 2025 19:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hr6l2Vos";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22110E603
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
 b=Hr6l2VosLK1J6WXT3wlUpYsvkf3HXdFG4FBdZmQi4o7qcC429sDyco5a2Qtgv0y9fughNN
 GZGSETZ4fQpx+vafxSSgR4Jxd3yeZSySnZQbtBoRFnCwbkTXNtyQEs6LPFgUL2rgSpRCrG
 916URuOMcPWWDTMwx3qHL4SU4vCGTt4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-CtKqmaphP8mB-MBpVHqUFw-1; Mon, 10 Feb 2025 14:38:39 -0500
X-MC-Unique: CtKqmaphP8mB-MBpVHqUFw-1
X-Mimecast-MFC-AGG-ID: CtKqmaphP8mB-MBpVHqUFw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4392fc6bceaso13134375e9.2
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216319; x=1739821119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
 b=azD2afJLuQfSXYOqJlUBecvNtdvi7DON56OAiHpLmuxKOH4Bv7W6dYFDcZuOiWHsqV
 Er6ET6mHJscIIJvN1GO5aBM4/enDDY8a8RD6m7sQCqKHcqg4HAHcUoh3HVviZI2CC9Jk
 2dMHYRDUAEbUJ42mm+Dha1s9PQrsyz42m5QGGDbOJZtY8rXATNZ6sY7dt+3Ri4TcldRB
 zlUjlXPveJnzWW3HJXvaV99nUa5GoZun/r/6O8727cl9Oxbo+OomE7kt5PppztZAVtfH
 N8TPbowc9O9pxeZ/HHr2fmNmGO7m6V6cbErc+g5MQNSG6JAmr/pmSClLM3SVaH6XKvZK
 g+fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6oesBb5LVppcRLQUxTShR85LfF0P5TKxi4e4iz7kQVqpxjm1CJMMH0PL6LcSOnC9LEH4RIKI7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCQTLcRzY8FVVaM6VNYcf4l7DVcgF/Snm5tlQsOR9C3NhfdUPL
 txwQ9aClwbqxY1r4olXTht+LOaBiQ/D6FlfLsRzo67ztBVGrl8XZAlO1VK8UOARZYnPMQRx1+/N
 YpymtQkb0vbZAcJK4wH0CQyt9p5ODKj7RUlaHGwzU0QXRIVBy+5r4Vjy9uNjP0Eg=
X-Gm-Gg: ASbGncvRb5ccX1LyhtDF1uD7XCTBBC/AXEuxgjNlErRWlZPRdV5XYpTVbMMUmkSlhxX
 b7IN9F4udymAeJg7oxNgK3IjHYjdIsyzNs2xD2F/0+F9e4O8x1tEWrIzWfnBp/DNe5IKKWgenrS
 qZ8m5Vt7GP0v1h4TMCs2JjsexUUlFY8G8NU2HklA9Sy3BfO/5Q9or1lpCFBhPHeGHczU54NEl7E
 la4xZfWc/xBc/RyrGII/B6nTdZ4sNCQvXVCMw1ofMcbYVSTsbSzkDXIdgczWqyDBoFDz3JSgLrB
 nuttFcXOff2zGzxEtqVQF1XQx2Revz9j09jvMIUuA1Z+eCIfposPKaTjAAcdri7p7Q==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id
 5b1f17b1804b1-439249b04f8mr116077385e9.20.1739216318620; 
 Mon, 10 Feb 2025 11:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdlczuWpIJN55C/ZdLw7mis7jMK/FKd714PEZJ/2b6DQtULEf1bpuI2yab2McnQRseLHdLgg==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id
 5b1f17b1804b1-439249b04f8mr116077285e9.20.1739216318299; 
 Mon, 10 Feb 2025 11:38:38 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4391da96502sm158809495e9.1.2025.02.10.11.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:37 -0800 (PST)
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
Subject: [PATCH v2 09/17] mm/ksm: handle device-exclusive entries correctly in
 write_protect_page()
Date: Mon, 10 Feb 2025 20:37:51 +0100
Message-ID: <20250210193801.781278-10-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pkF7xV-bFQKyOsVEuuW-9IrEKnMkty7Sm6z2MK5GEkg_1739216319
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

write_protect_page() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, because GUP would never have returned such
folios (conversion to device-private happens by page migration, not
in-place conversion of the PTE).

There is a race between performing the folio_walk (which fails on
non-present PTEs) and locking the folio to look it up using
page_vma_mapped_walk() again, so this is likely a fix (unless something
else could prevent that race, but it doesn't look like). In the
future it could be handled if ever required, for now just give up and
ignore them like folio_walk would.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/ksm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8be2b144fefd6..8583fb91ef136 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1270,8 +1270,15 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 	if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
 		goto out_unlock;
 
-	anon_exclusive = PageAnonExclusive(&folio->page);
 	entry = ptep_get(pvmw.pte);
+	/*
+	 * Handle PFN swap PTEs, such as device-exclusive ones, that actually
+	 * map pages: give up just like the next folio_walk would.
+	 */
+	if (unlikely(!pte_present(entry)))
+		goto out_unlock;
+
+	anon_exclusive = PageAnonExclusive(&folio->page);
 	if (pte_write(entry) || pte_dirty(entry) ||
 	    anon_exclusive || mm_tlb_flush_pending(mm)) {
 		swapped = folio_test_swapcache(folio);
-- 
2.48.1

