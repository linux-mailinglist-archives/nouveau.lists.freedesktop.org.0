Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCEE9B76D2
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7410E847;
	Thu, 31 Oct 2024 08:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bIp+yNtP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B1E10E84C
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxvRlCNVzcKuE0Tt4mVHILsSOqyPyxZUE8P9XXX7tbg1WfwyhXGlPKWjuxVqgklhdx9pAl5UyOrIwJwZSwIpYB7WPuLNwq3Y04I7Oj+tpSnylWX0im1JVzsd2x7GpY9oY5z8vQcX6KUXj1OPIaI81oA4CVCPG5GMhOnjC36yRcYyWa+lhxPz6aJNqPDBOhDTJ7mAfaNa/GCBzqBkhJhwRLqSKDFtlkz42Az41VvKiu29XhGNtPsvyXcSOgWN8JXNTTdcP9aUX3Pfp5jb/ZAiB8uJ9csOAwoglW1M/eXui7GupBmfNvWTLtCnip5pYjWucIEBgK/6bcu3ZWSP6V/2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy1Ym2DPk6M9UIKYnZfmmwxIyVZb/0YTcex3cwDy9iM=;
 b=Y5rTTzR+1tP3aKihKBHcYlKSzlY0zonUtxv3qd3+lzIBweM/fFDN/p/ML0lM51sEJbQOJdPNuDxBO7fCqr2HND0KDVyAVgq/JJDruoxDmlkFRcZwrOVNStdpYdWwF3HVCTxxMtvexMySfJCeWj8efYRN3anJ5YH8Hp3HvdEO+s7mECtm2zM6AtQpmeVm1DcC6EN4Dg3OYlD2BGCaNhcRCchSasDKVFGq/ctdFT4N87h9EuDV8sMAh9GYRWiWMKGRqqoqg1JYwr4a3peOrAXpT9Pse/CMGB4vYpkLjeGaf1hFlCIzj2rJvx0wsbSuvBWLippJgjSMp/qXB0ND899epQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy1Ym2DPk6M9UIKYnZfmmwxIyVZb/0YTcex3cwDy9iM=;
 b=bIp+yNtPwQbNYMKby0ztZu+HamZtonMPhPeIoA/w6yEWuV7yXi4kxz9sDs5c8JlMNWsHPDRDvMrFLB3mR6QNXNG6tbnnf+AncvB1hGNET24gqlrJWJd0Eny81+PGw1SR1cW0RR2G8pKVbwiPN27jPvJSbmOEFzPl+HE/2B1n+uivOLkyZ8uvO98DNPq5gJaC7pXzt2b9eEvwqLfaJpvd2zNkIN3e272m1jZ11WPfLhEUNVUKSqxRqck/9cVatzaWtsSU6oxlcwG8jxfPk3DhZm5EkdR1mh38+z2PBSgxdfVooMyJPrqOdmyY7NvtI0CnzZ9pSf1TcaQ0y8l/WRzz5Q==
Received: from BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 08:53:31 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::cc) by BY5PR16CA0022.outlook.office365.com
 (2603:10b6:a03:1a0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:04 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:04 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
Date: Thu, 31 Oct 2024 01:52:35 -0700
Message-ID: <20241031085250.2941482-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bfd012-3927-4627-e57c-08dcf9897e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/sNf7Sfl2q7tuzgmvSIxMBQbVX2EzF+sVs6/Tpd8hRJ8o4SRAILJzBWkbQw?=
 =?us-ascii?Q?0l4bNc78YV3IxhquDvC5mx+kjBzZE5VxWp6O5h2Q5IicbnZDvmce7bavuCBn?=
 =?us-ascii?Q?lUt9BBPojdrFWJ40J38rjA5DcOtL9iSQfLYiFEBxd+M4QoBvNpN36SMqmwmw?=
 =?us-ascii?Q?aCOoqokG2xVzKj1CA8fQxwFRa+J3O4HJ/gmGXhADQNSz6fTb3ms/6xOBDdqw?=
 =?us-ascii?Q?6Y6ObmUdx67idkdTSVRU6TPgopEjvc90OAtbtFy6fNyx0TijXO66cGNwyfI3?=
 =?us-ascii?Q?XUddxYLwoqUbfoMymqFPJirwQbH1jlUJ/uQkVxhFmfzWKb/WEEihXFZ1tqJl?=
 =?us-ascii?Q?pjKu7hMEhp/2akJLZ8CPGj4Xa8FQVFd1puNhWStIwsOnsxffZrLsJL2l5HYC?=
 =?us-ascii?Q?z+Th2Q6vSdazfF4JBGASBU0uzZLy3Onr007rmnxc7wvA3t0EHltUFjAeYKZI?=
 =?us-ascii?Q?qJnluI84isC0DpClwRyEwSrkD2brCw+jHxqXERT8FwZOrhm0CNfX4m1pYhkv?=
 =?us-ascii?Q?cFhUtIFwtYM7mA0vtvemNX+byzkbmcwTNC41LQJTH+nlFYTVMj5vCP1xUFkJ?=
 =?us-ascii?Q?o5WRXy1PmZn3vmGup0wyxiwzoAUziJXR8X3/xIVSR+4g/RZSlBMEqoGxFOOj?=
 =?us-ascii?Q?lxqJ8aVlghRi/QKyVqd7mgGWztgntaOdEHgQKQSFeTSBaDCYB1J8knYM3RLa?=
 =?us-ascii?Q?wvCS1JJcnfxnrBJ7mpnzSiz/CE1CfnhwIvacNhKZNgYD4cwq5fmWYZc4YmeC?=
 =?us-ascii?Q?IZy2fbHvBqLa1wI/d6JVFx4cmPGPKvQS3+F7WdlFspIntVChSZtJRwQOcSyy?=
 =?us-ascii?Q?sk++fkCzjJfDwA0qQPI+Ty+DtPg6k9TJkGgs7CtABrqCQtzuiMFxr0jn78hc?=
 =?us-ascii?Q?HtZhjiW99Mfw3P40JQ7BGHcx7iT7oe95qIYRksbBedaxYLp1dY58ifKY5BFE?=
 =?us-ascii?Q?3kWJG5cMyTezcK9YQgQTKYpKja7dEb7KQ7TlCvAhdbYWW3cRzWfz7NniGMW5?=
 =?us-ascii?Q?NBYCc4GDSy7qMm8ollpueMsxUcbDC+0vW2HW1kLTOhfZ5loT7vUhlxJwQx8x?=
 =?us-ascii?Q?qFkTxtCYagxBHsGB3pM6MG9xi3cmAMWkOPjwnk9WhPdMAGDB6GKAu8wDZmjr?=
 =?us-ascii?Q?1Od2JX9fKZA+/r7U33XeTzlZfIVTBldNSeriwlWuaq9E8uosCXF0jc6vU5Na?=
 =?us-ascii?Q?lQqYhsEKhjhlj2j2lAb0XjyD2MI+iMNi2jnXQYlrzLYZAQfcvfV4dlg50cwe?=
 =?us-ascii?Q?cZOXjsk6HeHqixwt9popDE+hwC9F+cXQPuZTclHLKyEStOqIZMdlTPwRybm6?=
 =?us-ascii?Q?KZxE2vohR9sG6RT8aIFooHpEVt9asJ5hTFVdXBNPhi8Iv9WNVruU/xuIroSs?=
 =?us-ascii?Q?DzDjQ3OWbY7FDCwMRCB6Ezvie/HnsRVYqiYdiGvLoksh1r8d39LFeI5FECFT?=
 =?us-ascii?Q?6uJI1uvCafI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:30.2954 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bfd012-3927-4627-e57c-08dcf9897e44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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

Here is the leftover of the previous spin of NVKM GSP RPC fixes, which
is handling the return of large GSP message. PATCH 1 and 2 in the previous
spin were merged [1], and this spin is based on top of PATCH 1 and PATCH 2
in the previous spin.

Besides the support of the large GSP message, kernel doc and many cleanups
are introduced according to the comments in the previous spin [2].

For testing, I tried the following without any problem:

- run Uniengine Heaven [3] on my RTX 4060 for 8 hours
- the GL CTS runner [4] (commandline: ./cts-runner --type-gl40) from
Khronos
- with the vGPU RFC patches [5], boot up a ubuntu VM with a vGPU on a L40
and run glmark2.

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

[1] https://lore.kernel.org/all/20241017071922.2518724-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/all/ZxD1BBUUeLQdvXVX@pollux/
[3] https://benchmark.unigine.com/heaven
[4] https://github.com/KhronosGroup/VK-GL-CTS
[5] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t

Zhi Wang (15):
  nvkm: add a kernel doc to introduce the GSP RPC
  nvkm: rename "repc" to "gsp_rpc_len" on the GSP message recv path
  nvkm: rename "argv" to what it represnts on the GSP message send path
  nvkm: remove unused param repc in *rm_alloc_push()
  nvkm: rename "argv" to what it represents in *rm_{alloc, ctrl}_*()
  nvkm: rename "argc" to what it represents in GSP RPC routines
  nvkm: fix the broken marco GSP_MSG_MAX_SIZE
  nvkm: remove the magic number in r535_gsp_rpc_push()
  nvkm: refine the variable names in r535_gsp_rpc_push()
  nvkm: refine the variable names in r535_gsp_msg_recv()
  nvkm: rename the variable "cmd" to "msg" in r535_gsp_cmdq_{get,
    push}()
  nvkm: factor out r535_gsp_msgq_peek()
  nvkm: factor out r535_gsp_msgq_recv_one_elem()
  nvkm: support handling the return of large GSP message
  nvkm: consume the return of large GSP message

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 501 ++++++++++++------
 2 files changed, 354 insertions(+), 155 deletions(-)

-- 
2.34.1

