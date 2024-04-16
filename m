Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2EE8A78B4
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178FA112F27;
	Tue, 16 Apr 2024 23:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A61Qkn4Z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC62112F29
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr6AAKg/bnRUBicW7d4Htntu4hF57i8KH11Rpmm27kAKN0B/mm7sAlKhtWBedn4shHmxdpNnW12+3fPm0NvDjCEv9lvDq2pdjZdN+l6CZben7vQReBrNfMcWn6W4cwUNKGCuqW6br4+U0LEUkY/BuJqUrBHt8qcdDMRz0/3mIAcPsbbmKb1RCSR623EuEtf5py+WN5WY8NNhUfn0CTnsiZt7IT4z9lsyHqinuF/x++d5pYMVNLI/71vRTnup/htUQir2W/oHulqTDmCl5yox0p+jKHkudLvw2C+J+wLJLe2m9CyaSeWlknaTkWr9XsR6pP84g987qrzn7qCZSelF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sY7gGr1uZ6EWGPjKviVwlGqrFa/j7HAmjlWUp55vfU=;
 b=aUGp04Uo3RA0XTprt3VQmsx3N1lh7D0Pbt98wIE4fs0Pf61nOwD77DKnpEe9J8A/ciBst2Sj+qvHw5XA346evLNxpkgmLesruWd4QMwlMY3xlpcdtUFypjbUt9dn6+rGP7YBUtKkh0nAxgwvdOWeMyj8kDnxeH+R5XDW1Z16Wp1ZBnI8FXuAPZVuCI0e5CF4EGA/2ahDFhG0xkUflROWlRBN955hUOW6uE01mC66GX1PJZROn+C0zFDrNErm4HKbyqmyuKfVrIXWkQpxn3tyXIM/dDNZtYWLIWewaEhKsjg8ceNkg/JExbkPo6MOhx47jMuS89ScQ0/8/NfvZ3kcwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sY7gGr1uZ6EWGPjKviVwlGqrFa/j7HAmjlWUp55vfU=;
 b=A61Qkn4Z/mVnXlHSuaOcutJSxF8q+D3Ispehl5RLJEqER5JlM3KPgWqmmt0pct4GA0Mvhmvc0ajoOJA8y6G9rjrB7LtUxqIx4EBC/V7RcVTDia9nd5kQ1MikP1MqWfSYCJFJWU1iYCWnR0nLEhfWke1cdJIEIgJTa7VFlvcrFjZ2sAvqjqIGqyr97mazn0ktO1tdRhdBoaRyLw5zZPR00tFEFLkBjohp1J9kjj4vw0ALUNI3BkRQqCZ/HBFu9CFONGCStVUrCy1p9TNjZSvWVpoHWNO50n+jP3QKV6Uz0I1uXSvK83VfzZif8cQjmRy4JeMW6mQnQL9Wv1lEWslGzg==
Received: from CH0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:76::20)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:07 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::c9) by CH0PR04CA0015.outlook.office365.com
 (2603:10b6:610:76::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:51 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 018/156] drm/nouveau/kms: remove a few unused struct members
 and fn decls
Date: Wed, 17 Apr 2024 09:37:44 +1000
Message-ID: <20240416234002.19509-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: fa23969a-9cc3-4c52-724f-08dc5e6eafbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u48oY5j6caAv75D8yNv9SkUcdGTY0axeEdP+QyvJDIppjKW2+4luYHiZVa7W2BYN1b7voFI0xUCRvi+bcqJ2W5l45FuAzwbD1xdk6+FBb2o+us8zVbAKk3dxx3o7CUr1sfYLcCxQPv27mUztkcv+uWIvmDfiMK4FdyMqNhMXvmdY0Se4f1y2UNzvLEleMggzxs77nv4NuqaFf2cELwk06dhaJ5wSg9SxdKTWOpB7u19qEc7ZHhFfQl25MaaSw5GCyAM3y7t+w4ppozbLLdaCZonD2XgQ2is2yHeiTULyT3Oygc5TkYtIpOG3Ldt6MoHm3UDTOioXJgJNKinsNsS5hKFQmM3YQ7h8AkNkRj3cz5lNdta30YZi4Ugmq6b8lvzkPpvFIum1ouyL3dzMP6TOaVTCQKmcTWyByv7TtKnqV/iPpcom6XKzLs7p+azlGZLwGKIqfhmzmvVohCr8PgchN0n9iPDLfDB7cxwCSPkL2B+403uP5C+cbSgUCXK/xEAj7Vs5/VKnEpkmTa1MO+xvp7LwixMvAKevM7eKyLXqf8RMhqQUfws6BURogb4Cp282nq+SqkBwhhtdMQBos0rXZC8J2r/97t54OiGkZHk2J2ftcfByuD1jQO1qDYr8LwGYEUb1XJLxXEA+CVP+MVqiBwHXwgc4D4MW/VgCGqFtBhusL+4XqKwL/TWiPSZafjROQVN8utAjHQeW8Gvlju+flnSJj/ronokTbcXDiF0y/3gaONRS3zkkLOgiglbmTkQg
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:06.6072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa23969a-9cc3-4c52-724f-08dc5e6eafbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
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

- left-overs from the past

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f8ca57cc7af6..f4c9399e85ab 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -236,8 +236,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	u8 type = NVIF_MEM_COHERENT;
 	int ret;
 
-	mutex_init(&dmac->lock);
-
 	/* Pascal added support for 47-bit physical addresses, but some
 	 * parts of EVO still only accept 40-bit PAs.
 	 *
@@ -256,7 +254,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (ret)
 		return ret;
 
-	dmac->ptr = dmac->_push.mem.object.map.ptr;
 	dmac->_push.wait = nv50_dmac_wait;
 	dmac->_push.kick = nv50_dmac_kick;
 	dmac->push = &dmac->_push;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index da3add95f354..b66a30915af2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -64,16 +64,10 @@ struct nv50_dmac {
 
 	struct nvif_push _push;
 	struct nvif_push *push;
-	u32 *ptr;
 
 	struct nvif_object sync;
 	struct nvif_object vram;
 
-	/* Protects against concurrent pushbuf access to this channel, lock is
-	 * grabbed by evo_wait (if the pushbuf reservation is successful) and
-	 * dropped again by evo_kick. */
-	struct mutex lock;
-
 	u32 cur;
 	u32 put;
 	u32 max;
@@ -108,9 +102,6 @@ void nv50_dmac_destroy(struct nv50_dmac *);
  */
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 
-u32 *evo_wait(struct nv50_dmac *, int nr);
-void evo_kick(u32 *, struct nv50_dmac *);
-
 extern const u64 disp50xx_modifiers[];
 extern const u64 disp90xx_modifiers[];
 extern const u64 wndwc57e_modifiers[];
-- 
2.41.0

