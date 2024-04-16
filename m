Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7158A78D7
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FE3112F1F;
	Tue, 16 Apr 2024 23:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XiJ6YqB3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435AF112F1F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZl2NIebaHGtM03iDT4VOD6flgzjHxTq2yjDMHGGcxqKEETaRIyE5si0vf6Ve/JxS+ER/lYNhUzC+auSe7gjem7U91rtp5HJE8wEJKTrRr27vCur2lv/GzkgB6vhNg/hEbVJK/ILhutZGAzkdaiY0C0SR94TDAiOYW/nEYcM6Ela51P8yqf3Mk5LiurFL6GSevi7mxAza8rB6D0aSZ+m//bEWhMiuNImPeXFTzPJOtZazD8CeWFKVWQX5s6uy8+JDiUOCdXMjf0Lcd0TZrC0u3Ave635cYqzR/mGLpbMLqw7D/2gf01DrlQ6j0VBXs7nkVsZuyzHpvrSWfwJyBt05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VebyTVlRQrUp7QZeMCa/1bz1e2JwKYcjlQkXE58yHQ4=;
 b=eR88ZVXncN1eYabQ/hV6CZVpFw8kgDgmfmiBAbn96G41RssLqQVHTrVOvR4hWTrJHIyas36kXwiU3AowtmKc8dsZqiFdoNcNhZFpwunpd6XzE6yC5ueswTWd2NB5zxD3Pa5X5XXMNyXvn6jh+phroSXMEfoVq8XPgoaayMoTQJiWwBE164IKBjdyQzQGDt0yqBn8y7Nqw0A8dWnduUvf1FcRVMZaPiPMLuUM8UKRrHVPqUY6pqdcSXepF52On+AL950VYpu9h4D9V8J2qqP0XNABI2hEcSaEh+OGMxB+o6Ihz7RfdZGkKtjsXzBFzvZX+LTGtCsHeaUQu9WDJjJ1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VebyTVlRQrUp7QZeMCa/1bz1e2JwKYcjlQkXE58yHQ4=;
 b=XiJ6YqB3TZhjywQCb4X4Q4Zf6g6bcMmvRMTXAeEIdF2/5iRMWz4q++PaCbW6Svd3fHdVfYEzzTWma01jKQBFn05+VPpUF+hb3R5ABsCjTZrmeX976/5qbQ2cfFEfEJIrvdKs9iktgZEWsYwmotmRGnKnbedEUXOK3rJPSq6Ftb75eEoPwsa9DMSUP2uoK8lHDijjwOwMfWhbOXJcSFHt6WzZTWZI7x3B9zLJdM4TciOFJjaO5drs0kvL6qsUjiXdzYcbmG0oDmAPk+m3cYG04z+7MPobVw8DcLo6ogs+E60JPTFxWqQK1lHBEHG8m/8F07wwPmIjzKkt7YJQ1Rn7Tw==
Received: from BL0PR02CA0019.namprd02.prod.outlook.com (2603:10b6:207:3c::32)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:42 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:207:3c:cafe::14) by BL0PR02CA0019.outlook.office365.com
 (2603:10b6:207:3c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:19 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 042/156] drm/nouveau/nvkm: rename struct nvkm_uvfn
Date: Wed, 17 Apr 2024 09:38:08 +1000
Message-ID: <20240416234002.19509-43-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed73e4b-90ae-48f6-1197-08dc5e6ec4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Vqrw+sbYjrhH3iiz7h1u1ZVyXBab6i+2Lp4HKSJLaBAQGUwOCrm/25RvvCh1CpPCjTq8UwGgo5gUa7/Bvrdk1p6PtuamTtIkqTrdC+Z/CavZhCSSgCRwJy5b59SdSCTuWQWB0bKt9bp/FjYoYBitRh5e6SSvxNOQ4pr42zSmzs4X6jPr9eqRLz/spAMZUawu3IUVCj0WYb2hKlmDTPDvDYdS+2DamtSEsWmV2A/xfRIWPliraBRjuxAuHycInG61+CRLDayg3YdwLm0c6pOuI5HePHsPjlGWQPeLRBCEAbKvPSoXbofBJtQDSdDxj2wjH8bBkB884JarEePBsWFFezk3AYzFGmiaJ9TKAG7RLqid3XdYL2/YQ3sEOZes/JhCO0JFduJ5ur/vZ5wTKN/GdiEEe0WwPXVpr6kG3/a65Ct80KwPhKNHYIUVKgZZY2VU1b7ZqvKcGQ3zLZ725NCdX8kJB3OubRPv/KeMTo39cT6FfU5DIZALxUCVnBB0J2q6B7r0j29S2VP4IWwU6rXJsClYB+/IVBMYTz/+LSZ7Q/vkS8fkl2QLGNZ+CtIpX4krNLx9P0Qvxc83DYbWzgF9gUgM+suQWZnYFJCD6sAN8IShE822DzUoBahbKfw7O89lv7K006HxRqE2RSYHldY3psR6XABkjp1hPXtsUYyeSkNP++9Sw+fAMgr9DdCZ2nqedDiu7sZ7UC6MMN6VwUy/rg8aTVvhsCsu7rtL6WDOat3fddMUlqMkn7tJd6OUjqm
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:41.9382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed73e4b-90ae-48f6-1197-08dc5e6ec4d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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
- open-code current nvkm_uvfn() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
index c5460a14c541..fe35024d69ba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
@@ -19,12 +19,11 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uvfn(p) container_of((p), struct nvkm_uvfn, object)
 #include "priv.h"
 
 #include <core/object.h>
 
-struct nvkm_uvfn {
+struct nvif_usermode_priv {
 	struct nvkm_object object;
 	struct nvkm_vfn *vfn;
 };
@@ -33,7 +32,7 @@ static int
 nvkm_uvfn_map(struct nvkm_object *object, void *argv, u32 argc,
 	      enum nvkm_object_map *type, u64 *addr, u64 *size)
 {
-	struct nvkm_vfn *vfn = nvkm_uvfn(object)->vfn;
+	struct nvkm_vfn *vfn = container_of(object, struct nvif_usermode_priv, object)->vfn;
 	struct nvkm_device *device = vfn->subdev.device;
 
 	*addr = device->func->resource_addr(device, 0) + vfn->addr.user;
@@ -51,7 +50,7 @@ int
 nvkm_uvfn_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 	      void *argv, u32 argc, struct nvkm_object **pobject)
 {
-	struct nvkm_uvfn *uvfn;
+	struct nvif_usermode_priv *uvfn;
 
 	if (argc != 0)
 		return -ENOSYS;
-- 
2.41.0

