Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070059897E2
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8110E37B;
	Sun, 29 Sep 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c8Uz8nav";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7FF10E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVEyfm5BfHlNEx5Czr7UEZZwwTLKa+9wufsXX+ujqWWqlzIifp6DpTQ2uJ+rz3jWICAGFue2aJ5sepk+5F9qzoFLoJ3AQh6O/u8b5sDdeyCT8V2+L2M0FuMLDQHK87e2b4SKqJSjXFOEzFNm7/JZl6KRfDpLIrWX1/SlVsSuO1wxDv8QqsjLAHGvfR6J6UFTShBSBOKlx5Wthh5zIIguntaniwYvtV6zfWKADFqY3PMoPwzce75hKcoIoV30IeJvyLRjfwj4TRsEwYhk6l0XaoLDkosZCwuWu6bvZwx1uqAWBJdNP2Fv/3jvBSgEt28+1KPkhL9WXn5B+UaHh2OWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=QWxbDtmJIbXrYKlw0egaPIxZqmly7f7GH44krz+Z9tNE7jt3ueCedVHz7ADnKtjspcRTZKgnF1PuSgS7a4SjTPd512y2CdHMS+ypoHHHTjSyxuLH6ChGNAGdwTuYy+jr8LCx+lkAHkq+U1f5vwwkfCLfjolAAkGs9Tk+2bTdIl2jowUfsCy1d34xfGyMOnesNbsVNQfzJLZ2COpMuKVvvYPwH2ZcKgjji0jT0VlPvcUhzkF5w75a0utNfuI3m13+ZTmO3gn6JGzONE/FHfKsn2xpgz6hWMw2hto79PDmMWNye368tGz9oldbvAOMyU8tfjsK6s9R6edlQn+dmQEThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=c8Uz8navTbVHajeibTj5k685zaGzb8VSegC1NKp/qxN135SuCFAj2ZboPNxlWFrxgBbWMG93v+dcVPs9sjd5WV/UWR5sdGvdizRyvqXu5wVA4N/aqLkE8CyLasSzulITxdbnh7OqX7oIyqfTXtL2jML0qbffIKj2OfmzQVVvmA7LD7fmgwoVjnxmzMSxfqZEwUtxNN58b/CoTXM5L1DdfIZLuTk7rpb2JXbpygqBUKdSmIzsNLAJuuvNEEDWCxuz7ccc/wOxKTE18POB5gcQogR4uyEKbBYGCmRgQI7hH+fMkQerLjcHooC7pFjGtHEPx3rsb3yWXH859dY+f+nCMA==
Received: from BN9PR03CA0611.namprd03.prod.outlook.com (2603:10b6:408:106::16)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sun, 29 Sep
 2024 12:17:02 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::9a) by BN9PR03CA0611.outlook.office365.com
 (2603:10b6:408:106::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25 via Frontend
 Transport; Sun, 29 Sep 2024 12:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:17:01 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:49 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:16:49 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:16:48 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Date: Sun, 29 Sep 2024 15:16:31 +0300
Message-ID: <20240929121632.441007-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929121632.441007-1-ymaman@nvidia.com>
References: <20240929121632.441007-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: fae6441c-4a75-4ae0-e22b-08dce0809f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4UJTMMZPmlnNP+GLD/mlxuS5PeLvyK3Ls1ZhAW3isTRUr9KIfEtfXJL8vtW+?=
 =?us-ascii?Q?+Ckc5XzPBbZWE1qO3z/NIgl+Kkgrb1mXlW2u6kcZHaTBMnH4y/Lwbgjpy1o/?=
 =?us-ascii?Q?OozJVyj8MlZU73DUgBeWRvsYRAplXyUWQ7wsseiieSWs/MxSJbjl4rE6Kbe1?=
 =?us-ascii?Q?zCE61cIqt2a4Bvy4gB6LsfUlaDKgikpZeZ23wYhOpYatZDvg2sNWDVwlMjz3?=
 =?us-ascii?Q?s/LVSr78UewJEKMSGOcLvE9YSpUyOM21PHHOAqGr61o6zz3XOEvKSyMsXvG3?=
 =?us-ascii?Q?tvnIBVNE+STJl1ff7mioqHiksGqCcvkaDg0lFGEpu1QNe9ywVNkjUtvXf+hz?=
 =?us-ascii?Q?FKGKjFkENV+2rHj3wSNBAb1Q/kcRsG81gGQ3WecSr5gxHLwJpVRH0d2y70Sn?=
 =?us-ascii?Q?eAA17kx6VmQFK0jrlCfG6KugpBpQqxOBq+UdmY/Qh78H/bMeQuIisaaqqcom?=
 =?us-ascii?Q?slY0EFKGHo6OXfFk4m53w4tCieoiTFOpXidyDlCwmm3WPpWjDh/gw8/Nz194?=
 =?us-ascii?Q?vJgyuZvtF0KKbL7q672CgcblDVhnL02nrTaIKyEziCyJHYtGZtxV23T7vZ7m?=
 =?us-ascii?Q?SY2sAPtPANa4GTqs7yJL9qOaBhUWeKObEgAPjkCAdmKi7yThpAPu7s47M2PU?=
 =?us-ascii?Q?+SNcBaLWqRUPieeQyJir2Hvd+XlT3mtGoLbOvkJ52p/w/DNO6IaF4UJ2Y4IP?=
 =?us-ascii?Q?a3SBa36IjVc81kCR16tLo8aK1DUPqDlMbB8E1DRVY/R1Xzkh1UrIjhIV5LQZ?=
 =?us-ascii?Q?R/T4NO2V/MA8E1GdlbPH1hK0JTokmSo32ntAud4yMLp3ZLbpAvnGEvBlumgi?=
 =?us-ascii?Q?mD1S+IW3B41BV1OgJcZ5wtVfG9yPu5xq8+VUARgggreZfJ9k6il+PbvFhTHi?=
 =?us-ascii?Q?cmYECwpwI2jLWQUkcSMztDlYdvhV03as4CR/MXFOhTTlvn0G4BQ1RkDSwXwo?=
 =?us-ascii?Q?hik7bJC2hNO1FISOn9dcBcG/k/xiGO0/2fVDXQcHLdTRkphe9vaf/Sdpeb+W?=
 =?us-ascii?Q?wn1UWUNB/ejwg33gTsYnMQfea+1lMLwvehAnnY8vBBTUhxnfdAwpfuBA0C7g?=
 =?us-ascii?Q?MTUkGD8sy6Q879l1kM3HHqS6ETL/ErBbiNaAIPbr9SsBVKQloNKivYyOESb2?=
 =?us-ascii?Q?80SZ7bP3cQ6xN1xKD2nnWz03yAsxaGVElTnj2m+eL3uKXl6XNxqofuJvhLTI?=
 =?us-ascii?Q?YJrZGH1HnqtunY1cy1af22+vKN60CWUNqLcufHCMAlnIhCYWjEmKuWvYlvWx?=
 =?us-ascii?Q?kzkrvK4FBSeCZ4LcI9h7VQgZShqGU7o8rd+JPz4jIdAJ3p3Zq/fFEOfBWgpb?=
 =?us-ascii?Q?dXHbbuqkgqyQa/U3h1qm3AaNUbdqxSaO2J9beR1Ukus4V+w4COlEnS4dnGF4?=
 =?us-ascii?Q?xDzbEcGoqt4OPS7czv4TGDWp2pUam7nP0Yq7BhqGTjqpOGuP7Uh9LN8YzVOI?=
 =?us-ascii?Q?YH414TzHrPx2AbtWPaWBbtuFRDxci3qt?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:17:01.4654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae6441c-4a75-4ae0-e22b-08dce0809f87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5cc
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

