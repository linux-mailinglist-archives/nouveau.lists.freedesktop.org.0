Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DA8A792B
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBD4112FBA;
	Tue, 16 Apr 2024 23:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j1MK+Swu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7749C10E7E4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKOyJrKf4OvH3BBsinis59lfSIRMnhgoHHQOTnsviCy7Rn4DepZL+PFsFXJmgPs9I9PxRndbbU/uQBv0zSlM7ymO6PmFirzZDdbpp442GxYnH8azRloTdbRm/iwgBRphOMn+L43tMx095YNHB6Zu52lncy/BDSpsWBawuIyAYYxe0FymydHxmxxS7mKvAEa1xRkfG67Wysp7i5zOB/kaJiKUP3yE0d10aao/hfzzZA25J/mBJqYMqWpOyfupgpahmyUPjC+mEiX6iFjAJivcqy8ryqqRF3c2jc8JK68SmTTu1PxqpMSplOjiIlGGdToF9CF0OqSQARMCIPNxcRpdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjcAe9C5y5Z7gDIFBqp4xnSmFCGIJYWjicjJ21YGt/U=;
 b=Gzu1SVkKZ0DTSf/sVQCXcHjlO8Ln/RWnRF/GkeyytdMOvzcrAihvoSrj1TmFy2/BUoW1Om6C0b+j6Yl9U17xH4E1nhe9mYwDCoROquT8+7KnTYvV0aK/DCduMPkDRs97QOXTGpl+ZIyBeND5mXU6nYM/BwmB/09joUAG+cH85dKZMBHc5Tltpy4ASwj8cyo1x89yMD1AaFK9Ub15H8yY1+tU2958hEKPDsfWO+Tfw4XwV3A3DUb5h9/P9ykBQqqV0lNc6lyveBndFAYdIhL/9Ea0kzJpqoqPUlPhyHWO66lCdwQNrjnDl94XyDMgv3u2W/gF9DW81tKP9RuZviDQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjcAe9C5y5Z7gDIFBqp4xnSmFCGIJYWjicjJ21YGt/U=;
 b=j1MK+SwuSe88M2h05grdaw763N06jicy+26InwdegwCERy0kCFVx22iJ6KN/JuVKmidoCI22yW5CJVLJSRxEt7nWhx5IAi9NnK6zzuy+O5Z5xpKbTFC1Dh9flv98Mj3QKRqzPqlqt4VZa1p5kYYDPpXPOA2tp5ubEgWTcyQWeJolr6mPZFqBe4PLRfT/nhPCohwF9PiXwKdjZZdYMmiNzR77MeQmXmnSBQ3jKNEVfqCdoMmGBGe2FWCzq6OoYwZZoKRHqi+iAw2YVtvYBkH0YseI4x8S8B6jzhOYTyz3l9iYCFdTduJsVXfJxOpdeqs+/iiKtSj7+d84s7TmrCYIdg==
Received: from DS7PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:3b7::7) by
 IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:43:11 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::b2) by DS7PR03CA0092.outlook.office365.com
 (2603:10b6:5:3b7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:53 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 125/156] drm/nouveau/nvif: remove outp from object rb
Date: Wed, 17 Apr 2024 09:39:31 +1000
Message-ID: <20240416234002.19509-126-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 237f44c8-e8e1-4dd4-b1e0-08dc5e6efa31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5axAWeDRjlhWayB4mtpY5tIcX18l5a13ullcvzohrsJq/8PAM94cMEPlYGfF?=
 =?us-ascii?Q?TxwoCzKgVvK3I3uOnAfPwWlujDWZ8XWmxL+rbRj3rAYk6AwRvfX2dyusO4lS?=
 =?us-ascii?Q?lZ9cMYJ2VUQ5F3w6hxphoKsyJyOdEG9ialzaEHAV9HtjnzhL6I2ZE1NKHyXg?=
 =?us-ascii?Q?kmLIhseUGVPNlOXUVfC1ekdKWm9z7x+YuUzo8HV55pSTF32b/toYFdfjeyU3?=
 =?us-ascii?Q?gQrpEnPyHwtGtDFfrTf59Tjg+XicI7v+qLfjSHpQMg+HVpLWqeKMsbgWOMEi?=
 =?us-ascii?Q?2VcFkm1LFGbltO7MCH8m6aLQhHJ8qRHjgkLz5TKQjQ0hfY0szv/FgXcH+E1W?=
 =?us-ascii?Q?hvNwCYF4LHTCzbASOaj2PEjwOeC6hT0KYEtVyBVddZuU5ypbC6NGcLI4Dk7V?=
 =?us-ascii?Q?5WjARgqC+BpwAfd1xSM5pI8H0dDv3zal+18jna4C0TzBafIMmmtqdHz1YevV?=
 =?us-ascii?Q?Ic0FlS63jezpJJNZhn1+8H8XJoh4bM0Uk3q3cnpWnfbe97RIws/32MG9KbQn?=
 =?us-ascii?Q?uA7x4+BqA1TDMdkcfxKkDF7E73AsEyczMb5bKwRzecXV2vyZTItjcxf4uLVw?=
 =?us-ascii?Q?b6qF3+sKfLymmUZexE3H27+fwSVrLXeBKTLV9bCIzt/bFaypMQv9TZ/cAFw3?=
 =?us-ascii?Q?RfUYdKRZBMGvyfuKFfB21sj36JgJg1R6cuRfONk1bhFdw/NUX5t6LBdk7BSj?=
 =?us-ascii?Q?DOeoNZiy9samqxfUoZdYBhRtEo7LdTiNQZb8MASPbA0bIj/DRvxR1Jnaw9Jq?=
 =?us-ascii?Q?ZvKOmBlb15mjZR5n5x9BC6a42finLeLKKBX0S5b4bI2tmm9M3T1T5unHlTn3?=
 =?us-ascii?Q?IwXkE42eWRaHp6Qoy4EwGm9YMkPPr2y97Ljn0rulOihNMvAMDcvIawf0+4ht?=
 =?us-ascii?Q?ranprUQ2S7JQA7P1D6Q3PVWHDvsVP8EjjDjWD78dqgBi0LKpFP97O1vsPJUb?=
 =?us-ascii?Q?USUlz9NPiwa0sEya+Y8DmwFrbh4eaOAIxngJkEFTkKuwLk721C5HjIhp/2jR?=
 =?us-ascii?Q?5axsb1g90wFk4fTsTYPVIkOnH4+fUSbGQHwPLlX5DyVMoOUqc/vDJ0xftCVL?=
 =?us-ascii?Q?ttnG1ou3kX6BPO7eblesJ4+1RbNqNHvp/BgkL/9Swtxp5hEIZviyasp9ajFB?=
 =?us-ascii?Q?gJUjCvUXfCdfgt9W2CjvXdXJjuixXmxQGP1WdY4krwbv3qAjZ6LuJ6DaorPf?=
 =?us-ascii?Q?0WajY8KhqJ/4QV/nv7J44y7BLPGrIKg9+cuB5fP4buU/aNyOURnXYmMKMbr7?=
 =?us-ascii?Q?kQPoR1FIv1uYamX8yaUVosNN6KyJ9/sWFq0Vf95q6GLv/CKSOTN8TUDW8eB3?=
 =?us-ascii?Q?3IMGYdzeNmv06p5Olg7WvyUXEER8UhGTCn8TERHNxCpT5HIRQsidQ5t5TFVg?=
 =?us-ascii?Q?T2jEQaTeDZ0c6l1efs8qMW664+PL?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:11.5335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 237f44c8-e8e1-4dd4-b1e0-08dc5e6efa31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
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
 drivers/gpu/drm/nouveau/include/nvif/driverif.h  | 2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c              | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index f7c7a98089b3..57ad5022a534 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -366,7 +366,7 @@ struct nvif_disp_impl {
 	struct {
 		u32 mask;
 		int (*new)(struct nvif_disp_priv *, u8 id,
-			   const struct nvif_outp_impl **, struct nvif_outp_priv **, u64 handle);
+			   const struct nvif_outp_impl **, struct nvif_outp_priv **);
 	} outp;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index f04154e7a7b4..65c4b8539b55 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -381,8 +381,7 @@ nvif_outp_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_out
 {
 	int ret;
 
-	ret = disp->impl->outp.new(disp->priv, id, &outp->impl, &outp->priv,
-				   nvif_handle(&outp->object));
+	ret = disp->impl->outp.new(disp->priv, id, &outp->impl, &outp->priv);
 	NVIF_ERRON(ret, &disp->object, "[NEW outp id:%d]", id);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 678121ab469f..0be6b28c79b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -86,8 +86,7 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 
 static int
 nvkm_udisp_outp_new(struct nvif_disp_priv *udisp, u8 id,
-		    const struct nvif_outp_impl **pimpl, struct nvif_outp_priv **ppriv,
-		    u64 handle)
+		    const struct nvif_outp_impl **pimpl, struct nvif_outp_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -96,7 +95,8 @@ nvkm_udisp_outp_new(struct nvif_disp_priv *udisp, u8 id,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+	nvkm_object_link(&udisp->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

