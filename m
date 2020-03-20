Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF718C426
	for <lists+nouveau@lfdr.de>; Fri, 20 Mar 2020 01:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39076EAAB;
	Fri, 20 Mar 2020 00:14:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8186EAAE
 for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2020 00:14:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d11so5242896qko.3
 for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2020 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nvP+7glb3WoLHPLLs/r0rddcIOawD21RlTqAwhDLiqM=;
 b=IBIMkWJEumvGX8nb31UJBrjYcGu0g5u0i7eHP++QpNs0mIZt6tfWswZ99ybGL71144
 TUS8HafPlyHOZVPJc34DXy4wvD2P2SicI+yjXJMAWNdhEQeqFLO9eJmeUBTXJUcPEPUa
 tkoalhdc6qC7pqcQ5A1u1vTC8HFvVmUHui1ltpN08lYr1AjQpR35p9tw2xRS8K5B8nkY
 V1i0Xwqjekp1AhehRvyzmsWboMA5Ng9TLIT6gRikdqGksXKnNuq1O8EXy/gA3DV/5RHR
 MvlcIgxxEZsh9nImsc+4Uik71V4BCHkjU2qtXBfIbaUSIg+WCA0dBI5RrRPeZIalrdlS
 Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nvP+7glb3WoLHPLLs/r0rddcIOawD21RlTqAwhDLiqM=;
 b=FVfg7QxxLNGiPl5cZtal170CAm4qyxpyWiPfm791HOxXzfNmoikQwKDKPp3WRSJcKe
 cGm2r4ECNNG2TaEDFDfA6yKpwdmGvbijVQESUg6I6hDSPl1Po8aoz+xJ1SHDOHPrkEvm
 9dJzYE3uIr7T63DPotAk0gP4beZd9GKMnY6hRTi7mfQ2OcIs+A/Celb47clbtP0W704n
 2wFTpCnljwdVfPSZEjv++ASOkr8gjustq9CLmKB3TTGaZYQTYy7dWa5xM+bR7S9VSvBG
 ETmIOasqeEC1u/gSrplz1PxN8GQ4+8a9hDHRumM47oW3wY18SLfwWYKwDt01wXjVrlP9
 t01Q==
X-Gm-Message-State: ANhLgQ1fK4Wcvh36fIT8DwRwrHmMrCjpO/x0GPlpQehZdTqjm7Aadq3r
 Qdu36sE6NJbM5rCoemkkey7AiQ==
X-Google-Smtp-Source: ADFU+vt3JFreUrolYf7MERgEAXyQL3oYOMgyyLIC9YmuLXfqegVKOTRl/TAqFupqfqMkpNtkljckug==
X-Received: by 2002:ae9:c011:: with SMTP id u17mr5597057qkk.92.1584663269422; 
 Thu, 19 Mar 2020 17:14:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n190sm2631840qkb.93.2020.03.19.17.14.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 17:14:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jF5Iy-0002R4-Dg; Thu, 19 Mar 2020 21:14:28 -0300
Date: Thu, 19 Mar 2020 21:14:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200320001428.GA9199@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
 <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 04:14:31PM -0700, Ralph Campbell wrote:

> +static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
> +			 unsigned long end, bool write)
> +{
> +	struct mm_struct *mm = dmirror->mm;
> +	unsigned long addr;
> +	uint64_t pfns[64];
> +	struct hmm_range range = {
> +		.notifier = &dmirror->notifier,
> +		.pfns = pfns,
> +		.flags = dmirror_hmm_flags,
> +		.values = dmirror_hmm_values,
> +		.pfn_shift = DPT_SHIFT,
> +		.pfn_flags_mask = ~(dmirror_hmm_flags[HMM_PFN_VALID] |
> +				    dmirror_hmm_flags[HMM_PFN_WRITE]),

Since pfns is not initialized pfn_flags_mask should be 0.

> +		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
> +				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
> +		.dev_private_owner = dmirror->mdevice,
> +	};
> +	int ret = 0;

> +static int dmirror_snapshot(struct dmirror *dmirror,
> +			    struct hmm_dmirror_cmd *cmd)
> +{
> +	struct mm_struct *mm = dmirror->mm;
> +	unsigned long start, end;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	unsigned long addr;
> +	unsigned long next;
> +	uint64_t pfns[64];
> +	unsigned char perm[64];
> +	char __user *uptr;
> +	struct hmm_range range = {
> +		.pfns = pfns,
> +		.flags = dmirror_hmm_flags,
> +		.values = dmirror_hmm_values,
> +		.pfn_shift = DPT_SHIFT,
> +		.pfn_flags_mask = ~0ULL,

Same here, especially since this is snapshot

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
