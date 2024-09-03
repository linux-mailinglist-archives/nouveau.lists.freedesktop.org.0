Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5B96ACAE
	for <lists+nouveau@lfdr.de>; Wed,  4 Sep 2024 01:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF110E624;
	Tue,  3 Sep 2024 23:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K9RYlDuu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D83B10E630
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 23:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHUyzeYyAHeY1ACLaia3a43LVu55QcsrUKg5fqAg89qorHlVz0hs1r8+IoWOmm/zgl0FcCljMOunAvouzkRMu6NG5NhChoogrN/n6ephd1wOITMwdfrmVlY3WoZHuvVI71oi05JDdDAyqZfKzmgxZj+IqMMa2agoTBy7H7t9z/TS/P3ErEXvKorHgeGp/tJQ5nxelYK1zBVZ1bh0MWie2y706iP++M8OTMFcdZzLu8nPu1yxMagWYtgakAMS7+xxECnqI3sHCIMoQcYuzzyhUSfxKknI643Qt7JIf7SvsR91RLvjKdVs1bjwae1Hg9R/USVUDm364PfamtU1+bn+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWAPwd57N2UOqqPqkTWBq0eIBPXy9933Sk1hPdFSDBs=;
 b=o/EtUd6IN6GkcGjvJQ9YjGn/LeKnET2XlUNAhOtxNLTfrHWxYGcqzbz00ngbqaWS6AG2BhNv548J3CZGC5SsLQ2QnkzVJo7YY/ObigXBvUhdBik+T3QVREBEvupecP06zepd6Z0/s17ZlTF/n5/65weOPIgf22icwittqW0p9Hhn6hpH+rPKToW8E4GNDnkfWFZF53s52Pvbl7h9hXC2usti0Uh1kg0B+PL7LepdjgaxS9X2bsb4svI6qY3dk9elebZN5UP9Dwg0yhK29odNC0ba651OoImHv/SLYZiYgFZ1CN1BNgekLisXv50tfIxHXmoAaHkfC+/OJVpA7xCwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWAPwd57N2UOqqPqkTWBq0eIBPXy9933Sk1hPdFSDBs=;
 b=K9RYlDuuCxUVUry4uoixEwxl/qJA/0CEW63P7whGfGDEGEn2kpvmWi/gIOTjwZ9zS4AZaqumK2wgibjjk2v8mg8OLknuWGtdV//VKKN2oDFibhdjsNTlwdYGJ0MrioacszJdKqzK4a9WNmFtsQZr5xiQRk4oir12TmTU8SxTvixr8NWZF1VQhkEZkL9FY+1NArTJSccb3Iac94YccwNBhgYH502s0tca6HammIIfDSJqVS4gPZK/M17bH3nirYlMOdLVFJT8rWrXXFIkaOhSnxC9sKvQewY4FR7gC6vo144DlURfLaqdN1NDb/j00PAuRzyqKrs8oQa1/5Es6hktuA==
Received: from MW4PR04CA0130.namprd04.prod.outlook.com (2603:10b6:303:84::15)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 23:16:54 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::26) by MW4PR04CA0130.outlook.office365.com
 (2603:10b6:303:84::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 23:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 23:16:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Sep 2024
 16:16:42 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Sep 2024
 16:16:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH] drm/nouveau/fb: restore init() for ramgp102
Date: Wed, 4 Sep 2024 09:16:31 +1000
Message-ID: <20240903231631.3398-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bbf005-6662-4307-0c74-08dccc6e7ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gb0CPZfpDI0dq1Ig34b7dUQxa/wXDj1iVHzCrDW2rftFNZiYRngqsbZnr8sN?=
 =?us-ascii?Q?siS8lynmatx0ZXx9XAQ1U6JKyDEcW9H2mD3jYNxkpkamgd5F7i25IW+GtGU7?=
 =?us-ascii?Q?CIaKu/XgjN8UWt3Vjdo+JvoUOVLQsC8vctJbHe9yyOzOUb0SILSGI+A7wQ4w?=
 =?us-ascii?Q?pEwuxF3288s5mJGfiqAK2Dm9pmPgTHFoO/xHzn9NJgi51Szh2h+MUazpxw/V?=
 =?us-ascii?Q?34kqpdRDup5BEAkUtwyBkbcrt5D3QY+ngWxXx0o62TiywUT5pykKvNQajKGv?=
 =?us-ascii?Q?x189S9YIZuNtVoRVIbH7bvQuSSYJ5qvZ5j49jsJmuoHY8jn/lLnpubq6K0Si?=
 =?us-ascii?Q?Ybm6eRgEpneZ8w7RPwx4iyq+GdOifvwnv/zJOHDWgaRvZ83IT6YpAjlr02bk?=
 =?us-ascii?Q?y7vyOVKG+clVhff59Xf+j+JjyRiUgWZ3pvE3pnZVYaLangkRPplvp9Zk3ZeC?=
 =?us-ascii?Q?u6+dn3HRjM1ICNe5+X70Bi6sNmVZ9nzDDigJNuzYxBZLXM18zv5zTvkh09CK?=
 =?us-ascii?Q?E4xT47cye8eKprPYk4oZ+NYOwsxl+n0x2ZnyRyS4QaH9oMPMN8afkJ8vC/sZ?=
 =?us-ascii?Q?pf2FhqLhxAzJUZ9jCt1UrBX4GNHMaRrUwWy6NYbq399n63Pf9D0QdG9zD8/Q?=
 =?us-ascii?Q?KPEluIzGMobWpvosE5pwe9HjM42ThSNOjPimmGk77rBl4ZHD6R/4dCpjBkBZ?=
 =?us-ascii?Q?AYw5LvhWiq4rpCvHd/TAeLKGBUReR4fdilrzxjKyY8cesjObLCqxkQq+/pKy?=
 =?us-ascii?Q?gUCSFMPDMpVt1T8t9ZqU8WKgluSUnGCf7dN2hVCCgOrULBRqkvTGurcJDRDr?=
 =?us-ascii?Q?tXZRT25W1uUFXrAIeDK68uMadCcb8M0vNBs3RBgBNYXLZdX6vwzvg32Ylm/C?=
 =?us-ascii?Q?QMqTHQfoxNUkdld1LseiTaH03QQrEfgn4H9tY211OpqtCZV442jXBRBrAkmh?=
 =?us-ascii?Q?SEFBRR/SWNOrSVl7LPE7QeSdJ5sRsrL6H+Gq0F315opQLQv9ujkCJ2uXmfmL?=
 =?us-ascii?Q?KIRZEgwOtuR2yfR7Ph3SxgMcwk+tTXLMjMimG7abSiIWnbdN0tvGDvjhVuu8?=
 =?us-ascii?Q?rnPuIiT59Bpkqpn8LK1KjAxsC9IselZhRd6Xi5Bh2Bd3hHuf2kmkRqUtkCFI?=
 =?us-ascii?Q?8Rb7BAM/SJIgQzbsn3qo6kncZ3uTAdQzijvkWQ5yOT07oG1Q+v0tc2kkzLBP?=
 =?us-ascii?Q?hEzULm4keBIsk8IMiyZGzzWLek4PHGjAuXZlLkPzjevNJsnWv2JTQUgn8oFH?=
 =?us-ascii?Q?azrOF7FNQjNjXwpGc3vlNfJScqaOz8HgO34Q0s5iJBbUKj6o+y4MNyi+1VEH?=
 =?us-ascii?Q?ZrGuEEcIRhXE668LO0cZTtnGASSgMtWJv0kcl28aygp4NR+iMuD7odvvQ1v7?=
 =?us-ascii?Q?Rq1o4fldSe6T2gq/q1++Vad+t1huNcx/N4C9yWyCjW10dYj3gtmOowomjF/b?=
 =?us-ascii?Q?u3I8/WrOzxCmT107ZaH7syc3bENieLFl?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 23:16:54.5148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bbf005-6662-4307-0c74-08dccc6e7ffc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778
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

init() was removed from ramgp102 when reworking the memory detection, as
it was thought that the code was only necessary when the driver performs
mclk changes, which nouveau doesn't support on pascal.

However, it turns out that we still need to execute this on some GPUs to
restore settings after DEVINIT, so revert to the original behaviour.

Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/319
Fixes: 2c0c15a22fa0 ("drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection method")
Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h      | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
index 50f0c1914f58..4c3f74396579 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
@@ -46,6 +46,8 @@ u32 gm107_ram_probe_fbp(const struct nvkm_ram_func *,
 u32 gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *, u32,
 			       struct nvkm_device *, int, int *);
 
+int gp100_ram_init(struct nvkm_ram *);
+
 /* RAM type-specific MR calculation routines */
 int nvkm_sddr2_calc(struct nvkm_ram *);
 int nvkm_sddr3_calc(struct nvkm_ram *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
index 378f6fb70990..8987a21e81d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
@@ -27,7 +27,7 @@
 #include <subdev/bios/init.h>
 #include <subdev/bios/rammap.h>
 
-static int
+int
 gp100_ram_init(struct nvkm_ram *ram)
 {
 	struct nvkm_subdev *subdev = &ram->fb->subdev;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
index 8550f5e47347..b6b6ee59019d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
@@ -5,6 +5,7 @@
 
 static const struct nvkm_ram_func
 gp102_ram = {
+	.init = gp100_ram_init,
 };
 
 int
-- 
2.45.1

