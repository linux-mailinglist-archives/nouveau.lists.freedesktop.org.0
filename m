Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3A4A019D
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 21:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890B510E40B;
	Fri, 28 Jan 2022 20:10:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555C711236B;
 Fri, 28 Jan 2022 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358972; x=1674894972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VeQInHmHVOmhjLd436GKM+ceZUYLSpJbxttjZYailqQ=;
 b=V5o87AyqPXdZ7sfo2U05Vid8yVZyq4EWtRzAE/8SVGcB2rZL0aQJh8Qd
 lh5hisz+yVbz/VsrFV44bzT0b83RWEIpe1CDot67DERuLfvKuIO0uxv6l
 ncAlI0vOI3UmCvmvE97HuX4ckqRBgcR4X8SO3jTUpFgAuqEjH2ZGonsU4
 GjYivyLvBata0epTHMSzJ8nGTBvOZWZgPF7Fi3FGqEN0uSg+H8j+D0xs8
 3Pt16d0xpgTetUb5hb4DSLUhpCXi1Ty0TDQvlWodad+5hBzFs4m0J/TN7
 6G7mg4BpaUfnWt9/d9usztXtLzsVoRiEgjuFYriCcYQcV0Z1ru6V97OOh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247025181"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="247025181"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788723"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 00:36:14 -0800
Message-Id: <20220128083626.3012259-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 20:10:03 +0000
Subject: [Nouveau] [PATCH 02/14] misc: fastrpc: Replace dma-buf-map with
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
capabitilities. Replace with the new API.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4ccbf43e6bfa..5c0503655212 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -587,11 +587,11 @@ static void fastrpc_dma_buf_detatch(struct dma_buf *dmabuf,
 	kfree(a);
 }
 
-static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	struct fastrpc_buf *buf = dmabuf->priv;
 
-	dma_buf_map_set_vaddr(map, buf->virt);
+	iosys_map_set_vaddr(map, buf->virt);
 
 	return 0;
 }
-- 
2.35.0

