Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35634EF59
	for <lists+nouveau@lfdr.de>; Tue, 30 Mar 2021 19:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6E6E94E;
	Tue, 30 Mar 2021 17:25:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99626F515;
 Sat, 27 Mar 2021 01:59:04 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6hlb29WqznbSw;
 Sat, 27 Mar 2021 09:56:27 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 09:58:55 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Sat, 27 Mar 2021 09:58:44 +0800
Message-ID: <20210327015844.1868-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 30 Mar 2021 17:25:14 +0000
Subject: [Nouveau] [PATCH 1/1] drm/nouveau/dmem: Remove duplicated header
 file inclusion
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The header file <nvif/if000c.h> is already included above and can be
removed here.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17d02..f5cc057b123b8b0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -33,7 +33,6 @@
 #include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
-#include <nvif/if000c.h>
 
 #include <nvhw/class/cla0b5.h>
 
-- 
1.8.3


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
