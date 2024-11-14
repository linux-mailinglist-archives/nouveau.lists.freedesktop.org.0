Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AEE9C7FBF
	for <lists+nouveau@lfdr.de>; Thu, 14 Nov 2024 02:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8010E790;
	Thu, 14 Nov 2024 01:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qaWhMgrL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EFC10E790
 for <nouveau@lists.freedesktop.org>; Thu, 14 Nov 2024 01:10:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yorhIg94UQ5a7bXJQ+JDBP1y4ICHARr0+cg1JoQbCrM3az+5+fRhc52hF1fcP9USI+xFCpuUmRZDotc3MvuOhymLF2pJPxpGbYKyuvYNqOJ3x4YORSJlO+OFSup+YnSptI0u8yNMdXyi/dLa8ECcbV3jX3KgmlP9c7VqgkulSnyQlrPdVf+YaksFqd/SeILG9ocR0Fx1Qd+xyUI5Amh4VVBDS+gXdd28KGU0kaEaeK9J7kW39kXvlcvtzOKKLjA0B3DWsthNeoJAYORU89+Mqq/ZiXVitaqCIhzH5JldGxjvTygsezsyToxthfqav5yFmWpWsAkFWZzgfCk0izyctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vopJbw9/UC2dZxkJm8uowAh0X2ht5sxHHlKsgfte9Rw=;
 b=aJvvmRoBhUQAZUsfak3npFlyWgEouYHyVNPD4W3OsxOes+RhkUFex5LARMLbxlNn9B8KV0XMMlLj653Y3BJJkZKjAcXyf5gqjKCiYRWXfRs7FHJXYypNKOXJF6MYpSoEhkfi9uzqxsGVtXKLAQxi7X54HNJ/LR1+fFAicSFUwL4S52xTDd03E5+gQBJEAjmZPot8DhE+1UNJX5yfD4d2N/DvaJYEtFzMGXPWSH7TU8e2nT5jZVFjFIAW/UUWXrKIOUV74pWeWqkQq16hDEJgIyBBW+ni2qY1CLgrfczT+57J91NPcAgcbMAhwgEgeBsD0n3izyQ70lIh8534sYpUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vopJbw9/UC2dZxkJm8uowAh0X2ht5sxHHlKsgfte9Rw=;
 b=qaWhMgrLs4vGQg/Ji0F4ATj5JuVfPQCkh9OlFLmYYf1z/DkdcPXqUvubWu3QgbX90HptwWswnArgFcaKCXPaxG3yPHjH2sNUxAD1R3jYugzE0Vpq1+gCt80lC1aRklFyZTKGHQkx+yUxbqJFgXTGQjztOfgIitqUIn6/c2A4Cha1A3U6hXvNmbhXrXdsSQKkDmLNYE8rMk0un+wSTUcgL/zH1tIntptucKmijEsU4vP2Q5hfl318DF71TfIf6yEw2r826Uz99eoZ6V+OWFO0HTU63B2MNF+QX9XCO4HrQsC5crIn9E1e1nY6shEsnzMk+5L3EqoVZD8a4DM9lkZK8Q==
Received: from BN9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::6)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 01:10:24 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::e7) by BN9P221CA0013.outlook.office365.com
 (2603:10b6:408:10a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 01:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 01:10:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 17:10:07 -0800
Received: from [172.24.65.39] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 17:10:06 -0800
Message-ID: <b979a2ac-ac2d-4dc5-b791-dcd380dbeffd@nvidia.com>
Date: Thu, 14 Nov 2024 11:10:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fw: sync dma after setup is called.
To: <nouveau@lists.freedesktop.org>
References: <20241114004603.3095485-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20241114004603.3095485-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c6ca25-c53f-451a-2681-08dd04491e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm8xNWd3dzVEVFJud3hZOGV5TmdlSlY3UVI1ZWxrVWpyMUpneFNzNUpuZTV2?=
 =?utf-8?B?ZDB0TmxnYWVmSW5MU1RaMmtFaHVSdXRycmRtWkhPeGZNQ0lHR0tqeElGbXk2?=
 =?utf-8?B?SVRFampoUC9FYnVlMWQvWnBtOGlLMzJBTk5zWVl1ZjNXVTViV2lJZis3TG5z?=
 =?utf-8?B?SUhZRERjTHA4WGR3YUtRYVlPRjY0ODBuclZ1VGpOL0cyMkRaSUxXT0tEUXAr?=
 =?utf-8?B?cElYelFSTUJNQWwvY1E5QnVUbmdZdzNNV0p0KzRRU3ZzS1VoRzErUGhhRVJQ?=
 =?utf-8?B?MDloT0MrS2tGNDlBdjlEeTl1ekh0VEZXNjNxNDExWE1LYnJpQWR0cmZKNEtv?=
 =?utf-8?B?bysrT1hleHdtMjZYZWFBT3FFQzJXamJtODdtM2p2L2VyckJjVUFYUDFjWThO?=
 =?utf-8?B?eXA1N21hdlBFa1Boc2pkbXQ5WmpMMmhVOXgzc3BTOWtzazBUcG9vNU4vL1dI?=
 =?utf-8?B?Z0tKTEpjajExMU1sYmJyR2QyN0RxbnpPTjhnSWg4VGRFOUJqd1htVUd0RjNq?=
 =?utf-8?B?STZuUnBvSDFVc1BkSFZVNE12MEZWTkd1ZTJ5VzcrcUtZN2NvTkIzRTg4ZmN4?=
 =?utf-8?B?ZXRMTE8wQmhsUmZOKzhNVGhhL0VtOTdPQWVMc3JnSGFYTWJrQzJWblVIYlQ2?=
 =?utf-8?B?OTN5UHNhcTFkd3BURTJCRFAyZlFqUTY2L0txY25RNGtXaHVzZHE4U2xsOTFa?=
 =?utf-8?B?cDlHakdzSkUvdEVhL0pDbEZueUJyQWxjQytybUdTQkwyOTIxY1NwRkpMT3Iz?=
 =?utf-8?B?TFR6dGxyN3k5WlQ1L1o2ZHJrall5ZFQ3Y3NuaDVEdWVEOUY0NkhMWTQ2Tmw1?=
 =?utf-8?B?Sll5WkU5bkppR0dmVU9kOXorNnFkUWVOK29JTTRUUTVwVkF4SkF6N0g4V1li?=
 =?utf-8?B?dVVRanRtaGpnUlZPZElVc3Y5NFBUelM2WHFRY2ttN0ZxOGM5Vnl5YmtnVktN?=
 =?utf-8?B?RnRuR3JzU1NaYzNpRENZaGg3K01YdldadGJYV08venZ4YjQvRllPTFV6S2w0?=
 =?utf-8?B?aXdhMjZKVVgzRHQzeGtzZmZhbUxLM3NpWjNLWDhiaGxxdCtIN2d4ZzZaT0Yz?=
 =?utf-8?B?TEdYUE5POGpaSktrM1pBOXF0aXY3bDVrb2MrdExtY014bVJlWE5weEE1cDFi?=
 =?utf-8?B?UXlUN2JVQ1hpRjgvdmhRcVNBVzhCekZuOTNnRHBPODRmeVdRclVSUFlnNHFY?=
 =?utf-8?B?cXF1ZTdBOFEwU2FCSDRDbDNsRy9FUDVRdStlcWduS2FMekg1dXlzZTR5MVp6?=
 =?utf-8?B?cTM2eDNDOS8xeEYxaExwenJPSUZGdllqK2tPU0dxSUhtTDg5OFRYV1hXM3FB?=
 =?utf-8?B?clJ6Sk5TbmJNSzVZVXN4d2MyNGhsdFUrS0I1TDNlSHdUZTY2QVFINUxvMUJa?=
 =?utf-8?B?dTVYeXdlNWFHYVJOT0hGMHdJUyt6N2hCUDJJUkVwVU8wTlhTUUxlaTJicFJC?=
 =?utf-8?B?SnNQZzhQTTc0VlF3TXVlNURpNUlhbTNOMUpBWk5oTm1tTE12KzRkd2lTOGwv?=
 =?utf-8?B?YlJwZllXL2lBTW1uRndGQWdDcURFdVhTTXViZ1RmRHJkcjNlcis4aFhhQUM5?=
 =?utf-8?B?bmRiYzdacmE2RXdabGowY3d3ejF1SWRxWTl2RksrVUtHVVFHOFFtOElKY3Vr?=
 =?utf-8?B?YytXSGNBdGVJTXRCNXZ5Wnl0Ykp0dDFYeGxSMzNjbkRmUjBncjAxZVM0cGx5?=
 =?utf-8?B?UFBmdlhQQ2pIU2pYT3VaVkwveXVLeUd6VzNVczhVMStIK3RqUWs2cCtoNlpn?=
 =?utf-8?B?d1hQc3g1QWlWR240dkk1MTNYVkQ3aFZMTVpWQmJUUkRsUEJ4UytqaldvbkJ2?=
 =?utf-8?B?SVNTKzR2MDIyTHg5d1k1cDZaMU5NelArWXgzRWx5enBRdSt5SVNWM3N6VkU1?=
 =?utf-8?B?WCs4aUs4V2hqckR6TVZhZHVNSy84MFRhNnFiUWlnbTRMR1E9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 01:10:23.8601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c6ca25-c53f-451a-2681-08dd04491e1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
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

On 14/11/24 10:46, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> When this code moved to non-coherent allocator the sync was put too
> early for some firmwares which called the setup function, move the
> sync down after the setup function.
>
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Fixes: 9b340aeb26d5 ("nouveau/firmware: use dma non-coherent allocator")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> index a1c8545f1249..cac6d64ab67d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> @@ -89,11 +89,6 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nvkm_subdev *user,
>   		nvkm_falcon_fw_dtor_sigs(fw);
>   	}
>   
> -	/* after last write to the img, sync dma mappings */
> -	dma_sync_single_for_device(fw->fw.device->dev,
> -				   fw->fw.phys,
> -				   sg_dma_len(&fw->fw.mem.sgl),
> -				   DMA_TO_DEVICE);
>   
>   	FLCNFW_DBG(fw, "resetting");
>   	fw->func->reset(fw);
> @@ -105,6 +100,12 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nvkm_subdev *user,
>   			goto done;
>   	}
>   
> +	/* after last write to the img, sync dma mappings */
> +	dma_sync_single_for_device(fw->fw.device->dev,
> +				   fw->fw.phys,
> +				   sg_dma_len(&fw->fw.mem.sgl),
> +				   DMA_TO_DEVICE);
> +
>   	ret = fw->func->load(fw);
>   	if (ret)
>   		goto done;
