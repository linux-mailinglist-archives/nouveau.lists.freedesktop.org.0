Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2C4A01B0
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 21:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F1110E5AB;
	Fri, 28 Jan 2022 20:10:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3457B11236B;
 Fri, 28 Jan 2022 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358982; x=1674894982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9ZeS5oFhGbrJNOTI/GRzNzkULBALELRHaczOGrNmEk=;
 b=YM7PlpC5nj50IV54bLeK4XVTXt0JkZwQD/yPmHADy6K9akYvRYCSxpeY
 XfFzjPMAcOSaPKT31493TJbxMp8jz+9jxoxqd+3LvxyBXWleaL4nzDQC9
 7K9AYE1BjvS5YPkUFNOQdGjVR/1EoYZpo6bebHGXfa7/BE7/UgaR5yi7H
 Jex36GKVS9oFzf963UmOflDcGnNQfvI2ZwktxhFMJIP6vNGXD+S/TWNWP
 u30F7Vi7NOwLyIUPjtsI78KAC8DHQCUXgl2UbVj9FzkTJJtU/QdA8ZMee
 KFiPpaYH0YT1ZBzDhf3vpIs6mqjtBkkPysUg9OVR5JaJ0zw4TGVqY432t w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227056604"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="227056604"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788761"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 00:36:23 -0800
Message-Id: <20220128083626.3012259-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 20:10:03 +0000
Subject: [Nouveau] [PATCH 11/14] drm/radeon: Replace dma-buf-map with
 iosys-map
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
Cc: airlied@linux.ie, christian.koenig@amd.com, srinivas.kandagatla@linaro.org,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in radeon.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index a36a4f2c76b0..f563284a7fac 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -26,6 +26,7 @@
  *          Jerome Glisse
  */
 
+#include <linux/iosys-map.h>
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
-- 
2.35.0

