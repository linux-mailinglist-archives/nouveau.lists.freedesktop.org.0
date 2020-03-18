Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFFE18935C
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 02:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0F96E84A;
	Wed, 18 Mar 2020 01:00:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFBD6E849
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 01:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584493253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+anuAZg2McgqBP3BShLjEUycQdR9HfxTihe0e6wuS0=;
 b=EIxJZ9x/YoNmtRij+6BqO/2RgIrzaoMf8YchKi0pWeph46N75mLJ1OfpjnMmjbYq9vuQlQ
 nC14KGNilXR42RjTS35K9iTXMlaOfIrQoJrZhE2UsoqGwsa2pda6qlTSEbtfklfaQg73Si
 ZPm2saFreGf99IJotTwl8JCPUGk/k4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-S7BeyxhFMh6MQHtGtEUX5Q-1; Tue, 17 Mar 2020 21:00:51 -0400
X-MC-Unique: S7BeyxhFMh6MQHtGtEUX5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAFBD18FF667;
 Wed, 18 Mar 2020 01:00:50 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628E060BFB;
 Wed, 18 Mar 2020 01:00:50 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 21:00:44 -0400
Message-Id: <20200318010047.237024-2-lyude@redhat.com>
In-Reply-To: <20200318010047.237024-1-lyude@redhat.com>
References: <20200318010047.237024-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 1/4] lib/igt_core: Add igt_require_fd()
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_assert_fd(), but using igt_require() instead

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index fae5f59e..b66336cf 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1008,6 +1008,18 @@ void igt_describe_f(const char *fmt, ...);
 	else igt_debug("Test requirement passed: %s\n", #expr); \
 } while (0)
 
+/**
+ * igt_require_fd:
+ * @fd: file descriptor
+ *
+ * Skips (sub-) test if the given file descriptor is invalid.
+ *
+ * Like igt_require(), but displays the values being compared on failure instead
+ * of simply printing the stringified expression..
+ */
+#define igt_require_fd(fd) \
+	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
+
 /**
  * igt_skip_on_f:
  * @expr: condition to test
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
