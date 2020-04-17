Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E882C1AE74D
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 23:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268B6EB0D;
	Fri, 17 Apr 2020 21:10:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D046EB0C
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587157835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IG8ekl/VaYRoNoFa5g3hsxwAl0YPTxx2eWhECLnCOQI=;
 b=b2t3mcmo6yVD3jlgK8HoE8mRJ5PdaJE5/dcjsEoOqm1USKDndiLawkGxqkwVbBJsSzjmA1
 ezi6E0Oj+gANr/OedtTuB1xckrfImbc5dsCyRW2BrORuKT1eKl6Id16XibrYmd240k+VR6
 49gUoYpw2RPtWZIXUiiOEo9+k/B1L9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-M-uxaI2pOn2CjTcZQekfHw-1; Fri, 17 Apr 2020 17:10:33 -0400
X-MC-Unique: M-uxaI2pOn2CjTcZQekfHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A0C113F9;
 Fri, 17 Apr 2020 21:10:32 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5C95C221;
 Fri, 17 Apr 2020 21:10:31 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2020 17:10:22 -0400
Message-Id: <20200417211025.109574-3-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
References: <20200417211025.109574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v3 2/5] lib/igt_core: Add igt_require_fd()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_assert_fd(), but using igt_require() instead

Changes since v1:
* Fix documentation error in igt_require_fd() - Petri Latvala

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3f69b072..8f68b2dd 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1021,6 +1021,18 @@ void igt_describe_f(const char *fmt, ...);
 	else igt_debug("Test requirement passed: %s\n", #expr); \
 } while (0)
 
+/**
+ * igt_require_fd:
+ * @fd: file descriptor
+ *
+ * Skips (sub-) test if the given file descriptor is invalid.
+ *
+ * Like igt_require(), but displays the stringified identifier that was supposed
+ * to contain a valid fd on failure.
+ */
+#define igt_require_fd(fd) \
+	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
+
 /**
  * igt_skip_on_f:
  * @expr: condition to test
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
