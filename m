Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CB9C21DB
	for <lists+nouveau@lfdr.de>; Fri,  8 Nov 2024 17:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618B410EA03;
	Fri,  8 Nov 2024 16:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TIdQRGaR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DE210EA01
 for <nouveau@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:51 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-381e8cf69a6so1200478f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082849; x=1731687649;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c97rKSzu5OtSEQDwZyqgn1x58KOnaAilRAoGtwwyknw=;
 b=TIdQRGaRQkOnbts0K12ZCrSRngdYoa8MKqd2lMK2zMO8Vq1a6Wlr8h/7RRF4MHTU6t
 rEQHsLIRFj3Rd+lQYQWVrFxEETvl16znAj8yNv+iOvaRFRTRiFPy7K4qCFXJSCXynKR2
 7YUojqsjAR9RNkB3b408UFSrngfV6Lj+IqvEV38F7q0V9Rf6KXtMsf0OUvxWItlee/Wk
 K+87j4U44WGbDjx3FBDMXJ35hO5sJhgGBpNGn/k1RjeRoPqGwcCgUAHNfib770N7AlKf
 pOrQmCqK20R/OPl/bQ9/GhDP9+gEaGDU+EYSqFin1Ixq3ftTIN7yr/gAlRTV2Sm7vBTR
 DHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082849; x=1731687649;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c97rKSzu5OtSEQDwZyqgn1x58KOnaAilRAoGtwwyknw=;
 b=Cc+IOBPXZ+1xGtbJmzhX0YWW+4Kn09eiI9RtQynMd09435Fmml6JY+1a6EsKwMZ3BN
 CVAPF2sy/QDbSq8P7qbciI70z8kcuYKEQD5noXwt6UejwnJ8loN3z0+Ir7AKp81oqsdy
 X+FK0ZlWhILvP28espAN2Nr2Xtjgbfh/a0HJaYH23VpIWJW0fHVooxEtgeRSSF+CUQkm
 Qsu/pisDq7jA1p7JX+BngzMVzp/3SD7mn4mYL9fXC4eJIdNP3WoRgdwHZgyXzDD7Gyse
 OoPBrKqHP5iYdI8qgnAsnKGDonBpA1olzU3uTcE++2kODN++y5TuMDXGEzsmsrIEEPd4
 Uzdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwh1nChZxiCAe3rRw+gogOqlDPhy6zfXCURrDqauvkd14DlwVJDNziMf19uozvylXQSr+W2Vuk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5JdqqVTRpREJZwbL/aab4UoW1aQvRdPAYHW0KIHWS1kLFQegD
 FwOhb8F1wfFAE9aLH5+dcQr957EyxaY/6FjV5zVyauNrbh3EA2sP0vVEpWfuJ3/jBtOT5TKB7A=
 =
X-Google-Smtp-Source: AGHT+IELhlKA+w5GoDYCQVGGU0Q69yO5Jt+Zri88wGQ6Nd2QAGecV+Ce7InAsjA0a+zrL4cO721qJjhh5w==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:4f84:0:b0:381:d049:c688 with
 SMTP id
 ffacd0b85a97d-381f1884303mr2415f8f.9.1731082849389; Fri, 08 Nov 2024 08:20:49
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:33 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-4-tabba@google.com>
Subject: [RFC PATCH v1 03/10] mm/hugetlb: rename
 "folio_putback_active_hugetlb()" to "folio_putback_hugetlb()"
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

Now that folio_putback_hugetlb() is only called on folios that were
previously isolated through folio_isolate_hugetlb(), let's rename it to
match folio_putback_lru().

Add some kernel doc to clarify how this function is supposed to be used.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            | 15 +++++++++++++--
 mm/migrate.c            |  6 +++---
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index b0cf8dbfeb6a..e846d7dac77c 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -157,7 +157,7 @@ bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list);
 int get_hwpoison_hugetlb_folio(struct folio *folio, bool *hugetlb, bool unpoison);
 int get_huge_page_for_hwpoison(unsigned long pfn, int flags,
 				bool *migratable_cleared);
-void folio_putback_active_hugetlb(struct folio *folio);
+void folio_putback_hugetlb(struct folio *folio);
 void move_hugetlb_state(struct folio *old_folio, struct folio *new_folio, int reason);
 void hugetlb_fix_reserve_counts(struct inode *inode);
 extern struct mutex *hugetlb_fault_mutex_table;
@@ -430,7 +430,7 @@ static inline int get_huge_page_for_hwpoison(unsigned long pfn, int flags,
 	return 0;
 }
 
-static inline void folio_putback_active_hugetlb(struct folio *folio)
+static inline void folio_putback_hugetlb(struct folio *folio)
 {
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da3fe1840ab8..d58bd815fdf2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7409,7 +7409,7 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
  * it is already isolated/non-migratable.
  *
  * On success, an additional folio reference is taken that must be dropped
- * using folio_putback_active_hugetlb() to undo the isolation.
+ * using folio_putback_hugetlb() to undo the isolation.
  *
  * Return: True if isolation worked, otherwise False.
  */
@@ -7461,7 +7461,18 @@ int get_huge_page_for_hwpoison(unsigned long pfn, int flags,
 	return ret;
 }
 
-void folio_putback_active_hugetlb(struct folio *folio)
+/**
+ * folio_putback_hugetlb: unisolate a hugetlb folio
+ * @folio: the isolated hugetlb folio
+ *
+ * Putback/un-isolate the hugetlb folio that was previous isolated using
+ * folio_isolate_hugetlb(): marking it non-isolated/migratable and putting it
+ * back onto the active list.
+ *
+ * Will drop the additional folio reference obtained through
+ * folio_isolate_hugetlb().
+ */
+void folio_putback_hugetlb(struct folio *folio)
 {
 	spin_lock_irq(&hugetlb_lock);
 	folio_set_hugetlb_migratable(folio);
diff --git a/mm/migrate.c b/mm/migrate.c
index b129dc41c140..89292d131148 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -145,7 +145,7 @@ void putback_movable_pages(struct list_head *l)
 
 	list_for_each_entry_safe(folio, folio2, l, lru) {
 		if (unlikely(folio_test_hugetlb(folio))) {
-			folio_putback_active_hugetlb(folio);
+			folio_putback_hugetlb(folio);
 			continue;
 		}
 		list_del(&folio->lru);
@@ -1459,7 +1459,7 @@ static int unmap_and_move_huge_page(new_folio_t get_new_folio,
 
 	if (folio_ref_count(src) == 1) {
 		/* page was freed from under us. So we are done. */
-		folio_putback_active_hugetlb(src);
+		folio_putback_hugetlb(src);
 		return MIGRATEPAGE_SUCCESS;
 	}
 
@@ -1542,7 +1542,7 @@ static int unmap_and_move_huge_page(new_folio_t get_new_folio,
 	folio_unlock(src);
 out:
 	if (rc == MIGRATEPAGE_SUCCESS)
-		folio_putback_active_hugetlb(src);
+		folio_putback_hugetlb(src);
 	else if (rc != -EAGAIN)
 		list_move_tail(&src->lru, ret);
 
-- 
2.47.0.277.g8800431eea-goog

