Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E527FE52C
	for <lists+nouveau@lfdr.de>; Thu, 30 Nov 2023 02:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FDF10E380;
	Thu, 30 Nov 2023 01:08:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A31210E37C
 for <nouveau@lists.freedesktop.org>; Thu, 30 Nov 2023 01:08:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-eBkVA5UvP4C_m6ot36gLkw-1; Wed, 29 Nov 2023 20:08:55 -0500
X-MC-Unique: eBkVA5UvP4C_m6ot36gLkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B40E185A781;
 Thu, 30 Nov 2023 01:08:55 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B08D502A;
 Thu, 30 Nov 2023 01:08:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 30 Nov 2023 11:08:52 +1000
Message-ID: <20231130010852.4034774-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Subject: [Nouveau] [PATCH] nouveau/tu102: flush all pdbs on vmm flush
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

This is a hackaround a bug exposed with the GSP code, I'm not sure
what it happening exactly, but it appears some of our flushes don't
result in proper tlb invalidation for out BAR2 and we get a BAR2
fault from GSP and it all dies.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index e34bc6076401..8379e72d77ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -31,7 +31,7 @@ tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
=20
 =09type |=3D 0x00000001; /* PAGE_ALL */
 =09if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
-=09=09type |=3D 0x00000004; /* HUB_ONLY */
+=09=09type |=3D 0x00000006; /* HUB_ONLY | ALL PDB (hack) */
=20
 =09mutex_lock(&vmm->mmu->mutex);
=20
--=20
2.42.0

