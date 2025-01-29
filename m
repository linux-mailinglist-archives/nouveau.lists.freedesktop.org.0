Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C3A21CAB
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 12:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973D210E7CF;
	Wed, 29 Jan 2025 11:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VWeyw6W7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB3B10E7D1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
 b=VWeyw6W74m6rOCvyXrdJZ8gyf/OBwXXcoG/uLji8TZ1iORNrpMp+JKTrPCCYNV+E+hVyq9
 S4K0t1+uke/o2Y7o4SiCxHoJH43hrW5xPy0KjFZyS6szPJI088cqK7i1mi1NoHcILHDg/3
 A4ONrmZil5wi5g17/aN3bR0ZBvEwF9M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-LbKFlBZ9P06dNdaxk0c1ow-1; Wed, 29 Jan 2025 06:54:46 -0500
X-MC-Unique: LbKFlBZ9P06dNdaxk0c1ow-1
X-Mimecast-MFC-AGG-ID: LbKFlBZ9P06dNdaxk0c1ow
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38c24ac3706so5219059f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151685; x=1738756485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
 b=IAx+diEGcUYFAwXIp9MZFkPn91jyYoVTfidSui3mMtynZHqgv8xISEr4DCzafQcFDK
 K9+Iz32rQTdu5xBxyp1F2Dc0qfUS8/xeAqx7SelT8mTcrpGua2PLRCJj2AaXyRrGt2/g
 L/21va+OmS0ZCWwIZ2unK1oIxGxLeHEalKBqNtZe+i3V02r0+rvE6M/ecabrZJRhgKmG
 hsSaQP8QJaZ0TaF1dDiS6Jafm0G24Oj+5JS2oXhmDcujiuQ8Wf7vtsA/DhUt6csfHby3
 pP+sjrUJZGZKAMuaQji5e24+40gnsBSDf7YtiqBHXBUHsGTZX9QfIBatVZL2BnzyXImP
 MzNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzyaKJYa7eLjP7aqhdqS6PNZKT5pVpzagCTn5Qoqq6WET+b85o2tQ2Gz3GlEYlB0TVV+8a+jLw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq02XZ6HSGZjDsQyp3qpfb7quEjYNWW/P6ZNDtjhzSM7HR2fV9
 l8uwFWjUOlpOnOidn9SnYUuTrfY0ZXYPpa5qISKwPiu18A1kAXhLdfQeAeerOpBubriUE1sqPyd
 /uQRlKN02ZZzmdO9YEldD4KKPwDIWMMR//W+fR0Rem1pjZgdnHJcWAgGiV00fBls=
X-Gm-Gg: ASbGncv2POcYPFx7GFKUvYayl3muZ+Cz7D/IoXjLQaINfK+VWDX+28sOtj4Kp+gxWsi
 l0uQi/hU4apR19vAZbOufBhsGKDmrhFyFt3iuRHYu9eSZlsCjJ+XcunlSW7dQff+A+u7pgra3yr
 eLSxkgpACuA3dNSTSxuBZ+aPT0AmWQsGL6yo8EVgo6mpqXn0rtUJ0orU0G3/oFTmD9gz1i/8+PI
 yuyn5qE2MSCZ5Szq37fg4lY/4C2seu8dJ8afv7DwqOPzH1/qUdpQ7+50dkCDFKoqusYpurwiW08
 qUCzapYfz8ry7pudpenvamHwTPTGjpgR8VFBMLyV2HbLOa8J+diel+JfvzZv35PwXQ==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id
 ffacd0b85a97d-38c5194da70mr2305423f8f.10.1738151685458; 
 Wed, 29 Jan 2025 03:54:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUbIgz0SPBde6y+6m4GBK9jxdSxFJzhj9pSmwm9jjlsojNxFlCvTBxohQUGPQAzMIjP8ET+w==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id
 ffacd0b85a97d-38c5194da70mr2305401f8f.10.1738151685052; 
 Wed, 29 Jan 2025 03:54:45 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc2ef08sm20681625e9.22.2025.01.29.03.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:43 -0800 (PST)
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
Subject: [PATCH v1 11/12] mm/rmap: handle device-exclusive entries correctly
 in page_vma_mkclean_one()
Date: Wed, 29 Jan 2025 12:54:09 +0100
Message-ID: <20250129115411.2077152-12-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hIm6IgEQ8saQEKY367QFNlSo9v-apgdP8ugZkPsGjsY_1738151685
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
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not writable and
not dirty from CPU perspective".

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0) for order-0 folios. We'll fix that
next, now that page_vma_mkclean_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 77b063e9aec4..9e2002d97d6f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1050,6 +1050,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are clean and not writable.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

