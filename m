Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330AC23F890
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842DE6E233;
	Sat,  8 Aug 2020 19:18:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6BB89119;
 Mon, 27 Jul 2020 20:52:43 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3e8d0003>; Mon, 27 Jul 2020 13:52:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:52:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:52:42 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:52:33 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.com>, <intel-gfx@lists.freedesktop.com>,
 <nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <bskeggs@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <david1.zhou@amd.com>
Date: Mon, 27 Jul 2020 15:53:55 -0500
Message-ID: <20200727205357.27839-3-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205357.27839-1-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595883149; bh=6112sgWeMAs/YtO1LuYVyMrkQ1gQZQQGcuWyG0BjPeo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=DDdpQXv8DFsmbyh3uvm8tz/xeI92g02LktCpwJan9YabdldNSqdNERzGo8pO7wrq7
 /AJapgdxklSfGF1Ira6RUPo5kVvkZPdeUV0HqonOILVr418xMFkUxpR0AgQCaMCY1F
 0SRnSbi6NkRx4HrOibRyFSorchYltOSGMggfj5tcmCxWcC5L0G+/ZT7bBCSKVJ4YRL
 +HDs5ESPGSVfsmfpYWYPfk0t+Q0Eaj5CvHv+5GR3affREjhCgilOc7jgLJtQmVdRvQ
 Wm6pGzNI7Ptt6S3ekS5aPD1sPG7yKNlK9MzqcfUJikV9oAfuKiUtz9L1QHY2oRXZaX
 1PzWOWdStjLuA==
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: [Nouveau] [PATCH 2/4] i915: fall back to ACPI EDID retrieval
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
 drivers/gpu/drm/i915/display/intel_dp.c   | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_lvds.c | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 804b1d966f66..ff402cef8183 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5657,6 +5657,7 @@ static struct edid *
 intel_dp_get_edid(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
+	struct edid *edid;
 
 	/* use cached edid if we have one */
 	if (intel_connector->edid) {
@@ -5666,8 +5667,13 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
 
 		return drm_edid_duplicate(intel_connector->edid);
 	} else
-		return drm_get_edid(&intel_connector->base,
+		edid = drm_get_edid(&intel_connector->base,
 				    &intel_dp->aux.ddc);
+
+	if (!edid && intel_dp_is_edp(intel_dp))
+		edid = drm_get_edid_acpi();
+
+	return edid;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 9a067effcfa0..811eea3f5d9f 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -946,6 +946,10 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	else
 		edid = drm_get_edid(connector,
 				    intel_gmbus_get_adapter(dev_priv, pin));
+
+	if (!edid)
+		edid = drm_get_edid_acpi();
+
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
 			drm_connector_update_edid_property(connector,
-- 
2.18.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
