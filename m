Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAFECBACE6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944C010EBC4;
	Sat, 13 Dec 2025 12:41:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1040 seconds by postgrey-1.36 at gabe;
 Thu, 12 Sep 2024 03:37:47 UTC
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61F10E5EA
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2024 03:37:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X42kZ5vdmz1xv7g
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2024 11:20:22 +0800 (CST)
Received: from dggpeml500003.china.huawei.com (unknown [7.185.36.200])
 by mail.maildlp.com (Postfix) with ESMTPS id E414C1400D4
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2024 11:20:23 +0800 (CST)
Received: from huawei.com (10.44.142.84) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 12 Sep
 2024 11:20:23 +0800
From: Yu Liao <liaoyu15@huawei.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <liaoyu15@huawei.com>, <xiexiuqi@huawei.com>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau/gsp: remove unneeded semicolon
Date: Thu, 12 Sep 2024 11:16:35 +0800
Message-ID: <20240912031635.1018146-1-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.44.142.84]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

Remove unneeded semicolon.

Signed-off-by: Yu Liao <liaoyu15@huawei.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 9e6f39912368..a2055f2a014a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -210,7 +210,7 @@ struct nvkm_gsp {
 	} *rm;
 
 	struct {
-		struct mutex mutex;;
+		struct mutex mutex;
 		struct idr idr;
 	} client_id;
 
-- 
2.33.0

