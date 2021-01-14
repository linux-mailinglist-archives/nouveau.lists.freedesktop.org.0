Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A02F66DD
	for <lists+nouveau@lfdr.de>; Thu, 14 Jan 2021 18:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC3A89D9B;
	Thu, 14 Jan 2021 17:10:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27D6E432
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610639894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=At1pxx2fmt1WO+Rmj3gTIFAZaoXRqCHIYYWGJ4oZ7Vs=;
 b=Gs57mGxiQjRSuSxXAamU2Vn4CfA7mCFOAAAPL+GDWZTpAIYIKPTIhei+wPHsXa1KhaSSFK
 myTPtBAfSl7MNhQPqZu09qRWszcO2up1yhf73oVDpjPPBqYNSxCoJsbpNWU4wPKRzi5vcu
 tRQWGCpP4MvHsvPHxa84gD0pWT1cpp8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-lajDVyPnNu2sXeNrZzMzxg-1; Thu, 14 Jan 2021 10:58:12 -0500
X-MC-Unique: lajDVyPnNu2sXeNrZzMzxg-1
Received: by mail-qk1-f197.google.com with SMTP id n13so5129626qkn.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 07:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=At1pxx2fmt1WO+Rmj3gTIFAZaoXRqCHIYYWGJ4oZ7Vs=;
 b=L/vqtjsz3Th1l4CtQG1b8nEvRIfIvTw/GEvVcArW7G+3VH0zUKoiA2YUk2J5f1FxW5
 tPAdObUHSidjnILEgP0l1nkSpD9Fq1+Xd54eAVrKp7XIUdj3d1MH9vIjZ2z9DOc2EqcZ
 DmvSSIqT1ywnz5bxM4bsvrqfGfLlIl9gd84On5Le4Ouj+sdw1uvIw7UT7hEk7pXUkKak
 pQn4uygarOnJReGUOz7R7lCsWhin9fVKx5dBOokCs7qla2K/pEg3fIhiSCszNKMa/mQP
 ZKaXsYiug2cj5MDbwG9iKE6XdvIqHfAHJYSrkpM6Lc1F7ZJhVlZsyVVaZ062/SanSZxL
 UPqA==
X-Gm-Message-State: AOAM532seyf9LX6YKjDDT5hqFd2IJ5uTsiYuX5XcMpr3bQo0MB3rHW8S
 jNZ/SNfGp42lbB/cdWlSnFgyfe+fJ/vpVnsh2rC3QcAMHgFowBEAzwGpSxHkqNzA0C0KD5VK2AE
 hlbgP2ll0385Wq5mR0qnrL2uwaQ==
X-Received: by 2002:ad4:5445:: with SMTP id h5mr7495276qvt.22.1610639892059;
 Thu, 14 Jan 2021 07:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNJ/OjrPKJaBcEtfj6OjYKiknPYFfxrUC/tVzu4Dv2nkU5I22OSsFjRKbNhxExcoccagPBgg==
X-Received: by 2002:ad4:5445:: with SMTP id h5mr7495241qvt.22.1610639891841;
 Thu, 14 Jan 2021 07:58:11 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 14sm3171968qkv.25.2021.01.14.07.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:58:11 -0800 (PST)
From: trix@redhat.com
To: rostedt@goodmis.org, mingo@kernel.org, karolherbst@gmail.com,
 ppaalanen@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, bp@alien8.de, hpa@zytor.com
Date: Thu, 14 Jan 2021 07:58:04 -0800
Message-Id: <20210114155804.17325-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 14 Jan 2021 17:09:58 +0000
Subject: [Nouveau] [PATCH] x86 mmiotrace: remove definition of DEBUG
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
 arch/x86/mm/mmio-mod.c | 2 --
 1 file changed, 2 deletions(-)

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
