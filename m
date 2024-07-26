Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363B93CD5A
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696B10E922;
	Fri, 26 Jul 2024 04:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ixw+o/E8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750D410E920
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9mNYMJE+z5TKHlD/n/NnObyMibpFxMSR43tmGn4T0fp7gRLUjogJolLGdT9EXzWRLkt7rL6ak6c4pG6nmsQdsx3dL6MvObo228ln6hCG3Q7F1FS0y6Llbj17PTTwYqDrPAUhh1TA6wTDn48pyvwS6xdFmjpqpOxk56LqE3TZqBFUcgwt2/HxEJYLB6zH5sreu3Ger+iJsdGnMgcE4Z9vV75OP3Hz+ftOgJ4uC97xTLeHAfYnEB53Lp/XwGrA0jR+skz4O8+NFtjlm83c24/eMlB/gMNR7kuYsS7vZSZSA0etj/B/CJIdog0JRwLaDl448QnQUDRS+OSnnUXWsnc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X1o/3qcgWW0Z02Fa46+OdLww5e+EzmFm705PVUK3P0=;
 b=WPwB+Hp1YwAwBlZ6cHMcOr+6hQgHFRRI4RkoHRxZLThGXgIL+C/pn7RKAGSU3vIabTqYej8bTrzAxS7l53gToMOMk4G75WchgeHRI63oAobZ/8obwPFzJaVlsmCWj+h+/zaQDzM833cdsfkJx3muMUWnIEnkuoFt8hBliL4X80TVyfTuZAEH2pKzWWMZ5MGqfR5nkkA6Ali73RHd50bxG0mHp7oixNRwcnntbYSdlmOoaKHti5OWe9q6u65OEoU19PdgWBSL5YmOCAR9J1ZbStd4khTN+V+ged97ppRSwNq5jf+f1EdACKtWJA0OgZUPwDIZRPBPogid7N55D8jaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X1o/3qcgWW0Z02Fa46+OdLww5e+EzmFm705PVUK3P0=;
 b=ixw+o/E8LDlt/DTwYxKmm1SoMyDSnq9mrgCk5s4cJnwVyIhBduRi5Lhdql9aXOYH+6jDt/JyhP2/LfPiNlJwWxO8Mo3b0OAXxR9q3l4A1cg9yU5DFuS2TSsMdUP4sp7nO1XgzXfU7+E87O1f+lP/LqRzbSc6wyYl2dNmDU4n8sQPXlE4mh9Bwoz2M1zaYOac93XD0fdt5nAhAg0XG0xnBNBQm949U5q3qefNRkul2YYVBGb0urBLPWAkSEuBRcq2bHg2AtEFLBYS0pRGsZsytp7EDLexcYmZTENHPJPBmks6c5FJnri2O1Jza/LIGkNHHeWbMZWQ6dUiMt8bq4+9Ew==
Received: from DS7PR03CA0349.namprd03.prod.outlook.com (2603:10b6:8:55::24) by
 SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.19; Fri, 26 Jul 2024 04:39:47 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:8:55:cafe::9) by DS7PR03CA0349.outlook.office365.com
 (2603:10b6:8:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:34 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 36/37] drm/nouveau/kms: remove a few unused struct members
 and fn decls
Date: Fri, 26 Jul 2024 14:38:27 +1000
Message-ID: <20240726043828.58966-37-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: b4978484-4e46-44ce-ffa9-08dcad2cfa3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G5U+LEWAqoxXIJK+hpY21+HbkyLHQFqJhFRmx8TS92xnihJxeVj2tz3khTcK?=
 =?us-ascii?Q?U6TP8HLH6YY4oXT0vf4P2NkUySDJu6PBSsBhOU+fPvlKc5H7/Djnk0oc5XzV?=
 =?us-ascii?Q?HMIL9/ZyGDMP6q5KUlqke2rfGte7SSIz+MYIKFD++gr7Upsj3EQWZfLLRdcZ?=
 =?us-ascii?Q?b1ZkAoEiIvHbgn1asJNPiv57vS0Ct6BA1oCEfGlguSeyPSwYnC/P8Mi52xpT?=
 =?us-ascii?Q?r56cfZ53A7nOvxtvbF56FEC5QQfiqbz2L6fvTMMqPtEfsgF0bWC7mYxFOK3c?=
 =?us-ascii?Q?tGie7VrCN0DTPLEGZ52oUJXRWSDJLfqs4vrECNAZsLpDtdtCxs6xr/PwU3om?=
 =?us-ascii?Q?1DYthwPN1sF7ujNJV9ARVkzikmQYRq9OK3RHJqEgoBtAT4ADYMUmVoJDbLrt?=
 =?us-ascii?Q?TjDcc4oNA4VM7fObE0JTNMLQRYr5IcjCX8qR1KKa0P5g+elov1NGf5sSjDYP?=
 =?us-ascii?Q?78F+MWec/L78OUkNTzRXoga/noB9UmtkKz8SpkMoGvlXU0UPhH99KDKNi4X0?=
 =?us-ascii?Q?mA2YI6GpSitex8L9wGtw1wQpMxUh7O2e/BFwAQkzBwXDu1w1fZPKA32e4MDK?=
 =?us-ascii?Q?EvJDX1bZlxbTe6L60kKtYi9vHAzkA8DWoKOckya9TlkR+HjKE89T3Xjecw4B?=
 =?us-ascii?Q?6U5nVo8gU3dysuLlAfzGUNef3Kb0eOZXMDievmtC/8RmgJrW8ZOmsEhdlY7R?=
 =?us-ascii?Q?rgo1CbdeKLwNTGFQNkm8wNGusezPEw8vEL/FIEKxAd8zNccTjwtmxL/IcNtD?=
 =?us-ascii?Q?VWbINWNYU71GTYI0X2lFuu/vU3fOZ8CcScGJLISveigdb7WDHgldrbenihby?=
 =?us-ascii?Q?OLDmgsGS0z8KgrJUH3BfyCyBMqRTSOhXpWoDeXtxSDAtBOD7TF2K1B1F1/HK?=
 =?us-ascii?Q?2tmuMDNpcNq+94QG4DlHr8B0ahJ3MbqgbH90ymZn0uTn1edWdOD7z/qDso6V?=
 =?us-ascii?Q?P/YeqB46mtM5E9WrQGlBdFle8K5pwTWjJqjtoUIQ9VcWdEBgQiU5MiuO3WMN?=
 =?us-ascii?Q?Wsuvb5cU0KRk+uBRqMBjYS+zBTYE7Pj5lAQb88RlR2hxSRJtQ1h7LNesbDNy?=
 =?us-ascii?Q?SxVOSbbTnJwlIk7g/oO4btr1V8WPTU5k5pinmADVnX3/OJbPRUt40zD6QalJ?=
 =?us-ascii?Q?u5gXSCYpMIupAvuxDD9LzbyaypsrK5xHkwqPWjo2ddZIW4ZlnSl8tR468ZV3?=
 =?us-ascii?Q?AkrvUampOS9oNhY9hjUZbfI57aFWCJ9xXztA1edbZq81XrFZ1DaFnNUdv3Ws?=
 =?us-ascii?Q?HAYU/XxcqqllJKeiDb/aQdEjOAWsMqXtIlWM6yP8kpS+untE5h01rlEl6RxN?=
 =?us-ascii?Q?eEnJklM14uFboaqBhf8dhikKdX6V3BAKm+ZJsFWq6dFfQPxgLogdfbkldF6T?=
 =?us-ascii?Q?j3ObHEA3LOZNfhZGFCxXER9TDoXaPjipxQYpTdFyHlYa6Pq0rPVdAarBw1LQ?=
 =?us-ascii?Q?+XtlFX48+fb95eynFIQyPed1uTm0RWYJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:46.6985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4978484-4e46-44ce-ffa9-08dcad2cfa3c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
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

Left-overs from the past that are completely unused now.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 242887ab4ba0..22ecda545550 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -239,8 +239,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	u8 type = NVIF_MEM_COHERENT;
 	int ret;
 
-	mutex_init(&dmac->lock);
-
 	/* Pascal added support for 47-bit physical addresses, but some
 	 * parts of EVO still only accept 40-bit PAs.
 	 *
@@ -258,7 +256,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
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
2.45.1

