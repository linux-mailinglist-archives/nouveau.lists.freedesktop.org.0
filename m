Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42783FBF2
	for <lists+nouveau@lfdr.de>; Mon, 29 Jan 2024 02:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0D10FA00;
	Mon, 29 Jan 2024 01:51:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326B310FA00
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jan 2024 01:51:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-zccrRsbzO4eh76fT-RC1lA-1; Sun, 28 Jan 2024 20:50:56 -0500
X-MC-Unique: zccrRsbzO4eh76fT-RC1lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27A2B185A780;
 Mon, 29 Jan 2024 01:50:56 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23BD640C9444;
 Mon, 29 Jan 2024 01:50:54 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: offload fence uevents work to workqueue
Date: Mon, 29 Jan 2024 11:50:53 +1000
Message-ID: <20240129015053.1687418-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

This should break the deadlock between the fctx lock and the irq lock.

This offloads the processing off the work from the irq into a workqueue.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 24 ++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index ca762ea55413..93f08f9479d8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -103,6 +103,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *f=
ctx, int error)
 void
 nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
 {
+=09cancel_work_sync(&fctx->uevent_work);
 =09nouveau_fence_context_kill(fctx, 0);
 =09nvif_event_dtor(&fctx->event);
 =09fctx->dead =3D 1;
@@ -145,12 +146,13 @@ nouveau_fence_update(struct nouveau_channel *chan, st=
ruct nouveau_fence_chan *fc
 =09return drop;
 }
=20
-static int
-nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u3=
2 repc)
+static void
+nouveau_fence_uevent_work(struct work_struct *work)
 {
-=09struct nouveau_fence_chan *fctx =3D container_of(event, typeof(*fctx), =
event);
+=09struct nouveau_fence_chan *fctx =3D container_of(work, struct nouveau_f=
ence_chan,
+=09=09=09=09=09=09       uevent_work);
 =09unsigned long flags;
-=09int ret =3D NVIF_EVENT_KEEP;
+=09int drop =3D 0;
=20
 =09spin_lock_irqsave(&fctx->lock, flags);
 =09if (!list_empty(&fctx->pending)) {
@@ -160,11 +162,20 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *=
event, void *repv, u32 repc
 =09=09fence =3D list_entry(fctx->pending.next, typeof(*fence), head);
 =09=09chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&=
fctx->lock));
 =09=09if (nouveau_fence_update(chan, fctx))
-=09=09=09ret =3D NVIF_EVENT_DROP;
+=09=09=09drop =3D 1;
 =09}
+=09if (drop)
+=09=09nvif_event_block(&fctx->event);
+
 =09spin_unlock_irqrestore(&fctx->lock, flags);
+}
=20
-=09return ret;
+static int
+nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u3=
2 repc)
+{
+=09struct nouveau_fence_chan *fctx =3D container_of(event, typeof(*fctx), =
event);
+=09schedule_work(&fctx->uevent_work);
+=09return NVIF_EVENT_KEEP;
 }
=20
 void
@@ -178,6 +189,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan,=
 struct nouveau_fence_cha
 =09} args;
 =09int ret;
=20
+=09INIT_WORK(&fctx->uevent_work, nouveau_fence_uevent_work);
 =09INIT_LIST_HEAD(&fctx->flip);
 =09INIT_LIST_HEAD(&fctx->pending);
 =09spin_lock_init(&fctx->lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouv=
eau/nouveau_fence.h
index 64d33ae7f356..8bc065acfe35 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,6 +44,7 @@ struct nouveau_fence_chan {
 =09u32 context;
 =09char name[32];
=20
+=09struct work_struct uevent_work;
 =09struct nvif_event event;
 =09int notify_ref, dead, killed;
 };
--=20
2.43.0

