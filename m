Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F31902A66
	for <lists+nouveau@lfdr.de>; Mon, 10 Jun 2024 23:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601510E0A4;
	Mon, 10 Jun 2024 21:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZKqbty9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12610E529
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jun 2024 21:07:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUE+NngCUeddpCY2mByo+b0iY5p+n0TIoFvmIJE8EgMKnGPBOgGwb2P29j1V6Xqy986NjjU5NcZwSyW8heT7ghem5mzHcoTcx32r61q734exL14mCb0XLb7VpmFH6LeZdrMGooG1kzH7p1XaRl1IooEIDLSdIagCoFhGk/yiO7XlsFI34Mnp0hHxnu1HZWkrwEUihNx126KpXnA/qrH2i6cU47iviBlVbMpaX72KuMGm5gDcd5qJlYDsOX+pTKjBhNAEWZm5yv4zrr4MwsO3Tjgd6u4kNij6+cGDF7ehAvAFv64119s2MN+dCNFlfk4BRU3t2KmmJbDUggeKNU0Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaHUafvwsRXWQNJAj/uFpJy63PR1+P9MSIr1J6GvbTQ=;
 b=WOvlgHwNEcBaMx2FHYo2UiqMfZtRbyRJv4qyDULznzT7ZSYU36TT77+48kFDyvsDN63a/V3EDLaMNRAMg5zHIA17PMQSHcEqguoYjltSJ324qazi4ElJjyqZgbN24Ebad7L4KokKFZHi3mBhqZqqA5jdtF8RjMThqHmBeXChFyHKhKo17C4EjDWDdvFiCBJpnl2vC6yYrGZNY7NNZFVz3aMedUbhR8GN3opqDH4kPOtf4LAqtMmcuNjLMlOYyV3GmArKuCPGWdvyQgETsy82EbRXj4aFdIaITemsGFrWO8NtWtQVZ5+xXB1uwnX1rgH8fflNqPTSZPjuuxDUU38PEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaHUafvwsRXWQNJAj/uFpJy63PR1+P9MSIr1J6GvbTQ=;
 b=cZKqbty91bbUj/mTPv21cTar2jbVHVld/mWjGGUassvAHEMs7zn/bi3bMFcGJmwIeQWbbSLWURtfCFgjQK4PDYSY/1gx/1/AbYVoddPuxI1fOVx/aUEeQLRAeXRPHaay53J7/R+qwF+I+0h38PzsBBLWmfARnFzV2ecDNDtemDkfImbyEFKas1b8EQMp4qB7611tMCGAmAlGanVEfrXeiUEeAqoT4rMMBwWdc5b2Vjgv7VIFOG+i4hts/aVl8A4e3MLtdigOXPrOftTNsIaWg6YFjaOQbYkc63eRaqW6lRpI/wtw/+x9mjBeziCYQfn49FOcQxAhJWoAWvtkf28grg==
Received: from CH2PR15CA0015.namprd15.prod.outlook.com (2603:10b6:610:51::25)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 21:07:11 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::f1) by CH2PR15CA0015.outlook.office365.com
 (2603:10b6:610:51::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Mon, 10 Jun 2024 21:07:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 21:07:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:06:55 -0700
Received: from [172.27.35.123] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:06:54 -0700
Message-ID: <b6a8243d-2680-4cc5-a44c-3257805d8b94@nvidia.com>
Date: Mon, 10 Jun 2024 18:02:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/34] drm/nouveau: store nvkm_device pointer in
 nouveau_drm
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-3-bskeggs@nvidia.com>
 <56280b42-52b2-4233-b38f-b4864ea65633@redhat.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <56280b42-52b2-4233-b38f-b4864ea65633@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2f2a5c-82b3-4eef-b57f-08dc89914b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtxbHRUdmhVUHpqRGlrUUFPVW81Zm9YbjlkMWxoMkxCbU1wTGpPdktxcHNB?=
 =?utf-8?B?aGtIeGhmRDN4MFVyNktDeGJ3TnVMRFE0ZndQcmQvYWpFdm9WTUZOZXBYUmdQ?=
 =?utf-8?B?Wk53bXlXZkx5bE1NN0ZMQ2ZHWElvQ081Ty93R1F0OVBHRHB4VG15aGFVWkhL?=
 =?utf-8?B?a3VYQkxNcEQ2a2Z5Qmh3SjFwTDZEdTRrb2UxQ00zZEh3V3AzcUpEdm81YjNz?=
 =?utf-8?B?aXRTRXB3c1ZXYjNKT1d0VGtaVnRwbjZ3bXYvOGlIZ3FvcGNLSmsyWWR2SnZI?=
 =?utf-8?B?Ym9lMmtUWXIyeEM5a3YxRzdZR0YwRnl4UG44L3RVSUtaVE95T0V3aGlUbzRq?=
 =?utf-8?B?Rmp6b2tza3huanltK3JRM1UvSEtiM1NVYUJoanBBZVlxaGRaclVMK3JGdkZ2?=
 =?utf-8?B?ZFpYUU9pRzFxN1VjT2FSZUV6bXRZSkxXMGdNSy9ZaDI0SXZQSHhFWTB2aERJ?=
 =?utf-8?B?L214NVptaE5Rdm1uaGV0TjhYZVBQMXY2S1g3QUhlQjA0UDgyZngvdU9yeGdF?=
 =?utf-8?B?RFlXM05yZkQyb25HMWJSWU1OOUZaRHgrTVptUWJteTdhc25NNTdLeXdjZDAx?=
 =?utf-8?B?YXh2TExQZXhXdEY2N29mSmxFVW9oU05JOUF1SVVmRjcwWFJrUTY1OTh0VjMw?=
 =?utf-8?B?RW5MdnQrQjJBZGxYR3JuUW1XYVlVOThvRko3MHV5bThFTEJWUkpxVjNmN29R?=
 =?utf-8?B?T3FHSzI4RG03WFhCR2JiYzFlV0N4U2t1alVJNWFvY3pRNVVUUHMwejFEUGdP?=
 =?utf-8?B?WWNGUHNGUkV6dWlKdjlVK0xLR2dwMFFQRzZVNVpwS2pCNnRuTlE5U1pad2cv?=
 =?utf-8?B?aTJTdUdiUVMrbWtGckM2UmxVRFBIRzg1QlNxMy9tdVlqaGY0eDJ0RUVPKy9N?=
 =?utf-8?B?ZTJzWDhBWklMQlRPVGhUK2VYWGN1WnNKdHNlZi9TT1R0b1JLaDJzSVhmYUhT?=
 =?utf-8?B?c0lqcEY1ODdURTEwL1BkbmF2YWRiMGVkUE1CdXA1WGlSTTZvY1poYkV5QXYv?=
 =?utf-8?B?bi9ZK2FLNjZWaytoNHp4ZjRWenJUb0NFWUFJNEZOYWlwVmRoUkdGVGd1YUdF?=
 =?utf-8?B?bmhQZks0d1gvdlpMcm41THVmWGVobU1aTmx3V3U0OTY1aWgxRTl4YmhlQjJa?=
 =?utf-8?B?ajdZV210QU01TnhHVUxLbUlIU2ZoSDJSZlBuQ2NZZnpZU3M2RVRoRFFHeTgv?=
 =?utf-8?B?aUtSSlVXTVhqNjY2M2poeWt6dWFnYVVyS3RubjhOZUdOY214QS9PYkxrbTJM?=
 =?utf-8?B?eUY1eUNnZlYvdDMyQ3gwODRINEV2Zm5qeVk2NkVURGVzS2lBcHFJbU10TjJu?=
 =?utf-8?B?Q0t6YlNPZm8rMVplT1dTbmFjd21FR3dYcWRqUVk1bjZnVDREVGZvTzBqbXc0?=
 =?utf-8?B?NGFkcmxFR2hEVSsySHJVR08wUHpXdU5TVzF3aHJLa0hGSitpMnNVSUhCNWJ1?=
 =?utf-8?B?cTMzdDJlMEtoTk8zM1Bnd3hMa2dHUE9YVW9yNUVFWmo5UGxZSVJqTEIyUzZ3?=
 =?utf-8?B?QlBKZVVKTXJwMEMyRXY3QXBYY0FYMGpsTUVFRTlEbCs2TkNmajk5OW9QVzhR?=
 =?utf-8?B?S1dpSkVnck9XT2Q0eVo4NTllbS82NGVMVkpySyswWVJOSm91bkc5VUFzbTB5?=
 =?utf-8?B?cFMydG52UlBiZUw0b09kc054NkhmeFF4Z3dPSE9sbXBNb04wbkc4TmEzS2J0?=
 =?utf-8?B?WmtwbHVhQlRrV1d1ZVJOVGZQbVZzNm9UZXNHajMrb3NPeHRzUzdQVEJJYmF0?=
 =?utf-8?B?U2pwbHNsZkNTbWxSaTd6Z1MyMWlBQ2pqdGhjelpiRS9MVXM5QUorSGRlZWVm?=
 =?utf-8?B?Z1FLL1VFdlI5R0xzdGdOdDhMalI5dXZQNURjTERmL3Evcm1GTHdjRGJRMWNu?=
 =?utf-8?B?T0ljOGhNd2FLY3NGOXZiM3pvdTN5Qmxad0ZmUmxSM1I3Rmc9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 21:07:10.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2f2a5c-82b3-4eef-b57f-08dc89914b7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
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

On 4/6/24 20:20, Danilo Krummrich wrote:

> On 5/27/24 16:19, Ben Skeggs wrote:
>> There's various different places in the drm code that get at the
>> nvkm_device via various creative (and not very type-safe) means.
>>
>> One of those being via nvif_device.object.priv.
>>
>> Another patch series is going to entirely remove the ioctl-like
>> interfaces beween the drm code and nvkm, and that field will no
>> longer exist.
>>
>> This provides a safer replacement for accessing the nvkm_device,
>> and will used more in upcoming patches to cleanup other cases.
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 13 +++++--------
>>   drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
>>   2 files changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c 
>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index c37798b507ea..e6ed68dcef78 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -579,7 +579,7 @@ nouveau_parent = {
>>   };
>>     static int
>> -nouveau_drm_device_init(struct drm_device *dev)
>> +nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device 
>> *nvkm)
>>   {
>>       struct nouveau_drm *drm;
>>       int ret;
>> @@ -588,6 +588,7 @@ nouveau_drm_device_init(struct drm_device *dev)
>>           return -ENOMEM;
>>       dev->dev_private = drm;
>>       drm->dev = dev;
>> +    drm->nvkm = nvkm;
>>         nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>       drm->master.base.object.parent = &drm->parent;
>> @@ -830,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>         pci_set_drvdata(pdev, drm_dev);
>>   -    ret = nouveau_drm_device_init(drm_dev);
>> +    ret = nouveau_drm_device_init(drm_dev, device);
>
> NIT (and actually not directly related to this patch): It seems that we
> randomly switch between 'dev', 'drm_dev' for struct drm_device and
> 'device', 'nvkm' for nvkm_device. Since this is a cleanup series, mind
> adding a patch to get this straight?

Yeah, this was annoying me (again) recently.  I haven't fixed all of it, 
but I pulled in a patch from another series, and added another, to 
address a bunch of the "drm_dev" usage.  I think it'd be good to look at 
this again after landing all the various other cleanups (some of which 
end up removing other cases), and cleaning up whatever's left then.


>
>>       if (ret)
>>           goto fail_pci;
>>   @@ -861,14 +862,10 @@ void
>>   nouveau_drm_device_remove(struct drm_device *dev)
>>   {
>>       struct nouveau_drm *drm = nouveau_drm(dev);
>> -    struct nvkm_client *client;
>> -    struct nvkm_device *device;
>> +    struct nvkm_device *device = drm->nvkm;
>>         drm_dev_unplug(dev);
>>   -    client = nvxx_client(&drm->client.base);
>> -    device = nvkm_device_find(client->device);
>> -
>>       nouveau_drm_device_fini(dev);
>>       drm_dev_put(dev);
>>       nvkm_device_del(&device);
>> @@ -1376,7 +1373,7 @@ nouveau_platform_device_create(const struct 
>> nvkm_device_tegra_func *func,
>>           goto err_free;
>>       }
>>   -    err = nouveau_drm_device_init(drm);
>> +    err = nouveau_drm_device_init(drm, *pdevice);
>
> Same here, 'pdev' for struct platform_device and 'pdevice' for a ** to a
> struct nvkm_device seems confusing.
>
>>       if (err)
>>           goto err_put;
>>   diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h 
>> b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> index e239c6bf4afa..b711e994407b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> @@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, 
>> unsigned int size)
>>   #include <nvif/parent.h>
>>     struct nouveau_drm {
>> +    struct nvkm_device *nvkm;
>>       struct nvif_parent parent;
>>       struct nouveau_cli master;
>>       struct nouveau_cli client;
>
