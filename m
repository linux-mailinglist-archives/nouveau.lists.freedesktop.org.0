Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651423F893
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187696E23F;
	Sat,  8 Aug 2020 19:18:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACD889119;
 Mon, 27 Jul 2020 20:52:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3e8d0000>; Mon, 27 Jul 2020 13:52:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:52:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:52:42 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:52:34 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.com>, <intel-gfx@lists.freedesktop.com>,
 <nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <bskeggs@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <david1.zhou@amd.com>
Date: Mon, 27 Jul 2020 15:53:56 -0500
Message-ID: <20200727205357.27839-4-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205357.27839-1-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595883149; bh=/1Icu6fjR+iI8CSFVfmU4f6xx1YggBq2vYaWxHEwEJ4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=hEj6TUwyxmp9rAY1xQyRC9V6oXc+JCw+ztaKWLFdio2uPMR7K/ke+R8q4UJLRqk7W
 rL5If68e12Mbo08kpPlgzAbhgz3CvSqx0lWB70WpItsiT8bCg+XJtqIVE9L3Q15vwv
 35bHHxvX/oNr5NxaWCsdFRmhV5WmGZG1XK99odgWnl65wvLYcOPv4F1ovNtMAgUg7q
 3BYDpCj2MNafil37VmQgTevWOOz6ev1efBGf6UUh//ZkbecKaYVBdTdlDJzpG7zLqC
 Y4RAKfBsZAQUwLktHYFGUUwWNWKCqVZnAchLqIvlguW3jyp+c4hmf86X3OL/omBtDS
 3tUkcsfnquTxQ==
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: [Nouveau] [PATCH 3/4] nouveau: fall back to ACPI EDID retrieval
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fall back to retrieving the EDID via the ACPI _DDC method, when present
for notebook internal panels, when EDID retrieval via the standard EDID
paths is unsuccessful.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 9a9a7f5003d3..95836a02a06b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -581,6 +581,12 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		else
 			nv_connector->edid = drm_get_edid(connector, i2c);
 
+		if (!nv_connector->edid &&
+			(nv_connector->type == DCB_CONNECTOR_LVDS ||
+			nv_connector->type == DCB_CONNECTOR_eDP)) {
+			nv_connector->edid = drm_get_edid_acpi();
+		}
+
 		drm_connector_update_edid_property(connector,
 							nv_connector->edid);
 		if (!nv_connector->edid) {
-- 
2.18.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
