Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD033FB7C
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268EF6E85A;
	Wed, 17 Mar 2021 22:50:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BFA6E04E
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCG2JCN3yxakZTZrjqGekPbP/9d8eV0NksF/GHzo2yQ=;
 b=blyL6XY81FygnA9WDdgLsXRbf3v4jGgE6PqtNm2kb9+ZlzGBCxy+JTlMx/Z+RPmk3G716i
 Xor66SoelDkl1W2zvmu0f81rVmtE9768YI/zGBBrpf6Pf4XLYoIuUu0Nv8odXiGzUMCiPg
 ax8FjxmFAE/sMKQ+rUSFOcBIHT3wZQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-8n4nC_x-Nt-PBdrjNOcXrQ-1; Wed, 17 Mar 2021 18:50:08 -0400
X-MC-Unique: 8n4nC_x-Nt-PBdrjNOcXrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C4BE180FCA9;
 Wed, 17 Mar 2021 22:50:07 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61015610F0;
 Wed, 17 Mar 2021 22:50:06 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:49:45 -0400
Message-Id: <20210317224949.448284-4-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 3/7] lib/drmtest: Remove i915 refs in
 do_ioctl*() docs
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

These aren't i915 specific, looks like some historical junk.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/drmtest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index c4b15a26..b933f76a 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -117,7 +117,7 @@ bool is_vc4_device(int fd);
 
 /**
  * do_ioctl:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @ioc: ioctl op definition from drm headers
  * @ioc_data: data pointer for the ioctl operation
  *
@@ -131,7 +131,7 @@ bool is_vc4_device(int fd);
 
 /**
  * do_ioctl_err:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @ioc: ioctl op definition from drm headers
  * @ioc_data: data pointer for the ioctl operation
  * @err: value to expect in errno
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
