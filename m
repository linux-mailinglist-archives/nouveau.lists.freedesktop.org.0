Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5386A1BC11
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF310E135;
	Fri, 24 Jan 2025 18:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HFKLoTck";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177C10E135
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0gVHh+gTvNv0roEzO9dOcktfQnrudfPtR0MVvRkKaCYWrCv5oLaVK++dhCcPrRRy9AwSDwuZEhFmcDNmeWaVJQ8MKqC528r0dovQt7R21UUchO5nw5H/jXwzgEwJYx/PdURkwP+0Qq16yJxQ6EZdrh2SBYTnAIm0R0fW8PmwId3CH9Kqqpn4ABieX6eT2q5RR3XqbHOy4kDg3QDf6FSy6ExfTrV94IAuq1XmD5blGfqry7EX4k7X3XCWs1V6JvpBC96I8YOlRfh0hn1GoeWXNFCbwXn9If6M3uu2lTIidfK0SYXtHBdRO0MyKi3sj13fAzdUFn1JGmp/GUN1w4tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSn4Qna5V1qnaD/25gyWYitR64Mtr8qupMER2xf1/ZY=;
 b=mWPxsuW44WgreIaaFi6iZIJFgjbsmiXJRlK6fIL1Au67vA8XOfjqTTbYhTznXYMKDoXtaaR3TNOL+d49BRfYpAnaCt5RrJydp1LmiI7WKZM0GgRy+unra1PLsE28W+Kx/Hguq3l6sOzAynL4bKaIZ8U5ilkJy3/DxQR6/FH2uhe2f+YDmiA38FrTG4Yff4GXgmIJrXOjtiTfqCBneJqFHF9K7/kzzsnn5tcmLj862nF85pfL5Zftaf8vkTuJjVQp1gR8U5bW+3EDNutnkRd7JQMP1StOFCxD0EN82pBxYl5hyd4iNUvuNz137jiWteexFym4QErY4ZSbCKyMJv4Cjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSn4Qna5V1qnaD/25gyWYitR64Mtr8qupMER2xf1/ZY=;
 b=HFKLoTckMj4cnYAx5q7/HO5GUB6JXbzJ8NSeTGaE+uDsxLGJUB1QB/baBzAXC8Wy/MjYPcwuEA0KLrxtPnTz+V62Ky4xobWcSKdvLxCb/Ysu1Ik2Mggwk3nXlXnOc9GnZZntMG/d4a18f4mp0xTmmNBnj+zMcWRxbtdRgoWJn8euMUIO8VXyKCvnWtZ+nqh6KpxwNmDDPH6RnYdYR3cMSH8HA4NIWMxdddH9Q5uC8dDTZaMJwrWNU0XCfOfJcKV9d+6g1RrgD0jlcL2V5Fo5FMo7cAYlLAkwoTlE3QhmwtSeQgUNrikkMJepT2yMcP53j4JjvGBoKfQ5npmUdPbt9w==
Received: from DS7PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:3b5::10)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 18:30:39 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::f1) by DS7PR03CA0035.outlook.office365.com
 (2603:10b6:5:3b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 18:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:24 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:24 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:24 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
Date: Fri, 24 Jan 2025 10:29:43 -0800
Message-ID: <20250124182958.2040494-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3e6123-e390-4cf1-76b0-08dd3ca53405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R6OPwNk88ksQP6gByCsdQWRAW0sIlIQ8N9klxSL+apZ0UkMFzHSeWaJW+CO0?=
 =?us-ascii?Q?/4FjiZ8Im7DWc7amt0mlSeE3YekmDizknn3V8vkOBRWotgfjcx9nlQ7SblW4?=
 =?us-ascii?Q?herPtzZJK5XYX5KAph5y3LtcVo42xDHlsbX4nK7X8JVYBmSOwXYilsEYkia4?=
 =?us-ascii?Q?eK0qodoPDWbFteFgjnZrWUfcFIyaU6RVh7ZyZSqkci/x85uhbfeCZSdSOEzv?=
 =?us-ascii?Q?6krn3lWwmA7bxcsrCdJEhYYPYvoS7wL4GppQ7yl/Mp3/h5BuHrkEwDM/Y14p?=
 =?us-ascii?Q?3L9sG7AQn5c2Xzfi0/TTcH2WQ4+7TxgOIicbKFInE9VWk2KQDfAn4o5KuSzX?=
 =?us-ascii?Q?9AXpQ/Z43KY61cU7ApFVqwV4ufIuKpaU2s8msKLw0yZ0KNi4xUECQf0JJqTQ?=
 =?us-ascii?Q?SqxAVuHgUhjKTJCXN4xm5DjpJJ0IUgpVANUqSfmsecp012KC0yJG/H3NVeg1?=
 =?us-ascii?Q?PiFN+RiWhjWYW27pXMjON0Gn3YCJa57XtJ6de9Hp667m+8EBHa0XQ/832NFR?=
 =?us-ascii?Q?HsGTeFaDHqA8Ei8ZsX4d1NzfUI1WzIydveGYf4+42W22oqur6vULp8PE33SX?=
 =?us-ascii?Q?3Qx5UdG3wn8C8tmC5cWWKmSLkjhQInSeDxY2PND1GxGsO/ywCuGhr3JH7ma1?=
 =?us-ascii?Q?4cpTUOyLYU4PSwvS37/AqFyBnCfCl460/gikmeNf8i8Uu+eSz2rqkHy5zthq?=
 =?us-ascii?Q?/bzT8zFq8ldfdhWy8QzrwG83ZCkHjkNfXT6YzPHTze7bPJ7bbZ/xfeIy8rCY?=
 =?us-ascii?Q?IvxKEA8cHfBUjEMX0+dtzW+dhcG2fd02lrTmKdXDfyE7TvKjn/86qoqzrcPT?=
 =?us-ascii?Q?vfvmGNydaRmQL4a2dx9tsdLK5m+3Aadu8o8Y7AENQsNDkNc7yHhYQyGJ3h8h?=
 =?us-ascii?Q?x1figPGttDKKgGxU5FhfYStxDE7tMP1Tt6W6RnosgETx1duEjVkbyUAI4Z4k?=
 =?us-ascii?Q?FMbnk3ol/xIL/ijvf8QWdFqaJmtdKfmwVsvbnWU4Gsdf//ZEtvNV3d6Y0YPS?=
 =?us-ascii?Q?I66LF0gQ6Uu88npu72M1zIdqgWziyyOvss9Gl/8h4Jejwt2OxR2v6CfUG0HB?=
 =?us-ascii?Q?bzFtpDhGUXB0e3rUlf94KcE9bbzbBKFotGs+5Wmq3GBb+sYVPubIGqsXKr5n?=
 =?us-ascii?Q?RQpUxr0TZEPH3bSACqhgw6Pji+Xk5icfdaPqiXaA/haZFny+d6jfIAnmIQfJ?=
 =?us-ascii?Q?QpUi9g4wD1d7J/lQXVEjqKqsJgEnqc2gzbaaKqE4cr4WWPjkqvoHthkie8Ua?=
 =?us-ascii?Q?AE+S2vKyXcm8GqXAONfERw+U66qIwVH/IHk/9tOqXg2uQU66nem0IBzFpfn1?=
 =?us-ascii?Q?p+6e/qqobBBlReXfrdRjv1Je8Q4lWCh1/XHpJUOnGElYMEkW3rmkyd6ZfEZG?=
 =?us-ascii?Q?wilg86Mx5lDb0jnbTgDdPnOw43Qgfn9TUVOFItvcmfvTXqt58CkVFSwKMy0R?=
 =?us-ascii?Q?RsPLlwpqtgRXKENASCp/ZcJpW7F6y+gSPCcuSVEtRpTiMYHxXKFCiDnqZXFF?=
 =?us-ascii?Q?lrm7K9jK2oUsYMg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:39.5115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3e6123-e390-4cf1-76b0-08dd3ca53405
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
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

Here is another re-spin of handling the large GSP message return.

Besides the support of the large GSP message, kernel doc and many cleanups
are introduced according to the comments in the previous spin [1].

For testing, I tried the following without any problem:

- run Uniengine Heaven [2] on my RTX 4060 for 8 hours
- the GL CTS runner [3] (commandline: ./cts-runner --type-gl40) from
Khronos
- with the vGPU RFC patches [4], boot up a ubuntu VM with a vGPU on a L40
and run glmark2.

v4:
- Introduce a documentation in Documentation/gpu/nouveau.rst.
- Fix the reference link of NVIDIA SDK headers in the document.
- Replace the "decoders" term with "terminology".
- Explain the adding offset in r535_gsp_msgq_get_entry().
- Replace the magic number 0x1000 with GSP_PAGE_SIZE in the re-factor.
- Introduce a DOC to explain the GSP message receiving flow.

v3:

- Add a kernel doc and chart to introduce the GSP message and denote the
memory layout.
- Add a decoder section in the kernel doc to explain the terms in the code.
- Refine the many confusing variable names to align with the terms in the
kernel doc.
- Introduce the continaution records in the kernel doc.
- Re-factor the complicated function r535_gsp_msgq_wait().
- Other minor cleanups.

v2:

- Remove the Fixes: tags as the vanilla nouveau aren't going to hit these bugs. (Danilo)
- Test the patchset on VK-GL-CTS. (Danilo)
- Remove the ambiguous empty line in PATCH 2. (Danilo)
- Rename the r535_gsp_msgq_wait to gsp_msgq_recv. (Danilo)
- Introduce a data structure to hold the params of gsp_msgq_recv(). (Danilo)
- Document the params and the states they are related to. (Danilo)

[1] https://lore.kernel.org/nouveau/20241031085250.2941482-1-zhiw@nvidia.com/
[2] https://benchmark.unigine.com/heaven
[3] https://github.com/KhronosGroup/VK-GL-CTS
[4] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t


Zhi Wang (15):
  drm/nouveau: add a kernel doc to introduce the GSP RPC
  drm/nouveau: rename "repc" to "gsp_rpc_len" on the GSP message recv
    path
  drm/nouveau: rename "argv" to what it represents on the GSP message
    send path
  drm/nouveau: remove unused param repc in *rm_alloc_push()
  drm/nouveau: rename "argv" to what it represents in *rm_{alloc,
    ctrl}_*()
  drm/nouveau: rename "argc" to what it represents in GSP RPC routines
  drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
  drm/nouveau: remove the magic number in r535_gsp_rpc_push()
  drm/nouveau: refine the variable names in r535_gsp_rpc_push()
  drm/nouveau: refine the variable names in r535_gsp_msg_recv()
  drm/nouveau: rename the variable "cmd" to "msg" in r535_gsp_cmdq_{get,
    push}()
  drm/nouveau: factor out r535_gsp_msgq_peek()
  drm/nouveau: factor out r535_gsp_msgq_recv_one_elem()
  drm/nouveau: support handling the return of large GSP message
  drm/nouveau: consume the return of large GSP message

 Documentation/gpu/drivers.rst                 |   1 +
 Documentation/gpu/nouveau.rst                 |  27 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 526 +++++++++++++-----
 4 files changed, 409 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/gpu/nouveau.rst

-- 
2.34.1

