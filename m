Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C053B6F6B6F
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C957F10E3E3;
	Thu,  4 May 2023 12:31:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 954 seconds by postgrey-1.36 at gabe;
 Sat, 29 Oct 2022 08:03:06 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1214110E25A
 for <nouveau@lists.freedesktop.org>; Sat, 29 Oct 2022 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=K2PKa
 fCEYXHMfQ1Jc/mijsgMNFcp0Mg3fqjNMpvECbI=; b=FMEoRNbDFET3f1Gmh/iC8
 MzOuoi8D2ngIRNibx9WNxR2+HU20n3rDX9YrLVjNmg6aQuahtKhAmMHSnU0ZlekO
 Jz2V1pTeS3Zxa2UGvA3LmLtNkRq9+jA9BCGLWUokmpm/a+PasfqRar473kYDQf5X
 5enOQWFq/D+ycL3OPXITG0=
Received: from localhost.localdomain (unknown [111.206.145.21])
 by smtp3 (Coremail) with SMTP id G9xpCgDH1S1w2lxjInYWpQ--.13602S2;
 Sat, 29 Oct 2022 15:46:56 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: nouveau@lists.freedesktop.org
Date: Sat, 29 Oct 2022 15:46:54 +0800
Message-Id: <20221029074654.203153-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgDH1S1w2lxjInYWpQ--.13602S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1xAr1UXF4kZr4fAw17trb_yoWDGrb_uF
 1rXrnxWr95CryDWws8ZF43AFy2gan7ZFs2q3WSy3sxtasrXrsxWr9xZrn5W3s8AF1xKFyD
 G3WkXr1FqrnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKVbytUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiQhCpU1aEDXIgKgAAsP
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:35 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/mmu: fix use-after-free bug in
 nvkm_vmm_pfn_map
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
Cc: alex000young@gmail.com, security@kernel.org, hackerzheng666@gmail.com,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, bskeggs@redhat.com,
 daniel@ffwll.ch, Zheng Wang <zyytlz.wz@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

If it failed in kzalloc, vma will be freed in nvkm_vmm_node_merge.
The later use of vma will casue use after free.

Reported-by: Zheng Wang <hackerzheng666@gmail.com>
Reported-by: Zhuorao Yang <alex000young@gmail.com>

Fix it by returning to upper caller as soon as error occurs.

Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index ae793f400ba1..04befd28f80b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1272,8 +1272,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 						       page -
 						       vmm->func->page, map);
 			if (WARN_ON(!tmp)) {
-				ret = -ENOMEM;
-				goto next;
+				return -ENOMEM;
 			}
 
 			if ((tmp->mapped = map))
-- 
2.25.1

