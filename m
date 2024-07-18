Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80724937129
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 01:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B26210EB1C;
	Thu, 18 Jul 2024 23:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kPOpTwbG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C3110EB1C
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2024 23:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoNZcuOJFlt38HKfN5xQ4AbQc0uslX67J0tq+lNlIFtfr4UAZHu7UlUTj0OHscYrzyUz8jy54ri6uHGEeaAiVQq2CemU2gASnJbaJbb+CwQ8P3OW6ErAJMtIq+HMG0MfKcIsilUt0tZSUQdyXWP9Ee4qsivh5fQvHBVrWC4JVDfRi5/Cv7FsqyV16KWv0c5Sg0bSfTx5m/mDZPLDtJttRpt4ZAq09gOiTO6JpuJLsZEyONmgNXLP7KtfaJ9aa4ECTjjtYsiEnhhXPZ/D5OLX7VoE2EczpV7pFdvAq4aN2PytiI5EuhHC+mpNvYwl8D4I4vmgGphWJIhZXfmY3MvzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nifSexrgtYg7/Lf+EIZWZmSAqDzo1LM+ZPPPKM0s4SY=;
 b=rHRCpH6NinNRteS3fetJAMzmDgsM7txN0ONjCYz+hvYN4YSdGszcmxcJbHkRW1f/xzXzD9xTWvFJTlcuAG1Q0wxxdJ04smTSEFO8x19auFM+gjwMq6uU4SpMNt6wBSvJQI3VxiJznl4jzg6g/tt1vfWjoZ44UJ//AihXxcox4lZyC5BRLrA5Kbm/H8qckZN484uBSuKqBWFCfD/ez0TT3pln6zVYjc0x8vBHy/teI2+FvarXTw1rv9RLKh+t0b2/d4wBlL1Pj3TT/JmKR0aHrDQv6u6WPNruWsnA03+WrwF/8C5esPGH13x9SFEguAKs7Wm2c4bYW7KZz3FDphEA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nifSexrgtYg7/Lf+EIZWZmSAqDzo1LM+ZPPPKM0s4SY=;
 b=kPOpTwbGAvDFCUG+Ee07tmlDwO1HwCR9azPLbl4im71iCbhTKZdvqB9rXKCpnSiioJiqAGOu/O3kk+8e+dT+Ez3by2NZJETpDbpOAnSJldNbm6ANU7XnVNbMq/oMXDltKz1mXcvYw6E+dQaVm3542TxjuQpLFCwm4FKO87TUczGnHS+PzDvueZG2BSYSzYeIA28HLe7o9l7zTDABGcI5cbRDNkHRaAyAO9T1zDmPwgNwgKAK2ULT/eRkfpK4qoWOL1OVPIv/yqeYiy5xq5QkIspOInBHkGmk5gfcCAtoITlKJsH95DFH4HkBLE0LoPYDdFx/mHGlxgYnTFiW4YXAXQ==
Received: from SJ0PR03CA0249.namprd03.prod.outlook.com (2603:10b6:a03:3a0::14)
 by MW4PR12MB6706.namprd12.prod.outlook.com (2603:10b6:303:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 23:39:42 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::37) by SJ0PR03CA0249.outlook.office365.com
 (2603:10b6:a03:3a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 18 Jul 2024 23:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 23:39:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 16:39:22 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 16:39:20 -0700
Message-ID: <1706ad6a-d942-436f-90fa-cdd4ddcda02c@nvidia.com>
Date: Thu, 18 Jul 2024 17:00:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/37] drm/nouveau: misc. cleanups and removal of
 unused apis
To: Danilo Krummrich <dakr@redhat.com>
CC: <nouveau@lists.freedesktop.org>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <Zo1Mu6PrrEuSSR6M@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Zo1Mu6PrrEuSSR6M@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|MW4PR12MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 196772e0-4c75-4442-6c49-08dca782e5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2lSYmk1OVMycHgwQ3gybzZ6NWQvaEw0NnBBZWtPZWhJVmZpelpmRWFzU2sv?=
 =?utf-8?B?RmNCT3hEOG1ySWNiTTRhNFRtUnVhT1FwRzZaRkg2dE1IZzlnUnBvNVFpVFJm?=
 =?utf-8?B?OFpNeEorenJuaWFTb1FUeUdHdVZyU3BSZ0JvWkM2QXc5a1JWd3V0N3cvQzVO?=
 =?utf-8?B?RWZ5TE5zU0lVK1BTakRMd0FyOFR3N0JVYmFxREtac2NoRmZ5Szd5Q2duczJV?=
 =?utf-8?B?NkxUeUxFc3JXRzBhMWVJUFRWNjhreDdJZFR0SU92ckJ6eXlRM2hZOFF1T0Zl?=
 =?utf-8?B?SGpoZSsxN2VOaWJsVW1hUS9vcC9ldEhNbUhmODJpKzIzbUNobmVWQUpvaE5D?=
 =?utf-8?B?QkZTQzh3eVpkbmlqcU9jU2kyZnBuUFdqbWZ1SU9KRG95NHZCVVdaZk94d2h2?=
 =?utf-8?B?Qk1nNUdmVzBMSnN6dzUxUy9oWk0wREx1M280ZUdZaVBSYVRwbzQvVE9ZNVFq?=
 =?utf-8?B?d0ZQOTJFdDRlV2ZGZzJxdENLU2FtRXVaSFM0K0owSmcxb2pKT1Q5cGRkYzZp?=
 =?utf-8?B?UUZnWTMrS2R2TkFUL0NOSllDeXQyekZjMmV5NFVYWXNyNnVtdVJmT3hDeHdL?=
 =?utf-8?B?WlZXWHRCM1dhd1p5VHpLOG8rVkxtajVDWm9VVFpFeFFLK2YvWUJ2ZUlaOGp2?=
 =?utf-8?B?ZDhwaDdhVWQvVDBFSFV1SGtCUEl3K1NCQUtrTWNYMlB4UDJvS3VGSlZ4ZHcz?=
 =?utf-8?B?ZDVOVlh0TWVUTU5jRU4yeldsMTRlM2E3MXQzN3M0NWpyUjZpR04zSDNLaHNV?=
 =?utf-8?B?czh4Ly9jbkRoY25hbjc5N3lrQ0hHZWxRN2g4VEVFdHBlblh6K3lUNDI1VW52?=
 =?utf-8?B?SlZveWozVXBDaE5kZlJRMmliYlpQOHM4Nm1nbldIVUhqaDJDaThMbDM3aEpN?=
 =?utf-8?B?MnNJS0J5YkdPcTdpWWgyRlRVTHd1QnpIVTVVZVNyVVFja2ZqQTh5Nld2R2dv?=
 =?utf-8?B?TWxZaFp6dzFlRTZaMGZqdVFBOVpuekRkN09XQnZFYUJteS8zaUNxTmtadmlp?=
 =?utf-8?B?SEtDMHZibjdxTFlGYllGWFNsaHlCcFhVWE4xcGQ1bDJKL3FXYVZmWlR4Z05J?=
 =?utf-8?B?NXNaVEI0NlhDc1k4VCtYN2lndmtlQzZIaG9lQ0pIMWVXNDZYTGJmemtXUWly?=
 =?utf-8?B?bk51Z1NFZUhRQmtBcTZ5NnpJVG1iUUU3NFRBMVRRbmpxOUY4TElQajBxRHpi?=
 =?utf-8?B?MVY0WFZadXQvWjlGVzI1b3FieEdXN05jUnZuVjFDdkpHdVhJNSszaUIyVGtL?=
 =?utf-8?B?aTE1R3M1QWVRU3VaK2lVdzRQSy80QnhmNHdabXd2RGlSRjRpdHdpRE4xalEy?=
 =?utf-8?B?VjFWcStGTnM2T241cUp4bVZsNHFCVUkvcmhiNUp3R2FabllXNjFPWGJ6Ynhk?=
 =?utf-8?B?M253Ky9VQmJnNWhOSmx3QUVNS0R3QVdzeW9rM2NxbERjZ3M4WlhtTkplalFh?=
 =?utf-8?B?STY1eDZNZ3pKQ1VDaFdpVzY0N1E0elJ3NEloY2YvR2tkWlhSTGo1MzhrK2Q1?=
 =?utf-8?B?S3lrMVNTdmFGcG1rc0EvYkxiSGhYbDZFWWFUZ3BHR1kxb0xIR3VVaXlETFpw?=
 =?utf-8?B?UXlvajhBc3JCaEh1T1VBeEd0dHpjUCsvSW83Z0NSOU1JbE15RDhlOXZZMDU3?=
 =?utf-8?B?Wm5vVEZ5WXVYb0plKzFuM2lwS09wMGZINDNhK2xpWnF5WXhKckpEQnpMNGx2?=
 =?utf-8?B?QnBYRnI1NlFENEFkM28vQm40SVVlRTJlUUJpNW91bkdRdlJLR3k2UytFSXpr?=
 =?utf-8?B?L1l4NGozQk1RR3RNenErNTlidjRYMXZkYm5rTWpmVU03S3ovNFNvS3cwWFhR?=
 =?utf-8?B?VkRUT1FEb3Q1YmlOQlBiUER3MFMxNDFiYi8zeENhcm91K0hiSjRoeFdtclA4?=
 =?utf-8?B?ejcwN1llekdnb1dTZ2VLZHBUNlhRZENXcHFqT3ZlNW1RajJLdWluMFVPYm42?=
 =?utf-8?Q?MH9ScnbctEXeRnDSoXKhXsWWK+Qke4QV?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:39:41.9599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 196772e0-4c75-4442-6c49-08dca782e5b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6706
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

On 10/7/24 00:44, Danilo Krummrich wrote:

> Hi Ben,
>
> On Fri, Jul 05, 2024 at 04:36:44AM +1000, Ben Skeggs wrote:
>> This series is a smaller subset of the prior series I posted, that aimed
>> to remove the ioctl layer between NVKM and the nouveau DRM driver.
>>
>> Whilst this series doesn't go the full way, it aims to remove a bunch of
>> internal APIs that aren't useful anymore so they don't have to be ported,
>> and to cleanup a few paths in the DRM driver that have suffered from bit-
>> rot over the years to ensure it's safe to remove the ioctl layer next.
>>
>> There's more details of the specific changes in the relevant commits.
>>
>> A git tree is available at [1], and the remaining commits that were in
>> the prior series, but not this one, are available at [2].
>>
>> v2:
>> - prepended a couple of patches that begin to cleanup pci vs tegra
>>    paths, addressing some comments about variable naming, more in a
>>    future series
>> - rebased on current drm-misc-next
>> - other changes mentioned in their relevant commits
>>
>> [1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
>> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl
> Thanks for the follow-up.
>
> There are quite some checkpatch errors and warnings. It looks like most of them
> originate from moving around existing code.
>
> Did you check if you introduce new ones? Also, it's probably fine to fix
> existing ones when changing things up (where appropriate).

Yes, I checked this before I sent the initial series that this one was 
split out from.

Any additional ones introduced are from forward-declarations where the 
struct name itself tells you all the necessary information already - eg. 
"void nvif_client_dtor(struct nvif_client *);", as this is the style 
used nearly everywhere else in the driver.

A lot of the warnings you see from the code moves would fall into the 
same category.

Ben.

>
>> Ben Skeggs (37):
>>    drm/nouveau: move nouveau_drm_device_fini() above init()
>>    drm/nouveau: handle pci/tegra drm_dev_{alloc,register} from common
>>      code
>>    drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
>>    drm/nouveau: create pci device once
>>    drm/nouveau: store nvkm_device pointer in nouveau_drm
>>    drm/nouveau: move allocation of root client out of nouveau_cli_init()
>>    drm/nouveau: add nouveau_cli to nouveau_abi16
>>    drm/nouveau: handle limited nvif ioctl in abi16
>>    drm/nouveau: remove abi16->device
>>    drm/nouveau: remove abi16->handles
>>    drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
>>    drm/nouveau/nvkm: remove perfmon
>>    drm/nouveau/nvkm: remove nvkm_client_search()
>>    drm/nouveau/nvif: remove support for userspace backends
>>    drm/nouveau/nvif: remove route/token
>>    drm/nouveau/nvif: remove nvxx_object()
>>    drm/nouveau/nvif: remove nvxx_client()
>>    drm/nouveau/nvif: remove driver keep/fini
>>    drm/nouveau/nvif: remove client device arg
>>    drm/nouveau/nvif: remove client version
>>    drm/nouveau/nvif: remove client devlist
>>    drm/nouveau/nvif: remove client fini
>>    drm/nouveau/nvif: remove device args
>>    drm/nouveau: always map device
>>    drm/nouveau/nvif: remove device rd/wr
>>    drm/nouveau/nvif: remove disp chan rd/wr
>>    drm/nouveau: move nvxx_* definitions to nouveau_drv.h
>>    drm/nouveau: add nvif_mmu to nouveau_drm
>>    drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
>>    drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
>>    drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
>>    drm/nouveau: remove nouveau_chan.device
>>    drm/nouveau: remove chan->drm
>>    drm/nouveau: remove master
>>    drm/nouveau: remove push pointer from nouveau_channel
>>    drm/nouveau/kms: remove a few unused struct members and fn decls
>>    drm/nouveau/kms: remove push pointer from nv50_dmac
>>
>>   drivers/gpu/drm/nouveau/Kbuild                |   1 -
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  14 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dac.c        |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dfp.c        |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.c       |   7 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.h       |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/hw.c         |   9 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  21 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core507d.c   |   8 +-
>>   drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c       |  74 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.h       |  14 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  24 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>>   drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |   7 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  24 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   7 -
>>   drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 -
>>   drivers/gpu/drm/nouveau/include/nvif/client.h |  11 +-
>>   drivers/gpu/drm/nouveau/include/nvif/device.h |  37 +-
>>   drivers/gpu/drm/nouveau/include/nvif/driver.h |   5 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0000.h |  10 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
>>   drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  27 -
>>   drivers/gpu/drm/nouveau/include/nvif/object.h |  26 +-
>>   drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
>>   .../drm/nouveau/include/nvkm/core/client.h    |   1 -
>>   .../drm/nouveau/include/nvkm/core/device.h    |   1 -
>>   .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
>>   .../drm/nouveau/include/nvkm/core/object.h    |  14 -
>>   .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
>>   .../gpu/drm/nouveau/include/nvkm/core/os.h    |  19 -
>>   .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>>   .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>>   .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       | 321 +++++--
>>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |   6 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.c        |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  10 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   6 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo5039.c      |   6 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_chan.c        |  96 +-
>>   drivers/gpu/drm/nouveau/nouveau_chan.h        |   8 +-
>>   drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_display.h     |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dma.c         |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c        |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_drm.c         | 395 ++++----
>>   drivers/gpu/drm/nouveau/nouveau_drv.h         |  51 +-
>>   drivers/gpu/drm/nouveau/nouveau_fence.c       |  17 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c         |  21 +-
>>   drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
>>   drivers/gpu/drm/nouveau/nouveau_led.c         |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_mem.c         |  38 +-
>>   drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_nvif.c        |   2 -
>>   drivers/gpu/drm/nouveau/nouveau_platform.c    |  11 +-
>>   drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  12 +-
>>   drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
>>   drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
>>   drivers/gpu/drm/nouveau/nouveau_vga.c         |  14 +-
>>   drivers/gpu/drm/nouveau/nv04_fence.c          |   2 +-
>>   drivers/gpu/drm/nouveau/nv10_fence.c          |   2 +-
>>   drivers/gpu/drm/nouveau/nv17_fence.c          |  10 +-
>>   drivers/gpu/drm/nouveau/nv50_fence.c          |   2 +-
>>   drivers/gpu/drm/nouveau/nv84_fence.c          |  12 +-
>>   drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
>>   drivers/gpu/drm/nouveau/nvif/client.c         |  32 +-
>>   drivers/gpu/drm/nouveau/nvif/device.c         |  15 +-
>>   drivers/gpu/drm/nouveau/nvif/driver.c         |  32 +-
>>   drivers/gpu/drm/nouveau/nvif/object.c         |  40 -
>>   drivers/gpu/drm/nouveau/nvkm/core/client.c    |  64 +-
>>   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |  91 +-
>>   drivers/gpu/drm/nouveau/nvkm/core/object.c    |  50 -
>>   drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  42 -
>>   drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |   4 +-
>>   drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 -
>>   .../gpu/drm/nouveau/nvkm/engine/device/base.c | 479 +++++-----
>>   .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
>>   .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   2 -
>>   .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
>>   .../gpu/drm/nouveau/nvkm/engine/device/user.c |  93 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  24 -
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867 ------------------
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  | 165 ----
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
>>   .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
>>   drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
>>   128 files changed, 1105 insertions(+), 4199 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
>>
>> -- 
>> 2.45.1
>>
