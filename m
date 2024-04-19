Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED828AC23B
	for <lists+nouveau@lfdr.de>; Mon, 22 Apr 2024 02:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792A810E76B;
	Mon, 22 Apr 2024 00:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TadKZLeE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0852C10E76B
 for <nouveau@lists.freedesktop.org>; Mon, 22 Apr 2024 00:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feP7bSKdozu02SH3QQbqjDkFmR7tTumzT0Su/LyraHsUmUpQHDJSaftLf/lsDPfH+7i++A2Q41YW2hiTJ7Ez/bpVzeXPE3ZXm06ibcIiREEM83c4Q/hWM+/8C1JMztDSzHoT0rYpmB7grcvibdRnihPgtgsDrG52MECjOpl1xmjigYDMpqSqWaZ2AvoIshTbszgb8aiazFrFYvYkDPKAN8jjPWhIj5Zr2pO/7s8PTuDVyEYYJl56gUnVs48Lmmrd/sku4E/nI7Okwz/yVnxjSuGQZF8Z+tLv/Jeqx7GpL/ar4Q2LiXebVQpjQuDECFFurcn0SxWjgXb5GVfHliNQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sKzl+Zq2IetTngaxgJa9P2c7uDh9WuyjKQCut5Qy8A=;
 b=QzGS/OTORbmz+pO5LnRsRLZkTfKLowLIvFGuIRgvhYE8DydhFfDVCC+hc7F4NM4Ly1oceUs0lHyM/QWWHDn4bGbQ7yJc+PN6aqYatWKxnK6xXGjKS8vS0uWhFbvO/4pUIeU7kxMntP18PCtEJX0Z8lYyk14SnAkWcWtP7HM9CZGkBxFC7zRQhZsDZGyZNFukOPQvJzOV500styA1UpQ3fk0rIj0oGB/pLWv5FJNRlcC9tyj4hlKnoPZC8p4TKakaNH8fXeJCRjM3UWW8Q35McU60l5GHbZ7t6YE5r4SEP/XWncmQpY2NdBEWpyi76rcTH3GYnkXxLjmJmBTuMXls/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sKzl+Zq2IetTngaxgJa9P2c7uDh9WuyjKQCut5Qy8A=;
 b=TadKZLeE3VmCoY3sTZxB5O/GYZCyoGLcklEoMiJwVeXDI2b3kHs9p5zwxq0fEySZmmZWOIRgH9Sku/qFVXqaVCmVyAaWfiyZWeX++EdJaCpvNDm5NMoun+dm5LWCoN3Az6RijVbJvhvir9o2YMqn3vX6XD7RIk7Z9yceLv23ppiM8rW36gGRZXM5O5m+pgyxeUwLeszqfc0h1E77oJzKjD9oLzW4NpmYnV91nushVN/TjACUW6tzHW2lWUFEd5NqtmV4IkkULrC9PvgWOOvnEic6LrYLgP9YqHs0Vbe55oXG0vS0yKcGOM6+IJl5HQYOi4kmlSJeeyJyzkeSCN/f8g==
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 00:14:13 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::8c) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Mon, 22 Apr 2024 00:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.19 via Frontend Transport; Mon, 22 Apr 2024 00:14:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 21 Apr
 2024 17:14:07 -0700
Received: from [172.19.145.127] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 21 Apr
 2024 17:14:06 -0700
Message-ID: <8273a133-b2b2-40c2-af27-f57c8fb5cbf0@nvidia.com>
Date: Fri, 19 Apr 2024 23:54:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with trying to boot falcons from sgt memory + Possible
 firmware SG_DEBUG fix?
Content-Language: en-US
To: David Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>
CC: Danilo Krummrich <dakr@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
References: <c09fa96760c35ba80dad1d65cbb4c8dbe983566a.camel@redhat.com>
 <CAMwc25qzmHJ4C=qxRB0GEwcZqGn2wpd7zFRvx0DphEbJvY9pEw@mail.gmail.com>
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <CAMwc25qzmHJ4C=qxRB0GEwcZqGn2wpd7zFRvx0DphEbJvY9pEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|MW6PR12MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e37cfc9-938b-47e0-5241-08dc626123bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVIydmlicHlybXViT0hCZ0RrcE1JSE5IS0FIc0E1R2hFOThEZ3lKb1djWW5Q?=
 =?utf-8?B?TWtpeWpQYStyM3ZWeStSN3QyYUFrVHlkUWFNbFAwNmg1SFBmUk4yZkpEdXFE?=
 =?utf-8?B?c09UV21Bb1lJOUVUaHladjlCTCtUcWJNNStIZGRMY1hJMmRvSzdzTHRwWXFa?=
 =?utf-8?B?YkNJK3hpR2w5Y3pOZ2xKNWJRZUdCdU5pTVJVMVVjMUpqSmpEd0RaVm0wREtJ?=
 =?utf-8?B?ZW5LVEhEOXhxSFAvbGNYVXpzZi9RZDNtcVdDbUs5Wnl3ZXhjQXI5WTRZYXcw?=
 =?utf-8?B?RnZmaTZSZnZuUDQ5RlJhTnNKWEJBV0FPaFYrNzBrcVB0UEhzUnAyb3gzSzMz?=
 =?utf-8?B?RHFWUWtTSG0vaVBnclNoaWZUVVFsZTcxTFVZdDZScHVYWHBNM1pTM2ZyTEtQ?=
 =?utf-8?B?RCs1T1RrY3Fuejd2Q3oxOWtKVUpUSGxRK3EyQkNMcWFnWC9sQ1UzNWhCaDVL?=
 =?utf-8?B?aXpSV0czU2VFWDU1SUZiZnk0bTVIMXFtU0FSUGJqNDErSUtpTHYvQUJ0YzBI?=
 =?utf-8?B?K25xRVRCUWpMUnNPTE9vOUNMeGlQMzdRdzE2OEsyUHpQd05LSzBvMHo2d0R3?=
 =?utf-8?B?VmR1dVRkWlZLaGozV3I2RlFTR2FKazY4RDFIUXZNcjdZUWQ5S2FMRE43Q3By?=
 =?utf-8?B?TkphZ3V0WFUrRi84bjJSUVFPMWFEUWVkdHFWdHFHQldaVHpyNTFSZkNuNlFO?=
 =?utf-8?B?ZXRMZDh4bFVGU1EvRnQzOHJSdlUxZUlyYnE5OWRQaVFlWGV3NnZOVTJ6bi94?=
 =?utf-8?B?N0JGNTI0YjdUN2RHSSt2ZlZHOS9TUlpnYk9SM1lBWmw3TzBQc1hCbjJxMWpx?=
 =?utf-8?B?S3JBM1o4eTlEazRGYWxVeWtlWEZFUjBKbDhXTGFGMnM4d0RFclhHZHptb0Z5?=
 =?utf-8?B?MXJHbEg0QkNZSktPYVNFNEpWSThSU3JFUlNLOXA0TzdlKy9lRjhiWkJuK2Q1?=
 =?utf-8?B?emZEZnYwR0VMSWZlY25lRndqVGZpSW5JcUlwbHJHU0JSK2YvWGdBUU40MnNW?=
 =?utf-8?B?ZzdUbW1hOUZTOVFEODYyTEZlVC9BU3dFUXlwSk00Sk96MGQ5MDFLc0pDMVpl?=
 =?utf-8?B?RXUvT3U5dE5Mek5tOEgybjRFUWlOS01sc2F6d09SV2labFBSRTJUWTN0TUNx?=
 =?utf-8?B?K1hwK0tnUXJnM1NsUlBNaTBjbjlncko1aWtjYmlNOGZBWW9BbUJNRFIwM3cw?=
 =?utf-8?B?d1NaWHVuemdIcFAzTFJDYS9MWHhaVmc0MjFma29tWURObHNibHIvL0dBQkZu?=
 =?utf-8?B?RDB0d3I4b1h4UEsyZDBZUitNekZ1dUJrV2xyMS9Ra1lZZG9CWmw2bSt2T2Ft?=
 =?utf-8?B?U0N6NGxLdHNsS01OQWsxTHh4czVZempKQmd4YlBlT25uRW9henpld2RzTExi?=
 =?utf-8?B?OEZYZTU4alBoVE80ZXBiRG9aQWdBaUFsQVVwOFpERGdLdGVOc3R6cm5xVStq?=
 =?utf-8?B?RmRWdEtlbDI2ZGN1UFdaMHg3S0llWXpnZmRLQ3NpRGI0V3FmZXcvRHRNZ1pk?=
 =?utf-8?B?K3c5MlhDTkR0aFg5eDZsQ2oxK09TMzhJajYwNVhLbmsvSnFVUDQvMEF6SUxt?=
 =?utf-8?B?TGZDZkNjQ29hMW5Cd1FveUJuTVdwMjdicmZYajFkeFhMZzRzK1dXdmM3RHNB?=
 =?utf-8?B?c2RPZXFWUjUrb0FjbXVYRHVvMHNnSloxS2tmN01uNWlTOTBreXQvNStHWWp4?=
 =?utf-8?B?clkraGJETGZ3Nk4yTTFOdHo1dXBVOHlqdFVaaTJ6VlFGSXNzNCtHMGxWOGls?=
 =?utf-8?B?dXdxN2kxNy9XL20yZUxrYlNGS2VYYmpJc2d4WnhyUXVXUXgweFRJeFQ4cUtM?=
 =?utf-8?B?OFdYQ1NqSUIwV3FUcERqYTZKa01ndG9QaGVzNHV5aGFRUnFDREd5V1VjQXJ4?=
 =?utf-8?Q?zRBJwU95ZEqrk?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 00:14:12.9099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e37cfc9-938b-47e0-5241-08dc626123bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020
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

On 19/4/24 08:14, David Airlie wrote:

> On Fri, Apr 19, 2024 at 6:27 AM Lyude Paul <lyude@redhat.com> wrote:
>> So - first some context here for Ben and anyone else who hasn't been
>> following. A little while ago I got a Slimbook Executive 16 with a
>> Nvidia RTX 4060 in it, and I've unfortunately been running into a kind
>> of annoying issue. Currently this laptop only has 16 gigs of ram, and
>> as it turns out - this can easily lead the system to having pretty
>> heavy memory fragmentation once it starts swapping pages out.
>>
>> Normally this wouldn't matter, but I unfortunately discovered that when
>> we're runtime suspending the GPU in Nouveau - we actually appear to
>> allocate some of the memory we use for migrating using
>> dma_alloc_coherent. This starts to fail on my system once memory
>> fragmentation goes up like so:
>>
>>    kworker/18:0: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
>>    nodemask=(null),cpuset=/,mems_allowed=0
>>    CPU: 18 PID: 287012 Comm: kworker/18:0 Not tainted
>>    6.8.4-200.ChopperV1.fc39.x86_64 #1
>>    Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
>>    Workqueue: pm pm_runtime_work
>>    Call Trace:
>>     <TASK>
>>     dump_stack_lvl+0x47/0x60
>>     warn_alloc+0x165/0x1e0
>>     ? __alloc_pages_direct_compact+0x1ad/0x2b0
>>     __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
>>     __alloc_pages+0x32d/0x350
>>     __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
>>     dma_direct_alloc+0x70/0x280
>>     nvkm_gsp_radix3_sg+0x5e/0x130 [nouveau]
>>     r535_gsp_fini+0x1d4/0x350 [nouveau]
>>     nvkm_subdev_fini+0x67/0x150 [nouveau]
>>     nvkm_device_fini+0x95/0x1e0 [nouveau]
>>     nvkm_udevice_fini+0x53/0x70 [nouveau]
>>     nvkm_object_fini+0xb9/0x240 [nouveau]
>>     nvkm_object_fini+0x75/0x240 [nouveau]
>>     nouveau_do_suspend+0xf5/0x280 [nouveau]
>>     nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
>>     pci_pm_runtime_suspend+0x67/0x1e0
>>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>>     __rpm_callback+0x41/0x170
>>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>>     rpm_callback+0x5d/0x70
>>     ? __pfx_pci_pm_runtime_suspend+0x10/0x10
>>     rpm_suspend+0x120/0x6a0
>>     pm_runtime_work+0x98/0xb0
>>     process_one_work+0x171/0x340
>>     worker_thread+0x27b/0x3a0
>>     ? __pfx_worker_thread+0x10/0x10
>>     kthread+0xe5/0x120
>>     ? __pfx_kthread+0x10/0x10
>>     ret_from_fork+0x31/0x50
>>     ? __pfx_kthread+0x10/0x10
>>     ret_from_fork_asm+0x1b/0x30
>>
>>    nouveau 0000:01:00.0: gsp: suspend failed, -12
>>    nouveau: DRM-master:00000000:00000080: suspend failed with -12
>>    nouveau 0000:01:00.0: can't suspend (nouveau_pmops_runtime_suspend
>>    [nouveau] returned -12)
>>
>> Keep in mind, I don't dive into memory management related stuff like
>> this very often! But I'd very much like to know how to help out
>> anywhere around the driver, including outside of my usual domains, so
>> I've been trying to write up a patch for this. The original suggestion
>> for a fix that Dave Airlie had given me was (unless I misunderstood,
>> which isn't unlikely) to try to see if we could get nvkm_gsp_mem_ctor()
>> to start allocating memory with vmalloc() and map that onto the GPU
>> using the SG helpers instead. So - I gave a shot at writing up a patch
>> for doing that:
>>
>> https://gitlab.freedesktop.org/lyudess/linux/-/commit/b5a41ac2bd948979815d262d8d20b4f3333f9c26
>>
>> As you can probably guess - the patch does not really seem to work, and
>> I've been trying to figure out why. There's already a couple of issues
>> I'm aware of: the most glaring one being that as Timur pointed out, a
>> lot of GSP hardware expects contiguous memory allocations - but
>> according to them the allocation that's specifically failing should be
>> small enough that it'd be allocated in a contiguous page anyway:
> nvkm_gsp_mem_ctor is used to do coherent allocations in a bunch of
> places in the gsp code, we can't use vmalloc for a lot of them. A lot
> of the allocations are small multi-page and hang around and the
> hardware expects allocations to be non-scattered.
>
> Now in this single case we have a large amount of data pointed to by a
> radix3 page table.
>
> The data is allocated with nvkm_gsp_sg, then we fail to allocate the
> first level of page tables with the coherent allocation. However I
> don't think the first level of the page table needs to be allocated
> with the coherent allocator, we should allocate it with nvkm_gsp_sg
> instead.

Yes, that seems sensible here.  Lyude, did you want me to take a look at 
making this change, or are you working on it already?

Ben.

>
> Dave.
>
