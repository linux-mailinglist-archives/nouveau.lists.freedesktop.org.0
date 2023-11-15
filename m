Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF57EC57E
	for <lists+nouveau@lfdr.de>; Wed, 15 Nov 2023 15:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AE010E05E;
	Wed, 15 Nov 2023 14:39:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF48D10E033
 for <nouveau@lists.freedesktop.org>; Wed, 15 Nov 2023 14:39:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-LmN1Ew95OaCIF7_Q0vhODw-1; Wed, 15 Nov 2023 09:39:40 -0500
X-MC-Unique: LmN1Ew95OaCIF7_Q0vhODw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7FFF867900;
 Wed, 15 Nov 2023 14:39:39 +0000 (UTC)
Received: from ultimate.redhat.com (unknown [10.64.136.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42BA22166B28;
 Wed, 15 Nov 2023 14:39:36 +0000 (UTC)
From: airlied@gmail.com
To: dri-devel@lists.freedesktop.org
Date: Thu, 16 Nov 2023 00:39:33 +1000
Message-ID: <20231115143933.261287-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau: don't fail driver load if no display hw
 present.
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
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

If we get back ENODEV don't fail load. There are nvidia devices
that don't have display blocks and the driver should work on those.

Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/270
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/no=
uveau/nouveau_display.c
index d8c92521226d9..f28f9a8574586 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -726,6 +726,11 @@ nouveau_display_create(struct drm_device *dev)
=20
 =09if (nouveau_modeset !=3D 2) {
 =09=09ret =3D nvif_disp_ctor(&drm->client.device, "kmsDisp", 0, &disp->dis=
p);
+=09=09/* no display hw */
+=09=09if (ret =3D=3D -ENODEV) {
+=09=09=09ret =3D 0;
+=09=09=09goto disp_create_err;
+=09=09}
=20
 =09=09if (!ret && (disp->disp.outp_mask || drm->vbios.dcb.entries)) {
 =09=09=09nouveau_display_create_properties(dev);
--=20
2.41.0

