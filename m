Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDCA2CA9F
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8810EB8E;
	Fri,  7 Feb 2025 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bywXxV9N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054810EB8E
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtD9US7HuaXXG1YvHc+Az6Lg9B580fLtVvq/fvK8c2tcFqEm5xpweTUa76yNk4E9La23JMGpNSahoeDaPg3E5h4INra9zUE6mwUb8QH/6hRnEvMpRX3k2p89SVjBT3RbOjA7JKHyhUpvTmHvdH46DgjFamZW/ZxUNrhIWiGFnjZPniLYSf9BXRzsO6+jlIc1mi/rNQm3cYx06k3MK7mHghzIj0DyWEAGA9gEXGCdUc1JNnh+L8zsN+QDQQ2inVWzZrgYmYNGqSvnhQRIR3zry3zZVeY/Cz/SvdhwcndQpizitC8IiFGRaWMDcLZVZIPp4PG2WGHL94ofTZr0CCXLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM/9gHCDXcTX4Mggeaf9mvdx07oUBfWJ38mjEQjAU2k=;
 b=dw4I/HoLklOehKRlwueni0oJ9r2yIrZYiukkXcaNOiJHojgA6x3W/8SgupoVYyv6ggoD/gEA4IPPxS2WQ4nqp1GaaKzITiQzun6foEGnNo8Y/eCmArL65AARVyCKHHoeMY371nvOs2qLDZsQT4iA/88RTSpgCBblKa1q0jRtxH5fNpmY0t2mUDezuzOFF1ogz9qxumnhrvq78leTax9vGu9FPVbxESTIIKP4zBXYMMBwzdFxyoqYMYLyziV4l5xhyg2rJvZjhp0w1VoUqSQhtfIbZJn+wm8GDAqmq0eedUmVjv4xtQvn4kO9L40Kf3FQJktAWQEFnUTCLD/OtaDhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lM/9gHCDXcTX4Mggeaf9mvdx07oUBfWJ38mjEQjAU2k=;
 b=bywXxV9NoIc1KRSvXypy7eKuwOTPpwVIutDiUjnDs6AeZnsqgAQbf4VgJQAps0GuOJ3QD6Gg9AsapL8cvRKuJ1ol4rQ9OhzqNBLti5bp+brYkupkLc+ObPy0/x33zKyNBX9/SWqUaCn0P6iNCUtHekwAUSc863A6tpUihGxLy0yhELU5XhGVEyiRchmox3n4idwXu9sGDusUPyXcnebex8PznOPEymMhiolz8u6jKoY4q4lhJ/Diz5NoEeiC3CJzHcnmUzLJCQ8v8H04a6rCOzf67pMfkdxzfx20XNTwtzln5Rl9kG9/AMfXfHU4FU/ZyGJzb6werLLPSIzLji6/qA==
Received: from SJ0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:33a::23)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 17:58:35 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::e4) by SJ0PR03CA0018.outlook.office365.com
 (2603:10b6:a03:33a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Fri,
 7 Feb 2025 17:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:33 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:20 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:20 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:19 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 0/5] NVKM GSP RPC message handling policy
Date: Fri, 7 Feb 2025 17:58:01 +0000
Message-ID: <20250207175806.78051-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 74203d7c-39bb-4937-e3b0-08dd47a10a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XPcqb1jMIe//k0IEa/FJpD9vl+qYMqCyS4dVocbMuA3L6xwDcpbeRitWjaPr?=
 =?us-ascii?Q?bJBeeXapJ60AaVAPlxOv3txZITbubZIO/G9qD2osEJxjwrpJ9z7eT1fySrhZ?=
 =?us-ascii?Q?ERsoIwkpJyAfN+nFEk1GqsvbPXCoHgaakJagYjyNWOLlqkE7sh+kcJ3NMgYf?=
 =?us-ascii?Q?PQwP/bNvX7OUzEp28XMAxmhOUodJLRMCO1atbtL8QL4PqPqfFUxSSL+Fq9Gw?=
 =?us-ascii?Q?X+ecSPDULtLpJfS2+t3WkbvPA1nbE2DGBkBgDmc/cwh9b6XNFbRgvjp/sPcd?=
 =?us-ascii?Q?UYPCF56omtuzbITKTGVplkK+Nk2XP3pbiw4heavAaf/HECEuy1tRvlqz+5Qi?=
 =?us-ascii?Q?h9fG97CNZIrx393Nno+Zyf01MP2z3rEPcNWkVaydsSsnFC0IUjfVIlADrsXv?=
 =?us-ascii?Q?e9QF0MSsTFx/ydfejYyAbdmXOcU5TAL5cBMxrwDZVBAwyzwXnNRGaNm2mCcy?=
 =?us-ascii?Q?aWLyospvAnlIhWel5qYcMRlGSbBf9hZR6lZLfh2Ht9Wv7l1wSPLmOE1NdCC5?=
 =?us-ascii?Q?I+LTI62jFcqvjyfsTxcgM3gokqSw6g/IdfuvdQXC9zqdll2HJnOVxtssIuF3?=
 =?us-ascii?Q?gMVm9rkgequlZQePOQi3QgriPNNoOt2LvORxHzbDCx+dQhgSDCLsa3jooHmO?=
 =?us-ascii?Q?TUyuui4RQhnTN+PWVmbrJNJl8Z/08ZaxCiXLq59rmUTti1SEhwvVsDTAZoLQ?=
 =?us-ascii?Q?eaT268gmDUwR0J7F0wpjkr03hQQmCwZPxzryOVnAPvDmZz5kPQIQ2cshK/99?=
 =?us-ascii?Q?QsvvKbZ05UnmCCLwzY+PDvfwbXh3qYCm3CIpOApjLmWE4ODr0Ty1Sv8l0nQY?=
 =?us-ascii?Q?bxFHkAWQ6763AwwABYoeV8Win43U4hqHgKmnFAhQ6t187hWKZK7HdUWED7Pk?=
 =?us-ascii?Q?qhJaSlWHhBxSsXaRMm6KvPG6UK4kwX2ZfM6VxeVLnCnBR+lsViU9BU97ny0A?=
 =?us-ascii?Q?5Aj5N+mAFsn58duSCdfK8PWFfZ329FRFFWtqCeymLXeTD7eNg48ItSifVuYp?=
 =?us-ascii?Q?1uvU0GTdxgrCydwYapx1tz5X/gn5ucr6HvaVGfmVFRYouwB0Gss3vXi3i/tj?=
 =?us-ascii?Q?r7R4stI1CN5glMn/60TDl6ELXeU1zVklSDrpRNf+P4kauaYIkse+IfnSucKO?=
 =?us-ascii?Q?5OpZa1uFI7xO3haKKDBY81OPlgwUodMx2op6ZyaI2CmrsCbeWSgLCq/XTN0D?=
 =?us-ascii?Q?s+Ox5THHPDiMy4HHkt0XVOp5PLNFTTrvZe2eB2Y12NxVxYFvK4rM7a5UNmrY?=
 =?us-ascii?Q?JBopQzjEjVnGLJfl0lU4rmVSdu8Uzc2pP0hbK/dVa1/eJOyMLlAeHoeeTzCg?=
 =?us-ascii?Q?7qrq/R8uOg8FUnFrMjOsRQYq4VYroDh3TSMgoNfJZXqcOPNUr3hS7cT+KOOn?=
 =?us-ascii?Q?rRrzrfE63uNO7v6toiEa2Jw0JzCgQ+AV1pJE+QgW25nISj0tYejJy8umrS65?=
 =?us-ascii?Q?palsODGI15mPICAjQJL65t511pbvPPHKbzrXa54/DQate0uaMhOTGqg84IwI?=
 =?us-ascii?Q?f69BvQdVmjZ1GHk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:33.9630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74203d7c-39bb-4937-e3b0-08dd47a10a05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
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

Ben reported an issue that the patch [1] breaks the suspend/resume.

After digging for a while, I noticed that this problem had been there
before introducing that patch, but not exposed because r535_gsp_rpc_push()
doesn't repsect the caller's requirement when handling the large RPC
command: It won't wait for the reply even the caller requires. (Small
RPCs are fine.)

After that patch series is introduced, r535_gsp_rpc_push() really waits
for the reply and receives the entire GSP message, which is required
by the large vGPU RPC command.

There are currently two GSP RPC message handling policy:

- a. dont care. discard the message before returning to the caller.
- b. receive the entire message. wait and receive the entire message before
  returning to the caller.

On the path of suspend/resume, there is a large GSP command
NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, which returns only a GSP RPC message
header to tell the driver that the request is handled. The policy in the
driver is to receive the entrie message, which ends up with a timeout
and error when r535_gsp_rpc_push() tries to receive the message. That
breaks the suspend/resume path.

This series factors out the current GSP RPC message handling policy and
introduces a new policy for NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY and a
kernel doc to illustrate the policies.

With this patchset, the problem can't be reproduced and suspend/resume
works on my L40.

[1] https://lore.kernel.org/nouveau/7eb31f1f-fc3a-4fb5-86cf-4bd011d68ff1@nvidia.com/T/#t

Zhi Wang (5):
  drm/nouveau/nvkm: factor out r535_gsp_rpc_handle_reply()
  drm/nouveau/nvkm: factor out the current RPC command reply policies
  drm/nouveau/nvkm: introduce new GSP reply policy
    NVKM_GSP_RPC_REPLY_POLL
  drm/nouveau/nvkm: use the new policy for
    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY
  drm/nouveau/nvkm: introduce a kernel doc for GSP message handling

 Documentation/gpu/nouveau.rst                 |  3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 34 ++++++--
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 80 +++++++++++--------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 5 files changed, 78 insertions(+), 43 deletions(-)

-- 
2.43.5

