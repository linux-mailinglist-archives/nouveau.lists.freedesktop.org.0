Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1993DB1A
	for <lists+nouveau@lfdr.de>; Sat, 27 Jul 2024 01:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CA510E07B;
	Fri, 26 Jul 2024 23:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a2yRKyso";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CCF10E07B
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 23:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQc0yslEkBGsDcFrfZFJjjI4apbt4RJSeacb1YE6bXxjI2vxx3DSvqAH1qJUt5E1IfNIbjiahrGJ7EBwqy4ZInmU9dF840Fa1jwDLoL++PgmJkI8QC8Dde7562zLUdIDUC2hjB9h8QFi93MW5uEV7Poo9WFXcyBZL/oNMzmmPgoXEEqNg+2/wkNVLz4XJOB79PT0rNcA2XMiB61jTGDubHkAVdNVfcy2GnHLuKO3FFFjiCPYyzuEiKbt/gqwOlQ7SWqiH80eJR5Cs2UMOLTk+Ai89c3Sxkv6FZ5saFM8EEp9XehfywR7xUVG4Xj4js9rxv5xqHSCx3s7L3gt+2fPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v2FUrsdhH0hYEGMvzsrTUPQ6PyjqIBqQjSOeC+gtfE=;
 b=UQUhM4N1CJb8KV0mF/ZzOj3qrQekKHurFRA9PKVLcc61AqXIG4AnfGEovPnTKpbqZgn+imqA/Yi0gWnwYM6HOEYYEGK+vd+KyLKQOMbtDgvebJQHCNP/1kmA6yHiol2ZTRgUfRdUBO8mYnoL21hvh4kU61wohbkPErMWJW45Hf/YEf2DNAYxLJnKmzpLUqOscx6NCDx9g2IG5FwXAkfKiPQLCLiIrO4UOGmtpbMB1i1dz9DD8MN1eLaAkiQ4HmG8+4sBvTrAvrNaLF+Iz38qcJBNIT2XqtIoRf9DSC17EgEThOtJCMpI769rjcnQICfkDNs4B5Owodcc6zl5lnLbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v2FUrsdhH0hYEGMvzsrTUPQ6PyjqIBqQjSOeC+gtfE=;
 b=a2yRKyso30jYEHQ0m2btlL3ctu66uHjG4jDXhIIyjNZvqjqBOJm6XoLT2S5lYYSOE08prtHxssKqCkE01nhJWgm+ztpGvYrZca0EKBONo+dl9stWrmkupOxuSRaj79OPB5Zf0irbCCkQsKoEVKeXRb+/xS7WMnTojhB8ZgT/UTVvOIP6I6Fpkg8ezSkNzMM5bNoJcZ6ENk7LRfRMhfmv7daRXXYeSN+R4H3P+5HQRGd44EJJHW44tiuQpC7gTkju4/m94col0sN4DDLP9kbpStzLRys9168tSQKhctuaNALGQh25OGhIthWN7RUm036jYGcvOonq8WG1gCch6lNtgw==
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by DS7PR12MB6166.namprd12.prod.outlook.com (2603:10b6:8:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 23:09:03 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::33) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 23:09:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 23:09:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 26 Jul
 2024 16:08:49 -0700
Received: from [172.19.245.110] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 26 Jul
 2024 16:08:48 -0700
Message-ID: <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
Date: Fri, 26 Jul 2024 23:07:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
To: Danilo Krummrich <dakr@kernel.org>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com> <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com> <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DS7PR12MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: d1add0fa-0bb0-422b-2c98-08dcadc7f0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YThSY0JrVTZ0bjdTRUR6aE91UkFSeVZpMnNTWVlCbklybFhwWGxibEhhOU51?=
 =?utf-8?B?UnExQ0ttZzkra1FNL2IvcS85dlBtaFVMTmxTdGtjQ2lua3oyeDBuRDAxSjV4?=
 =?utf-8?B?c1dCd0lCU0NTMXgyLzlHbjBEQ0Z1L2pQZzgyb1NTYVp6UW9zdFZYL0lUVXlq?=
 =?utf-8?B?anVoWjd2ZlBZSSszRm1KZ2xNSHZTcEFWdTh4KzBIeGtWUjcwTFRHcktkZTNL?=
 =?utf-8?B?OEtZQW5tQlNHcTdRaCtxQXFwWDFscjFKMnZrS3dsdWFpT3VZb2dkNzlodTJ1?=
 =?utf-8?B?UkJWb0dLdmN2Y3RHNm5ZL3oxWEFOMjl1cmtvNHBPam1meC9rRTlsUmlnWUQ2?=
 =?utf-8?B?M2lpaVB6ZjczdjYxOURFT05IZ1RYTWxyR2tZWmhaQzQwMlFXRHdoY3kzK1lk?=
 =?utf-8?B?ZFdsRlpRN3NGZm1VTG9RK1J0QlBHU3B0QkhraWthc3dteWxvcGx0SlQrZUQr?=
 =?utf-8?B?WWRlbE9SM2VDeFhyM2drVjl2UFUzSVcyczlQR2U5Y3pFY1lzL0dxL2p6c0Fk?=
 =?utf-8?B?UWVYSVNhSVpBTXpwQXp5d2FtMEJaeDdwMlRoY2JXY01BT1ZZTjlrZjhhUEFp?=
 =?utf-8?B?MlRzbjVkak9mN2VQaldzYkJ2ZURoRC8rVHJ4NVVEV2lMQ01hMkZMUDhtWTRh?=
 =?utf-8?B?VS9EdFJQNU5xZzdIVWczZXJlU3oxTkcwTlZlWnMxUWNNZkQxbmZpejRMSHpu?=
 =?utf-8?B?S0NJVjJGVnRhVUxSMHFrcXd1WmRXdXNsQ29lNVhpVUhOMXludVR6QnQ1K2pL?=
 =?utf-8?B?V05xY3ZJOTNrZTNBWGFsamE2aEJ2MitqVEJ4WkZwVEd5Q2pFMWFOOVBLT0VB?=
 =?utf-8?B?YXJsckJkaTdtZ1Rpd1ZuZ1IrSTZPVXpOS0R1MzZobWd4ZmtJUnk2RE9qVU5k?=
 =?utf-8?B?cVBpV2pFT2VOYTZKZFo1TDMxV3RiZU01WXovMzdxSUgyMWNKSEdlOWxRc3Vw?=
 =?utf-8?B?bE13dzNnY2dIUzNQUldTTjRLVWJIS2ZqakoyTXhqOWpyVURzZDluNURIMjhv?=
 =?utf-8?B?MmtjM3MxSEQzRmdBemhFQ1lqTm1FSTg1THVWUHJaak45RnhyaVdpL3FkSFBQ?=
 =?utf-8?B?Z2M0ZVk0dzJaU2pKZWptZVE5a0JQa0xacW9sV2RER2ZlWmZ1Y21HYldmNWRs?=
 =?utf-8?B?aERnNHVDd2dDSmgzeTNYejdBS1NSRS8xbUFJWUtOTVh3SWw2eTZyRlFONGVO?=
 =?utf-8?B?dEFkS3ltcm0vRGhsK01oKzQyK3krdit1ZGEyQ2g0MlBYaEVtQ2FSSFUzeXZ0?=
 =?utf-8?B?R3pCejZob21zMXJ3S3lkdzRrWUVvdkY3Nm0rRlpwbnBDeWRNQUhRTllad3g2?=
 =?utf-8?B?VnNPbVhmRlBjclpmSmZiNlFyOUlNM1hvMWg4Tmp4c0tmTXFBaG1WN1JLdkM2?=
 =?utf-8?B?NEQza1NvZWpxUVJsd0J1UEpjMWZBV3NOK3U5NGdEYWRaQU1NZDhMRWN4Y3FD?=
 =?utf-8?B?TlNXZCtRUVNqYlkwWitvaGgzL3Fka3NVanFpUmFnM2p5VkhFbUtyR0hMWC9B?=
 =?utf-8?B?VVYzbWVLUjh6K0Q2WjlsY0M5N0s5UWZzdHdDL2ZVMUhmdFhpK0xpZS9jYkZS?=
 =?utf-8?B?bmNyYTZKeVZKRFdLN2tZQjZzakRIL3phQWFEN0ZQSjg4M0NXYmcrVzg4bmVD?=
 =?utf-8?B?ZHRSUTc5VFhvZHA3UExkbk5yclY2d0MrYzJ0cE5uTURkdmZmcVhpdy9QQzk3?=
 =?utf-8?B?RG1wVklFTGcxaXJFZ3lNQVNIaHNhNzgrcXkvT0JIb0h3SXhDYXVoSldpTi9R?=
 =?utf-8?B?SUE1N2FPaGVWTVhLZDgrc2dWMzFtUlhrZ1hoQWxhZXFabFhEcWRwd2YvL21s?=
 =?utf-8?B?MGo5TDc3clE3RzZWSzhRSXdiOWZ1NUJvQ29HakUwdEtZQ0VOVmhzYWVWdlRy?=
 =?utf-8?B?MUlBSnZwRGZ0OUYwdG5MbDR3YkNZUVd1Ykx0cTE3Mkt1WnR5NGEyL3B6bTFi?=
 =?utf-8?Q?OqTbqNGGFyPLqZ30nisCn72lEjVpxAGs?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 23:09:03.0181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1add0fa-0bb0-422b-2c98-08dcadc7f0ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6166
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

On 27/7/24 01:41, Danilo Krummrich wrote:

> On Fri, Jul 26, 2024 at 02:27:53PM +1000, Ben Skeggs wrote:
>>>>>> +
>>>>>> +static struct nouveau_drm *
>>>>>> +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
>>>>>> +		       struct nvkm_device *device)
>>>>>> +{
>>>>>> +	struct nouveau_drm *drm;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
>>>>>> +	if (!drm)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	drm->dev = drm_dev_alloc(drm_driver, parent);
>>>>> Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
>>>>>
>>>>> This also gets us rid of nouveau_drm_device_del().
>>>> No, we can't.  I originally had this change as a cleanup patch in the series
>>>> I posted implementing aux bus support.  However it turns out that in order
>>>> to avoid breaking udev etc, we can't use the aux device as parent of the drm
>>> Can you please expand a bit on what was breaking?
>> Sorry, I meant to say PRIME, not udev.  The device selection logic ties the
>> DRM device back to its sysfs node, and doesn't understand the auxiliary
>> bus.  So, if nouveau were to use its auxiliary device as parent of the DRM
>> device, PRIME breaks.
> The Vulkan device selector stuff looks like it should mostly work.
>
> However, I guess you refer to the loader stuff in Mesa that uses
> drmGetDevices2() from libdrm? This stuff indeed whitelists busses it accepts to
> report DRM device from:
>
> 	{ "/pci", DRM_BUS_PCI },
> 	{ "/usb", DRM_BUS_USB },
> 	{ "/platform", DRM_BUS_PLATFORM },
> 	{ "/spi", DRM_BUS_PLATFORM },
> 	{ "/host1x", DRM_BUS_HOST1X },
> 	{ "/virtio", DRM_BUS_VIRTIO },
>
> Not a big deal to just add it for a new driver, but obviously we can't just do
> this for an existing one.
>
>> Fortunately it didn't turn out to be necessary, and we
>> can happily probe() against the auxiliary device and still use the PCI
>> device as the DRM device's parent.
> At a first glance, I guess this should work. But, before we introduce
> workarounds like this one and add even more complexity, I wonder what's the
> benefit of doing this for Nouveau in the first place? I think we agreed to this
> split for Nova, for the reasons discussed in [1].

Because, as I already mentioned in the cover letter for series I posted 
implementing the auxiliary bus support, this brings immediate benefits 
to users, such as eliminating the long pauses on systems using prime 
whilst the entire GPU is woken up for some PCI query by userspace.

It also (finally) integrates Tegra in a reasonably clean fashion, and 
would allow the DRM-level suspend/resume code to be shared there too if 
someone were to implement the platform-level code for it.  That was not 
possible before.

>
> [1] https://lore.kernel.org/dri-devel/20240613170211.88779-1-bskeggs@nvidia.com/
>
>>>> device and instead have to continue passing the pci/platform device as we do
>>>> now.
>>>>
>>>> Using devm_drm_dev_alloc() with the pci device as parent would tie the
>>>> lifetime of the drm device to the pci device, which is owned by nvkm (after
>>> How does this tie the lifetime of the drm device to the pci device? It's the
>>> other way around, the drm device takes a reference of its parent (i.e. the pci
>>> device).
>>>
>>> I don't think there's anything wrong with that.
>> My understanding is that devres will cleanup allocations when the driver
>> detaches from the device.
> Right, I think I took that too literally.
>
> The lifetime of the DRM device (or more precisely one of its references) is
> bound to the binding between the parent device and its corresponding driver.
>
> But the lifetime of the parent device itself is bound to the DRM device.
>
> So, yes this doesn't work, and proves the point that initializing the DRM device
> with the parent's parent is just a workaround.

You're greatly overstating the "complexity" that's added here. It's a 
minor inconvenience that doesn't require much code at all to implement, 
and is essentially irrelevant outside of module load/unload.

I agree it's not ideal, and userspace should gain auxiliary bus support 
before a new driver implements a similar architecture, but it's really 
not that big a deal.

>
>> With the auxdev changes, it's *NVKM* that's
>> attached to the PCI device, not the DRM driver (which is attached to an
>> auxiliary device instead).
>>
>> This means that the devm_drm_dev_init_release() won't be called when the DRM
>> driver detaches from its auxiliary device as it should, but when NVKM
>> detaches from the PCI device, which isn't the most obvious and could lead to
>> confusion.
>>
>> It also entirely blows up in the split module case as nouveau.ko is unloaded
>> already by the time NVKM detaches and drm_dev_put() gets called.
>>
>>>> the auxdev series).  We could look at changing devm_drm_dev_alloc() of
>>>> course, but I think that's best left until later.
>>> I don't think that this is necessary.
