Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0802375059
	for <lists+nouveau@lfdr.de>; Thu,  6 May 2021 09:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BB16E51C;
	Thu,  6 May 2021 07:44:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CD36E51C;
 Thu,  6 May 2021 07:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jd35PqN0jolJVQ177nPOm2qyAyeBXqUiWqSTMM+C08+3q7cnfjm53pE05xJ4P88lmmCJXfTGUFu1vWZQzF2wXVKVlAcFPBoyDV84P+BMzYPLTMOgjPId1p9qR0KkEZH43e/8/AIbTI63iwm/hUaEdbcKneT52rBnWZ/S5/76MXQVY74fQv69lZ3nWng/Pm0AeXiJBAEF80VhOpqt/KX+kscGT0lPlbrUkCTNQIbkWuxq02D+51/quySmjEcQbFTp51B3lJEXDURPKQmlsvic18I8vJAEzUdro/lSZjTv8DlXnH+P9R/CuOYnb6NVOVIGS0Xu1VEpxUjqEYc8K+szyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDE9XH1jM5+h7rrVVVx4PrH/36hBQ28evpnHntDvfd0=;
 b=XMHj4togSAntuJytVbTM219MSA45QoKUpyyCDp/h+7VNGNlj/exxwcj41pvtZITvU4NhcfID5nJ2G8pUefcu7KGopL4r29XE0dSoI66QPo8pPzlH1bGzMlkhNIWHnh2fTRKuSlA79h9h+xKKuYB4hpy3t4nyDYlqF3mCh8MU0UXs1Ge1/0cU9gaeXDOoQEExOLB2uPGB0kTpPwBOc2B+QJ3X/i9J3j/ykE6dY16Dto6f2Wk481RPij9JrB1X7DVNGEYAhTG5Jtul4ozXu0z33ZhhvR3/48+MHtJAcKtyu3UpPLTDiZqBxEIinamimHTCWi0gUflJQnZyOVvL/32LIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDE9XH1jM5+h7rrVVVx4PrH/36hBQ28evpnHntDvfd0=;
 b=rAFPDb5AfEbupSy6C0zW8cw0bEeC8U0wpmScGgF0wCKmXqurr5xuNAjEj3Elv/A/OXn4MjoYJvPrw060AGSohMlK+ilOxqyHPUKETctwejYiUQfrLexCqmuk1OZabSKj2vBC/RcsYl3M9G/67mclaAE4q73qG3t3IrBP/CiXEDBNHYrUC2bOBY0i2BcQUlIDXaJVz/DFRGbnHmM/mfaIKrOYZ2SItq2n57xilSjZruYMhepHMiTQ+995DYfodlKTFhmGKnroxSncG+b/jSQflYsex3MLvsW06kCwZqJMX3fMmxE3p/0+xAWNGSNjx5iQYD4cGbGE7fPZ76Xv5x7EFg==
Received: from MWHPR2201CA0050.namprd22.prod.outlook.com
 (2603:10b6:301:16::24) by BN6PR12MB1185.namprd12.prod.outlook.com
 (2603:10b6:404:1e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 07:44:00 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::5c) by MWHPR2201CA0050.outlook.office365.com
 (2603:10b6:301:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Thu, 6 May 2021 07:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 07:43:59 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 07:43:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>
Date: Thu, 6 May 2021 17:43:53 +1000
Message-ID: <2550644.JnOt3SL4Yy@nvdebian>
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9016d9-b380-40fc-5918-08d91062b5ba
X-MS-TrafficTypeDiagnostic: BN6PR12MB1185:
X-Microsoft-Antispam-PRVS: <BN6PR12MB11859E7FE6713DE06E6BCC60DF589@BN6PR12MB1185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPJ3PEH9pc2VBkC5HQXnqPFaRG5QulQJDgW0gSnYnSUvTIfbLEE9L1vzA4mrGXFws02DxqSnhugVbSSBn5Tg76T8jtggxHw93+ZQ/Hwtt3o8kGJIeatwJZkEBkiTUvcwyoN0sE6HzMjMbBiobu5Zg0PC/5u4+V7PcBUTWH6sl3k5nBJiBW3czFmhjuAxWKoyxZHAnXwUGu9vhs9sfhuqdqgAyMoxlxyw+eA5VlNZqoy62eBn/1uEbF3N3ewZjVg/RePYT4Ul8nPlUYNaZVcgXL+hV005RXl/QQSi9wuu4nyqu6vUKS8cKBeqIW+AYee2YRZSmOV1AXaCbioOXYdI/FEjA6+ngdtveh3VLhQNxUGHJFVDzdRz/ovClVg5F3wP0e2PNKfy5njHtqibIRrxU+Rp+wEuCLOMNw4mX3qYU/1NIoOUFmKApj6KwsbYHGIO2Sd0am936kmhfkXv46BhSmWoDt4WVHKe+7/BZ7PgxSKGuY1rHEz2kiAy94E/BhAfnGIQs2zCkYxl9N0zkkk5etSAm3CGMGRkzCkZl98jkVhk5upDFXzYHo3yNEMnFY+NKIf+t2F3CNeq9tQT8JPX31R/u82k8Krv58R9/nAaSXJViu/GkDBo9QVIBHOyW/Wwu8yLxfRECf/jIQclnDOqO4MS3cmJCHMVHX3yQfOc30MfrpFC+u1wVdWbyb6njRxfwKvtscqHio5OCF+/9KW01AFipDacnTIrjQdo1IzycJsYhP9CsyuA3HTfn3CxMtEn
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(5660300002)(186003)(7636003)(316002)(478600001)(336012)(2906002)(16526019)(9686003)(426003)(70206006)(54906003)(36860700001)(33716001)(966005)(9576002)(6916009)(8676002)(7416002)(47076005)(86362001)(4326008)(8936002)(82310400003)(70586007)(82740400003)(26005)(356005)(83380400001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 07:43:59.0784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9016d9-b380-40fc-5918-08d91062b5ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1185
Subject: Re: [Nouveau] [PATCH v8 0/8] Add support for SVM atomics in Nouveau
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 bsingharora@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, bskeggs@redhat.com,
 jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Andrew,

There is currently no outstanding feedback for this series so I am hoping it 
may be considered for inclusion (or at least the mm portions - I still need 
Reviews/Acks for the Nouveau bits). The main change for v8 was removal of 
entries on fork rather than copying in response to feedback from Jason so any 
follow up comments on patch 5 would also be welcome. The series contains a 
number of general clean-ups suggested by Christoph along with a feature to 
temporarily make selected user page mappings write-protected.

This is needed to support OpenCL atomic operations in Nouveau to shared 
virtual memory (SVM) regions allocated with the CL_MEM_SVM_ATOMICS clSVMAlloc 
flag. A more complete description of the OpenCL SVM feature is available at 
https://www.khronos.org/registry/OpenCL/specs/3.0-unified/html/
OpenCL_API.html#_shared_virtual_memory .

I have been testing this with Mesa 21.1.0 and a simple OpenCL program which 
checks GPU atomic accesses to system memory are atomic. Without this series 
the test fails as there is no way of write-protecting the userspace page 
mapping which results in the device clobbering CPU writes. For reference the 
test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/ .

 - Alistair

On Wednesday, 7 April 2021 6:42:30 PM AEST Alistair Popple wrote:
> This is the eighth version of a series to add support to Nouveau for atomic
> memory operations on OpenCL shared virtual memory (SVM) regions.
> 
> The main change for this version is a simplification of device exclusive
> entry handling. Instead of copying entries for copy-on-write mappings
> during fork they are removed instead. This is safer because there could be
> unique corner cases when copying, particularly for pinned pages which
> should follow the same logic as copy_present_page(). Removing entries
> avoids this possiblity by treating them as normal ptes.
> 
> Exclusive device access is implemented by adding a new swap entry type
> (SWAP_DEVICE_EXCLUSIVE) which is similar to a migration entry. The main
> difference is that on fault the original entry is immediately restored by
> the fault handler instead of waiting.
> 
> Restoring the entry triggers calls to MMU notifers which allows a device
> driver to revoke the atomic access permission from the GPU prior to the CPU
> finalising the entry.
> 
> Patches 1 & 2 refactor existing migration and device private entry
> functions.
> 
> Patches 3 & 4 rework try_to_unmap_one() by splitting out unrelated
> functionality into separate functions - try_to_migrate_one() and
> try_to_munlock_one(). These should not change any functionality, but any
> help testing would be much appreciated as I have not been able to test
> every usage of try_to_unmap_one().
> 
> Patch 5 contains the bulk of the implementation for device exclusive
> memory.
> 
> Patch 6 contains some additions to the HMM selftests to ensure everything
> works as expected.
> 
> Patch 7 is a cleanup for the Nouveau SVM implementation.
> 
> Patch 8 contains the implementation of atomic access for the Nouveau
> driver.
> 
> This has been tested using the latest upstream Mesa userspace with a simple
> OpenCL test program which checks the results of atomic GPU operations on a
> SVM buffer whilst also writing to the same buffer from the CPU.
> 
> Alistair Popple (8):
>   mm: Remove special swap entry functions
>   mm/swapops: Rework swap entry manipulation code
>   mm/rmap: Split try_to_munlock from try_to_unmap
>   mm/rmap: Split migration into its own function
>   mm: Device exclusive memory access
>   mm: Selftests for exclusive device memory
>   nouveau/svm: Refactor nouveau_range_fault
>   nouveau/svm: Implement atomic SVM access
> 
>  Documentation/vm/hmm.rst                      |  19 +-
>  Documentation/vm/unevictable-lru.rst          |  33 +-
>  arch/s390/mm/pgtable.c                        |   2 +-
>  drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c         | 156 ++++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
>  fs/proc/task_mmu.c                            |  23 +-
>  include/linux/mmu_notifier.h                  |  26 +-
>  include/linux/rmap.h                          |  11 +-
>  include/linux/swap.h                          |   8 +-
>  include/linux/swapops.h                       | 123 ++--
>  lib/test_hmm.c                                | 126 +++-
>  lib/test_hmm_uapi.h                           |   2 +
>  mm/debug_vm_pgtable.c                         |  12 +-
>  mm/hmm.c                                      |  12 +-
>  mm/huge_memory.c                              |  45 +-
>  mm/hugetlb.c                                  |  10 +-
>  mm/memcontrol.c                               |   2 +-
>  mm/memory.c                                   | 196 +++++-
>  mm/migrate.c                                  |  51 +-
>  mm/mlock.c                                    |  10 +-
>  mm/mprotect.c                                 |  18 +-
>  mm/page_vma_mapped.c                          |  15 +-
>  mm/rmap.c                                     | 612 +++++++++++++++---
>  tools/testing/selftests/vm/hmm-tests.c        | 158 +++++
>  26 files changed, 1366 insertions(+), 312 deletions(-)
> 
> 




_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
