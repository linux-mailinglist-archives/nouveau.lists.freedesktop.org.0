Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4CF937187
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3D10EB48;
	Fri, 19 Jul 2024 00:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+66GUVz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E17910EB48
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXDXqZdHgcGRdgynExKOSQpXNQW/5inHWVyQ3tK+NYN8YazN0ysLrsQKBm62Kj4yGlNQOJWxUWKVmk+/HXHsfFtUea/cuZpNSCMcWbzr5icKy9qVRppUyHnCMj/rrQJrNOOBaP1PIkq6Rm4RkC7inVOI7/JGaftSNPT4HkKjApA2RntAhirdMexm8KsY+M1CcmrOUCgHvAkPwc0Tpo2cmLcsgiJiiU1nkJYV4xsqhiFDusoukh+/V5mHA45GIVGGUTL/eXl5tpBu4V4f3khJWLNiGEOk9dbpq2fcIzLg7Cbs60XbwfnCf4XgCMTdpI/0UX/OfVXPqEPIQRFcokSvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50uQ47FNdtyEH1vuAy19O/Yfh3OG8za/f6d+M1rt3aw=;
 b=fbgkWMEK/CEfrNfhKCieCrBStfLHBjYTnkVk0j/QfLS9Yb4htU/hRgcYtDuV5JHIwJR1MpRIhLV8/Q3qSG6STBhL9mVNXwhPLt9kvonqouLMSphOJffSgB4rK2mYUWs/axeR6oOzXsuLWar9lwIkZkArhl5ZnXeflciIREAAre5hb3oKUAHgx1A++1AZ312KX8v2DFbSiWrJwPIaOnw7YnyYTdsHBjFcNB+FhlrH0P5LQv+GwsAQjQ1ebdErAbDlq6N8pE5tBeNBm3eMkbhGLJf6e9Pw51Rt0r0jY6oQvtCJqGXKRmc7Uvd58zfR5XMsyY1Ok/v1EltOuO/mAfdm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50uQ47FNdtyEH1vuAy19O/Yfh3OG8za/f6d+M1rt3aw=;
 b=r+66GUVz+ZTtTWLgDhijt5Y2gAD57UjDKTNRlhwHICys0SortXRjKTYgCXFQypdruOZzV4mEu4x6o38O22z/yBHq6KRVLynx3O9MqEszTf1bmds8qCj4IUdAU6es42LIGbhV/nQKX0ETzn66Cwnsabo1fWhXqjru7SipU+6MettchLVgYL+5SVGHACLBY5CHUNipaT28wb8cMbDSIJQsHkNh2ngFIhckrxRLMJoYjyIiMEkIbEoqfXxzS35bGPl2s8sWSSMmvLykKx76qWr9lGKa7jzMVPNpk4TjnDP7/D/FUfKVt6l5vssj8s7l7/WLvpBIe0XEVn0HRvKxqoDKDQ==
Received: from DM5PR07CA0064.namprd07.prod.outlook.com (2603:10b6:4:ad::29) by
 MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 00:32:17 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:4:ad:cafe::db) by DM5PR07CA0064.outlook.office365.com
 (2603:10b6:4:ad::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Fri, 19 Jul 2024 00:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:32:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:32:03 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:32:02 -0700
Message-ID: <839e9000-aa4e-4879-aa0d-6c17fd19699c@nvidia.com>
Date: Thu, 18 Jul 2024 17:52:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/37] drm/nouveau/nvif: remove route/token
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-16-bskeggs@nvidia.com> <Zo1hKGEajZJLzeAy@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1hKGEajZJLzeAy@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 427ed061-e44f-45e4-96e6-08dca78a3e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUE3YlN6d20vV3FFTldiczhLNVhQNE5wZWJOa1htblF2YjhFMXpSRDM0UkNw?=
 =?utf-8?B?blMrd1c0dEJ5UzFRenBEK2t0NUU5NlFtS1FQRERKa1BGanhBYm1QUFh5RFk3?=
 =?utf-8?B?dk9rUFk1dHlZRkdkazVOakV5T09CdXVyaWFVeFFoNEx5TFdFRldTTGtZT1h3?=
 =?utf-8?B?Q2RGMkxWeDlRS1B0Y2ErU0xMejdWY0twSzFhKzZNVzVsM056NEZnK1J5TVl4?=
 =?utf-8?B?QjlzYk5WbXA0N0pOM2JweS9xbTE3NEEra0pDS2NsYVdWNTZVVDZ1QkVvQ1li?=
 =?utf-8?B?aG1uY1NBVmZ2blhTMEhTT25GNXVSL1ZIMXA1OXluNFE5NWNxajV3bjQyS2pq?=
 =?utf-8?B?TGtLMEpmSFBmeWFabHRqcXh6MHZSaGdYbmlLVmhQZGpXZHczRkpSSGd6a0p6?=
 =?utf-8?B?NVkrL1V0bUw2WXJYeGNXaU5VMlVablBLTEpPaDFHQjN5SVhxWVgrOWliZnk2?=
 =?utf-8?B?eFJNREFNVjVJTmZQVm9ZbjByZnlqYlJDajJsL3JTbGNkSWF4b1htNllkWEhW?=
 =?utf-8?B?ZmJBT1ZlOGlWYmlyTWQwT2J6Wmd0YjZvZUNHUzZUVC9tSXNZYnhiTnUwb0VJ?=
 =?utf-8?B?bEx2bFZDN0tLT2JKVTBxR2JkQnlheVdQVDlFczhpYkxSdm9jZjlmaVpzcFNB?=
 =?utf-8?B?Z0hBNVZYQTVqQlczZmhjUjl1V2oxQ0pUeGkybHpBU1h3RzU5eEdPRkI0OGFB?=
 =?utf-8?B?S3NyZ0UrQm5ZTXlheWZrNGFlb2pxQXg1Mk9RYlNKaThmZCsyVnBJVUJYNUlD?=
 =?utf-8?B?U25iaFh1aldkOU9qU2lSMThUbDNxYktsMXR0ZU5ET212MFROK2pnK1lNWUND?=
 =?utf-8?B?eGZrb1pxRnhiTTVUY29VTENncktwdkJTdHNJQ3ZmYjVZUDJvV3hkbklIZlVt?=
 =?utf-8?B?OHJ5aDhoekZZK0Y0UnBYcmczdEdhcjZMQ1VMZmE4a0pQR0FvUTJGaFV1YmhE?=
 =?utf-8?B?RndLUmFEaHZyTFZEWnRmSXVqV3RMYUd3eVhWY2xtMlI2ZzdVejd5cEpOS3VC?=
 =?utf-8?B?czdGMWd3Q3V3UWlkZGNUbjk0c1R4cU1LSU9YOFN0SHZRVzd2bDFDKysrNTU1?=
 =?utf-8?B?SUFIbFRxYXYyWDhLdGhFWVNLMzVVVUxpanRLbW1CaWp5eW9tOStjVGhqK2hv?=
 =?utf-8?B?N00vNm5JSVhsb3lwUTY0U1BIcFprdW5QZnpmVGlmYksvYTNUZUpYNm0vM3Zl?=
 =?utf-8?B?UlZSc2U1cjVYQUJGd2s1QWtncVdyYk9WTDUrOHpENEVvTWcvS2dyallDMDBZ?=
 =?utf-8?B?RE1SMWhJNUkrdU1JcHJxZlZLd3VBR0ZiQXhNOEgvSUxzWjl5TkhsRHpYRExk?=
 =?utf-8?B?MlVJb28waVhXN0R0YWhGUzBMQXR6NDkvellPMWx2QUFucjdlM09IcGJKMG11?=
 =?utf-8?B?M01IdmtuTDlYSFVKN3grek1mQVpQSEJPcEg1dXdTNTRKOXJlUVJGdnlZNXh1?=
 =?utf-8?B?VUhlYVFHOWZRNDhJQjVzRWJGOVpSMnNpMzA1azdJMytUMm1lR2Z0enJuNzZh?=
 =?utf-8?B?NkQzdHpadVNlUjhSOWRyaDdCWTJiUGlLdjR3NHZ5NGRRaXJZR1B6cFdDZkgx?=
 =?utf-8?B?YzZ2UWdyMDdOQVVoZ2dQOTFkNzZybk1FbGNjRUNUSUViY2JJNFVzL2NubXh0?=
 =?utf-8?B?aU90MlVkb3VTTTBlZHY2OGFWU3I3Mmd6bStibmdhZ3VTWkY2elBYR24yb3hv?=
 =?utf-8?B?czVwVThabURxait0N3BadnN5VTI2aFlCWXlFeDl4MlpEU3RUNmF0cUptUm1O?=
 =?utf-8?B?Q3Q2aHozMDZLb1UrbjBaVWROY1k1RkhsRzB6MzAwcFpJcVdmdCtWZmZQUXp1?=
 =?utf-8?B?Z1djdkdYZjdwOGFReGpWK1h3Y1l3MFFLVkN0R245ellMb0NXb2NoMldLWjJL?=
 =?utf-8?B?TUtZdHFWWHJmNTVVT25XRHF6ZG0rdkVnRjhHYlRxREVmTDFjN0kwdVp2OFd2?=
 =?utf-8?Q?Xi+w+BwqwS2VIedI07D+Ucn4Qa8Jj1VJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:32:17.2123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 427ed061-e44f-45e4-96e6-08dca78a3e5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454
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

On 10/7/24 02:11, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:36:59AM +1000, Ben Skeggs wrote:
>> These were a cludge used to prevent userspace's nvif ioctl from
>> accessing objects created by the kernel for the same client.
>>
>> That interface was removed in a previous patch, so these are no
>> longer useful for anything.
> It would probably be good to move this patch directly after the one it depends
> on.

Is this really necessary?  The ordering of this series is already 
incredibly fragile, with a bunch of chicken/egg situations that were 
tough to untangle.  Moreover, I don't see what real value it adds at 
this point.

>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/include/nvif/client.h |  1 -
>>   .../drm/nouveau/include/nvkm/core/object.h    |  2 --
>>   .../drm/nouveau/include/nvkm/core/oclass.h    |  2 --
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |  8 --------
>>   drivers/gpu/drm/nouveau/nvif/client.c         |  1 -
>>   drivers/gpu/drm/nouveau/nvif/object.c         |  3 ---
>>   drivers/gpu/drm/nouveau/nvkm/core/client.c    |  2 --
>>   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 19 ++++---------------
>>   drivers/gpu/drm/nouveau/nvkm/core/object.c    |  2 --
>>   drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  4 ++--
>>   10 files changed, 6 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
>> index 5d9395e651b6..64b033222c56 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvif/client.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
>> @@ -8,7 +8,6 @@ struct nvif_client {
>>   	struct nvif_object object;
>>   	const struct nvif_driver *driver;
>>   	u64 version;
>> -	u8 route;
>>   };
>>   
>>   int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
>> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
>> index ed1f66360782..d4f1c964ba31 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
>> @@ -15,8 +15,6 @@ struct nvkm_object {
>>   
>>   	struct list_head head;
>>   	struct list_head tree;
>> -	u8  route;
>> -	u64 token;
>>   	u64 object;
>>   	struct rb_node node;
>>   };
>> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
>> index 8e1b945d38f3..cad05f0e7948 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
>> @@ -21,8 +21,6 @@ struct nvkm_oclass {
>>   	const void *priv;
>>   	const void *engn;
>>   	u32 handle;
>> -	u8  route;
>> -	u64 token;
>>   	u64 object;
>>   	struct nvkm_client *client;
>>   	struct nvkm_object *parent;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> index 6f0548e57f9e..704977530b6b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> @@ -521,7 +521,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
>>   	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
>>   	struct nouveau_abi16_chan *chan;
>>   	struct nouveau_abi16_ntfy *ntfy;
>> -	struct nvif_client *client;
>>   	struct nvif_sclass *sclass;
>>   	s32 oclass = 0;
>>   	int ret, i;
>> @@ -531,7 +530,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
>>   
>>   	if (init->handle == ~0)
>>   		return nouveau_abi16_put(abi16, -EINVAL);
>> -	client = &abi16->cli->base;
>>   
>>   	chan = nouveau_abi16_chan(abi16, init->channel);
>>   	if (!chan)
>> @@ -596,10 +594,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
>>   
>>   	list_add(&ntfy->head, &chan->notifiers);
>>   
>> -	client->route = NVDRM_OBJECT_ABI16;
>>   	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", init->handle,
>>   			       oclass, NULL, 0, &ntfy->object);
>> -	client->route = NVDRM_OBJECT_NVIF;
>>   
>>   	if (ret)
>>   		nouveau_abi16_ntfy_fini(chan, ntfy);
>> @@ -615,7 +611,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>>   	struct nouveau_abi16_chan *chan;
>>   	struct nouveau_abi16_ntfy *ntfy;
>>   	struct nvif_device *device;
>> -	struct nvif_client *client;
>>   	struct nv_dma_v0 args = {};
>>   	int ret;
>>   
>> @@ -626,7 +621,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>>   	/* completely unnecessary for these chipsets... */
>>   	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
>>   		return nouveau_abi16_put(abi16, -EINVAL);
>> -	client = &abi16->cli->base;
>>   
>>   	chan = nouveau_abi16_chan(abi16, info->channel);
>>   	if (!chan)
>> @@ -663,11 +657,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>>   		args.limit += chan->ntfy->offset;
>>   	}
>>   
>> -	client->route = NVDRM_OBJECT_ABI16;
>>   	ret = nvif_object_ctor(&chan->chan->user, "abi16Ntfy", info->handle,
>>   			       NV_DMA_IN_MEMORY, &args, sizeof(args),
>>   			       &ntfy->object);
>> -	client->route = NVDRM_OBJECT_NVIF;
>>   	if (ret)
>>   		goto done;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
>> index 3a27245f467f..cd5439b73ac7 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/client.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/client.c
>> @@ -79,7 +79,6 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
>>   
>>   	client->object.client = client;
>>   	client->object.handle = ~0;
>> -	client->route = NVIF_IOCTL_V0_ROUTE_NVIF;
>>   	client->driver = parent->driver;
>>   
>>   	if (ret == 0) {
>> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
>> index 4d1aaee8fe15..2b3e05197846 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/object.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
>> @@ -40,7 +40,6 @@ nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
>>   			args->v0.object = nvif_handle(object);
>>   		else
>>   			args->v0.object = 0;
>> -		args->v0.owner = NVIF_IOCTL_V0_OWNER_ANY;
>>   	} else
>>   		return -ENOSYS;
>>   
>> @@ -286,8 +285,6 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
>>   		args->ioctl.version = 0;
>>   		args->ioctl.type = NVIF_IOCTL_V0_NEW;
>>   		args->new.version = 0;
>> -		args->new.route = parent->client->route;
>> -		args->new.token = nvif_handle(object);
>>   		args->new.object = nvif_handle(object);
>>   		args->new.handle = handle;
>>   		args->new.oclass = oclass;
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
>> index 48416c5039a1..95cbb5b682f2 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
>> @@ -51,8 +51,6 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
>>   
>>   	client->object.client = oclass->client;
>>   	client->object.handle = oclass->handle;
>> -	client->object.route  = oclass->route;
>> -	client->object.token  = oclass->token;
>>   	client->object.object = oclass->object;
>>   	client->debug = oclass->client->debug;
>>   	*pobject = &client->object;
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
>> index 0b33287e43a7..39d5c9700867 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
>> @@ -112,10 +112,9 @@ nvkm_ioctl_new(struct nvkm_client *client,
>>   
>>   	nvif_ioctl(parent, "new size %d\n", size);
>>   	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
>> -		nvif_ioctl(parent, "new vers %d handle %08x class %08x "
>> -				   "route %02x token %llx object %016llx\n",
>> +		nvif_ioctl(parent, "new vers %d handle %08x class %08x object %016llx\n",
>>   			   args->v0.version, args->v0.handle, args->v0.oclass,
>> -			   args->v0.route, args->v0.token, args->v0.object);
>> +			   args->v0.object);
>>   	} else
>>   		return ret;
>>   
>> @@ -127,8 +126,6 @@ nvkm_ioctl_new(struct nvkm_client *client,
>>   	do {
>>   		memset(&oclass, 0x00, sizeof(oclass));
>>   		oclass.handle = args->v0.handle;
>> -		oclass.route  = args->v0.route;
>> -		oclass.token  = args->v0.token;
>>   		oclass.object = args->v0.object;
>>   		oclass.client = client;
>>   		oclass.parent = parent;
>> @@ -331,7 +328,7 @@ nvkm_ioctl_v0[] = {
>>   
>>   static int
>>   nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
>> -		void *data, u32 size, u8 owner, u8 *route, u64 *token)
>> +		void *data, u32 size)
>>   {
>>   	struct nvkm_object *object;
>>   	int ret;
>> @@ -342,13 +339,6 @@ nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
>>   		return PTR_ERR(object);
>>   	}
>>   
>> -	if (owner != NVIF_IOCTL_V0_OWNER_ANY && owner != object->route) {
>> -		nvif_ioctl(&client->object, "route != owner\n");
>> -		return -EACCES;
>> -	}
>> -	*route = object->route;
>> -	*token = object->token;
>> -
>>   	if (ret = -EINVAL, type < ARRAY_SIZE(nvkm_ioctl_v0)) {
>>   		if (nvkm_ioctl_v0[type].version == 0)
>>   			ret = nvkm_ioctl_v0[type].func(client, object, data, size);
>> @@ -374,8 +364,7 @@ nvkm_ioctl(struct nvkm_client *client, void *data, u32 size, void **hack)
>>   			   args->v0.version, args->v0.type, args->v0.object,
>>   			   args->v0.owner);
>>   		ret = nvkm_ioctl_path(client, args->v0.object, args->v0.type,
>> -				      data, size, args->v0.owner,
>> -				      &args->v0.route, &args->v0.token);
>> +				      data, size);
>>   	}
>>   
>>   	if (ret != 1) {
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
>> index aea3ba72027a..580b8c7f25af 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
>> @@ -313,8 +313,6 @@ nvkm_object_ctor(const struct nvkm_object_func *func,
>>   	object->engine = nvkm_engine_ref(oclass->engine);
>>   	object->oclass = oclass->base.oclass;
>>   	object->handle = oclass->handle;
>> -	object->route  = oclass->route;
>> -	object->token  = oclass->token;
>>   	object->object = oclass->object;
>>   	INIT_LIST_HEAD(&object->head);
>>   	INIT_LIST_HEAD(&object->tree);
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
>> index ba9d9edaec75..cc254c390a57 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
>> @@ -116,9 +116,9 @@ nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
>>   	struct nvkm_client *client = uevent->object.client;
>>   
>>   	if (uevent->func)
>> -		return uevent->func(uevent->parent, uevent->object.token, bits);
>> +		return uevent->func(uevent->parent, uevent->object.object, bits);
>>   
>> -	return client->event(uevent->object.token, NULL, 0);
>> +	return client->event(uevent->object.object, NULL, 0);
>>   }
>>   
>>   int
>> -- 
>> 2.45.1
>>
