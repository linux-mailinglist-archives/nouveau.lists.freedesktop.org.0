Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C7B1A9A3
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 21:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B1710E37D;
	Mon,  4 Aug 2025 19:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c5z0WpgG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8F10E220
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 19:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTmLnwFVSORntxjCLuocqDhXgcjx5rORP67tXmCQSmRVTWvHOv7BZU+ZAHIvnyQofmDuyN6UmtqMwJT9AsPhDwERBlPXD98GtoBaUd9hoHViXCAjsPBRqC+G62ebqQ8vAzEn5VTIVAmaP7Il1aZYF8TjPioD4PLq9WCFgJSNCxdGQSlplEYKxY2jnSvxBt7ECxsO6zVzXdS5gOZDQSomrNmOt1rgFfp85JtO/0zs9cbO6yhqGiFj0p2FiAbVuozAnfZDmXGJsOU+/FCFARuhfGmhJy6P/LQFgP67RJUs4E/XEN6o9W//ltGLZZYMIO577SLSwHBnIz+VkbgaIMgyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mylBzry0bmG0U9FYpQutAFoJPb+dkRh5xP4IKe0ZwRk=;
 b=xGf9BskKW2gayOXLTB2wB3XgUTdEV7yaEWoPfjd5Jhc1f/XjVmxre32ClsRkNXw1HKiCeL9Q18vw/jXGAkiOZZw45/xyUaoeYqNTvkjrZEMUfDgDWS8F71uHmacvIxGYz2ufsSH9UX/lwhStmDj4p9HPXRip/mo2cHWwcdNxSHURqki0gsz3x3ncnOwHvUDLf4lxgSWwrdkVXmVo3hOqaD0MqAJrVGEKq+rqRhBCP+KIy9/wfL79y+ppPG9V4OqZEQ6PVIatpDdZ3QlieQVg7xh3oReoXf+tK9gSlknGE8ngDL4oKw0ILgFLu4iyaGGHLTWHdygQYcU8ASjgn31mEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mylBzry0bmG0U9FYpQutAFoJPb+dkRh5xP4IKe0ZwRk=;
 b=c5z0WpgGyZLb0Jwr2z3tHiem/NYcjBFuUxgEImlW/t9I9CeE5tVWXAXwsttr0rq9cox8qenCAbmsq4WG1P51HbgRn9iNyavuYW29cl4Le7AStEdWN+MOo//IqnlA92txTJl1AYvJduewDuz4SNlF/PvxHXvKGgFH+plHk5Rly3w6ZU3LchzH2AzGrLXqXm7fRGmxVU4YNpSWBA51OMxITtxPqNShQlDYA6Y8c8a/BGZR9nnbjlbnH1F4urq6ZqTiVb4hNYrTOzwCqlyKlkbzmDGlABJcNpd+nFp4CAF7qb6p0K5nimFgLrvq5w/nYdYg8vZJHHqllqXeWDGXG+N0SA==
Received: from SJ0PR13CA0143.namprd13.prod.outlook.com (2603:10b6:a03:2c6::28)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 19:26:31 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::59) by SJ0PR13CA0143.outlook.office365.com
 (2603:10b6:a03:2c6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.12 via Frontend Transport; Mon,
 4 Aug 2025 19:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 19:26:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:10 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 4 Aug
 2025 12:26:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH 0/3] Various minor fixes to Nouveau
Date: Mon, 4 Aug 2025 14:25:57 -0500
Message-ID: <20250804192601.10861-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 617732fd-998a-4082-fe14-08ddd38cd09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7kEBFOhbSCsVpFQtBco8EeEUzoPInMPmCWAv02YEVb2hgf/Mvg+qBDo+eMtR?=
 =?us-ascii?Q?9CxZ+yI20LsyqdWoifBntJcnlVVFcYJox6oZbRMXZ5oNeUuu3ENmXN5XCTGX?=
 =?us-ascii?Q?bkdP1aXUtU8/cYnFyTsSbgnaSqPurkcb+MvuiGyNbAdndQ/+tnn9qydklBgz?=
 =?us-ascii?Q?5MX8SqhV70W4BPEZKUdxNdqxl9+ZNHISy+rdcvWE7eOx08mImZawEYqKAG/8?=
 =?us-ascii?Q?aR0LF0934sI3KvisZjAtb0mDLpeq2hEjBQsOHnBUxgEhpCIy/Ydt0urGw+xH?=
 =?us-ascii?Q?H14VUmomyWVSgM3HiCnRfJIyCJOSM9omH8zq7EGCr4SRK7YNHismY+9rnSyO?=
 =?us-ascii?Q?YS95rUe1Cr2YTAOPhCtkfeJgFjPJeZKRDy+rjRXYo2+Qr3zcN6FMeiuj7SeC?=
 =?us-ascii?Q?GEIIF5NSZcqrwDXIQ9b+7HYIQP7zP3DyswbX3ZoFBN+xdDRXH3IailNxttLh?=
 =?us-ascii?Q?Q1KUuWmKgi/mmk2Cct1Rb/uphd4dxaSbCcFIrQBsyfTCvMRjgoXL94IrHFNX?=
 =?us-ascii?Q?890LMFMWvSqWOXgbJ9pN9Dg98dp2fjPB7Dmm0VdBPMY069e6b9Q9IFhAQrCG?=
 =?us-ascii?Q?LOJCsuNkUBSTDeu4psvXaAwCic2ZwYTy5ZMkcn/4asP7qsavFgvBOp9JyuUL?=
 =?us-ascii?Q?chiwYuFErxKX/RRUiZvG0YVaTJfa4vZM5YUf2zGVxFLuHOueVNrQC5GmsfcJ?=
 =?us-ascii?Q?EeM7G9oGiwSwwqYRYQLk/9YDDGqXfgAAluPR4zATBw+dM4REVCDlmsnepfet?=
 =?us-ascii?Q?EqdvXfWiWazMGsY+M1NAeAFn3ZlslhsXYjBuhwWLXpxj4L7+4fM9KrDdwkAs?=
 =?us-ascii?Q?PAF4JqxRcqofgomQjDhzCgX5vGRhyb2/S+msvpttWt4g0QwjMBe4/Pfu8tvH?=
 =?us-ascii?Q?aSq0aa5gW6nARcnZRo3WOW0I0c1Rp7S6i4mgiGqju2ixmsuSyWK8LBmL82ha?=
 =?us-ascii?Q?Gr9O4GGKqoDLFK01WfkHpLMAKAIpNISPa+8ykIqGm+oZ6FCRDhcNKk06rv/7?=
 =?us-ascii?Q?/GFOKMzAyhB43r/zVWWuLpjepaIWyfTLV1hJN4safZSUkiG1jQztIC5yZcjR?=
 =?us-ascii?Q?ma4ZX3Ez4jVrgE/g1LAP0v/TMnbO18KBwXLwXtLvAqn8v0et8F9Auyh6GJpS?=
 =?us-ascii?Q?FL9qbO6vx9xUXBVn4uqAfnrAQnoJ1VoX9pFwScF/BsW9QysfviAYzv8l2w4V?=
 =?us-ascii?Q?ogb8vpHUvDaJ1AUyRizGHAlxA2ZO7bauwtyFkJ9zQTdaK5FbKYfWFdaHiXNu?=
 =?us-ascii?Q?JFzDE2YWhMMCxGaxTDLkXOUicpmG0VJoWxlkDvv2ggX6+u3wPPND1ygD3AbT?=
 =?us-ascii?Q?EdGTrjA/qySmmbZgHErzqRbXWiyMDAXUkJSML/LwqpIWXC0KpImpQN+vJBxF?=
 =?us-ascii?Q?6L+GxiICAe8xQLGH/QC9pBQApNACNf64/rOgC8UPLH0oCmVAiiPW8viFoSjF?=
 =?us-ascii?Q?RRAK45fjKuvqMXRZZnIWdQDLHkSfovxDmlG/nWI6jp0/rn/2FNbz+enWY2be?=
 =?us-ascii?Q?QqWFrrmO5qs+q7awVYb3C7kbvBebuRLfHev5?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:26:30.3253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617732fd-998a-4082-fe14-08ddd38cd09e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349
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

Three minor fixes to Nouveau, discovered while working on Nova.

Timur Tabi (3):
  drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
  drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
  drm/nouveau: remove unused memory target test

 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c     | 15 ++++-----------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c |  5 +++--
 2 files changed, 7 insertions(+), 13 deletions(-)


base-commit: 6531a2cf07ef156956840853692755cc7e1621b7
-- 
2.43.0

