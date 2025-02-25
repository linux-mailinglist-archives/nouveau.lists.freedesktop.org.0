Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B8A45088
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2025 23:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C04010E814;
	Tue, 25 Feb 2025 22:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qHrIGp7m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42B10E815
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2025 22:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNrZtOjPsvJT9DImLqoYq2ZvWo7tWTKJu4BKlHAnjyqR1021R61yt1vNXxXylxH3TUTZS39FPhn96TplMad7aBAaxa/LeD5pru47gGZjWEjAdyR0M6UkbRhB21Zi9wju1cPSRA/fQaO6l3tAYDTnq7T4N7VIeP/ZCygCFt1vWXfu30/aR6g9O+sAJ6tLTlX7D9tQLQR3jmDUGt7x/RbAx2Tu7mJiR3cyX6DCOyF16ffGIRDP/qKXJ+ltHpUlJuWn06irICnKYbMH0v2C0FWSwkm/OGwGIhnLO4E43dCpqF2JoPYzCNoEFL6cnZcm5uYsfEDSCp2qc1R2k90NAW7T/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMvlvYxHdHMLUUXzWDWKCiz1iwJpoZ8OK+/VSVug9ec=;
 b=YyOMwSkcaIN2k4ugOK3pUDoeZexbW5LgkIx4+lcRaZpBHFVg3l/jqN2bW1fS/a1l+H7+qk6r15T0brhO3fEHCqHMSQwoBUQwZrqpXUg/3ht72UbmGEUcc5epkk2Y5ElXy7IfQ5hlkgx5GtCMEGDbHhZ6MIC6fHEJVQkNVFjiIKpYZBOVCLMOKmeZm6Bk8PQQ+GtIstDscJzsU6Jfv+cGVlFJgKvzCRpozMz37kUwq/gv7cbVSgvbfL2SZ/zCNhUQ7x6CJCTSjew7d9UWx+npQrPT1X1yCOQP5q5oPjvlOhbhdBn5yIDq+RNWPQUEwkdT7eEc3/UQFsHivabmuxvWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMvlvYxHdHMLUUXzWDWKCiz1iwJpoZ8OK+/VSVug9ec=;
 b=qHrIGp7mIZj+4mxyDOC6azR+R6Gor4j/JzcV4+vmPPSBI4JxcwlFCOCol/E5Loxm3hLmM5vUN3WWElutWD+68l5rgVvcCmThHQwLaFGGUN8oJvZUp/jD8oYYogUQp4zUi5nvYIdJfTqmE+MiNGCsFv/4XVfta6GPs+/XOdsOo/rV9PvEOpY0Omfq/MhgHQnPYCqZlBUqTQOL1oCo4Xo33bJo1/91rn62TAJtC/buLGhaJG9Rc26D2ys80HsNfK4+pU/3I5rnHBwhHVzzzTW8vbisYOMyz4ouXH4NbRYsxCUcHPAbzM23f85LURGwRudhN19w38SEgbFu0TYbpz4Okw==
Received: from CY8P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::25)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 22:54:13 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::dc) by CY8P220CA0048.outlook.office365.com
 (2603:10b6:930:47::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Tue,
 25 Feb 2025 22:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 22:54:12 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 14:53:55 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:53:54 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 25 Feb 2025 14:53:54 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [PATCH v2 0/2] NVKM GSP RPC message handling policy
Date: Tue, 25 Feb 2025 22:53:50 +0000
Message-ID: <20250225225353.12642-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb9e3a7-bf6d-46f6-835b-08dd55ef529a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Kf/tpgakcPIv3Db+FbCcLnFN1XoxxLb7+GszTcWPz1J7QPYlNJH8YZ3M/3m?=
 =?us-ascii?Q?j/W+oGDnIDCS2uwtGZVj5pJHppUt0/FAPBbRnavT8eEt8WkgXDr1vILpzNvl?=
 =?us-ascii?Q?FJL4wLU4D9F9n9TuISxGGfXS6owxJo8EmhWhj52uZNEAabh/xZTCoEFm9MGL?=
 =?us-ascii?Q?nKDpjf1wcE6zotnlpDEeItstVbiwJLxX3hRcM3YjRYPegZF2FNkKv5BFl9Kz?=
 =?us-ascii?Q?K9eJTbchyCGSzvvIK61G+c+16Z2duMtS4ybi+8BzYk8gzLxZimY2D2GH0OLe?=
 =?us-ascii?Q?RFmxAm/YA3crdZ2vqoX5YJ/qzq93GI5nO/7fWezgwIKX0TQvkZzjsAQchCYw?=
 =?us-ascii?Q?ceKBUV8Yx8RTUxV12Dfo2oPPiubZ96N0/35WJP3ZacBGhkOVSBXTeftzOKAV?=
 =?us-ascii?Q?K5uAe/LlaCfS1tdiAA11g90WUgiEyT/otUSSxc7hOy1HFow5k3I9POQfK7ZH?=
 =?us-ascii?Q?oCARFberCqDcYTIsst/YOrvRqIzTyGo/3AvDHkRfQt0FLiesHVISU06AJkd7?=
 =?us-ascii?Q?Eg0uPPErX0ne4IOIY6sZ66rVPbIMmLGaZJIbdEbwx+0DJpr9beolYLqObiFb?=
 =?us-ascii?Q?xMZapEkCEiIJNqfXYv1WXEYBBowgTi+Aa/Q7jDURyF7Krm1cWdhHxQKwpkDA?=
 =?us-ascii?Q?JiLsvKm+VDeUCafdLg+gAeue+LsHpQZencgVgd8CipUi+KBsb5qPJVphTJcs?=
 =?us-ascii?Q?b/pFSu6rCWLPMjwqGJXsBke6KSdGcoqHiZ39T/RyuSsW3TaWC9d5C4v4E7FF?=
 =?us-ascii?Q?nxnXMVTOtW9pPP1X23k+xC/AbcQKl1WBLKnR34lqBuSxKH+z+qy4qcFuNi48?=
 =?us-ascii?Q?w2jBsrzWpB2Ln9FuoUp6l1Xpg+cuhPb+o+mTF0bDqGSH5X7JZ8YsuiAEvgXm?=
 =?us-ascii?Q?TIPGhFSXAZrZpGhnbMQcxFoJsA+kHRTLat+kpv3XimYk6eF93JAYYVcdztl4?=
 =?us-ascii?Q?xV2lu5uJrKH6JVM5XlUYRUGSsi4akEtVUIHR5p+6QR+GUqzXF3gbgLUbYa6J?=
 =?us-ascii?Q?QIx291k5eqUjmGRBxsNb+BL/OfSz+NRxyrLG812oBqgii6D47wm+9befnEA2?=
 =?us-ascii?Q?wB4yz26QxdRJwL6ssCYfYPK4CWx+W6J4Pg9sh/vfTUPIBHu29GrisbAkC/Xx?=
 =?us-ascii?Q?xtSuME82rx8OrRupoAj/2nWPrCqE0Ec5/x80D3Tef3xK8fmuXgzjcS4rTLKr?=
 =?us-ascii?Q?EixXrdortmVGTbRx6GTkhoVQLjvYxpLeOsiUKw9sfet+l0yryugbc1Htapso?=
 =?us-ascii?Q?JT6+0kZUPsf9E3LcZ4GgAPyN2HcDf6arVIKG3Xk9QxKt1oC8a9fKGH9LAYZv?=
 =?us-ascii?Q?h02+YKU4YnKEnfT3P+fgHqahkBbLZ1CGRkSgbUGNFUhuqz6LU3o5Srq5RLXz?=
 =?us-ascii?Q?Ptbrfj751arKY9GEnvk0wR09Q48mOhp1x5VtujQn/XLCwSPPPTZbg/wO7DkE?=
 =?us-ascii?Q?lmkH912/83AuOVEgIdlbLL/hpGkdwUJaWLm5gMOp31ESo6ZYx2eEIRpjJ42w?=
 =?us-ascii?Q?BHPkoZnzU4muLtA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:54:12.6318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb9e3a7-bf6d-46f6-835b-08dd55ef529a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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

Here are the v2 version of NVKM GSP RPC message handling policy which
solves the issue reported by Ben. More details can be found in v1 [1].

v2:

- Add Fixes: tag. (Danilo)
- Merge some patches into one. (Danilo, Alex)
- Implement the policy type as an explicit enum type to leverage the
  compiler check. (Alex)
- Introduce the NVKM_GSP_RPC_NOWAIT for "caller don't care" policy.
  (Alex)
- Introduce the kernel doc at the same time with the changes. (Alex)

Zhi Wang (2):
  drm/nouveau/nvkm: factor out current GSP RPC command policies
  drm/nouveau/nvkm: introduce new GSP reply policy
    NVKM_GSP_RPC_REPLY_POLL

 Documentation/gpu/nouveau.rst                 |  3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 38 +++++++--
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 79 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 5 files changed, 79 insertions(+), 45 deletions(-)

-- 
2.43.5

