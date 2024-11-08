Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3F9C21E0
	for <lists+nouveau@lfdr.de>; Fri,  8 Nov 2024 17:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C210EA06;
	Fri,  8 Nov 2024 16:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BH093nr7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B8C10EA06
 for <nouveau@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:55 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-e28fdb4f35fso3669752276.0
 for <nouveau@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082854; x=1731687654;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EuhnD2p0KG553uFJn8sTE5BvDRtJggITHppkxTMLSiU=;
 b=BH093nr7+4IlHwg2+GIskDXJR2aTA8XD5lFOuDCsiGDgMscWtkL9hi0EWN6LpMxyz5
 eH6y4eHIxc4vAeO9bmkOlddV8VjFkB1nszybunJbCdqwyVOCpR7S5cF8XSocsBjvOIY9
 D2fJto9nvCc6UYoOsE3fLpu4a3Og1HMfTH0oSCO26dGjYDH6rvhqoYEshanFPINAa54X
 R9Cia2o24bB6z1JmuLbijGoNbu5ECSNqQWAt6rQOYgB0ZsFdDyGQBpiHvsOrd5RpavE0
 FyuntTAhUPWhJaL+f0BGVX91B1dHAZTXEk5xDkMKtfvfpQ/WYI3KrjDs8U7wO6wEkm/a
 tsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082854; x=1731687654;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EuhnD2p0KG553uFJn8sTE5BvDRtJggITHppkxTMLSiU=;
 b=YunF5KMkx3J8NNVMhr5ewODzb6EVDd1rrmkjtWerwUVEpJ1NsLSMJ0YR97WiMMXAN5
 /Crxufm+FcZ30d3VBQ/GM1cFyKL0CXVdSSbXvhj0uY1xv4zK7uHenpSy58UxFXgVD8dx
 Xq4K5KuYOGGWccHPlYH7ems5smugat0ClBhdkjBhiM1FDWVDOn7rkkx8a7nSDsS/Yi2r
 p6O2Rt8skyJSHYwy0I/xsShhJo4rh4DMq+RQMktopuL4Oukis39EA0Onsfqd2R5RFFZw
 B4NSZsiCqdW602NYbmt2mlojrXTfF+G0FUsVhVN+o3YOHuLX7s3ZJtqiDVO208kmIMs2
 AF2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvdXRtmL8Swj9B5Kc/7r6GTwXxyKITQ+2dMIT0Vt6EV75zl/mwiAPkWUKNijWRsfohCweBTO91@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo73NGtR2sFC15AQj/P0/JXPM3iIHoY+5p7payP5GskPc0nv6Z
 i9SvJgN4NcntDhvo6XeDvfqMz6m6t23BEKG8tJzjhlfOrxvNhvhpugVYXDqvO2upUZgspIPYGQ=
 =
X-Google-Smtp-Source: AGHT+IESFJvscd0BPH0GhrFsgF5ykZdsLy8VBXsCYVPr2h3JOn3SzzNujpcRbxNhrkNgQoNrxNGAtYBroQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:d001:0:b0:e30:d518:30f2 with
 SMTP id
 3f1490d57ef6-e337f8417b3mr2585276.1.1731082854058; Fri, 08 Nov 2024 08:20:54
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:35 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-6-tabba@google.com>
Subject: [RFC PATCH v1 05/10] mm/hugetlb: use folio->lru int
 demote_free_hugetlb_folios()
From: Fuad Tabba <tabba@google.com>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, david@redhat.com, rppt@kernel.org, 
 jglisse@redhat.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
 simona@ffwll.ch, airlied@gmail.com, pbonzini@redhat.com, seanjc@google.com, 
 willy@infradead.org, jgg@nvidia.com, jhubbard@nvidia.com, 
 ackerleytng@google.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
 kirill.shutemov@linux.intel.com, quic_eberman@quicinc.com, maz@kernel.org, 
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk, 
 tabba@google.com
Content-Type: text/plain; charset="UTF-8"
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

From: David Hildenbrand <david@redhat.com>

Let's avoid messing with pages.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 mm/hugetlb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d58bd815fdf2..a64852280213 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3806,13 +3806,15 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 
 		for (i = 0; i < pages_per_huge_page(src); i += pages_per_huge_page(dst)) {
 			struct page *page = folio_page(folio, i);
+			struct folio *new_folio;
 
 			page->mapping = NULL;
 			clear_compound_head(page);
 			prep_compound_page(page, dst->order);
+			new_folio = page_folio(page);
 
-			init_new_hugetlb_folio(dst, page_folio(page));
-			list_add(&page->lru, &dst_list);
+			init_new_hugetlb_folio(dst, new_folio);
+			list_add(&new_folio->lru, &dst_list);
 		}
 	}
 
-- 
2.47.0.277.g8800431eea-goog

