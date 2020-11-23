Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBA2C1B45
	for <lists+nouveau@lfdr.de>; Tue, 24 Nov 2020 03:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77B6E1A3;
	Tue, 24 Nov 2020 02:08:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149089D39;
 Mon, 23 Nov 2020 08:34:59 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CfgSD3CS8zhg5t;
 Mon, 23 Nov 2020 16:34:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Nov 2020 16:34:52 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 23 Nov 2020 16:35:15 +0800
Message-ID: <1606120515-45702-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Nov 2020 02:07:49 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fb/gp102-: use flexible-array member
 instead of zero-length array
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

fixed the coccicheck:
drivers/gpu/drm/nouveau/include/nvfw/hs.h:26:5-9: WARNING use
flexible-array member instead.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
index 64d0d32..b53bbc4 100644
--- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
+++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
@@ -23,7 +23,7 @@ struct nvfw_hs_load_header {
 	u32 data_dma_base;
 	u32 data_size;
 	u32 num_apps;
-	u32 apps[0];
+	u32 apps[];
 };
 
 const struct nvfw_hs_load_header *
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
