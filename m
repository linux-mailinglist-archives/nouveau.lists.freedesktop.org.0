Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A8DA21CD6
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532910E7DC;
	Wed, 29 Jan 2025 11:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YAHcztfy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5679610E7DA
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
 b=YAHcztfyQgRI213DyDuuD9Xe8Wsi6bt2l8F4bXnlyLIb4gjzpLgy7LIykkuQUHTFPQIpVe
 WbVV+rkuABPb3UO8m5N4tPE1BfldGKngpC2EKrzxCvM1Bv62DFi0E8IY1OL+itK2kUm0F4
 I69Q/AfokvqlKCxnEimsRq2L0rqonPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-WV8AAseuPiOBIVMQ5ar7DA-1; Wed, 29 Jan 2025 06:58:19 -0500
X-MC-Unique: WV8AAseuPiOBIVMQ5ar7DA-1
X-Mimecast-MFC-AGG-ID: WV8AAseuPiOBIVMQ5ar7DA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so3083185e9.0
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151898; x=1738756698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
 b=JBUYNRdjhA+KeVV93LFnG6Itay9s8Wg8ctFngf15PE4IKCyxwRZgt8O9NNSFazzVMp
 ESMPMXu4dgapqdKll8sMhvNLwFxVcn+e0u3DEE+P47sCUe7BtjYpjf1XNJCfCH5czG3d
 dcdgwLBq/9ql8E3mCd1Md1dzU9sW3O20lxLlS5pmfIQ/4UxxU1o3rPDVedhlTK9iDMLB
 tei446Je3xC3pywtghvJ3fC/cmsUSh+QBQeogA0WNGTWnDZmch/+IRbpGWg7VHvphN55
 lkPOCqvXBgVpwCMF9whBGls4phdXXAp8mW1TBHTQtittp56fTTRzaZervIXFI8s8UVly
 jabg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVldo6VQHH1q1ZV5hhhKbPpuX6KYuDhCuaV3rMa5ZR0SUORB7SQwjmGVaDVlfzOLedJShDBhpv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6lV80GJzWzXflijjicOkKrLZeiDaUMTAc1NbbkeG3tBWIY2cR
 0fo1L8keIynllwHTkDMVFtZgGbv1g6nlwMNXutz5YcA//KIF0mMw9NARTYkV/XjZmEaxVYvfw10
 mMe7Qles1Flix4qMKeY9LgzdhSMmSwmOrStdkhkQrUK38Lg398UBjgQu6KKrLybk=
X-Gm-Gg: ASbGncu85WTw4zJmNUc6ErMZfU0oCO6X/hXFF9cUV9Zf/GM6GbZfg2TxJVhsfaJ0BVJ
 pP8GEu2JH9Lv0TXfKqNSVAf76azDRRzG/HBxs32ErRK410rxUBDzZmhsgYkRKd0coMrgKqj2Rep
 s/6IDM2p9b8a4xdlotVGAtzj1iGBIETNTQ2xGwc6bqDs6Z28DXR0xSlwlPZftwTsmlivP/OsOE0
 pvioG5TiUsVW+IBmgSPlkGwuFc29yyqLi1FHpPJTOcVFJYXeXsEdoDWIqAq+ceH0vPPs06OF6fK
 OWncYLu7EYvXOP3/8TdTCAr1k43ehoosf4IqysNYuN+LlwqgzxkdWqvO6/B4HcjBtA==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr27335715e9.9.1738151898328; 
 Wed, 29 Jan 2025 03:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUOJXNPPQ6xLco9EGZUl9hRUezUN+y2Deyf0uuUDDMY6E4w4fKpt4O5zyjSgxt4LyQtnHPOg==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id
 5b1f17b1804b1-438dbe9a124mr27335535e9.9.1738151897999; 
 Wed, 29 Jan 2025 03:58:17 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc33e04sm20207605e9.29.2025.01.29.03.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:17 -0800 (PST)
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
Subject: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:02 +0100
Message-ID: <20250129115803.2084769-5-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOP42LZ00avtsCkmKmnT1bnKjN0TchSbAwHlWMXOVb8_1738151898
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

Let's document how this function is to be used, and why the requirement
for the folio lock might maybe be dropped in the future.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 46956994aaff..caaae8df11a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 }
 #endif
 
+/**
+ * restore_exclusive_pte - Restore a device-exclusive entry
+ * @vma: VMA covering @address
+ * @folio: the mapped folio
+ * @page: the mapped folio page
+ * @address: the virtual address
+ * @ptep: PTE pointer into the locked page table mapping the folio page
+ * @orig_pte: PTE value at @ptep
+ *
+ * Restore a device-exclusive non-swap entry to an ordinary present PTE.
+ *
+ * The folio and the page table must be locked, and MMU notifiers must have
+ * been called to invalidate any (exclusive) device mappings. In case of
+ * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
+ * fault MMU_NOTIFY_EXCLUSIVE is triggered.
+ *
+ * Locking the folio makes sure that anybody who just converted the PTE to
+ * a device-private entry can map it into the device, before unlocking it; so
+ * the folio lock prevents concurrent conversion to device-exclusive.
+ *
+ * TODO: the folio lock does not protect against all cases of concurrent
+ * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
+ * must already use MMU notifiers to sync against any concurrent changes
+ * Maybe the requirement for the folio lock can be dropped in the future.
+ */
 static void restore_exclusive_pte(struct vm_area_struct *vma,
 		struct folio *folio, struct page *page, unsigned long address,
 		pte_t *ptep, pte_t orig_pte)
-- 
2.48.1

