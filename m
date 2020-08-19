Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F324933B
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 05:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B66D89B83;
	Wed, 19 Aug 2020 03:08:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771A89B83;
 Wed, 19 Aug 2020 03:06:43 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C0506C4D6C9F7EDD02DA;
 Wed, 19 Aug 2020 11:06:36 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 19 Aug 2020
 11:06:33 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Wed, 19 Aug 2020 11:04:24 +0800
Message-ID: <20200819030424.70222-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 19 Aug 2020 03:08:32 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau/nvenc: remove duplicate include
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove priv.h which is included more than once

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index 484100e15668..7deb826d1ccc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -21,7 +21,6 @@
  */
 #include "priv.h"
 
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.17.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
