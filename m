Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73712B335
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B09D6E424;
	Fri, 27 Dec 2019 08:14:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA916E40A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2019 13:59:39 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e66so12275214qkf.13
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2019 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8jOH6aTboFzH2FE5ebDVzGbVS8tkTfz/e6O//bI0tkY=;
 b=TOjiKaf4drtV5ldH8zR3DdZRftx4pfyMK7aX+WxF+hP7GAklHNLQJLB3u6THZAuUwq
 2J8U2Z8jfa4RHHqJi86VA8XDEEftIwINME4Xcqo7Lwf5TfQ/5CHndbgRjMZBi7ltmTD/
 9/OIdOP+IKZBXBOnw95rEg1RRCcplq0VveMXmbgEcrW0nIfOMVnpZGUZJC/dcmVtrcLp
 GnztoS4X7Cig0PpARFdiBQAFwuPsNE3oq28XslCe7YAiytEpFuhH3cYXFITze125lBn3
 w8SiavcWCCYZB5EGHirP4nTYv97GbqlF/YYAtwW9ZFYvfLIJ06XZktP4ccL77Rn8KbAv
 rdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8jOH6aTboFzH2FE5ebDVzGbVS8tkTfz/e6O//bI0tkY=;
 b=Fv0Some3Ka0XTpr8WBWetUxPOlBwuJRxmMWn4QpI0+6+EGyxgWA7k1Wg6IO4lpOBLX
 O+1eLgPYIW48iyNjundFOLv5D7FH0h1WYahnpT5xays5LvqkuArUYZRGdFi/QKY7gAtT
 91AU+iM+zjOnOX8Wq/Bp8OcrBN/CLUw6YWe8hlOKG4zPCJnrteEBAk2+aUpInw+lUigp
 KtqIroIobxifpQMvtVTcW+ace5X4ESFHcMQhInEF7BFDzMsShxGxbXpbUz06whaAaF0H
 +BfB7Zxw+JM5RsRtJ5M3rsVIP1I1XuTI4440EthRMEzWXDrfF4NCBnCYQTq2MTucRBbe
 a5Nw==
X-Gm-Message-State: APjAAAXKlce7dNoHE+hrojMh8yH4RTlkUf6uZtmZnjxNaDWLDaRkPVxz
 MSnxY7YXw/VoFRbd4uwUaMB8ZQ==
X-Google-Smtp-Source: APXvYqw2t3qlIvqK+Izwy8tw608BKfVw2jgQ/Y0rREEshgcaboVymXi/nbliXAwFtIZ8GNBEqxuwOw==
X-Received: by 2002:a05:620a:8cb:: with SMTP id
 z11mr15146993qkz.72.1572357577964; 
 Tue, 29 Oct 2019 06:59:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id p188sm7446102qkb.33.2019.10.29.06.59.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 06:59:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPS24-0005x3-D2; Tue, 29 Oct 2019 10:59:36 -0300
Date: Tue, 29 Oct 2019 10:59:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Message-ID: <20191029135936.GD6128@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-14-jgg@ziepe.ca>
 <bc44f331-5448-ddc0-ecc3-d0ccb92e11a4@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc44f331-5448-ddc0-ecc3-d0ccb92e11a4@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert
 instead of hmm_mirror
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
Cc: Juergen Gross <jgross@suse.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2019 at 07:51:30AM +0000, Koenig, Christian wrote:
> > +static bool amdgpu_mn_invalidate_gfx(struct mmu_range_notifier *mrn,
> > +				     const struct mmu_notifier_range *range)
> >   {
> > -	struct amdgpu_bo *bo;
> > +	struct amdgpu_bo *bo = container_of(mrn, struct amdgpu_bo, notifier);
> > +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> >   	long r;
> >   
> > -	list_for_each_entry(bo, &node->bos, mn_list) {
> > -
> > -		if (!amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm, start, end))
> > -			continue;
> > -
> > -		r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv,
> > -			true, false, MAX_SCHEDULE_TIMEOUT);
> > -		if (r <= 0)
> > -			DRM_ERROR("(%ld) failed to wait for user bo\n", r);
> > -	}
> > +	/* FIXME: Is this necessary? */
> 
> Most likely not.
> 
> Christian.
> 
> > +	if (!amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm, range->start,
> > +					  range->end))
> > +		return true;

So is the bo->tbo.mem.num_pages == bo->tbo.ttm.num_pages always?

And userptr can't be zero here, or at least it doesn't matter if it is?

> > +static bool amdgpu_mn_invalidate_hsa(struct mmu_range_notifier *mrn,
> > +				     const struct mmu_notifier_range *range)
> >   {
> > -	struct amdgpu_mn *amn = container_of(mirror, struct amdgpu_mn, mirror);
> > -	unsigned long start = update->start;
> > -	unsigned long end = update->end;
> > -	bool blockable = mmu_notifier_range_blockable(update);
> > -	struct interval_tree_node *it;
> > -
> > -	/* notification is exclusive, but interval is inclusive */
> > -	end -= 1;
> > -
> > -	/* TODO we should be able to split locking for interval tree and
> > -	 * amdgpu_mn_invalidate_node
> > -	 */
> > -	if (amdgpu_mn_read_lock(amn, blockable))
> > -		return -EAGAIN;
> > -
> > -	it = interval_tree_iter_first(&amn->objects, start, end);
> > -	while (it) {
> > -		struct amdgpu_mn_node *node;
> > -
> > -		if (!blockable) {
> > -			amdgpu_mn_read_unlock(amn);
> > -			return -EAGAIN;
> > -		}
> > +	struct amdgpu_bo *bo = container_of(mrn, struct amdgpu_bo, notifier);
> > +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> >   
> > -		node = container_of(it, struct amdgpu_mn_node, it);
> > -		it = interval_tree_iter_next(it, start, end);
> > +	/* FIXME: Is this necessary? */
> > +	if (!amdgpu_ttm_tt_affect_userptr(bo->tbo.ttm, range->start,
> > +					  range->end))
> > +		return true;
> >   
> > -		amdgpu_mn_invalidate_node(node, start, end);
> > -	}

This one too right?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
