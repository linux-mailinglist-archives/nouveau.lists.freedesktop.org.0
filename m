Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891594E782
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2024 09:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7F810E0F0;
	Mon, 12 Aug 2024 07:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPjmziXB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D8A10E0F0;
 Mon, 12 Aug 2024 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723446852; x=1754982852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2W/be8VISRZC7fVoJ9VGu3iMrIsNaD0YF4i34a1dFE4=;
 b=GPjmziXB1NrqTfKg1u3yS8LZRDAzB0DsKB1nVTtcOY/SJEyFO+dPjA45
 lBgK7UwEvH4MS87HB3vtt6d/SGzepyLd6HNQ9ZHrkiWN1cDbnfUYrU3yN
 ijsUTkRpv+JEqZSheCy6xcMRjSzq+JFYCgB6kvTEMBIS8HLmZjqRyPADq
 j/WMDvS2L5qbrKp/Enp7+0e7rwmZWaO19zlCJWkZe28FEbhE472fAKQ78
 R3paZHGznJDlttCqt1IUPmgm+jR795gmkbwqrmML6AYs3ggcZAMPQtsJl
 RB4I8eHYXq4hT5jrTKDwXl8jgGoPngSQfE/JguJCCCjRHofTVOZ7/bV1C Q==;
X-CSE-ConnectionGUID: TrIaIapgTf+vWkyVpjhKrQ==
X-CSE-MsgGUID: Tf8cL3yRS4WvPR8hmpqnYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21711541"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21711541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 00:14:11 -0700
X-CSE-ConnectionGUID: OLEmc47wRB6veAq2mjcdLw==
X-CSE-MsgGUID: r/FxCR4NT760l1EVOg/r5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="57823793"
Received: from allen-box.sh.intel.com ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 00:14:06 -0700
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
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:10:32 +0800
Message-Id: <20240812071034.9443-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

In nvkm_device_tegra_probe_iommu(), a paging domain is allocated for @dev
and attached to it on success. Use iommu_paging_domain_alloc() to make it
explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20240610085555.88197-7-baolu.lu@linux.intel.com
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 87caa4a72921..763c4c2925f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -120,8 +120,8 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	mutex_init(&tdev->iommu.mutex);
 
 	if (device_iommu_mapped(dev)) {
-		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tdev->iommu.domain)
+		tdev->iommu.domain = iommu_paging_domain_alloc(dev);
+		if (IS_ERR(tdev->iommu.domain))
 			goto error;
 
 		/*
-- 
2.34.1

