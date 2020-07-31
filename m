Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E307234B7F
	for <lists+nouveau@lfdr.de>; Fri, 31 Jul 2020 21:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC3A6EB3F;
	Fri, 31 Jul 2020 19:15:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54C16EB3F
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jul 2020 19:15:45 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s16so23776876qtn.7
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jul 2020 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fq0Y+W4Lgf9ZSs2fq5dZEqY/mzSGk+8POFJ4bFdvCDk=;
 b=G/VpxuJUEys50kS6M4S8wb2H1SZFH9TAe6PT9j9DjWLTOfJB5PNMU67K3dsNbEqa/T
 f/t/ak0QhLCebd7u7VQEHzvhQW9JdWn6Q0zDWLUeVDy3t8XfK0bgdcd4pK6d11b8hDOJ
 awmYIM72dgL0i2V7jQWPII+xmQ6s7xdvCa7yHe3VPproYPZLgxU/trvWLMs7TJ1a17zM
 hkxnvRS2KHmbgVl2ohPFNxuIcOG5Hy4m6X5ZU/L5bcHwUkvXjAenwqP7ddqeXsdvNx8d
 7a/WH0YQE0MirCzNS6Fv+Fw+tL8mCVhiagDDtra7MILsPqqCdx7raAC9vGeT/LHU24gG
 VvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fq0Y+W4Lgf9ZSs2fq5dZEqY/mzSGk+8POFJ4bFdvCDk=;
 b=qbWBFnwuecPSh2zm5LSGRYZMfb71PRnNhL7p8A+VIl2fc9V7sX+etMO41iX8g+LY8M
 BYfXr+3b1UOThlgJh2nCCRq6imqMoxhEsNtVzazMmKPqXBqdQo9YBJ+W/xCuGNk0dtNg
 3VNbXkdCIwMirGyc2e7gPEGbLeRrRI4xxXAaD62Dw1h5YRL3SWy2kADRY8zhHJ0E29V+
 8MD284s0T1EcOSAoPsPsyEg+oFYehGCaO38o6n4LQkA1wf9rUrlkS4xybUminK31wOfb
 rYPbkevUXjdICBXEqt1VAzvQEyV3GpntZIux/jOaXjL/eafD/JVGtb+yVP26HZOp6rbS
 m+kQ==
X-Gm-Message-State: AOAM532JmasKVpvuvMXP/vuvGdP3nECvNkDSD9/3b40EwvM6fbGW0HaU
 BWCJH+r7iTZnsau45A7rX5WF9Q==
X-Google-Smtp-Source: ABdhPJy80fPm/ep3Y4AxQL+NAp4HUm3l9/dB0ABYDlNS+XUMwzmiJ6PHh20/a5m/KIRuQsM16pnQBA==
X-Received: by 2002:aed:3361:: with SMTP id u88mr5258595qtd.79.1596222944775; 
 Fri, 31 Jul 2020 12:15:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id q2sm10160900qtl.64.2020.07.31.12.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 12:15:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k1aVL-002Bep-EX; Fri, 31 Jul 2020 16:15:43 -0300
Date: Fri, 31 Jul 2020 16:15:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200731191543.GJ24045@ziepe.ca>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-7-rcampbell@nvidia.com>
 <20200728191940.GB159104@nvidia.com>
 <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
Subject: Re: [Nouveau] [PATCH v4 6/6] mm/migrate: remove range invalidation
 in migrate_vma_pages()
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 03:04:07PM -0700, Ralph Campbell wrote:
> 
> On 7/28/20 12:19 PM, Jason Gunthorpe wrote:
> > On Thu, Jul 23, 2020 at 03:30:04PM -0700, Ralph Campbell wrote:
> > > When migrating the special zero page, migrate_vma_pages() calls
> > > mmu_notifier_invalidate_range_start() before replacing the zero page
> > > PFN in the CPU page tables. This is unnecessary since the range was
> > > invalidated in migrate_vma_setup() and the page table entry is checked
> > > to be sure it hasn't changed between migrate_vma_setup() and
> > > migrate_vma_pages(). Therefore, remove the redundant invalidation.
> > 
> > I don't follow this logic, the purpose of the invalidation is also to
> > clear out anything that may be mirroring this VA, and "the page hasn't
> > changed" doesn't seem to rule out that case?
> > 
> > I'm also not sure I follow where the zero page came from?
> 
> The zero page comes from an anonymous private VMA that is read-only
> and the user level CPU process tries to read the page data (or any
> other read page fault).
> 
> > Jason
> > 
> 
> The overall migration process is:
> 
> mmap_read_lock()
> 
> migrate_vma_setup()
>       // invalidates range, locks/isolates pages, puts migration entry in page table
> 
> <driver allocates destination pages and copies source to dest>
> 
> migrate_vma_pages()
>       // moves source struct page info to destination struct page info.
>       // clears migration flag for pages that can't be migrated.
> 
> <driver updates device page tables for pages still migrating, rollback pages not migrating>
> 
> migrate_vma_finalize()
>       // replaces migration page table entry with destination page PFN.
> 
> mmap_read_unlock()
> 
> Since the address range is invalidated in the migrate_vma_setup() stage,
> and the page is isolated from the LRU cache, locked, unmapped, and the page table
> holds a migration entry (so the page can't be faulted and the CPU page table set
> valid again), and there are no extra page references (pins), the page
> "should not be modified".

That is the physical page though, it doesn't prove nobody else is
reading the PTE.
 
> For pte_none()/is_zero_pfn() entries, migrate_vma_setup() leaves the
> pte_none()/is_zero_pfn() entry in place but does still call
> mmu_notifier_invalidate_range_start() for the whole range being migrated.

Ok..

> In the migrate_vma_pages() step, the pte page table is locked and the
> pte entry checked to be sure it is still pte_none/is_zero_pfn(). If not,
> the new page isn't inserted. If it is still none/zero, the new device private
> struct page is inserted into the page table, replacing the pte_none()/is_zero_pfn()
> page table entry. The secondary MMUs were already invalidated in the migrate_vma_setup()
> step and a pte_none() or zero page can't be modified so the only invalidation needed
> is the CPU TLB(s) for clearing the special zero page PTE entry.

No, the secondary MMU was invalidated but the invalidation start/end
range was exited. That means a secondary MMU is immeidately able to
reload the zero page into its MMU cache.

When this code replaces the PTE that has a zero page it also has to
invalidate again so that secondary MMU's are guaranteed to pick up the
new PTE value.

So, I still don't understand how this is safe?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
