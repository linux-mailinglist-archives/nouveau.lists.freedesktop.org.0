Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C577A2F8D9
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21F510E38C;
	Mon, 10 Feb 2025 19:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ikpo1MCT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703910E38C
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
 b=ikpo1MCTffr8Ho/CsjTxQinDzBJSBDm6LK1sMOgGp3IeFkuZ97IiW/rcOxRahPXs2RnVNs
 UB/aNkXi1DB6RTEIKPoJ69lKDqtUfbor+VUMI/31D+kaJ2UE4q8zU9NGL4O+TF+ZPf7h+I
 8mrTEJmoqpQwZfgdk3D9cL5yoKTgl7c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-EioNtNJ-Nz61i_85P-nbjQ-1; Mon, 10 Feb 2025 14:38:32 -0500
X-MC-Unique: EioNtNJ-Nz61i_85P-nbjQ-1
X-Mimecast-MFC-AGG-ID: EioNtNJ-Nz61i_85P-nbjQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so9544445e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216311; x=1739821111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
 b=J4tfRPIaony9Z1l9ZL+1gbO3Xgn7FKefK3bNyekOE5hfoE6uXxNSycXLi8LeuKqeq/
 nDCqhP5fcmm50rcoPgwp07ePiewuohOgmCdovibzvRQAWZcEZj8UWVBZMRrxSRmMyWgP
 AVgR/4eWUprzgKR0hVk/Db5XSmdcNzKBdLCGVq8wW1WQuLKtk237Y8gT/tQQvQk59X60
 bpLPe4+9WXnjf5wNlUcHB/LOdnCURSGbK7rHMYnC7h7qcjZxLCK2uHvFO5lCfdF5UsTs
 NJYt7XvzQWkWXOUfz4KE74FwWJkQgP9e32bDjvPn8t5KlXbZj3TZWI8nKo9K2O1z78a8
 DnVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNZmih6A5tMy700JtZ9zo1HfSbOOWJPi7pZHsdIODQ5CFp2vRqO7k6qvC6ZhtMyH1ZgEOTStuj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBynE5/mbshBm9oF46JGQVDU40T4uRlJrq3Ik6FzZjUEaK8ufv
 mVABq4j0Fy8lRe+vKOKNg9mFdh/k8hOOMnSnCB+0PKJVEF2pBDo252d0s4HYcX7HV0DGBlHxmVq
 hbWMQ/SM57yVBH5W42W39G0WNUCNe6wNEBq5jO4VAPygdJIEEvQroWqeTnqgMH/Y=
X-Gm-Gg: ASbGnctY7b7MbRC8juH+YtExWekgMvhTriFc3ZjHUZGev+wZghxltQEtD+2QjG3KmyR
 1fQ5RwMMWEyx2GfbJdTfq3vOIprQoPTbZlThzkt64vmLUyEjGYVTGMhZhWjM0o33iQxjpZNhtkX
 vHzca5lo6nvxhDgPJKbKoToqZg0CW3P1NQ2xJC7rpWUDpG52rZKKEG2aGmBI1rGL5EaDR/4iCTa
 4QIUOolCEinTxI7m//kDm4HBWivFltsLuHwMmty5AVzKls1tjsVMrcxJz1j0OSGWpLyMAvMBrwY
 4Z40cZJZqxZn5OXJLxRH5sVoqycCKX2/PZg0/ANSvqfs7Drf4LD6aNbvijU9+fpgsw==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id
 5b1f17b1804b1-4393dc02be1mr57220295e9.2.1739216311480; 
 Mon, 10 Feb 2025 11:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbUQzL3Yq1p3VwDR+lxH773I/PQZNBDcgTpUgE2nEJHxULXhio/DNj6yNxLtRtBjWIFSwTIg==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id
 5b1f17b1804b1-4393dc02be1mr57220015e9.2.1739216311167; 
 Mon, 10 Feb 2025 11:38:31 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d933523sm192523445e9.1.2025.02.10.11.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:29 -0800 (PST)
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
Subject: [PATCH v2 07/17] mm/page_vma_mapped: device-exclusive entries are not
 migration entries
Date: Mon, 10 Feb 2025 20:37:49 +0100
Message-ID: <20250210193801.781278-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SeTMm3mzGwi6h7i9x_Pn2qn4dBKrZgykbi9VUAGje4I_1739216311
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

It's unclear why they would be considered migration entries; they are
not.

Likely we'll never really trigger that case in practice, because
migration (including folio split) of a folio that has device-exclusive
entries is never started, as we would detect "additional references":
device-exclusive entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f16..32679be22d30c 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(ptent);
 
-		if (!is_migration_entry(entry) &&
-		    !is_device_exclusive_entry(entry))
+		if (!is_migration_entry(entry))
 			return false;
 
 		pfn = swp_offset_pfn(entry);
-- 
2.48.1

