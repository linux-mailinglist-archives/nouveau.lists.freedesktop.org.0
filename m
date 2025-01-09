Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AFA06C5F
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2025 04:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA54C10ECCF;
	Thu,  9 Jan 2025 03:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XuTxBujA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDFC10ECCF
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2025 03:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt+YYIIWDZ+rlnEaOavhgl4ixsPE9TYUU9kYq+/MSS3E5xM6p8/afX49qtDQFHIzwsvLAtAW/1Z44aORzVRN8qpqvMKrFIfidUa9Ts0o0n7Xw7pXSgAhltlLc6L8Ry4bgKLOeGo+ntWRmJXVn/YlIEhATnX6g2ozj6jf7kvWAwtQmhMYuAaemMMGeJ+fF7KDmrKQ4OiJDmUenvxkrwOkezz1tMZFxMu4jDCh34oWAMBdGRrkZt+uaIm8g3iC8ZVSWvpVtJgRjmmGuNGyitIVroOgDnclxtz+YrXxD7qSzMjhL6SxZrhgvpx+MifcfEh8DXkNpK2ayyYGiP7iYzVJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvyuKDl2h8zuyeZLPCkAhLBYno30Tny9lsSHCM6nIns=;
 b=duwrB0GJz8vqAYJf3nMugUxojYKvp7DPn4jdnpyxN1E3WxlO9cDYAaxPDtOtNnD7d368kb7EfDyJh6DW4VY3La1T7OVEfljE/0Ryx22/c3Ii9wR/p/9qZ31oJ8LzC/fa5Y1uy/1zC475+pcvXo758xuHG6GWXoLBQ6NbkHrHexJUmhQCx00LXPPXQY3TqQ/2YjZKHK00oX4Rqph/ENbalVu4m/FS88CCvdV3cXqHTWnxbRRCgm31mDE8UHWKlWtAdrxHiNBX8zoVbjmCfnMq39KDWmyfFyjaBGqGKM5QbDINdsyu/XqmfiSH+YJAmOvfPPJ5XwnP2+tVY3CYYYtC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvyuKDl2h8zuyeZLPCkAhLBYno30Tny9lsSHCM6nIns=;
 b=XuTxBujAj7qDGBRHIv2Y6ydVtcAE4sYBa1KatZgiHsQ76XcQOAqHSw+5eyBIrWY8ldy1dYAsGhL94iskYzYEIkCg3AdxSigt9ufbQTFBgzfFbWTBbuRebstPWz5zlsdjaNNlo9RA/9CG23SvHyqe1hHwelcBPQLx4cVqE84HAiSiTWjIJoQPYU7ioymxghKiRZvNrV/SF8iqMCnz3KBv3nxOwvy23Q3FUKEFTeXcCfCOQEReibiAQc9lfW55Y2jqBHkzz6fNEFCuJ0A18Ku+3qXaog36CbgEbNM0Said7GqL+jaDueVvRelRb2dkPQEvUQDO4P9H44mu3lblLAj0WA==
Received: from MW4PR03CA0290.namprd03.prod.outlook.com (2603:10b6:303:b5::25)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 03:41:50 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::7b) by MW4PR03CA0290.outlook.office365.com
 (2603:10b6:303:b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Thu,
 9 Jan 2025 03:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 03:41:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 19:41:37 -0800
Received: from [172.23.93.240] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 19:41:36 -0800
Message-ID: <fbd27ed9-e6ca-4f6e-8dc5-68fb1b8120e0@nvidia.com>
Date: Thu, 9 Jan 2025 13:41:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [drm-misc-next] drm/nouveau: fix kernel-doc comments
To: <nouveau@lists.freedesktop.org>
References: <20250108234329.842256-1-ttabi@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20250108234329.842256-1-ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a02f082-59bf-4994-166a-08dd305f8cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3QyWjVmeEd0WmtVc0lVaW9RSUJ2TmR1R3ZjemlLWkFvbllrUkwrYllsQzRF?=
 =?utf-8?B?Tk05eDU4Y09PWnRwL1hXSTFnYXhFaEJiL0NtdUdmYUNEZU5PRHBCR1pvL0Fq?=
 =?utf-8?B?T1lMazI5dC9haGpJQ2tCRTd6R21Ld005YlNyemFVMkc1WVRVME5LNCtVdEhK?=
 =?utf-8?B?OHhNK25NRzNxb3RWR3lwU21pNXFxcTgzT1VpRmswTTNyN096R05RaXBOdVp0?=
 =?utf-8?B?ZjBYZHRKN083QjVrU3BNUm8zTzdqTXl6UnlnRmgvK1RZVEd1OUNuemk0bTdI?=
 =?utf-8?B?VGM2eER4MWhKeEduaEpiS2pBQmxpakxWYUxkSThJbWYvd1NpdjhxUGplTDR6?=
 =?utf-8?B?K0ZUTjZtTFgvNWlpV0oraGNVV3ptVkZRMlhGMHlBTkJtcXBIY21wTFVTVURH?=
 =?utf-8?B?MXBXZGgzVEdpQWhmNXlobFkzNkkwODNub29yMkJsdU5tWHA2WHBkdTIybi9q?=
 =?utf-8?B?ekgybG85dW0zcGJlazNtMHRwU1NXYXlwTE05Y0drVFlhT3hhTGJFRFRpL20y?=
 =?utf-8?B?MUNMNjVNVFRxZDFoN2hMYXNIN1dWNFdHQzE4ZWV0aHVBUUFMbUNOalJJVDQ1?=
 =?utf-8?B?cU1Ldy85QzhSNlBjbzZJM3hDMHVqRStEeDBPTVJ6dlc1eVFZR0pCZ0lnOU1B?=
 =?utf-8?B?SGRNZTgxU2pQYmt0ZWNjK2swMndNTjNjZWlvYnRwTDVxNG5OcWR0cGp0UWVl?=
 =?utf-8?B?eWt2QzIxWjlzSjBBUHdZOTcwdVM3UHRCajZqenFNMklGSFVTUExRWncybGhi?=
 =?utf-8?B?NDZqSk00REExanZJaWNJMVloUHJKNkM3NUp5THViRzhySGpadkwra2FFRGg2?=
 =?utf-8?B?WmVCRHlBNzlLY2JPSTZ2V1lXc2ZIaWlmQ3doKzlUMDh4eWJsWWtxU3N4dHVY?=
 =?utf-8?B?d3RRK2dmbTFKUnNjVzY1T0cwc3YvYkdEV0dKWlhiTFZkWlk3YWhkeUhUMzYw?=
 =?utf-8?B?Yll3OElhdFNzZk9vVG9hL3dDYi9PR0cwN0pyU04ySDMxQ1JXNDNzclQ5Umk2?=
 =?utf-8?B?cEZ4ZzJkckV3VVlRVEM3Mk9ydG1IMnBWcXZzVWozZ21yOFFFZnJZbEVDc2Ji?=
 =?utf-8?B?MFdBZ1ZZRmhlek55UjdNL29xbXdyNnBJQWxEdGpqMXVvNGJDNUQxTEVMV1Jm?=
 =?utf-8?B?cHlXbmkwTkxPMy9aU2Q5aENiZGxBZEpMNTJYendxcDA2S0hJUEZvOHNZQmRP?=
 =?utf-8?B?SW4xNE1pVEF3ekx4djYrTWxDMmxnd3ZyOXZSa3FtTFNDTHRZTWZPc2NIeUtZ?=
 =?utf-8?B?cXZxV3I1Umd2eXJyREFtL25VRm1XZ0RVYW0rS3BXNDhSbFpRZkpjb1pKaUk0?=
 =?utf-8?B?eXJMbGZWWTFoSFJTQVovVmN6b2N0MkhnTDFwMU1vTmg0WW9meVVHL0Frbzln?=
 =?utf-8?B?NUJIZnhtSlRYd1RiNU42d0tDSnZkcGFiTzlEeEFieWJPaXU5MlVkREV3d2dK?=
 =?utf-8?B?VU1vS2NPWkZwdmt5aEpkdkVjdjhiWThrSCtrdjJ6Q2ZOaWlSdi9xWjk1VTJm?=
 =?utf-8?B?QlhlN3JOTHd1Y3VDT0xLS2JBREJPb1VpSzVNNXBsZy9NY2NrNEpGV1IvYmFK?=
 =?utf-8?B?YTJFVFI5ZDhNdzhyL3paOWZScjFhbFJ2RWJidlFYcmluN0Y5M3QvU2U4VnV3?=
 =?utf-8?B?bGlTWGRVQ2h6bVlua21QSVZZTGpvelc1NHJtT2E1U1J1WWttRFg1bkFZQ21V?=
 =?utf-8?B?VFJLODMrNEk3RVc3QS9jK1ZmdXl5U2M1bnhrSFdKK0Z0MmdjSVFqZnhyT0dm?=
 =?utf-8?B?ZjI5VTFnYmtZemQ3MGJ5QnZoeWpuOEExVVpkOWw2b3E1L20zd1hXRGl6K1dB?=
 =?utf-8?B?eDFqTEhIME1OSXJlVTQxMVdhRFM3Y1hyeUpRNUgva0p0UGVURkdCczJUVzJX?=
 =?utf-8?B?NldJMFFIZUhYK3FMU0JHRVlqUEo4OEkzdnp0N3BNdmpJRHRxM0lUTVZ6MUtx?=
 =?utf-8?B?WFhocEJ5VHBNSmpXU1BEb1hxR2xpdU9nL3loR3QrRUdDdDZVampsN2xoREtN?=
 =?utf-8?Q?CI2A1Sj43kC72rHgFLeAExC6j3eitA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 03:41:50.0505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a02f082-59bf-4994-166a-08dd305f8cf6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829
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

On 9/1/25 09:43, Timur Tabi wrote:

> Fix some malformed kernel-doc comments that were added in a recent commit.
>
> Also, kernel-doc does not support global variables, so change those
> kernel-doc comments into regular comments.
>
> Fixes: 214c9539cf2f ("drm/nouveau: expose GSP-RM logging buffers via debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412310834.jtCJj4oz-lkp@intel.com/
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c          |  2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 21d2d9ca5e85..8c970f018c00 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -118,7 +118,7 @@ static struct drm_driver driver_platform;
>   #ifdef CONFIG_DEBUG_FS
>   struct dentry *nouveau_debugfs_root;
>   
> -/**
> +/*
>    * gsp_logs - list of nvif_log GSP-RM logging buffers
>    *
>    * Head pointer to a a list of nvif_log buffers that is created for each GPU
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 58502102926b..10fe2d15b5ce 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1111,7 +1111,7 @@ enum registry_type {
>   #define REGISTRY_MAX_KEY_LENGTH		64
>   
>   /**
> - * registry_list_entry - linked list member for a registry key/value
> + * struct registry_list_entry - linked list member for a registry key/value
>    * @head: list_head struct
>    * @type: dword, binary, or string
>    * @klen: the length of name of the key
> @@ -1327,7 +1327,7 @@ struct nv_gsp_registry_entries {
>   	u32 value;
>   };
>   
> -/**
> +/*
>    * r535_registry_entries - required registry entries for GSP-RM
>    *
>    * This array lists registry entries that are required for GSP-RM to
> @@ -2101,7 +2101,7 @@ MODULE_PARM_DESC(keep_gsp_logging,
>   #define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
>   
>   /**
> - * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
> + * struct rpc_ucode_libos_print_v1e_08 - RPC payload for libos print buffers
>    * @ucode_eng_desc: the engine descriptor
>    * @libos_print_buf_size: the size of the libos_print_buf[]
>    * @libos_print_buf: the actual buffer
> @@ -2162,7 +2162,7 @@ r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
>   }
>   
>   /**
> - * create_debufgs - create a blob debugfs entry
> + * create_debugfs - create a blob debugfs entry
>    * @gsp: gsp pointer
>    * @name: name of this dentry
>    * @blob: blob wrapper
> @@ -2788,6 +2788,10 @@ static bool is_empty(const struct debugfs_blob_wrapper *b)
>   
>   /**
>    * r535_gsp_copy_log - preserve the logging buffers in a blob
> + * @parent: the top-level dentry for this GPU
> + * @name: name of debugfs entry to create
> + * @s: original wrapper object to copy from
> + * @t: new wrapper object to copy to
>    *
>    * When GSP shuts down, the nvkm_gsp object and all its memory is deleted.
>    * To preserve the logging buffers, the buffers need to be copied, but only
>
> base-commit: 5d40d4fae6f2fb789f48207a9d4772bbee970b5c
> prerequisite-patch-id: dbfbf26b276d26be3dbeec57723c6ac0aec4a102
