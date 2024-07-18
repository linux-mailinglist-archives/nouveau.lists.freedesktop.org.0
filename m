Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C4A9371A7
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 02:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DB710EA86;
	Fri, 19 Jul 2024 00:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WxfpqldE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4569010EA86
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 00:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMdepPugs7clLNdAzDh4W1W9T+hkFuZmsrr5XDjg+kMRaq2bFgqRJ6HCuAwpefothfzT/DpieB/RFoTz9ssLBC0IQIR64vlQ2ot2Jf8GW4n7XQTbqmsf+3uenP2Nk2iFoCkvClRv/HJ+6L8iBaNm3YPff5OyUdCfBgA6UHCJjkitlwepO26+4e+vA+3lCeoMtRuJEoN85SOnyJyccXS1+av3/gCruT9mAaS2VNIoCy1QdNVMlpJ7JWJEbEREvhnYc/rP6tL/0RLaM5YvwpNXuzSVbBAjowTQFIV7dRDDQRMuP8fuZ2CzrNEbX32guM6BeWS4UmFTrfo3jwYU40b7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu6QzOvIsAFgkXgCiJVFWPJ/xSsslCvDLHkyt5tl3u4=;
 b=zCIVUQa9VBGxrDBUu8F/hBJ7WBfyo+ltLG7f8c63HJkXUuXRj8N90Czgb/lp+wlZxQ89hdoaurnIDaqVgN4F9N2OzrvcNJOknkNGmM4n0cQmNH8hPTvAkcACJvLg0WtK6zBYPZ2Qgf1Kta5lkRrMXi9e+0koXUDt2S7Sozg9+cHj1Fp1YJgFMU5Twrx4QjrYwObYQflqlM74PRjICZrnCugwvtLlRbTszr1XPoIFYL6P8Rs85fTwrsc+a6z6n4+na1nPBl2A/bpQqqs0aVx4QZImH4SspvwS+NQrgirfGVPFWbODKitNmrnfozRM919fu/Jd4+GMDbiQqDZ5aApb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu6QzOvIsAFgkXgCiJVFWPJ/xSsslCvDLHkyt5tl3u4=;
 b=WxfpqldEotPFL9F+JYHZxXOrZpf+rUD1ZJ+dbUZuyb2a58h+IfC36QJ9wnrUoZkdzJ4OYsPzki7iQXTQ3UcsgogX964okXRSJpyxWU+mv79deHvS7mS3lRvLXThHwFy4AHecvB7QhZwDhF7QDqA+TwWBx3+TQ+NQvjYb+Q5ZIbsWZ+/d8HYSzreJaUxTt8HUg0nxknQq8hoSRcx8JTq4arTIdPR3RDM4HR0N9E3v+TVL4QbRLteHyvUPxCKXFOxhoDtkOizmauWVEdKWZfg+40zBPVSScYx/kpXPmVc6g5zXeEUMjxOu2gB97NyH7U9aQmpK7fpbclRW9HSXBKMiCw==
Received: from CH2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:610:57::11)
 by CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 00:52:04 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::63) by CH2PR12CA0001.outlook.office365.com
 (2603:10b6:610:57::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 19 Jul 2024 00:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 00:52:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:51:49 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 17:51:48 -0700
Message-ID: <dbfadb17-8b18-4637-8ddb-e1a50f349be3@nvidia.com>
Date: Thu, 18 Jul 2024 18:12:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/37] drm/nouveau: remove master
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-35-bskeggs@nvidia.com> <Zo1nlfrtZjPtHC6V@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1nlfrtZjPtHC6V@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|CH2PR12MB4181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7069a0-6932-44e8-3318-08dca78d01d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE91QnROS0QzSmxGSFRZbDg2YVZISDZaM2hLaGxVMWZ1ZnliZjNsSEJrMWYw?=
 =?utf-8?B?bXZXZ0kxTUNYdjhsMFBwSDVaejVIZ3B1YWt0Q20wNlVQOXZLL2JwYnhDQXJn?=
 =?utf-8?B?bzExVlVCV3h0Z1pVaG5ENXNHbmk4clNjOXJZUG52b3dpTEhrVGVqS3V0SDdu?=
 =?utf-8?B?MEZTZTJCaWtxaFJ0dkJPdC9iRjBocFJzNGppSlZPajFZQ0p5bEtNVThFZnZH?=
 =?utf-8?B?N2pFWlJoSm9udWJib0pNaFd5Z0V0UjcwYVN0SHYzbWtrZ2d6bVVuL2xKazcv?=
 =?utf-8?B?ZmI0OWdxSlhtM216Z3NRVHhsT2pHZWFWRU0veWd0U2tHN3UwNUN5aE0zUnQ0?=
 =?utf-8?B?blYwZ3ZBVk8ra3QxbEUrT1Z4eklvK1NPd1hDVmRuQ1I1SkJlRGJZYjRXZ3pY?=
 =?utf-8?B?c1pWaTJVRHRNbHY3eEJ0emJWVDdMaG1mQ3cwd3gwRkplQ3l2VWV5aHAzVkJW?=
 =?utf-8?B?cTdpSXE0ZytBdmdzZVdDaXdPQ2p4UElBWlN0ZUNWM0Fic2pINDlZK1VOQTI1?=
 =?utf-8?B?Zk95RUcwVFpWdFJzS1oxM1p0bG5tMDlzNEh1ZnM0bXZ1ZnRVdkFSRUtEeER6?=
 =?utf-8?B?a3ZtZC80ZGsxRFdCc0U1Nm1MaWN5bFpXTFhaUXdXb3lLVkNIWlk2ZVE2ZnA2?=
 =?utf-8?B?eWtJZkZCTEduaDFoZjE5akNlcnRnV1lIVE1oZXMxVGxSV29NazlOOFpnUGFT?=
 =?utf-8?B?T09ITTNleHhFZjFEUmcxUTNvd1ZKelNsU3JFMzVweCs0UncxMUhYcEoxdHlH?=
 =?utf-8?B?a016Z2ZDTitQOFo1ZVBvL3BYYks3MGdiLzdKamZFd2ltL2MyTkcrL3NwUVZ4?=
 =?utf-8?B?OWtCL3oyK2w5ZW1ZSjByR25JLytWek9qWk9MYlR5SUV3eGpDV1VSdWJmRkx0?=
 =?utf-8?B?aUZ0c0pab0ZxcGxXekc3OEZJRVdGUlVqeFdsZlpCK1pscCtWQjlIeElsZysw?=
 =?utf-8?B?QkM3Wkt1Zk1TMG5laDVSSjlWODNEeENDcHFzZVdUNmhNQlAydlNFODBXVFgy?=
 =?utf-8?B?NWdCWld2YVd3ZXlTaFN6eTRLK3dHSWZIdWVHcVR4ZFpRcXNzUUplREh1S0xu?=
 =?utf-8?B?NUMzcG5DbW1oZ0NXL3BsTHY3dFBxUGJZUVlzcDlQYzVmL3B1M3dLa3U4WUVx?=
 =?utf-8?B?aVkwNkFIVTIzVjk1cmJqYjZZaS85SzdDN3dpTDRla0dSWmQ5S01laDlPd1h0?=
 =?utf-8?B?L29nc05VaTdzeTUwYmhmcDJSbHh1VUtGc05xOUhxV25mN0Y3ZGtWUDQyb0dT?=
 =?utf-8?B?VnRZODRUT1JuTEhzQmt0RlU1N2Z3OEZORm9aM1AzS0dMc0VBd2FsY1QxQUg4?=
 =?utf-8?B?dmw1THE2dC9hL0xBa3V2bEFHVzU3TlhzQXRBdXVrbzFqV3dxVDcySjRkcE90?=
 =?utf-8?B?ODNXV3YzMFF4cURoMTFmNXVXMGJRVDk1Q3I1QlllZmJZL2F6eERHN21FR2g3?=
 =?utf-8?B?QndoVHg4OTEyTG9nU1NaUWJzdGVwRy9HMlNBaklwQUNoakJidUNmNitFNmc1?=
 =?utf-8?B?bmdDeEx0OXVvajAyYTQzSGhMV01YMXlyYWZMYzFOV01vSVFBUFRMTDdTOFUr?=
 =?utf-8?B?RUE4SXBKK0x4cmFGZCtFTFJ5VVNqRDVYaVJoWDdHdzVTd2xWNkF0LzFISHR2?=
 =?utf-8?B?SUZqSDdTeHdUWkV4ejZndzdNVGNlZFdIcTd3cWtzcGlzUnY2WFBBaFYrVW5N?=
 =?utf-8?B?L2tIZGM3TXZMWmFTR3JYTm5WaVlKMElDOVRBTWU0N3E3eDFqWFRJSi95R29q?=
 =?utf-8?B?K3A4cHdFTXhRNHZqWERERXpWeWZ0cWxBUVc2eEJpdVRKdFpvU05Ldnc5aWY4?=
 =?utf-8?B?UG9UdFh3M25rRFZuWnA2elJYTHE1NkhyWEdwRkozWnBvWjMzdU1POEY5MGtG?=
 =?utf-8?B?REdSTUtLMm1zMnZqVE9RVWlLNkVWaTdjVmpqV0laTS9Qcm93V0pDc0ZpL2V0?=
 =?utf-8?Q?jUdvuJ9y1ghFPiJXXepUEePKbCP8897m?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 00:52:04.0854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7069a0-6932-44e8-3318-08dca78d01d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181
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

On 10/7/24 02:38, Danilo Krummrich wrote:

> On Fri, Jul 05, 2024 at 04:37:18AM +1000, Ben Skeggs wrote:
>> The only remaining nouveau_drm.master struct member that's being used is
>> the mutex that protects its object tree.  Move that into nouveau_drm and
>> remove nouveau_drm.master entirely.
>>
>> Another patch series will make it possible to also remove the mutex, but
>> it's still required for the moment.
> It would be good to also mention what we're left with to protect and how we get
> rid of that later on.
I already mention what's left to protect?  I've modified the commit 
message to mention the remove-ioctl series regardless.
>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++----------------
>>   drivers/gpu/drm/nouveau/nouveau_drv.h |  3 ++-
>>   drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>>   3 files changed, 23 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index c6c9a528783a..85214d35fd5d 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -208,11 +208,9 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>>   	nvif_mmu_dtor(&cli->mmu);
>>   	cli->device.object.map.ptr = NULL;
>>   	nvif_device_dtor(&cli->device);
>> -	if (cli != &cli->drm->master) {
>> -		mutex_lock(&cli->drm->master.lock);
>> -		nvif_client_dtor(&cli->base);
>> -		mutex_unlock(&cli->drm->master.lock);
>> -	}
>> +	mutex_lock(&cli->drm->client_mutex);
>> +	nvif_client_dtor(&cli->base);
>> +	mutex_unlock(&cli->drm->client_mutex);
>>   }
>>   
>>   static int
>> @@ -245,11 +243,9 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>>   	INIT_LIST_HEAD(&cli->worker);
>>   	mutex_init(&cli->lock);
>>   
>> -	if (cli != &drm->master) {
>> -		mutex_lock(&drm->master.lock);
>> -		ret = nvif_client_ctor(&drm->master.base, cli->name, &cli->base);
>> -		mutex_unlock(&drm->master.lock);
>> -	}
>> +	mutex_lock(&drm->client_mutex);
>> +	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
>> +	mutex_unlock(&drm->client_mutex);
>>   	if (ret) {
>>   		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
>>   		goto done;
>> @@ -602,7 +598,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>>   	mutex_unlock(&drm->clients_lock);
>>   
>>   	nouveau_cli_fini(&drm->client);
>> -	nouveau_cli_fini(&drm->master);
>>   	destroy_workqueue(drm->sched_wq);
>>   	mutex_destroy(&drm->clients_lock);
>>   }
>> @@ -618,13 +613,9 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>   	if (!drm->sched_wq)
>>   		return -ENOMEM;
>>   
>> -	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>> -	if (ret)
>> -		goto fail_wq;
>> -
>>   	ret = nouveau_cli_init(drm, "DRM", &drm->client);
>>   	if (ret)
>> -		goto fail_master;
>> +		goto fail_wq;
>>   
>>   	INIT_LIST_HEAD(&drm->clients);
>>   	mutex_init(&drm->clients_lock);
>> @@ -691,8 +682,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>>   fail_ttm:
>>   	nouveau_vga_fini(drm);
>>   	nouveau_cli_fini(&drm->client);
>> -fail_master:
>> -	nouveau_cli_fini(&drm->master);
>>   fail_wq:
>>   	destroy_workqueue(drm->sched_wq);
>>   	return ret;
>> @@ -706,9 +695,10 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>>   
>>   	nvif_mmu_dtor(&drm->mmu);
>>   	nvif_device_dtor(&drm->device);
>> -	nvif_client_dtor(&drm->master.base);
>> +	nvif_client_dtor(&drm->_client);
>>   	nvif_parent_dtor(&drm->parent);
>>   
>> +	mutex_destroy(&drm->client_mutex);
>>   	kfree(drm);
>>   }
>>   
>> @@ -733,14 +723,15 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>>   	drm->nvkm = device;
>>   
>>   	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>> -	drm->master.base.object.parent = &drm->parent;
>> +	mutex_init(&drm->client_mutex);
>> +	drm->_client.object.parent = &drm->parent;
>>   
>>   	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
>> -			       nouveau_name(parent), &drm->master.base);
>> +			       nouveau_name(parent), &drm->_client);
>>   	if (ret)
>>   		goto done;
>>   
>> -	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
>> +	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
>>   	if (ret) {
>>   		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
>>   		goto done;
>> @@ -966,7 +957,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
>>   	}
>>   
>>   	NV_DEBUG(drm, "suspending object tree...\n");
>> -	ret = nvif_client_suspend(&drm->master.base);
>> +	ret = nvif_client_suspend(&drm->_client);
>>   	if (ret)
>>   		goto fail_client;
>>   
>> @@ -991,7 +982,7 @@ nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
>>   	int ret = 0;
>>   
>>   	NV_DEBUG(drm, "resuming object tree...\n");
>> -	ret = nvif_client_resume(&drm->master.base);
>> +	ret = nvif_client_resume(&drm->_client);
>>   	if (ret) {
>>   		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
>>   		return ret;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> index 2535a50b99f3..630463668a76 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>> @@ -203,10 +203,11 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>>   struct nouveau_drm {
>>   	struct nvkm_device *nvkm;
>>   	struct nvif_parent parent;
>> +	struct mutex client_mutex;
>> +	struct nvif_client _client;
>>   	struct nvif_device device;
>>   	struct nvif_mmu mmu;
>>   
>> -	struct nouveau_cli master;
>>   	struct nouveau_cli client;
>>   	struct drm_device *dev;
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> index b112b62dca3c..fac92fdbf9cc 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> @@ -80,9 +80,9 @@ nouveau_mem_fini(struct nouveau_mem *mem)
>>   {
>>   	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
>>   	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
>> -	mutex_lock(&mem->drm->master.lock);
>> +	mutex_lock(&mem->drm->client_mutex);
>>   	nvif_mem_dtor(&mem->mem);
>> -	mutex_unlock(&mem->drm->master.lock);
>> +	mutex_unlock(&mem->drm->client_mutex);
>>   }
>>   
>>   int
>> @@ -113,11 +113,11 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>>   	else
>>   		args.dma = tt->dma_address;
>>   
>> -	mutex_lock(&drm->master.lock);
>> +	mutex_lock(&drm->client_mutex);
>>   	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
>>   				 reg->size,
>>   				 &args, sizeof(args), &mem->mem);
>> -	mutex_unlock(&drm->master.lock);
>> +	mutex_unlock(&drm->client_mutex);
>>   	return ret;
>>   }
>>   
>> @@ -130,7 +130,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>>   	u64 size = ALIGN(reg->size, 1 << page);
>>   	int ret;
>>   
>> -	mutex_lock(&drm->master.lock);
>> +	mutex_lock(&drm->client_mutex);
>>   	switch (mmu->mem) {
>>   	case NVIF_CLASS_MEM_GF100:
>>   		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>> @@ -154,7 +154,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>>   		WARN_ON(1);
>>   		break;
>>   	}
>> -	mutex_unlock(&drm->master.lock);
>> +	mutex_unlock(&drm->client_mutex);
>>   
>>   	reg->start = mem->mem.addr >> PAGE_SHIFT;
>>   	return ret;
>> -- 
>> 2.45.1
>>
