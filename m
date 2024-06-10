Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22932902A68
	for <lists+nouveau@lfdr.de>; Mon, 10 Jun 2024 23:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DE910E52E;
	Mon, 10 Jun 2024 21:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Al3rZxhr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542110E420
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jun 2024 21:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFDAHyDanKcb5fVZUhf443MLyd/ZfXWagzKeXin3NrzaWLES4hU5+UxHPeZ1zUNpYwpT7RAlUjBoihC4dDa+qJbV+Hyf/rO8QVi5Kn+C82vyXOLrIseQbH38RtMRpg/jxHwnDpyGVcowX9GqYGOTZo0sdu+2pxqbqy77VtaNOemiV6CeP+r2kL6jM3J91DGQlZxlR7Ku1+v9q2LOO4sU8nQD0Tm+GMZF5BrpkvCak9hvQFPcBQ3JD1jbQk+N+H2EYp7TBAcRwAEm9smukG/tOlH8M0EIb2ozNcYfkgeumn0zaWbGwYKnIgez/m6MJC7r5UGyE5zrk1pDv8bHHrNBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLiYqyVu/mn9ULjC+Xs+LPxb27SNuyPjk4XzpcNeoeg=;
 b=dnFLvK748jC/51S17g5bv4XtcLZ0Rwosa58E9QuC3QEDQBAQ5/AR6N/zZ9hytXrMztprmXFM2PU507gDPmtvqm+PMd6nJIF6E9XiYuAGsm9bQRXjqUc3dXm8CiMKC82OsJwcC1kiJEp53utsbkD6JTNqmeoTaYlREWh46DXFXPWyKEVPieFfV0KyyS5bvHAuo2FI/Pv+mYjFK9X7/tI/tzpaXHJ0GnOveMPAJ+qU7SDn4mOd+joivQCJYUDP6S7RpzcBKgygyID400XL3eiqSRxhzAvPqPSX+y2yorzwHWVy/EDPH251qPKnlPiRkiKF2EbMdEShbqNMoVkLvOa7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLiYqyVu/mn9ULjC+Xs+LPxb27SNuyPjk4XzpcNeoeg=;
 b=Al3rZxhrT0IauaYW+h+uSHRTUKSrSKHe3Nepln9d0uAu3w9V461+VsVEJE7DSJ2yU+AzWZN3QRO1FyK34yZUfupzdksbuJXbj1Q9CwvW2/p9oBPtfsGRGo9cqcW9YRoppRgTSnCt/59GmOZPxG2rMir0X3Si3YDbramsGIfpIWDLQ6bZ8+SxRba72V6UEs7IL5TysTH5FXEP9SVn2+qeC3Y6KB2sVk5xi2h0lZvLQGblL8Sc72NtDrcYDGG1tVbWsAR9aTsdIkaaskAyC9qBOkhPEa3bFT2MV/YU1JnBCCcpHAj7bDy7HoErVAQLsba8C/FrnKNACUkLFjZ+7xl6dw==
Received: from CH0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:610:e5::35)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 21:07:43 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::7) by CH0PR03CA0270.outlook.office365.com
 (2603:10b6:610:e5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.23 via Frontend
 Transport; Mon, 10 Jun 2024 21:07:42 +0000
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
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 21:07:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:07:23 -0700
Received: from [172.27.35.123] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:07:22 -0700
Message-ID: <0f33eb59-7666-48d7-adb1-4596c523ab61@nvidia.com>
Date: Mon, 10 Jun 2024 18:02:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/34] drm/nouveau: move allocation of root client out of
 nouveau_cli_init()
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-4-bskeggs@nvidia.com>
 <440c7463-4611-411a-9270-d41712e5875a@redhat.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <440c7463-4611-411a-9270-d41712e5875a@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 94016f57-1741-4fa1-83db-08dc89915e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmlGanp4dXE4SFNYVzQ1WUdTcGYxSEozK3VZa0x4VGE0a09oaW5aemRmQi9H?=
 =?utf-8?B?NkxiV0tvSlV3WnhHTjhNRlVaUGlNNWtCS3BHbkdnU1VqdXFVT3lFNEZFejhk?=
 =?utf-8?B?eVJSY3hvWnhBcks0U21hcG15bGR0NGhyZytkcWwvejFSSlZIVDNwNDk5RUl6?=
 =?utf-8?B?eXRyQ0tTMmgxYWRGd09SeUgxSkZDVmh1Wlc5THFSVkdMMzk5cHEvWUVYUUE0?=
 =?utf-8?B?UVE1TE1jcjU0NGZhdVJUeWx5dGtaTERueld0RHhISFV3R0dZbWQ1RWpsRlFY?=
 =?utf-8?B?OENKaTQ2NFR3Q0ZQUzkzOE56WlhYbnVPcXBtdzdDZEtPcXlVWHR3WHBYaWdx?=
 =?utf-8?B?ZkxyQXBoMlcrK3VocVdvUXQ2VmlaSjQrc2lYdTFrdGRHR2Uzd1BTWC9hdXdH?=
 =?utf-8?B?NlpCVnBDOG9HMHRlR3ZyUlVYL0UyYjVjSnRqT2xEY2VHeGNDVEpDTGpsWEs1?=
 =?utf-8?B?ZGk0YWNQNDdyZUJyMmVXREhTblRWNDBTUU5aZ1Nyb2RMSGVxRGFmcHJwNnps?=
 =?utf-8?B?K0tXL2YweU5KZDEyS2tpVk16WUcrV0dLZ21mOGgzajhmZ3hGa0RWazJ4clVO?=
 =?utf-8?B?RlFtQlZ4M0JDK2cwQkd6VGdzNVoxZFZ6bUd6VXdHNkl2Z3RrL0tnQTRsRWl1?=
 =?utf-8?B?WU5vWXRSRjB4VlQ3UWlrbVdZOXhsYTRDOWxOek9POEZ4UDBSc0JNYXYvTGp6?=
 =?utf-8?B?bW1LNGV4MGJzODBacUE0TnFldEpRZ1greSttSmVBMTFBYXVjaHJTd29nSjJU?=
 =?utf-8?B?TmVKZGhRdUxDa2RHM1BKbTNOMTBPb1ZLSWxaeGZCejhXK0d1VjE4WU1UcG9I?=
 =?utf-8?B?cWlQMDluRVFhd0NOc0ozazExRzZtTVo4aEtOYlg4b3lVU3Y5cFYvOE1jU1c2?=
 =?utf-8?B?Um9WTjF1ejNkL1RQYm83OEwxRWE1U0JyTGxuajB2K0YwTWR6eUJHT1NHM2RK?=
 =?utf-8?B?ZmNWREJGRm5BNVBkQjE0QktVM0Z2aThBUTZoNlpMNVRtVHVXNkgxSVUyZW5X?=
 =?utf-8?B?YjM0UVlaSVdQbGJCdUFOTGRyZFFSWHVjNnlLb01iVUhITUVIOTl2UjY0ZzFy?=
 =?utf-8?B?NzhDaGlKa2E0OHg1elEvckVxeE1CN2drdU1BazhUSElGNnVydmNZTHduSnhH?=
 =?utf-8?B?Nytmc293ZFdqakd3YXpqUDBwdFlYZTRQS3kxV25vMk9FZlcrK3V5Q0dDTW9W?=
 =?utf-8?B?R2NkaTAwekZtNTM0bVVyUU04NjUyOGF2MzFmaGphMEZxbldVRXplU0JaZEpz?=
 =?utf-8?B?djI1aUFPeTdKcUNhdHo5MklGYTVGLzNMY3drWTc5Y05EdVNTS0RrdXgrYU8r?=
 =?utf-8?B?SlhzQ00ySTdvZkRqRHlrL3ZsWUZOK1NPYW5QQVNrRVd2bXFRaGZJdXVjcjl5?=
 =?utf-8?B?ODNVMXlubFV1cGI0N1RQdDErQWQ5SFVUVjhhVi80OVBObERtTXF6RzVldStI?=
 =?utf-8?B?S1FXeWpqZkttbDIvRGRvVkFpU1JxMW9LdEZvNHhhOVlEVVpSZnJTZWsxRXlN?=
 =?utf-8?B?Y2dPenNaZ3VMZnVUYTU5aTJJVExzS2h3ZmMzTllEODNLZWxJODJ4NlA4V1JZ?=
 =?utf-8?B?OVVnYkxNQ00yYW9XdG1GS0Z1dklWSUFTMlltQXpGYnhZNEx4eFNkd25VVGpG?=
 =?utf-8?B?aHhuaGFSbE5PZlArVU0vQjYvaElNaFNNNjZRaDh4Rk1qNnhmc3VJeFV4dGhN?=
 =?utf-8?B?MUlsYTkwQ0NvK2JoOEZZTE5WMVNUd3NZNEJsYSszTHdlMlB6dWNiSFFOSTEy?=
 =?utf-8?B?UXhSdlBCejA3eGs2ejNVVXF4VmtzbFVITisyNllHbFM0REh0bU9JTlp6Rjdu?=
 =?utf-8?B?RzFEYldBL1JCUUwzQmNRUmhBNXZUMkU4SFgyR3RDRUpqd3o1OHBwUW9iOFJw?=
 =?utf-8?B?VktyeFY1clhPRm5oeFQ1SlkrNG01bVk4eEQvMWNIbFBBNkE9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 21:07:42.5900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94016f57-1741-4fa1-83db-08dc89915e70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
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

On 4/6/24 20:53, Danilo Krummrich wrote:

> On 5/27/24 16:19, Ben Skeggs wrote:
>> drm->master isn't really a nouveau_cli, and is mostly just used to get
>> at an nvif_mmu object to implement a hack around issues with the ioctl
>> interface to nvkm.
>>
>> Later patches in this series will allocate nvif_device/mmu objects in
>> nouveau_drm directly, removing the need for master.
>>
>> Another patch series will remove the need for the above-mentioned hack
>> entirely.
>
> How does this patch improve the situation for removing the master 
> instance later on?

I've added a couple more lines to the commit message.


>
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c 
>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index e6ed68dcef78..25b9c3b19bc0 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>>       nouveau_vmm_fini(&cli->vmm);
>>       nvif_mmu_dtor(&cli->mmu);
>>       nvif_device_dtor(&cli->device);
>> -    mutex_lock(&cli->drm->master.lock);
>> -    nvif_client_dtor(&cli->base);
>> -    mutex_unlock(&cli->drm->master.lock);
>> +    if (cli != &cli->drm->master) {
>> +        mutex_lock(&cli->drm->master.lock);
>> +        nvif_client_dtor(&cli->base);
>> +        mutex_unlock(&cli->drm->master.lock);
>> +    }
>>   }
>>     static int
>> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const 
>> char *sname,
>>       INIT_LIST_HEAD(&cli->worker);
>>       mutex_init(&cli->lock);
>>   -    if (cli == &drm->master) {
>> -        ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
>> -                       cli->name, device, &cli->base);
>> -    } else {
>> +    if (cli != &drm->master) {
>>           mutex_lock(&drm->master.lock);
>>           ret = nvif_client_ctor(&drm->master.base, cli->name, device,
>>                          &cli->base);
>> @@ -593,11 +592,16 @@ nouveau_drm_device_init(struct drm_device *dev, 
>> struct nvkm_device *nvkm)
>>       nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>       drm->master.base.object.parent = &drm->parent;
>>   +    ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, 
>> "drm",
>> +                   nouveau_name(dev), &drm->master.base);
>> +    if (ret)
>> +        goto fail_alloc;
>
> Why move it above alloc_workqueue()?
>
>> +
>>       drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>>                       WQ_MAX_ACTIVE);
>>       if (!drm->sched_wq) {
>>           ret = -ENOMEM;
>> -        goto fail_alloc;
>> +        goto fail_nvif;
>>       }
>>         ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>> @@ -674,6 +678,8 @@ nouveau_drm_device_init(struct drm_device *dev, 
>> struct nvkm_device *nvkm)
>>       nouveau_cli_fini(&drm->master);
>>   fail_wq:
>>       destroy_workqueue(drm->sched_wq);
>> +fail_nvif:
>> +    nvif_client_dtor(&drm->master.base);
>>   fail_alloc:
>>       nvif_parent_dtor(&drm->parent);
>>       kfree(drm);
>> @@ -728,6 +734,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
>>       nouveau_cli_fini(&drm->client);
>>       nouveau_cli_fini(&drm->master);
>>       destroy_workqueue(drm->sched_wq);
>> +    nvif_client_dtor(&drm->master.base);
>>       nvif_parent_dtor(&drm->parent);
>>       mutex_destroy(&drm->clients_lock);
>>       kfree(drm);
>
