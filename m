Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424493716B
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 01:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1226710EB45;
	Thu, 18 Jul 2024 23:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W9OcK5Ly";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913B710EB45
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2024 23:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyeHvum3j3y8RvjHKCTQV8RTf2hW8LjUCHwClrSiggEloe34fCpSeSMTjCe6g26XZuJMNzRGAuRgnXZUN+RrgENZg56s5y+NrmySRMcseJn6PMsZRsAXvbntrdCrCnrIyEatqCsB6DMooHwcqIjhJODvm73JmPtDAi+pEgjuWTAail5uo0aaEpOsxViHzaHYeDOpAM0YW94maYWYfVtHKkYzpili3AXC9iWUEovVnJ3zs+82KMorMOAqL7SdIl42ukr22QxWK0td0OhpZSPx1JcfkS1gX13ihnWvhYEUqc+fiNKbuvEbLBJ2HMEdzP3pv9tgydywuU8yax12JRdkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ezg0tnLAuaieIz2ka6ExZu9V4/5Fyd702bkkhwCwUI=;
 b=Mv0EnC86YSlxrOnspgpBNCzoH4Tvz6oiPj0L1MX1K5TU/qjTlYCl6DpbBz6giNqFFIajmmxs6xy052da+stIIhN1CIFSLuHZ4H2H9eJ1qC4ayL773+xvaxaCymt/G9pZHXtPwkr1jx2ptzNxrqAZarL0BobLQ3WB74bOtIurr8oC7O4dJXthqRgYlXS7R6lknmtilecBxIonNjo8w2V4vqhGXeKTTMxGfgzsLPj4kHo4K5lE36F2+5AxIZLxoc7IqAHutxs35wuKxLhK42OIGKvBnwXnzXwLHIHpnWm42PY6fmNdosi971ycGUQy0xfqoK13MxqaBlT9eRVUKcRIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ezg0tnLAuaieIz2ka6ExZu9V4/5Fyd702bkkhwCwUI=;
 b=W9OcK5LyAXIDegng7Dz+S1zKEk9ESSrsAJb/wbVZ5z5OqSDQ/EwsqJOiFnSS9j1mxsit34+JB2UaOIu4bvL+mrT94oHyX0DW4RcAmhqwIML+4woOSxH9qpiPQyLB+XFCF2J/Ec+RC13THanj4+lvBL1r5neDI2vlXqHec+u/SBqge/yYqTRZlIPkq8mxyxVK9I6Cf7ns26SRco8KmBsa13Bu132+SIkqmS3EfzIsyDh48YGXZvzv8JvJsoQMSqhRAtbU86x6ak7YuqCpAqIm7FFSb0capvQp8fvSNStpJBjKf2I7bDQ3fscmAUi4xzvnKg/qGGJrgvASgH+wLlScnw==
Received: from BYAPR11CA0099.namprd11.prod.outlook.com (2603:10b6:a03:f4::40)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 23:53:46 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::80) by BYAPR11CA0099.outlook.office365.com
 (2603:10b6:a03:f4::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27 via Frontend
 Transport; Thu, 18 Jul 2024 23:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 23:53:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 16:53:35 -0700
Received: from [172.28.173.68] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 16:53:34 -0700
Message-ID: <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
Date: Thu, 18 Jul 2024 17:14:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com> <Zo1UP-aapSyf2Rnj@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1UP-aapSyf2Rnj@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS0PR12MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f779623-d9fa-4184-89e3-08dca784dc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0tZNGZEZ2pGWTNZaURLN2ZQdjA5SlNsWXZCS3NCcTV4Q3MrM0J6V2x6L3Vk?=
 =?utf-8?B?SUQyc0pUMHFzV0s2cHYyRURrL2gydU9PSUxzdXpnbTJVbkJuZU5Hb0JUQ0JJ?=
 =?utf-8?B?UzJIR0dkU0ZNSlpVNmJoVk1sYU1JK0YyVHV6eXUxeGJPUWk1ZERDRlFjYzIy?=
 =?utf-8?B?WlpRRVpoZmJRVElkSEtlRkFoNlBVUkdBdUk1VkVGYmZWN2E1T2RCLzZCcW04?=
 =?utf-8?B?ZU9rSzM3NHRPdFo2Qnc3RjhXb3JvREJJcUJseTRuQTN1ZllhTzBoY1RnNkFB?=
 =?utf-8?B?SkdORkdaSmVQRTI3RU1WRk9qUUtMRW0zemlhOEVWR3lZVGR1ZW4vOXhCTHN1?=
 =?utf-8?B?bE9iWEZnUHppQzY1WW16YlkyMzhscjRDL1pVUUx3UVIzMUdvdHZ0d1lualBD?=
 =?utf-8?B?WUdMQnBoOWZydWNYS0xVdWZWMm1MTHBpL3l0MHFsakZXalREcXgvWXZmSnBx?=
 =?utf-8?B?aWRmUWJLSjZsRFZNT0FaQThGYjZXWEFNeHVEbFZnTHdxdGxqbkxOYm5tU01w?=
 =?utf-8?B?TDUyWGxUSSszTEQreXRub0hFdW1JYVovbFYzTnQ0d2tyK0FaV3FiMDA4WldX?=
 =?utf-8?B?Umw2VGlJSmNoMDBVd2xQdkxpRkloQ2ZjMmM5OVcyK0EzVWVVL011SFBaOTJa?=
 =?utf-8?B?L0MrY3puS3lYQUJ2YzA1LzJPU0FZTlg1bXZjelI5TkQwV1FRQ0RxeHJwVDRH?=
 =?utf-8?B?bW4wVWFEY2orTVNyMnRoVFlOZ2plYlhGY2ZxeWN3eTlyZVFkbjRFNkNXSHpp?=
 =?utf-8?B?R2Q1QWtTK0VjVjJUQWdYTHNNNVRkMUl6QmhXWjhnV3U1MDg1dDFlVHp3RTN4?=
 =?utf-8?B?UVQ0cCtUN1JvNUxVS2RhT2F3ZmtiOFZkaVdham02aUhkZHJKVWtuQjJDZnha?=
 =?utf-8?B?ZXV3NHE2VWwvUFlXempwZEVrYURxVEtoODZ6QWdDTGFZL1AvbHM5Wk95RWlD?=
 =?utf-8?B?Uk51UVNRYXdPS1BVNkg3UXptY3JCUk9GcHMwOXJzT010Slk5RGcyZWlGbXc1?=
 =?utf-8?B?dDBpZU9oY3dqR0FqR3hoSEs0RmJNQU5MNzY4Uy85OFNQNm1ZRmVwblJObnpJ?=
 =?utf-8?B?bE04ZzlMOG12KzZXQXQ3UjlJcXFiMkhlMVIxb29NUHJWaENCYnR2dTFWWjlz?=
 =?utf-8?B?ZkFOMFp4b1RmWDNjNFJpRkFhY0k5djNCbmk3d0xueXFUUGx3VUJ3M2ZESFBV?=
 =?utf-8?B?NkVvNmR6bEtvRXhIUWZCMG9ES2t6MzJiemJBNXRLVkQzdXBSay9LSmRvcmN4?=
 =?utf-8?B?NFJXL3RnTVZGcHdBT3ZBNG1taTJSYWU5UHY2MkhRejFZRXBQdi9kdlRNK3dM?=
 =?utf-8?B?UlFDVm5oSjE5bVFlUFRqTFNBNktpa0t1TFh5MVIzOVVxSWgxZytJalNoaXBV?=
 =?utf-8?B?NU1nZm9rZG53ZEVXMkVmd1BCM1VybmVUbjd2Y2NHVit2c0k1a05rMHJ0aDNa?=
 =?utf-8?B?N245bEF1TlZNWWFhdmtTS0dNUWhCdDdmMkNJUnBRTERrcFpyOHMzMzFCdGhT?=
 =?utf-8?B?OElOSy9qL3UwM1FWMytMc1g4Mm91YTV4dDc0dkxVTVhnZ3BGMEtlcFZxS0Qw?=
 =?utf-8?B?TDh3Rit4TWhmR3VBclFmWTFkc0ZtMUdyWXZ0Qlc3NEZrTzhSaGpyYXQzcHlv?=
 =?utf-8?B?UCtRN1FDYm13T3NDa1I5dmllVG5PdUxhNDJWTEpENnordnVDODZmeXdXUWxT?=
 =?utf-8?B?a3RJaUZXVGhPVzg4SzVEb1g3S1ZxWEZ5dDkxN1FKSURCcjFKK2xkeHFVbzU3?=
 =?utf-8?B?R2lPcThqU2MrRjN4aFJINFZLRkIyYkV3T1BpaE1tbVpWQzM0aEUrNWN6bTQz?=
 =?utf-8?B?V3hwSFQ4NjFObzdhN3g1RmtzRlZ3M1VnelFUTWZpd1NaQlBLQ3E1cExac21S?=
 =?utf-8?B?QnJwMHFyWGY4dWkxYUlPL3g0UjBPL1JvQkQ1RkI2dUN4a2N4QmRyK3hVVHhL?=
 =?utf-8?Q?m63OL2K322HoD97jUtdP5aK7FzPH66G7?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:53:45.7789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f779623-d9fa-4184-89e3-08dca784dc93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
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

On 10/7/24 01:16, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:36:46AM +1000, Ben Skeggs wrote:
>> The next commit will change the pointer we store via dev_set_drvdata()
>> to allow simplifying the code using it.
> Please don't use future tense, e.g "In subsequent commits, the pointer we store
> [...]". Also, when you mention that something is changes (such as the pointer
> type here), it probably makes sense to mention what it is changed to instead.
>
>> Here we want to unify some more of the PCI/Tegra DRM driver init, both
>> as a general cleanup, and to enable the dev_set_drvdata() change to be
>> made in a single place.
> In this case I think it makes sense to switch things up. First mention what the
> commit does and why, i.e. "Unify some more of the PCI/Tegra DRM driver init
> [...]" and then mention that the actual change to the pointer stored in a
> device' drvdata in done in a subsequent commit.

I've reworded the commit message.


>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c      | 93 ++++++++++++++--------
>>   drivers/gpu/drm/nouveau/nouveau_platform.c |  6 --
>>   2 files changed, 60 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index eae48c87e3d5..9beff8737617 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -628,20 +628,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
>>   	destroy_workqueue(drm->sched_wq);
>>   	nvif_parent_dtor(&drm->parent);
>>   	mutex_destroy(&drm->clients_lock);
>> -	kfree(drm);
>>   }
>>   
>>   static int
>> -nouveau_drm_device_init(struct drm_device *dev)
>> +nouveau_drm_device_init(struct nouveau_drm *drm)
>>   {
>> -	struct nouveau_drm *drm;
>> +	struct drm_device *dev = drm->dev;
>>   	int ret;
>>   
>> -	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
>> -		return -ENOMEM;
>> -	dev->dev_private = drm;
>> -	drm->dev = dev;
>> -
>>   	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>   	drm->master.base.object.parent = &drm->parent;
>>   
>> @@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
>>   		pm_runtime_put(dev->dev);
>>   	}
>>   
>> +	ret = drm_dev_register(drm->dev, 0);
>> +	if (ret) {
>> +		nouveau_drm_device_fini(drm->dev);
>> +		return ret;
>> +	}
>> +
>>   	return 0;
>>   fail_dispinit:
>>   	nouveau_display_destroy(dev);
>> @@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
>>   	destroy_workqueue(drm->sched_wq);
>>   fail_alloc:
>>   	nvif_parent_dtor(&drm->parent);
>> -	kfree(drm);
>>   	return ret;
>>   }
>>   
>> +static void
>> +nouveau_drm_device_del(struct nouveau_drm *drm)
>> +{
>> +	if (drm->dev)
>> +		drm_dev_put(drm->dev);
>> +
>> +	kfree(drm);
>> +}
>> +
>> +static struct nouveau_drm *
>> +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
>> +		       struct nvkm_device *device)
>> +{
>> +	struct nouveau_drm *drm;
>> +	int ret;
>> +
>> +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
>> +	if (!drm)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	drm->dev = drm_dev_alloc(drm_driver, parent);
> Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
>
> This also gets us rid of nouveau_drm_device_del().

No, we can't.  I originally had this change as a cleanup patch in the 
series I posted implementing aux bus support.  However it turns out that 
in order to avoid breaking udev etc, we can't use the aux device as 
parent of the drm device and instead have to continue passing the 
pci/platform device as we do now.

Using devm_drm_dev_alloc() with the pci device as parent would tie the 
lifetime of the drm device to the pci device, which is owned by nvkm 
(after the auxdev series).  We could look at changing 
devm_drm_dev_alloc() of course, but I think that's best left until later.

>
>> +	if (IS_ERR(drm->dev)) {
>> +		ret = PTR_ERR(drm->dev);
>> +		goto done;
>> +	}
>> +
>> +	drm->dev->dev_private = drm;
>> +	dev_set_drvdata(parent, drm->dev);
>> +
>> +done:
>> +	if (ret) {
>> +		nouveau_drm_device_del(drm);
>> +		drm = NULL;
>> +	}
>> +
>> +	return ret ? ERR_PTR(ret) : drm;
>> +}
>> +
>>   /*
>>    * On some Intel PCIe bridge controllers doing a
>>    * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
>> @@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>   			     const struct pci_device_id *pent)
>>   {
>>   	struct nvkm_device *device;
>> -	struct drm_device *drm_dev;
>> +	struct nouveau_drm *drm;
>>   	int ret;
>>   
>>   	if (vga_switcheroo_client_probe_defer(pdev))
>> @@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>   	if (nouveau_atomic)
>>   		driver_pci.driver_features |= DRIVER_ATOMIC;
>>   
>> -	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
>> -	if (IS_ERR(drm_dev)) {
>> -		ret = PTR_ERR(drm_dev);
>> +	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
>> +	if (IS_ERR(drm)) {
>> +		ret = PTR_ERR(drm);
>>   		goto fail_nvkm;
>>   	}
>>   
>> @@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>   	if (ret)
>>   		goto fail_drm;
>>   
>> -	pci_set_drvdata(pdev, drm_dev);
>> -
>> -	ret = nouveau_drm_device_init(drm_dev);
>> +	ret = nouveau_drm_device_init(drm);
>>   	if (ret)
>>   		goto fail_pci;
>>   
>> -	ret = drm_dev_register(drm_dev, pent->driver_data);
>> -	if (ret)
>> -		goto fail_drm_dev_init;
>> -
>> -	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
>> -		drm_fbdev_ttm_setup(drm_dev, 8);
>> +	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
>> +		drm_fbdev_ttm_setup(drm->dev, 8);
>>   	else
>> -		drm_fbdev_ttm_setup(drm_dev, 32);
>> +		drm_fbdev_ttm_setup(drm->dev, 32);
>>   
>>   	quirk_broken_nv_runpm(pdev);
>>   	return 0;
>>   
>> -fail_drm_dev_init:
>> -	nouveau_drm_device_fini(drm_dev);
>>   fail_pci:
>>   	pci_disable_device(pdev);
>>   fail_drm:
>> -	drm_dev_put(drm_dev);
>> +	nouveau_drm_device_del(drm);
>>   fail_nvkm:
>>   	nvkm_device_del(&device);
>>   	return ret;
>> @@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
>>   	device = nvkm_device_find(client->device);
>>   
>>   	nouveau_drm_device_fini(dev);
>> -	drm_dev_put(dev);
>> +	nouveau_drm_device_del(drm);
>>   	nvkm_device_del(&device);
>>   }
>>   
>> @@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>   			       struct platform_device *pdev,
>>   			       struct nvkm_device **pdevice)
>>   {
>> -	struct drm_device *drm;
>> +	struct nouveau_drm *drm;
>>   	int err;
>>   
>>   	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
>> @@ -1377,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>   	if (err)
>>   		goto err_free;
>>   
>> -	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
>> +	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
>>   	if (IS_ERR(drm)) {
>>   		err = PTR_ERR(drm);
>>   		goto err_free;
>> @@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>   	if (err)
>>   		goto err_put;
>>   
>> -	platform_set_drvdata(pdev, drm);
>> -
>> -	return drm;
>> +	return drm->dev;
>>   
>>   err_put:
>> -	drm_dev_put(drm);
>> +	nouveau_drm_device_del(drm);
>>   err_free:
>>   	nvkm_device_del(pdevice);
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
>> index bf2dc7567ea4..d0a63f0f54a2 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
>> @@ -34,12 +34,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>>   	if (IS_ERR(drm))
>>   		return PTR_ERR(drm);
>>   
>> -	ret = drm_dev_register(drm, 0);
>> -	if (ret < 0) {
>> -		drm_dev_put(drm);
>> -		return ret;
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.45.1
>>
