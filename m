Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD78A78D8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A943112F4F;
	Tue, 16 Apr 2024 23:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="db+leFCx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1FF112F4F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chEVhu5S6OjcP5W4O9HyOrdiaRLcX/jX2ktcgt/b5isqG2NFnUTnX3V3S7ZE4+T9kHa3Q1yXs0pnzSrbhNGYlbr+nWSIPSPycj3BSUCrJW5mLEBYgQwkc+//2F0sgnPHkqErIDACHCPlSrKro3plsLgarQGKZrCvYbc821jpayeLFk36JxLVRB79NxrZ0pJRAqdxMoHqOgkEBRtbHi0ivS1lECuNEj4XZ95M/4SQmXtymrI1YUuAKSJfzNY252qpExZL4YLv6ADpmnfI5B/br0FzvASid8mForOLxBreuT8/Dy7ZsouIhBMVF2egXZ7DobaoJ5QWzuKzKT7FMu++DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z81k8UWulG4P501McqoLtqbXbYDVauJqtSVU0/Ojov8=;
 b=DNK3hGgaIDUgwNFYCXD06Kd3mLsK1DZee86csOoMgeM9/zGp9zdZdAurnLYLy4jkQwjULfktFD9xv8TqDi/HVeNM2XurHMPWkvm/C15OOtttPDSRgAf1GgMHzo8dcYZTaLKVe3YhCObxD+akO4STJ11f5QZOR10Wy+oAKvJJ7P+w1vcQHiKYZOOslDOUPc3DRYJ7lnARlSANvyhBxc5VLOeJNfxb8WkR2iynxKYizm77SaKNH6U2zAyHYkOPHLpiM5PjupTVkSNF4y+qYq96ZWeXXZB2hZwE0trBOuGTE85Hy00sDj0EGp386zXDrsh6ymwd7lvo/5sgA5WFBDPJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z81k8UWulG4P501McqoLtqbXbYDVauJqtSVU0/Ojov8=;
 b=db+leFCx8HV93Z/a+dEniCs+Yt/t3hQsjh6GZ6QS67z74tyofCRnDavLhnLpl8R37DbiedzizVB2QX90VZ+cOCa6iHG2zNgnjCxjdD3jt7lS7fhSNXemJ3UfL5ceBJBLwiWksze2tIdFQxH6pNx0kyoZ6aIWvfWR0a7n5+gGpTl5yUPfQip/l/HFXVbIF8Kui+hU00DdqzbvGYw0DWIVXWr07CTnOpayhTYxzhjcKS1hDu0uCSGefc0h6t36RQf/3lWd5AEVglF5Wof5U4tx3sZ1s+QC8+lDS4/dqjR1rDCy6WlFrqUpt+BfnzgZyYWRVi6VEb5XKBLfGzbretnEiw==
Received: from DM6PR07CA0067.namprd07.prod.outlook.com (2603:10b6:5:74::44) by
 SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:44 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::f6) by DM6PR07CA0067.outlook.office365.com
 (2603:10b6:5:74::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:28 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 050/156] drm/nouveau/nvkm: detach user handling from nvkm_uhead
Date: Wed, 17 Apr 2024 09:38:16 +1000
Message-ID: <20240416234002.19509-51-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: eab079ec-a916-4255-b24a-08dc5e6ec5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jPUJjBtQrwFT++X+FGtmrl62GPAEFnRb/JdPaI6Jk1lF0/Yt0Lnh57qUf+sY0XE6l1V+NmOPG0A9aRKKsHdLhhpWJ5KN+9nK0XCfgYiQWptaSb8bGP9ys9tBxOmpieQxZ7+fEu9blX3Vgz1XbZsI0nW4OAvcOsbIjS17P2qyf7qpjXreDJYQ1Rdv9YcWunt8jdTOqMHuq6Avt1sT85wIPeY+q8xIPdKp42/k5VyzIAUFB2eg4kd23OKSNC0akmIgl18fQHW9lb9qsmMD6kb6+Sdo5SJ3H/AoRHPRtBwETz+hlV5iqa2tUfRS0gN3ltJQqQ1pZ4CCvHZ4Gx60CtKZc5n6byGA6567yL/vQumOkJ54TnZS4QqVT1wROt3KSzyM4BAOQG9YfoidEtaCqpbd6NiyevZRqql1DVPRbT0OWmgjCi5FOPcGqZA1KCV3jkeews9SdaA+uyfP5+BYIa2W29fzFZ893S60uxW6kgjWBYgt4SJearJZkE+kVECJJnABFjtAamu6Y7/46+69NbsSkev0cVMwOOeT9pPWDxW/yUDEXzJjDZ2X+zUYJCS88jEZAkgOul9hcMHPLoStqb4nwTtc70roquTG1T4KHpmGFOilnQ3e+OWwCDQdROUY7jK1LYHzbaBrm9uUnC9FeHUQiJLmUxwFYsn30G1R6CA75j7UyyRSRs8C9LQ6guWi69t31KeJBmRVd1snlz1ufNkCW+ZEBEgoW1tkzlbI+yYck1kGiyRJHta5ODITlOHe97A
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:43.9331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eab079ec-a916-4255-b24a-08dc5e6ec5ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
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

- preparation for upcoming patches
- open-code current nvkm_uhead() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/head.h   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 42 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.h  |  6 +++
 3 files changed, 34 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
index 856252bf559a..cd60e901d625 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
@@ -28,7 +28,7 @@ struct nvkm_head {
 		} or;
 	} arm, asy;
 
-	struct nvkm_object object;
+	bool user; /* protected by disp->user.lock */
 };
 
 int nvkm_head_new_(const struct nvkm_head_func *, struct nvkm_disp *, int id);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
index 89e9b61914d6..3be82e01a59a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
@@ -19,18 +19,22 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uhead(p) container_of((p), struct nvkm_head, object)
-#include "head.h"
+#include "uhead.h"
 #include <core/event.h>
 
 #include <nvif/if0013.h>
 
 #include <nvif/event.h>
 
+struct nvif_head_priv {
+	struct nvkm_object object;
+	struct nvkm_head *head;
+};
+
 static int
 nvkm_uhead_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
-	struct nvkm_head *head = nvkm_uhead(object);
+	struct nvkm_head *head = container_of(object, struct nvif_head_priv, object)->head;
 	union nvif_head_event_args *args = argv;
 
 	if (!uevent)
@@ -74,7 +78,7 @@ nvkm_uhead_mthd_scanoutpos(struct nvkm_head *head, void *argv, u32 argc)
 static int
 nvkm_uhead_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
-	struct nvkm_head *head = nvkm_uhead(object);
+	struct nvkm_head *head = container_of(object, struct nvif_head_priv, object)->head;
 
 	switch (mthd) {
 	case NVIF_HEAD_V0_SCANOUTPOS: return nvkm_uhead_mthd_scanoutpos(head, argv, argc);
@@ -86,13 +90,13 @@ nvkm_uhead_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 static void *
 nvkm_uhead_dtor(struct nvkm_object *object)
 {
-	struct nvkm_head *head = nvkm_uhead(object);
-	struct nvkm_disp *disp = head->disp;
+	struct nvif_head_priv *uhead = container_of(object, struct nvif_head_priv, object);
+	struct nvkm_disp *disp = uhead->head->disp;
 
 	spin_lock(&disp->user.lock);
-	head->object.func = NULL;
+	uhead->head->user = false;
 	spin_unlock(&disp->user.lock);
-	return NULL;
+	return uhead;
 }
 
 static const struct nvkm_object_func
@@ -109,20 +113,28 @@ nvkm_uhead_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_head *head;
 	union nvif_head_args *args = argv;
-	int ret;
+	struct nvif_head_priv *uhead;
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
 	if (!(head = nvkm_head_find(disp, args->v0.id)))
 		return -EINVAL;
 
-	ret = -EBUSY;
+	uhead = kzalloc(sizeof(*uhead), GFP_KERNEL);
+	if (!uhead)
+		return -ENOMEM;
+
 	spin_lock(&disp->user.lock);
-	if (!head->object.func) {
-		nvkm_object_ctor(&nvkm_uhead, oclass, &head->object);
-		*pobject = &head->object;
-		ret = 0;
+	if (head->user) {
+		spin_unlock(&disp->user.lock);
+		kfree(uhead);
+		return -EBUSY;
 	}
+	head->user = true;
 	spin_unlock(&disp->user.lock);
-	return ret;
+
+	nvkm_object_ctor(&nvkm_uhead, oclass, &uhead->object);
+	uhead->head = head;
+	*pobject = &uhead->object;
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
new file mode 100644
index 000000000000..f19c9ae33707
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UHEAD_H__
+#define __NVKM_UHEAD_H__
+#include "head.h"
+
+#endif
-- 
2.41.0

