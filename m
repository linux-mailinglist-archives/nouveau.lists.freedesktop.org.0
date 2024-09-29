Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75359897E7
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53610E36B;
	Sun, 29 Sep 2024 21:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s10AZshE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C00F10E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 11:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLDvH8DobpgQjDLyG7ggP2bE4ID9KVLklgz8NuVcg4LkLpxxz9KiosksA8AS6dHJ3C3qpILQU7EO4trVMMlBopDIZut/PNsAeO9phtWhHMbrJAG+cJhY6QoM3f0IvCZTJ8jUWfoZUx1zhERyjqK4jYWCC3WYRRiOq9tVDaUWXY7IzzBzBfDQEAtAz4tZqDv70c7J5bMty15ylXm/HHWIM9LBQGjycNCj7hFnqT2fsg7mkBlF+u974GBZx3ko+T3svjPdXTDiSjlWCH0Rqa+PljIwWvu1roed4bM4gB3hyDHhSSM2KusHebUWhZwWO5nHGUH7F1SBg6bC7acQLe/rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=WOYml1wKIgKtOlLqontSEsy1CzHw0pVEZ1H7WLWOZIu0uVPEAhSSTCmWfiH+63KIjBMejBeRQNJsY6J2wQOraHzjAdO/1THORQcOhko4QbPQnu/qcPXm4THD0jsVfze/awRGG7mA4tFDGEfkT2SObcaJ8XW6EWWBLMO44CnVfOgQsidfS1z+JFu2rJuf/h9l+0P++acfy2k84n4H4UDQmIkNw+FY2d+c5nkkGLQiJavaqLIRr/uk40iRnNLjM3WDVY2BIHBjS8NxB4LRGmTYdl6sNPi0+Yx9d30KVZh/t/CxMVn13mqTcLYJqPvmmCf/BEQHMpUkLjOf3N4k8ecbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgM/B74BXkHJ8t9utgm1llijCsC+NQe128KyLYZmAuw=;
 b=s10AZshEfzl2Biglk/ao4GQu/TFV+9WH5L15U3e2qibQKl0IGxCJ8ilRLerfb3zPDlCcqoUCSahqa/ze4lK4IJOyJJLixzruFjk0hsmeLDlmEqDeL6dTaCK0ps0T3TmafBU/Abc7Skq0f4Z2mh/R6Dtg0+b5uD0Eg9LEChDz21ANDE4mYw/hjq2V2WzYAiluehnDk0fsooRbEIn5yI+xMv/n5THsH7c2CdRSEN3DsrV8SnvZI6EuLk4kvH40Etz4B7II+LnYnxugopxqx/FkNdSygHzp/gtX/Q9RPaWNI54HPSoj6eMWL1jLuby907C5OX8GwDIoGdpyPFQusRVK8w==
Received: from PH7PR17CA0055.namprd17.prod.outlook.com (2603:10b6:510:325::16)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 11:44:38 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::79) by PH7PR17CA0055.outlook.office365.com
 (2603:10b6:510:325::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25 via Frontend
 Transport; Sun, 29 Sep 2024 11:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 11:44:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:20 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 04:44:19 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH 0/2] *** BUG Fix for Nouveau Memory***
Date: Sun, 29 Sep 2024 14:44:14 +0300
Message-ID: <20240929114416.420203-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e896fa-9195-43c8-8982-08dce07c1919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9yo3iy04Lw6vlS1JEfB6HfNdFZ8rbNu2gtuKC4mtoyvMwepqmMZD8ezKA1fs?=
 =?us-ascii?Q?HVT2el3C3sufHAS0pnAJA17lUZoy9CCdUlEYX+JkiDrLm/bztg5CAyxpEMPM?=
 =?us-ascii?Q?Atyde+4PLsa4NVVJtEduf46uLCiCC5tK54nxSzavQIApBrKEt6LZEAH5MxXX?=
 =?us-ascii?Q?/TjZ/sHMppTldhMRA6YHPf0LiclMT0vWytp+iA+S3dQwxvwyoj/CHN02wdtY?=
 =?us-ascii?Q?A+cWfNhzENFb4+Z7iP0QZwKrcs6iRVzRX0/RzV4sFXEnepu95EDdQsKecNZg?=
 =?us-ascii?Q?mdK0QQUOdK8tjtbLi7JhbOroYNPySALf48t1S8JmzuFZ9bFwz+a1pH64G4Ky?=
 =?us-ascii?Q?byirqicmCX+RBhgDtjDkWaoBcrewCwd7XgLb8rCj9bEx9n00C1gWqM1mSfPZ?=
 =?us-ascii?Q?buKDtr22+txUZODCgGi6QYnIvkHq2uCnJeayWAc7ox4xbu45NyjQXXkeU3QH?=
 =?us-ascii?Q?EwczBYKHDHOQF705zAhlfQrITO9M6p8voJmXiIatmUmE8Y9pIcdqPlDPmUr8?=
 =?us-ascii?Q?pJvDUeAvGj8m+p4AnKAL3Lw8/vo7L4+W09DxsfdotbKrpgZj/1/d1HRxBmb4?=
 =?us-ascii?Q?IdxZsHxYzQXwYst6ftx7VrTUfygLon5BHp5ePrwPJCv3FC0QRv2KlM0/0Odu?=
 =?us-ascii?Q?eCK+jO5rKuA8pM+pOBSaH5mecwH+Bhvo9H2AI4nwyRUAJ2vXvXRWKzwlo+Is?=
 =?us-ascii?Q?ljFaEr9t8q9Y7Zlb7shO7pcsYzxafnlxc6tyF+BQh28PPZKl1zZBQYE0GYWM?=
 =?us-ascii?Q?7MzwNTlEjECPxVRHOsjghwtgiW65NatySGoUZ9VEL7EhIeqXw7fdFb2JJIae?=
 =?us-ascii?Q?A25iWqrRqyg6ALrglYhPjS8Eedl+sFoOw+wjtJgLX4Xn0Y3+FnMguE4KnyGu?=
 =?us-ascii?Q?kVhG/nFdcWQdSucRm0tV59A4hUMJLOtz1w7zChBhcDp7/4DTHBG2VSU+XSPw?=
 =?us-ascii?Q?NcSZ+lEG9mf8RaX+DZI/k6ojCuz9RfCpJqU3rjNcYABBYH0fFPgjGdvY2x9Z?=
 =?us-ascii?Q?8J8ggbpYIDFLXgWy74oPo+j8H/GcxKmc4Fb+BRPKmtbHY/Yj77ypfP5/5Ep9?=
 =?us-ascii?Q?/vi5598xXg/WXCsvJWuCRGr9e26tV+8R/v4nA8bFELdVYvgRGYeKPQ+5ExnY?=
 =?us-ascii?Q?fLQbk4xjovgIPo1G1YtKd+/zrqNE8GfWodhGkkbMQvebMr7bAXp9HlxnXBqx?=
 =?us-ascii?Q?kbI8iAt8OsKARTSkJ6F3RYLU3BJiyEgbwPpUCFmxWPHf7C3U70JSXJ/QRcut?=
 =?us-ascii?Q?gLeNixN6A1PFOMgI4dQViqyqvzl9UVWpXpIdFv/L7VGp92FDXKfyzHfa2Un/?=
 =?us-ascii?Q?dC0n1/uPBJGO9Www5pOZIOqHVTba4CK0p/RP00nw1GCIaiSiOHWvvM5WSzoY?=
 =?us-ascii?Q?RETr9UmmFupvmUn4jOEGx9HsUApN?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 11:44:38.0500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e896fa-9195-43c8-8982-08dce07c1919
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337
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

This patch series addresses two critical issues in the Nouveau driver related to device channels, error handling and memory leaking.

- Memory Leak in migrate_to_ram - the migrate_to_ram function was identified as leaking memory when a copy push command fails. This results in the function returning a dirty HIGH_USER page, which can expose sensitive information and pose a security risk. To mitigate this vulnerability, the patch ensures that a zero page is allocated for the destination page, thereby preventing memory leaks and enhancing the security of the driver in case of failure.

- Privileged Error in Copy Engine Channel - an error was observed when the nouveau_dmem_copy_one function is executed, leading to a Host Copy Engine Privileged error on channel 1. The patch addresses this by adjusting the Copy Engine channel configuration to permit privileged push commands, thus resolving the error.

Yonatan Maman (2):
  nouveau/dmem: Fix privileged error in copy engine channel
  nouveau/dmem: Fix memory leak in `migrate_to_ram` upon copy error

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

