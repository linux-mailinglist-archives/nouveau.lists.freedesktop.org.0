Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945928AA705
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 04:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5210F95B;
	Fri, 19 Apr 2024 02:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qygPGzQb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217710F95B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Apr 2024 02:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPzAV/cqPiEzqFAFQMjhBy2IJWraHEYXPdX1rR/3SADy6SIz+LxbPyQdpTFB/u0bGcGCGtfUWIH+zLWOy3qRLcU9fiyGCCzjRgqG73ougvnSWGTFDC/3dpNkIJJdCRDoJmB25w2atCmingtknZFQJuMGRc6l6XLS+loPSq4goYz3Fzcm9O2haNwz75RuEbi5g9MfDcTOWPc6pKPcnLxwTa9aKP3T064ZYYVck0lK9fTyLLyb1H9QZZyKTYMD/KJgx3ieetHQ3Y2iy3QyJZfk5vbSNRFb99p0hyryPPLjuTzlUTfLMHALhKf/tbuM278r5xKWtDKRiA9GbXEMDelEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ahi4DcvjNpS9Drst+vDLjhqe9PEmd02dXcmhbO+6/Q=;
 b=MRKVU9nnUGiWdFqRCj0mqY/cdyssmmIkApjf9ayIBW4CXXsR74x0j+tkn3Ut7fwGS+u6vU3HLSVGwfWPjaAm1+I5VHcNa72ycCWVfGMKbnKBpFjVI0gk1IoblaOwtUEMO0WccEgO/TsjogeQuWQotutXMVJ7pEeTOlZVI5Bcm2a4tQE9T3Un/hCqrl13FI3bqPsEnM8RLAMJH/hMi5Utbucd1Y+1QLgqHlozCjB5LK3+pafl+HTEn6aUNMAjEtQzm6Gjvg9GQFfmU4vVWxLaUhbRnjUwIagRSG14VASiYGvHGT5YEBtldPz7xD8HY/QaC4MrHCW9boLC0W+gDlvLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=dakr.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ahi4DcvjNpS9Drst+vDLjhqe9PEmd02dXcmhbO+6/Q=;
 b=qygPGzQbAWEM9yOD8CuemNC/y9I5+QRS12oBqEKt0dNXkEGsdhVoNU2H7PVNQSJokQ1J/XjhDRSVLoO75OFv6vIHFqvYVlybhnKcc9Y7YVNvgPE390S83xp4qPRYYRN1Pub5fiMJSCRhh86uHQnbBB5iAZaJNpfi1hRcHnqZWWPumK9Hy8pRthWr2qLw7FsYb2b4EyH1VTJ1dEQtdeK7RUsTC7qWhHm1PYJIFjfEXiOxomKaSxCLYYJ+yVv78iCUkPOIkDrPKRYbWa4uRtZJUabhW5HGhlKZG2EwGDqcXbfOluxNMjq232H8EbJm24MovGHwp6p94yKJFaHWWKmwGw==
Received: from MN2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:c0::49)
 by SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 02:39:19 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::c9) by MN2PR05CA0036.outlook.office365.com
 (2603:10b6:208:c0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12 via Frontend
 Transport; Fri, 19 Apr 2024 02:39:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 02:39:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Apr
 2024 19:39:08 -0700
Received: from [172.19.145.127] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Apr
 2024 19:39:07 -0700
Message-ID: <10cbb2e8-2570-4637-94e4-ba51909f8c14@nvidia.com>
Date: Fri, 19 Apr 2024 00:03:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 000/156] drm/nouveau: replace "ioctl" interface between
 drm/nvkm
Content-Language: en-US
To: Danilo Krummrich <me@dakr.org>
CC: <nouveau@lists.freedesktop.org>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
 <ZiBMENgEeut9p2e6@cassiopeiae>
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <ZiBMENgEeut9p2e6@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: ba62fd07-c3b6-44b4-8f3f-08dc6019e9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mHLts1G2lBgcei5IXJTrgSHrBRNIdWcAShmNzJq+u8yu/i+dD03iAuw4U68OdqtXjoGG/ghjPpeMgp8GbJlesmJR7g/3T2Ypnqrd+UyJb8TvBWE2aDPHQfE7nuN37NQ79rYX3QxCUcgHuoBf4X6FyVqfeDNuGUkNBw2xPri6jezX10RSxWAX+kkzurLKIN3Lw/Yp6lfupEGS91CGLnyqhfboXUH57Rf+R9XdqBTO3pyFp+7WJ2YmdpJ5j/aljeX+BLhoaIsLq9TBxF+KJRqCXg0Zz65e5IgexOvnxFH/dS0tvgKSQDoqZK3544PAIERfOH7VczsLt6yf9XiHJ/fE8qXtxAFUwsaZmcZG4akjRXAYuWY/YAm3wXP4LascLXkOv+D3S0p56kYxl2VywM/Iu6Ng9bEf8VhYtuKyY5ZB5QeCUWC99vxKERzLRRIFO33hUGNqvMu0w1DJv2HQ6ZAcVd0BnVFMQUjJ457ok10q7nfbyzRNXI84UYcYMuFtGT1G2Wi880BIw6zIQUK0UqaEmjhpNEJBpMfOCUVas2pO8MyN9jXrsVbptEzaH43ANXQqpk9/ZWMSQ9puQMIks4TLzwLJvBPcGJVq4QUnLe3XezxMBnB0+1FcCbJZzf3V+5700Jfe9EQlb74edu9/adfI/B8mJjIx4WZnZtP/nODONSYhNDyYoYPmgFTA0oXNy5U0+QmcrkffbVVp+EjjyMvf9mO3J2zgbXjMYsSsPRgcSu0RVP+4QCYfAEmOfODffMe
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 02:39:19.0461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba62fd07-c3b6-44b4-8f3f-08dc6019e9cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
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

On 18/4/24 08:24, Danilo Krummrich wrote:

> Hi Ben,
>
> Welcome back from my side as well!

Hey Danilo,

Thanks!

>
> On Wed, Apr 17, 2024 at 09:37:26AM +1000, Ben Skeggs wrote:
>> This is a series of cleanups that I intended on doing after posting
>> the initial GSP-RM support several months ago, and have now had the
>> opportunity to work on again.
>>
>> The main intention here is to replace the ioctl-like interface that
>> sits between NVKM and the nouveau DRM driver with more direct calls,
>> to reduce the call-chain complexity (and overhead).
> That sounds like a great and welcome simplification.
>
>> This is achieved by having NVKM return structs of info and function
>> pointers specific to each class, along with an opaque pointer to its
>> private data.  These are stored in the NVIF structs and used to call
>> directly into an implementation without handle lookups and multiple
>> layers of indirection.
> I just had a very brief look on the rework of the VMM bits to get a rough idea
> how the new interface looks like.
>
> I think I will get the full picture, once I can apply all the patches to a tree
> and don't need to look at the changes scattered throughout patches.
>
> However, I wonder if we need another indirection (such as nvif_vmm_impl) instead
> of just calling the corresponding functions directly? Or even more crazy, what
> if we'd try to rip out nvif entirely?

I'm opposed to removing NVIF.  HW has always had a quite strong 
priv/user separation (it's been designed for usermode submission from 
the beginning, even before DMA channels were a thing), and many many 
years ago now I made the decision to split nouveau along those same 
boundaries.

It also happens to (basically) mirror the interface GSP-RM provides to 
the kernel driver.  Had I not split nouveau the way I did, and had the 
code to manage the priv/user parts of the GPU mingled together, adding 
support for GSP-RM would have been a lot more painful than it was.


>
> Maybe it would be good to sketch up some example code of how the interface works
> and include it in the cover letter? This way we could see / discuss whether we
> can even simplify it more or why it needs the indirections you have chosen.

I tried to make this clear in the cover letter, but this isn't an 
attempt at designing a new interface.  This is the old one, and works in 
nearly the same way as it did before, just with a whole bunch of middle 
layers ripped out.

A patch series I've been pondering writing if/when this one is merged, 
would be to directly implement GSP-RM on top of the "new" interfaces, so 
that it doesn't need to awkwardly integrate with NVKM's other 
abstractions that are only really relevant when running on top of HW 
directly.

There is (almost) be a 1-1 mapping between NVIF function pointer and RM 
alloc/control call (this was already the case before this series).  The 
GSP-supporting code in NVKM could be cleaned up significantly.


>
>> There's room for further cleanups and API changes from here, but for
>> now most of the API usage is exactly as it was before, as the series
>> has gotten quite large enough already.
>>
>> The first part of the series starts out by cleaning up some of the
>> interfaces within the DRM driver, and reimplementing the subset of
>> "ioctl" interfaces needed by userspace directly.
>>
>> A number of unused interfaces/function args are then removed so that
>> they don't need to be ported, and some initial renames/preparations
>> are made to the NVKM's user object implementations so that diffs of
>> the next set of patches are more straightforward to read.
>>
>> I then go through each class in turn, starting from the root of the
>> object tree (client), and working up from there.  The object ctors/
>> dtors are ported first, followed by sclass/map/etc, followed by the
>> class's methods, and then repeating the process with each of their
>> children.
>>
>> Objects remain accessible with the "ioctl" interface throughout the
>> changes (until their last use, after which they're removed from the
>> object rb entirely) to allow each change to be done independently.
>>
>> After all classes have been ported, some final cleanups are made to
>> the DRM driver to complete the series.
>>
>> Ben Skeggs (156):
> Wow! That's a lot of work - very much appreciated. However, I think it would
> have been better to share your ideas and / or example code regarding this rework
> early, such that discussions can happen in advance.
>
> We could have been discussing the (new) interface, get to an agreement and then
> work through it in several patch series.

I don't disagree that discussion should be had over new interfaces, but 
as I said above, this series isn't an attempt at that.  It's attempting 
to remove a whole bunch of cruft that makes it hard to make changes to 
the APIs, a whole bunch of memcpy(), and hacks around awkward locking 
problems (like the linked-list of all memory allocations to avoid object 
tree locking issues).


Thank you,

Ben.

>
> This has multiple advantages:
>
>    1. It makes things much easier to review; bulky patch series, such as this
>       one, are hard to review.
>    2. It potentially provides different perspectives for improvements ahead of
>       time and potentially saves a lot of your time compared to working through
>       the feedback afterwards.
>    3. It better involves the community. Wouldn't it be great if someone, due to a
>       previous discussion, voluntarily picked up some of the effort?
>
> Can you please resend patch 25 with a corresponding '--in-reply-to='? Also, as
> Dave already mentioned, I'd be great if you could provide a branch containing
> the patches.
>
> - Danilo
>
>>    drm/nouveau: add nouveau_drm.device/mmu
>>    drm/nouveau: alias nouveau_drm.client to nouveau_drm.cli
>>    drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
>>    drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
>>    drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
>>    drm/nouveau: remove nouveau_chan.device
>>    drm/nouveau: remove chan->drm
>>    drm/nouveau: replace some void casts with chan->cli
>>    drm/nouveau: remove nouveau_drm.master
>>    drm/nouveau: always map device
>>    drm/nouveau: add nouveau_cli to nouveau_abi16
>>    drm/nouveau: handle limited nvif in abi16
>>    drm/nouveau: remove abi16->device
>>    drm/nouveau: remove abi16->handles
>>    drm/nouveau: store nvkm_device pointer in nouveau_drm
>>    drm/nouveau: create pci device once
>>    drm/nouveau: remove push pointer from nouveau_channel
>>    drm/nouveau/kms: remove a few unused struct members and fn decls
>>    drm/nouveau/kms: remove push pointer from nv50_dmac
>>    drm/nouveau/kms: move hw ring tracking vars into nvif_push
>>    drm/nouveau/kms: move dmac sync/vram ctxdmas to core+wndws
>>    drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
>>    drm/nouveau/nvkm: move nouveau_nvif.c to nvkm/core/driver.c
>>    drm/nouveau/nvkm: move nvkm/engine/device/ to nvkm/device/
>>    drm/nouveau/nvkm: remove perfmon
>>    drm/nouveau/nvkm: remove nvkm_client_search()
>>    drm/nouveau/nvif: remove support for userspace backends
>>    drm/nouveau/nvif: remove route/token
>>    drm/nouveau/nvif: remove nvxx_object()
>>    drm/nouveau/nvif: remove nvxx_client()
>>    drm/nouveau/nvif: remove driver keep/fini
>>    drm/nouveau/nvif: remove client version
>>    drm/nouveau/nvif: remove client devlist
>>    drm/nouveau/nvif: remove client fini
>>    drm/nouveau/nvif: remove device args
>>    drm/nouveau/nvif: remove device rd/wr
>>    drm/nouveau/nvif: remove disp chan rd/wr
>>    drm/nouveau/nvkm: rename struct nvkm_uevent
>>    drm/nouveau/nvkm: remove nvkm_client()
>>    drm/nouveau/nvkm: rename struct nvkm_udevice
>>    drm/nouveau/nvkm: rename struct nvkm_control
>>    drm/nouveau/nvkm: rename struct nvkm_uvfn
>>    drm/nouveau/nvkm: rename struct nvkm_ummu
>>    drm/nouveau/nvkm: rename struct nvkm_umem
>>    drm/nouveau/nvkm: rename struct nvkm_uvmm
>>    drm/nouveau/nvkm: detach user handling from nvkm_fault_buffer
>>    drm/nouveau/nvkm: detach user handling from nvkm_disp
>>    drm/nouveau/nvkm: detach user handling from nvkm_conn
>>    drm/nouveau/nvkm: detach user handling from nvkm_outp
>>    drm/nouveau/nvkm: detach user handling from nvkm_uhead
>>    drm/nouveau/nvkm: detach user handling from nvkm_disp_chan
>>    drm/nouveau/nvkm: rename struct nvkm_ucgrp
>>    drm/nouveau/nvkm: rename struct nvkm_uchan
>>    drm/nouveau/nvkm: move umem list to mmu
>>    drm/nouveau/disp: simplify hw user definition
>>    drm/nouveau/nvif: output oclass id in object dbg messages
>>    drm/nouveau/nvif: add alternate version of nvif_object_ctor()
>>    drm/nouveau/nvif: add alternate version of nvif_event_ctor()
>>    drm/nouveau/nvif: move nvif<->nvkm interface definitions to driverif.h
>>    drm/nouveau/nvif: rework "new driver" api
>>    drm/nouveau/nvkm: remove device list
>>    drm/nouveau/nvif: rework driver "new client" api
>>    drm/nouveau/nvif: rework client "new device" api
>>    drm/nouveau/nvif: remove client from object rb
>>    drm/nouveau/nvif: rework device "sclass" api
>>    drm/nouveau/nvif: rework device "map" api
>>    drm/nouveau/nvif: rework device "info v0" api
>>    drm/nouveau/nvif: rework device "info v1" api
>>    drm/nouveau/nvif: rework device "time" api
>>    drm/nouveau/nvif: rework device "new ctrl" api
>>    drm/nouveau/nvif: rework ctrl "pstate info" api
>>    drm/nouveau/nvif: rework ctrl "pstate attr" api
>>    drm/nouveau/nvif: rework ctrl "pstate user" api
>>    drm/nouveau/nvif: remove ctrl from object rb
>>    drm/nouveau/nvif: rework device "new usermode" api
>>    drm/nouveau/nvif: rework usermode "map" api
>>    drm/nouveau/nvif: remove usermode from object rb
>>    drm/nouveau/nvif: rework device "new mmu" api
>>    drm/nouveau/nvif: rework mmu "sclass" api
>>    drm/nouveau/nvif: rework mmu "heap" api
>>    drm/nouveau/nvif: rework mmu "type" api
>>    drm/nouveau/nvif: rework mmu "kind" api
>>    drm/nouveau/nvif: rework mmu "new mem" api
>>    drm/nouveau/nvif: rework mem "map"/"unmap" apis
>>    drm/nouveau/nvif: rework mmu "new vmm" api
>>    drm/nouveau/nvif: remove mmu from object rb
>>    drm/nouveau/nvif: rework vmm "page" api
>>    drm/nouveau/nvif: rework vmm "get"/"put" apis
>>    drm/nouveau/nvif: rework vmm "map"/"unmap" apis
>>    drm/nouveau/nvif: rework vmm "pfnmap"/"pfnclr" apis
>>    drm/nouveau/nvif: rework vmm "raw get"/"raw put" apis
>>    drm/nouveau/nvif: rework vmm "raw map"/"raw unmap" apis
>>    drm/nouveau/nvif: rework vmm "raw sparse" api
>>    drm/nouveau/nvif: rework vmm "fault replay"/"fault cancel" apis
>>    drm/nouveau/nvif: rework device "new fault buffer" api
>>    drm/nouveau/nvif: rework fault buffer "map" api
>>    drm/nouveau/nvif: rework fault buffer "new event" api
>>    drm/nouveau/nvif: remove fault buffer from object rb
>>    drm/nouveau/nvif: rework device "new disp" api
>>    drm/nouveau/nvif: rework disp "sclass" api
>>    drm/nouveau/nvif: rework disp "new caps" api
>>    drm/nouveau/nvif: rework disp "new conn" api
>>    drm/nouveau/nvif: rework conn "new event" api
>>    drm/nouveau/nvif: remove conn from object rb
>>    drm/nouveau/nvif: rework disp "new outp" api
>>    drm/nouveau/nvif: rework outp "detect" api
>>    drm/nouveau/nvif: rework outp "edid get" api
>>    drm/nouveau/nvif: rework outp "load detect" api
>>    drm/nouveau/nvif: rework outp "inherit" apis
>>    drm/nouveau/nvif: rework outp "acquire" api
>>    drm/nouveau/nvif: rework outp "release" api
>>    drm/nouveau/nvif: rework outp "bl get"/"bl set" apis
>>    drm/nouveau/nvif: rework outp "lvds config" api
>>    drm/nouveau/nvif: rework outp "hdmi config" api
>>    drm/nouveau/nvif: rework outp "infoframe" api
>>    drm/nouveau/nvif: rework outp "hda eld" api
>>    drm/nouveau/nvif: rework outp "dp aux pwr" api
>>    drm/nouveau/nvif: rework outp "dp aux xfer" api
>>    drm/nouveau/nvif: rework outp "dp rates" api
>>    drm/nouveau/nvif: rework outp "dp train" api
>>    drm/nouveau/nvif: rework outp "dp drive" api
>>    drm/nouveau/nvif: rework outp "dp sst" api
>>    drm/nouveau/nvif: rework outp "dp mst id get"/"dp mst id put" apis
>>    drm/nouveau/nvif: rework outp "dp mst vcpi" api
>>    drm/nouveau/nvif: remove outp from object rb
>>    drm/nouveau/nvif: rework disp "new head" api
>>    drm/nouveau/nvif: rework head "scanoutpos" api
>>    drm/nouveau/nvif: rework head "new event" api
>>    drm/nouveau/nvif: remove head from object rb
>>    drm/nouveau/nvif: rework disp "new chan" apis
>>    drm/nouveau/nvif: remove disp from object rb
>>    drm/nouveau/nvif: rework disp chan "new ctxdma" api
>>    drm/nouveau/nvif: remove disp chans from object rb
>>    drm/nouveau/nvif: rework device "new cgrp" api
>>    drm/nouveau/nvif: rework device "new ctxdma" api
>>    drm/nouveau/nvif: rework device/cgrp "new chan" apis
>>    drm/nouveau/nvif: remove mem from object rb
>>    drm/nouveau/nvif: remove vmm from object rb
>>    drm/nouveau/nvif: remove ctxdma from object rb
>>    drm/nouveau/nvif: remove device from object rb
>>    drm/nouveau/nvif: rework chan "map" api
>>    drm/nouveau/nvif: rework chan "sclass" api
>>    drm/nouveau/nvif: rework chan "new event" apis
>>    drm/nouveau/nvif: rework chan "new ctxdma" api
>>    drm/nouveau/nvif: rework chan "new engobj" apis
>>    drm/nouveau/nvif: remove chan from object rb
>>    drm/nouveau/nvif: rework engobj "mthd" api
>>    drm/nouveau/nvif: rework engobj "new event" api
>>    drm/nouveau/nvif: remove engobj from object rb
>>    drm/nouveau/nvkm: switch nvkm_object to non-irqsafe spinlock
>>    drm/nouveau: remove client_mutex
>>    drm/nouveau: move nvxx_* definitions to nouveau_drv.h
>>    drm/nouveau: pass nouveau_drm to nvxx_*
>>    drm/nouveau: remove remaining usage of nvif_device.info
>>    drm/nouveau: remove remaining usage of nvif_device.object.map
>>    drm/nouveau: remove remaining usage of nouveau_drm.client
>>
>>   drivers/gpu/drm/nouveau/Kbuild                |   2 -
>>   drivers/gpu/drm/nouveau/dispnv04/arb.c        |   7 +-
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  50 +-
>>   drivers/gpu/drm/nouveau/dispnv04/cursor.c     |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dac.c        |  18 +-
>>   drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.c       |  15 +-
>>   drivers/gpu/drm/nouveau/dispnv04/disp.h       |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv04/hw.c         |  83 +-
>>   drivers/gpu/drm/nouveau/dispnv04/hw.h         |  45 +-
>>   drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  21 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  16 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.h     |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base.c       |  33 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  43 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core.c       |  84 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core.h       |   9 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core507d.c   |  34 +-
>>   drivers/gpu/drm/nouveau/dispnv50/core907d.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |  19 +-
>>   drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crc.c        |  34 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crc.h        |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/curs.c       |  35 +-
>>   drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  41 +-
>>   drivers/gpu/drm/nouveau/dispnv50/cursc37a.c   |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c       | 313 +------
>>   drivers/gpu/drm/nouveau/dispnv50/disp.h       |  37 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
>>   drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>>   drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>>   drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/lut.c        |  12 +-
>>   drivers/gpu/drm/nouveau/dispnv50/lut.h        |   5 +-
>>   drivers/gpu/drm/nouveau/dispnv50/oimm.c       |  29 +-
>>   drivers/gpu/drm/nouveau/dispnv50/oimm507b.c   |  20 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly.c       |  32 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  28 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wimm.c       |  25 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |  24 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 101 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.h       |  20 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  46 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
>>   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
>>   drivers/gpu/drm/nouveau/include/nvif/cgrp.h   |  17 +
>>   drivers/gpu/drm/nouveau/include/nvif/chan.h   |  45 +
>>   drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  60 --
>>   drivers/gpu/drm/nouveau/include/nvif/class.h  |   8 -
>>   drivers/gpu/drm/nouveau/include/nvif/clb069.h |  15 -
>>   drivers/gpu/drm/nouveau/include/nvif/client.h |  14 +-
>>   drivers/gpu/drm/nouveau/include/nvif/conn.h   |  24 +-
>>   drivers/gpu/drm/nouveau/include/nvif/ctxdma.h |  29 +
>>   drivers/gpu/drm/nouveau/include/nvif/device.h |  51 +-
>>   drivers/gpu/drm/nouveau/include/nvif/disp.h   |  19 +-
>>   .../gpu/drm/nouveau/include/nvif/dispchan.h   |  25 +
>>   drivers/gpu/drm/nouveau/include/nvif/driver.h |  27 +-
>>   .../gpu/drm/nouveau/include/nvif/driverif.h   | 643 +++++++++++++
>>   drivers/gpu/drm/nouveau/include/nvif/event.h  |  16 +-
>>   drivers/gpu/drm/nouveau/include/nvif/fifo.h   |  11 +-
>>   drivers/gpu/drm/nouveau/include/nvif/head.h   |   2 +
>>   drivers/gpu/drm/nouveau/include/nvif/if0000.h |  20 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0001.h |  47 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0008.h |  42 -
>>   drivers/gpu/drm/nouveau/include/nvif/if000c.h | 117 ---
>>   drivers/gpu/drm/nouveau/include/nvif/if000d.h |   1 -
>>   drivers/gpu/drm/nouveau/include/nvif/if000e.h |  26 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0010.h |  14 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0011.h |  18 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0012.h | 294 ------
>>   drivers/gpu/drm/nouveau/include/nvif/if0013.h |  35 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0014.h |  13 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0020.h |  45 -
>>   drivers/gpu/drm/nouveau/include/nvif/if0021.h |  16 -
>>   drivers/gpu/drm/nouveau/include/nvif/if500d.h |   1 -
>>   drivers/gpu/drm/nouveau/include/nvif/if900d.h |   1 -
>>   drivers/gpu/drm/nouveau/include/nvif/ifb00d.h |   1 -
>>   drivers/gpu/drm/nouveau/include/nvif/ifc00d.h |   1 -
>>   drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  44 -
>>   drivers/gpu/drm/nouveau/include/nvif/mem.h    |  18 +-
>>   drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  38 +-
>>   drivers/gpu/drm/nouveau/include/nvif/object.h | 105 +--
>>   drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
>>   drivers/gpu/drm/nouveau/include/nvif/outp.h   |  58 +-
>>   drivers/gpu/drm/nouveau/include/nvif/printf.h |   9 +-
>>   drivers/gpu/drm/nouveau/include/nvif/push.h   |  18 +-
>>   drivers/gpu/drm/nouveau/include/nvif/user.h   |   6 +-
>>   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  30 +-
>>   .../drm/nouveau/include/nvkm/core/client.h    |  16 +-
>>   .../drm/nouveau/include/nvkm/core/device.h    |   6 -
>>   .../drm/nouveau/include/nvkm/core/driver.h    |   9 +
>>   .../gpu/drm/nouveau/include/nvkm/core/event.h |  10 +-
>>   .../gpu/drm/nouveau/include/nvkm/core/ioctl.h |   8 -
>>   .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
>>   .../drm/nouveau/include/nvkm/core/object.h    |  43 +-
>>   .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
>>   .../gpu/drm/nouveau/include/nvkm/core/os.h    |  21 +-
>>   .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>>   .../drm/nouveau/include/nvkm/core/subdev.h    |   2 -
>>   .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>>   .../drm/nouveau/include/nvkm/engine/disp.h    |   4 +-
>>   .../gpu/drm/nouveau/include/nvkm/engine/dma.h |   2 -
>>   .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
>>   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   3 -
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       | 498 ++++++----
>>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |  11 +-
>>   drivers/gpu/drm/nouveau/nouveau_backlight.c   |  30 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.c        |  22 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
>>   drivers/gpu/drm/nouveau/nouveau_bo.c          | 130 +--
>>   drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   8 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo5039.c      |  10 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_chan.c        | 353 ++++---
>>   drivers/gpu/drm/nouveau/nouveau_chan.h        |  31 +-
>>   drivers/gpu/drm/nouveau/nouveau_connector.c   |  30 +-
>>   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  47 +-
>>   drivers/gpu/drm/nouveau/nouveau_debugfs.h     |   2 +
>>   drivers/gpu/drm/nouveau/nouveau_display.c     |  50 +-
>>   drivers/gpu/drm/nouveau/nouveau_dma.c         |  10 +-
>>   drivers/gpu/drm/nouveau/nouveau_dma.h         |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c        |  19 +-
>>   drivers/gpu/drm/nouveau/nouveau_dp.c          |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_drm.c         | 359 +++-----
>>   drivers/gpu/drm/nouveau/nouveau_drv.h         |  71 +-
>>   drivers/gpu/drm/nouveau/nouveau_fence.c       |  33 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c         |  34 +-
>>   drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
>>   drivers/gpu/drm/nouveau/nouveau_led.c         |   6 +-
>>   drivers/gpu/drm/nouveau/nouveau_mem.c         |  44 +-
>>   drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_prime.c       |   2 +-
>>   drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_svm.c         | 174 ++--
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  43 +-
>>   drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
>>   drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |   4 +-
>>   drivers/gpu/drm/nouveau/nouveau_vga.c         |   8 +-
>>   drivers/gpu/drm/nouveau/nouveau_vmm.c         |  14 +-
>>   drivers/gpu/drm/nouveau/nouveau_vmm.h         |   2 +-
>>   drivers/gpu/drm/nouveau/nv04_fence.c          |   9 +-
>>   drivers/gpu/drm/nouveau/nv10_fence.c          |   6 +-
>>   drivers/gpu/drm/nouveau/nv10_fence.h          |   2 +-
>>   drivers/gpu/drm/nouveau/nv17_fence.c          |  25 +-
>>   drivers/gpu/drm/nouveau/nv50_fence.c          |  13 +-
>>   drivers/gpu/drm/nouveau/nv84_fence.c          |  20 +-
>>   drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
>>   drivers/gpu/drm/nouveau/nvif/Kbuild           |   3 +
>>   drivers/gpu/drm/nouveau/nvif/cgrp.c           |  52 ++
>>   drivers/gpu/drm/nouveau/nvif/chan.c           | 130 +++
>>   drivers/gpu/drm/nouveau/nvif/client.c         |  54 +-
>>   drivers/gpu/drm/nouveau/nvif/conn.c           |  53 +-
>>   drivers/gpu/drm/nouveau/nvif/device.c         |  67 +-
>>   drivers/gpu/drm/nouveau/nvif/disp.c           | 107 ++-
>>   drivers/gpu/drm/nouveau/nvif/dispchan.c       | 222 +++++
>>   drivers/gpu/drm/nouveau/nvif/driver.c         |  40 +-
>>   drivers/gpu/drm/nouveau/nvif/event.c          |  63 +-
>>   drivers/gpu/drm/nouveau/nvif/fifo.c           |  66 +-
>>   drivers/gpu/drm/nouveau/nvif/head.c           |  35 +-
>>   drivers/gpu/drm/nouveau/nvif/mem.c            | 102 ++-
>>   drivers/gpu/drm/nouveau/nvif/mmu.c            | 111 +--
>>   drivers/gpu/drm/nouveau/nvif/object.c         | 290 +-----
>>   drivers/gpu/drm/nouveau/nvif/outp.c           | 353 ++-----
>>   drivers/gpu/drm/nouveau/nvif/user.c           |  50 +-
>>   drivers/gpu/drm/nouveau/nvif/userc361.c       |   8 +-
>>   drivers/gpu/drm/nouveau/nvif/vmm.c            | 200 +---
>>   drivers/gpu/drm/nouveau/nvkm/Kbuild           |   1 +
>>   drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |   2 +-
>>   drivers/gpu/drm/nouveau/nvkm/core/client.c    | 150 +--
>>   .../{nouveau_nvif.c => nvkm/core/driver.c}    |  69 +-
>>   drivers/gpu/drm/nouveau/nvkm/core/engine.c    |  12 -
>>   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 390 --------
>>   drivers/gpu/drm/nouveau/nvkm/core/object.c    | 159 +---
>>   drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  76 --
>>   drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |   8 -
>>   drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  88 +-
>>   drivers/gpu/drm/nouveau/nvkm/device/Kbuild    |   7 +
>>   .../nouveau/nvkm/{engine => }/device/acpi.c   |   0
>>   .../nouveau/nvkm/{engine => }/device/acpi.h   |   0
>>   .../nouveau/nvkm/{engine => }/device/base.c   | 552 +++++------
>>   drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 172 ++++
>>   drivers/gpu/drm/nouveau/nvkm/device/ctrl.h    |   9 +
>>   .../nouveau/nvkm/{engine => }/device/pci.c    |   4 +-
>>   .../nouveau/nvkm/{engine => }/device/priv.h   |   2 -
>>   .../nouveau/nvkm/{engine => }/device/tegra.c  |   5 +-
>>   drivers/gpu/drm/nouveau/nvkm/device/user.c    | 434 +++++++++
>>   drivers/gpu/drm/nouveau/nvkm/device/user.h    |   9 +
>>   drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   2 -
>>   .../gpu/drm/nouveau/nvkm/engine/device/Kbuild |   7 -
>>   .../gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 212 -----
>>   .../gpu/drm/nouveau/nvkm/engine/device/ctrl.h |  13 -
>>   .../gpu/drm/nouveau/nvkm/engine/device/user.c | 431 ---------
>>   .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |   1 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |  29 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 272 +++---
>>   .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   |  15 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |   2 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gk110.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gp102.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gt200.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |  52 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/head.h   |   2 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/mcp77.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/nv04.c   |   5 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |  20 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  31 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   |  46 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |  13 +-
>>   .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.c  |  70 ++
>>   .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uchan.h  |  10 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 176 ++--
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uconn.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 288 ++++--
>>   .../gpu/drm/nouveau/nvkm/engine/disp/udisp.h  |  17 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 125 +--
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uhead.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 778 ++++++++--------
>>   .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/engine/dma/user.c    |  19 -
>>   .../drm/nouveau/nvkm/engine/dma/usergf100.c   |   5 -
>>   .../drm/nouveau/nvkm/engine/dma/usergf119.c   |   5 -
>>   .../drm/nouveau/nvkm/engine/dma/usergv100.c   |   5 -
>>   .../drm/nouveau/nvkm/engine/dma/usernv50.c    |   6 -
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   1 +
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 126 ---
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   2 -
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |   5 -
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c  | 108 ++-
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 388 +++++---
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.h  |  11 +
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c  | 129 +++
>>   .../gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h  |   8 +
>>   .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |   1 -
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
>>   drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c |  14 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |   1 -
>>   .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  |   5 -
>>   .../gpu/drm/nouveau/nvkm/subdev/fault/user.c  |  99 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/fault/user.h  |   9 +
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |   1 -
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 125 ++-
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.h    |  24 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 186 ++--
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h    |  13 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 357 +++-----
>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |  12 +-
>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   8 +-
>>   .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  68 +-
>>   .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   2 +-
>>   .../drm/nouveau/nvkm/subdev/mmu/vmmgv100.c    |   2 +-
>>   .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   2 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/vfn/base.c    |   1 -
>>   .../gpu/drm/nouveau/nvkm/subdev/vfn/priv.h    |   3 -
>>   .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c    |  44 +-
>>   .../gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h    |   9 +
>>   306 files changed, 6653 insertions(+), 10697 deletions(-)
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/cgrp.h
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clb069.h
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/ctxdma.h
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/dispchan.h
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvif/driverif.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0000.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0001.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0008.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000c.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000e.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0010.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0012.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0013.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0014.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0020.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0021.h
>>   create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/driver.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/ioctl.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvif/cgrp.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvif/dispchan.c
>>   rename drivers/gpu/drm/nouveau/{nouveau_nvif.c => nvkm/core/driver.c} (65%)
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/Kbuild
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.c (100%)
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.h (100%)
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/base.c (89%)
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/pci.c (99%)
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/priv.h (95%)
>>   rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/tegra.c (97%)
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/user.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/user.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.h
>>   delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uchan.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ufifo.h
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
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.h
>>
>> --
>> 2.41.0
>>
