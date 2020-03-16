Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231EA1873D4
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 21:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9F6E4C5;
	Mon, 16 Mar 2020 20:09:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99F6E4C5
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 20:09:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id e20so15441572qto.5
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PDNAD6S4KTd0gVi/XavugH3SkseCvoY3JtPvtDkTohU=;
 b=nsCUT+96D3VjNsrl2Pj9woIM6G1+L/e49spoRATL4fYjDKCmMd79hBVnO7MFyaCD1E
 H69sQ7R6uU7FU1kcv0npVCqHpzMBtsvzDK28Pfw8oN0s3CNOZ7+TbImmjH8HhEb/Yvdx
 ZG3uBlKT8XbAsY+s/pCfiSC3PXRh+bHBVMDz5a3bPc3ch47yOIAYnLcRAYKXiXB3N6I2
 jKc2tog/kKDGW+zuxi6eIrzxrsWorBN3cVgs8d7fBlFPY8tOruUkf6N4YQJhaUkJ8eHZ
 Memms57s9EmDz1lMImGj4va9n96e8vXoFpeBuA+HvVvzgW9e98ej1R2E3nBP0qv2Md/p
 Yt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PDNAD6S4KTd0gVi/XavugH3SkseCvoY3JtPvtDkTohU=;
 b=s0sjrYFmFCGpLpTlfYxylPShmullMDGPevBmcSCjlwU3O7MMy+3FcWa7AcO8Ta6emS
 SyrSx+67mergX3fdE/kczD1Sy+QzlHceK6eVVXbX5VHe64F9wlwV+vCDkyBozMF3AfTu
 8W3cIEWGlENqrHL3XSJq/qez/eQGgZMVXj6P7a02A5VkNZNnaxv/aI/Hfd2bgGr1JUFv
 536WZ+upYVOPwlo5inEcMjOxHqe2O8oGo+7SXXApnFlZaKSV1QFA+6QsMHmrffCN4uxM
 zQ7nRiP+iKW4+kQlboJkSVNRjRAAn60qKCMVDmabdIoR2Lyhl8YAoPH1ady2PnHOp+7I
 e7qA==
X-Gm-Message-State: ANhLgQ3bX99tnM7J2gcwZwzFvgTfOZpW3uoefJV/avUrkThWPlJjytBK
 TaW8TuwPw7r/wX5v9CZrAwEjyQ==
X-Google-Smtp-Source: ADFU+vvdX8KgG8/0KMMaE8Eeq2N9rxxz03kyvkaJo4ff8RQccEfxQBSqW5ZD+n9+Mwx3iLq3b9YiFA==
X-Received: by 2002:ac8:5193:: with SMTP id c19mr1934353qtn.204.1584389370366; 
 Mon, 16 Mar 2020 13:09:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id t7sm516565qtr.88.2020.03.16.13.09.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 13:09:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDw3F-0007G3-BI; Mon, 16 Mar 2020 17:09:29 -0300
Date: Mon, 16 Mar 2020 17:09:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200316200929.GB20010@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
 <20200316184935.GA25322@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316184935.GA25322@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 2/2] mm: remove device private page support
 from hmm_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 07:49:35PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
> >
> > On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> >> No driver has actually used properly wire up and support this feature.
> >> There is various code related to it in nouveau, but as far as I can tell
> >> it never actually got turned on, and the only changes since the initial
> >> commit are global cleanups.
> >
> > This is not actually true. OpenCL 2.x does support SVM with nouveau and
> > device private memory via clEnqueueSVMMigrateMem().
> > Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> > migrated and this change would conflict with that.
> 
> Can you explain me how we actually invoke this code?
> 
> For that we'd need HMM_PFN_DEVICE_PRIVATE NVIF_VMM_PFNMAP_V0_VRAM
> set in ->pfns before calling hmm_range_fault, which isn't happening.

Oh, I got tripped on this too

The logic is backwards from what you'd think.. If you *set*
HMM_PFN_DEVICE_PRIVATE then this triggers:

hmm_pte_need_fault():
	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
		/* Do we fault on device memory ? */
		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
			*fault = true;
		}
		return;
	}

Ie if the cpu page is a DEVICE_PRIVATE and the caller sets
HMM_PFN_DEVICE_PRIVATE in the input flags (pfns) then it always faults
it and never sets HMM_PFN_DEVICE_PRIVATE in the output flags.

So setting 0 enabled device_private support, and nouveau is Ok.

AMDGPU is broken because it can't handle device private and can't set
the flag to supress it.

I was going to try and sort this out as part of getting rid of range->flags

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
