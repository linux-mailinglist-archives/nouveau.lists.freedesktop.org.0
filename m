Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48462F6E3D
	for <lists+nouveau@lfdr.de>; Thu, 14 Jan 2021 23:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D046E040;
	Thu, 14 Jan 2021 22:32:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA176E15A
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610659718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3hpJw/GM23ZF6wgVTR+PJXyTiqzv/mqj3A+uP2OrRjw=;
 b=ea4XhiTKKkeuDQTJXKC+5NV3eyeM8dycsS9sVcg1piqqFXlT2P7Z8nNZKnmSBnhXpwnh13
 bYmxcRTGQteU61naHQ4gKoDmM2F3Gr6MO309PCr/lnMI4OPMmDoXjLpNLBKuYWFjQUzJeT
 KxfLPSWVpY3CQ796iM9bcNW6Pm4XbgA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-iB4Lp4MQOU-TvJ7x0Ip1eg-1; Thu, 14 Jan 2021 16:28:36 -0500
X-MC-Unique: iB4Lp4MQOU-TvJ7x0Ip1eg-1
Received: by mail-qv1-f72.google.com with SMTP id l7so5659774qvp.15
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 13:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hpJw/GM23ZF6wgVTR+PJXyTiqzv/mqj3A+uP2OrRjw=;
 b=G6aEqHlmqxtksldHG7IDE8+91d6YZd3lApgj1tV3HiFcG05bTitF98YsRWN48PKkbO
 b3H8SGtf7E7y73tCWP4zTZEomA9PPaJkkKCsgg3pZAdb9fBgG2NuKEPr9hF/fmvG5V/q
 crxJGvgiX2uN5XHWGFthucC529cqlHkNcRATa7xM+oRvT/kYjoLBAssJAFV4Xh0YolYd
 FhWqBWAaTsdtneOzD3QPA63kG3KTCHURHFMjL+XWg11OqotkiFxhrmbOC45sXn88fbU2
 aok++L+Ir4ZTmTfQNSv3ImAf3voI4nAmlN7c5woVHyQDnLLqHzcGLaofdlr7/xSYPMyO
 mNUg==
X-Gm-Message-State: AOAM5304DBcU4kAZz99xy6Ofn04IwjvuX/0bnw3XahXT7ySaShs0ze+K
 tRmVzXtoPQmt84Ra6gJur+Tcj4JZh/B5DIlDQ6qPFTgZMoEfR4NdX/AYHg2yLtc4QEHRd1e7qPG
 LbN3+oeN+muRrjf9y9ZDy4laFRQ==
X-Received: by 2002:a37:9a97:: with SMTP id c145mr9127873qke.350.1610659716435; 
 Thu, 14 Jan 2021 13:28:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwXwqofQw+JR0KIV3nSCBvZc3y4jxu//vFV9/vmnFh3/JUQ+stLAlnS+cwt2ArUikQVdJHOA==
X-Received: by 2002:a37:9a97:: with SMTP id c145mr9127838qke.350.1610659716149; 
 Thu, 14 Jan 2021 13:28:36 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id z10sm3769857qtm.54.2021.01.14.13.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 13:28:35 -0800 (PST)
From: trix@redhat.com
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 rostedt@goodmis.org, karolherbst@gmail.com, ppaalanen@gmail.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 alexandre.chartre@oracle.com, ying-tsun.huang@amd.com,
 mchehab+huawei@kernel.org, paulmck@kernel.org
Date: Thu, 14 Jan 2021 13:28:27 -0800
Message-Id: <20210114212827.47584-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 14 Jan 2021 22:32:44 +0000
Subject: [Nouveau] [PATCH v2] x86 : remove definition of DEBUG
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
Cc: nouveau@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v1: merge all 4 in arch/x86/
---
 arch/x86/kernel/cpu/mtrr/generic.c | 1 -
 arch/x86/kernel/cpu/mtrr/mtrr.c    | 2 --
 arch/x86/kernel/pci-iommu_table.c  | 3 ---
 arch/x86/mm/mmio-mod.c             | 2 --
 4 files changed, 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index a29997e6cf9e..b90f3f437765 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -3,7 +3,6 @@
  * This only handles 32bit MTRR on 32bit hosts. This is strictly wrong
  * because MTRRs can span up to 40 bits (36bits on most modern x86)
  */
-#define DEBUG
 
 #include <linux/export.h>
 #include <linux/init.h>
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 61eb26edc6d2..28c8a23aa42e 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -31,8 +31,6 @@
     System Programming Guide; Section 9.11. (1997 edition - PPro).
 */
 
-#define DEBUG
-
 #include <linux/types.h> /* FIXME: kvm_para.h needs this */
 
 #include <linux/stop_machine.h>
diff --git a/arch/x86/kernel/pci-iommu_table.c b/arch/x86/kernel/pci-iommu_table.c
index 2e9006c1e240..42e92ec62973 100644
--- a/arch/x86/kernel/pci-iommu_table.c
+++ b/arch/x86/kernel/pci-iommu_table.c
@@ -4,9 +4,6 @@
 #include <linux/string.h>
 #include <linux/kallsyms.h>
 
-
-#define DEBUG 1
-
 static struct iommu_table_entry * __init
 find_dependents_of(struct iommu_table_entry *start,
 		   struct iommu_table_entry *finish,
diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index bd7aff5c51f7..cd768dafca9e 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -10,8 +10,6 @@
 
 #define pr_fmt(fmt) "mmiotrace: " fmt
 
-#define DEBUG 1
-
 #include <linux/moduleparam.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
