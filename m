Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C8D39DDC
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 06:38:16 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDE4710E364;
	Mon, 19 Jan 2026 05:38:15 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E86A44CB1;
	Mon, 19 Jan 2026 05:29:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768800574;
 b=eyuysvot9pm5PCLAc42A41JASNxvfzsCGQYm5SZDNSdTkbntPBSIN3zRIRWRx6Kc736zQ
 /O9G9A+WHoPGUjMqP/lSFPkbr6r+vSIGoPTqUybcam0i2Vj8Xhgj9nOUCuEbLxzm7PMkXuH
 NMUwPh4dI2DfbcaajYiGIZnMpwXfhaP26YbQ3jgk7TxudBfIAy9wkkVv/u54Op5C6FtPOCx
 n5wZS99jbmGne+UH9TSWGG1SnU/4TPReLWsoP+wZFHBDicoYYd4+CDttEUhpy+25KBtsTrG
 mAT2xwVL8SCyNkDbb+4/BViNPTFjjS+EchTRK0C2SMR13l0Okvk9K43LLrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768800574; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ke3AztMpi41ndWna6VHGJ9u0Eqs/uZ7m0EG62mXRCoY=;
 b=ZOVQG5/WTPJBup0o0Ei24Er36pBrt7qP50GAjBeOQOw6bngPW0Fy3hA+303QIkOHNoaMp
 PjVgi78sh13CKY4Qw3pGTTwLltKjIsZl6fs3PBk8zB+1hugoDkYJAAxN6A/wJ8JCuBce2/s
 dGiYQw3Fxj5OFnqalEftrypkejwkI1NIXwqC4NP2/hxdFk85+hEmwrM0ipyWFkUf1Ns9RMp
 q+HiGWi/KAURKy2oLaXEUdumNxA2V3Na/GwQafw8sl7U4DgAxAyAXCaIFxi5wob3H5awPKp
 2Tg2ENTlzjCWY5hYr4D0dgueoH268IbhWTvDDPgus+gWcuk76v6AdTqKpjTQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B49FB404B2
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 05:29:32 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAA9110E261
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 05:38:13 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-TGy4wuIQMWWklk4sI1fKEw-1; Mon,
 19 Jan 2026 00:37:07 -0500
X-MC-Unique: TGy4wuIQMWWklk4sI1fKEw-1
X-Mimecast-MFC-AGG-ID: TGy4wuIQMWWklk4sI1fKEw_1768801026
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 48DE9195606E;
	Mon, 19 Jan 2026 05:37:06 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.125])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 454181955F22;
	Mon, 19 Jan 2026 05:37:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: use rpc sequence numbers properly.
Date: Mon, 19 Jan 2026 15:37:01 +1000
Message-ID: <20260119053701.181329-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5GHNYpQ1GNcCSiuPVQJY62q2mTLDSQcF78psSOLiMH8_1768801026
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: ICUO2DTVYLSDWG3DI72JEBYKJM3WLSI6
X-Message-ID-Hash: ICUO2DTVYLSDWG3DI72JEBYKJM3WLSI6
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ICUO2DTVYLSDWG3DI72JEBYKJM3WLSI6/>
Archived-At: 
 <https://lore.freedesktop.org/20260119053701.181329-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

There are two layers of sequence numbers, one at the msg level
and one at the rpc level.

570 firmware started asserting on the sequence numbers being
in the right order, and we would see nocat records with asserts
in them.

Add the rpc level sequence number support.

Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h     | 6 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 6 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gp=
u/drm/nouveau/include/nvkm/subdev/gsp.h
index b8b97e10ae83..64fed208e4cf 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -44,6 +44,9 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event=
 *, void *repv, u32 rep
  * NVKM_GSP_RPC_REPLY_NOWAIT - If specified, immediately return to the
  * caller after the GSP RPC command is issued.
  *
+ * NVKM_GSP_RPC_REPLY_NOSEQ - If specified, exactly like NOWAIT
+ * but don't emit RPC sequence number.
+ *
  * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire GSP
  * RPC message after the GSP RPC command is issued.
  *
@@ -53,6 +56,7 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event=
 *, void *repv, u32 rep
  */
 enum nvkm_gsp_rpc_reply_policy {
 =09NVKM_GSP_RPC_REPLY_NOWAIT =3D 0,
+=09NVKM_GSP_RPC_REPLY_NOSEQ,
 =09NVKM_GSP_RPC_REPLY_RECV,
 =09NVKM_GSP_RPC_REPLY_POLL,
 };
@@ -242,6 +246,8 @@ struct nvkm_gsp {
 =09/* The size of the registry RPC */
 =09size_t registry_rpc_size;
=20
+=09u32 rpc_seq;
+
 #ifdef CONFIG_DEBUG_FS
 =09/*
 =09 * Logging buffers in debugfs. The wrapper objects need to remain
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2a7e80c6d70f..6e7af2f737b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -704,7 +704,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
=20
 =09build_registry(gsp, rpc);
=20
-=09return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOSEQ);
=20
 fail:
 =09clean_registry(gsp);
@@ -921,7 +921,7 @@ r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 =09info->pciConfigMirrorSize =3D device->pci->func->cfg.size;
 =09r535_gsp_acpi_info(gsp, &info->acpiMethodData);
=20
-=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOSEQ);
 }
=20
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 0dc4782df8c0..3ca3de8f4340 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -557,6 +557,7 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
=20
 =09switch (policy) {
 =09case NVKM_GSP_RPC_REPLY_NOWAIT:
+=09case NVKM_GSP_RPC_REPLY_NOSEQ:
 =09=09break;
 =09case NVKM_GSP_RPC_REPLY_RECV:
 =09=09reply =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
@@ -588,6 +589,11 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
 =09=09=09       rpc->data, rpc->length - sizeof(*rpc), true);
 =09}
=20
+=09if (policy =3D=3D NVKM_GSP_RPC_REPLY_NOSEQ)
+=09=09rpc->sequence =3D 0;
+=09else
+=09=09rpc->sequence =3D gsp->rpc_seq++;
+
 =09ret =3D r535_gsp_cmdq_push(gsp, rpc);
 =09if (ret)
 =09=09return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 63102c52478d..d5a7d125cf50 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -181,7 +181,7 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
 =09if (device->func->link_cap)
 =09=09device->func->link_cap(device, &info->pcieConfigReg.linkCap);
=20
-=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOSEQ);
 }
=20
 static void
--=20
2.52.0

