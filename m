Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F9A2F8F3
	for <lists+nouveau@lfdr.de>; Mon, 10 Feb 2025 20:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F610E60F;
	Mon, 10 Feb 2025 19:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iMPn+tH9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8710E60F
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
 b=iMPn+tH9G3FTpgC/rPymOg1on9OC9SCUJvtz1LitdmiybXPFY/ai+T5CDMa/sYBG8dFaDu
 2L0RBt4HbbZnprfGeKJISs1ykaWSH39JG+BkZpmTGliQZq12T/aYyZlIT/0u2Pr/F9Xzh4
 YaPD/ITZuj4fwHdwpDhN/jiHWcDgxXo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-4GAgAQQTPcKLuYA6k3ixHg-1; Mon, 10 Feb 2025 14:39:10 -0500
X-MC-Unique: 4GAgAQQTPcKLuYA6k3ixHg-1
X-Mimecast-MFC-AGG-ID: 4GAgAQQTPcKLuYA6k3ixHg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38ddba9814bso733051f8f.3
 for <nouveau@lists.freedesktop.org>; Mon, 10 Feb 2025 11:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216349; x=1739821149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxIo4/a9ZeK4nnisZvQU6AU2gxtpzJDN86Rrv62j7Tk=;
 b=E22/0EadVhqKheVmd6B/J0SyBtp/Q8bkrhaxYmSJzclOkyk3U/bWg0soL1Craav+VG
 /twhj8mtlcALW1QWNe33p926TutRiBYez+84kwXGWe2VgzK1fFeALHjZq630wd0VeS+v
 DTadj7G4OdQTr9u5EIr71LaR2WIGzMGprS8MW8rEUuK6gu0PC51N/Q+yAKCPqz+NnlC3
 k/TcfHvW/GDCa2BXWzKYRgt99wI//xs42+ratTGb27cMw3X54EmqY8VKG5x6i5A7eQAE
 qGtsacU+bQBGRUxKHMYw0fNCZDfj4UtHPzlR3iJYzmoiNJ4vNNCaHqzyb71m7IQhMiE/
 7Qiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfj2YVO8VNsYXL6XFiPJuI0IRFqRRPteTKvdtKmm9x9L8FwbaKCjcahciKTrtkiQ3WMsF8/FLX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHPypxnSEZywmLR0+58Zjui9sJVTRvNb22fq+P0b0mEq3qFYoi
 hReiY/L7B8tTpME+/5McDNbCC2jW2TLnjzaeprg6rrTjEciGqA6qQtNwWSxZ/nIeSrfo4HCcIky
 ibD0PUoWScMtJyzzF1ZIp/vS2/3q0MapLELck5fdya5CiWFZ2BTJ+larnCRrNwQaNhp42y0qz/g
 ==
X-Gm-Gg: ASbGnctNWgb5zvxOaYAk6z8+y8uHbx9SqSYJC7muJKllh04CnYnBMUwKUsfmTH9lxL5
 RndUB4nNBIX4yw28xWeD2hMd7lxpm6xgAYtzpp+IJIMf+tyvhJxTXhNfx8J+5LaW8YYg6JjGoBL
 ItlclGfBKbLpmc1b9VYiAw8w1PA7ocKr6DVf7nTAVdmS9EY8HT5AMnCGX7svLNhzzUppO0cPSf1
 8f6AGLmeFKbMpgfkpJFIQLfJDENhLtd3S1O2Myy4xQLrmhtbbKsSuQiiXtWRxlotf/WrLWA9FZr
 GMIhOPjPkR9xwrX/uDwWV0xl4MHzhkQVb1lTi1ulqc6IEPfMzkonOdTvjdfAlA4iTA==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38dc9343f89mr13325592f8f.33.1739216349513; 
 Mon, 10 Feb 2025 11:39:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOm3YA+KmUhyhlND1SLmjpOJWvwKHSp1MsMH3YdrdBRb69cVHv165Q1M/eFn8bTRexW9yPlw==
X-Received: by 2002:a05:6000:1448:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38dc9343f89mr13325571f8f.33.1739216349113; 
 Mon, 10 Feb 2025 11:39:09 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dca0b4237sm10326047f8f.85.2025.02.10.11.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:39:07 -0800 (PST)
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
Subject: [PATCH v2 17/17] mm/rmap: avoid -EBUSY from make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:59 +0100
Message-ID: <20250210193801.781278-18-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8qkC9ayfz4DnEyn9hpmiLTrVHucRP_bGA5f71bLEEVU_1739216349
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

Failing to obtain the folio lock, for example because the folio is
concurrently getting migrated or swapped out, can easily make the callers
fail: for example, the hmm selftest can sometimes be observed to fail
because of this. Instead of forcing the caller to retry, let's simply
retry in this to-be-expected case.

Similarly, avoid spurious failures simply because we raced with someone
(e.g., swapout) modifying the page table such that our folio_walk fails.

Simply unconditionally lock the folio, and retry GUP if our folio_walk
fails. Note that the folio_walk repeatedly failing is not something we
expect.

Note that we might want to avoid grabbing the folio lock at some point;
for now, keep that as is and only unconditionally lock the folio.

With this change, the hmm selftests don't fail simply because the folio
is already locked. While this fixes the selftests in some cases, it's
likely not something that deserves a "Fixes:".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index e2a543f639ce3..0f760b93fc0a2 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2435,6 +2435,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	struct page *page;
 	swp_entry_t entry;
 	pte_t swp_pte;
+	int ret;
 
 	mmap_assert_locked(mm);
 	addr = PAGE_ALIGN_DOWN(addr);
@@ -2448,6 +2449,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * fault will trigger a conversion to an ordinary
 	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
+retry:
 	page = get_user_page_vma_remote(mm, addr,
 					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
 					&vma);
@@ -2460,9 +2462,10 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 
-	if (!folio_trylock(folio)) {
+	ret = folio_lock_killable(folio);
+	if (ret) {
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		return ERR_PTR(ret);
 	}
 
 	/*
@@ -2488,7 +2491,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 		mmu_notifier_invalidate_range_end(&range);
 		folio_unlock(folio);
 		folio_put(folio);
-		return ERR_PTR(-EBUSY);
+		goto retry;
 	}
 
 	/* Nuke the page table entry so we get the uptodate dirty bit. */
-- 
2.48.1

