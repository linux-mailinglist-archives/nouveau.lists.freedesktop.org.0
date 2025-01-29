Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84DA21C9F
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5302510E7CC;
	Wed, 29 Jan 2025 11:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="awURBN+K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680FB10E7C5
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
 b=awURBN+KfDqWaX+xU6/9Dzk8NZPW56HPsJTSmeQaf6HFBWVWIIEjMoFxdEpUdWOHKdl2gf
 ZfWEpQCTdGoTLp0mZiQDsuFbVzS28uCflX1jQhLbaWYyICQcFCKQsceUFWnSrJF30rPU3c
 HNLnf4yNA+sExmOcS+4TaEudZgQvxh8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-PtFszvSyP-iRrDwj7KY6AQ-1; Wed, 29 Jan 2025 06:54:35 -0500
X-MC-Unique: PtFszvSyP-iRrDwj7KY6AQ-1
X-Mimecast-MFC-AGG-ID: PtFszvSyP-iRrDwj7KY6AQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38a684a096eso3012809f8f.2
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151674; x=1738756474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
 b=KeOBnWxVa1de1Pmz+x/gN9Dfmw7U4CQRMPq1L9h4ZnuB9FpsTFJG5vPW92WREBlLKJ
 hayiaBrLbwT2fKaIv8IaoAVmzYOwAzi4vsUOkwxF8kD5Lv3ypiPEzA7x6L0hlTVhlx/y
 J7X4CPi0bY2F5QAFQyBbG6FyQYuOKOldCo4U3nQQFySOZTNs1qvJJT/jKZEb7sfMFbEv
 i0mrs2IvMlvFTR+K7bP6plC+rGxnnnLHxnDasVMSQ6p+5170bj02b0QO572MU0fv8iBz
 GsNy64cve24uApO9itqzPIWnN9a1h1Ff+b9ZfL9HtlpBpjFiHBVnSq+Ovc9so30ZnSls
 ITiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdPSTluyKnHA//bVS59ZMVv03/fTPIGta68ySF+D8fvw1OzunF+VcqS1yqHxNoX4VT3Z3kUJR7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLD8tOdNYBed+TXvYdGjwxOShS3ToKtjiRCuP0nr4QeWC4/QQA
 g8g5Bc6FcyP0q6MIxciOI2MxcKLhZVdghKT1o2W8kD22I6HER06GH5bI6W3+8rMO7ancCzCJJPj
 I9C2EkX8KaOM9zgtmnQboQH4pVIrRJ52nIyTbSAgVSNcaN3Zj5yazl7R9bEkV82Y=
X-Gm-Gg: ASbGnctpcxmhqg6DcH+G/9fUW7ELBwVf+iOQlWIHkAV/GPCQV9DrdrxrLfx90B1deAs
 DwA12/pahHDbtLsePPfspCfL9ScthxLPeOonV8mGwqPuzvf5o8np0PbqllGk0dVltvKta8PAHBY
 7y+BUd4udTUHBeXtdeVGFgPYQtaKapfJWFL+aPRyZhnsqpsqG1LsN1ZY9aFLB2ctsoQN54KMI92
 Sd4H56t3ZDPR1bVNKIgCB+12brn0B8efftSZcMvWAR/JXSXwdX7Km7BfMUU06jn6xW0qbBTOYtd
 jA/HYUTvNcVeiwazwTpgD89fppALWgrHoVxmwQkTFCqrUrBZgeHWSbdth49lhpW7DQ==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id
 ffacd0b85a97d-38c519744d5mr2113615f8f.27.1738151674156; 
 Wed, 29 Jan 2025 03:54:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYVCfHEVHB5xz9x9tgAenDwJY8DuXR9neg40xsYB0gvwDn7frPxCs2ZGd0+jvQzBFPN5gg9A==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id
 ffacd0b85a97d-38c519744d5mr2113590f8f.27.1738151673837; 
 Wed, 29 Jan 2025 03:54:33 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bb040sm16943248f8f.67.2025.01.29.03.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:32 -0800 (PST)
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
Subject: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are not
 migration entries
Date: Wed, 29 Jan 2025 12:54:05 +0100
Message-ID: <20250129115411.2077152-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Acf8AcC51soGomi71Oiy3CiQc91PkbXvnnb8cpiW4o_1738151674
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
migration (including folio split) of a folio that has device-private
entries is never started, as we would detect "additional references":
device-private entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f1..32679be22d30 100644
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

