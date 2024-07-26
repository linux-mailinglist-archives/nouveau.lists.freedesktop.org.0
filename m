Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C893CD31
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB6110E130;
	Fri, 26 Jul 2024 04:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b9yka1sz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D994710E130
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad6AFnoF6VMsMrJ78CHWHuCogfcmsGk0bt2O4twvCLGD/vKlumbal5Sx7xxAgjh2W4QVRwZaK6CuV3Zk1ndcoLgRsrQ7gDgufs+2rOPlglcu4O67PP1yu5zJz6nu97x7FiWuZJX6zuNUuAgPDR0++Nn0BCopfy6MJ43SQExhdUmwSot+X4ZaCmkhnPL5wfV8kO9BNGZcgZAGjDqzAwIkkP5I3LhXjfx6lB80ivv/ERQ044zFC7/817OSeykgikwhhyk2bDHwQXA6sWyPQvOAgT2pWb08PCgFgUeoEkoPQCC7tnVIyf3wcQgVljlFFZQ/GzjUqLiAUGJb97zdg1JRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89gM5lADMeaTNhz/zKFZxq+ecz0M/JBrBzPcJuZie0w=;
 b=TlKESZA3FqgAY/VLYaMm0YGHNJxpPrBfQBW5raCv9CnPHlVbZaVQzZk0kXJQSEP18yRXbra3HTSO5OjdobzCyS+OD3y92l8uPGLFv2477/nRO41Lw3amM3XUm8xRLKnfz3VFpVDW7o5CpXBzPTb7nB7cHZQT5fuGWR8TszQ5/yY7qiImC3YPk6NOa7e8iiueR3lNSq4Xmw496ittUDN8xdZ0VRy420u4fqax2ozHHCCjtKCCzEsI6thXFTSIfNsuUtJnxdde7rvMHWKSnGU75jBC2V8i0n7xa/29PkmJyZWFYwA+SQbhCuynGEha+W7HcVzm5kOO6+7VJWCZUSph0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89gM5lADMeaTNhz/zKFZxq+ecz0M/JBrBzPcJuZie0w=;
 b=b9yka1sz130Gtea+foiv9nKqeZ8U3tMJTGRm89Ip480t5ByrWDmsQ3iUiTwPN5o+Mc8pigZWqblV/ty3ldzI+Nfc2KyvG0iCS3fmW0nq+dG/v4bC4lbWuaPuelLm+WzH6JiMoFGy5fQ+85haXsWhyphO7wVqFooJgAAHODp7dP9CowenV6EUsIYHnBmluGYGn6H6+wMXhGfxdVPgdTTDSCdSYRAwiiwTOkAA76UtYbCVLrLtnfVydhvxJVtNJCkmlZtaHIvpiolKGkM7BdMG9hnKESYngK50sFI+r8DXmnA3RTyT+W29Z5vhhIppn2FpBSDQzulRmwon/6OSqsXPIg==
Received: from MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Fri, 26 Jul 2024 04:29:32 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::42) by MN2PR01CA0050.outlook.office365.com
 (2603:10b6:208:23f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:29:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:29:21 -0700
Received: from [172.19.245.110] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:29:20 -0700
Message-ID: <923f3c95-5763-428a-85fb-c0062cbf9396@nvidia.com>
Date: Fri, 26 Jul 2024 14:29:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/37] drm/nouveau: move allocation of root client out
 of nouveau_cli_init()
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-7-bskeggs@nvidia.com> <Zo1YMjbL5ax8deYL@pollux>
 <ab2b00fd-e7e5-49d2-aab3-c6f9b1f5c53d@nvidia.com> <ZppP67rPLTjoWyfQ@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZppP67rPLTjoWyfQ@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc27158-0814-4da2-0f60-08dcad2b8bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWRnL3YvUnI3MnJyaXg2c0V1SzVlVlRZclhqVTFpTXNNeFpJcC9tZGJ4K3F3?=
 =?utf-8?B?VEwrSjl4ZXBxMm9RYVM1ekxVTkdBbzljcFlId3d3YU9jUHAxTlhYcE9ydGhZ?=
 =?utf-8?B?ZFpJVk1CMUkvUVZQTlgyNWU3dTJxWkEySjhVVTZuRUZ4YjZudzk0enNTUmNq?=
 =?utf-8?B?a0dWVEwxdEU0bkhrYXBwREwrQVQ2SUJwNk1EL2FrRnFvRXZBSURjaWlIQzRV?=
 =?utf-8?B?L3NNbE41bURUek1DdE1taG9SNmxaSHdWWkdzZVp3eEVSWXdqSzhSSVBwNXBh?=
 =?utf-8?B?Z2RET2RGZ0FsZWZTUzYzbDYvV2lTQ1YzenhVK3VIOFNWL0JHTkh0YzMzSXk3?=
 =?utf-8?B?dWJCNUt5TitCU3BuT2RvTDBuQ0Nsd1ovS1ZUYjIvM1BxZDdHcm5xQ0ljSXpU?=
 =?utf-8?B?dWk4SVFxZHQ0TnF5RkJxNW02ZGNzbHpMbFdsZHFIQVJwS3hyaHBMdnd2KzE5?=
 =?utf-8?B?bGExZFRHTlJ6blBTU2FZSFVXY1hYdzRFWGxqMWQwdmJkakdnYmRLejZpOVR2?=
 =?utf-8?B?YWpScGtZUFRXMzEraTFFTEdrdG0ySW1kZnFOSGpOUjNlTm1DVUNwSWtIclc2?=
 =?utf-8?B?T2lJMTcvY1FFWkUrbDRRZUVCZmJoOTRhUDZWOFQyT1g1VjMvVWpuVDFxT0g0?=
 =?utf-8?B?NnhNazJ2aFBaV0FSbUZST1c0ZGMyekhYOTF5cHlmb3NUalcwdVp6UFF0Y2Vm?=
 =?utf-8?B?b3kxdDlQMGNHamFadVBDK2Nqd1o4VzlpZkRvUW9DU0gxTjI1TmJLeXJUTml5?=
 =?utf-8?B?Tm9QRXRGRzZ0MHdScXRRWXVGcHc1ZElOTTY1cHFYNUFDczFHMDhub080UzVq?=
 =?utf-8?B?SVRGK3BLQTBjSE5DdjJ3YTZsdzhpdEJ2b2VkcG12NzJ5TXhlY1E2WVJ0WXVI?=
 =?utf-8?B?VUR5N0RqZ2U3UEVBOEUrQkw1aHAzYlcxeTlxcmkxS21zSjRLWTMyUEFpTFdI?=
 =?utf-8?B?T3YxcXNnT2w0dDdlckRjRmlMRkZlT1diZUNwcGFUMHlhYlI3UmpaU2c5dTZn?=
 =?utf-8?B?NEZaaWx2Q1lTVmw1RWRNTW5kVnU5bWR3dXZjM1hJbHFkU1BWTmZ2aTFpWk1m?=
 =?utf-8?B?REFOR1B3UnUveC8xd0NxL0VNVXhZVUhiOEdObkxtcmYyS2lxWkpGZjNSTTZO?=
 =?utf-8?B?TFQrNlBxSm1JZDdFVjFRakhtNHJZNXlQMXVhNE1mdnpST2d0eURLTCt4dmNq?=
 =?utf-8?B?T0IrdzBselBkWDI4a1NyQ2thaWwxN3Y3WE1qMG85QjVpdWNDQ3VhZW9lRU5T?=
 =?utf-8?B?dXdTNGxXWUhoZ1N3NnNxRUhOOC9IU0FEZm1SSHRCcHNxWUdTaDduMkhiNjBO?=
 =?utf-8?B?VmVoWWY0MjBsc3dlR2tPelF3QUg0bklYaGovS0pJdk1Cb3VFUkU0Y3JCTWds?=
 =?utf-8?B?UHV4NXd4N0tXdGRiV1Ryb2NYVEhHc2xHVW9HTUgzSUMvOU12Z0RDYU5MVkwx?=
 =?utf-8?B?cXBiWC9BZXd4YVBMa0RnU3BlY1ZXMWlZS052ckg4dlVjbGVOUEorVXNwL2tk?=
 =?utf-8?B?ckR1emZBS3RobUQ0ejhlczVueWU0UG15aXlkbUZvNXdmSTZXVVBZSDZ0NENU?=
 =?utf-8?B?THhvQTdxejg4eEFDUUJvc2FQVWhNVUtKSUZQdXM3Vk1IN1EyV092aWNBNFNk?=
 =?utf-8?B?Z2hYRGhpcGdrNlZ6U1hyeFZjcFRFUk5CaGU3Z3Jnekl5bVNrZ3RZVXY4TVls?=
 =?utf-8?B?SVJWeTJ4ZUoxb0Y5N3pFMjY0RndQYjRSd3hheFMrT21PeXRNNkFhZjlwTVRW?=
 =?utf-8?B?bDJ0eUtpY2RRNnI2SlJRM3VqNEcvM3c1SStHdVFjZTJDaTVmaXd4MUNZUHMz?=
 =?utf-8?B?TEhXZlBDc2lueDNiWEVYdzFDZUpQaTFJUWdoYURWcGFpY3JvLzM0ZVBjSUtG?=
 =?utf-8?B?UXUrYWZJRXU3L2wvVzh6T0VXUDMxSWxpWlI3QnhSb0FsTXpINDZxQmREQkFy?=
 =?utf-8?Q?D+spqnaRKHCruZkDzUWqwOMYHDIIXLqh?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:29:31.9415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc27158-0814-4da2-0f60-08dcad2b8bda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177
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

On 19/7/24 21:37, Danilo Krummrich wrote:

> On Thu, Jul 18, 2024 at 05:29:20PM +1000, Ben Skeggs wrote:
>> On 10/7/24 01:33, Danilo Krummrich wrote:
>>
>>> On Fri, Jul 05, 2024 at 04:36:50AM +1000, Ben Skeggs wrote:
>>>> drm->master isn't really a nouveau_cli, and is mostly just used to get
>>>> at an nvif_mmu object to implement a hack around issues with the ioctl
>>>> interface to nvkm.
>>>>
>>>> Later patches in this series will allocate nvif_device/mmu objects in
>>>> nouveau_drm directly, removing the need for master.
>>> Please don't use future tense.
>>>
>>>> Another patch series will remove the need for the above-mentioned hack
>>>> entirely.
>>> Do you have those patches already?
>> Yes.  It's the "remove-ioctl" series, of which this one used to be a part
>> of.  I've mentioned it in the updated commit message regardless.
>>
>>
>>>> The only other member of drm->master that's needed is the nvif_client,
>>>> and is a dependency of device/mmu.  So the first step is to move its
>>>> allocation out of code handling nouveau_cli init.
>>>>
>>>> v2:
>>>> - modified slightly due to the addition of tegra/pci cleanup patches
>>>>
>>>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/nouveau_drm.c | 46 ++++++++++++++-------------
>>>>    1 file changed, 24 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> index 140e27af0d64..a942d2c03d44 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>>> @@ -129,12 +129,12 @@ nouveau_platform_name(struct platform_device *platformdev)
>>>>    }
>>>>    static u64
>>>> -nouveau_name(struct drm_device *dev)
>>>> +nouveau_name(struct device *dev)
>>>>    {
>>>> -	if (dev_is_pci(dev->dev))
>>>> -		return nouveau_pci_name(to_pci_dev(dev->dev));
>>>> +	if (dev_is_pci(dev))
>>>> +		return nouveau_pci_name(to_pci_dev(dev));
>>>>    	else
>>>> -		return nouveau_platform_name(to_platform_device(dev->dev));
>>>> +		return nouveau_platform_name(to_platform_device(dev));
>>> This looks like it should be a separate patch.
>> No.  One of its callers is now before drm_device.dev is valid. Also, the
> Which doesn't seem necessary. You could call drm_dev_alloc() before
> nvif_driver_init() in nouveau_drm_device_new(), can't you?

True.  I've made this change.


>
>> remove-ioctl series removes these functions entirely.
> Then why bother changing?
>
>>
>>>>    }
>>>>    static inline bool
>>>> @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>>>>    	nouveau_vmm_fini(&cli->vmm);
>>>>    	nvif_mmu_dtor(&cli->mmu);
>>>>    	nvif_device_dtor(&cli->device);
>>>> -	mutex_lock(&cli->drm->master.lock);
>>>> -	nvif_client_dtor(&cli->base);
>>>> -	mutex_unlock(&cli->drm->master.lock);
>>>> +	if (cli != &cli->drm->master) {
>>>> +		mutex_lock(&cli->drm->master.lock);
>>>> +		nvif_client_dtor(&cli->base);
>>>> +		mutex_unlock(&cli->drm->master.lock);
>>>> +	}
>>>>    }
>>>>    static int
>>>> @@ -241,7 +243,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>>>    		{ NVIF_CLASS_VMM_NV04 , -1 },
>>>>    		{}
>>>>    	};
>>>> -	u64 device = nouveau_name(drm->dev);
>>>> +	u64 device = nouveau_name(drm->dev->dev);
>>>>    	int ret;
>>>>    	snprintf(cli->name, sizeof(cli->name), "%s", sname);
>>>> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>>>    	INIT_LIST_HEAD(&cli->worker);
>>>>    	mutex_init(&cli->lock);
>>>> -	if (cli == &drm->master) {
>>>> -		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
>>>> -				       cli->name, device, &cli->base);
>>>> -	} else {
>>>> +	if (cli != &drm->master) {
>>>>    		mutex_lock(&drm->master.lock);
>>>>    		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
>>>>    				       &cli->base);
>>>> @@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>>>>    	nouveau_cli_fini(&drm->client);
>>>>    	nouveau_cli_fini(&drm->master);
>>>>    	destroy_workqueue(drm->sched_wq);
>>>> -	nvif_parent_dtor(&drm->parent);
>>>>    	mutex_destroy(&drm->clients_lock);
>>>>    }
>>>> @@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>>>    	struct drm_device *dev = drm->dev;
>>>>    	int ret;
>>>> -	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>>> -	drm->master.base.object.parent = &drm->parent;
>>> Moving this to nouveau_drm_device_new(), plus the resulting changes in error
>>> handling, don't seem to be related to this commit either.
>> They are, because they're needed by nvif printk macros, and as other
>> nvif-related setup moves to this function, they'll oops without it.
> Such things definitely deserve a comment, this is not obvious.
>
>> Yes, the linkage between "parent" and master.base (nvif_client) is clumsy,
>> but, once again, this is fixed in the remove-ioctl series.
> Less important if removed later on, but you still want to make it obvious to the
> reviewers that what you are doing is required and the "right" thing to do.
>
>>>> -
>>>>    	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>>>>    					WQ_MAX_ACTIVE);
>>>> -	if (!drm->sched_wq) {
>>>> -		ret = -ENOMEM;
>>>> -		goto fail_alloc;
>>>> -	}
>>>> +	if (!drm->sched_wq)
>>>> +		return -ENOMEM;
>>>>    	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>>>>    	if (ret)
>>>> @@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>>>    	nouveau_cli_fini(&drm->master);
>>>>    fail_wq:
>>>>    	destroy_workqueue(drm->sched_wq);
>>>> -fail_alloc:
>>>> -	nvif_parent_dtor(&drm->parent);
>>>>    	return ret;
>>>>    }
>>>> @@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>>>>    	if (drm->dev)
>>>>    		drm_dev_put(drm->dev);
>>>> +	nvif_client_dtor(&drm->master.base);
>>>> +	nvif_parent_dtor(&drm->parent);
>>>> +
>>>>    	kfree(drm);
>>>>    }
>>>> @@ -753,6 +747,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>>>>    	drm->nvkm = device;
>>>> +	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>>>> +	drm->master.base.object.parent = &drm->parent;
>>>> +
>>>> +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
>>>> +			       nouveau_name(parent), &drm->master.base);
>>>> +	if (ret)
>>>> +		goto done;
>>>> +
>>>>    	drm->dev = drm_dev_alloc(drm_driver, parent);
>>>>    	if (IS_ERR(drm->dev)) {
>>>>    		ret = PTR_ERR(drm->dev);
>>>> -- 
>>>> 2.45.1
>>>>
