Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4E1B8350
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BDC6EB8E;
	Sat, 25 Apr 2020 02:52:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879216EAFF
 for <nouveau@lists.freedesktop.org>; Wed,  8 Apr 2020 20:53:53 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id q2so5486088otk.7
 for <nouveau@lists.freedesktop.org>; Wed, 08 Apr 2020 13:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfXAIkbDtUGinj6WrImltHTYGnIkr+5/g1NS9il9oS8=;
 b=XW2/PvNiCbDbqg1qIEUP+SDZWS/QDrIwGgt7a80/JPCdaxiv0JOddv/AJg1D2Jwos2
 qdPYcnWODW60kfp6dyQiLT23lE9iB1XhdjIS36/PtR4emONAsdoFsr32yqSX11Gh8JQu
 BnWjS5bja9nEDuC7kjQU8zveJsQ99ZVtk6dManvqOQu4qSZW6yuxK90d47w0GfeeUD8K
 8GYrZvdU1jWD9d06NTj/hAT0MDXBsQ2+lIAUlOnyv0wnYoONhmlrp/GwZ7TCbrc6twGi
 vB5jmbnJgic6i6JgF4msOlzJSk9YU1qrig1rpY7Xj75Ua9ea4pBDP2RxblT+BVUcby7c
 cRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfXAIkbDtUGinj6WrImltHTYGnIkr+5/g1NS9il9oS8=;
 b=NmD+HDjkpkh1QkbG1KxcfRwShCxiI3X4VZPQb8aeRicH7Pqth568hHE6GMD8ptYzmY
 JCXjX8/xQPgNeff6EQe6e4kbZtocTSclgDzaBLxjnPBFiTcT3CKgDhlcIRu8uN8nftn+
 q8lpn1fsHe6btZxPFGdlM6Vbgf7A2kXPvUHVqpp8RZu535bkRntXYtCSmrUWPxb8AJTl
 pLG6EQtsk0JGWgL0pMIw2aFufY/UZf3qjKN9E9fnd0u7l+o+GbrBmjQfmq2TQWu0+X0z
 xVeVHcVTrvjofxFRSwLsSlshXNvTqcnmEcv2cmzsDU/G0y1J70JjTZLqJXbjSWA1lYqy
 k8TA==
X-Gm-Message-State: AGi0PuaA2+O2Y84Tycmook7olhCEGSPm+iXOTUTKi6cSPugkbdsOo45S
 JATvxtnWwbm8YR/QwOQpe+8=
X-Google-Smtp-Source: APiQypKeT8Ad8HdctOjnsH1U3qP029nJsaCkUq0Ua1Ksvg/VeivD8Z6SfY8CTSNFBeiOEkTiPiObsg==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr7180137otl.51.1586379232632; 
 Wed, 08 Apr 2020 13:53:52 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id m15sm2055883otp.11.2020.04.08.13.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 13:53:52 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>
Date: Wed,  8 Apr 2020 13:53:23 -0700
Message-Id: <20200408205323.44490-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: [Nouveau] [PATCH] x86: mmiotrace: Use cpumask_available for
 cpumask_var_t variables
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
 clang-built-linux@googlegroups.com, Pekka Paalanen <ppaalanen@gmail.com>,
 Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When building with Clang + -Wtautological-compare and
CONFIG_CPUMASK_OFFSTACK unset:

arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
equal to a null pointer is always false [-Wtautological-pointer-compare]
        if (downed_cpus == NULL &&
            ^~~~~~~~~~~    ~~~~
arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
equal to a null pointer is always false [-Wtautological-pointer-compare]
        if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
            ^~~~~~~~~~~    ~~~~
2 warnings generated.

Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
cpumask_available to fix warnings of this nature. Use that here so that
clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.

Link: https://github.com/ClangBuiltLinux/linux/issues/982
Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/x86/mm/mmio-mod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index 109325d77b3e..43fd19b3f118 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
 	int cpu;
 	int err;
 
-	if (downed_cpus == NULL &&
+	if (!cpumask_available(downed_cpus) &&
 	    !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
 		pr_notice("Failed to allocate mask\n");
 		goto out;
@@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
 	int cpu;
 	int err;
 
-	if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
+	if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
 		return;
 	pr_notice("Re-enabling CPUs...\n");
 	for_each_cpu(cpu, downed_cpus) {

base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
-- 
2.26.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
