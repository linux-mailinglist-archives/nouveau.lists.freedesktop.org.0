Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E0804467
	for <lists+nouveau@lfdr.de>; Tue,  5 Dec 2023 03:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996F210E461;
	Tue,  5 Dec 2023 02:01:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7045E10E461
 for <nouveau@lists.freedesktop.org>; Tue,  5 Dec 2023 02:01:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-DFZ8RA9BOmmUbF1YbWpbLA-1; Mon, 04 Dec 2023 21:01:03 -0500
X-MC-Unique: DFZ8RA9BOmmUbF1YbWpbLA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9475C101A53B;
 Tue,  5 Dec 2023 02:01:03 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F10492BE0;
 Tue,  5 Dec 2023 02:01:02 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue,  5 Dec 2023 12:01:01 +1000
Message-ID: <20231205020101.746744-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau/gsp: drop the gsp failure message to a
 debug.
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

These can happen in normal operations esp with auxch transactions.

Gets rid of
nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x00730000 ctrl cmd:0x0073134=
1 failed: 0x0000ffff
in logs.

Cc: Lyude <lyude@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 72c14e7f6566..e72fe1ed0e8f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -641,7 +641,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *objec=
t, void *argv, u32 repc)
 =09=09return rpc;
=20
 =09if (rpc->status) {
-=09=09nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x fail=
ed: 0x%08x\n",
+=09=09nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x fail=
ed: 0x%08x\n",
 =09=09=09   object->client->object.handle, object->handle, rpc->cmd, rpc->=
status);
 =09=09ret =3D ERR_PTR(-EINVAL);
 =09} else {
--=20
2.43.0

