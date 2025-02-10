Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE461A2F8EC
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1D10E602;
	Mon, 10 Feb 2025 19:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HENOEqYW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FE10E60F
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oE9Ja/aC61CHup4qeT96Odiagg40Q7TPEFXRUvHwXRo=;
 b=HENOEqYW23FVkl2qDgOt1R9Yb2YQsPWKLOM7RE3Lz48FdX4WK6IjmMjQ3pPwnpSTyXYDuf
 w7jBnPIHOaeceoQaNQSfuxT7dsFlYfyy3jzEx0zmDHeAk5kH6M+hYBFq0RurpIBcTjw23V
 EHg3DsgrXoTX+ZQ2e/tGel8oyacktDM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-xeKWCS6vNgG_n9Llv8XdVg-1; Mon, 10 Feb 2025 14:38:59 -0500
X-MC-Unique: xeKWCS6vNgG_n9Llv8XdVg-1
X-Mimecast-MFC-AGG-ID: xeKWCS6vNgG_n9Llv8XdVg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dc6aad9f8so1835272f8f.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216338; x=1739821138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oE9Ja/aC61CHup4qeT96Odiagg40Q7TPEFXRUvHwXRo=;
 b=UJBq0xn2Wljdz9MFjXit+3eYXVt2iFdcsiOuDRRJ3MBAnFPzb9+o4WLpVR+FLIxD/Z
 EAoT/5B9US1I3wAIpBcBcVxq0WSEZl6R0oTeDgK2Q6q3IK7kCKZpBC0yMofTug80hqLC
 UbPGLKgblRDzx01VeGOsLPlZMITh8dFzLtMX8qLaDuQqdZoWXWjLYhBIiINEl2IHGeZq
 mQhXRyPQrvFfh+QBY0GH80Lkop/VO/RiVIDWQRvQKxstv4nKH424UexgM++LJVHMGRTq
 0syNjTxHC9BxGF8YBMTeYfBh7rObFkM4p2r2CsYwB67QiD6e6rQu9TkzQqHXc5ckw1ZW
 uBNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG4AU9Zh0Tk9xSs7NPo0Wawht9SZUkOZWlA1S2xAzBA9fbEc7cKlq/dfwU7Ds+fsUmGelOyVAv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/Oppo+6pH90Ow2xGPA90xMw++EZN6T+4HhbbLhJdvyYnP6n0U
 5kaYO2FiCfgBlqbUMOxdK0bGYOXe9TrS9fTAvqWQ3QDESHaGEsBFveA+JQuHU/LSpH7bkKfyeNW
 33tACIOj3u2v6oCh5ivulnDXTv/fJf+dK4kjdry7vXaAhNpR9kAr0DzJFu6MltHs=
X-Gm-Gg: ASbGncsXeVAldORuD6vFwX3/uD/fdfqGJm4XKjAz5+R2CVtSLtBtGd/LmpTI0yM3lHj
 6kFGlXnSfbCUYJM+Ro+kPoKyKXdCmiGf2Hy4Aaa7k5Er8TmvVm77FWAorEo8uNxCrqVxfvAxaCw
 /ycxMXtAFFIEGq7mOhkf945rs3hr/LGVDDeCYxc9GoFFHvQ9ln9ipB2UeA3pRZcyX6NlmBoJl8T
 KNLQfmoa7Qix5HmKhDuSOm83+oMKqo0ll4uDxtrbmGLCl5hZBbXdrikunXw5lGU0ePztfrYyj1E
 LJOYyo3ahqL9ZkH2UFJwUP8D/NIo4TgJFprPcYSjB/eeNwhnVFKTafRf78VOqUQFmA==
X-Received: by 2002:a05:6000:1887:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-38de439b7e5mr512538f8f.5.1739216337885; 
 Mon, 10 Feb 2025 11:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/uzgNmJSm7r4vj5m1RC+0Hk4d4M8qsuHzJI2p/6gaMOev6b/snbfbww+U3ctbsFbws8/HTA==
X-Received: by 2002:a05:6000:1887:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-38de439b7e5mr512516f8f.5.1739216337518; 
 Mon, 10 Feb 2025 11:38:57 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dcc9bd251sm9816921f8f.9.2025.02.10.11.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:56 -0800 (PST)
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
Subject: [PATCH v2 14/17] mm/damon: handle device-exclusive entries correctly
 in damon_folio_young_one()
Date: Mon, 10 Feb 2025 20:37:56 +0100
Message-ID: <20250210193801.781278-15-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YwCAHcuBhh-dmtViCTCtyczzQ4tuaDYM40lJf_AE8tw_1739216338
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

damon_folio_young_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

The impact is rather small: we'd be calling pte_young() on a
non-present PTE, which is not really defined to have semantic.

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
 mm/damon/paddr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 0f9ae14f884dd..10d75f9ceeafb 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -92,12 +92,20 @@ static bool damon_folio_young_one(struct folio *folio,
 {
 	bool *accessed = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
+	pte_t pte;
 
 	*accessed = false;
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
 		if (pvmw.pte) {
-			*accessed = pte_young(ptep_get(pvmw.pte)) ||
+			pte = ptep_get(pvmw.pte);
+
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are "old" from a CPU perspective.
+			 * The MMU notifier takes care of any device aspects.
+			 */
+			*accessed = (pte_present(pte) && pte_young(pte)) ||
 				!folio_test_idle(folio) ||
 				mmu_notifier_test_young(vma->vm_mm, addr);
 		} else {
-- 
2.48.1

