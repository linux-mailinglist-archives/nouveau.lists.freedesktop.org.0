Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF294E784
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2024 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5F10E0FD;
	Mon, 12 Aug 2024 07:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEtQoajw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8758210E0FF;
 Mon, 12 Aug 2024 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723446857; x=1754982857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugPZI6M1TvdJVOqkCaWpsQPcKmLp14vmdPpzyb0jTXA=;
 b=fEtQoajwEwEBBPvt9JNuAolVRFSpRZBXjBQtobHiiJMGmykqBBmUb8Ji
 dUU3DlKZQYsKoEJHFTQyVSvaht0chuDNuvzNN3B88gQUgJcxlxUdy6TVV
 YHdMElkJ7mOzoQP6Q3llcwXsnRzEKRrUj1mN2ACfSbzpMYyN5cJSC/KN0
 VOGMYLlDrrzsrsY4Pi5ZKteK54Hkd8t/fmIaNH9OspWjL60ZMFpWyqhVw
 5OanrckripR/V6eOnc6LepHYkxgIkfpPY0QXkpH/BJfWxmKXVrQYUZxKD
 utlqtTCuEJnw1/nYH6PtBeP1YJVPJmnv3qGieZIC2AfdNRh07ZRupPGXx g==;
X-CSE-ConnectionGUID: jOG+pxe0TgObjO+b4vz7SA==
X-CSE-MsgGUID: Pzm4QZ0ORb+3oGupyzeh3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21711562"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21711562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 00:14:17 -0700
X-CSE-ConnectionGUID: 20gV+VxOTN66vkWjO4j+TA==
X-CSE-MsgGUID: j+8tsWuwRpO5z66lvcz4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="57823816"
Received: from allen-box.sh.intel.com ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 00:14:11 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 2/3] drm/rockchip: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:10:33 +0800
Message-Id: <20240812071034.9443-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812071034.9443-1-baolu.lu@linux.intel.com>
References: <20240812071034.9443-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Commit <421be3ee36a4> ("drm/rockchip: Refactor IOMMU initialisation") has
refactored rockchip_drm_init_iommu() to pass a device that the domain is
allocated for. Replace iommu_domain_alloc() with
iommu_paging_domain_alloc() to retire the former.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-19-baolu.lu@linux.intel.com
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 44d769d9234d..11e5d10de4d7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -103,13 +103,17 @@ static int rockchip_drm_init_iommu(struct drm_device *drm_dev)
 	struct rockchip_drm_private *private = drm_dev->dev_private;
 	struct iommu_domain_geometry *geometry;
 	u64 start, end;
+	int ret;
 
 	if (IS_ERR_OR_NULL(private->iommu_dev))
 		return 0;
 
-	private->domain = iommu_domain_alloc(private->iommu_dev->bus);
-	if (!private->domain)
-		return -ENOMEM;
+	private->domain = iommu_paging_domain_alloc(private->iommu_dev);
+	if (IS_ERR(private->domain)) {
+		ret = PTR_ERR(private->domain);
+		private->domain = NULL;
+		return ret;
+	}
 
 	geometry = &private->domain->geometry;
 	start = geometry->aperture_start;
-- 
2.34.1

