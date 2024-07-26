Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40293CD30
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA8310E023;
	Fri, 26 Jul 2024 04:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="swmN7036";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54DF10E023
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjgxnG0CuRXr5NJx2as5qqFYQvqt9nrx9F4nuqpC0y44mGVzwtzJYu2Qli5MJEIWOoj0xpMnJ/KnYdUaYbXVDXEcIa8JQwY2lzO0yN9OSr3HpZ35k/NsVwj6MQIu7uiN0l5yTkKuOsVZT06nRcyz1XHoRI+4QEKH3JAYxlEPCZ7cjZJIk47+rNK/o7RFk0WQuDd77OOu9SX7mr4PTZYViZNJVSdRtOBlu5wbb00plZ3vG3b9qeyaqcH161RdxoF2zuRadbsWf7DCRnrp/NR2sR86w8FWlQ7IKEYUzh8qzcT0gMYT1zwnDA0O+dVcPj/TFjuWRJcZ4N9Oyva4xj0gWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slAJCRjNa4n75TiWSzUr68azKCDppSulvWxyYihiokQ=;
 b=Fr3e3c72/6B+nwmhtN0UjIQRWkDwGPNifSskcxF+ZyasheLEbXI9Uym+S/wcAgtFmYWNBiLa9MRIQSw0yN3ahPh1fRZTXCLVWKbf/Di3Y5BmjWFrqvNcVbk6mkMmDSNdkoSjBSDhYwptc9nKhZUgQn4ttn80R7f5HzOOUOuwFA64Ki8GsFU/h9/Cds+KE8Ya2qC5+fgt6YnW7cNgcxBDct/Co5mQrb7JDny+Wne48b574CaiKJUZ2k6guRVwm9cCVt1Fn4/ByCLKybHYFvDWRjI6ss8VlOyB/DZq58Ai7bSsgrahPQ74AVVbYvoR/GkunNVaYLFzwQ6Z4TfpN26biQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slAJCRjNa4n75TiWSzUr68azKCDppSulvWxyYihiokQ=;
 b=swmN7036E0I9NzqwdhCdADuJbCKOa3iTSvMfsb093BdkUcY2n+LV+mVGjumq5emwtip37c/MZf8/6eqOzWlBf799C5hB2wYnAaUgcheA0Cxt5q3wzCqoWovwQymaWj6PHEoAyU9+sJaoIj88uCGR/8G1WtgMmfLADC4pUbjhNZwsdk2hMBlddKEgbftAvm4wQcYo3ot3RRGSgTpJOE5Aw8YWOikCFV3VSi1YRlrlp1dCsiyD/xUX8ivftwxurmmV6Sc65JAs8WFFER+UQg5DkOMUPRF1Xe8X042xcdL/dIHDFxvchrgbQUgw6zqyo6HadfB5XfRiJkyBI8AmomgSgA==
Received: from SJ0PR13CA0231.namprd13.prod.outlook.com (2603:10b6:a03:2c1::26)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:28:03 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::b8) by SJ0PR13CA0231.outlook.office365.com
 (2603:10b6:a03:2c1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.10 via Frontend
 Transport; Fri, 26 Jul 2024 04:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:28:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:27:57 -0700
Received: from [172.19.245.110] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:27:56 -0700
Message-ID: <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
Date: Fri, 26 Jul 2024 14:27:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com> <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com> <ZppJuiWfgfkEKeCH@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZppJuiWfgfkEKeCH@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: a929e261-5ac4-4917-61bd-08dcad2b56eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERLL1REQjJQdjhHRlJYWThuT1lrNng3WGNwY2JERUVWYkE3Qkx3djZoYUdq?=
 =?utf-8?B?ZStRcHEydVJma3phbWRLM3VHTFlFd2pFTU91dWgvbXFFNlc3dG1KOGxQT0lo?=
 =?utf-8?B?cnNPVFFoam9sQ2NuVGxZOFQyVDhFNFBkSklkWXNmS0dXcmhhRDFxUWhxYzlL?=
 =?utf-8?B?TUVGV2xGWFczMm5BMGlCU2JVYXFoUkMwZmRnakY3K1hpS3BSdXRKVFR0SitM?=
 =?utf-8?B?U1k5LzZIbVE4Rk5WN3hYRjBlUlppMENYbmQxS3Nxblg1RUk5OWVEZFhUelFt?=
 =?utf-8?B?Mit5VmF4V0VqVEhEakNEdWN2L3grNWpuNGlQeXJjUUllTkdURVo4bWgwZW5m?=
 =?utf-8?B?RVpBRU56OXJyMVZxc0Z4TUJER2U0SE5UQjhWWTdEdFdZMHIxU0N4ekpCN0tt?=
 =?utf-8?B?WFJNelZDZ0RyZ0xpYi9aWDlONzlPZUlwLy9xSHNsSFJSb2xKMkhBZGFYSWtq?=
 =?utf-8?B?QU1JYk9KSW55ckxJbTlBdzlYdi9TUnJhc0dlbys3Q2IvYUZ4UDY2d0JLMjAw?=
 =?utf-8?B?WmcwYmdaQW9wYWZWWVR5bFdseHN6U0h2YnJvWUJzcWtRc1dnaFROUkIwdVBj?=
 =?utf-8?B?b2ZObmYvd2JzOXN0N0gvLzFIWnZrbzU5RkpTYko2NERXSUpWTm9wK0NKbzdZ?=
 =?utf-8?B?T0pLaDhVRktXQmF6a2kxMGxUZkJzc1dUaGdBb1lnTUFXYnl2UmFXWEJPN2ZI?=
 =?utf-8?B?OVpNTEVvNlNTczhjeUpjbDB1YzAzQlV6MU85aFBaWW9Tai9FMjJsZG9mcURH?=
 =?utf-8?B?MmVaQXRncy95clp5SDNSOTFEK044dDQ3cndkaU5oMWpHUHBMM0tzNW8yY1VN?=
 =?utf-8?B?YUFSdExlR01iMGRkNEFSYTVHRHYyUmZmUW5hTytReVhieEpXUHZlajJlOEUx?=
 =?utf-8?B?a2ZQYjlaNWFVS2d1ZnZONS9PT1dzYlJyUjFWSHIxTSticUtLSnEvL2tnb1Qr?=
 =?utf-8?B?bHVybG1SbnJaVnVLMi93c25yM0txQWhpSnkyRXZLYXZjcUhQVVo1VkN3aDJ5?=
 =?utf-8?B?VUpMSWc3NFdDZlUyZytQS09nNG5HMHRocnNoVjFVSTlyTTVKTjQ5ZnRZOVk4?=
 =?utf-8?B?dGRzSy9JdEtqWHdIMDBHYTdYQVc1bW9zbnliQ3F2SWRockhFYlR6REo4RGtQ?=
 =?utf-8?B?clVEUFlySVFKd2tVdFFIZkx4Z09HTittL2Z3ems2Ny84cjVOTmErV3lVSENu?=
 =?utf-8?B?U01qeURNbHRwYkNZVVJQb0ZIS1pXcllhdWliMlk1QWRkTXlWT1JjWmdyQkJ5?=
 =?utf-8?B?Vzg5MDJJMFFUNmhGanBHa2tlZ0VSVUE1NFdQUVN2YWpZMGNQUnlNOWlzVU0r?=
 =?utf-8?B?blBEUVBMSmQ3TW1CRWFCV1hVcDZOZ2FBakJDazBKQkdYYm1LRWJrY0VHdmV2?=
 =?utf-8?B?UG5NejE0ZjRyL3d6QmRJU0tuWENMWXAzcXIwRE1ZUHp3OThhSmtWMFZQM2hG?=
 =?utf-8?B?MlVRNnRiVURxOUhSMjNIbzFxYU8zUmtmOE5adFRIWGd6L2s4c3NXTFJwSUZk?=
 =?utf-8?B?SXFIMnpBMWp4VGJPZHo0ZG95dWRqQ3ZZSEF6cTgremRkTXFXSjZLVis2MitB?=
 =?utf-8?B?RG5Vd1JMUEJ3UHRGalNYaUZFR3pXTVA0aUtJbFdydHowNzljMVRrNlFBMytO?=
 =?utf-8?B?bERSR0wzLzNZdGpxYVdJeGNSL0pIajZkL0hLdTNpcHdIOXJaVzZNNWQ3Tjlz?=
 =?utf-8?B?OXhGRnk3MGE3ZmJxaEpKaUxEdktWU2lLYlVZQmxrSWF0OW04YXQwZjA4b2lx?=
 =?utf-8?B?c0xxdEIrQTR0RHloR1Z0b1psb3Z3VTVRMHZkYzlMa01OeFJtdVlJRWs2MEd5?=
 =?utf-8?B?aTdnNEJuTEE4S21oY0JJZ0wyUUwrMEE5a05NWjBxRFpTaU40bEJtNHF4WmpV?=
 =?utf-8?B?L1E5V0FTVnBsY0toT0E2MDV1RDk3QWxjK0hLQmM2RkF2aFdrSjRuZ3NmQm1D?=
 =?utf-8?Q?//cN6n0sx8n7CeaxwzJa+Mdu3km75lGp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:28:03.3077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a929e261-5ac4-4917-61bd-08dcad2b56eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
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

On 19/7/24 21:10, Danilo Krummrich wrote:

> On Thu, Jul 18, 2024 at 05:14:15PM +1000, Ben Skeggs wrote:
>> On 10/7/24 01:16, Danilo Krummrich wrote:
>>
>>> On Fri, Jul 05, 2024 at 04:36:46AM +1000, Ben Skeggs wrote:
>>>> The next commit will change the pointer we store via dev_set_drvdata()
>>>> to allow simplifying the code using it.
>>> Please don't use future tense, e.g "In subsequent commits, the pointer we store
>>> [...]". Also, when you mention that something is changes (such as the pointer
>>> type here), it probably makes sense to mention what it is changed to instead.
>>>
>>>> Here we want to unify some more of the PCI/Tegra DRM driver init, both
>>>> as a general cleanup, and to enable the dev_set_drvdata() change to be
>>>> made in a single place.
>>> In this case I think it makes sense to switch things up. First mention what the
>>> commit does and why, i.e. "Unify some more of the PCI/Tegra DRM driver init
>>> [...]" and then mention that the actual change to the pointer stored in a
>>> device' drvdata in done in a subsequent commit.
>> I've reworded the commit message.
>>
>>
>>>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/nouveau_drm.c      | 93 ++++++++++++++--------
>>>>    drivers/gpu/drm/nouveau/nouveau_platform.c |  6 --
>>>>    2 files changed, 60 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> index eae48c87e3d5..9beff8737617 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> @@ -628,20 +628,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
>>>>    	destroy_workqueue(drm->sched_wq);
>>>>    	nvif_parent_dtor(&drm->parent);
>>>>    	mutex_destroy(&drm->clients_lock);
>>>> -	kfree(drm);
>>>>    }
>>>>    static int
>>>> -nouveau_drm_device_init(struct drm_device *dev)
>>>> +nouveau_drm_device_init(struct nouveau_drm *drm)
>>>>    {
>>>> -	struct nouveau_drm *drm;
>>>> +	struct drm_device *dev = drm->dev;
>>>>    	int ret;
>>>> -	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
>>>> -		return -ENOMEM;
>>>> -	dev->dev_private = drm;
>>>> -	drm->dev = dev;
>>>> -
>>>>    	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>>>    	drm->master.base.object.parent = &drm->parent;
>>>> @@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
>>>>    		pm_runtime_put(dev->dev);
>>>>    	}
>>>> +	ret = drm_dev_register(drm->dev, 0);
>>>> +	if (ret) {
>>>> +		nouveau_drm_device_fini(drm->dev);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>>    	return 0;
>>>>    fail_dispinit:
>>>>    	nouveau_display_destroy(dev);
>>>> @@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
>>>>    	destroy_workqueue(drm->sched_wq);
>>>>    fail_alloc:
>>>>    	nvif_parent_dtor(&drm->parent);
>>>> -	kfree(drm);
>>>>    	return ret;
>>>>    }
>>>> +static void
>>>> +nouveau_drm_device_del(struct nouveau_drm *drm)
>>>> +{
>>>> +	if (drm->dev)
>>>> +		drm_dev_put(drm->dev);
>>>> +
>>>> +	kfree(drm);
>>>> +}
>>>> +
>>>> +static struct nouveau_drm *
>>>> +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
>>>> +		       struct nvkm_device *device)
>>>> +{
>>>> +	struct nouveau_drm *drm;
>>>> +	int ret;
>>>> +
>>>> +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
>>>> +	if (!drm)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	drm->dev = drm_dev_alloc(drm_driver, parent);
>>> Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
>>>
>>> This also gets us rid of nouveau_drm_device_del().
>> No, we can't.  I originally had this change as a cleanup patch in the series
>> I posted implementing aux bus support.  However it turns out that in order
>> to avoid breaking udev etc, we can't use the aux device as parent of the drm
> Can you please expand a bit on what was breaking?

Sorry, I meant to say PRIME, not udev.  The device selection logic ties 
the DRM device back to its sysfs node, and doesn't understand the 
auxiliary bus.  So, if nouveau were to use its auxiliary device as 
parent of the DRM device, PRIME breaks. Fortunately it didn't turn out 
to be necessary, and we can happily probe() against the auxiliary device 
and still use the PCI device as the DRM device's parent.

>
>> device and instead have to continue passing the pci/platform device as we do
>> now.
>>
>> Using devm_drm_dev_alloc() with the pci device as parent would tie the
>> lifetime of the drm device to the pci device, which is owned by nvkm (after
> How does this tie the lifetime of the drm device to the pci device? It's the
> other way around, the drm device takes a reference of its parent (i.e. the pci
> device).
>
> I don't think there's anything wrong with that.

My understanding is that devres will cleanup allocations when the driver 
detaches from the device.  With the auxdev changes, it's *NVKM* that's 
attached to the PCI device, not the DRM driver (which is attached to an 
auxiliary device instead).

This means that the devm_drm_dev_init_release() won't be called when the 
DRM driver detaches from its auxiliary device as it should, but when 
NVKM detaches from the PCI device, which isn't the most obvious and 
could lead to confusion.

It also entirely blows up in the split module case as nouveau.ko is 
unloaded already by the time NVKM detaches and drm_dev_put() gets called.

>
>> the auxdev series).  We could look at changing devm_drm_dev_alloc() of
>> course, but I think that's best left until later.
> I don't think that this is necessary.
>
>>>> +	if (IS_ERR(drm->dev)) {
>>>> +		ret = PTR_ERR(drm->dev);
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	drm->dev->dev_private = drm;
>>>> +	dev_set_drvdata(parent, drm->dev);
>>>> +
>>>> +done:
>>>> +	if (ret) {
>>>> +		nouveau_drm_device_del(drm);
>>>> +		drm = NULL;
>>>> +	}
>>>> +
>>>> +	return ret ? ERR_PTR(ret) : drm;
>>>> +}
>>>> +
>>>>    /*
>>>>     * On some Intel PCIe bridge controllers doing a
>>>>     * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
>>>> @@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>>>    			     const struct pci_device_id *pent)
>>>>    {
>>>>    	struct nvkm_device *device;
>>>> -	struct drm_device *drm_dev;
>>>> +	struct nouveau_drm *drm;
>>>>    	int ret;
>>>>    	if (vga_switcheroo_client_probe_defer(pdev))
>>>> @@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>>>    	if (nouveau_atomic)
>>>>    		driver_pci.driver_features |= DRIVER_ATOMIC;
>>>> -	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
>>>> -	if (IS_ERR(drm_dev)) {
>>>> -		ret = PTR_ERR(drm_dev);
>>>> +	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
>>>> +	if (IS_ERR(drm)) {
>>>> +		ret = PTR_ERR(drm);
>>>>    		goto fail_nvkm;
>>>>    	}
>>>> @@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>>>    	if (ret)
>>>>    		goto fail_drm;
>>>> -	pci_set_drvdata(pdev, drm_dev);
>>>> -
>>>> -	ret = nouveau_drm_device_init(drm_dev);
>>>> +	ret = nouveau_drm_device_init(drm);
>>>>    	if (ret)
>>>>    		goto fail_pci;
>>>> -	ret = drm_dev_register(drm_dev, pent->driver_data);
>>>> -	if (ret)
>>>> -		goto fail_drm_dev_init;
>>>> -
>>>> -	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
>>>> -		drm_fbdev_ttm_setup(drm_dev, 8);
>>>> +	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
>>>> +		drm_fbdev_ttm_setup(drm->dev, 8);
>>>>    	else
>>>> -		drm_fbdev_ttm_setup(drm_dev, 32);
>>>> +		drm_fbdev_ttm_setup(drm->dev, 32);
>>>>    	quirk_broken_nv_runpm(pdev);
>>>>    	return 0;
>>>> -fail_drm_dev_init:
>>>> -	nouveau_drm_device_fini(drm_dev);
>>>>    fail_pci:
>>>>    	pci_disable_device(pdev);
>>>>    fail_drm:
>>>> -	drm_dev_put(drm_dev);
>>>> +	nouveau_drm_device_del(drm);
>>>>    fail_nvkm:
>>>>    	nvkm_device_del(&device);
>>>>    	return ret;
>>>> @@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
>>>>    	device = nvkm_device_find(client->device);
>>>>    	nouveau_drm_device_fini(dev);
>>>> -	drm_dev_put(dev);
>>>> +	nouveau_drm_device_del(drm);
>>>>    	nvkm_device_del(&device);
>>>>    }
>>>> @@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>>>    			       struct platform_device *pdev,
>>>>    			       struct nvkm_device **pdevice)
>>>>    {
>>>> -	struct drm_device *drm;
>>>> +	struct nouveau_drm *drm;
>>>>    	int err;
>>>>    	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
>>>> @@ -1377,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>>>    	if (err)
>>>>    		goto err_free;
>>>> -	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
>>>> +	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
>>>>    	if (IS_ERR(drm)) {
>>>>    		err = PTR_ERR(drm);
>>>>    		goto err_free;
>>>> @@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>>>>    	if (err)
>>>>    		goto err_put;
>>>> -	platform_set_drvdata(pdev, drm);
>>>> -
>>>> -	return drm;
>>>> +	return drm->dev;
>>>>    err_put:
>>>> -	drm_dev_put(drm);
>>>> +	nouveau_drm_device_del(drm);
>>>>    err_free:
>>>>    	nvkm_device_del(pdevice);
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
>>>> index bf2dc7567ea4..d0a63f0f54a2 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
>>>> @@ -34,12 +34,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>>>>    	if (IS_ERR(drm))
>>>>    		return PTR_ERR(drm);
>>>> -	ret = drm_dev_register(drm, 0);
>>>> -	if (ret < 0) {
>>>> -		drm_dev_put(drm);
>>>> -		return ret;
>>>> -	}
>>>> -
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.45.1
>>>>
