Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFEA7780C6
	for <lists+nouveau@lfdr.de>; Thu, 10 Aug 2023 20:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36710E5DE;
	Thu, 10 Aug 2023 18:52:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF32910E5DF
 for <nouveau@lists.freedesktop.org>; Thu, 10 Aug 2023 18:52:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-BsXhqFNBP9qcTiDQJG-Jww-1; Thu, 10 Aug 2023 14:50:23 -0400
X-MC-Unique: BsXhqFNBP9qcTiDQJG-Jww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1B301C05149;
 Thu, 10 Aug 2023 18:50:22 +0000 (UTC)
Received: from nomad.redhat.com (unknown [10.64.136.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6AB63A52;
 Thu, 10 Aug 2023 18:50:21 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 11 Aug 2023 04:50:20 +1000
Message-ID: <20230810185020.231135-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau/u_memcpya: use vmemdup_user
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

I think there are limit checks in places for most things but the
new api wants to not have them.

Add a limit check and use the vmemdup_user helper instead.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouvea=
u/nouveau_drv.h
index 54063b094a69..8a7357688aff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -189,21 +189,12 @@ u_free(void *addr)
 static inline void *
 u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 {
-=09void *mem;
-=09void __user *userptr =3D (void __force __user *)(uintptr_t)user;
+=09void __user *userptr =3D u64_to_user_ptr(user);
+=09size_t bytes;
=20
-=09size *=3D nmemb;
-
-=09mem =3D kvmalloc(size, GFP_KERNEL);
-=09if (!mem)
-=09=09return ERR_PTR(-ENOMEM);
-
-=09if (copy_from_user(mem, userptr, size)) {
-=09=09u_free(mem);
-=09=09return ERR_PTR(-EFAULT);
-=09}
-
-=09return mem;
+=09if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
+=09=09return NULL;
+=09return vmemdup_user(userptr, bytes);
 }
=20
 #include <nvif/object.h>
--=20
2.41.0

