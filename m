Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD61BEC20
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 00:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774446EB11;
	Wed, 29 Apr 2020 22:41:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3DF6EB11
 for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2020 22:41:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s9so1130935qkm.6
 for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2020 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yBgZcrV4iWdwc8bXr1UgNLaniSphIyQASgPqncouw5A=;
 b=f12ZywN6K7/T0vh/KFA3gH3gfK1sZ3o1eqim7onv3KljZBN4EOi4bv6G5V+XbG4ut1
 QQLVUyAfs4arAjqaqFVeMkgjxNn40gaGCjoQ7o0T29H6bsy2WzWeCqi+bO3ZRddrrCIx
 ZpoSV5qQBQZnrndmt08qcR/DcYoVpUDmC5hY7V0oWPPMSFSPw5y5/KRbFoEpmjdnydS9
 baSt1dM3SYcyQ1N3yyIRPCOPHVdxSN8akC48vdq9aPEUZEPCm7Q2lckDBnXUDRGzXwp2
 4bh9Wy/0+rhTYdXvbRRxtmS5bIVA54WQzEwFvGgqOS4DEMnxOYBSpNngwveCYRtgj0jf
 jg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yBgZcrV4iWdwc8bXr1UgNLaniSphIyQASgPqncouw5A=;
 b=aRkjYqLKanBn23ujJ1QkMku+5a4EQzJ8uf7lrMVXN45uHKdSGzSCuH1q+PlRGyph5f
 aNqwOW39S2zCM9s9XTA4pbKOHT1KBJQ/dzmKryNVn6gDDnX11soX27dVRjdBrC3+ygk7
 acII7vxPG27mpYUH6JIW2s6eRZ3ArwrfRyGeiHWGyHew7C9e1WsQIw+TWPqwYaX9RxdA
 sOUul8qg8DbXvwrldZWq951EMPLXuF1blo5OLsNXqeK/ii3xjG37+BBSCa/st5RMrWW1
 AkJv/iQAEh+rWL6NRkiJ7vHWfdX22sWfjhg7s3h59KHKqRnTJF+HsDM6czCooeOkxLRD
 L3yQ==
X-Gm-Message-State: AGi0PuZAbNmQxDYIlOkODFG3YKkh6lR+Ecu00/EVvJWKZXpGyPsKXQ+k
 WMX2bpPB00LhSiYEfhPCdE1qkA==
X-Google-Smtp-Source: APiQypLKqND0JKjNOfB6OKttFWw4PueCh+kW/uTm/J+/8LnYtWQ1Yu18biU6LtzJiRmM87wUIsCivg==
X-Received: by 2002:a05:620a:1305:: with SMTP id
 o5mr811497qkj.222.1588200089029; 
 Wed, 29 Apr 2020 15:41:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id v27sm551028qtb.35.2020.04.29.15.41.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 15:41:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jTvOR-0000GO-Rd; Wed, 29 Apr 2020 19:41:27 -0300
Date: Wed, 29 Apr 2020 19:41:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <20200429224127.GB3824@ziepe.ca>
References: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH hmm 5/5] mm/hmm: remove the customizable pfn
 format from hmm_range_fault
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 01:52:32PM -0400, Felix Kuehling wrote:
> [+Philip Yang]
> 
> Am 2020-04-21 um 8:21 p.m. schrieb Jason Gunthorpe:
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
> > and fix flags. On input flags is filled with the HMM_PFN_REQ_* values, on
> > successful output it is filled with HMM_PFN_* values, describing the state
> > of the pages.
> >
> > amdgpu is simple to convert, it doesn't use snapshot and doesn't use
> > per-page flags.
> >
> > nouveau uses only 16 hmm_pte entries at most (ie fits in a few cache
> > lines), and it sweeps over its pfns array a couple of times anyhow.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Hi Jason,
> 
> I pointed out a typo in the documentation inline. Other than that, the
> series is
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> I'll try to build it and run some basic tests later.

Got it, thanks! Let me know if there are problems

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
