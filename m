Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4FB126AD
	for <lists+nouveau@lfdr.de>; Sat, 26 Jul 2025 00:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94E410E235;
	Fri, 25 Jul 2025 22:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="doKryiNm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329E10E235
 for <nouveau@lists.freedesktop.org>; Fri, 25 Jul 2025 22:14:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqpPnkccQNYOQOr1ldo8eTO5bqXXdByGccQSpTj7q86v+D6yBhCqnl9U65eIfZmgkh7urC/c5GKFwvm56Pf1IPfNcf0LKW153sk8utbfTRaaEyzuEStETm72rigK3RZtlzfvPL7pmJCso9+kFAPMDFEjBn1+UrV9ih2sglA/gmuQD6QZPx2TK7Tb7UNFMiNLL5Jn+bUMjmhbb1GvE2Hd3S1jVlualCZyIpWe4J44jd+8nsIU8O4Hlvw15o9ry0nZoq3GUYtt40/h0SfLT3q4w4SbMRN9KG1U5C4pcXHJ8DlLrWluclg9U0bgxFneXziaYLPqh9EtfORcyh2Ouu2roA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0zygEvlfYhmK5zLSaqFPSWLq+jA4LBJXEeMT5XXFm0=;
 b=EnAMiZKX/dKb3RKr1gXF9Z7wcOh7GmGAlVQpwriUWSPM0yXjtbc3UN0fpn32EHWlv5cnLLAUDQslIdPuB3DYaEXn0iy3VfCjjuiNzpNiaFTgxO7pIFuvKpWbfa4jMl74dDl8eYJCncF10JnpgQcLkEdpXbVHUYO6LGTidKGpJVA7/kp15ipYAPNG//lXttCsEsE+fdkGFBA4dW3Zevt1nXU1cWgfItGj24xKioviarlvCjUhjYyBImw/qnJAwQcPU4TETFIQ+4aWOepbHh0iET9k3ATog9VE2qE61COjPZCPTDgkWRQiMwTKR2667AUvnHKdgtL2hmwlcCFrs3EAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0zygEvlfYhmK5zLSaqFPSWLq+jA4LBJXEeMT5XXFm0=;
 b=doKryiNmdpfCAPMDnCJ17Ge7CNTA5N+yivr1X+6B/lXK6zDog5IWwnCGFLYtqedZ0k4O1C+7siIkGLoVdldCeCzIST2eDvmAtOBRmPiOz83Kx1ubXtU6dn7pfNn0FGYdnIYk5aU+aqI6sjc4i8hE53rsbDZcN1O/0WdtKhq5RkPr5g4wyEjQJAmdhv0Zybj4k4kFhZKUe4fOln9w9Xp1SB8Qjid+neQrBqTblDhETCcmdLMrgTM+CRogR4tMEcQZ3ja+0eZE00NtlHhHoElE81ZGXNGyFVqsEEi8JpBwABRdaotcqChfwQzrMLMHIRw1OZa+0wAx36Z53ngl7arMVA==
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 22:14:46 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::7b) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 22:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 22:14:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 15:14:25 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 15:14:24 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
Date: Fri, 25 Jul 2025 17:14:16 -0500
Message-ID: <20250725221416.671418-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 2976c44e-d92b-468b-2803-08ddcbc8a9a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NDdwmvnYTRip62FvU+i6rcy8KmPlaCWK7fGsQzJktq1KP8ZVcmuEYxSry3/1?=
 =?us-ascii?Q?Q8Wx0AXkfY557k2VBpz9GjmsnoRHXYpS4TEbBCwWp//usVlZBvN0FmJejNe5?=
 =?us-ascii?Q?s0AilUAnJgLvtH6TubgNIRcJ7LfenBIjWXRf1HaHOF+tdzGyZyidWeCtNndK?=
 =?us-ascii?Q?gkrLrWtwOtQxsUS3YOf4B3qqQjslui2AXT7AFWfWF/j/alPJ7gBLZxwdaDzg?=
 =?us-ascii?Q?WbnK/FwzpmniG3VLSulzu8s79iH8N33K676Ar/pvUtNJD2enrv/YyXC+z7GW?=
 =?us-ascii?Q?C+68/jAq8nzePGwbiKdfGV1lTxqDflBhjMKvrXc2sCINzv3h0jSLQE8oAd5v?=
 =?us-ascii?Q?yvSUmlI9E+TMamnMzgKgEwOgX+GKu8SYYGV7sir6zaTaJdQ2r8CjpO4jOgoe?=
 =?us-ascii?Q?H55r4lwFZz1hqCoH1BEZhGoy3puiONKfflnDqyrGK1QSgrfI7VRWHNuan+wu?=
 =?us-ascii?Q?G2D1y7tYgFTD0xlN2SE7jwUbiUndGeCcqL4cRtutiNRyozmMYmUGhK3l4zrt?=
 =?us-ascii?Q?N0NgGPqrI3tItitXwAmeE8tCY4g6xQ1z4gBSLNvAS2FR2eHopqxTAALdb1Y3?=
 =?us-ascii?Q?HxpVRGHoE7D2SKMik+z7n7T1kfteTss7Y2L3P5tFESjQwnUbNKUZmcQyKL6X?=
 =?us-ascii?Q?0b7llhjROW67JTijvZmD8muhJY/acckQL+BRAuKY6DCx3k32N123p8v6o9hD?=
 =?us-ascii?Q?XBA7dKQ9FRNvMuOgQ4r59kD14qkR2TE0MriDsvzDz2PWR+UiZPdCa7LPwz5F?=
 =?us-ascii?Q?wy8dy+8mFjQtDLvazdwq8KSJVdnnPCnKf6o+LLbpWRW5Dcl5OdbL1cQGjOsh?=
 =?us-ascii?Q?D/j7ZzrcfAy+VOK3NK9ShpAjJPrVKjj47A0dR8eX01bzW31zHodqm/JTo00U?=
 =?us-ascii?Q?Ds/GKXkFmnipupVRufJIfBFd5ZBdho6gjFxh1oeQR9SRHzWPoRJYDaCpfZjc?=
 =?us-ascii?Q?wAoZ43CMQ+hE+QthiFiWO1XiUBzbggqSphq1U/dJPrmRxJdv1BjgkzYDTUI9?=
 =?us-ascii?Q?xVuG0ooTNNxiafG3UzMLqonGqy+c9TN+6l103prGYt37w6KTGWIGpQPjU4/D?=
 =?us-ascii?Q?+bl8aISdlBTJD0z54TYeh07qH8rwx2/jbiSW8ZyvQo7peIE7woyHJgp0c8rq?=
 =?us-ascii?Q?cGjwbqFpw+wfAGKlZwiIkJ05w5AOGwCd0Qh3wu7CKr76Y9+KsyRT4C0kkOl2?=
 =?us-ascii?Q?gEQgqOJBSJzo3QMvzvt1JQ0FJB2ehzhn7UhwLlY0KE+T3xO+G/BaxnN8OC7f?=
 =?us-ascii?Q?7u2uSTvxKr2UEmsjS6oJAaIs8XxMgtmZUPqyW9moEUwGAi5fWWt2OScjlChI?=
 =?us-ascii?Q?tqtRT2/yMQMcWVZRlQzKuTqIxQrxqjCtGE7h4sZ3czTuWcGSre6IcrZoD8mu?=
 =?us-ascii?Q?nlbWLiiJ1T7/udymSBtTUnFFsdfkBy1yV7iFUC+f8xeSqPkSAKFxBlYjJkT9?=
 =?us-ascii?Q?tiw5eHb+z3Aua+uPa7IwDkQdkt/BTyFxjrdSlA+OxuphMD+ADZyeGTwnsZtM?=
 =?us-ascii?Q?Bw6BO+qWgn//+fhkkn9TkCuNTS5xFH1jhOgW?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 22:14:45.5709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2976c44e-d92b-468b-2803-08ddcbc8a9a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
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

The 'tag' parameter is passed by value and is not actually used after
being incremented, so remove the increment.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index f0acfaa153d1..7c43397c19e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -103,7 +103,7 @@ gm200_flcn_pio_imem_wr_init(struct nvkm_falcon *falcon, u8 port, bool sec, u32 i
 static void
 gm200_flcn_pio_imem_wr(struct nvkm_falcon *falcon, u8 port, const u8 *img, int len, u16 tag)
 {
-	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag++);
+	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag);
 	while (len >= 4) {
 		nvkm_falcon_wr32(falcon, 0x184 + (port * 0x10), *(u32 *)img);
 		img += 4;

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0

