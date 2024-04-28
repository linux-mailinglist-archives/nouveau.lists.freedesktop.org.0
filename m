Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10598B6378
	for <lists+nouveau@lfdr.de>; Mon, 29 Apr 2024 22:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5D610EE53;
	Mon, 29 Apr 2024 20:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RKWD7Mbc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4603A10EBE5
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 20:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THsoqj2o3/+DD1LNw6mOJV/NygC+1qIv9HdAKaH5SkQcUo56sBXQYmDqH9cnpoiFI+jPFucwTW8DRTv2vo2c32aQKVvoVf6s8rviF7ecyTDcXBQxwiGajUC+xjrcsZCTPSSLEPrfI3cdj6+BrmNB2kDnwhGQ9v+ZbbFxUuGChRO3YGC8qX++pa5aTuiEzZ9/MPKiBpA/C1vzZBIeZmT5t6gXrmaM3lpda3cZ+hGLLkKvpyPotyqZXYI5k3tskTR6soUtuvx2GlhfDdsIobFOSTp74KsClnXBLjP7WQjrtyuhhqKzNNytg5S7wh0yavc5aXEU69gL6lKgaWEiHbLaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3HOLobIpyKvs6RfKLkJhhrgAtQBzpA3hGvd02/H1Mw=;
 b=CWYAd32ePYql8J03gk8TLcdBt6uoPVGBCKGEr6NIejyz5+XLaN0Mel8DahTa7k83PBzt0kfU+kYyTaRCeNciZmnb3OkLdn+F+iWS54nUCBXWtuHS7dXfOycN+GDf3BE6I9Lh9nbquO2kTnXqunBsN1rpHrjM/6+IfC5TGgfao0xD1w9V2kjNaEbuuGxQW78P6mGOs+8Tju7zOIXVtcboNjUNNq93x5YnP6nsQRGQPW7lHTTpY6mc96vt1EbjAyn9byRsJIevNJ0pdkH+A6C4YK9pY3iIt/MXt2zpKdbeyTjj2IgV+mj7/Jgp67orFwU/rk93B9OclqsgKOTYbL0u8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3HOLobIpyKvs6RfKLkJhhrgAtQBzpA3hGvd02/H1Mw=;
 b=RKWD7MbcxlgSEyjRJoDmz1r6zfp3tpPhNONbw1tlC2/ixHBNLljIA72T1IJaPcZHLYELOqwLDFXKLBFb6xX3SPEslp5yh+A6bK9Qz5twFz/K1oNYCxieHuEI7O8+HvS4NLaiLHMlIEPC5cAQST8rDja3YeV2LtEkskgPQH9mYi+yZKzOUNF0elymAszQcFcSdMeieWoftnZTZtKWOV/DrgCGGLXGNAI/hsfS1mvdNuhNPdvik/MBAg9x4B4vZ2kx912+sC+bcV6HnCSxGAJr+tfOPexH5Bt6fiYTOupw7yDgIpo4LU1iQCvBIS2QH1xGFisdG9wlD/g1r5V8CiZGnQ==
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:26:38 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::62) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Mon, 29 Apr 2024 20:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Mon, 29 Apr 2024 20:26:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Apr
 2024 13:26:18 -0700
Received: from [172.19.145.127] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Apr
 2024 13:26:17 -0700
Message-ID: <b86ab871-b4e0-4785-85b2-c66b79cbf3d3@nvidia.com>
Date: Mon, 29 Apr 2024 02:36:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/nouveau/gsp: Use the sg allocator for level 2
 of radix3
Content-Language: en-US
To: <nouveau@lists.freedesktop.org>
References: <20240426154138.64643-1-lyude@redhat.com>
 <20240429182318.189668-1-lyude@redhat.com>
 <20240429182318.189668-2-lyude@redhat.com>
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240429182318.189668-2-lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 24750ee4-b85e-4caa-4402-08dc688aac1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400014|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHBZTjBPS2VYOE5kSEhVM3ZnbzNEbUJSUWJXZm5FaUxyY2hYYjJuSlQ0N0dQ?=
 =?utf-8?B?S0lzYURNMlhBenEwdXErMGRMb004bDFDa2RTVGxYRS80QmQ1cngvSStOeWd4?=
 =?utf-8?B?cVFyVks1T1VVTFlwa2lhQ0dGZ214Wmc1ckpkSXltb2lJQkJvbkhnUzZjaWkr?=
 =?utf-8?B?NWY1Q0lpem5oZHdxbUdCTFdKVVNHZUFLT2dVdGJNVCtocmpCb3RGdFdxaUlt?=
 =?utf-8?B?ZEJFZkJGbFR3T2N6N1BzUTIvVkhvYlhIQXhHQnJhS1M1em5xbWgycFpSVVlw?=
 =?utf-8?B?WkF5ZlVZbGlsZmd0WGlEQXZDbGQ2WmNiY2Zvc3MxYXpzejk0WUtQZlBGSndP?=
 =?utf-8?B?cDQvc3FtY08wWW9JZThOWTFjZVRObEEzbUx0bWFlVHhRUlo5M2lTZVZaaXFz?=
 =?utf-8?B?eUl2RUZ2QjB1cS9FNEgzR3NmQnNpdklMVFZUNVpuL0Jhc1BjMmE1ZHFZSC96?=
 =?utf-8?B?WTdPcmk4VDQ0RENDSnRzdHJxdWxYbVhzNmJnZTdQQUhuMG1KQ1dLVVFpU1do?=
 =?utf-8?B?MURneG1mb0diK1RqME9kRWowdzd1dUxEVk5LT3YrcGVQblc0QzFtU21yb2U5?=
 =?utf-8?B?RTVHbTVtZ1BucHlFWlJvdzkwb1BGeUFRQVJ6aTVFcnNJaUlsaFVQQUtPSHVS?=
 =?utf-8?B?bzAwN2RneDBtSnNKb0xvQ2xhRjJUcTl3RzFBY0FoQm1KRGJvbXpxWFpHamVk?=
 =?utf-8?B?ejRsL1JGVnVZelJkSDF2U2IzUldsWDZzU1QrdnV4N2JZZEhYRnNHMTFSZFNh?=
 =?utf-8?B?aU8zTmd3Rms5V1dRUUUvYUtYck1Lb3dZd2dyVTBuN0lSMllWSmdoV0tPLzVQ?=
 =?utf-8?B?cEtaSXh4QW81dHA4eHFESHpBSWd2eWh1bXNQaEJJaVB3N2pYOGt0dlF5bEZ0?=
 =?utf-8?B?YXd2S2JtY0R3blBTdDYzMHN2d2x5enFkdVI5T1F1SHdTMmprb25odkFvV0VO?=
 =?utf-8?B?QldiL1FKWjRlZzFINUdlcDJSL1ZPYmE1L0c3T2J5dlZSakNkOEI0dTNrRFkr?=
 =?utf-8?B?TGNveVV5RDlNUmRNTk5mRWU4Q09GbkhjMjkwanE3ejF3THI3blpOZUdEajZE?=
 =?utf-8?B?QmR2Zm9lUCtON3UzM3VTcVhBVXgzMHZrbE0ySUxwNGpJN3NPS0s5TWErZU9s?=
 =?utf-8?B?MzdOU1RkclE2TDFkZ0ZxNXJSNUNFbGlLOVBvTVFtbzZDRWpBbHhXbUMyN3Fq?=
 =?utf-8?B?TXova2tXbERKb0pVdXhaeTZQWUhTaTlwMDFwSmdiMHlROWtFU0VqSTY2Yzl5?=
 =?utf-8?B?cEcwbUJwWnVxNmtuYklLSDRGTGtpbWczQnZzUXNGSUNDTTNqbkZ1dXBxOWt4?=
 =?utf-8?B?d0VNT1pLbEM5a05QSGdubVd1WlFBNGxsK085OXVrNjlUQWNGZE9hRzEyWUZ2?=
 =?utf-8?B?RUtodVEzbytLWDlUZDlaYnFSZU9aTzNHVEtDV09XK0lqR3Z3cTExMHRzelF5?=
 =?utf-8?B?eHpWLzg4Q2lsTy9pRW9kRFFLdnQyanRHYjBYdXNPYUV1aFArb0x4d0IyNkZl?=
 =?utf-8?B?NWdVSDFuUmF5NGJrMnpOR1A2dEFXeklBY1VWQ2lZWWVvVk1EVmx3dERhT1lL?=
 =?utf-8?B?RURwU0tNK3M5cVJLVmc0cDVGV1l4OEp0aVBLSWlEM0ZIRjl2REZ1TGEzL2RW?=
 =?utf-8?B?UXFIMnkwdWhOb1NITXVSK0NrdXphWFNrZ1FmVHZzVEFsbEJXK0k2ajNJdlJX?=
 =?utf-8?B?V2EwcUFtaW5CcmpEQnBPenVlQkhsNTRzWEM2QWcwcVAxNkxQbzFpa3duR3Iy?=
 =?utf-8?B?OU9rM3ZKaXh4UFVQc0hHbWVMYThPZ2VKcnNYckMvQ05mUUZjcVVoTjdRVTNm?=
 =?utf-8?Q?wDwwSxzpAdm15POURFBwLcV9dUHRgJ5dSnDUs=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:26:38.0645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24750ee4-b85e-4caa-4402-08dc688aac1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432
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

On 30/4/24 04:23, Lyude Paul wrote:

> Currently we allocate all 3 levels of radix3 page tables using
> nvkm_gsp_mem_ctor(), which uses dma_alloc_coherent() for allocating all of
> the relevant memory. This can end up failing in scenarios where the system
> has very high memory fragmentation, and we can't find enough contiguous
> memory to allocate level 2 of the page table.
>
> Currently, this can result in runtime PM issues on systems where memory
> fragmentation is high - as we'll fail to allocate the page table for our
> suspend/resume buffer:
>
>    kworker/10:2: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
>    nodemask=(null),cpuset=/,mems_allowed=0
>    CPU: 10 PID: 479809 Comm: kworker/10:2 Not tainted
>    6.8.6-201.ChopperV6.fc39.x86_64 #1
>    Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
>    Workqueue: pm pm_runtime_work
>    Call Trace:
>     <TASK>
>     dump_stack_lvl+0x64/0x80
>     warn_alloc+0x165/0x1e0
>     ? __alloc_pages_direct_compact+0xb3/0x2b0
>     __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
>     __alloc_pages+0x32d/0x350
>     __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
>     dma_direct_alloc+0x70/0x270
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
> Luckily, we don't actually need to allocate coherent memory for the page
> table thanks to being able to pass the GPU a radix3 page table for
> suspend/resume data. So, let's rewrite nvkm_gsp_radix3_sg() to use the sg
> allocator for level 2. We continue using coherent allocations for lvl0 and
> 1, since they only take a single page.
>
> V2:
> * Don't forget to actually jump to the next scatterlist when we reach the
>    end of the scatterlist we're currently on when writing out the page table
>    for level 2
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org

Hey Lyude,

These are looking good!  Thank you for looking at this issue. For both 
patches:

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>


Ben.

> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 77 ++++++++++++-------
>   2 files changed, 54 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 6f5d376d8fcc1..a11d16a16c3b2 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -15,7 +15,9 @@ struct nvkm_gsp_mem {
>   };
>   
>   struct nvkm_gsp_radix3 {
> -	struct nvkm_gsp_mem mem[3];
> +	struct nvkm_gsp_mem lvl0;
> +	struct nvkm_gsp_mem lvl1;
> +	struct sg_table lvl2;
>   };
>   
>   int nvkm_gsp_sg(struct nvkm_device *, u64 size, struct sg_table *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 9858c1438aa7f..fd4e80ba6adfc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1624,7 +1624,7 @@ r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
>   	meta->magic = GSP_FW_WPR_META_MAGIC;
>   	meta->revision = GSP_FW_WPR_META_REVISION;
>   
> -	meta->sysmemAddrOfRadix3Elf = gsp->radix3.mem[0].addr;
> +	meta->sysmemAddrOfRadix3Elf = gsp->radix3.lvl0.addr;
>   	meta->sizeOfRadix3Elf = gsp->fb.wpr2.elf.size;
>   
>   	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
> @@ -1919,8 +1919,9 @@ nvkm_gsp_sg(struct nvkm_device *device, u64 size, struct sg_table *sgt)
>   static void
>   nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
>   {
> -	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--)
> -		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
> +	nvkm_gsp_sg_free(gsp->subdev.device, &rx3->lvl2);
> +	nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
> +	nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
>   }
>   
>   /**
> @@ -1960,36 +1961,60 @@ static int
>   nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
>   		   struct nvkm_gsp_radix3 *rx3)
>   {
> -	u64 addr;
> +	struct sg_dma_page_iter sg_dma_iter;
> +	struct scatterlist *sg;
> +	size_t bufsize;
> +	u64 *pte;
> +	int ret, i, page_idx = 0;
>   
> -	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
> -		u64 *ptes;
> -		size_t bufsize;
> -		int ret, idx;
> +	ret = nvkm_gsp_mem_ctor(gsp, GSP_PAGE_SIZE, &rx3->lvl0);
> +	if (ret)
> +		return ret;
>   
> -		bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
> -		ret = nvkm_gsp_mem_ctor(gsp, bufsize, &rx3->mem[i]);
> -		if (ret)
> -			return ret;
> +	ret = nvkm_gsp_mem_ctor(gsp, GSP_PAGE_SIZE, &rx3->lvl1);
> +	if (ret)
> +		goto lvl1_fail;
>   
> -		ptes = rx3->mem[i].data;
> -		if (i == 2) {
> -			struct scatterlist *sgl;
> +	// Allocate level 2
> +	bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
> +	ret = nvkm_gsp_sg(gsp->subdev.device, bufsize, &rx3->lvl2);
> +	if (ret)
> +		goto lvl2_fail;
>   
> -			for_each_sgtable_dma_sg(sgt, sgl, idx) {
> -				for (int j = 0; j < sg_dma_len(sgl) / GSP_PAGE_SIZE; j++)
> -					*ptes++ = sg_dma_address(sgl) + (GSP_PAGE_SIZE * j);
> -			}
> -		} else {
> -			for (int j = 0; j < size / GSP_PAGE_SIZE; j++)
> -				*ptes++ = addr + GSP_PAGE_SIZE * j;
> +	// Write the bus address of level 1 to level 0
> +	pte = rx3->lvl0.data;
> +	*pte = rx3->lvl1.addr;
> +
> +	// Write the bus address of each page in level 2 to level 1
> +	pte = rx3->lvl1.data;
> +	for_each_sgtable_dma_page(&rx3->lvl2, &sg_dma_iter, 0)
> +		*pte++ = sg_page_iter_dma_address(&sg_dma_iter);
> +
> +	// Finally, write the bus address of each page in sgt to level 2
> +	for_each_sgtable_sg(&rx3->lvl2, sg, i) {
> +		void *sgl_end;
> +
> +		pte = sg_virt(sg);
> +		sgl_end = (void*)pte + sg->length;
> +
> +		for_each_sgtable_dma_page(sgt, &sg_dma_iter, page_idx) {
> +			*pte++ = sg_page_iter_dma_address(&sg_dma_iter);
> +			page_idx++;
> +
> +			// Go to the next scatterlist for level 2 if we've reached the end
> +			if ((void*)pte >= sgl_end)
> +				break;
>   		}
> +	}
>   
> -		size = rx3->mem[i].size;
> -		addr = rx3->mem[i].addr;
> +	if (ret) {
> +lvl2_fail:
> +		nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
> +lvl1_fail:
> +		nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   int
> @@ -2021,7 +2046,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
>   		sr = gsp->sr.meta.data;
>   		sr->magic = GSP_FW_SR_META_MAGIC;
>   		sr->revision = GSP_FW_SR_META_REVISION;
> -		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.mem[0].addr;
> +		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
>   		sr->sizeOfSuspendResumeData = len;
>   
>   		mbox0 = lower_32_bits(gsp->sr.meta.addr);
