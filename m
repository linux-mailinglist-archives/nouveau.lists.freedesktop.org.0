Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267BA21C92
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9910E7BC;
	Wed, 29 Jan 2025 11:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bwRzM+2u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C1410E7C2
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=herznK9N3+37fO8/yUnjjPI+kU1qrhYMSQrHDNQrbI8=;
 b=bwRzM+2uHt+qpeD9N2r4zABp2V7qI3JuItDa+rgIv2ZxuThcC/qQb5dBpcM88ZQ5s0ap2x
 Yt+/7i5b+Vrmqr7fMlXFG+AGyO+gOiIMeAlO/IEKTTAPIEybzSjTCZLb3CUsEbzs4DFULI
 OBxlXMAKhtEm3syBc58h2UDvsnPdjyo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-1Q-JyPr0NnuIbRmMB5F1QA-1; Wed, 29 Jan 2025 06:54:21 -0500
X-MC-Unique: 1Q-JyPr0NnuIbRmMB5F1QA-1
X-Mimecast-MFC-AGG-ID: 1Q-JyPr0NnuIbRmMB5F1QA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361ac8b25fso36453185e9.2
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151661; x=1738756461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=herznK9N3+37fO8/yUnjjPI+kU1qrhYMSQrHDNQrbI8=;
 b=h5tetaj+ri2V4tj9sx+Xq84zqjloxXffYhoO8LXAVGLMu1ErrgACVbggRrWCcqwNN8
 xeNOO/SSWOWMZ5bDzJZ0sgv+rXcpd63esr/vn7AwUhCUVm8nJvXsxAyebFJMWM0K7FRF
 REAt234e/JsOU7yPjbZsR8K3BfGjGFXbugNLxzN5eioK1OrupmupzAWJlIslXMzoVG4M
 BIFH/z2U7FSK6u8modpvXckE6aacGMZx3ihApbwf7664J1TB2lFdQb19tdV7n+Rtz26u
 3F1n3smOQkr0K6Ni1WhAnLv6FhhNful4ReUMw3Rcs1iqwzXfBqiNOuCHx62YnNi0CL5X
 /YcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrVVPp6+V7qao5vhY5Gyyw+fRk3IOTDrCAbkTHa5gSUsi+c0PbnSpPzry4wrsZovPoWc6OsHUl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgIuF8Hm5l2QY9IIomIt396CQ6+I9RSUks28Oc7E9emXjI9cYJ
 fWk3PbvL+G17/I9rzJ0qAELFph32BKshDK5Lme1dInhFjAplG/tuBxOVHHwqvWWN5x5po2qGWJh
 2/8xThoILi+7VpeNMQp2gP2ahx5HPeaS7B4nDuCzbBoHlv9QwxW6N3nvdX46AaQQ=
X-Gm-Gg: ASbGncvGzvsG0fWV2NPiE3w/6x6bKHqTvTY8+0dlB4Fp69IJ+udjqJEBSyw/pZMbD6i
 wJ/MIQ/yWwqUmcntYTlsMUEmH0QVRIgi/bivPYMXlnMTl7a3C8eEqEPQCP/Q+YiJIZqZbMq5KYQ
 2xvhEdSZfKj61Oo3NKraDBg1tN9yTSkfK0+8505QU+dN4Y2hX/ZyQXwX2IwA27Mj6g78EYTQikB
 zOat+W8EQAxC9vzntrN3ITvxXeyL9KV+pP9R2iDElwiS3oZDHl207qieovo2VzElo3hC07VERIS
 s4SkBm1ZnPp5N9s/sJSfrC9bXokO9B/jDWL+rDvtUR5Dg4ULToSVCcC9UeonX7AUwA==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr26190635e9.5.1738151660702; 
 Wed, 29 Jan 2025 03:54:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEopxoArzHie066mjWjUvNKTSc/02V79PTjUrPj2QcjbwdMpR1m12X2+qvEI4pAjYXanIEeWA==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr26190115e9.5.1738151660040; 
 Wed, 29 Jan 2025 03:54:20 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcbbc52dsm21427725e9.0.2025.01.29.03.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:18 -0800 (PST)
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
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 stable@vger.kernel.org
Subject: [PATCH v1 02/12] mm/rmap: reject hugetlb folios in
 folio_make_device_exclusive()
Date: Wed, 29 Jan 2025 12:54:00 +0100
Message-ID: <20250129115411.2077152-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OecoDk8026vxypkXhlDnAXB7_M-acNSTlFtiCxBp-Ko_1738151661
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

Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.

In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
returned a page. In particular, hugetlb folios that are not PMD-sized
would never have been prone to FOLL_SPLIT_PMD.

hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
not really prepared for handling them at all. So let's spell that out.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..17fbfa61f7ef 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
 	 * Restrict to anonymous folios for now to avoid potential writeback
 	 * issues.
 	 */
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
 		return false;
 
 	rmap_walk(folio, &rwc);
-- 
2.48.1

