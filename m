Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62FA21CCD
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BD510E7DE;
	Wed, 29 Jan 2025 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GrfG76jF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4F110E7E7
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
 b=GrfG76jF7oQ499ALHq7S2EmqzAIN/0OEjnGR/CbhIjOf+ZfM4T4bN3AIUTrAgdGODs51Lb
 CKroefUpP5ZZbxNmlw127IlWuIsWVraA7ySsfJ9A2dtmbfBSwTGQkUiRsoCGe4bbGe5Ufp
 5pfI8LbPmI5nzCxRzNBQ1HcBV0iL7TE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-s1PbHxn2NpCWBZ_iD2vDdA-1; Wed, 29 Jan 2025 06:58:08 -0500
X-MC-Unique: s1PbHxn2NpCWBZ_iD2vDdA-1
X-Mimecast-MFC-AGG-ID: s1PbHxn2NpCWBZ_iD2vDdA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e00ebb16so2353964f8f.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151887; x=1738756687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
 b=gJSv2W1U7PeLFPXPNOURiU+EYW/iwuXsxQADQB+CJ5rk39D8GQ6edalfjL5ZEvd1Js
 EQJHOH2HjBqLv3S8gxcg76d7INu2nnJF/S59BevRJ+xOYOPEpkzOPvWo3vICEkdJgqMG
 tXG6IAuG8Lv+PVPUnZyBtjh2Jr824eLQoBv9MRoB2hdDAbDlv/xTdCTa/8w84wNTxXuX
 7oBQHypRkyG90NzFMe3ccpROyi8RVHdP62lwuHyWdBZB5fKqQeTeT1XSCxoI24Uwfqpe
 AcwBom/L1uO3b7zhUVKXhOBbD0B3ktJBXUhJz02SQLkyp3+jX63DYGbgzOWkSIJc177m
 NS3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMsNj4svAkOrRU/HCgSbXJA+0Cv5CFvILofrj20Z7Li4oH9j5xZIvVfPl3PNCHgYOEkqnqFjej@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaK2hSJdIwZsLMJa93HUfMTz6PRI7v049kHUjvOcImTfrOcDlW
 M6d/kVlHjwRQlPr93DY9oMsj3o1d7w04W47PCbfZOFhDDJu2/CHfebYnKWYvYWl/GPnMwUdOX+s
 SSrxKEp+Z6EJqAUIoDOAwM/ehrGTswO3F2vglqxjllfDCX8UVTsze2Ru8Udnr9VU=
X-Gm-Gg: ASbGncvP+N/NNuWGmAUV6jKEv9d8L1M9+5a364LvSpEMThzQn9w92ZBs6C+UyqlnaKL
 ZN5jde7g2HAEavtl/LVL2JW7JuiAGtHPxjLVBHYfseVt5zHgLFbhTL1F+QJCikyOsg0j7xwfgkR
 2czdYHDYB94xZkpDUqn5BtBlvrFeSYcZPStAqmI4/tBPznpDA4YZJjIdjhgpqcAv3PS/Rp+0Mj3
 cYW/uVf+oOhzx6/aq8tKc6Txy04tsngYRxLzx5k77Lnrf1e9qzerk9Hz18zYMO/u3QedBpSKyCB
 dZmt7f0lRSDOAo67PSxhCfQc71fSWV+mpbVUwTzsltS8QqdElgVVjFIkWdZhD7p2yw==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38c5194ca26mr2531088f8f.3.1738151887083; 
 Wed, 29 Jan 2025 03:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7JXtANqVSB26MQ84y3Q20UL5y0GbKL9q7LZjVMoQlUkfabdqXk/TfkO91TOMW4G3rYudCgA==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38c5194ca26mr2531049f8f.3.1738151886670; 
 Wed, 29 Jan 2025 03:58:06 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bad87sm16858323f8f.74.2025.01.29.03.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:05 -0800 (PST)
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
Subject: [PATCH v1 0/4] mm: cleanups for device-exclusive entries (hmm)
Date: Wed, 29 Jan 2025 12:57:58 +0100
Message-ID: <20250129115803.2084769-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h7Yg3qEGq6KJBiywo-0YD-QOFFT02l7A4Mp_VmxaNSI_1738151887
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This is a follow-up to [1], performing some related cleanups. There
are more cleanups to be had, but I'll have to focus on some other stuff
next. I might come back to that once I'm stuck on (annoyed by :) )
other things.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

David Hildenbrand (4):
  lib/test_hmm: make dmirror_atomic_map() consume a single page
  mm/mmu_notifier: drop owner from MMU_NOTIFY_EXCLUSIVE
  mm/memory: pass folio and pte to restore_exclusive_pte()
  mm/memory: document restore_exclusive_pte()

 drivers/gpu/drm/nouveau/nouveau_svm.c |  6 +--
 include/linux/mmu_notifier.h          |  4 +-
 include/linux/rmap.h                  |  2 +-
 lib/test_hmm.c                        | 35 ++++++-----------
 mm/memory.c                           | 54 +++++++++++++++++++--------
 mm/rmap.c                             |  3 +-
 6 files changed, 54 insertions(+), 50 deletions(-)

-- 
2.48.1

