Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DAA3E617
	for <lists+nouveau@lfdr.de>; Thu, 20 Feb 2025 21:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DE310E9DE;
	Thu, 20 Feb 2025 20:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkcquDe2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542110E9DE
 for <nouveau@lists.freedesktop.org>; Thu, 20 Feb 2025 20:48:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uK6LCI90WjqXKn5VM62+m8zCTrOEi+yZTiF+ovq2Z+oKj/X/o9Iqij+fjiz36sRduVtQ+ULiPBTDLV1NWSTTy7ZvVcxPpisZe9hg9MJV6hVJwPd94RSewZFsx3PO93nWo+U/RmyfLnQW/Q5i/s1tw3RBueWaLoEpJqpj+BF182FzpEBy77Ve4oo8PAjsOY13+VkATQaeAzqes2GmoE8nWDillGWDiVpsXeXW8rBvpJ4KTzzbSJex41Ud2GhBRtqqj1vtYAv65kHCNrK4xmMKm/jZN7nfnyKjQmUO5/r77iRIwGnIunnG666LzmdVVdvgNlwvN1CdTXDNzW9sqZkc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TcghREUUudKfSyMis2dxFoYqiqhPOsVjPvT/RKwWYg=;
 b=kTRTyMyeEhca2fy89XyhoLJN21RHABFZ5Jb2MNZ6qfvFSBb6fWFdO4xFxzAdh8bizHfYwDOPc3FKoC0ektJQFbvSu7/YKsnMAowHoxx2Akg46whihSRRIKAPtgoOJzscRse48KVe4LiGc+Ci2YhWnNf/2mS6v05wqvX6cKYxUTpd78DVTB6rCtmysgl+9hC8/2o7dHVggjs2sAOPL2phPu70zmabWXtejpHNvtAFX8WX46S1rR2kEOrleeAMV/9jAm3QUNxQ3qJkUSOcTi5HG7bOMNQbtcwnZe4WmGEtmdAgeyeKi7ItMeLUVsc7/zG8uHKRgUxPO5ksZAIL4mo9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TcghREUUudKfSyMis2dxFoYqiqhPOsVjPvT/RKwWYg=;
 b=QkcquDe2/Lz0XVfn956+Bgz9O0FcY3mti1/gboLIbFaUEyQgAN4M1ubE3syszQc/+Z94x4hKeebXA1lGid1YWKrNNSpwu/lIPbK/NBurVGdJRfcYfngX6M1uG7ppK3e0rWqblT6qX84s61DvrsUyHBdAcGNDGFKdMy2sY8qIlVYeffW3k+pPcywng3qeePRvXYEQfQhENC6kUaKTxFNjM8mHFRw7NiOpEV+xcOZmMnKtefThDLvSRXrNfjX8o06H4UZCz/gwch/gxqR0XDLT8IhpJW0c0sfGVmIXz+l3qKkxDsU0mZQtwCCY7Jb+j5jQquslJNnYxvKzfr1Wc7Vlng==
Received: from BN9PR03CA0143.namprd03.prod.outlook.com (2603:10b6:408:fe::28)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 20:48:42 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:fe:cafe::4a) by BN9PR03CA0143.outlook.office365.com
 (2603:10b6:408:fe::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 20:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 20:48:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Feb
 2025 12:48:16 -0800
Received: from [172.27.48.176] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 20 Feb
 2025 12:48:12 -0800
Message-ID: <9cde5459-9225-4e15-b239-e4728ded1769@nvidia.com>
Date: Fri, 21 Feb 2025 06:48:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] NVKM GSP RPC message handling policy
To: Zhi Wang <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiwang@kernel.org>
References: <20250207175806.78051-1-zhiw@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|IA1PR12MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: d384e9b6-3108-43f8-3bf7-08dd51eff5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWsrcnN3N0RQZ3I1akJsM3NScTErc3l2N0FUOU1mcjUwVTcwQ1YydVk5ZDk5?=
 =?utf-8?B?Q0hrQWJDZ29ObnowOE1vYnZTdFYxSUpjUnlJaXp2Vmo5RFV4OWljT0ZweENQ?=
 =?utf-8?B?aFpLdDFRTHJ0aDVSNkRRQjlZREtqbGFkbWpWRzE0eU85RlZHeWxJRmVBZDJO?=
 =?utf-8?B?QkdIRFg1Vm1YWWZac0wrVHFwd3I1Qkt5T0ZJYjFXZi9DN29JaDhUOUhOVVpD?=
 =?utf-8?B?MlFtYkk0bENPbmx6UWlxNGovZmk5eU8yUWhXaS82UzlhSE4wdVdoZ1VSQXZ4?=
 =?utf-8?B?bzdvVnlXZWd3blBoTDFnU0hWMlhURXdRTzB2TThDU091ZGhPVGhxN25wOHlh?=
 =?utf-8?B?allsaXdxZzg1dmhGRWJTSTliVG9oRDhaN0xIUkl6dVNxSmxxblVaVmpnU0Jv?=
 =?utf-8?B?ejFybHNnalRuYzVVcW1nSGJJRkFCd0VSanRMNUVxU2t6cVM5anRBZWJDU2h0?=
 =?utf-8?B?TGM3U3NHSExmMmYwUXNOR2lub2dabVFmYmtUTExLSFFhSWZMdTVGSWZTbTd1?=
 =?utf-8?B?a3U3V1h6NW00UmUxUGY3OGxzZm1IZy84VVJacC9ucVFZdHpyczBDR0YzT2Ju?=
 =?utf-8?B?aHJ3LytXNURsZHVHNDdXdUJyRlhhc3AxcHcwZ1c1RXBDWmZ4R3FwMkpPWGtY?=
 =?utf-8?B?VGtJWmR1RER4Zll2UlhzSVozcFRpWmhwVlhxMExOVXozajgvRm5CWDJTMVFF?=
 =?utf-8?B?dXEzU0xBeVI0VjYzK2I3anpRV0xMSnpzTzdxT1FHMmFkUlh3RTZuaTBXUC81?=
 =?utf-8?B?YjdKTEZPOVBvQ3dFWjVhNUtaR1VvQk1ab1NhMXYrQTgySUJlQ3N3bVJWaVVz?=
 =?utf-8?B?VG1qSlJqY3BJU1g3dHI5aVc5MzdiT0xGUW9tRmdWUFRHR3VtNE5NWDZiL253?=
 =?utf-8?B?anU4UzlUcDlSSWR5eU1UZGQrQS9yU0Q3eDhvZStFYStyS2xiUkhKTVAwZEcv?=
 =?utf-8?B?OEtCUlpXbVBzK3RKUDVnRGl6TVFlY3d1TlZ6VnRrVSs2Zm9iVGFsSDNwWVds?=
 =?utf-8?B?T0M1eVA1VjJGU0VTK0ROK0xZenlhOEtlaFFBTEJMK05oTUlDTVM1NWtFZXFD?=
 =?utf-8?B?MW1UK2xEbVRpWWRVTW9uS3Q0dXN1SERwZ0tBbG1pNWgyY3pYYlpwM3FpZ2Rw?=
 =?utf-8?B?Zi9nRnd0WTZ0d3pwQ3Brd3gwdW1xeWZISUZiQzMwSkcyQmUxRS9UMUpHeVJv?=
 =?utf-8?B?UjAvakUybWIyaDloeERaUlFGanhmYVQwL0JkTUpKS21pZ0o1UUJLcFM5WGFk?=
 =?utf-8?B?amRzWDVsR3lJcHFLaUR4elRpWHM5Z1NDWVNOSlY4c2E5MUNTRUpPSkVpb2Na?=
 =?utf-8?B?RG5HNHhvdXNhV2orbzNPa3hIL0drUzA2SnIyZ1dOdXB2TG1XVWQ4UFVRbmJZ?=
 =?utf-8?B?dkp3NmZaYU9WZVgrTmxhUlRiWVhSYlFoOFE2SFh5Q2V3b0VwdDlOTExESmxx?=
 =?utf-8?B?Y3FZeXRLcDJoR0x2WW40a0k5OWUzdXROcGJKdWNPd1NGZHVYZ2UrMDJkTU9q?=
 =?utf-8?B?YVE2cTc4NzlTdnVuMkthK3dQTW40Mi9hUGI5RjBsd2V6cFBnOTA2RXR5Q2VI?=
 =?utf-8?B?cU01UExqM0ZZbFdnM2l1cVAwdHdlYzQvSTZpekJ1aXRSZjdXeUtDK2N1aDAw?=
 =?utf-8?B?RDBxcDZ6MzYxUmx0bUYzaldVa29pSnRHenozRGNPZHB2b2RrMjNzYncydHkv?=
 =?utf-8?B?NjgwU1lDTkJnQnk2Q1Zpc085VzhlYkxreXFTZ2xUK3JLOGl5ZzRzdmxrTGs0?=
 =?utf-8?B?cU04Y0MwR1Y4cjJhcUFoMXZJNWQrRkR5WXZKMGN4Z3hpU0NUaVpvdkxETXR5?=
 =?utf-8?B?OW0rc0RkVG1WcmRlZmhvZHRJaFpYZ1oxWnZUUHZrYmVCSnVqZGtvcVBSbk43?=
 =?utf-8?B?WEN6eWFwZnlZV2lBZHVRWXgyTVRvS3dERXdzUnR1ayt0MDhLNzJmMXlXQll0?=
 =?utf-8?B?cVBEZGtIVkl6dEdaMFFBR2k0VkN4bVc0YnlZVnhrcnIyQjA2eWRYejg2SEhk?=
 =?utf-8?Q?mo7fxdPogRXct74I1tTqKpHg7eH9a0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 20:48:41.8987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d384e9b6-3108-43f8-3bf7-08dd51eff5e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306
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

On 8/2/25 03:58, Zhi Wang wrote:

> Ben reported an issue that the patch [1] breaks the suspend/resume.
>
> After digging for a while, I noticed that this problem had been there
> before introducing that patch, but not exposed because r535_gsp_rpc_push()
> doesn't repsect the caller's requirement when handling the large RPC
> command: It won't wait for the reply even the caller requires. (Small
> RPCs are fine.)
>
> After that patch series is introduced, r535_gsp_rpc_push() really waits
> for the reply and receives the entire GSP message, which is required
> by the large vGPU RPC command.
>
> There are currently two GSP RPC message handling policy:
>
> - a. dont care. discard the message before returning to the caller.
> - b. receive the entire message. wait and receive the entire message before
>    returning to the caller.
>
> On the path of suspend/resume, there is a large GSP command
> NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, which returns only a GSP RPC message
> header to tell the driver that the request is handled. The policy in the
> driver is to receive the entrie message, which ends up with a timeout
> and error when r535_gsp_rpc_push() tries to receive the message. That
> breaks the suspend/resume path.
>
> This series factors out the current GSP RPC message handling policy and
> introduces a new policy for NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY and a
> kernel doc to illustrate the policies.
>
> With this patchset, the problem can't be reproduced and suspend/resume
> works on my L40.

This seems to fix the issue here on top of current drm-misc-next.

Tested-by: Ben Skeggs <bskeggs@nvidia.com>

>
> [1] https://lore.kernel.org/nouveau/7eb31f1f-fc3a-4fb5-86cf-4bd011d68ff1@nvidia.com/T/#t
>
> Zhi Wang (5):
>    drm/nouveau/nvkm: factor out r535_gsp_rpc_handle_reply()
>    drm/nouveau/nvkm: factor out the current RPC command reply policies
>    drm/nouveau/nvkm: introduce new GSP reply policy
>      NVKM_GSP_RPC_REPLY_POLL
>    drm/nouveau/nvkm: use the new policy for
>      NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY
>    drm/nouveau/nvkm: introduce a kernel doc for GSP message handling
>
>   Documentation/gpu/nouveau.rst                 |  3 +
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 34 ++++++--
>   .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 80 +++++++++++--------
>   .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
>   5 files changed, 78 insertions(+), 43 deletions(-)
>
