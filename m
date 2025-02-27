Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028CA4713F
	for <lists+nouveau@lfdr.de>; Thu, 27 Feb 2025 02:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515E010EA05;
	Thu, 27 Feb 2025 01:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RZdL1+ZZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9CB10EA03
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 01:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZTpZhI8BNtOhQdFxb760IFjv3dP2B8ax2G2O+Uw7A4pkorY+geEuMv2iNIkXATpbfgGxMkS3Q5MWblzPxinUphdzUJMF8S7Ehyxvs25Gqx7ObwGHT9OKp2/gOvAedCkADaSUmM7EujX8eXaVNxJoC62iaq6VkAT8a7nrLT0vsxVn+6lV67D5vBcFHtKDoGEtzhtUniFCErrQUAaQoRZShmIx5xq6V8d2GbMPk1TDWJSjz4WiOlvZ1KO+DASxTBeasBmZsVKHzDpwM/MlcQxs6QCfKQ82L/uPMceLQoRLWveFHklCZBAlzk2nuRhOLQ5oGtRkCRUaKZvPu5bzuhTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtpfdd9/jfcXiDYohwm9UojLB5Uae7QbikybXp6ElpU=;
 b=b9E6mES7qttDk+RLG6v5WMEGuXMxdcqW58QCsBeof4mNK4VjhPunH5zMHYVyxmo6k4itN0IeQm/6fPUjgupEGxzFP4mEwf8Jxu/CkFKGeiEwxMg9bGVnte0vC/axW7Kt0CVymiLELDRNT8hPGuaV/U7GXLOiipmYfBW/6+5oVX3ePb8SrphuE56V5OuBSO+zmpSv+8RKjYOQt/R1Cq1d8Le2arXtsLtcQbeWLyIFU65pDPJimkih6Ow3f/NBsCVRcY+m5J1y4ACM7+WWvMjHPbnwKRCm47lBz1m80nmhJ06ofmgFenjDCHEUM26DpCCtevX6399s1r8lw9IO5vrg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtpfdd9/jfcXiDYohwm9UojLB5Uae7QbikybXp6ElpU=;
 b=RZdL1+ZZ/avli6vIPYAWcEX046I/6iZmjTQv0szOdUoyq5T4PpTuvA8kAAHHpQQQq6EpA0xsBu8eW2dyMkr6uLBPMNz0CJPYdStBtJkqBVCjsrw5axC7JDQErAZZWPp8bOJl9oEwj4VzyokPMBEni/xpv+kdHyJQ+5V5TtDdqGtgXARiRnKunH09i7Hc62vv+D2ghtDpYQObIPb9q7xgbGXepnPBketp/d3xqMRBhO1PcSCCT29VDLDEK3frJQ1pkzKRLnxyfQSIy+9uIgk8kKdmKSPwNfwDrOisNNTCVPGRyTcn2xa7lQ7uL+nE2rJ9dihze6iJlhof62OeUjLDMw==
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 01:36:10 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:57:cafe::d8) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 01:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.0 via Frontend Transport; Thu, 27 Feb 2025 01:36:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Feb
 2025 17:35:56 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 26 Feb
 2025 17:35:56 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 26 Feb 2025 17:35:55 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [PATCH v3 0/2] NVKM GSP RPC message handling policy
Date: Thu, 27 Feb 2025 01:35:52 +0000
Message-ID: <20250227013554.8269-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 168bec01-99d0-4643-3826-08dd56cf1c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7mm+RiyN0NuvCUjlzS2OGA/ERZGc3ILMZpygrCOO+5UYpIJ5ty77EDqRs8Rh?=
 =?us-ascii?Q?lk2eW5VQpVpF9gspqAIhxc6QeFdr7P0cCRBgWzUcjKUfUSu9Y3XF3esrY+re?=
 =?us-ascii?Q?X1kJX/wDSa69oTzr13nf05MssYLtX0E9nJSfWXWvX1Ft4QsPqAzJ/EWYal3D?=
 =?us-ascii?Q?WIdMd3Y4+ebZnA94KRFmgAaG3lRdgrj0+DvWCJwXZGyf4rvjQ4Iv65sDWfnK?=
 =?us-ascii?Q?tPHL522JBrT7SEIdvkb73GkDAZcM6LOztsLMySXB2l/En1opoP3n7ePPvU07?=
 =?us-ascii?Q?wJLh6aER3CMF5FtXahNTpNIfocUfb3JffdnF8dvhhQBsx1cZZqPZ4sMJd6ci?=
 =?us-ascii?Q?fgkP5hEyhKPIIAViq9iIY0lp8xNieZ/NijGfc777i1Gjys/bXIPY73ksmBfw?=
 =?us-ascii?Q?dxch6zpsmIrECAZ9xBjbUvjlNsQykDVJ24rjybka3Tgt9Rj6LKq2Pv1GlF3W?=
 =?us-ascii?Q?vHPICeHHeZgBAErF13yurFvI27YCpuDovmZO5eBAFxIJ9MDxZYh9jVmqOCqN?=
 =?us-ascii?Q?L9z7RQo7BTGs5zaQvFJHOA1cByNdxGBaEj7GpK7/BMQ8OJ5AUGqhlbRF1AGm?=
 =?us-ascii?Q?0iATj1mam6kKSrD5nv7UnWMApwXaSoOHyEtUw/qwQghFRVVh2Xi1b02dgf0o?=
 =?us-ascii?Q?JwpfMqsb12Gd7COnm4hyyoCU1ngSUMJCT5yAaQrHne580XzhjDmMDOMH8+yV?=
 =?us-ascii?Q?eiVm98kkhrZfqwsX/R/HXQvrsNdZmRfBw9sv39/QYg2I4Nw+JGW92WXOUMWe?=
 =?us-ascii?Q?wDvVh+nC7QnIQY+Fc48TBAaM/s4fNFgVAGF8249TAYVuRSmsSmo2Xba6DHXB?=
 =?us-ascii?Q?xe2U/DT4iNM1BF172wgvavX2fQdip4lsfGG0Rq8QirQmvCv3bpVhWCrULh36?=
 =?us-ascii?Q?DpPXAopnpqCUJ5j5v6grmzltp9Jixyp4xIYc1BrmKI8PxD7olcJVQC+3d8sj?=
 =?us-ascii?Q?yL5C1zJPNTI6JspeiDesTZs3K28av15S5GZYZNQ2/hDr5gwGQHvNAAz7ctUa?=
 =?us-ascii?Q?XE3ppsf627Sv6fYPJVyw+8J82eunVTn/ABi1ne6UK9HhTFIt+5888cWX9gq6?=
 =?us-ascii?Q?d5NNoWNZMi19m0LeG+CkJ9KCv3vujpn4+byjIisyxT1ayhS7+H7gj6gKdLU0?=
 =?us-ascii?Q?EBH2I/9SVHE/O4B/E48A2vxA3VEi7QQgIuamJSgyzFQoz+AtwTGMgMoCsKIy?=
 =?us-ascii?Q?rqjCY1HBWSDgKFtTT0VUVU8cfHKv+cAJmts9kCqu89hKeovzLYkGWBq49uVu?=
 =?us-ascii?Q?fYkzQ9fVv9TwZY5uR8r6cc3jffynL4oRBMEHigOdFPpzpnM3ZGr51UvUsGqz?=
 =?us-ascii?Q?+VPMFshPhbaQN9SUiBlUHCAsoLF0Pik5PjrD2vkiu5EhJrDfl8WL4exGp6t3?=
 =?us-ascii?Q?6e2IIccU+yz4b6Jspb8KcxIeoQ5qgw+RL2Gd3Q3EzFC4ruvldb6YjgrKvK/+?=
 =?us-ascii?Q?hDBwUcjG/iq6kmDlipHzEuPympOEuvbElAMwQNYwnCJ1Y6g07KBQzXGIEB7n?=
 =?us-ascii?Q?32vJTJYOduXUN34=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 01:36:09.2061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168bec01-99d0-4643-3826-08dd56cf1c8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
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

Hi folks:

Here are the v3 version of NVKM GSP RPC message handling policy which
solves the issue reported by Ben. More details can be found in v1 [1].

v3:

- Fix a hidden use-after-free caught by KFENCE in PATCH 1,
  r535_gsp_rpc_send(). (Ben)

Zhi Wang (2):
  drm/nouveau/nvkm: factor out current GSP RPC command policies
  drm/nouveau/nvkm: introduce new GSP reply policy
    NVKM_GSP_RPC_REPLY_POLL

 Documentation/gpu/nouveau.rst                 |  3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 38 +++++++--
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 78 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 5 files changed, 79 insertions(+), 44 deletions(-)

-- 
2.43.5

