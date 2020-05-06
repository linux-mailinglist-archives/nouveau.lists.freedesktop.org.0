Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9D1C7617
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 18:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906336E8A5;
	Wed,  6 May 2020 16:18:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10806E8A5
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 16:18:26 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z90so1832675qtd.10
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dI/8k01wqNtPsEMN3JryPuexKMUAM9GFAPsiKlMJOgs=;
 b=CDYYUXVytFKURB46DxLbtSQhLKEUVHOamKg4N6ws/VeYuZqe48aW2fVU4DY/h9Bp0C
 oxPsar9OJVyyfKYewl2b61UAK/iYMJhUOEztf6FyAWUPWMHx6K52Ms3zjFawc0T82Nl1
 7Xt+P1aPijxMvudfHiyJNFg5C9ZFGxb7Xq5W8dbwJ21FJwxC/q1Blc/Rw7qi4EBtZ7QU
 QsgB9ERVVjUURncAAw80TIEnHnDpJ9Brzd9+PloSZTbvOPoos60r/CIiiaGLTHr18jlp
 z1hKejvJ2XMgEhTqjmxxET3DODSbvUQWlTA4t/TK35N6seBmGymATrWanur938yEOAM8
 A/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dI/8k01wqNtPsEMN3JryPuexKMUAM9GFAPsiKlMJOgs=;
 b=PJT9RCLU5MynNH4pAh0AmmpZFXveQOYjENajvFLUrGIQ6qqLTn5USnZAq/AjbXnG4V
 UCrQ8T9Ab2RoNRT/fkwEcVR+DnX2w6h02Bftvtyjfb5LegtifbG47dUnksx7YamAW4iH
 /5DNO0jnBP3uxxJypKU8Kk76uvcbsxRo6Jf/vnIdJKbiAuLJPe9Z3TJTAxlWHG1+7hSK
 TNgp1h6P2TMEw22VTDYECkMlZfBCF48X8Tmpv6fg5FxeJoOEwXCGAvtu5xqIDV/iY8aD
 7t1DgyWoQ2Fb3lAPfwdxYIZnrKpvhcOgI1w/SbXJihNRFhmIadoa6geVABtfDNvW/Kgq
 HbJg==
X-Gm-Message-State: AGi0PubRZKIul+JGh0JF+O3lET9oO1f+xyAoGesWmzc7qhfYk4eGsxBu
 F/L0t3cb2eYFw+1b/Q8SdBBbXw==
X-Google-Smtp-Source: APiQypKyDRDNEzprm+gsfACpH0aQyfocl+/L2XhuNJKEuZItD8tyLPJ84MVvdGkrVM9/6D8550tNkg==
X-Received: by 2002:aed:2e83:: with SMTP id k3mr9101168qtd.2.1588781906015;
 Wed, 06 May 2020 09:18:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id h13sm1895261qti.32.2020.05.06.09.18.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 May 2020 09:18:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jWMka-0002ut-Lq; Wed, 06 May 2020 13:18:24 -0300
Date: Wed, 6 May 2020 13:18:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200506161824.GG26002@ziepe.ca>
References: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
 <3c06a94c-c17f-dc31-537e-f3f6e1ace9a2@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c06a94c-c17f-dc31-537e-f3f6e1ace9a2@nvidia.com>
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 01, 2020 at 05:53:26PM -0700, Ralph Campbell wrote:
> > Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > Tested-by: Ralph Campbell <rcampbell@nvidia.com>
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >   Documentation/vm/hmm.rst                |  26 ++--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  35 ++----
> >   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  27 +---
> >   drivers/gpu/drm/nouveau/nouveau_dmem.h  |   3 +-
> >   drivers/gpu/drm/nouveau/nouveau_svm.c   |  87 ++++++++-----
> >   include/linux/hmm.h                     |  99 ++++++---------
> >   mm/hmm.c                                | 160 +++++++++++-------------
> >   7 files changed, 192 insertions(+), 245 deletions(-)
> > 
> 
> ...snip...
> 
> > +static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
> > +				    struct hmm_range *range, u64 *ioctl_addr)
> > +{
> > +	unsigned long i, npages;
> > +
> > +	/*
> > +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> > +	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
> > +	 *
> > +	 * This is all just encoding the internal hmm reprensetation into a
> 
> s/reprensetation/representation/
> 
> Looks good and still tests OK with nouveau.

Got it, thanks

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
