Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2198985D
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2024 01:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7E10E217;
	Sun, 29 Sep 2024 23:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nAnyc4RX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AAC10E217
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 23:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCH3S4GDVSjbp7gpoKcv9/Qj2NU7DrJceoim/Byb8HFdmZ9mXa/Epliz8RCtNrPBWkkyRR7jSkYrURNqcMY6U79/KRZJzYpRqy6OHGgan4XbA3j1FDL/jPv2t53rzIh5KLJK7e4AlScc1y9AJKyIqNjiUqsGvyPdTibQqaULX/0dksZ8HgFTPYAo0RY55xz3B8SLGAKTmMC+6HIOW79Tj4JFjjD7u7NhukVe6f6Cz+bRIEkFRevrWg8aMI6R6CjBtp9hBzOBtjzkQoE9QbuAKaqPrRnEcx7tEjjKMR8KCsIWsXWADsQjtis2mVs+SgIe+FM1lD5DCDTT8B3g5kHXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50Bw9rLHIvgEAS3kmbswyZSVR4d+OMe1TqS3ByFQKf4=;
 b=dJ2MoScv2Jk2nSVcyf1vZnb51UazcrlN+Cl18bCtX8fDFNpgVp0euhLF/l9JFAFbnZy/DcmngjANfBdu64UbTdN7nRbzD/NvkiAhDtgAMVwq8vEkBKi+pa/hEDIF8ue4eeWKqVjuPm+OHIn0jdSV9YFBvHGKIiIo0wp+nAnxHCMYZjPnZwHUULWryO79wmH9tbeZyDa6qp6YThv9MCWn9gzlwC5H1GjdOwp0kKqpa8+F68FJYBhe+SO7CD/5LinRs9Oc62xImdi48Y3fSDys9GqBCiEAlbHHH5dGPnVa6Cs4BKKnphBvWOdQ0FaX4dTbYo8WqAAJd/nI+H//IfX5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50Bw9rLHIvgEAS3kmbswyZSVR4d+OMe1TqS3ByFQKf4=;
 b=nAnyc4RXoB5xAS58unSa62YDkSqRu3MVuF4fUNDQgl+SCshoDj2TYe4/IVBwsWuSTUmOTC9P/6Ntm2kcUKsfUV5LaQavMQZVcoqVd3kgw3DzxnPpleS9XMjrPnqR4Redcz4gdsQ1U5X9DxF8U+MhoBejQD8TQezwYGSsf0nns57Jz+EGiOjL1DZjdQ/naBRfcRlJv2U6vNqOH7rbl+b68dwACWFsOx+78Ym/+VDn+HZ4FO5W4fYdyUYgJIStn8tst2X6LjRSBFITEXWVJxVgsHUHjm7mlv04P0niai67pWbSRTolKLzOebJDSwp72GxGAdVylcFEuZBU626+F/hBVg==
Received: from MN2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:208:1a0::37)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sun, 29 Sep
 2024 23:11:43 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::fe) by MN2PR07CA0027.outlook.office365.com
 (2603:10b6:208:1a0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 23:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 23:11:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 16:11:33 -0700
Received: from [172.22.80.131] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 16:11:31 -0700
Message-ID: <2421cc89-2b4a-4f91-8454-7d2c8fadac7a@nvidia.com>
Date: Mon, 30 Sep 2024 09:11:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] *** drm/nouveau/dmem: Fix Memory Leaking and Device
 Channels configuration***
To: Yonatan Maman <ymaman@nvidia.com>, <nouveau@lists.freedesktop.org>
CC: <apopple@nvidia.com>
References: <20240929123053.441096-1-ymaman@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240929123053.441096-1-ymaman@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8dae12-7c73-4cdb-67f3-08dce0dc14ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW5QQmNwUHgxd25icTRadzhQNVkreDFHWjN3S2tkMjNjelRBQWN6T0FCRTFI?=
 =?utf-8?B?VUl4MW9BdHZXSWFzcGtWSVNzUTVaUCtOYmp6cFlBRUJOTUNUYVY2T2tCY2Jw?=
 =?utf-8?B?L3JkU0prV0JCSWl1SG9mZDdSK2xSMWZhR2tyL2Q4TTlINk5sZEU2SWxhcHhv?=
 =?utf-8?B?TURwcWlyVkp0V1JtRnVzekRlUk1iU0VyTmt3L2FZMUt1eWsyVGlhdnc0cWFJ?=
 =?utf-8?B?a0FaWjZ0RVBXQ3VxT3V5U3RCQ2x1emJNa25SUGQzRngxMEJqZzU1N3BzZ09k?=
 =?utf-8?B?NTN4ZDJreU5rRVR3a21EZittVDJZM1FkVm1vODVIQ1JqY2YxU3hLL2F3M3c5?=
 =?utf-8?B?MXBUSzJzTDZnYnNUOTJrTURucXNVenpmcUJLeVl1a0RnRHB5bGx3YnFyL0JV?=
 =?utf-8?B?UmlIbGM2a055azBnSXYzVXNiV0N1MkcwT1A2Tkw3K0o1ZmJjdjVqK1lMdzAy?=
 =?utf-8?B?eGJaT1pRNVR6dTh2NkdSM1JadDd5MXQ3eTgvei9aWXA1VjY3RXlPQ2xDSzlW?=
 =?utf-8?B?cUY1bmRPUDMwaEJWWUoxaWhPN1BBOTBNckpYMmxBZWFmNkZjZ1hmanRXSS8v?=
 =?utf-8?B?NnIrcW84WXp3VHdrTyt3ZHJobTFObExMWStDeWoxaXN1RHM3QVM3SGhSdE84?=
 =?utf-8?B?QmdxZzM0N0NOZG9FVEtINzk5YWRGdExpTHIvSnlwK1dyZnNUY3BheHowd0Uy?=
 =?utf-8?B?QVRvZ0pnZ1VrRkM3KzdWblhWd2NNdnBZVGJhVHVnRGNQZk16eWVuV2FlYzVl?=
 =?utf-8?B?bFpTTUM5anBneWsrUFEydEw4TTR0R0k2OVRqNkZlZlZjVWlEMzE0R29uelM0?=
 =?utf-8?B?VzJnem1Za1NXUWVCRVZQOXdDZVBtYTNGOUxEekE1TjVxNlFkLyt1S1gvNGlR?=
 =?utf-8?B?VXVrdWtzVjR4eWNjWlNmdFZ4NU5jUXJCRlhLbDByYkRiQmpNM1ptWVdpYzls?=
 =?utf-8?B?YzlBdUhWdEV1N3VMVTc1S3UxV2xSR1c0Ung3MjJBa1VXR2xtSnRRVXlVek5X?=
 =?utf-8?B?ZitTV3hJby9wT2cvRjlNUFlpZHlNb2RPUzBLajRZTFY0WFQ0ak0wVGE1OUVz?=
 =?utf-8?B?aXdzK1EyeE54TnFJMFpqb0dDTEx6MGQ0UUtCNzh1T2YwMXZvT3ozU3RDZ3Rv?=
 =?utf-8?B?Q2Qrb2NVbmhvYWc1Rm9HVWhDa1dQcU9VRklobjRGZWVjQWUvcmdDdFZaa2p3?=
 =?utf-8?B?cmtYUlFTMnpTc2Juc1lRN2IzN3ZtTU5SSjhNS2d3WW9udjMvWlI0NWxiSnRs?=
 =?utf-8?B?cWM5L2Q4bWw2VXZTVUQwNWZKUnFuMjNtU3VndEVIODBzeVRWWllvT1JnQlZj?=
 =?utf-8?B?aGNmMlgvZWtVVlNuUGI3V2VueldLTVBNTnVvc2hZUzFtZHhIWFV5ckNpSnBi?=
 =?utf-8?B?MjNGKzNTMVJqTnE0YkNMMG03SnZPWk5KbmN2UzJDeUc3UlNCR25WdVE2OE9a?=
 =?utf-8?B?UVVadlN3dG8rQlgvUE41SDlUc0phdi9meGlaeWxvS011VktYNEtUZFkzSTI1?=
 =?utf-8?B?cmJIaVFsaENUenZJTElUSHFsSThLcVBKM3pnY1ZqNnIzVE81dzFnR1J0Qjg0?=
 =?utf-8?B?S0FYVHlPNFNmTHV4TnFqQWRZenhORndxLzNzNDlOb252YU1jSTByL20xNHlC?=
 =?utf-8?B?Um5iNFlMeDVOMnBZNWRKbmxXTENUTWVWYlZZWEZpN1hiSFhRMGFKSFRLQUxi?=
 =?utf-8?B?NnNUZVUvc2JraWVBZkFIYUVmKytucXI1em9wZVBuZE5qSTkzRU1tbFJ0d3Vx?=
 =?utf-8?B?azZPWUJBSE5GTE9BSFo4a1BhdmdwWkk3V2lNZ0dscFpPWExZZjRqOEtFRHRO?=
 =?utf-8?B?Uk9Xa1VUUWt4VkU3R2YvdWEzRGR0Smh1UXUzUkFlOTdqTExsUnRGaGNVOWNG?=
 =?utf-8?Q?QH4Ho8n/9qrWB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 23:11:42.6331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8dae12-7c73-4cdb-67f3-08dce0dc14ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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

On 29/9/24 22:30, Yonatan Maman wrote:

> From: Yonatan Maman <Ymaman@Nvidia.com>
>
> This patch series addresses two critical issues in the Nouveau driver related to device channels, error handling and memory leaking.
>
> - Memory Leak in migrate_to_ram - the migrate_to_ram function was identified as leaking memory when a copy push command fails. This results in the function returning a dirty HIGH_USER page, which can expose sensitive information and pose a security risk. To mitigate this vulnerability, the patch ensures that a zero page is allocated for the destination page, thereby preventing memory leaks and enhancing the security of the driver in case of failure.
>
> - Privileged Error in Copy Engine Channel - an error was observed when the nouveau_dmem_copy_one function is executed, leading to a Host Copy Engine Privileged error on channel 1. The patch addresses this by adjusting the Copy Engine channel configuration to permit privileged push commands, thus resolving the error.

Hi Yonatan,

Thanks for these!

For the series: Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

Ben.


>
> Yonatan Maman (2):
>    nouveau/dmem: Fix privileged error in copy engine channel
>    nouveau/dmem: Fix memory leak in `migrate_to_ram` upon copy error
>
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
