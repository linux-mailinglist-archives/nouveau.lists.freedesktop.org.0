Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B19CEDA49
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 05:18:51 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6049C10E068;
	Fri,  2 Jan 2026 04:18:48 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B2F5744C89;
	Fri,  2 Jan 2026 04:10:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767327044;
 b=KBqPoNgEiM/goAJfapsGxTpK6Pf7ldX8hC66N+QsCkljcT95q6x1hg535cqnqsWnccRcN
 AeNSXYjJtfdwfvEyVIJ/b7Imywpzvl/cO8W2RWbomjKwcdNSvWMBdo3pRLkNFyj3yXwQjdZ
 wXDNM8DrkB5bcgJtLi4S0jQ6YgpITN50bQBxfz/8gq1iQavpA50e3TiHuo2L2FbTvCQc9/p
 MNWmbF2ceRB5Y6+0znH/SaBEUweOwR5GS7H/7QCXjZstMlA2zKVX5RIYH4k7GlZFZF/ovk/
 EfrWXgvih1WO6pffDzaBTxk4liTCf+nEFIXXEAVAxyAqP1yPFyd5J/373PVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767327044; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9uRAMdtsJd2CBU7uQmQI44ctrbhd0ZLI6ZIPk8DE87E=;
 b=U1tzM2HFwtKkdViapJVzEqJ86pktiPsUBOQgBwuTqes9EUPgxvUnvUU43XqmgqLN9gT0d
 p3gdnCQ7C1FO0nREDcIOgVFOoB/S+oM8gutfZANjhndcPAUp3uXjDZNxOpVSxhsOaguocql
 rGuMYMmcBKLzZTARhLhSaHKgJptMvJM2E7aIYAqlg2FeEZ2tM44jYnljPpCihXfhGbHryfE
 Oi2/MDN0CSvBConfkhpQf0ysU6wKAndzzEpXBsQjYN5OA9l19gc+6sDs/Me1BClXuL0Gj89
 8oKqmf0eIGUkqjOyKKM3exf3XOoGyEGGonWDHtVRRh9mYxIRqJV2/nhirWZg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9A534422CF
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 04:10:42 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88A10E00B
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 04:18:45 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-t0e2-MrSNGG4v6B8OmBF6w-1; Thu,
 01 Jan 2026 23:18:40 -0500
X-MC-Unique: t0e2-MrSNGG4v6B8OmBF6w-1
X-Mimecast-MFC-AGG-ID: t0e2-MrSNGG4v6B8OmBF6w_1767327519
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1938619560B2;
	Fri,  2 Jan 2026 04:18:39 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1215A1956056;
	Fri,  2 Jan 2026 04:18:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
Date: Fri,  2 Jan 2026 14:18:29 +1000
Message-ID: <20260102041829.2748009-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QI2Tq-yPLy9mTVPV0NUK60jdR4RKDgC6xKcI0ucp0Go_1767327519
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: TAVIPFAMDJKJ5MTHIM7OVH2VHZ65KY5Q
X-Message-ID-Hash: TAVIPFAMDJKJ5MTHIM7OVH2VHZ65KY5Q
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TAVIPFAMDJKJ5MTHIM7OVH2VHZ65KY5Q/>
Archived-At: 
 <https://lore.freedesktop.org/20260102041829.2748009-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The changes to always loads fwsec sb causes problems on newer GPUs
which don't use this path.

Add hooks and pass through the device specific layers.

Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")
Cc: <stable@vger.kernel.org> # v6.16+
Cc: Lyude Paul <lyude@redhat.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
 7 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ad102.c
index 35d1fcef520bf..b3e994386334d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -29,6 +29,9 @@ ad102_gsp =3D {
 =09.sig_section =3D ".fwsignature_ad10x",
=20
 =09.booter.ctor =3D ga102_gsp_booter_ctor,
+=09
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
=20
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 5037602466604..8d4f40a443ce4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 }
=20
 int
-nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
 {
-=09return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
-=09=09=09=09   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
-}
-
-void
-nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
-{
-=09nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
+       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
+                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
 }
=20
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga100.c
index d201e8697226b..27a13aeccd3cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -47,6 +47,9 @@ ga100_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga102.c
index 917f7e2f6c466..a59fb74ef6315 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -158,6 +158,9 @@ ga102_gsp_r535 =3D {
=20
 =09.booter.ctor =3D ga102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+=09
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/priv.h
index 86bdd203bc107..9dd66a2e38017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
=20
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
=20
-int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
 int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
-void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
+int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
=20
 struct nvkm_gsp_fwif {
 =09int version;
@@ -52,6 +51,11 @@ struct nvkm_gsp_func {
 =09=09=09    struct nvkm_falcon *, struct nvkm_falcon_fw *);
 =09} booter;
=20
+=09struct {
+=09=09int (*ctor)(struct nvkm_gsp *);
+=09=09void (*dtor)(struct nvkm_gsp *);
+=09} fwsec_sb;
+
 =09void (*dtor)(struct nvkm_gsp *);
 =09int (*oneinit)(struct nvkm_gsp *);
 =09int (*init)(struct nvkm_gsp *);
@@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
 extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
 int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct fi=
rmware *,
 =09=09=09  struct nvkm_falcon *, struct nvkm_falcon_fw *);
+int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
+void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
 int tu102_gsp_init(struct nvkm_gsp *);
 int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
@@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum=
 nvkm_subdev_type, int,
 =09=09  struct nvkm_gsp **);
=20
+static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+{
+=09if (gsp->func->fwsec_sb.ctor)
+=09=09return gsp->func->fwsec_sb.ctor(gsp);
+=09return 0;
+}
+
+static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
+{
+=09if (gsp->func->fwsec_sb.dtor)
+=09=09gsp->func->fwsec_sb.dtor(gsp);
+}
+
 extern const struct nvkm_gsp_func gv100_gsp;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 81e56da0474a1..04b642a1f7305 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -30,6 +30,18 @@
 #include <nvfw/fw.h>
 #include <nvfw/hs.h>
=20
+int
+tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+{
+=09return nvkm_gsp_fwsec_sb_init(gsp);
+}
+
+void
+tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
+{
+=09nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
+}
+
 static int
 tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
 {
@@ -370,6 +382,9 @@ tu102_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu116.c
index 97eb046c25d07..58cf258424218 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -30,6 +30,9 @@ tu116_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
--=20
2.52.0

