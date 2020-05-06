Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A81C761E
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 18:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E86E8A4;
	Wed,  6 May 2020 16:21:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF396E8A7
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 16:21:05 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f83so2539982qke.13
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dyoh+uzVopySI5FODKG7mHSszpizan+Lq+4GxuY2nZ8=;
 b=P+43D4P1hqyTZkojEPCCJuDCm7TXg2VQDDPQxA//nlF2E86IuTMhMq6XxjWiDz0oz/
 3f18nbAnTq5RBz0pWEv3ceRSY2fQB2/a0ViylC4ayCemaVXZQE7XUjS1l9/1MPk33QN8
 nHvcCpTb0qtnHhylLe0Y2fhmYvH7ULMCgo59PztdctkblFy365mIbiq8HoCRTa55XSDa
 B7MkXM9oV1iwIiNiUiwNnmbJMVUtYa9HsYXxX09CAie92NQ+JXEIyEkDuyMZbFbYuBcR
 RwdruGuA1FvQ32Lb9/Ze5APaYKPH27Zx+bURMQpwFXseHVsa9WIpcIanjKG0llobFndA
 55UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dyoh+uzVopySI5FODKG7mHSszpizan+Lq+4GxuY2nZ8=;
 b=jQ/5AmCxCvOLNvowtCfESuLtfZ6DpoQ9UjfdwTnimnz46iAPcJLoEX2ynZVs6avtgK
 aPbFJTIq//48tggYaSnR/zvq/BHdrZ7SQ7Izkpn/oDSL6d1WcpegX6BflDTKuGdTyfpe
 JxAFxQbToVoIVWCeTuxYx3CwBCnGVt26CQNfX8qi8+mPZJKsIYO7Jn9f2Wgc38Zusyuh
 6VGXmdHOGTlyIK/Fq7ugypLs2ZaTwpMl5KNOelZGe0Wbyho2BmwNCPywiSCqV/qHsj4T
 GNxJ3uHZYsGwuCc3DKH6pAdsokHL4FSgZyjOBLeFU1OVfXuemYXlz5NY7s3wcTmkrVP2
 qzpg==
X-Gm-Message-State: AGi0PubBexiZFFF5JNQeV+1JChMoH2rtNmpasjrOA5Hpyl+zVOFMXPGJ
 dmCzebFTvJnNuPpav3c5/pOUxg==
X-Google-Smtp-Source: APiQypL1015F99syX42d8DJqfJa0K6kyV7lWTAd4boVw1cslKJCDATld5u+wCnsBs116QhYGHusayw==
X-Received: by 2002:a37:4383:: with SMTP id q125mr9214194qka.273.1588782064906; 
 Wed, 06 May 2020 09:21:04 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id i42sm1989348qtc.83.2020.05.06.09.21.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 May 2020 09:21:04 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jWMn9-0002xP-UF; Wed, 06 May 2020 13:21:03 -0300
Date: Wed, 6 May 2020 13:21:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200506162103.GH26002@ziepe.ca>
References: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
 <c0d02b98-c356-60b1-6043-5b8d1a9be19a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0d02b98-c356-60b1-6043-5b8d1a9be19a@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH hmm v2 5/5] mm/hmm: remove the customizable
 pfn format from hmm_range_fault
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, "Yang, Philip" <Philip.Yang@amd.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 06:30:00PM -0700, John Hubbard wrote:
> On 2020-05-01 11:20, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > Presumably the intent here was that hmm_range_fault() could put the data
> > into some HW specific format and thus avoid some work. However, nothing
> > actually does that, and it isn't clear how anything actually could do that
> > as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> > 
> > Perhaps there is some special HW that does not need DMA mapping, but we
> > don't have any examples of this, and the theoretical performance win of
> > avoiding an extra scan over the pfns array doesn't seem worth the
> > complexity. Plus pfns needs to be scanned anyhow to sort out any
> > DEVICE_PRIVATE pages.
> > 
> > This version replaces the uint64_t with an usigned long containing a pfn
> > and fixed flags. On input flags is filled with the HMM_PFN_REQ_* values,
> > on successful output it is filled with HMM_PFN_* values, describing the
> > state of the pages.
> > 
> 
> Just some minor stuff below. I wasn't able to spot any errors in the code,
> though, so these are just documentation nits.
> 
> 
> ...
> 
> > 
> > diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> > index 9924f2caa0184c..c9f2329113a47f 100644
> > +++ b/Documentation/vm/hmm.rst
> > @@ -185,9 +185,6 @@ The usage pattern is::
> >         range.start = ...;
> >         range.end = ...;
> >         range.pfns = ...;
> 
> That should be:
> 
>           range.hmm_pfns = ...;

Yep

> 
> > -      range.flags = ...;
> > -      range.values = ...;
> > -      range.pfn_shift = ...;
> >         if (!mmget_not_zero(interval_sub->notifier.mm))
> >             return -EFAULT;
> > @@ -229,15 +226,10 @@ The hmm_range struct has 2 fields, default_flags and pfn_flags_mask, that specif
> >   fault or snapshot policy for the whole range instead of having to set them
> >   for each entry in the pfns array.
> > -For instance, if the device flags for range.flags are::
> > +For instance if the device driver wants pages for a range with at least read
> > +permission, it sets::
> > -    range.flags[HMM_PFN_VALID] = (1 << 63);
> > -    range.flags[HMM_PFN_WRITE] = (1 << 62);
> > -
> > -and the device driver wants pages for a range with at least read permission,
> > -it sets::
> > -
> > -    range->default_flags = (1 << 63);
> > +    range->default_flags = HMM_PFN_REQ_FAULT;
> >       range->pfn_flags_mask = 0;
> >   and calls hmm_range_fault() as described above. This will fill fault all pages
> > @@ -246,18 +238,18 @@ in the range with at least read permission.
> >   Now let's say the driver wants to do the same except for one page in the range for
> >   which it wants to have write permission. Now driver set::
> > -    range->default_flags = (1 << 63);
> > -    range->pfn_flags_mask = (1 << 62);
> > -    range->pfns[index_of_write] = (1 << 62);
> > +    range->default_flags = HMM_PFN_REQ_FAULT;
> > +    range->pfn_flags_mask = HMM_PFN_REQ_WRITE;
> > +    range->pfns[index_of_write] = HMM_PFN_REQ_WRITE;
> 
> 
> All these choices for _WRITE behavior make it slightly confusing. I mean, it's
> better than it was, but there are default flags, a mask, and an index as well,
> and it looks like maybe we have a little more power and flexibility than
> desirable? Nouveau for example is now just setting the mask only:

The example is showing how to fault all pages but request write for
only certain pages, ie it shows how to use default_flags and pfn_flags
together in probably the only way that could make any sense

> > @@ -542,12 +564,15 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >   			return -EBUSY;
> >   		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > -		range.default_flags = 0;
> > -		range.pfn_flags_mask = -1UL;
> >   		down_read(&mm->mmap_sem);
> >   		ret = hmm_range_fault(&range);
> >   		up_read(&mm->mmap_sem);
> >   		if (ret) {
> > +			/*
> > +			 * FIXME: the input PFN_REQ flags are destroyed on
> > +			 * -EBUSY, we need to regenerate them, also for the
> > +			 * other continue below
> > +			 */
> 
> How serious is this FIXME? It seems like we could get stuck in a loop here,
> if we're not issuing a new REQ, right?

Serious enough someone should fix it and not copy it into other
drivers..
 
> >   			if (ret == -EBUSY)
> >   				continue;
> >   			return ret;
> > @@ -562,7 +587,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >   		break;
> >   	}
> > -	nouveau_dmem_convert_pfn(drm, &range);
> > +	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
> >   	svmm->vmm->vmm.object.client->super = true;
> >   	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
> > @@ -589,6 +614,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
> >   		} i;
> >   		u64 phys[16];
> >   	} args;
> > +	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];
> 
> 
> Is there a risk of blowing up the stack here?

16*8 is pretty small, but the call stack is very long sadly, since
Ralph succeed it seems OK

> >    */
> > -enum hmm_pfn_flag_e {
> > -	HMM_PFN_VALID = 0,
> > -	HMM_PFN_WRITE,
> > -	HMM_PFN_FLAG_MAX
> > +enum hmm_pfn_flags {
> 
> Let's add:
> 
>         /* Output flags: */
> 
> > +	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
> > +	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
> > +	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> > +
> 
>         /* Input flags: */

Ok

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
