Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A48AC23A
	for <lists+nouveau@lfdr.de>; Mon, 22 Apr 2024 02:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9536510EE80;
	Mon, 22 Apr 2024 00:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvs/COMw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165CB10E679
 for <nouveau@lists.freedesktop.org>; Mon, 22 Apr 2024 00:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrNsoq04/Bz2jk2yq6eVjO3wJYMNSOviLv+UumcfGibIhSGhS+l9qVxADnF+p+Cy4T47hCjewf1Ro6odIGEF5vAFt3TVYsAIv56/RRoI9I9eTqV0jQKm4ZGGe0FfyOfndcgsCqxqaMPT386L7tsSpr80T2YdI8cRSWVilM3bcYK87ms6IeKeLoHNebiz3AUoc6QIACtIvzmXzYSQFtGxEMqUPvI2BwmTqchssopDySTofHr687IicPTO2++1eKfO+GYn/QISsYjqIO8RueZFlhI97PJFZ0fKPSBG3aqZzJocrWOTxvb7MtP+449nBO0FKXXBn7AGPA/45a41m1xi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nG2svCrc/M//Re3JSscYKBW/ELJ8+yJ+vBTPqmcoug=;
 b=Xm0Fb2R9biE1YvA06WMQrhoXi1pHlowjc9Gjs6qab6lMLYQ6+q4Fx8ffpiB4kFHi7yQQJ2V5MwOD5jFOcys2VXgP+oGmjRdLvS9ArE8J6C37BLmKpswzJHBmDnxs0Qg5O7ua8JHVNQS7L0BG6wqe5gG1EKpZud6cjPDSLwbtmCeKztU0pQqc4BFpvSW8ZiFsFAi5b3gqGBocalI14egfZR9riU4aMAFTtNsu/JbMavSrAiz9Bng9b7ECpXMRaGMYTw9ciQX1M2G5zQ6ytPZGMcHd+JKsly0xkFdBLV1C9UHi+Sf3RN6k18G4OdosBLCcNYHmfVUv7bgnHl9kXT5mOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nG2svCrc/M//Re3JSscYKBW/ELJ8+yJ+vBTPqmcoug=;
 b=hvs/COMwL+RMLrdLFYRMv0JAhVjIDLwRZfGrcoqO//V+sccRNLu7sBUKGPaJnQRvjGVAlTz81Edh5zKNAeOuAw8KhxMyJ+IL1MSodqCI89KUmJ6fH0WYvgklFVByKNY2+a2Z0sJ3KmTA1u8W0BEE8nwjQGdhzHKJcPPoYebqV2p3V/467Uk7XhcZwou1qWRhK+mDDFb2DVIWAlJ+c/nj2VIMHwV8S+BzKy2Y+LjxZwXmGcegCZN9RfIkNmtzneU7byiZ3R8z0ZJxGWcJ4gvzLx+r4mUU167ZfWglqwMne5nnfne9zLXjkL9OXPIhS2/HfAP5gkCAB9muijHnPXD/5A==
Received: from CH2PR17CA0014.namprd17.prod.outlook.com (2603:10b6:610:53::24)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 00:12:58 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::6c) by CH2PR17CA0014.outlook.office365.com
 (2603:10b6:610:53::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Mon, 22 Apr 2024 00:12:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.19 via Frontend Transport; Mon, 22 Apr 2024 00:12:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 21 Apr
 2024 17:12:45 -0700
Received: from [172.19.145.127] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 21 Apr
 2024 17:12:44 -0700
Message-ID: <028f5a4a-245b-44a5-9482-6cec9bb0fdce@nvidia.com>
Date: Fri, 19 Apr 2024 23:52:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with trying to boot falcons from sgt memory + Possible
 firmware SG_DEBUG fix?
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
References: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: d4afb86a-374b-4b8c-1508-08dc6260f6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWJjdXJoamhmU1J5bCttRlpxWk1qQXlIdXhiSmxuaHdCM2RSRS9vbGd6QmU0?=
 =?utf-8?B?TERLWVNSd0EreHlSQmJzQkQrS05XOVhITmdGd1IxR0xDa0hJV0JuekhWR3ZN?=
 =?utf-8?B?MG9TU092Q1IxZjRRK2VSd1BEVUxGOGZuVVV5emU4SnJHZ0gxeS96WTZwN3JU?=
 =?utf-8?B?eERtNExwaWlTMjJQT0wyT1kybFVUZVNMaTVwSWtZZFdLLzNQOFhjNlQvMVRZ?=
 =?utf-8?B?Zk5Oa2FMMVVaOWlQMzJVOC96bkMySC9tNjNkdjRSYXB1Z2JXTWd3cU9aemE0?=
 =?utf-8?B?UVpodDZZLzBXazhhUnl1NEFJTkpLcVJ0N1VSOVhmSnZ6S1hTcnBtTzdkaVln?=
 =?utf-8?B?NFcyS2trWitqNGt2d3JxRURaSDVtcndjeDl1VzZBb1FoTmlYcGZySzU3WmN1?=
 =?utf-8?B?eXFvWjQ3TlF2eko1UHJaU3hnUkliUkZoVEhhU3plUFlQcHpuUEpkQjIwTnMy?=
 =?utf-8?B?b2JGSkVOT1AxNERHazJ6M3JHM2JoL2U1WHBUOCtwZUJIaXpIcVpQWGRFSWpY?=
 =?utf-8?B?V1N5VGhhMmdVK0lwbEJpblZHMlFiZkI0Y3VVakpFWkFHL00vU3d1akxpd3lh?=
 =?utf-8?B?bjg5OEc0dE5xZVhDUnkvcHQxVm9yOGJMcWViVkl6MHZrWmpZQVdJd1RNdXox?=
 =?utf-8?B?T0dsQVpUcjgzZkdGZmNJd1A1VVd3SDFaWFM2Z3B2VCt3MlluNFhkNTZGWWRU?=
 =?utf-8?B?VGlham90dllySElCZnA2QUxVT3NmcnlLMVJ6NG4xSFZyWSs1dThQWGw5OWVI?=
 =?utf-8?B?VEtKeWdMVisxQ3drOHdhbmRyaGgxMnMxNFJZWFhLRUNiUUR3ZklkVkNEMHMy?=
 =?utf-8?B?eVpESUgrazIwZFhFN09kK0lBakNZRkN1V0lpdExKcE1BekllYTdvRHViTXdI?=
 =?utf-8?B?KzJuQTNVaFVTMlBhT1RFWFRza2pzNWl3bTE1UUR5dFNtdTlyczhrazF3LzRH?=
 =?utf-8?B?b3JiZGh4Rk1nMVRZYU1ERER1Rmw3RWVSekRlM29mR2FPYUNWZlkyM3hLTE0w?=
 =?utf-8?B?bUE5Tld4enVNZXd2UkFHVDgrODJ1VEhsYnBvZFVadkJ3MEJuYWN3ejVOL1ha?=
 =?utf-8?B?TWRoWE14bnFZcXRCUW5XQlRiM2R4VDJDWWU0U0I1dkhoSElXZG9HaytKcmNn?=
 =?utf-8?B?NG5YUzBGRTE5L1pqNy9KejZTS1hnb1lwcVJQNWtDbWR1MlFNc05XQ3FrUnhE?=
 =?utf-8?B?ajhZVG5YaGFTY2pYS3dzVW1rM0xqN0hZQ0c0UWNUdVhZRVF2eExWNTEvQ3Yx?=
 =?utf-8?B?aXg2N2gycWJ0dkF5YlVqNjZHTHNZZGpXV1dMVTJCWkxvODdocDhGdFFGQW00?=
 =?utf-8?B?K0hveUorc2o3dzJSWkZEVENpVkNvSDEyaG9ndXJDNjc0QStwQUNRY0hPN0pS?=
 =?utf-8?B?QnYwTVB4WG1EanJrbmJjY1ZNYlh1OXF1T2lhRkppV2toOHFaS0tJUXhCMS9M?=
 =?utf-8?B?ZzE1d0pUTUJzTmNLZ1RCbVF0c0o3ZjA1QlU3Y0FqOXQrMkhjU0hTYTlWNERh?=
 =?utf-8?B?QjkvNGgrMEw0WVdocWo2ZW5oc21QM1ovbzdYbG9Zb29DSGdxVmJEVUNwT0lX?=
 =?utf-8?B?WkdkcGUrVGVGWVVhTXpubnlTczdjRkU3THN4bjcxNzlYczZvN2hoM0VLTGN4?=
 =?utf-8?B?K0lOK2ZTUER2TVhIZmFVUUNPdjB4MHF0UDBLMjRUQit1N3NBbDZ1Rkxzd29L?=
 =?utf-8?B?UnZOT0Nxc3JwRk9Bc1BBZHdybXpJUFlyVm5BQkNsNmhVVVhMMzRQVUlweFJY?=
 =?utf-8?B?eWd4MGVremtEVWQ3eWRKZ1IyUVBjYU10TG1NbnkxeGxRMEhHQVZFVWMvK3R5?=
 =?utf-8?B?QVhRR0h2SHRDaWtoSjJtdUNycmZETTBHQlRhSG8rdjV2R2xGWTYxWFBjRXlU?=
 =?utf-8?Q?xyEhVn/Wg/Mie?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 00:12:57.7950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4afb86a-374b-4b8c-1508-08dc6260f6f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
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

On 19/4/24 06:27, Lyude Paul wrote:

> So - first some context here for Ben and anyone else who hasn't been
> following. A little while ago I got a Slimbook Executive 16 with a
> Nvidia RTX 4060 in it, and I've unfortunately been running into a kind
> of annoying issue. Currently this laptop only has 16 gigs of ram, and
> as it turns out - this can easily lead the system to having pretty
> heavy memory fragmentation once it starts swapping pages out.
>
> Normally this wouldn't matter, but I unfortunately discovered that when
> we're runtime suspending the GPU in Nouveau - we actually appear to
> allocate some of the memory we use for migrating using
> dma_alloc_coherent. This starts to fail on my system once memory
> fragmentation goes up like so:
>
>    kworker/18:0: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
>    nodemask=(null),cpuset=/,mems_allowed=0
>    CPU: 18 PID: 287012 Comm: kworker/18:0 Not tainted
>    6.8.4-200.ChopperV1.fc39.x86_64 #1
>    Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
>    Workqueue: pm pm_runtime_work
>    Call Trace:
>     <TASK>
>     dump_stack_lvl+0x47/0x60
>     warn_alloc+0x165/0x1e0
>     ? __alloc_pages_direct_compact+0x1ad/0x2b0
>     __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
>     __alloc_pages+0x32d/0x350
>     __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
>     dma_direct_alloc+0x70/0x280
>     nvkm_gsp_radix3_sg+0x5e/0x130 [nouveau]
>     r535_gsp_fini+0x1d4/0x350 [nouveau]
>     nvkm_subdev_fini+0x67/0x150 [nouveau]
>     nvkm_device_fini+0x95/0x1e0 [nouveau]
>     nvkm_udevice_fini+0x53/0x70 [nouveau]
>     nvkm_object_fini+0xb9/0x240 [nouveau]
>     nvkm_object_fini+0x75/0x240 [nouveau]
>     nouveau_do_suspend+0xf5/0x280 [nouveau]
>     nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
>     pci_pm_runtime_suspend+0x67/0x1e0
>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>     __rpm_callback+0x41/0x170
>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>     rpm_callback+0x5d/0x70
>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>     rpm_suspend+0x120/0x6a0
>     pm_runtime_work+0x98/0xb0
>     process_one_work+0x171/0x340
>     worker_thread+0x27b/0x3a0
>     ? __pfx_worker_thread+0x10/0x10
>     kthread+0xe5/0x120
>     ? __pfx_kthread+0x10/0x10
>     ret_from_fork+0x31/0x50
>     ? __pfx_kthread+0x10/0x10
>     ret_from_fork_asm+0x1b/0x30
>
>    nouveau 0000:01:00.0: gsp: suspend failed, -12
>    nouveau: DRM-master:00000000:00000080: suspend failed with -12
>    nouveau 0000:01:00.0: can't suspend (nouveau_pmops_runtime_suspend
>    [nouveau] returned -12)
>
> Keep in mind, I don't dive into memory management related stuff like
> this very often! But I'd very much like to know how to help out
> anywhere around the driver, including outside of my usual domains, so
> I've been trying to write up a patch for this. The original suggestion
> for a fix that Dave Airlie had given me was (unless I misunderstood,
> which isn't unlikely) to try to see if we could get nvkm_gsp_mem_ctor()
> to start allocating memory with vmalloc() and map that onto the GPU
> using the SG helpers instead. So - I gave a shot at writing up a patch
> for doing that:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/commit/b5a41ac2bd948979815d262d8d20b4f3333f9c26
>
> As you can probably guess - the patch does not really seem to work, and
> I've been trying to figure out why. There's already a couple of issues
> I'm aware of: the most glaring one being that as Timur pointed out, a
> lot of GSP hardware expects contiguous memory allocations - but
> according to them the allocation that's specifically failing should be
> small enough that it'd be allocated in a contiguous page anyway:
>
>     [    9.429884] Lyude:r535_gsp_init:2186: (mbox1) == 0
>     [    9.429898] Lyude:r535_gsp_init:2186: (mbox0) == dbdfe000
>     [    9.491300] ------------[ cut here ]------------
>     [    9.491308] WARNING: CPU: 5 PID: 921 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1713 r535_gsp_init+0x75e/0x7c0 [nouveau]
>     [    9.491533] Modules linked in: nouveau(+) rfkill binfmt_misc vfat fat snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep wmi_bmof ppdev snd_hda_core drm_ttm_helper intel_rapl_msr snd_seq ttm snd_seq_device snd_pcm video gpu_sched snd_timer i2c_algo_bit drm_gpuvm drm_exec intel_rapl_common mxm_wmi rapl snd drm_display_helper acpi_cpufreq soundcore k10temp i2c_piix4 parport_pc wmi parport gpio_amdpt gpio_generic loop dm_multipath nfnetlink zram crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 r8169 realtek sha1_ssse3 ccp w83627hf_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables fuse
>     [    9.491670] CPU: 5 PID: 921 Comm: (udev-worker) Not tainted 6.9.0-rc3Lyude-Test+ #22
>     [    9.491681] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.I0 01/22/2019
>     [    9.491690] RIP: 0010:r535_gsp_init+0x75e/0x7c0 [nouveau]
>     [    9.491885] Code: 8b 83 10 0d 00 00 48 89 ef 41 bf e4 ff ff ff 48 8b 40 18 48 8b 80 48 0f 00 00 48 8b 40 28 e8 b9 5e 89 ee 0f 0b e9 73 f9 ff ff <0f> 0b 41 bf fb ff ff ff e9 5a f9 ff ff 41 89 ef 0f 0b e9 5c f9 ff
>     [    9.491905] RSP: 0018:ffffb271c175f748 EFLAGS: 00010246
>     [    9.491914] RAX: 0000000000000000 RBX: ffffa098e192f000 RCX: ffffa098ca2768c8
>     [    9.491922] RDX: ffffa098e191d400 RSI: ffffb271cc110080 RDI: ffffb271cc111388
>     [    9.491930] RBP: 00000000dbdfe000 R08: 0000000000000003 R09: 0000000000000000
>     [    9.491938] R10: 0000000000000000 R11: ffffa098ca276828 R12: ffffa098e192f008
>     [    9.491946] R13: 000000022b906452 R14: ffffa098e192f008 R15: 0000000000000000
>     [    9.491956] FS:  00007f4de98cc980(0000) GS:ffffa099c4a80000(0000) knlGS:0000000000000000
>     [    9.491966] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [    9.491974] CR2: 00007f7bd8d18ea0 CR3: 0000000104e58000 CR4: 00000000003506f0
>     [    9.491989] Call Trace:
>     [    9.491996]  <TASK>
>     [    9.492002]  ? __warn+0x80/0x120
>     [    9.492012]  ? r535_gsp_init+0x75e/0x7c0 [nouveau]
>     [    9.492200]  ? report_bug+0x164/0x190
>     [    9.492211]  ? handle_bug+0x3c/0x80
>     [    9.492218]  ? exc_invalid_op+0x17/0x70
>     [    9.492227]  ? asm_exc_invalid_op+0x1a/0x20
>     [    9.492241]  ? r535_gsp_init+0x75e/0x7c0 [nouveau]
>     [    9.492429]  ? r535_gsp_init+0x18e/0x7c0 [nouveau]
>     [    9.492616]  ? srso_return_thunk+0x5/0x5f
>     [    9.492626]  nvkm_subdev_init_+0x48/0x130 [nouveau]
>     [    9.492802]  ? srso_return_thunk+0x5/0x5f
>     [    9.492810]  nvkm_subdev_init+0x44/0x90 [nouveau]
>     [    9.492988]  nvkm_device_init+0x166/0x2e0 [nouveau]
>     [    9.493189]  nvkm_udevice_init+0x47/0x70 [nouveau]
>     [    9.493391]  nvkm_object_init+0x41/0x1c0 [nouveau]
>     [    9.493567]  nvkm_ioctl_new+0x16a/0x290 [nouveau]
>     [    9.493740]  ? __pfx_nvkm_client_child_new+0x10/0x10 [nouveau]
>     [    9.493912]  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau]
>     [    9.494121]  nvkm_ioctl+0x10e/0x250 [nouveau]
>     [    9.494288]  nvif_object_ctor+0x112/0x190 [nouveau]
>     [    9.494456]  nvif_device_ctor+0x23/0x60 [nouveau]
>     [    9.494625]  nouveau_cli_init+0x164/0x5d0 [nouveau]
>     [    9.494820]  nouveau_drm_device_init+0x97/0xe00 [nouveau]
>     [    9.495022]  ? srso_return_thunk+0x5/0x5f
>     [    9.495030]  ? pci_bus_read_config_word+0x4d/0x90
>     [    9.495039]  ? srso_return_thunk+0x5/0x5f
>     [    9.495047]  ? pci_update_current_state+0x72/0xb0
>     [    9.495059]  nouveau_drm_probe+0x12c/0x280 [nouveau]
>     [    9.495245]  ? srso_return_thunk+0x5/0x5f
>     [    9.495254]  local_pci_probe+0x45/0xa0
>     [    9.495263]  pci_device_probe+0xc7/0x240
>     [    9.495272]  really_probe+0xd6/0x390
>     [    9.495282]  ? __pfx___driver_attach+0x10/0x10
>     [    9.495290]  __driver_probe_device+0x78/0x150
>     [    9.495301]  driver_probe_device+0x1f/0x90
>     [    9.495308]  __driver_attach+0xd2/0x1c0
>     [    9.495316]  bus_for_each_dev+0x88/0xd0
>     [    9.495325]  bus_add_driver+0x116/0x220
>     [    9.495334]  driver_register+0x59/0x100
>     [    9.495342]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
>     [    9.495512]  do_one_initcall+0x5b/0x320
>     [    9.495524]  do_init_module+0x60/0x240
>     [    9.495536]  init_module_from_file+0x86/0xc0
>     [    9.495550]  idempotent_init_module+0x120/0x2b0
>     [    9.495562]  __x64_sys_finit_module+0x5e/0xb0
>     [    9.495571]  do_syscall_64+0x88/0x170
>     [    9.495581]  ? srso_return_thunk+0x5/0x5f
>     [    9.495589]  ? syscall_exit_to_user_mode_prepare+0x15d/0x190
>     [    9.495600]  ? srso_return_thunk+0x5/0x5f
>     [    9.495607]  ? syscall_exit_to_user_mode+0x60/0x210
>     [    9.495615]  ? srso_return_thunk+0x5/0x5f
>     [    9.495622]  ? do_syscall_64+0x95/0x170
>     [    9.495630]  ? srso_return_thunk+0x5/0x5f
>     [    9.495636]  ? do_syscall_64+0x95/0x170
>     [    9.495644]  ? srso_return_thunk+0x5/0x5f
>     [    9.495653]  entry_SYSCALL_64_after_hwframe+0x71/0x79
>     [    9.495663] RIP: 0033:0x7f4de9b2919d
>     [    9.495680] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b cc 0c 00 f7 d8 64 89 01 48
>     [    9.495697] RSP: 002b:00007ffc56bfe468 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>     [    9.495707] RAX: ffffffffffffffda RBX: 00005644a0432350 RCX: 00007f4de9b2919d
>     [    9.495717] RDX: 0000000000000000 RSI: 00005644a042ef30 RDI: 0000000000000031
>     [    9.495726] RBP: 00007ffc56bfe520 R08: 00007f4de9bf6b20 R09: 00007ffc56bfe4b0
>     [    9.495734] R10: 00005644a04346a0 R11: 0000000000000246 R12: 00005644a042ef30
>     [    9.495742] R13: 0000000000020000 R14: 00005644a0432d10 R15: 00005644a0434660
>     [    9.495754]  </TASK>
>     [    9.495759] ---[ end trace 0000000000000000 ]---
>     [    9.495778] ------------[ cut here ]------------
>     [    9.495784] WARNING: CPU: 5 PID: 921 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2187 r535_gsp_init+0xc5/0x7c0 [nouveau]
>     [    9.495981] Modules linked in: nouveau(+) rfkill binfmt_misc vfat fat snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep wmi_bmof ppdev snd_hda_core drm_ttm_helper intel_rapl_msr snd_seq ttm snd_seq_device snd_pcm video gpu_sched snd_timer i2c_algo_bit drm_gpuvm drm_exec intel_rapl_common mxm_wmi rapl snd drm_display_helper acpi_cpufreq soundcore k10temp i2c_piix4 parport_pc wmi parport gpio_amdpt gpio_generic loop dm_multipath nfnetlink zram crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 r8169 realtek sha1_ssse3 ccp w83627hf_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables fuse
>     [    9.496112] CPU: 5 PID: 921 Comm: (udev-worker) Tainted: G        W          6.9.0-rc3Lyude-Test+ #22
>     [    9.496123] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.I0 01/22/2019
>     [    9.496132] RIP: 0010:r535_gsp_init+0xc5/0x7c0 [nouveau]
>     [    9.496317] Code: 24 18 4c 8d 63 08 89 6c 24 14 4c 89 e6 6a 00 4c 8d 44 24 20 48 8d 4c 24 1c e8 b7 c3 fa ff 5f 41 89 c7 85 c0 0f 84 97 00 00 00 <0f> 0b 48 83 bb 20 0a 00 00 00 75 37 48 8b 44 24 20 65 48 2b 04 25
>     [    9.496333] RSP: 0018:ffffb271c175f748 EFLAGS: 00010246
>     [    9.496341] RAX: 0000000000000000 RBX: ffffa098e192f000 RCX: ffffa098ca2768c8
>     [    9.496351] RDX: ffffa098e191d400 RSI: ffffb271cc110080 RDI: ffffb271cc111388
>     [    9.496360] RBP: 00000000dbdfe000 R08: 0000000000000003 R09: 0000000000000000
>     [    9.496368] R10: 0000000000000000 R11: ffffa098ca276828 R12: ffffa098e192f008
>     [    9.496375] R13: 000000022b906452 R14: ffffa098e192f008 R15: 00000000fffffffb
>     [    9.496383] FS:  00007f4de98cc980(0000) GS:ffffa099c4a80000(0000) knlGS:0000000000000000
>     [    9.496393] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [    9.496400] CR2: 00007f7bd8d18ea0 CR3: 0000000104e58000 CR4: 00000000003506f0
>     [    9.496410] Call Trace:
>     [    9.496416]  <TASK>
>     [    9.496422]  ? __warn+0x80/0x120
>     [    9.496429]  ? r535_gsp_init+0xc5/0x7c0 [nouveau]
>     [    9.496622]  ? report_bug+0x164/0x190
>     [    9.496631]  ? handle_bug+0x3c/0x80
>     [    9.496638]  ? exc_invalid_op+0x17/0x70
>     [    9.496647]  ? asm_exc_invalid_op+0x1a/0x20
>     [    9.496660]  ? r535_gsp_init+0xc5/0x7c0 [nouveau]
>     [    9.496851]  ? r535_gsp_init+0x18e/0x7c0 [nouveau]
>     [    9.497044]  ? srso_return_thunk+0x5/0x5f
>     [    9.497055]  nvkm_subdev_init_+0x48/0x130 [nouveau]
>     [    9.497227]  ? srso_return_thunk+0x5/0x5f
>     [    9.497236]  nvkm_subdev_init+0x44/0x90 [nouveau]
>     [    9.497405]  nvkm_device_init+0x166/0x2e0 [nouveau]
>     [    9.497608]  nvkm_udevice_init+0x47/0x70 [nouveau]
>     [    9.497808]  nvkm_object_init+0x41/0x1c0 [nouveau]
>     [    9.497983]  nvkm_ioctl_new+0x16a/0x290 [nouveau]
>     [    9.498154]  ? __pfx_nvkm_client_child_new+0x10/0x10 [nouveau]
>     [    9.498326]  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau]
>     [    9.498531]  nvkm_ioctl+0x10e/0x250 [nouveau]
>     [    9.498702]  nvif_object_ctor+0x112/0x190 [nouveau]
>     [    9.498873]  nvif_device_ctor+0x23/0x60 [nouveau]
>     [    9.499049]  nouveau_cli_init+0x164/0x5d0 [nouveau]
>     [    9.499244]  nouveau_drm_device_init+0x97/0xe00 [nouveau]
>     [    9.499430]  ? srso_return_thunk+0x5/0x5f
>     [    9.499437]  ? pci_bus_read_config_word+0x4d/0x90
>     [    9.499445]  ? srso_return_thunk+0x5/0x5f
>     [    9.499452]  ? pci_update_current_state+0x72/0xb0
>     [    9.499461]  nouveau_drm_probe+0x12c/0x280 [nouveau]
>     [    9.499657]  ? srso_return_thunk+0x5/0x5f
>     [    9.499666]  local_pci_probe+0x45/0xa0
>     [    9.499674]  pci_device_probe+0xc7/0x240
>     [    9.499683]  really_probe+0xd6/0x390
>     [    9.499692]  ? __pfx___driver_attach+0x10/0x10
>     [    9.499699]  __driver_probe_device+0x78/0x150
>     [    9.499709]  driver_probe_device+0x1f/0x90
>     [    9.499718]  __driver_attach+0xd2/0x1c0
>     [    9.499726]  bus_for_each_dev+0x88/0xd0
>     [    9.499735]  bus_add_driver+0x116/0x220
>     [    9.499744]  driver_register+0x59/0x100
>     [    9.499751]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
>     [    9.499915]  do_one_initcall+0x5b/0x320
>     [    9.499926]  do_init_module+0x60/0x240
>     [    9.499934]  init_module_from_file+0x86/0xc0
>     [    9.499948]  idempotent_init_module+0x120/0x2b0
>     [    9.499962]  __x64_sys_finit_module+0x5e/0xb0
>     [    9.499971]  do_syscall_64+0x88/0x170
>     [    9.499987]  ? srso_return_thunk+0x5/0x5f
>     [    9.499996]  ? syscall_exit_to_user_mode_prepare+0x15d/0x190
>     [    9.500004]  ? srso_return_thunk+0x5/0x5f
>     [    9.500011]  ? syscall_exit_to_user_mode+0x60/0x210
>     [    9.500019]  ? srso_return_thunk+0x5/0x5f
>     [    9.500026]  ? do_syscall_64+0x95/0x170
>     [    9.500034]  ? srso_return_thunk+0x5/0x5f
>     [    9.500041]  ? do_syscall_64+0x95/0x170
>     [    9.500050]  ? srso_return_thunk+0x5/0x5f
>     [    9.500058]  entry_SYSCALL_64_after_hwframe+0x71/0x79
>     [    9.500067] RIP: 0033:0x7f4de9b2919d
>     [    9.500075] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b cc 0c 00 f7 d8 64 89 01 48
>     [    9.500091] RSP: 002b:00007ffc56bfe468 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>     [    9.500103] RAX: ffffffffffffffda RBX: 00005644a0432350 RCX: 00007f4de9b2919d
>     [    9.500112] RDX: 0000000000000000 RSI: 00005644a042ef30 RDI: 0000000000000031
>     [    9.500121] RBP: 00007ffc56bfe520 R08: 00007f4de9bf6b20 R09: 00007ffc56bfe4b0
>     [    9.500128] R10: 00005644a04346a0 R11: 0000000000000246 R12: 00005644a042ef30
>     [    9.500136] R13: 0000000000020000 R14: 00005644a0432d10 R15: 00005644a0434660
>     [    9.500149]  </TASK>
>     [    9.500154] ---[ end trace 0000000000000000 ]---
>     [    9.500162] nouveau 0000:1f:00.0: gsp: init failed, -5
>     [    9.500189] nouveau 0000:1f:00.0: init failed with -5
>     [    9.500196] nouveau: DRM-master:00000000:00000080: init failed with -5
>     [    9.500207] nouveau 0000:1f:00.0: DRM-master: Device allocation failed: -5
>     [    9.502661] nouveau 0000:1f:00.0: probe with driver nouveau failed with error -5
>
>
> Which brings me to the second part - TImur had me enable CONFIG_SG_DEBUG, which quickly hit a different issue:
>
>     [    8.992320] RIP: 0010:sg_init_one (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (discriminator 1))
>     [ 8.992331] Code: 71 93 37 01 83 e1 03 f6 c3 03 75 20 a8 01 75 1e 48 09 cb 41 89 54 24 08 49 89 1c 24 41 89 6c 24 0c 5b 5d 41 5c e9 7b 94 7d 00 <0f> 0b 0f 0b 0f 0b 48 8b 05 5e ae 9f 01 eb b2 66 66 2e 0f 1f 84 00
>     [    8.992428] Call Trace:
>     [    8.992433]  <TASK>
>     [    8.992439] ? die (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/dumpstack.c:421 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/dumpstack.c:434 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/dumpstack.c:447)
>     [    8.992448] ? do_trap (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/traps.c:114 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/traps.c:155)
>     [    8.992455] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (discriminator 1))
>     [    8.992464] ? do_error_trap (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./arch/x86/include/asm/traps.h:58 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/traps.c:176)
>     [    8.992472] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (discriminator 1))
>     [    8.992481] ? exc_invalid_op (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/kernel/traps.c:267)
>     [    8.992489] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (discriminator 1))
>     [    8.992496] ? asm_exc_invalid_op (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./arch/x86/include/asm/idtentry.h:621)
>     [    8.992509] ? sg_init_one (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/scatterlist.h:187 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/lib/scatterlist.c:143 (discriminator 1))
>     [    8.992518] nvkm_firmware_ctor (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/firmware.c:249) nouveau
>     [    8.992722] nvkm_falcon_fw_ctor (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c:199) nouveau
>     [    8.992898] ga102_gsp_booter_ctor (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:62) nouveau
>     [    8.993095] r535_gsp_oneinit (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2309) nouveau
>     [    8.993292] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.993302] ? kmem_cache_alloc_lru (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/mm/slub.c:3748 (discriminator 2) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/mm/slub.c:3827 (discriminator 2) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/mm/slub.c:3864 (discriminator 2))
>     [    8.993311] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.993317] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.993324] ? ktime_get (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/time/timekeeping.c:292 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/time/timekeeping.c:388 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/time/timekeeping.c:848)
>     [    8.993334] nvkm_subdev_oneinit_ (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:113) nouveau
>     [    8.993510] nvkm_subdev_init_ (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:139) nouveau
>     [    8.993685] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.993693] nvkm_subdev_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/subdev.c:170) nouveau
>     [    8.993867] nvkm_device_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:3023) nouveau
>     [    8.994079] nvkm_udevice_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c:295) nouveau
>     [    8.994281] nvkm_object_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/object.c:245) nouveau
>     [    8.994457] nvkm_ioctl_new (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:149) nouveau
>     [    8.994630] ? __pfx_nvkm_client_child_new (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/client.c:125) nouveau
>     [    8.994803] ? __pfx_nvkm_udevice_new (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c:386) nouveau
>     [    8.995013] nvkm_ioctl (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:354 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c:376) nouveau
>     [    8.995187] nvif_object_ctor (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/object.c:298 (discriminator 1)) nouveau
>     [    8.995356] nvif_device_ctor (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/device.c:56) nouveau
>     [    8.995524] nouveau_cli_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:270) nouveau
>     [    8.995721] nouveau_drm_device_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:602) nouveau
>     [    8.995915] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.995923] ? pci_bus_read_config_word (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/access.c:67 (discriminator 1))
>     [    8.995932] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.995939] ? pci_update_current_state (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci.c:1195 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci.c:1187)
>     [    8.995949] nouveau_drm_probe (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nouveau_drm.c:841) nouveau
>     [    8.996145] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.996154] local_pci_probe (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci-driver.c:325)
>     [    8.996163] pci_device_probe (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci-driver.c:392 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci-driver.c:417 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/pci/pci-driver.c:451 (discriminator 1))
>     [    8.996174] really_probe (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:578 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:656)
>     [    8.996185] ? __pfx___driver_attach (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:1155)
>     [    8.996192] __driver_probe_device (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:798)
>     [    8.996201] driver_probe_device (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:828)
>     [    8.996209] __driver_attach (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/dd.c:1215)
>     [    8.996217] bus_for_each_dev (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/bus.c:368)
>     [    8.996228] bus_add_driver (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/bus.c:673)
>     [    8.996238] driver_register (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/base/driver.c:246)
>     [    8.996246] ? __pfx_nouveau_drm_init (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/drivers/gpu/drm/nouveau/nvif/object.c:32) nouveau
>     [    8.996415] do_one_initcall (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/init/main.c:1238)
>     [    8.996428] do_init_module (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:2538)
>     [    8.996437] init_module_from_file (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3168)
>     [    8.996450] idempotent_init_module (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/spinlock.h:351 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3131 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3185)
>     [    8.996462] __x64_sys_finit_module (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/./include/linux/file.h:47 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3207 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3189 /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/kernel/module/main.c:3189)
>     [    8.996473] do_syscall_64 (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/entry/common.c:52 (discriminator 1) /home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/entry/common.c:83 (discriminator 1))
>     [    8.996482] ? srso_return_thunk (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/lib/retpoline.S:224)
>     [    8.996490] entry_SYSCALL_64_after_hwframe (/home/lyudess/Projects/linux/worktrees/nouveau-aux-fixes/arch/x86/entry/entry_64.S:129)
>     [    8.996499] RIP: 0033:0x7fd12f52919d
>
> I think timur actually mentioned this bug to you previously, but in
> hopes of getting something more useful out of SG_DEBUG I dug into this
> problem a  bit and ended up with what I believe is an actually correct
> patch:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/commit/485f1fb62ddd4b42b60848eeb48206fef4376161

I think this patch is fine, and does solve the issue for me here if I 
enable SG_DEBUG.

Ben.

>
> ...unfortunately, fixing that issue on my system did not get SG_DEBUG
> to give me any useful info.
>
> Anyway - that brings me to ask 1: do you have any idea what might be
> going on with the falcon boot issue I mentioned, or if I might just be
> doing something wrong/silly with how I'm setting up memory in
> nvkm_gsp_mem_ctor()?
>
> And 2: if you have the time does that patch look correct? I'm happy to
> submit it :)
>
> Also 3: welcome back again :)
>
