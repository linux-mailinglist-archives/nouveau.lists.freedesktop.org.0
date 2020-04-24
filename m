Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF51B6F0C
	for <lists+nouveau@lfdr.de>; Fri, 24 Apr 2020 09:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717296EA74;
	Fri, 24 Apr 2020 07:29:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98C6EA74;
 Fri, 24 Apr 2020 07:29:06 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3580A77F2C2088023A17;
 Fri, 24 Apr 2020 15:28:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Apr 2020
 15:28:51 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Date: Fri, 24 Apr 2020 15:36:01 +0800
Message-ID: <20200424073601.143549-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Subject: [Nouveau] [PATCH] drm/nouveau/mmu: Remove unneeded semicolon
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 41640e0584ac..199f94e15c5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 				it.pte[it.lvl]++;
 			}
 		}
-	};
+	}

 	nvkm_vmm_flush(&it);
 	return ~0ULL;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index 5e55ecbd8005..d3f8f916d0db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
 		PTEI += _ptes;                                                 \
 		PTEN -= _ptes;                                                 \
-	};                                                                     \
+	}                                                                      \
 	nvkm_done((PT)->memory);                                               \
 } while(0)

--
2.26.0.106.g9fadedd

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
