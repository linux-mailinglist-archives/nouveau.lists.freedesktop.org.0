Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4023F898
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4136E248;
	Sat,  8 Aug 2020 19:18:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56CD89B68;
 Mon, 27 Jul 2020 20:52:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3e8d0001>; Mon, 27 Jul 2020 13:52:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:52:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:52:42 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:52:35 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.com>, <intel-gfx@lists.freedesktop.com>,
 <nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <bskeggs@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <david1.zhou@amd.com>
Date: Mon, 27 Jul 2020 15:53:57 -0500
Message-ID: <20200727205357.27839-5-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205357.27839-1-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595883149; bh=PaBA0CGUNXuo5KxbHgizqKNPQTp+UwuwQKuv3bqmwMQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=IoPR2pjkNaoNm+/l/110aEwTlYUb7P9qGu+girX8Hgs3CiOJ9G7j4m1iztnCzVTA0
 w90EDh2pyWiawgKLBtvyYjKk9Q9qoObAU3No/PW6drjWfpSg2mVmlQCsg6NFxSu8+e
 RVjVoiXofSm3qAGgdDoLCipA0XrOJf9hpBWLKe4xl+nIy8RHreyqZQUSWws8cfxZXP
 rb6DRCT/LJX46speFRPELKKYf74BV8wRScrIbkQeqZnpYyX8n5p8Jz8zcqONTH48Vd
 tf91IK6u+1XNNbMIisyvWqCQZR3LsB+/rdgYdgmjbH4aXVFpDXxYqzVoUjFBhc27ka
 nOMaqdEVUW9PA==
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: [Nouveau] [PATCH 4/4] radeon: fall back to ACPI EDID retrieval
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
for notebook internal panels, when retrieving BIOS-embedded EDIDs.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/drm/radeon/radeon_combios.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index c3e49c973812..de801d9fca54 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -401,9 +401,8 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 struct edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 {
-	struct edid *edid;
-
 	if (rdev->mode_info.bios_hardcoded_edid) {
+		struct edid *edid;
 		edid = kmalloc(rdev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
 		if (edid) {
 			memcpy((unsigned char *)edid,
@@ -412,7 +411,8 @@ radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 			return edid;
 		}
 	}
-	return NULL;
+
+	return drm_get_edid_acpi();
 }
 
 static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
-- 
2.18.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
