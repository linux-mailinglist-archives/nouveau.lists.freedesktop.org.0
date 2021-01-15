Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8A2F88D0
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 23:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B06D6E4B5;
	Fri, 15 Jan 2021 22:51:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260936E0BF
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610724839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wfh7XXE4FaRL189SEXwAsYtzgDt+BP8Y2RI5c8Q+mik=;
 b=ijo63HxKiZu1TtPTkRFW89RB9bsUQBknZtKokOn2bCgUffuwQCBRtAciz7Yy+MNw0y3Pbb
 bsJUGOkA1Srg0+GXPpGo1O2s3OtmDDi4ABzd9p1KnZqfTItAaX7DorQWE+AGoDzda/SwjK
 z4oMZq77nr2FHHpyv/ZE9IOaVWInT64=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-576CoYCVNpmB_UwiCJ4XZA-1; Fri, 15 Jan 2021 10:33:55 -0500
X-MC-Unique: 576CoYCVNpmB_UwiCJ4XZA-1
Received: by mail-qv1-f70.google.com with SMTP id u8so7997563qvm.5
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 07:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wfh7XXE4FaRL189SEXwAsYtzgDt+BP8Y2RI5c8Q+mik=;
 b=h86qzCnVEJZOE26S8tjFAoavzsRmpH61QKMLdQewg4aLdR9gcpSuLr7GSS7Rhiea1e
 /oBBH2hpBLyHVQ9cnEH5H4YkIQalgRXbNeQJ2qJjQMtHNk0/M/4FTyI09NMkeZ6z6c5g
 7RMCWRhPqFxxqkxT2Ygm+2j5cEqNjUYhhQe7p3FSTjYeTej33KLqQATmLDhtA+wx1MLl
 sGtjmLKW0QGFQaJ4P+NqSEE85rLT7A1st3CeX6ZYBhlaz03wiAyc5t3B7xT0CGO3VeOJ
 iyryV6T//bRwhv9iaQDafQgSJbbEbM5Cn6abfOt221ND1xP3Y3YFnDZAsYWzs2GaQ3aR
 RFQg==
X-Gm-Message-State: AOAM532NlkG6/GzTK+0OgPEogzjuhFTE1gLHBRWi/foxkm2K/3H03bqG
 tj0APF13PDCEBFtTwyd/yIrMR5O/q8gkEVODpMGzTm7T9PvGMIvQWhRYRHEDS7YGMCoQF+8rTBy
 jOA+X4D3KSue1uwmgqRM5C3PjgQ==
X-Received: by 2002:ac8:6f69:: with SMTP id u9mr11943472qtv.16.1610724834406; 
 Fri, 15 Jan 2021 07:33:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2Z2TMToLc+Z+6dBEeTfi85S/wapTmboEB97lvUvbgxb5jxMVSAs2sw7Z/VqdvS8Bp87Rn7g==
X-Received: by 2002:ac8:6f69:: with SMTP id u9mr11943450qtv.16.1610724834214; 
 Fri, 15 Jan 2021 07:33:54 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id q185sm5228245qka.96.2021.01.15.07.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:33:53 -0800 (PST)
From: trix@redhat.com
To: rostedt@goodmis.org, mingo@kernel.org, karolherbst@gmail.com,
 ppaalanen@gmail.com
Date: Fri, 15 Jan 2021 07:33:48 -0800
Message-Id: <20210115153348.131791-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Fri, 15 Jan 2021 22:51:40 +0000
Subject: [Nouveau] [PATCH] tracing: remove definition of DEBUG
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
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
 kernel/trace/trace_mmiotrace.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 84582bf1ed5f..2c3c31791497 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2008 Pekka Paalanen <pq@iki.fi>
  */
 
-#define DEBUG 1
-
 #include <linux/kernel.h>
 #include <linux/mmiotrace.h>
 #include <linux/pci.h>
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
