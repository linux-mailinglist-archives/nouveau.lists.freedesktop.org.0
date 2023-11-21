Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36137F3722
	for <lists+nouveau@lfdr.de>; Tue, 21 Nov 2023 21:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192A510E4F7;
	Tue, 21 Nov 2023 20:11:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DEC10E4F7
 for <nouveau@lists.freedesktop.org>; Tue, 21 Nov 2023 20:11:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-GGFD2MBzMaKzLGUI1ZKrUw-1; Tue, 21 Nov 2023 15:11:12 -0500
X-MC-Unique: GGFD2MBzMaKzLGUI1ZKrUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6C285A59D;
 Tue, 21 Nov 2023 20:11:12 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CBB72026D4C;
 Tue, 21 Nov 2023 20:11:10 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 22 Nov 2023 06:11:09 +1000
Message-ID: <20231121201109.2988516-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau/gsp: allocate enough space for all
 channel ids.
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

This probably isn't the ideal fix, but we ended up using chids
sparsely, and lots of things rely on indexing into the full range,
so just allocate the full range up front.

The GSP code fixes 8 channels into a userd page, but we end up using
a single userd page per channel so end up sparsely using the range.

Fixes a few crashes seen with multiple channels.

Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/277
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/fifo/r535.c
index 3adbb05ff587..d088e636edc3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -539,7 +539,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 =09struct nvkm_runl *runl;
 =09struct nvkm_engn *engn;
 =09u32 cgids =3D 2048;
-=09u32 chids =3D 2048 / CHID_PER_USERD;
+=09u32 chids =3D 2048;
 =09int ret;
 =09NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
=20
--=20
2.42.0

