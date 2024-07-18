Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F89371A0
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1AF10EB4C;
	Fri, 19 Jul 2024 00:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IJC9gcI3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755F10EB4C
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:50:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTGlt7LvCqdGPGpkMseiy9S1NqYa9G0G3+fEd5NO3wP0kTUqBWj5o154xzV5Oh1+87bXy0itKzXiEOfyKpinS+EiHQo461J1qFn6TRgokYx309Agz24Zhz0V8nkd1Q9V3eRPaYLXFLPJx1LUs/09Dp/JxlcGFhQWh75K/S1Md53rwjo0ZBEPwviVrg+Fb2hidgpZoF1zGPQsHelOGoZd5iV2YbthrhoT8diNQGIgZBG6mYV1uT7QpBlNwVLkzuoSiXbNK6Ivms/YWCMbPyw3n5nQ5+wjc8Vrye11pi/rj1z/0njHk7aBbs9FMjNQPX9J2wqjQwRmFF7qadYMN9BQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR9/t9RQ0+pS+cM1XEbNo4rZM9oZ+OoG5FMVbMpOo28=;
 b=n92i2kvyziV1JZk60zHiFCoV8ZhQJCI/UYqOeCSoId0VhAYicymJJ62dg0iHlgyJsCApsfJjbksSfLW5cVwdUqet9TZzkSraCHvFSVsieMqlf2Cb5Z54yEWhgWmvA6IcKfqGW3GTeZ27FrnXJ9lHwSfr+MbgvFtn6CrSzastox/2EDDHRQOlZ6iAqmBh7bqfqJkj3B6eh5MZqGEMUXJBG4JQBotYrEBfwC/6KlxxSEzXE7ugOOJWhVGDdLp41+k6h4/6KfqLrTG3aHUrFWgLDPgnV/n0nBje7CWr6VkUBX77Y+LCuysfnTDDShU3NDe0LK8KCtoJXrKAF97efkNboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR9/t9RQ0+pS+cM1XEbNo4rZM9oZ+OoG5FMVbMpOo28=;
 b=IJC9gcI352y5jETR0/XShEk87On0Pj7ScDlh3wd4t/Mi9u2SmryoEOiaqLVLI4qqPJeJpdaqhHBeH90VBHsSMxebyEjWI3nmLEeGA6JdMPSB0iklzHORcuXc1q+tW5+ArK8urDvXg33s+5Wq/vGIGhoMQaaVgskIfkOdn1584cZRUAS/Rkht4J9jT/Qiz+FIbb6ltACsbv5CQV+biI238lHwme3Fu8fNXI+0mZ2aG0rP3bzOxhb3eItuUIrO7g8HE3Q+UK/ams8zzih8YvK8vOL6zl1V9vfyHgQo8BVX/we3PvB3+HKxdiGWpUJsvXzVMQDme9WbqMy+D+9NTNsiHQ==
Received: from DM6PR05CA0037.namprd05.prod.outlook.com (2603:10b6:5:335::6) by
 SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 00:50:00 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::c6) by DM6PR05CA0037.outlook.office365.com
 (2603:10b6:5:335::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 00:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:50:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:49:48 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:49:47 -0700
Message-ID: <d3093056-0cb2-438c-a5a2-de7b064e33fc@nvidia.com>
Date: Thu, 18 Jul 2024 18:10:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-29-bskeggs@nvidia.com> <Zo1msLvf2Vfz90Mb@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1msLvf2Vfz90Mb@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b03e98-d53e-4735-6ef8-08dca78cb7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXB4cFdvbnNJeWJIM1RqaTdlbEpaVG9ZdUd1cGVRbVRoelZtWklFaHBFTzJR?=
 =?utf-8?B?LzlVTDBvMUNFYitzTVRUczU3ZW4xZUxGT3ZFR3d0RzA1SkpLT0pGRERvUnlF?=
 =?utf-8?B?cFZMRXB3OFFjdnBSVlhuNkJsTUdsL3BPcGQxdkVTMkp4NjV3S0xWZXU2OHk0?=
 =?utf-8?B?VGNldm1lUW9kSGdjWHJWenNxTU5VU0U4SlRvT0ZSNS9oOGQyRE5XN1pZcTk2?=
 =?utf-8?B?Q0ZJZkVlY3ppdUFkRW9CK2lpamxUL0lub0lKUGxJTnpaUGZlK2M5UmF6Wlh2?=
 =?utf-8?B?eFhER3ZiSjl2L3NhdlNudnp0TE9GQkJSMDNteVBhb3FVRjJlb1IyYmYra2hB?=
 =?utf-8?B?dmFEQnN3QXhEVlFYeFFIRXpkSm15WFkwVVNpbDdWcDJPNE9zdW8rNkFDVSti?=
 =?utf-8?B?c2dMMmkrNXlmcFRyZzkveWwzWFFlcndNWWI2azNrS1lUaUNRSlV5QU5Bc2h5?=
 =?utf-8?B?SDY3ZkRBWE5Oa3k5ZjZvN25ZWnNTSkNrWWtsN0FGZTNlUVZ5UHdNamV3WGE5?=
 =?utf-8?B?T3puaitwQ1FqWXlXSDM1YWI0d2ZSMS83K3NvY0w2T25FRnVzQXU4Y2p5eS9F?=
 =?utf-8?B?c1FlYms5bGVuTHI0YURERW80dlpkcHJEeG5Kam9Tc2VlQWdyM0hWQW5TSjNw?=
 =?utf-8?B?RGNacS9nMG1iL0t1dkFoMzFVbEx4RXUrdS9LTXVlcmdEbFZMaW5VTkRxeDh1?=
 =?utf-8?B?dFp4NVhyenNRSkIxb0ZLOGR3RHAycUNkaGJFdm1Oc3N2Umg2enlwNXpwL3lX?=
 =?utf-8?B?aExrTFo1ejM0UG5ISGpJMHdDaVZZeTBHMTMxczNTTW85TFJTYkpSOGpHWWF1?=
 =?utf-8?B?Q0NwdVJrbXEyamd6OVh6K1NKMGgwUHh1eEIrK1gxVkNNZjkrSkZUME9lQURU?=
 =?utf-8?B?eTlPdlF6d0ZsWEdPWWtaKzgxOFhNTExiS3J3YXVXakRIY2ZjUm45R0ZVRUp6?=
 =?utf-8?B?dFhCeG8xdmRJUHJiZndzWlFTOU9jaDF3ZHE5ZnNsdFdlWHR4Ry9LNE5WOXNC?=
 =?utf-8?B?bjFWKytKbHBZWUVrWVBWcDhRL0lWbllwU1NHeDZTcnRLUGsvb05qayt6SDJt?=
 =?utf-8?B?RFJXbk1UeFRpaUVJU1FPNTBXaGFvTzJCZjkvZ055RnN6UldXbHNVMzNseCtw?=
 =?utf-8?B?NEgycHJoMWRkZ2lYWXV1aXo1bENoeDRHVzJmd2hhNDdpbEl0dENiaE1OQWN4?=
 =?utf-8?B?TG5RWU1MV05RbzZISEVQcEpMODNJQ0NSN1d0aVUrR2JQb2VwMXFjandNN3Fq?=
 =?utf-8?B?WUVuY3FCTkRUVFNQQ1dpVmpnMXhMb01VWGw3NERCcm9PaThralU3SzU0MHVq?=
 =?utf-8?B?V3ZKUmNCWmpHb2RQejIxTWR6WkdSdDVnT3VKTFluS3BzdFBjZklRYy9hcUZT?=
 =?utf-8?B?NVY4Z09sS2UyUlRLZ056NjVnNnFJMEZhb0RFTkVIRnQ3RHBzbnJ2NGV3TTRE?=
 =?utf-8?B?TEQ1WDRTQXNpakl6STFuZ1NBMVRlRWU2QVJINHpRRzdrL2lrZTF1Yjljall1?=
 =?utf-8?B?Q1J2bTJtWmNmWDhnQW51dFRwTk1QYnBpeU8vTzZqRk1OTCtTSXlobzAwMVVS?=
 =?utf-8?B?eEd3Nit2Tytjd1NsWmkvaDFZN0ZNY3ZkYnQ1enBkSDJWdjQ3TGk4dU0xT2Rz?=
 =?utf-8?B?bDIwZlVpYzh2cnJNdURMejYxUmZEVmVhRC9zS1IxRlBBdUhyeHJHcmN4aW5a?=
 =?utf-8?B?aTFFZDJURFdmeE81ZHVoQ0VqNkZhU2NWUFljcEd1aTYxV21paGNyWlhjckRO?=
 =?utf-8?B?cC9SVGhnVFdvSXd6ZlNFamdiazFVTk4rNndTYS9OdTh2d0RiN2lvZUIyaHor?=
 =?utf-8?B?VExscFFJUFZRMUo4dmNRdGV0ZW5hRE50N0huVG9kZU9jVy9YOCtjcmZic0VU?=
 =?utf-8?B?WldxN0RCMTZ0ZldLd1pBSDFjOHYyb3BMeUUxVGVlTVJPeEwzcklBTnQ5QXk4?=
 =?utf-8?Q?Wj1qpm3sNorlxLRTf2kJQhu5YYiaw1l8?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:50:00.0994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b03e98-d53e-4735-6ef8-08dca78cb7e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
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

On 10/7/24 02:34, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:37:12AM +1000, Ben Skeggs wrote:
>> This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
>> backend memory allocations instead of nouveau_drm.master.mmu,
>> which will be removed in a later commit.
> It would be good to make clear that this is part of a couple of commits that aim
> at removing nouveau_drm::master.

Nearly the entire series relates to that in some manner. Nevertheless, 
I've slightly reworded the commit message.

>
> Also, can we get all related commits a bit closer to each other?

They basically are.  Only a handful of commits could likely be moved 
around safely, and not in any way that'd result in any kind of perfect 
ordering like you're asking for.  It also invalidates the testing I've 
done to ensure things are bisectable.

>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 35 ++++++++++++++++-----------
>>   drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>>   3 files changed, 28 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 5ff116bcbabf..07748cfab233 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -227,13 +227,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   		{}
>>   	};
>>   	static const struct nvif_mclass
>> -	mmus[] = {
>> -		{ NVIF_CLASS_MMU_GF100, -1 },
>> -		{ NVIF_CLASS_MMU_NV50 , -1 },
>> -		{ NVIF_CLASS_MMU_NV04 , -1 },
>> -		{}
>> -	};
>> -	static const struct nvif_mclass
>>   	vmms[] = {
>>   		{ NVIF_CLASS_VMM_GP100, -1 },
>>   		{ NVIF_CLASS_VMM_GM200, -1 },
>> @@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   
>>   	cli->device.object.map.ptr = drm->device.object.map.ptr;
>>   
>> -	ret = nvif_mclass(&cli->device.object, mmus);
>> -	if (ret < 0) {
>> -		NV_PRINTK(err, cli, "No supported MMU class\n");
>> -		goto done;
>> -	}
>> -
>> -	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", mmus[ret].oclass,
>> +	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
>>   			    &cli->mmu);
>>   	if (ret) {
>>   		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
>> @@ -717,6 +704,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>>   	if (drm->dev)
>>   		drm_dev_put(drm->dev);
>>   
>> +	nvif_mmu_dtor(&drm->mmu);
>>   	nvif_device_dtor(&drm->device);
>>   	nvif_client_dtor(&drm->master.base);
>>   	nvif_parent_dtor(&drm->parent);
>> @@ -728,6 +716,13 @@ static struct nouveau_drm *
>>   nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
>>   		       struct nvkm_device *device)
>>   {
>> +	static const struct nvif_mclass
>> +	mmus[] = {
>> +		{ NVIF_CLASS_MMU_GF100, -1 },
>> +		{ NVIF_CLASS_MMU_NV50 , -1 },
>> +		{ NVIF_CLASS_MMU_NV04 , -1 },
>> +		{}
>> +	};
>>   	struct nouveau_drm *drm;
>>   	int ret;
>>   
>> @@ -757,6 +752,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>>   		goto done;
>>   	}
>>   
>> +	ret = nvif_mclass(&drm->device.object, mmus);
>> +	if (ret < 0) {
>> +		NV_ERROR(drm, "No supported MMU class\n");
>> +		goto done;
>> +	}
>> +
>> +	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
>> +	if (ret) {
>> +		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
>> +		goto done;
>> +	}
>> +
>>   	drm->dev = drm_dev_alloc(drm_driver, parent);
>>   	if (IS_ERR(drm->dev)) {
>>   		ret = PTR_ERR(drm->dev);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> index a9e0a63c772e..2535a50b99f3 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> @@ -204,6 +204,7 @@ struct nouveau_drm {
>>   	struct nvkm_device *nvkm;
>>   	struct nvif_parent parent;
>>   	struct nvif_device device;
>> +	struct nvif_mmu mmu;
>>   
>>   	struct nouveau_cli master;
>>   	struct nouveau_cli client;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> index 25f31d5169e5..67f93cf753ba 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> @@ -91,7 +91,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>>   	struct nouveau_mem *mem = nouveau_mem(reg);
>>   	struct nouveau_cli *cli = mem->cli;
>>   	struct nouveau_drm *drm = cli->drm;
>> -	struct nvif_mmu *mmu = &cli->mmu;
>> +	struct nvif_mmu *mmu = &drm->mmu;
>>   	struct nvif_mem_ram_v0 args = {};
>>   	u8 type;
>>   	int ret;
>> @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>>   		args.dma = tt->dma_address;
>>   
>>   	mutex_lock(&drm->master.lock);
>> -	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
>> +	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
>>   				 reg->size,
>>   				 &args, sizeof(args), &mem->mem);
>>   	mutex_unlock(&drm->master.lock);
>> @@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>>   	struct nouveau_mem *mem = nouveau_mem(reg);
>>   	struct nouveau_cli *cli = mem->cli;
>>   	struct nouveau_drm *drm = cli->drm;
>> -	struct nvif_mmu *mmu = &cli->mmu;
>> +	struct nvif_mmu *mmu = &drm->mmu;
>>   	u64 size = ALIGN(reg->size, 1 << page);
>>   	int ret;
>>   
>>   	mutex_lock(&drm->master.lock);
>> -	switch (cli->mem->oclass) {
>> +	switch (mmu->mem) {
>>   	case NVIF_CLASS_MEM_GF100:
>> -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
>> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>>   					 drm->ttm.type_vram, page, size,
>>   					 &(struct gf100_mem_v0) {
>>   						.contig = contig,
>> @@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>>   					 &mem->mem);
>>   		break;
>>   	case NVIF_CLASS_MEM_NV50:
>> -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
>> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>>   					 drm->ttm.type_vram, page, size,
>>   					 &(struct nv50_mem_v0) {
>>   						.bankswz = mmu->kind[mem->kind] == 2,
>> -- 
>> 2.45.1
>>
