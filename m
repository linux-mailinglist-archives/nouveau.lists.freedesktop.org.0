Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C97E314CED
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 11:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369FE6EAD1;
	Tue,  9 Feb 2021 10:27:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718E76EAD1
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 10:27:18 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u66so16954748oig.9
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuPwe6UnW2D70azMPi7ooQm/qzJFfsCFKJ5pbRf3Rag=;
 b=fjNiIqJN11AmOAs1Pa1q8noSSurhramxPWrN+UmCUCz19mWIDz3e7u/5LlRSNHdThF
 3SEZ7MSpAtz9+pzxH2o0Dx3sbAmj0oYCQwbWPReA/QOLUf+HZ5ccnMsn7DBtkieJMPzL
 BA++OnfY3vQP93lMntxdlYu6pI2Pqm/Q0zTQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuPwe6UnW2D70azMPi7ooQm/qzJFfsCFKJ5pbRf3Rag=;
 b=B5jaAZ2OpkxmOjmN/24y2qMDyo5oiAE3dGvRPt8JTG+QEUT7XVrbd6yyHP21vQBgPt
 HgqNpT8DEicVQGXb9acoVklbm3jz7EfB2w3c7nJ78IrGuVrlwuREi32pi2Y3Zspn3EKp
 0388w9v4BoIXGx4IlBgnF3QmrsEroVp9dFKN4ubtFuq0f2D/qKDxQDhLNwhV068xusnL
 ZyyZfXipW6Y6jwFMzoGlJrdr4Db+iikZMvqG1I2p5rIHdRObgD5eVqiYU9o5tslkoqhf
 JxrrXeI1qgu9RnoThsxUmy29Q73yRKlbS63be3juT23b/Dy2oC1t6s6hil87hVqlQGQo
 zOhA==
X-Gm-Message-State: AOAM532xsZl1gsjbGDr6tifIgpF72ghsVNAN8xSQc+mbAdSmofBCH3MD
 zvef0u63oVqxJFsozj0S9FlnjqpV+2VHQaNwKPvSPg==
X-Google-Smtp-Source: ABdhPJyir5D67fhPcTVsC/9F/To+q3sh8YkD1lFXu3j/zAvynT6ofUoVqy6egtyN+Ya2IAdtuesS+PnTgi+/Evagt+A=
X-Received: by 2002:aca:1906:: with SMTP id l6mr1967569oii.101.1612866437717; 
 Tue, 09 Feb 2021 02:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20210209010722.13839-1-apopple@nvidia.com>
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 11:27:05 +0100
Message-ID: <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [Nouveau] [PATCH 0/9] Add support for SVM atomics in Nouveau
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:07:13PM +1100, Alistair Popple wrote:
> This series adds support to Nouveau for atomic memory operations on OpenCL
> shared virtual memory (SVM). This is achieved using the atomic PTE bits on
> the GPU to only permit atomic operations to system memory when a page is
> not mapped in userspace on the CPU.
>
> This is implemented by adding a mode to migrate_vma_pages() which unmaps
> and isolates existing pages from the CPU and pins them. The original
> userspace page table entries are migrated to point to device private pages
> allocated by the driver. This allows the driver to enable GPU atomic access
> to the page as it will receive a callback when CPU userspace needs to
> access it.
>
> In response to this callback the driver revokes the atomic access
> permission from the GPU and migrates entries to point back to the original
> page. The original page is unpinned as part of the migration operation
> which also returns it to the LRU.
>
> Patch 3 contains the bulk of the memory management changes to implement
> unmap and pin.
>
> Patches 6-9 extend Nouveau to use the new mode to allow system wide atomics
> for OpenCL SVM to be implemented on Nouveau.
>
> This has been tested using the latest upstream Mesa userspace with a simple
> OpenCL test program which checks the results of atomic GPU operations on a
> buffer whilst also writing to the same buffer from the CPU.
>
> Problems yet to be addressed:
>
> Recent changes to pin_user_pages() prevent the creation of pinned pages in
> ZONE_MOVABLE. This series allows pinned pages to be created in ZONE_MOVABLE
> as attempts to migrate may fail which would be fatal to userspace.
>
> In this case migration of the pinned page is unnecessary as the page can be
> unpinned at anytime by having the driver revoke atomic permission as it
> does for the migrate_to_ram() callback. However a method of calling this
> when memory needs to be moved has yet to be resolved so any discussion is
> welcome.

Why do we need to pin for gpu atomics? You still have the callback for
cpu faults, so you
can move the page as needed, and hence a long-term pin sounds like the
wrong approach.

That would avoid all the hacking around long term pin constraints, because
for real unmoveable long term pinned memory we really want to have all
these checks. So I think we might be missing some other callbacks to be
able to move these pages, instead of abusing longterm pins for lack of
better tools.

Cheers, Daniel



>
> Alistair Popple (9):
>   mm/migrate.c: Always allow device private pages to migrate
>   mm/migrate.c: Allow pfn flags to be passed to migrate_vma_setup()
>   mm/migrate: Add a unmap and pin migration mode
>   Documentation: Add unmap and pin to HMM
>   hmm-tests: Add test for unmap and pin
>   nouveau/dmem: Only map migrating pages
>   nouveau/svm: Refactor nouveau_range_fault
>   nouveau/dmem: Add support for multiple page types
>   nouveau/svm: Implement atomic SVM access
>
>  Documentation/vm/hmm.rst                      |  22 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c            |   4 +-
>  drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        | 190 +++++++++++++++---
>  drivers/gpu/drm/nouveau/nouveau_dmem.h        |   9 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c         | 148 +++++++++++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
>  include/linux/migrate.h                       |   2 +
>  include/linux/migrate_mode.h                  |   1 +
>  lib/test_hmm.c                                | 109 ++++++++--
>  lib/test_hmm_uapi.h                           |   1 +
>  mm/migrate.c                                  |  82 +++++---
>  tools/testing/selftests/vm/hmm-tests.c        |  49 +++++
>  14 files changed, 524 insertions(+), 101 deletions(-)
>
> --
> 2.20.1
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
