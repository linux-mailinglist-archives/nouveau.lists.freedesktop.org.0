Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE18A78FA
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0A112F73;
	Tue, 16 Apr 2024 23:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WvOfAOQ9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE00D112F37
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bx+SiXTGqaS+WCk3gt47W8XFXLu0u9hFbvCz0BFcbCUrxQqjTCrcYsbRJdiA9EGvAvMpKragQ04I9+K3Jxf61aU3jngoNzbTQ5rEHiaMeMqYjbuJo7h/CbUFOOMmW4YIbYVfp5Y6ogCAUN1blFs2O9MKs8hN7Z1L12XQs4GoBVkmrlgf7k4dQg0h1Rj7PL7cMjfT8Uq8Ar11OqE3PsLOrTSJYbZwxXTP9C2G8I7IPBAu5ZK6qPmme0Duyh3EQNNyrx8dw35wQJ6EBGOA4wRDTL6PnH8/BzReJpnyDwEyjVwdQQCVzuc0kQ4uwwkG2QvR/L0JpAx8DlP1yJSWRUFmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XgMoiLe/0bmZe4fZ1Eg5LmftkwyJUF4BDJuY+va63o=;
 b=NAKHjKcdmzxCWliWFVs1K0l/4MznOkJxqnGMnjqH39zqUZeKTIyINIpTk5t/6v5OsIRRM8b24KhUhHesonGo//ivzKy3PA4Mugsib5+hxpu6hS7Ez3inxh/veWfTkAoGU/LFErfTp5S+25MG5pZGu29XIJ6Np9CTCtAcpimm7aeK9fu6W7JlPv6EV/kukyy4k89ES5gT9Bw0dZld4IAJIDsHwQT2O7/m2/7FJv22Zh3ZGqDNjjqSBozZ2yaK7XCA7aE6NjwCSI4Bax/VRFVrGNkmKX8hkyjoxfmzVKnOFNHsCHgmJ3stPGFQx8j1Rw332d7GmvU5dXb93MWQ9VnITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XgMoiLe/0bmZe4fZ1Eg5LmftkwyJUF4BDJuY+va63o=;
 b=WvOfAOQ92kQ4m6ApWTkUHqHI0gJT4AqSSV+Q9rNk6H9fTfffjjjq5Q1cLBuBs3Hy/sHRg0riewvbsmt4GT0a5elXN57GeB1JfWJrrkLqeI7YjZoPEeWqZd71J5iPzBvsjDamKKQNy3wMbrkTXnhD1Eve+/bF63vMwNYhfUhsxUha5dlMwFF+CTeS7DxfalR+rv06fCojGQJMkF5B+CjQEO3iHvmNf0LZuNqvk68+LGYjQFVVAQsCdNo5uEeKhYOllMSYO/atIqe/53PKVnZMR5F0akyAgFBBbegMCiqtUtSd07YErkIllaU6APvYBzYMNanqWGt6HumUjbH6FgDUpw==
Received: from DM6PR12CA0024.namprd12.prod.outlook.com (2603:10b6:5:1c0::37)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:11 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::16) by DM6PR12CA0024.outlook.office365.com
 (2603:10b6:5:1c0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:55 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 074/156] drm/nouveau/nvif: remove ctrl from object rb
Date: Wed, 17 Apr 2024 09:38:40 +1000
Message-ID: <20240416234002.19509-75-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 13db9491-1469-46aa-dda0-08dc5e6ed636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hyZMQ394nwxJ1x51EwsN/3BpifX6fJLeqqFYzTt2BQLZz1LvDDKBO8RW8aBQbAcxgbr3VgdimHrHjmk8iV7/0XTDFYG9K8qofj339JqdoWDvmxOqIZjqg/XUHLp7Spom1uRzzooI8SygafKZREoQXJJHAoK/8z5TifhblWhCOH4boUbIhNeoAFNAd7+kq7tilKZHo8uU6sdRQRzaMqv5N9eFSrebfQkKB7LalRPAFhJ8BnX8vl2/QYuO1ciQtYmF9gnfXs9RmWTyGmimiHRFx098S52UG7oexyrFe5yMVB0/7wMC/7O+CbFwlDRAg7uDlFe2r5cWDoijjl7yBT/gvxOMQK+uaXJMY7favUpjGy3JtZf8xoB21+WvMVrelJDSOpkIC5JAB1zcQoNI9R7r1/Li+vw7k1ZGyxEz+9onYquCvk14fztIP0x4xlKh4uP3IoUkfJEK97Pqoe4Ntg3mpIt+0yUjzpYkfzmhiyXOyjcIl2+vpSgsFQIYew/BnonOKgMjRElPXJsrwkoJeQKfqsBcPYzNVzhn3/EpQBbrUdqr+pty9OQCFEa8kqo82JDlVW/9EJt0KRz7YDg9SAASDM+NS2cxaAJwkL1zR7OPVdiRzZKEz1mGTyyYYHS59uHWTuA2mcAyW20Scy1cWPv0PJFqfF7r3yU121VS0nFOZSGyayofJ3WamucRULGbJZEkkNw1+aXIF9FpwurjO0TWz3uKNQYaia5ZCxnC62eR6qVr5GYXdxv0mS6lDXMNGrAF
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:11.1694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13db9491-1469-46aa-dda0-08dc5e6ed636
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e22e0347f623..05d69ea0f002 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -112,8 +112,7 @@ struct nvif_device_impl {
 
 	struct {
 		int (*new)(struct nvif_device_priv *,
-			   const struct nvif_control_impl **, struct nvif_control_priv **,
-			   u64 handle);
+			   const struct nvif_control_impl **, struct nvif_control_priv **);
 	} control;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 837653ca1753..0c744a72aff2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -293,7 +293,7 @@ nouveau_debugfs_init(struct nouveau_drm *drm)
 		return -ENOMEM;
 
 	ret = drm->device.impl->control.new(drm->device.priv, &drm->debugfs->impl,
-					    &drm->debugfs->priv, nvif_handle(&drm->debugfs->ctrl));
+					    &drm->debugfs->priv);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 14d548c3f6b0..97d54b812165 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -41,8 +41,7 @@ struct nvif_device_priv {
 
 static int
 nvkm_udevice_control_new(struct nvif_device_priv *udev,
-			 const struct nvif_control_impl **pimpl, struct nvif_control_priv **ppriv,
-			 u64 handle)
+			 const struct nvif_control_impl **pimpl, struct nvif_control_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -51,7 +50,8 @@ nvkm_udevice_control_new(struct nvif_device_priv *udev,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static u64
-- 
2.41.0

