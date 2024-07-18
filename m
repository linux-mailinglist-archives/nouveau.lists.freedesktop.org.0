Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2D93716F
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447710E0FF;
	Fri, 19 Jul 2024 00:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H5i4z+bw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3EC10EB48
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyUU6e772qItm8qFKVoRW+Y1ZNu3V824VINQ/MEXKvSZI+OnFSCLUkidVb5reL3f25Wy5l6NCSptQkUhA/2x2s5Nh6DL0TFMzIryBDnRGYioeePCMdx08XDSAjkV1YnID5eUqAfRX8JKjJfnY60hAuGNEyKWmDTtx8dgCtEfej3xueaJG+TB+w1kxF+z+iY5E5HAtlmHPOzHQshLd/nebQu5C10dMDkzakfw3EQY5xXH6Y4WQ7z24G8jZfQ6vfsHxwnHwQYyXs1/qA9BecjC75izKM4M5ZUGSOA/eaO2NE5JSK07IWCJIHl3LXc6/lyxjtZUjvNJ2IaJfFr1HgmDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLRUPdicQItV/2KS51sURiWgpviYMZh+CKDH8oVwoBs=;
 b=JYacAzmykmtu5mp3VHSodY+l0If40L/BoU2FDQ8ylJuivL4WjwOqm4jBYeMzO3JUwMzr44ulAAXJJsi74yZwg9pk5oopDiDk5Zsq94BO8EfABLbkHoJ9XOk+BmL1QXF7UGF1YX+YiWIzE7jXjEKnWVUXz6q4bOOHLd3ble2K8/2QqMzIu027aVFxxaG2v0AmUFDx7mcAPd/gNuTp9gRMaqqMtDKlj32M9bzm+U4XJVKfaHaFmy11EGX1VBWAVHT8kfPlXkY9pHBuZ+15NkTl22+39Fpavz4tilLVLFE10vIEfGYaC6o8AdsmKNT1nXzdpDxLcVneG1BMKu+PBx3OJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLRUPdicQItV/2KS51sURiWgpviYMZh+CKDH8oVwoBs=;
 b=H5i4z+bwll4XU54tqrQN0jCVZncjUGqxL68UqRE2fAcLDp3ZKiDQsQ/dX0osuH9lQAbN4yzvEbfy9uv2QSvtLdEwWscP9kEhX8bQqvRiu4j6MGCKnhj49XWrgZZLsRap0S01T8kl1xQosJ80GHGxwxpGHoAiHj/WnpWib9dugNXfcTY6hYocB8iRpPGi/g0uD3gHgorP3QJ6FMck4Uv5vKUEc/ICl1lLtuA6n9Mr56IcllpVg7yld8zPRRbV+j+kNns2ojpft4EiNw4w7bHliuqPYyOr3hER9SS7Xfvq9NH3s4fhFOma4Gtd9H5sLaj1eD2rXP1/fvKkRL5WRouIpQ==
Received: from MW4PR02CA0009.namprd02.prod.outlook.com (2603:10b6:303:16d::20)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 00:08:52 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::f3) by MW4PR02CA0009.outlook.office365.com
 (2603:10b6:303:16d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 19 Jul 2024 00:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:08:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:08:39 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:08:38 -0700
Message-ID: <ab2b00fd-e7e5-49d2-aab3-c6f9b1f5c53d@nvidia.com>
Date: Thu, 18 Jul 2024 17:29:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/37] drm/nouveau: move allocation of root client out
 of nouveau_cli_init()
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-7-bskeggs@nvidia.com> <Zo1YMjbL5ax8deYL@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1YMjbL5ax8deYL@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 576d460f-f4fe-40a6-ca05-08dca786f8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHBNenVLWm4zS0Z6NklwQlM2Ykw2N0kvOUxSVnRWK1lMMkJqeXBSWXpwd01B?=
 =?utf-8?B?c3l4NklnL2ZWMFZkTDdyckJCVER4V1BqM3VLVFgwaytDR0FWaWswSXlEemph?=
 =?utf-8?B?SkRJZU8vQ2NPbTExRnRqVHdzeDJpWGJWWUJJWHBzdURhUG9PRWt6MmlCYjdn?=
 =?utf-8?B?Vy9pZkgvcU9BRVZtSGdUWWdIUkM4YkJ1bGRwUVFJek1qUmdFcWRvRytVVmhy?=
 =?utf-8?B?cmh0ZThFZGpLbndSWk50K0U3RDJHbDhTdEFmL0Rhd2M0dXRiTlpEbFViWVBx?=
 =?utf-8?B?T1RGNFpDd2ppK2VrNG16SGRQeGFNcnZSRXdMcTh5cmF5R0FTQ2JWT2h3Y2la?=
 =?utf-8?B?UVZsMDg0bFZWYU9vVHliY3ZiWHRSd1NMak44OUV4VmhUT2dUcnU4d3VVd0N3?=
 =?utf-8?B?TkRRVEFZVkY0Wmw3NHFMQTRJNHVnbkw3Q2JjeFZ6OGRTMTJMaDF3NlNhUHlW?=
 =?utf-8?B?dGU0U3ZPVWx2SDlPeXJYaGlWQmJCMXppQlNkazNXMkhCZS9zQWw2NDcvM21v?=
 =?utf-8?B?bWRVUG5mc0FtRnZvR0ErMFREWVVUM0lOWERhNURwL2tJUVdaLzZhanlEVmRZ?=
 =?utf-8?B?ck1BNFBkNVlYcExpUFA4c1NEMStjVFE2QlZIRWdNZmNXbzNwZURKcEFDNFB5?=
 =?utf-8?B?bnN1ZTZsRHlJMWNRNWpnYm55eDNOQzJYM2s1clFxdVdlWVZNcjJFS1BBSWlC?=
 =?utf-8?B?STQxQm8yak9QUnk4aFA3NFpGUjhPT251VnEvNHJaU1RsNW1lNURueGE5R3BD?=
 =?utf-8?B?NnNDM0RqMFZDSUxuMHlJWHNVS2pNNXpKMHVFa25icUtadlFQV0lZZlMreHRF?=
 =?utf-8?B?YkFReFVUOWY0VEZhUXN0RlVINTVEYldYMDNrRDMzOUFiLzh0R29YdzE0UC9Y?=
 =?utf-8?B?N1dUaFk0cTQrQklIaVhabmFieHk4OUJsTjlzTUFTcy9KNDR5cDRKMXVZWXJE?=
 =?utf-8?B?VHdleWNtVXVQT29wTUxHSUNIWjRpY0NTd2cyOFFrVVJMRTVGZlBaTkhUUEJs?=
 =?utf-8?B?bzhCdWs1STNYNEEvUlo1TnhseTB4OC9sdmxOMkZTWGswOEp6M2VPaTBTRWFJ?=
 =?utf-8?B?SnEwM1o2dzE2aHJMdFAwRHZjbFIxc0xMSDI4LzRLRVdpZGhaWHFJMlhuVWlE?=
 =?utf-8?B?Q2dvSXNjRlQ1RFFhc0k1eWtZYUdJYWNaNlY2ZUw2R1pzQTZSWUVnUmdkOUVr?=
 =?utf-8?B?aVdtSDV6QVVPMGpEaktZVlh2QVE2bFIwWEV3cWRmYjg5UE5XWVZQODN4aVQr?=
 =?utf-8?B?bFJ6ZGY5ZUhmaSs1NVdIbEg4ZGhwbXRia2h6RmF2OHorQ3VPRlFiTmk4Y3ZW?=
 =?utf-8?B?YWVIYzF3a0V6SXNEdlRWSkVoMmtVQmlqM1J3WWR0dm1Qa2RkNXA4WkJHcFMr?=
 =?utf-8?B?aE5IdUpFckoxejZ6bmFERmdxNHdFYnNMSXJXVEZnc29GT2l2SWhDdDdqcXE5?=
 =?utf-8?B?dnZ6YTFwVFdIaDZsZkN6VDlKdmhQckxVOExDbjFyTXdLdUQ5b08vQWVrQlZQ?=
 =?utf-8?B?WUladW9saE5handGZXYzd0xiMmJQcUVtL1ptTlE2UmpjVGIxZUJDZDExQmFK?=
 =?utf-8?B?MUQ0Nzlrd2Q2RFoxa2pJV1R2eWpIOCtuUTM1UjMwbWRoWVNURlNCdlBxOUwz?=
 =?utf-8?B?UmNuYzBuVEROTzhTUlp6czZlUXo3UGMvUThQUC9vcEZwajg3VG9ub3V1Mm1R?=
 =?utf-8?B?VG1GSmZRYkpKSVdvQlJxVzJyNndlRU5UZG9KSEVZcFIyVjE0VjdDU3lZc0hV?=
 =?utf-8?B?UFlWYnVKR1V5emdxVE8yOVZMdEhTK3hZMWl4VmR0WXRvcXY3YzIraHVFa2Vw?=
 =?utf-8?B?S3dlZjJISGRQSUdORGdJN25hb3Fod05qTk03aitJcWJhRnQ4L0FqTGJZcFIr?=
 =?utf-8?B?a1lxOGhtbXpITG5hUGtwUXVweUZ2anNpQ0UyOHBvQUlhQ1lBMitqTDdlaFA3?=
 =?utf-8?Q?BCa+y4rUfAYPNIa76/ShKbDJHtXAzDGc?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:08:51.8294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576d460f-f4fe-40a6-ca05-08dca786f8ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162
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

On 10/7/24 01:33, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:36:50AM +1000, Ben Skeggs wrote:
>> drm->master isn't really a nouveau_cli, and is mostly just used to get
>> at an nvif_mmu object to implement a hack around issues with the ioctl
>> interface to nvkm.
>>
>> Later patches in this series will allocate nvif_device/mmu objects in
>> nouveau_drm directly, removing the need for master.
> Please don't use future tense.
>
>> Another patch series will remove the need for the above-mentioned hack
>> entirely.
> Do you have those patches already?

Yes.  It's the "remove-ioctl" series, of which this one used to be a 
part of.  I've mentioned it in the updated commit message regardless.


>
>> The only other member of drm->master that's needed is the nvif_client,
>> and is a dependency of device/mmu.  So the first step is to move its
>> allocation out of code handling nouveau_cli init.
>>
>> v2:
>> - modified slightly due to the addition of tegra/pci cleanup patches
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 46 ++++++++++++++-------------
>>   1 file changed, 24 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 140e27af0d64..a942d2c03d44 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -129,12 +129,12 @@ nouveau_platform_name(struct platform_device *platformdev)
>>   }
>>   
>>   static u64
>> -nouveau_name(struct drm_device *dev)
>> +nouveau_name(struct device *dev)
>>   {
>> -	if (dev_is_pci(dev->dev))
>> -		return nouveau_pci_name(to_pci_dev(dev->dev));
>> +	if (dev_is_pci(dev))
>> +		return nouveau_pci_name(to_pci_dev(dev));
>>   	else
>> -		return nouveau_platform_name(to_platform_device(dev->dev));
>> +		return nouveau_platform_name(to_platform_device(dev));
> This looks like it should be a separate patch.

No.  One of its callers is now before drm_device.dev is valid. Also, the 
remove-ioctl series removes these functions entirely.


>
>>   }
>>   
>>   static inline bool
>> @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>>   	nouveau_vmm_fini(&cli->vmm);
>>   	nvif_mmu_dtor(&cli->mmu);
>>   	nvif_device_dtor(&cli->device);
>> -	mutex_lock(&cli->drm->master.lock);
>> -	nvif_client_dtor(&cli->base);
>> -	mutex_unlock(&cli->drm->master.lock);
>> +	if (cli != &cli->drm->master) {
>> +		mutex_lock(&cli->drm->master.lock);
>> +		nvif_client_dtor(&cli->base);
>> +		mutex_unlock(&cli->drm->master.lock);
>> +	}
>>   }
>>   
>>   static int
>> @@ -241,7 +243,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   		{ NVIF_CLASS_VMM_NV04 , -1 },
>>   		{}
>>   	};
>> -	u64 device = nouveau_name(drm->dev);
>> +	u64 device = nouveau_name(drm->dev->dev);
>>   	int ret;
>>   
>>   	snprintf(cli->name, sizeof(cli->name), "%s", sname);
>> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   	INIT_LIST_HEAD(&cli->worker);
>>   	mutex_init(&cli->lock);
>>   
>> -	if (cli == &drm->master) {
>> -		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
>> -				       cli->name, device, &cli->base);
>> -	} else {
>> +	if (cli != &drm->master) {
>>   		mutex_lock(&drm->master.lock);
>>   		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
>>   				       &cli->base);
>> @@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>>   	nouveau_cli_fini(&drm->client);
>>   	nouveau_cli_fini(&drm->master);
>>   	destroy_workqueue(drm->sched_wq);
>> -	nvif_parent_dtor(&drm->parent);
>>   	mutex_destroy(&drm->clients_lock);
>>   }
>>   
>> @@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>   	struct drm_device *dev = drm->dev;
>>   	int ret;
>>   
>> -	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>> -	drm->master.base.object.parent = &drm->parent;
> Moving this to nouveau_drm_device_new(), plus the resulting changes in error
> handling, don't seem to be related to this commit either.

They are, because they're needed by nvif printk macros, and as other 
nvif-related setup moves to this function, they'll oops without it.

Yes, the linkage between "parent" and master.base (nvif_client) is 
clumsy, but, once again, this is fixed in the remove-ioctl series.

>
>> -
>>   	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>>   					WQ_MAX_ACTIVE);
>> -	if (!drm->sched_wq) {
>> -		ret = -ENOMEM;
>> -		goto fail_alloc;
>> -	}
>> +	if (!drm->sched_wq)
>> +		return -ENOMEM;
>>   
>>   	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>>   	if (ret)
>> @@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>   	nouveau_cli_fini(&drm->master);
>>   fail_wq:
>>   	destroy_workqueue(drm->sched_wq);
>> -fail_alloc:
>> -	nvif_parent_dtor(&drm->parent);
>>   	return ret;
>>   }
>>   
>> @@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>>   	if (drm->dev)
>>   		drm_dev_put(drm->dev);
>>   
>> +	nvif_client_dtor(&drm->master.base);
>> +	nvif_parent_dtor(&drm->parent);
>> +
>>   	kfree(drm);
>>   }
>>   
>> @@ -753,6 +747,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>>   
>>   	drm->nvkm = device;
>>   
>> +	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>> +	drm->master.base.object.parent = &drm->parent;
>> +
>> +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
>> +			       nouveau_name(parent), &drm->master.base);
>> +	if (ret)
>> +		goto done;
>> +
>>   	drm->dev = drm_dev_alloc(drm_driver, parent);
>>   	if (IS_ERR(drm->dev)) {
>>   		ret = PTR_ERR(drm->dev);
>> -- 
>> 2.45.1
>>
