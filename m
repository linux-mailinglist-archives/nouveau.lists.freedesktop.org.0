Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA7B0684D
	for <lists+nouveau@lfdr.de>; Tue, 15 Jul 2025 23:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA62310E678;
	Tue, 15 Jul 2025 21:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tOn5lY81";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2A710E678
 for <nouveau@lists.freedesktop.org>; Tue, 15 Jul 2025 21:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jk9AT5PZr8sqjI3VZaY/ZXilfxUKWUABn9ih96T3mjyZz4UEt/IlhKsfzBWMInF2mMN0Qa6Tp4jkLI8NLt5GGSFMLMVPQM1Z5GD3+/3J7TCX7uleznHm8cyBAv42/SnePBvt8U84rTNdkbL1LAsqyVbwEErnKIKzRWlj3tID+AlV/C10b5HhNPVBOWipEHtl/oRKNkRdvCZ3L4PKChbMXK1P0bkMoNmKSX92pygFvV8OdXWIX4UbV42wuO6YuiMIO0n/XUot3xulEPJnZrRpnuk4fsr1nSv31Sg6MFtMswE34+nLZvtbeWOHqYt/TCojbvby/7Pn5MsE5feaoCHBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYBFSTd9anB7Nyv+HCVUvslCh/mfRbwDKoVxdc3sFGE=;
 b=LZSXg3z2PyLcEPKI1w6HsLNbzrIqNZJ9lAqaZrjkfbNJx7zrMzZm5EmuM/g9b/bsRkDZlE/6sXvDjBcR4k6moef132oCutYVBfGjHndNTGoGdwGlAsQPWEKTUigf42tQ1o2iY/7FFIuSc0f0mUBAQVUhcUzDqrbg2+CeS/OUMsUfFpPZA4YtVwZSH1For2RJmriQ2hjjU5RKRg5E0vR56C/a64uzQwTl54PyQgt+tg5waWkdy/LJVdUpD6/DKmupHQfDQMoE4cqY7DyCcWGElpZo2fdO0R5H4S3mZ25PBqFRT9wmDFGHJFppa0vwleNSecBM9wctBF4uaklpJzsvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYBFSTd9anB7Nyv+HCVUvslCh/mfRbwDKoVxdc3sFGE=;
 b=tOn5lY81sWTShYUIX7jD3RmQvilzv6nY74X9NvCe77beo3sltt4itnuHleB/vBngvSYTwg2/CvTI0QlqRHrkMi4LMUz1nT/IypExI3Trz6059hD2GTdS9/LDPCJVvaqs16+hdfgX4qUMUCJQCtxu4Wd7t/Rsp/x+ALERhmaTfGU9F1T2oRoe/ZHXJjnpI7fs8lZ4q9sNcV0J/LX/PKStp72MMWzY88dQtbVUm8eS1hKXBDI0r5DmcpetaUg3k9cFRV7DTwKchKJXpOhRvoFANmwg6nkCi65SgcdDZwO3kgROWjyjQxgasPJh12d/906LwU5aoYDGcU4PhhXva9wESQ==
Received: from BN9PR03CA0728.namprd03.prod.outlook.com (2603:10b6:408:110::13)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 21:06:30 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::3c) by BN9PR03CA0728.outlook.office365.com
 (2603:10b6:408:110::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Tue,
 15 Jul 2025 21:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Tue, 15 Jul 2025 21:06:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Jul
 2025 14:06:12 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 15 Jul
 2025 14:06:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Date: Tue, 15 Jul 2025 16:05:58 -0500
Message-ID: <20250715210559.1188776-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5175f97d-c113-4e59-eef9-08ddc3e37854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z4VOWm7BUJ0vBacq87Lu0U4JQLHVAIvMg+Zl4R3/pJ8EjBllRK/4lLXagJJJ?=
 =?us-ascii?Q?KZZsk4RGCqpCZYYXQRRcdF+Cs5999TdiBVjki8eTdhA8YXWP7fjuOlgWlWKl?=
 =?us-ascii?Q?E/zTf8gaqF7GgrfscmK5BxF1P7L1d5cFe7shF72GjTyiixx2iuAfo7u2/oZE?=
 =?us-ascii?Q?xU5b+dLJbSRsof0TVjvXYycjWoKDPmjlxsjZ01nSdY7J9+jOiXvrS0ViSCFw?=
 =?us-ascii?Q?4Nxif8HZ0vqC0WPDqjJ7BtyMDDuPw4CgmlXTSKoVrSC4FnwOgYBl9NxyiE8H?=
 =?us-ascii?Q?EAd5tpi1uxGvghDyEyZqPJboTMLiW+RJsr7YeJgW6s8bJem5xALmdyhejvKL?=
 =?us-ascii?Q?KZE9BY5LFJHNE8UJYwZr1rod0Y0JJHjWaBrvHicSmHbMdTcutnlSzm+6AzD+?=
 =?us-ascii?Q?TgLdicZ6sM64rrpH70MYrK9lQrZAgLZdJcoDaZWlWMW8Tblbgo8L36V8QrmF?=
 =?us-ascii?Q?O/0ojkVK/ENtqULZrbJyFlzx5KLIfk5NTJmYdGPTwZwnNMd2qihFdJzrpG/Z?=
 =?us-ascii?Q?Zk1LjPm6mvwp1VROZcO0DnSnJiKjxdCJOIjEAWco/JM2sx1eXjRbwlvqvKF5?=
 =?us-ascii?Q?F4LdTZEU1eLj+2Jd0kg0gFtpCeFqYnyOAzpd2QYfjBnqhWcx8yoWsfHPdZtE?=
 =?us-ascii?Q?UPYhCZ2Zh0/8gOVtc99rz/YmsXeWG6VilPYglifyEKt4lqrFxPNjf8NpKqbn?=
 =?us-ascii?Q?rRG4ppjDSe6pqfqZQVpgz5JrxijBpr4NUmuvL1PIQqNfrf2+y6NcYfDLGLoe?=
 =?us-ascii?Q?GBF9OWYJ9Y7GI9cE8ZSMWgtYqIZEGCIAgJlUL3sP++NOHIxCYbvT5tinUYXX?=
 =?us-ascii?Q?D9/ck62K9F0qgtFHx7FsN+zIOBEy6fCUnphUvIpRY34Lv0VMGSLC3kqCyjLx?=
 =?us-ascii?Q?Efogqrrrk6QnbOamq1XHPNag+JUe7OouzEBdeJruYDrfZoBq7YtaZ6qim5au?=
 =?us-ascii?Q?zYbk+HX8gLy+ZdQYHcydpvGE8uw9VlwCA40kX3Ji8AaVeX2Xs3bRToT6TkBK?=
 =?us-ascii?Q?0wQ1LqjD2mvcCSeZN1nzSkhRu9MuFlQuCYHG7MKI8AZhZI/ciImrBeAhe1as?=
 =?us-ascii?Q?MFhAJJKHOcVpllNpxhB28DIZX0VywFxit7IGLJnRxIWaIATr1xIhRit8oGiy?=
 =?us-ascii?Q?2SoX5LRqzNjKX+eGIDMlbkCgL0yqGh0W4gayxC2wsp7doi/oLX7EeWoGYfrR?=
 =?us-ascii?Q?KUO1OSQl29GXqmHuBUXiLYG1mIyXzrNGaHrnrP3u48XirSdwX8BdjmPw38xX?=
 =?us-ascii?Q?wLVy0gRorGqeOuBysiqSJ4JWDAzQ1uSs+0VCXCzmKPLiKlBRdxQaH9FbbmoD?=
 =?us-ascii?Q?D91gm9bOmPEHerL8RUBT7tYXBINJAO7QrEITG680ScmfpAg8YJMGJ9DgQE0G?=
 =?us-ascii?Q?sGmddVx6ikRdq8DAECHOqGrFXj1QNmruYCFtpHSXAo6d/vQdkKHmJSISMXyX?=
 =?us-ascii?Q?QeJUz1ROc9AkXjwkWoJNmThizrVJFznhxOuW4LIb3qs6VQm6onRcvSW//4RR?=
 =?us-ascii?Q?+Hv7wGYh6+KeJF8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:06:29.8203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5175f97d-c113-4e59-eef9-08ddc3e37854
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails, but
it never uses or returns 'ret' after that point.  We always need to release
the firmware regardless, so do that and then check for error.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 52412965fac1..5b721bd9d799 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -209,11 +209,12 @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
 	fw->boot_addr = bld->start_tag << 8;
 	fw->boot_size = bld->code_size;
 	fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
-	if (!fw->boot)
-		ret = -ENOMEM;
 
 	nvkm_firmware_put(bl);
 
+	if (!fw->boot)
+		return -ENOMEM;
+
 	/* Patch in interface data. */
 	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
 }

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0

