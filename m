Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D57785DE
	for <lists+nouveau@lfdr.de>; Fri, 11 Aug 2023 05:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAA710E62A;
	Fri, 11 Aug 2023 03:15:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 30299 seconds by postgrey-1.36 at gabe;
 Fri, 11 Aug 2023 03:15:25 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2E510E62A
 for <nouveau@lists.freedesktop.org>; Fri, 11 Aug 2023 03:15:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-KF6GUfuRPI21oXaGZlRgtw-1; Thu, 10 Aug 2023 23:15:23 -0400
X-MC-Unique: KF6GUfuRPI21oXaGZlRgtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6957800159;
 Fri, 11 Aug 2023 03:15:22 +0000 (UTC)
Received: from nomad.redhat.com (unknown [10.64.136.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB401C15BAE;
 Fri, 11 Aug 2023 03:15:21 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 11 Aug 2023 13:15:20 +1000
Message-ID: <20230811031520.248341-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau: find the smallest page allocation to
 cover a buffer alloc.
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

With the new uapi we don't have the comp flags on the allocation,
so we shouldn't be using the first size that works, we should be
iterating until we get the correct one.

This reduces allocations from 2MB to 64k in lots of places.

Fixes dEQP-VK.memory.allocation.basic.size_8KiB.forward.count_4000
on my ampere/gsp system.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index 949195d5d782..a6993c7807b6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -318,8 +318,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, in=
t *align, u32 domain,
 =09=09=09    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
 =09=09=09=09continue;
=20
-=09=09=09if (pi < 0)
-=09=09=09=09pi =3D i;
+=09=09=09/* pick the last one as it will be smallest. */
+=09=09=09pi =3D i;
+
 =09=09=09/* Stop once the buffer is larger than the current page size. */
 =09=09=09if (*size >=3D 1ULL << vmm->page[i].shift)
 =09=09=09=09break;
--=20
2.41.0

