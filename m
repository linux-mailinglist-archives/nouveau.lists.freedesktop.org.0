Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FBD388E9
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF6A10E26F;
	Fri, 16 Jan 2026 21:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nyzQRbZC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C423B40744;
	Fri, 16 Jan 2026 21:42:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599723;
 b=E/JWsFwWnAJRDujRQnsXAYclN1XPVJoy15TySguWVDkWGpJOiNVG6niHtJx+57fC4QDIt
 q9QGOXjZc9XQsFmurDTtM+WYf2TIGQ/0bEYO8XQ7UlnUhM+kXLJ/xdoqBqDtez+FsiQ1bTy
 n8Kk3JBHGVpzhm77MjZGOpdhStW4EErFhlmJtDOpQQVMVYVEQMwsB2PP6GFL5m2SDZgWwcY
 XIA9DiPEvNjhNDE4ll9nedVmvraU1VE5g/y1SlGgwkdxt15SRWm7bsZkE9Efe8fQ4uWjlZK
 MX7Hch3n3aXjLqRsSjJDncsbENj8tuELqjF50Q6t9Tfc7tw7tY9gqGqtjLaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599723; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GVB5iEfWKmRquVb1UE83Ztm8jKsxT8f+IujQoRqh4BI=;
 b=N2f/lncVGMGURrSdPWNlPRHbYa3A0rw+vQWo7ntfHKgfAOwIXlzXegJ5A+I2EvjY4qLUn
 I1lg246EbeGgZBPTxRcUaD8bbxkJep6gx4mLQ9IfJBog10x0637FNPmkg1NjqxQVxXpVAvg
 gX8T2F6UCupRoP1+X2dnNoqOEft61GOjs+ltbm2FYyIR1xG9oj2u2At/HH0HtYxD8h++uea
 sT61KqA+VTk0IO/7q/dy1Rhlt3ySd03pqg1PQ0WvmA2INCFiTxDTO/7FOGIBUOHhDIfU7Og
 F4uWfgiEj90KNNZGM/HG7vUca4hStWKyxg35vgVwptpk2wx4TRTCFtkuSUQA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BD06E40744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:00 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9B10E267
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMtS2EwFW0pY5uhPN/G3s6ssjVLw8tm7YBN6jOcvIEEIKCwGVBUKO0zy75aEFc2WwshJoY9TbCYr0v1Ea5gExeD+efU12M30F/Dm2s1fcd2uiZUcJa610Zlmf9KuSfUzsP8aydR6ILv3qrzr9KNvBqp7GYZOOIJwqB8VHwST5FeW6EpO3+YC4Uoc+ScQH/GoZx8ZecRqfElfgJ0a0/wsgWqyHQEaCKEJ/OPjWNaRsjmUPZPn2/Ag80BPR/GabwbxWT217Vvo4BTdsvxJy4bIAoTowvXpli0E9DXBxqELrpmu24DYgMZXeh5E+QEDAMNy6UAI7zELTVvXYMODm1I7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVB5iEfWKmRquVb1UE83Ztm8jKsxT8f+IujQoRqh4BI=;
 b=vU02uzRXRTJZ4/u45lN1kI9vIWn8M/XilvcSNhiwxi8rOJQkPg1CUawiUnOERcfib3RUWh755t85il9sOSNHhNguTgf3x9XGQ5NuZPk3hJr3u3HkekfV+wNDSFD2SptC7uTRavzfOLeO7UA7GY+g1DJO+uPfq93aBrY1ps+dwtRZOltZMfYZigt9jBzlJdbV9pA+b7uwJe77BVtXxVCFjH22s1G0Yxjzr6d8slXzJIPn8UJkenqXxACzHuPRSsAbkLhYBy1sTctrCGO3pvK1ADPx4F+zKz7DJvBIP8Um3OCmRUttpt6zTnWHVp4M4Y6epzFqYtnDdK3hdVx/UQUM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVB5iEfWKmRquVb1UE83Ztm8jKsxT8f+IujQoRqh4BI=;
 b=nyzQRbZCcf5pT8PnSNK4ShQNxEWq8s2Kt++JYnW8nJgkF03pvQyYQJO4pDnc2eh1WKBbMZJRMEE/WZNpQbzw8NEfNO2A7d/md7DYjqb8u/xSvV0hmJ4jZ0Alg5mdpNJ91OMtoi0Wiz6kL3KbiJEp7teKR4cKQ/GiJ36gV68JFpdvgYUjBtmoldAuNe9temxBiTfirw+VeASi4f7zq09QsIXOED1YL6P2qTq3kbwpig/D6RQ8Df9sd3VaGHHRbNyYr/vO74ig5swL0tFBqc3D9FedvETY6s8HcF8S+OhupeG+U+JV7UjsXyP7uNZ0pp0vtZQmaaZ+Ml4pvglT06/a7Q==
Received: from PH8P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::20)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 21:50:33 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::8f) by PH8P222CA0014.outlook.office365.com
 (2603:10b6:510:2d7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 21:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:13 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 0/8] gpu: nova-core: expose the logging buffers via debugfs
Date: Fri, 16 Jan 2026 15:49:51 -0600
Message-ID: <20260116214959.641032-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: b1241cb9-1c8a-4101-598b-08de55494600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lxixrq8Gm0wSJHsvrQbhwzf2nEjd/7Sx2GZtwJ0R3gLAm3i/Eg4+hPejMEF9?=
 =?us-ascii?Q?KkExRyssK8p2zI1xoNSx2L3S714mplxexkTZYTXDqVKA+hUfO+9TMU9ee+i4?=
 =?us-ascii?Q?H/DsxA71y7ja80yG7qrw1UA0SZUaqnVpFiWlWAT+4MvVQFJ/cGtwRpoX6EGW?=
 =?us-ascii?Q?d4nkwT/0iU5YJP+1bCPzsuU2cxYwan1zn93rSU8KIh9B78EaWowHN+u+zo89?=
 =?us-ascii?Q?6Ly4l4yzi0geQHjpx2NYiQEUtwxnnqVUevlnv9I12Z1Fu7MfxU1Dzb/5axAu?=
 =?us-ascii?Q?7C1d8EYms38SrzxOHAvUKyPRiIsRjbuQvlVpFz7GB53mb/GW+LT9Chtq5J9+?=
 =?us-ascii?Q?T/dR659+U35itoAbYcUPBle5tMTUplLO5uLYDxfaim/VrPokJ4XJxoejOCW2?=
 =?us-ascii?Q?PB1+WUirce4LtYx9Hx7xL2K3Bmy42V/OWgA7L7BtWE4tcMY2UIUQsqCPR4Sg?=
 =?us-ascii?Q?W3OwknLx4D4xb8abTp/a1UFZI/npY8WhgeFTEztCZy40AOLjxl/cn7TeBCZ0?=
 =?us-ascii?Q?5zS81xDCil7iIS65QM0Zaf1oiGEmIpVt/Pewp7DnxmvjNeU2TmaDujZEmTjR?=
 =?us-ascii?Q?Ku6j1DOiyyLC8aP5XgyYdQdahUk8QNue9eAHSjt1lhnkt9i4Fre6DUxGFT4y?=
 =?us-ascii?Q?ymAxb4++IZ1irj8vP0DqhmJXTzLqQt2lvFYm0UG1P/fFCtu5FkIbeL+E9+L9?=
 =?us-ascii?Q?T96WYr6NfHIvd0CnOwZ0ki2bPyShicfKwqCHRSTktUBTf43aJKl7v9Z8Sktn?=
 =?us-ascii?Q?pvwoHLlcV3X5Iu4GpPwXT2RHlmyDdJzzj4S+plFnA4P/gZSxGlDIPZjxazZ/?=
 =?us-ascii?Q?TFI0zCtoQXJGrhZzEwdhdoKlgxj16nTFW2RWUW9iJgOUKG7JORVhZHsbixAV?=
 =?us-ascii?Q?1gxktJEyCe5batTrh85CUmkNkZXuGTFh//BSLHrd1CeW5ZjWhsueo118G8Px?=
 =?us-ascii?Q?/muLEZZWoC7YH/aoGy41gB9kpSwZQ9gPzwjACLCAQGNTZp/OicmKB+QIT5id?=
 =?us-ascii?Q?TsUS5LawRoOeOGVzafSPAavi5mEeX4nkfSkyDW18lD/GWt+mEiF4g94nLbEi?=
 =?us-ascii?Q?XWpnX6i3N8cAaKcoaUn/TzKS+UPTcphuicxlmhurhlCmXB/6uMuyP4TeW4Nl?=
 =?us-ascii?Q?sFjb+bGaQFcpAvW38DbTVfkAZVg2epQGyQgPXvgWj3h7EuOKeQSnl4vhaULF?=
 =?us-ascii?Q?mEtTVSyYa7oDN2jg0dkdwT4B0Fkb7KZIjkGlVs0If1TUvzIg9a7NcrPK4yK7?=
 =?us-ascii?Q?rR6c7AfLt9Rj+BdIKg38z58uekjdrZOAUTUIOPAomMJSu7Vtj9eWIQLS5M5Y?=
 =?us-ascii?Q?mgtCZBMnoB2XSLMd0gqS9kDBWQ+Lc8tZQFlLPTwAf+OWTKyuBwzwJUbePtUH?=
 =?us-ascii?Q?uKPxlqM9hCksJH4A9ElUdHotWYW+7FeUIg8tNYGHYGLjkFN01Njv/cfdIo93?=
 =?us-ascii?Q?DohoRXAxigL1fcT3T9U6qwePqX2rQTBoit9CHZs/ganqCbMYDCyEnmEcqVta?=
 =?us-ascii?Q?dCbrlgzF2W/fnqNIO5qbDWOLE49JqrHRsPCQ0sbMZNm0MEizCnh5l/1pMKDi?=
 =?us-ascii?Q?JJqXqCjVxBDxiKxILy99pMcY19PD6aYduRNiLtfZbXSC+vFLi4TxH6jJHO8B?=
 =?us-ascii?Q?23dVB9aGD4TnWE7uvPTFDs+/pChMtiEHEIaJP/cajXXq7vCBBRuX9dqvJ/6U?=
 =?us-ascii?Q?AhvliA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:32.7167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1241cb9-1c8a-4101-598b-08de55494600
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
Message-ID-Hash: YNB2JA7D3JDH46325YXM773EES5DUGHE
X-Message-ID-Hash: YNB2JA7D3JDH46325YXM773EES5DUGHE
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YNB2JA7D3JDH46325YXM773EES5DUGHE/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v4:
1. Replaced all debugfs_lookup() code with the original global DEBUGFS_ROOT variable.
2. Added a Dir::empty() to support !DEBUGFS
3. Added UserSliceWriter::write_buffer() to avoid creating a slice over the log buffer.
4. Replaced pci::name() with device::name()

Alexandre Courbot (1):
  gpu: nova-core: implement BinaryWriter for LogBuffer

Timur Tabi (7):
  rust: pci: add device name method
  rust: debugfs: add Dir::empty() for conditional debugfs usage
  rust: uaccess: add UserSliceWriter::write_buffer() for raw pointer
    writes
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 85 +++++++++++++++++++++++++++---
 drivers/gpu/nova-core/gsp/boot.rs  | 14 ++---
 drivers/gpu/nova-core/nova_core.rs | 44 ++++++++++++++--
 rust/helpers/device.c              |  5 ++
 rust/kernel/debugfs.rs             | 18 +++++++
 rust/kernel/device.rs              | 16 ++++++
 rust/kernel/uaccess.rs             | 50 ++++++++++++++++++
 7 files changed, 215 insertions(+), 17 deletions(-)


base-commit: 654826aa4a8f25cf825ad9254f37e6cb5092098f
-- 
2.52.0

