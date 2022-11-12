Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703366F6B6B
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7B10E437;
	Thu,  4 May 2023 12:31:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124910E1AF
 for <nouveau@lists.freedesktop.org>; Sat, 12 Nov 2022 02:50:00 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N8Kj86LvvzJnZs;
 Sat, 12 Nov 2022 10:46:52 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 10:49:57 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 12 Nov
 2022 10:49:56 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <nouveau@lists.freedesktop.org>
Date: Sat, 12 Nov 2022 10:48:28 +0800
Message-ID: <20221112024828.2740489-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:38 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau/gr/gv100-: fix missing unlock
 on error in gf100_gr_chan_new()
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
Cc: bskeggs@redhat.com, yangyingliang@huawei.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add the missing unlock before return from function gf100_gr_chan_new()
in the error handling case.

Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..03389af3b40d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -443,6 +443,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
 		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
 		if (ret) {
 			nvkm_error(&base->engine.subdev, "failed to construct context\n");
+			mutex_unlock(&gr->fecs.mutex);
 			return ret;
 		}
 	}
-- 
2.25.1

