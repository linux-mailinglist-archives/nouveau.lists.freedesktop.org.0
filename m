Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB81AE74C
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 23:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74DA6EB1C;
	Fri, 17 Apr 2020 21:10:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8986EB0D
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587157834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=we1bkTXKdVvFDsiBSVsCtHCZt4XHKKHILKX4dg9mrXw=;
 b=Q2WctiCtsAY/WLa703xfi1xn82dmMO8ddmHYSUSoDe5UmuacKWzc0yHRSMk8+dPTxupwLi
 9ENhFZNZhF4PhAmAZpE83ODfEsvEBTLFQddAp/GaSz6ZRZEEN+qXQQVqDumPMOuJmKmnvC
 dv+mh9t6O3u68QhDyLvOYif65/1kcGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-Z1p5U-_mME6u5xue2Erbpg-1; Fri, 17 Apr 2020 17:10:32 -0400
X-MC-Unique: Z1p5U-_mME6u5xue2Erbpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8BF8017F5;
 Fri, 17 Apr 2020 21:10:31 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D39B95C28E;
 Fri, 17 Apr 2020 21:10:30 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2020 17:10:21 -0400
Message-Id: <20200417211025.109574-2-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
References: <20200417211025.109574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v3 1/5] lib/igt_core: Fix igt_assert_fd()
 documentation
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

As Petri Latvala pointed out, some of the documentation in this macro is
mistakenly copied from the other igt_assert*() macros. Let's fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index b97fa2fa..3f69b072 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -966,8 +966,8 @@ void igt_describe_f(const char *fmt, ...);
  *
  * Fails (sub-) test if the given file descriptor is invalid.
  *
- * Like igt_assert(), but displays the values being compared on failure instead
- * of simply printing the stringified expression.
+ * Like igt_assert(), but displays the stringified identifier that was supposed
+ * to contain a valid fd on failure.
  */
 #define igt_assert_fd(fd) \
 	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
