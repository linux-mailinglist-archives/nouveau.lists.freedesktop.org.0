Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F70A21CA8
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB5B10E7D0;
	Wed, 29 Jan 2025 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bO9At6Bx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6890510E7C1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
 b=bO9At6Bx6yVnB4LQRYoi4poyPOA/wIgJ9YksvQlBEBeNrLVxxicFX+myPSRXZCP9JG4VDh
 P2C8DTiOIoNG0WknXdumRcdaUAjzQql6eMxUEqKPon7wr02deEEPDZbSJFUcoPx9vgJZn7
 1NdiVQSiUcKOXzeBHxAxVnvnoGNoRCA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-zb7EV6cSOyW42A2zbqN58A-1; Wed, 29 Jan 2025 06:54:43 -0500
X-MC-Unique: zb7EV6cSOyW42A2zbqN58A-1
X-Mimecast-MFC-AGG-ID: zb7EV6cSOyW42A2zbqN58A
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862c67763dso2402812f8f.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151682; x=1738756482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
 b=nuW3TZ3OsjHlXmMMztUpuomoqXAlC7fPGA2ZQ2QOrjahX9Z93w5ZeIFaGQgvjT8cSE
 Sm3Se0c2x1mT2csoBoDULYuR6Z26qLCLjocuZENsXfY36m5b1DifsDXs09cL2l8577aO
 yJ2YNeFmh/WjMlb3D4UHoEMiF7TxkQtwb+T5DZhEsmy7CmrjSTkvDHgzK9WuVdMX52iJ
 FBxrmiufa8VHSy+5Ahq4OcSI4dPebiutINA7Z1hliblEwWqKbNq5jhjUtJobOTHPlMYF
 z6mV9hxtrgXMVPbMSkH+jzO2XtizFAwdSHl3Mn5fJuwBT0RBzkKf9HMmM8Ys/MQ9/8e8
 CTEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBHaN1mJjgjcWbcjipJLb+NruzWIycbE8sL0LrkVngH6ur0JXVpQhkOuE8b5Kb2qZ7AEUBLuQS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO+Lfjx28ooUPq6lIYw1OHDvQ7WKuEfM7JDr8QM0yt3wggW7r3
 BB25eqii59rmuj6/9KGkzPr6kSkChr/z4A53bpHnRmrDZ7Fm3+t7xHQ5mYtfYNu8DOeigChfBT3
 qnEACU1PhOo0tBbXzoVH/5eDGqAbb4RMOYbdK6KvZ325BhfIJC/ljr+S1BxttmDo=
X-Gm-Gg: ASbGncsik83H2T476heTnIEHS48Tj2Oh5JNtkfEaNY8CExKXKu+tRnLhdqGZJenC8gb
 VGmdb3oer92tobKZ2CKRwtvDRpyYL6Rdv7HqB1H4dGQNR/mqIzvgj4b8YEyUxKugyRDBA2tdYw+
 fZg6FSkd7f0OaQHTw6xyjgaHf2Wu709YIz6nFCv+ChSjTnv9FABse1I3flS4MbW+VaMTqc6yAkH
 sMuKAtSUlXfFXqb87kwoGZNEyxo7p46iQZ8G3wqxyUUk1y+eJEIxrRjdpmPz1Y8BQ49Jnt2cR9w
 Kpximdzp+Vu8RLhngnJiVO1k7JLliHKCT0pvWTsCu6pVM0hP7ZA4q3oP28Lm57lV7w==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-38c5195f2e5mr2414979f8f.17.1738151682119; 
 Wed, 29 Jan 2025 03:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfVb9Gb5/TQQdvQH0d8Y86brLumLHRijGlRqbPqwAUyE2LkrZ873cAyk0+z1AQr8yjahg13A==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-38c5195f2e5mr2414952f8f.17.1738151681703; 
 Wed, 29 Jan 2025 03:54:41 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1c4212sm16316119f8f.87.2025.01.29.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:41 -0800 (PST)
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
Subject: [PATCH v1 10/12] mm/rmap: handle device-exclusive entries correctly
 in folio_referenced_one()
Date: Wed, 29 Jan 2025 12:54:08 +0100
Message-ID: <20250129115411.2077152-11-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jFqnARWPUSkB_NnlehGFmqvdqs8CjQZyur5egVpd-5c_1738151682
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

folio_referenced_one() is not prepared for that, so teach it about these
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not referenced by
the CPU".

Note that we could currently only run into this case with
device-exclusive entries on THPs. For order-0 folios, we still adjust
the mapcount on conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0). We'll fix that next, now that
folio_referenced_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 903a78e60781..77b063e9aec4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -899,8 +899,14 @@ static bool folio_referenced_one(struct folio *folio,
 			if (lru_gen_look_around(&pvmw))
 				referenced++;
 		} else if (pvmw.pte) {
-			if (ptep_clear_flush_young_notify(vma, address,
-						pvmw.pte))
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are old.
+			 */
+			if (pte_present(ptep_get(pvmw.pte)) &&
+			    ptep_clear_flush_young_notify(vma, address, pvmw.pte))
 				referenced++;
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_flush_young_notify(vma, address,
-- 
2.48.1

