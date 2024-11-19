Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0D9D2FF6
	for <lists+nouveau@lfdr.de>; Tue, 19 Nov 2024 22:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5D10E360;
	Tue, 19 Nov 2024 21:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zz8mArkH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EB710E360
 for <nouveau@lists.freedesktop.org>; Tue, 19 Nov 2024 21:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Enpky8QRDA7M2t3cfAFG8CXjArSIvoJEJYMp6/Gue2nm99b0z1kdLPWIWpFrhsoZVKg5TCcxNWyJWuzQMzyLNPZbfVYuU8+mPOKUe08LVYQKA5IbOmV61bh7yq6BPUghhm9lHGsD9Mb9gEbYqXUYEI3DCZyP8UPlsE080JPD29e27AS+Bq9ZGqxfY94a7VKTDZVP94ouDhzwsKLdWyzB0NXhm66NxiVPGLK8/dwiShQlTRU3BUI7LYfsLQ8a1XrQbe1u67ZlrrGmzFkqAoGD6NrX1fLKByB9CeyYadWC5bBhcm2LJAmicxG8hmdYIlXe0iz+YbqpBYQOlqq5gNLjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nml330ASmhI5MjeXJ1iak7o5WtH68Js5fMKOf4KnJXc=;
 b=aOV4sbfZnvMqx6KtEXnosP8YRWPHiH2Ocnst3ePPAXtF7Qiwvl09za90mqjmrdIEhkVDGF61e2dSEhyIJsX3zEhDv7tjtaeQWVXMpjFtz0XMVfGR1vY8IYNj4OaFc6v5Uv9j6CtIE/mZZxOqnoaFFz79CmB8PFK0Yb688rnt7KJOtcobeuLkjH/WT1uCwQ9KFrjfb7PG+oN1xXLYbedDZaLis5S9gSgFb+5fpKkUKsAUuOVehZBq/fzXC598t7ofUkUhmOUzOQnnJ4Qnd5oG4q9dUEiIxdxauzZmpclaIwr9eGnpkr6yLkCAiUnV0U4x6FqmMKiHpgMD9LIJwi9qqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nml330ASmhI5MjeXJ1iak7o5WtH68Js5fMKOf4KnJXc=;
 b=Zz8mArkH2c7uhwgyn5gAhWSoNDril4MHNwDyi/F+Aubv/AA47QA/kh/N7OmRTuxoncRuQwmQcfw+TToH5hf6d7VzGvTh5EEhnq7NNvTObiMeUmsqLyIczsxNAyP1n2I3wbnetfamX7VlvQJJ3atnX0QHWMnIKrOX5fQY6v0tFZgN1Mw/a6YwAj4iH2xtBfGcFAvHgzrPlkCBFENJMhZUpkno3emEslhhMud+zIagocdVCtME9ZDL9AyG5Wg9uqkZVV9pmSn3rK3RJINCX2cc/oK/TZsbDxxjeebXwvp8Hrg7JxcsmiKpDLaKH7ZE3fLIeQrQKgOLPyb2bcJOV7U4CA==
Received: from CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::34)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 21:19:06 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:116:cafe::13) by CH0P223CA0016.outlook.office365.com
 (2603:10b6:610:116::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend Transport; Tue,
 19 Nov 2024 21:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.0 via Frontend Transport; Tue, 19 Nov 2024 21:19:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:18:52 -0800
Received: from [172.20.206.173] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:18:51 -0800
Message-ID: <99502728-807d-4574-9e5a-247de5e1faab@nvidia.com>
Date: Wed, 20 Nov 2024 07:18:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nouveau: handle EBUSY and EAGAIN for GSP aux errors.
To: <nouveau@lists.freedesktop.org>
References: <20241111034126.2028401-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20241111034126.2028401-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 53481973-df1b-497b-4bb1-08dd08dfccc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VldodDEvWVlCZXU3M2w5ZDFuL2s5WmdLaGlPWURmc3FxOUp5aFBHN3hDZm9k?=
 =?utf-8?B?ZDYyR2JybGplWktoSmFjUkpmam5wZCtRd1piMVNMUnd4bUZDbHFnWVNISmo2?=
 =?utf-8?B?ZUVlTExLVlN6ZThNS3M4WDlmaHNkOFIxZFRCeHJGaENxZi9jeVRRaW1JbmQ0?=
 =?utf-8?B?VWxxZEJIYndwODBzaHUzdnd6Y2V1Z0xvdWVmd3cyMXFNOXhZL043cGp4elpo?=
 =?utf-8?B?b2s4dldFYkl3QTlmQndSS3FIck1ObXdROUFWRzZVYjRpdEtxUW1sVkVoOU5I?=
 =?utf-8?B?alpHanZMZUFnck1lL2lnb3FMUnEvN1dxbUNhSWdDUHIwZEM2S1UxaXJLdFp6?=
 =?utf-8?B?TnVjRTJ2bkhMT0lieXhtcDFUdzVTYzlWUWEyWVI0UTRiMG5oZFZpS1U0Q3dx?=
 =?utf-8?B?L1hZclBJRFB6YkxHeW9ka29QdnhnZW94Z3U4UzZRdml0V3ljK25pUUIwbW5Q?=
 =?utf-8?B?RTZiRUtmd1dCMjh0M0JweStuNXo2WURPbFdmZ0xkS0xHNmlkaDZzSlRBUldq?=
 =?utf-8?B?SzU3R0s4VjliZE12STd2blFUa3ZhVnViT1FVVksxZlJLazFJYjBBR0tVUXUr?=
 =?utf-8?B?WENBU0pBMjhaMlBkN2xHYnU2ckdjWjkvZDZoNHNJNXk1VmtscHgyRi80MmhV?=
 =?utf-8?B?WUEvNXptbzVlRGJPRUJXSXB2OTlac1ZtS3lhNjZXZUZUS1k1SW9CR0ZEd3Vx?=
 =?utf-8?B?bEhaTEt1bi8yZ1p5Y1ZCLzZFQzI1YzJGQ0ZJMDNrYzdIT1JaMEV2MHl5dmI2?=
 =?utf-8?B?WERDWGxmRkpUZlZaQmxmTWFadlRESzBhR2JNME56SkpwNEdaVzYvSmp6VHJN?=
 =?utf-8?B?bDBQMWpGN3hzN2V2MCs2eGJ5eG5sMGIyZW81V25FdFlURk1USWd4VFIzYlNY?=
 =?utf-8?B?NFNRcE9hckpnQWtxWTVnOWptdU5pZHZOZlR0TEJYaEdWb25ZK2ZIajFONHhM?=
 =?utf-8?B?d3NQSjF4MWpYeWxRUDNUODU2dzkrRWZSNy9oZGVEK3F0VHFZOUlzSnNBUlNB?=
 =?utf-8?B?R0thMFU4ZnFPbWN5RFJSSG9wd2ZlUkFxOWxuSTlNWFhVbXRKVU50b3pxZ3ZI?=
 =?utf-8?B?WTdCT1lyQm9iaXlBeENXQ3VkNmdQSjY5VTdzd2diTGVpTEdBVktKSXZZaGZY?=
 =?utf-8?B?cllwcUpvUk9aVzl1RC90UXI5UW5WUk10US9QdXN5QUQzZTMrU2sySEhNSDN3?=
 =?utf-8?B?K3NCN2h1ejE4R05TWkZxV2JWN3ArcE5ibDJRNXY1c0N1UzFsRkhDVEZjS0Vo?=
 =?utf-8?B?d3dCWXNrOHVTRmlGeDNFYUtOUG9yWEVIeGovU1h0V1JiRmt5UWJ3UzUra1c5?=
 =?utf-8?B?RzhFUkN5TFBZRGZoQVg4WVdETU95Uyt1RU4zSURnUnprOUFua2JQNXpVWTlw?=
 =?utf-8?B?eGRldHdRUEJrVThjS0ZwLzNsbkc1eHFKUEI5YzZsS21Fd3UwRVQ2WnpzK01k?=
 =?utf-8?B?RXhYSkZRS3lrME1Lc1oydU1FVmJDNkVEVGZ3TU1IRVVMcG9jNGJ3NnErb3Uv?=
 =?utf-8?B?azNucllXb1FpZUVSSjdOSFdDWXp4ZXd0V01ZTDZDT1lsOHcwcWd6OWd2cGRO?=
 =?utf-8?B?NmRoYmZWbzAybUtwTWwxK2d2V3pINjUxNFFBT21QTnIvb1F5djZINXV1V0ho?=
 =?utf-8?B?QjQwL0dEYm5iZE9SbEhPdmVvZjFwWkVEdDJZWGVqRnQ3bmpqbmkwUkQrN25U?=
 =?utf-8?B?bGlJOVVNemxaMUU5cGNmRTdMZWNhRm1DVkNIcnlrZkw1Y1QvaGpvaXBobWpQ?=
 =?utf-8?B?VlFCMUhXY0hqSFdNdDQxVkJPRG8yRFFmS3oyWm90MTM1RVVlY3oyT242SUlk?=
 =?utf-8?B?VjBvSmNLM29ITjlBTks3ZlFrdGYrSUZVU09KcUJISDBuTTNKYmlIcU1ZUk9a?=
 =?utf-8?B?N0dkYjFUUjlrL04yRDFwLzVuaXRIRGdTTkFDQ0FsZzR5TlE9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:19:06.0839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53481973-df1b-497b-4bb1-08dd08dfccc3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
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

On 11/11/24 13:41, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> The upper layer transfer functions expect EBUSY as a return
> for when retries should be done.
>
> Fix the AUX error translation, but also check for both errors
> in a few places.
>
> Fixes: eb284f4b3781 ("drm/nouveau/dp: Honor GSP link training retry timeouts")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> index 027867c2a8c5..8f9aa3463c3c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> @@ -992,7 +992,7 @@ r535_dp_train_target(struct nvkm_outp *outp, u8 target, bool mst, u8 link_nr, u8
>   		ctrl->data = data;
>   
>   		ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
> -		if (ret == -EAGAIN && ctrl->retryTimeMs) {
> +		if ((ret == -EAGAIN || ret == -EBUSY) && ctrl->retryTimeMs) {

You can remove handling of -EAGAIN here (and the cases below), as 
nothing can return it after the change to r535_rpc_status_to_errno() in 
this commit.

>   			/*
>   			 * Device (likely an eDP panel) isn't ready yet, wait for the time specified
>   			 * by GSP before retrying again
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index cf58f9da9139..d586aea30898 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -78,7 +78,7 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
>   	switch (rpc_status) {
>   	case 0x55: /* NV_ERR_NOT_READY */
>   	case 0x66: /* NV_ERR_TIMEOUT_RETRY */
> -		return -EAGAIN;
> +		return -EBUSY;
>   	case 0x51: /* NV_ERR_NO_MEMORY */
>   		return -ENOMEM;
>   	default:
> @@ -601,7 +601,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
>   
>   	if (rpc->status) {
>   		ret = ERR_PTR(r535_rpc_status_to_errno(rpc->status));
> -		if (PTR_ERR(ret) != -EAGAIN)
> +		if (PTR_ERR(ret) != -EAGAIN && PTR_ERR(ret) != -EBUSY)
>   			nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
>   	} else {
>   		ret = repc ? rpc->params : NULL;
> @@ -660,7 +660,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
>   
>   	if (rpc->status) {
>   		ret = r535_rpc_status_to_errno(rpc->status);
> -		if (ret != -EAGAIN)
> +		if (ret != -EAGAIN && ret != -EBUSY)
>   			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
>   				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
>   	}
