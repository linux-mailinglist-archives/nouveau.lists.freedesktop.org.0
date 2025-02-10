Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99CA2F8E6
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF510E60B;
	Mon, 10 Feb 2025 19:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mz2aQmDK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F7410E60A
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
 b=Mz2aQmDKq8fZmzlhh+7TvwASMvFmco/VmG8rfsvTVfk4HnKZjDGtCDi4u5anMMEPJBnPRU
 kGZNEb5kCPnffms0gcDNb/WDWUbmp11c0p9bZSLVr9TsPa9zdmQM+uv5IE4iisBjnQVA02
 8km1iYIEcJ/VhptfOI+C5/34ww0qJ3w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-ISztlo1PNHGDDoNdbNAI3w-1; Mon, 10 Feb 2025 14:38:51 -0500
X-MC-Unique: ISztlo1PNHGDDoNdbNAI3w-1
X-Mimecast-MFC-AGG-ID: ISztlo1PNHGDDoNdbNAI3w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4393786618bso12899775e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216330; x=1739821130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
 b=J/fbbcUhIHcIS8WpMe3adYo0x9UzxnFReV0HAR7hIGW4K5cSGnu8k1bQtM6TYnUERM
 KVSqVYAxm0YXm8QeqtMoiK4ZOzq1I76KBgV1+p1b7WkF0uUo8W0vagtMmpIbQAFfnWU8
 jAj0S7aLwWHkdpKvWCDWhZgIst7+CZnNd8soaii2Tjs//pztuekiIeGlNQgN8kpuYSPK
 My6qV+yYfUWP2vC/LvrsVWtH/dCvTRBOY8J49+9UeE0U9lCdy2J0snPgqR8PM5Avgt7K
 yzifaJ6Dg9n9kw2A6Qlk4xVepPCkqnkDGEWFGLVks8dMG7sJttrDyKFBNl9u5AytIW4W
 zXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhb4qNUFzJ+HNT3+/OAE+l0kThB8cRoANbIlHsXRTqtIgjJ4uTAqfEtcYC2ha98PC0dGYTypqN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB88MvFi2dZJJkxEhn4y+lyQgN9GH10vVdu+YN7PlmWBB1V3Ph
 O6CcHBab+4g2Ytk+4Cu2ZXIYB/SKFK1eXLk3pVCRdpAwiEjiUz7k4T5GKTAufzIthhWUONnRTkZ
 ezUWUboeAsGGGzc9KbnqTLBBx4gk3ScUC4sWUhMw8D81fGC01mTQCwzWrJnoqxn8=
X-Gm-Gg: ASbGncsv3IGKpR4RkD6GHv5VfAuEQ4M7bifJLrJjKw8SChXENGQFgV78KNOc/R+EnmQ
 vpT0O4dFPnBT65KHSGlYXF9oFAE2WDHSs8A/2zROhwfvJq1oxRFUyp7dU8RrLKdfv3wse1bJm6F
 ZIGZY+nYQ5+XOPfBfwDbOFF7rHLHj7ijA2d7fWCiXxfuPaF/yF0+TARh4cNHALo22CxwdoMsKKg
 FE5oWzmoDagLLR5niwxcT3kTF6X4ZgE8zrG8kV2XBrD3CfpfqrZaBACZvn6F9w9HGaatBoogmTj
 C4PUt/vSfZVCUIrsSgOXga3Hyu97gxB2XQhef5WOdWWtYuDnr99vZ9SyQ133XwRrEg==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id
 5b1f17b1804b1-4394bb0adb6mr17902755e9.8.1739216329962; 
 Mon, 10 Feb 2025 11:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0Un4mhmMUf8CyrAHOSxNb3M+hrifrlRxr2GMjHtCC/u6kqhVG2aMU260gZj/4uoW1cKICNg==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id
 5b1f17b1804b1-4394bb0adb6mr17902495e9.8.1739216329619; 
 Mon, 10 Feb 2025 11:38:49 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43947bdc5c4sm26951255e9.23.2025.02.10.11.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:48 -0800 (PST)
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
Subject: [PATCH v2 12/17] mm/rmap: handle device-exclusive entries correctly
 in page_vma_mkclean_one()
Date: Mon, 10 Feb 2025 20:37:54 +0100
Message-ID: <20250210193801.781278-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pdJ7L-UXTUci1_Gpvdo0sXGVusLgkg4CDAp-9HVkKOU_1739216330
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

page_vma_mkclean_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

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
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7c471c3ea64c4..7b737f0f68fb5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1044,6 +1044,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are clean and not writable from a
+			 * CPU perspective. The MMU notifier takes care of any
+			 * device aspects.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

