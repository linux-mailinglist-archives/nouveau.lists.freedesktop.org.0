Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCECBABD4
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187B10EB1B;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2024 06:27:13 UTC
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id C078C10E021;
 Tue, 10 Dec 2024 06:27:13 +0000 (UTC)
Received: from 127.0.0.1 (unknown [40.50.50.41])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPA id 840C9606A5D50;
 Tue, 10 Dec 2024 14:20:40 +0800 (CST)
Date: Tue, 10 Dec 2024 14:20:40 +0800 (CST)
X-MD-Sfrom: zhanxin@nfschina.com
X-MD-SrcIP: 40.50.50.41
From: zhanxin <zhanxin@nfschina.com>
To: kherbst <kherbst@redhat.com>, lyude <lyude@redhat.com>,
 dakr <dakr@redhat.com>, airlied <airlied@gmail.com>,
 simona <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1722060220.392.1733811640530@127.0.0.1>
Subject: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_390_769418950.1733811640517"
X-Priority: 3
X-NFS-GUID: PNrdZJdcGdfhQmGbW1mQ
X-ISRICH: 1
Content-ID: 53ed85b6-b98c-4938-a21f-5ff90b033fe9
X-Mail-src: 1291
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:43 +0000
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
Reply-To: zhanxin@nfschina.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

------=_Part_390_769418950.1733811640517
Content-Type: multipart/alternative; 
	boundary="----=_Part_389_1713214656.1733811640517"

------=_Part_389_1713214656.1733811640517
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


------=_Part_389_1713214656.1733811640517
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit


------=_Part_389_1713214656.1733811640517--

------=_Part_390_769418950.1733811640517
Content-Type: application/octet-stream; 
	name=0001-drm-nouveau-Fix-memory-leak-in-nvbios_iccsense_parse.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-drm-nouveau-Fix-memory-leak-in-nvbios_iccsense_parse.patch
Content-ID: <d136119c-4913-48be-9d47-02fc4529b2e7>
Content-uid: 1733811638148

From 895d436242c94c56a1d696c713016cc1504b9b83 Mon Sep 17 00:00:00 2001
From: Zhanxin Qi <zhanxin0@outlook.com>
Date: Tue, 10 Dec 2024 13:12:04 +0800
Subject: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse

The nvbios_iccsense_parse function allocates memory for sensor data
but fails to free it when the function exits, leading to a memory
leak. Add proper cleanup to free the allocated memory.

Signed-off-by: Zhanxin Qi <zhanxin0@outlook.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..502608d575f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+
+	kfree(stbl.rail);
+
 	return 0;
 }
 
-- 
2.30.2


------=_Part_390_769418950.1733811640517--
