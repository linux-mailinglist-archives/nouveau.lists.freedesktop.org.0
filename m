Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E536937177
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4810E0F4;
	Fri, 19 Jul 2024 00:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CQ83YcNb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1A510E0F4
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnSjMPpvSzxyZ7UrvGuhS90z1CKWDlPJsPWCpZM2tgklvlx1j8J2AVk7/9SMUaeAldmZAjdGuK1Xcb4mO9t7V4BU0g3M80cv0XsshCDU1a5CjC2YFWp4VYRnXBFpreL7Z4mAtsI4Y00UJGKPulf8neI2us/0LpDTTldc6hYnOuyN6/hD3Mwz3O2s+17VSk08YpWmtiyBh03s9blETy3xYkE1LBeuMgwcpAWsBNlAi5nctg2LNRmHqH+2ZudveAaFCZJIDoH1/ZmcCq2aoORhcbqAbGQfMFJSTeRNORV5XezrK+++Rx0t7eA70oVQ1fjL6mv68fOkKDGsDPzdovB3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QQDB6ieocm5KbIKw0KAhkXRp7WSPR+qmoFsc7DJjmM=;
 b=ujVbg4GF2BBKFUH36R8EADJG6Gj8R/soSejvpdojiPF4Mn+p9X1wSv1nX96VxvslbDkqZShUApbobMQDXghRKBD2wt/cZa0HKREvxQvpMvP1EglrqtZ8/ZTQmrgg8lkRt1Qb4jMneYme6KSjYlqFp/hU808p+Sns/3BeriBet5Oj33XoZBlnFBWKY6lmQZpd1Fehc+Ri0hIiaw8HbQY5Forjy9x3HeoH5xGNM2WjV0znfuFdX2lbeufV6RxBStAnMEZbmFYtIcFHXbPJ6ebMjSiYbRO69gKJFa11uEHgVzLIoLrL3dxZf5FHX5sSfgp83yJ8Saf2lhoZ/uklRzPnRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QQDB6ieocm5KbIKw0KAhkXRp7WSPR+qmoFsc7DJjmM=;
 b=CQ83YcNb+X8sBgF3xBclerQJ/hd67mvh4t53fvVWSSlGTFVszUuXz15Gt/YtNtNcolDhmwR4Pi3iIlcxtq9S2rotXKhSBskO3eK3/8VSkz3NlErkbCR/wl6AWXKYDcPFJ8TBWVap3SNq7RbOc8HmzTfYKXyxOGqXXD4Ixi56vhJf5cXE8T610HOMWACtER/IaXtIcLGFU9/ZRYp3vweYA4sTYHBrFkd60NVgFUcn1ncn4vGXwppMl1oX3UUz0uhwwi7mrdeHzuPhpHNBP1rHBDMRUoiLPjX5xXBKuYFVuSkxe5gNewYaZMkGgiplHnHexAqutiOUWgO4gUds0i+TKA==
Received: from DS7PR05CA0108.namprd05.prod.outlook.com (2603:10b6:8:56::27) by
 PH7PR12MB8596.namprd12.prod.outlook.com (2603:10b6:510:1b7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.27; Fri, 19 Jul 2024 00:22:50 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::4b) by DS7PR05CA0108.outlook.office365.com
 (2603:10b6:8:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 19 Jul 2024 00:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:22:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:22:40 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:22:39 -0700
Message-ID: <b8ccfc88-6666-4532-921a-2dadfc93eccb@nvidia.com>
Date: Thu, 18 Jul 2024 17:43:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/37] drm/nouveau: handle limited nvif ioctl in abi16
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-9-bskeggs@nvidia.com> <Zo1fTLZeyZps-E37@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1fTLZeyZps-E37@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH7PR12MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fbe205-68bc-453f-d90a-08dca788ec66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RS9FcDQ5VnpadUdIZjQxT1kyMXNUWXQzNkc5anRDdHhQeTZkZkNMSWNaTGRR?=
 =?utf-8?B?eStvREd0UkVBUk5tUmpTQ0NwZnIwT1B4Rnp3Z1pDbW5LeitNRDR2QW5neVJK?=
 =?utf-8?B?ZFBjZWJ4Y1RQNUJqRXE0Q2kxV2RKL1RUMDdTWFRQSGw1a0o2OVlQczBTWk5s?=
 =?utf-8?B?M014Sm1HSFVJQ2UvczBWOW9tTGZVTVVJU2JBRjBQR1ZsOXBnMGxzVThUb3ZM?=
 =?utf-8?B?eDVPUEtvMTN1UTl1WE10eCttK2FZWE9FTEZmWmhvNDNzdEJlWFdiSGdtQ2Fo?=
 =?utf-8?B?NVV3ald1TWVWWEttdDVzQlpnV0txa0xuS2JvcUQxSDMyb3p3UzNEMmFzbDla?=
 =?utf-8?B?Zi9KblN3aEQ3SE9YRXFTeEZPUk16d1hNYmZrdnpDOUd0TTdDK3ZIa0J4NFlB?=
 =?utf-8?B?UFhTQ24zc1p4a3BuS1pNVHVtYzYrZi9zb0FPYVhGVmUwSUtQWTR2WVluV0cr?=
 =?utf-8?B?VTBIMmp6eFlzdkczUmJUT2VQcHNZVFNoWWdVbWxzdEp1K0lDMGo4VXBCR1Vx?=
 =?utf-8?B?NFpmVzZpSkM4ZmFoRkJ2aDdqakZRZzByYkx1WDc5UGtTcDFvN3pWcGw2WnAz?=
 =?utf-8?B?MFlWbE5wM3lrTGRIUEdZcUZIMW9Rb0Y4ZTJGY1c1czViUEdmeFpZcno1Ymwx?=
 =?utf-8?B?aWMybXZRUy9nTmsvR0lDRVpmNnladDBuTEZEYnBLcUt4MmNBTnptVWQvNm1y?=
 =?utf-8?B?b3pLN0Nmb1Y2bUx4d1FFUFhuc0hibDYzamNVbGpMK1VZOXkrV2trZUlxWTg4?=
 =?utf-8?B?QVRRckVaVU5PU0h0TTduSWRMV1o3ZzlXQWx6TnAyVGNkV2NqZFNVTC9NbVFO?=
 =?utf-8?B?TXZYMTJkYkxWWlh1akphS09PK3poWHNENCtKTHl6K2hjRWxKTUlwbEtIN3Jx?=
 =?utf-8?B?SnNucnNmVW5WeE5rOHFLZzQvM3p5TEhmcVJaSndrZGR0MTFTYmNoRXE2Y1Rw?=
 =?utf-8?B?MENRM3RRRXRIeVhBZCtFejZhdUpjTnFCSTh4Z21lTTcrUEUzd2Y2ejllbE9r?=
 =?utf-8?B?RXFhdk1HcVBVZEZZOGphcXJvQ1hSZW9xTkVDTmNrQkYrNjRRQ08zdFIra2cy?=
 =?utf-8?B?c1JEd1FaWGxmT0JuUCtjaGgyMnd0YXNvNlFULzlHRThESndPcDJqMHdkS0pr?=
 =?utf-8?B?OFpLOXE2YnRTaHp3ajBCQXdYSFFTWnplU00ydVRtbndFdWliamluU1BDZ3Jj?=
 =?utf-8?B?UE0yajVMZmEvcm13MDFES3Y1UnVZakQ5T3dudHpuQ05KRU5CYm0xcm9Edk1L?=
 =?utf-8?B?RnRGcGQzZFNxZ3lSK3BjNGt4emZOS2tlVWk4c1BGT0pCaHZ2ZGZEcCthRW8w?=
 =?utf-8?B?dTN0MVhQNWZjNXhWZU82Vm9BbGhacmFHMGhSV0c2dVRBSTcrMnpVb1ZwaVJI?=
 =?utf-8?B?U3pLWFByYWNmVnU2OU1Bb1o0V2wycndQcHY3QzIzZjFkdm9IT1BMcDRjWXpV?=
 =?utf-8?B?WWU5aWlSZ1J3WWdKSHB5UElFQVNSMGF2KzZKeGhVQzkyN2tLa2hLNlFwVmpi?=
 =?utf-8?B?ZmF3QWpLRFM3LzRyK3YvMmZvTU5ZUzN4S1R2enZZZ1hsa2ZUeVY1bkhlbkhk?=
 =?utf-8?B?QXVRSkwvY1kxeWRwQ2ZFd0NadlViWDJtYkw1amppOWIrdkZUL2c4VUF6bWZl?=
 =?utf-8?B?bm9pVVRJV3J1cmI2cURlcUt2emJBWGZmUDE2MXRrbUkyNlVlUkloVWVBcTFE?=
 =?utf-8?B?VjFkVStxNGhRNExPcjRZTHZvck5SbUJuYnZIYnlQZUVsZm9malBUTnBqT0NZ?=
 =?utf-8?B?VjhrM3lwSGdrWEdnTXc5b1h4SllzandWcWJQOUo4SmVrc2ducXJCMCtnZ01K?=
 =?utf-8?B?TlNFdk1JZmdsSVRITnhaWEVnWk5OLzgrT2tKZW1xUHBJZGlxVlVlc2JJUExr?=
 =?utf-8?B?UWVCWFUxMm0wVU1pa2lWZXRTcm85UDFmUHhRbGFlb2NBa3BtdFRKV3kvL1c2?=
 =?utf-8?Q?nCISKXROBf7wFkixBooKpAXFGwZpTYQw?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:22:50.2071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fbe205-68bc-453f-d90a-08dca788ec66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8596
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

On 10/7/24 02:03, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:36:52AM +1000, Ben Skeggs wrote:
>> nouveau_usif.c was already stripped right back a couple of years ago,
>> limiting what userspace could do with it, and now I'd like to remove
>> the nvkm side of these interfaces entirely, in order to make it less
>> of a nightmare to add/change internal APIs in the future.
>>
>> Unfortunately.  Userspace uses some of this.
>>
>> Fortunately, userspace only ever ended up using a fraction of the APIs,
>> so I've reimplemented those in a more direct manner, and return -EINVAL
>> to userspace for everything else.
> Please use imperative form.
>
>> v2:
>> - simplified struct nouveau_abi16_obj
>> - added a couple of comments
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/Kbuild          |   1 -
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c | 277 ++++++++++++++++++++----
>>   drivers/gpu/drm/nouveau/nouveau_abi16.h |   3 +-
>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |   5 +-
>>   drivers/gpu/drm/nouveau/nouveau_nvif.c  |   1 -
>>   drivers/gpu/drm/nouveau/nouveau_usif.c  | 194 -----------------
>>   drivers/gpu/drm/nouveau/nouveau_usif.h  |  10 -
>>   7 files changed, 242 insertions(+), 249 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>>
>> diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
>> index c32c01827c1d..7b863355c5c6 100644
>> --- a/drivers/gpu/drm/nouveau/Kbuild
>> +++ b/drivers/gpu/drm/nouveau/Kbuild
>> @@ -25,7 +25,6 @@ nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
>>   nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
>>   nouveau-y += nouveau_nvif.o
>>   nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
>> -nouveau-y += nouveau_usif.o # userspace <-> nvif
>>   nouveau-y += nouveau_vga.o
>>   
>>   # DRM - memory management
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> index ac50c300d2eb..f80d777cee5d 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> @@ -52,6 +52,7 @@ nouveau_abi16(struct drm_file *file_priv)
>>   
>>   			abi16->cli = cli;
>>   			INIT_LIST_HEAD(&abi16->channels);
>> +			INIT_LIST_HEAD(&abi16->objects);
>>   
>>   			/* allocate device object targeting client's default
>>   			 * device (ie. the one that belongs to the fd it
>> @@ -88,6 +89,58 @@ nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
>>   	return ret;
>>   }
>>   
>> +/* Tracks objects created via nvif_ioctl_v0 APIs. */
> Here I asked about some documentation on the semantical meaning of this object,
> as in "What does it represent?".
>
> The fact this it is created via some generic nvif_ioctl_v0 interface may be part
> of an explanation, but with only that information I doubt that anyone who does
> not know already) is capabale to make any sense of this structure.
>
> Try to answer the following questions:
>
> 1. What kind of object does it track? What do they represent?
> 2. For generic objects, what would be examples for specific ones?
> 3. Where do the objects originate from?
> 4. What is a "DEVICE" object and what is an "ENGOBJ"? Do we have documentation
>     we can point to already for that?
>
> If we'd want to go even more crazy, we could ask:
> 1. Who owns those objects, once created?
> 2. What are their lifetime rules?
> 3. How do we ensure we don't violate lifetime rules?

I hear what you're saying.  It just doesn't make sense here.  A lot of 
the questions you ask, particularly in the first section, relate to 
general concepts present throughout not only the entire driver, but 
GSP-RM's interfaces and even the HW itself.  Attaching all of this to a 
chunk of code simulating a tiny fraction of a bad idea that got exposed 
to userspace is not where this kind of information belongs.

I've spoken to you already about adding documentation to the 
remove-ioctl series as the layers are ripped out of each NVIF API, as 
well as some general hw/driver architecture documentation before I send 
a v2 of that series.  That will help clear up a lot of these type of 
questions.  Does that sound OK?

>
>> +struct nouveau_abi16_obj {
>> +	enum nouveau_abi16_obj_type {
>> +		DEVICE,
>> +		ENGOBJ,
>> +	} type;
>> +	u64 object;
>> +
>> +	struct nvif_object engobj;
>> +
>> +	struct list_head head; /* protected by nouveau_abi16.cli.mutex */
>> +};
>> +
>> +static struct nouveau_abi16_obj *
>> +nouveau_abi16_obj_find(struct nouveau_abi16 *abi16, u64 object)
>> +{
>> +	struct nouveau_abi16_obj *obj;
>> +
>> +	list_for_each_entry(obj, &abi16->objects, head) {
>> +		if (obj->object == object)
>> +			return obj;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void
>> +nouveau_abi16_obj_del(struct nouveau_abi16_obj *obj)
>> +{
>> +	list_del(&obj->head);
>> +	kfree(obj);
>> +}
>> +
>> +static struct nouveau_abi16_obj *
>> +nouveau_abi16_obj_new(struct nouveau_abi16 *abi16, enum nouveau_abi16_obj_type type, u64 object)
>> +{
>> +	struct nouveau_abi16_obj *obj;
>> +
>> +	obj = nouveau_abi16_obj_find(abi16, object);
>> +	if (obj)
>> +		return ERR_PTR(-EEXIST);
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	obj->type = type;
>> +	obj->object = object;
>> +	list_add_tail(&obj->head, &abi16->objects);
>> +	return obj;
>> +}
>> +
>>   s32
>>   nouveau_abi16_swclass(struct nouveau_drm *drm)
>>   {
>> @@ -167,6 +220,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
>>   {
>>   	struct nouveau_cli *cli = abi16->cli;
>>   	struct nouveau_abi16_chan *chan, *temp;
>> +	struct nouveau_abi16_obj *obj, *tmp;
>> +
>> +	/* cleanup objects */
>> +	list_for_each_entry_safe(obj, tmp, &abi16->objects, head) {
>> +		nouveau_abi16_obj_del(obj);
>> +	}
>>   
>>   	/* cleanup channels */
>>   	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
>> @@ -458,44 +517,6 @@ nouveau_abi16_chan(struct nouveau_abi16 *abi16, int channel)
>>   	return NULL;
>>   }
>>   
>> -int
>> -nouveau_abi16_usif(struct drm_file *file_priv, void *data, u32 size)
>> -{
>> -	union {
>> -		struct nvif_ioctl_v0 v0;
>> -	} *args = data;
>> -	struct nouveau_abi16_chan *chan;
>> -	struct nouveau_abi16 *abi16;
>> -	int ret = -ENOSYS;
>> -
>> -	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
>> -		switch (args->v0.type) {
>> -		case NVIF_IOCTL_V0_NEW:
>> -		case NVIF_IOCTL_V0_MTHD:
>> -		case NVIF_IOCTL_V0_SCLASS:
>> -			break;
>> -		default:
>> -			return -EACCES;
>> -		}
>> -	} else
>> -		return ret;
>> -
>> -	if (!(abi16 = nouveau_abi16(file_priv)))
>> -		return -ENOMEM;
>> -
>> -	if (args->v0.token != ~0ULL) {
>> -		if (!(chan = nouveau_abi16_chan(abi16, args->v0.token)))
>> -			return -EINVAL;
>> -		args->v0.object = nvif_handle(&chan->chan->user);
>> -		args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
>> -		return 0;
>> -	}
>> -
>> -	args->v0.object = nvif_handle(&abi16->device.object);
>> -	args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
>> -	return 0;
>> -}
>> -
>>   int
>>   nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS)
>>   {
>> @@ -705,3 +726,183 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
>>   
>>   	return nouveau_abi16_put(abi16, ret);
>>   }
>> +
>> +static int
>> +nouveau_abi16_ioctl_mthd(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
>> +{
>> +	struct nouveau_cli *cli = abi16->cli;
>> +	struct nvif_ioctl_mthd_v0 *args;
>> +	struct nouveau_abi16_obj *obj;
>> +	struct nv_device_info_v0 *info;
>> +
>> +	if (ioctl->route || argc < sizeof(*args))
>> +		return -EINVAL;
>> +	args = (void *)ioctl->data;
>> +	argc -= sizeof(*args);
>> +
>> +	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
>> +	if (!obj || obj->type != DEVICE)
>> +		return -EINVAL;
>> +
>> +	if (args->method != NV_DEVICE_V0_INFO ||
>> +	    argc != sizeof(*info))
>> +		return -EINVAL;
>> +
>> +	info = (void *)args->data;
>> +	if (info->version != 0x00)
>> +		return -EINVAL;
>> +
>> +	info = &cli->device.info;
>> +	memcpy(args->data, info, sizeof(*info));
>> +	return 0;
>> +}
>> +
>> +static int
>> +nouveau_abi16_ioctl_del(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
>> +{
>> +	struct nouveau_abi16_obj *obj;
>> +
>> +	if (ioctl->route || argc)
>> +		return -EINVAL;
>> +
>> +	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
>> +	if (obj) {
>> +		if (obj->type == ENGOBJ)
>> +			nvif_object_dtor(&obj->engobj);
>> +		nouveau_abi16_obj_del(obj);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
>> +{
>> +	struct nvif_ioctl_new_v0 *args;
>> +	struct nouveau_abi16_chan *chan;
>> +	struct nouveau_abi16_obj *obj;
>> +	int ret;
>> +
>> +	if (argc < sizeof(*args))
>> +		return -EINVAL;
>> +	args = (void *)ioctl->data;
>> +	argc -= sizeof(*args);
>> +
>> +	if (args->version != 0)
>> +		return -EINVAL;
>> +
>> +	if (!ioctl->route) {
>> +		if (ioctl->object || args->oclass != NV_DEVICE)
>> +			return -EINVAL;
>> +
>> +		obj = nouveau_abi16_obj_new(abi16, DEVICE, args->object);
>> +		if (IS_ERR(obj))
>> +			return PTR_ERR(obj);
>> +
>> +		return 0;
>> +	}
>> +
>> +	chan = nouveau_abi16_chan(abi16, ioctl->token);
>> +	if (!chan)
>> +		return -EINVAL;
>> +
>> +	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
>> +	if (IS_ERR(obj))
>> +		return PTR_ERR(obj);
>> +
>> +	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
>> +			       NULL, 0, &obj->engobj);
>> +	if (ret)
>> +		nouveau_abi16_obj_del(obj);
>> +
>> +	return ret;
>> +}
>> +
>> +static int
>> +nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
>> +{
>> +	struct nvif_ioctl_sclass_v0 *args;
>> +	struct nouveau_abi16_chan *chan;
>> +	struct nvif_sclass *sclass;
>> +	int ret;
>> +
>> +	if (!ioctl->route || argc < sizeof(*args))
>> +		return -EINVAL;
>> +	args = (void *)ioctl->data;
>> +	argc -= sizeof(*args);
>> +
>> +	if (argc != args->count * sizeof(args->oclass[0]))
>> +		return -EINVAL;
>> +
>> +	chan = nouveau_abi16_chan(abi16, ioctl->token);
>> +	if (!chan)
>> +		return -EINVAL;
>> +
>> +	ret = nvif_object_sclass_get(&chan->chan->user, &sclass);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	for (int i = 0; i < min_t(u8, args->count, ret); i++) {
>> +		args->oclass[i].oclass = sclass[i].oclass;
>> +		args->oclass[i].minver = sclass[i].minver;
>> +		args->oclass[i].maxver = sclass[i].maxver;
>> +	}
>> +	args->count = ret;
>> +
>> +	nvif_object_sclass_put(&sclass);
>> +	return 0;
>> +}
>> +
>> +int
>> +nouveau_abi16_ioctl(struct drm_file *filp, void __user *user, u32 size)
> Actually, it would also be good to add documentation on what this uAPI provides
> and how it works. But since this patch just moves things over, I don't think
> it's required for this patch.
>
>> +{
>> +	struct nvif_ioctl_v0 *ioctl;
>> +	struct nouveau_abi16 *abi16;
>> +	u32 argc = size;
>> +	int ret;
>> +
>> +	if (argc < sizeof(*ioctl))
>> +		return -EINVAL;
>> +	argc -= sizeof(*ioctl);
>> +
>> +	ioctl = kmalloc(size, GFP_KERNEL);
>> +	if (!ioctl)
>> +		return -ENOMEM;
>> +
>> +	ret = -EFAULT;
>> +	if (copy_from_user(ioctl, user, size))
>> +		goto done_free;
>> +
>> +	if (ioctl->version != 0x00 ||
>> +	    (ioctl->route && ioctl->route != 0xff)) {
>> +		ret = -EINVAL;
>> +		goto done_free;
>> +	}
>> +
>> +	abi16 = nouveau_abi16_get(filp);
>> +	if (unlikely(!abi16)) {
>> +		ret = -ENOMEM;
>> +		goto done_free;
>> +	}
>> +
>> +	switch (ioctl->type) {
>> +	case NVIF_IOCTL_V0_SCLASS: ret = nouveau_abi16_ioctl_sclass(abi16, ioctl, argc); break;
>> +	case NVIF_IOCTL_V0_NEW   : ret = nouveau_abi16_ioctl_new   (abi16, ioctl, argc); break;
>> +	case NVIF_IOCTL_V0_DEL   : ret = nouveau_abi16_ioctl_del   (abi16, ioctl, argc); break;
>> +	case NVIF_IOCTL_V0_MTHD  : ret = nouveau_abi16_ioctl_mthd  (abi16, ioctl, argc); break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	nouveau_abi16_put(abi16, 0);
>> +
>> +	if (ret == 0) {
>> +		if (copy_to_user(user, ioctl, size))
>> +			ret = -EFAULT;
>> +	}
>> +
>> +done_free:
>> +	kfree(ioctl);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> index 0a9121e63143..75a883a44e04 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> @@ -34,13 +34,14 @@ struct nouveau_abi16 {
>>   	struct nvif_device device;
>>   	struct list_head channels;
>>   	u64 handles;
>> +	struct list_head objects;
>>   };
>>   
>>   struct nouveau_abi16 *nouveau_abi16_get(struct drm_file *);
>>   int  nouveau_abi16_put(struct nouveau_abi16 *, int);
>>   void nouveau_abi16_fini(struct nouveau_abi16 *);
>>   s32  nouveau_abi16_swclass(struct nouveau_drm *);
>> -int  nouveau_abi16_usif(struct drm_file *, void *data, u32 size);
>> +int nouveau_abi16_ioctl(struct drm_file *, void __user *user, u32 size);
>>   
>>   #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>>   #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index a942d2c03d44..6726f463d2d3 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -63,7 +63,6 @@
>>   #include "nouveau_abi16.h"
>>   #include "nouveau_fence.h"
>>   #include "nouveau_debugfs.h"
>> -#include "nouveau_usif.h"
>>   #include "nouveau_connector.h"
>>   #include "nouveau_platform.h"
>>   #include "nouveau_svm.h"
>> @@ -200,7 +199,6 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>>   	flush_work(&cli->work);
>>   	WARN_ON(!list_empty(&cli->worker));
>>   
>> -	usif_client_fini(cli);
>>   	if (cli->sched)
>>   		nouveau_sched_destroy(&cli->sched);
>>   	if (uvmm)
>> @@ -249,7 +247,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   	snprintf(cli->name, sizeof(cli->name), "%s", sname);
>>   	cli->drm = drm;
>>   	mutex_init(&cli->mutex);
>> -	usif_client_init(cli);
>>   
>>   	INIT_WORK(&cli->work, nouveau_cli_work);
>>   	INIT_LIST_HEAD(&cli->worker);
>> @@ -1267,7 +1264,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>   
>>   	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
>>   	case DRM_NOUVEAU_NVIF:
>> -		ret = usif_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
>> +		ret = nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
>>   		break;
>>   	default:
>>   		ret = drm_ioctl(file, cmd, arg);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nouveau_nvif.c
>> index 1d49ebdfd5dc..9a7e3f64b79f 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
>> @@ -35,7 +35,6 @@
>>   #include <nvif/ioctl.h>
>>   
>>   #include "nouveau_drv.h"
>> -#include "nouveau_usif.h"
>>   
>>   static void
>>   nvkm_client_unmap(void *priv, void __iomem *ptr, u32 size)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c b/drivers/gpu/drm/nouveau/nouveau_usif.c
>> deleted file mode 100644
>> index 002d1479ba89..000000000000
>> --- a/drivers/gpu/drm/nouveau/nouveau_usif.c
>> +++ /dev/null
>> @@ -1,194 +0,0 @@
>> -/*
>> - * Copyright 2014 Red Hat Inc.
>> - *
>> - * Permission is hereby granted, free of charge, to any person obtaining a
>> - * copy of this software and associated documentation files (the "Software"),
>> - * to deal in the Software without restriction, including without limitation
>> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> - * and/or sell copies of the Software, and to permit persons to whom the
>> - * Software is furnished to do so, subject to the following conditions:
>> - *
>> - * The above copyright notice and this permission notice shall be included in
>> - * all copies or substantial portions of the Software.
>> - *
>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> - * OTHER DEALINGS IN THE SOFTWARE.
>> - *
>> - * Authors: Ben Skeggs <bskeggs@redhat.com>
>> - */
>> -
>> -#include "nouveau_drv.h"
>> -#include "nouveau_usif.h"
>> -#include "nouveau_abi16.h"
>> -
>> -#include <nvif/unpack.h>
>> -#include <nvif/client.h>
>> -#include <nvif/ioctl.h>
>> -
>> -#include <nvif/class.h>
>> -#include <nvif/cl0080.h>
>> -
>> -struct usif_object {
>> -	struct list_head head;
>> -	u8  route;
>> -	u64 token;
>> -};
>> -
>> -static void
>> -usif_object_dtor(struct usif_object *object)
>> -{
>> -	list_del(&object->head);
>> -	kfree(object);
>> -}
>> -
>> -static int
>> -usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc, bool parent_abi16)
>> -{
>> -	struct nouveau_cli *cli = nouveau_cli(f);
>> -	struct nvif_client *client = &cli->base;
>> -	union {
>> -		struct nvif_ioctl_new_v0 v0;
>> -	} *args = data;
>> -	struct usif_object *object;
>> -	int ret = -ENOSYS;
>> -
>> -	if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
>> -		return ret;
>> -
>> -	switch (args->v0.oclass) {
>> -	case NV_DMA_FROM_MEMORY:
>> -	case NV_DMA_TO_MEMORY:
>> -	case NV_DMA_IN_MEMORY:
>> -		return -EINVAL;
>> -	case NV_DEVICE: {
>> -		union {
>> -			struct nv_device_v0 v0;
>> -		} *args = data;
>> -
>> -		if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false)))
>> -			return ret;
>> -
>> -		args->v0.priv = false;
>> -		break;
>> -	}
>> -	default:
>> -		if (!parent_abi16)
>> -			return -EINVAL;
>> -		break;
>> -	}
>> -
>> -	if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
>> -		return -ENOMEM;
>> -	list_add(&object->head, &cli->objects);
>> -
>> -	object->route = args->v0.route;
>> -	object->token = args->v0.token;
>> -	args->v0.route = NVDRM_OBJECT_USIF;
>> -	args->v0.token = (unsigned long)(void *)object;
>> -	ret = nvif_client_ioctl(client, argv, argc);
>> -	if (ret) {
>> -		usif_object_dtor(object);
>> -		return ret;
>> -	}
>> -
>> -	args->v0.token = object->token;
>> -	args->v0.route = object->route;
>> -	return 0;
>> -}
>> -
>> -int
>> -usif_ioctl(struct drm_file *filp, void __user *user, u32 argc)
>> -{
>> -	struct nouveau_cli *cli = nouveau_cli(filp);
>> -	struct nvif_client *client = &cli->base;
>> -	void *data = kmalloc(argc, GFP_KERNEL);
>> -	u32   size = argc;
>> -	union {
>> -		struct nvif_ioctl_v0 v0;
>> -	} *argv = data;
>> -	struct usif_object *object;
>> -	bool abi16 = false;
>> -	u8 owner;
>> -	int ret;
>> -
>> -	if (ret = -ENOMEM, !argv)
>> -		goto done;
>> -	if (ret = -EFAULT, copy_from_user(argv, user, size))
>> -		goto done;
>> -
>> -	if (!(ret = nvif_unpack(-ENOSYS, &data, &size, argv->v0, 0, 0, true))) {
>> -		/* block access to objects not created via this interface */
>> -		owner = argv->v0.owner;
>> -		if (argv->v0.object == 0ULL &&
>> -		    argv->v0.type != NVIF_IOCTL_V0_DEL)
>> -			argv->v0.owner = NVDRM_OBJECT_ANY; /* except client */
>> -		else
>> -			argv->v0.owner = NVDRM_OBJECT_USIF;
>> -	} else
>> -		goto done;
>> -
>> -	/* USIF slightly abuses some return-only ioctl members in order
>> -	 * to provide interoperability with the older ABI16 objects
>> -	 */
>> -	mutex_lock(&cli->mutex);
>> -	if (argv->v0.route) {
>> -		if (ret = -EINVAL, argv->v0.route == 0xff)
>> -			ret = nouveau_abi16_usif(filp, argv, argc);
>> -		if (ret) {
>> -			mutex_unlock(&cli->mutex);
>> -			goto done;
>> -		}
>> -
>> -		abi16 = true;
>> -	}
>> -
>> -	switch (argv->v0.type) {
>> -	case NVIF_IOCTL_V0_NEW:
>> -		ret = usif_object_new(filp, data, size, argv, argc, abi16);
>> -		break;
>> -	default:
>> -		ret = nvif_client_ioctl(client, argv, argc);
>> -		break;
>> -	}
>> -	if (argv->v0.route == NVDRM_OBJECT_USIF) {
>> -		object = (void *)(unsigned long)argv->v0.token;
>> -		argv->v0.route = object->route;
>> -		argv->v0.token = object->token;
>> -		if (ret == 0 && argv->v0.type == NVIF_IOCTL_V0_DEL) {
>> -			list_del(&object->head);
>> -			kfree(object);
>> -		}
>> -	} else {
>> -		argv->v0.route = NVIF_IOCTL_V0_ROUTE_HIDDEN;
>> -		argv->v0.token = 0;
>> -	}
>> -	argv->v0.owner = owner;
>> -	mutex_unlock(&cli->mutex);
>> -
>> -	if (copy_to_user(user, argv, argc))
>> -		ret = -EFAULT;
>> -done:
>> -	kfree(argv);
>> -	return ret;
>> -}
>> -
>> -void
>> -usif_client_fini(struct nouveau_cli *cli)
>> -{
>> -	struct usif_object *object, *otemp;
>> -
>> -	list_for_each_entry_safe(object, otemp, &cli->objects, head) {
>> -		usif_object_dtor(object);
>> -	}
>> -}
>> -
>> -void
>> -usif_client_init(struct nouveau_cli *cli)
>> -{
>> -	INIT_LIST_HEAD(&cli->objects);
>> -}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.h b/drivers/gpu/drm/nouveau/nouveau_usif.h
>> deleted file mode 100644
>> index dc90d4a9d0d9..000000000000
>> --- a/drivers/gpu/drm/nouveau/nouveau_usif.h
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -#ifndef __NOUVEAU_USIF_H__
>> -#define __NOUVEAU_USIF_H__
>> -
>> -void usif_client_init(struct nouveau_cli *);
>> -void usif_client_fini(struct nouveau_cli *);
>> -int  usif_ioctl(struct drm_file *, void __user *, u32);
>> -int  usif_notify(const void *, u32, const void *, u32);
>> -
>> -#endif
>> -- 
>> 2.45.1
>>
