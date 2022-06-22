Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A122758A22E
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3391A6F87;
	Thu,  4 Aug 2022 20:37:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 341B610EB53;
 Wed, 22 Jun 2022 02:44:03 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 694DC1E80CD1;
 Wed, 22 Jun 2022 10:43:55 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-aAP4y71aKv; Wed, 22 Jun 2022 10:43:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.97])
 (Authenticated sender: jiaming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id D94A21E80C7D;
 Wed, 22 Jun 2022 10:43:51 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	joe@perches.com
Date: Wed, 22 Jun 2022 10:42:36 +0800
Message-Id: <20220622024236.12533-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622015249.8390-1-jiaming@nfschina.com>
References: <20220622015249.8390-1-jiaming@nfschina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:51 +0000
Subject: [Nouveau] [PATCH v2] drm/nouveau/mmu: Fix a typo
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
Cc: nouveau@lists.freedesktop.org, Zhang Jiaming <jiaming@nfschina.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 liqiong@nfschina.com, bskeggs@redhat.com, renyu@nfschina.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

There is a typo in comments. Change 'neeed' to 'needed'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 8bf00b396ec1..8b11dfa0998d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn, u32 ptei, u32 ptes)
 	if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
 		nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
 
-	/* PT no longer neeed?  Destroy it. */
+	/* PT no longer needed?  Destroy it. */
 	if (!pgt->refs[type]) {
 		it->lvl++;
 		TRA(it, "%s empty", nvkm_vmm_desc_type(desc));
-- 
2.25.1

