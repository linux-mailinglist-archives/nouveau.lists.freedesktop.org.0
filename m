Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD3A21C99
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D92210E7BD;
	Wed, 29 Jan 2025 11:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M0txsj2m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7401510E7C8
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
 b=M0txsj2mnKZA2JnGX+StEY7X9CFVO6LK7mzDxUKl8pRpwGU9xs8hUuQ8NAO0Cr8CpLGZRI
 QHQJqQgxSBWG2sOicDFIaHdMhTzbB25q5tSrAbYvC+CQguBpx5qlcdqm6KjcYCYftAtxXu
 7kE8AgBNEr8ehKssuQaBdjt3xxksBps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-M8Eb18xOPmCBqSXnvcgrJQ-1; Wed, 29 Jan 2025 06:54:29 -0500
X-MC-Unique: M8Eb18xOPmCBqSXnvcgrJQ-1
X-Mimecast-MFC-AGG-ID: M8Eb18xOPmCBqSXnvcgrJQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862be3bfc9so3782792f8f.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151668; x=1738756468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
 b=rVBnHBqnT7HjIpWL2jTvSwCFpiL3E4wG45kmybWLZxPYMPPI/GELOFrg0wp86xPSdg
 LCx2mw6TL25RsB/8JCDvPWtBZHKWhTfGuQYjqsCnYbcqrwaEaakzqarZetAEyRpRjOYj
 JXWyOmzGv5ZDTGCXPQQ149qbgxuXquppO99km/sh21nC+JG7ZY+IuteFJzjFGYDd+ahO
 oFKK3Vr0DWMAPz4yKWLDdqkNLgOZXJ3PItpgsZzaEfcTQlhUwPsKekiEtv0qBFupTEQx
 gRijnD5X+9u81fDk6CmfF/0j4Tki7pKyRI+g4r92PjUtfgFfnm703JYZUIdNdgfR/ROW
 xpSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQGbRqK9q6PcDyeVJ115gufgaOBHB3GrVztniv6lInowWpGnmxCdQxMrK0Vysn3R9Y7D1aG/1I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvPw78nPHk5PvzllnpmNyfOJjxGor+FE5let+nUlxUZ2yvX5ZD
 0smn6JH2QYp1hcLo3Ia939pFotJbfBwQFSgQhRU6ZJPwe4S1QwbiLWR7m3GoC1UABDh26hG6hRk
 WAW2PS/UhH/WMp28WQXaLSMQ54KVd3wHaUNdyOiVYpDJjuqBa4+Y/WETQAtmjQZM=
X-Gm-Gg: ASbGncsLeKOtqAgBquQmdAsoreHypH8rQoVeyI/iJt5LJBAifIa3ouwfjQM4G96B85z
 P2Dsw1ZfD8LoZxVIMMqT7enQdxrMiH+wTNC1oos0GPP4pscAX8MjA7pDiou3S0ZKOAqu97VL4Ga
 GcfILB3UhxP422/OCi24xBDZkluSB40GXtShrmr8uRMPrrBJhez8wsA3WvWpDg0CzbXigrJy46Z
 ilF/lqWsbaqP3tHpgBv11lSQnaKLibsQlrgXW76oieUzNQniII3kEIcwMdtzN3k/0OHD/xrFl9a
 wTkSanZ/WHJ+4yjEfLhl/MDrO8sgoBHfOTjWsQ/mBx54U7xORC7Rn6S3vQJbYD7yuw==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38c51e8de63mr2549387f8f.39.1738151668344; 
 Wed, 29 Jan 2025 03:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3OskkNotGDGa9hKk/bhinDJ94hVo+TUAo4zN3qwEB+ZEXq9Nn9aY72BgysSoJ/r2gZh7hQQ==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38c51e8de63mr2549347f8f.39.1738151667985; 
 Wed, 29 Jan 2025 03:54:27 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a188fe8sm17066981f8f.56.2025.01.29.03.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:27 -0800 (PST)
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
Subject: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Date: Wed, 29 Jan 2025 12:54:03 +0100
Message-ID: <20250129115411.2077152-6-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zI4_qLoe2wWNktpjEMOYMYVV4MUK4Le3Q0aZ8IJXQLo_1738151668
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
index 03efeeef895a..db38d6ae4e74 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
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

