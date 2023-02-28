Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE26A50FF
	for <lists+nouveau@lfdr.de>; Tue, 28 Feb 2023 03:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F9B10E2C9;
	Tue, 28 Feb 2023 02:17:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D5610E2C9
 for <nouveau@lists.freedesktop.org>; Tue, 28 Feb 2023 02:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677550643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L1Mb2daXfEUQHvXVW4hyDc03Jb2/hD1w1K+XnRGqyVE=;
 b=hOdR6h1VRk22MNsAfJQdRdediUGgYeJVNpSvw9PPsZCL9XhCJYLUaov4TTUO8EuysfTRHw
 H3yKHZGzqenxUwSRd4ScqcWft8KpSctGG1wfmsXYbmb95QyiAMcXIjSqyPmOO3eXBT11L9
 X0XOt8nOYry/QCO0q7n1727GecNO9RE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-N-emhOLKMDGCVPA206IJyQ-1; Mon, 27 Feb 2023 21:17:21 -0500
X-MC-Unique: N-emhOLKMDGCVPA206IJyQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so11511733edb.12
 for <nouveau@lists.freedesktop.org>; Mon, 27 Feb 2023 18:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:to
 :from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaG8/Bg6dhlDDPoj6nBl4VpMZT/wui8WldswSe4hBs4=;
 b=em/vGdBxRG3gXryilZraAu6ELwxhtIaC/VOAndzh3q2RUjyWRSj2+NAGxkM/7ZlB9W
 s2sLhi4Fbox3uAuFea4nF25xI40S2jsaXG8zi2cP7FXWG1RoInYhdRDxPW3WFq4Ben+S
 z6Sew51R3jYnaSggxaEBgSaI3Z3Xgo2x+ONLNubMabjo5v/whqCBJZUvJq3vS/2gNGKf
 ijMBkc+BnbODiiXUgReSAfxykll8kL4yPVvGRWzs1/loJ0y6wf4u9VF4fZr67uqEXj0g
 miOc/Jnn3N4Vt6vphMyLah0OmAKzMt0pqw0Ruup6kqBGnxsMtlARwhTj8NLR9bMlBUmz
 wm/g==
X-Gm-Message-State: AO0yUKW7vA3RiYl0+XQPrQc9a5Dn5m4aixBZ1TgeS7Y32SB9rLe1o+fc
 6obCk57I/gHx917nUXTIkbWlD2MBVebAIchRDhaveE7XWG/z6QPDvaCwECmlag3RUxbiz9nWmKt
 JQbiJr1XNfG0igZLQ5hKXUF+SAw==
X-Received: by 2002:a17:906:714e:b0:8b2:8876:6a3c with SMTP id
 z14-20020a170906714e00b008b288766a3cmr878944ejj.29.1677550640021; 
 Mon, 27 Feb 2023 18:17:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9tTXKhn1koDlG1F1zP1IAfope6sN3htqLi1+Nr+TLZ9X3jnhKZaiB/RADncuz0n/Vy80QyHA==
X-Received: by 2002:a17:906:714e:b0:8b2:8876:6a3c with SMTP id
 z14-20020a170906714e00b008b288766a3cmr878917ejj.29.1677550639717; 
 Mon, 27 Feb 2023 18:17:19 -0800 (PST)
Received: from WINDOWS. ([2a02:810d:4b3f:de78:41c:160e:6481:ed36])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170906501100b008b17aa6afc8sm3927141ejj.30.2023.02.27.18.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 18:17:18 -0800 (PST)
Message-ID: <63fd642e.170a0220.f67f6.e248@mx.google.com>
X-Google-Original-Message-ID: <Y/1kK5mjGoovZ8dU@WINDOWS.>
Date: Tue, 28 Feb 2023 03:17:15 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
MIME-Version: 1.0
In-Reply-To: <20230221182050.day6z5ge2e3dxerv@revolver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="xgWBGL0J166I1n9/"
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH drm-next v2 05/16] drm: manager to keep track
 of GPUs VA mappings
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

--xgWBGL0J166I1n9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 01:20:50PM -0500, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
> > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > with a decicated VA space manager implementation.
> > 
> > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > start implementing, allow userspace applications to request multiple and
> > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > intended to serve the following purposes in this context.
> > 
> > 1) Provide infrastructure to track GPU VA allocations and mappings,
> >    making use of the maple_tree.
> > 
> > 2) Generically connect GPU VA mappings to their backing buffers, in
> >    particular DRM GEM objects.
> > 
> > 3) Provide a common implementation to perform more complex mapping
> >    operations on the GPU VA space. In particular splitting and merging
> >    of GPU VA mappings, e.g. for intersecting mapping requests or partial
> >    unmap requests.
> > 
> > Suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  Documentation/gpu/drm-mm.rst    |   31 +
> >  drivers/gpu/drm/Makefile        |    1 +
> >  drivers/gpu/drm/drm_gem.c       |    3 +
> >  drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
> >  include/drm/drm_drv.h           |    6 +
> >  include/drm/drm_gem.h           |   75 ++
> >  include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
> >  7 files changed, 2534 insertions(+)
> >  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >  create mode 100644 include/drm/drm_gpuva_mgr.h
> > 
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index a52e6f4117d6..c9f120cfe730 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
> >  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
> >     :export:
> >  
> ...
> 
> > +
> > +/**
> > + * drm_gpuva_remove_iter - removes the iterators current element
> > + * @it: the &drm_gpuva_iterator
> > + *
> > + * This removes the element the iterator currently points to.
> > + */
> > +void
> > +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> > +{
> > +	mas_erase(&it->mas);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> > +
> > +/**
> > + * drm_gpuva_insert - insert a &drm_gpuva
> > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @va: the &drm_gpuva to insert
> > + * @addr: the start address of the GPU VA
> > + * @range: the range of the GPU VA
> > + *
> > + * Insert a &drm_gpuva with a given address and range into a
> > + * &drm_gpuva_manager.
> > + *
> > + * Returns: 0 on success, negative error code on failure.
> > + */
> > +int
> > +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +		 struct drm_gpuva *va)
> > +{
> > +	u64 addr = va->va.addr;
> > +	u64 range = va->va.range;
> > +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
> > +	struct drm_gpuva_region *reg = NULL;
> > +	int ret;
> > +
> > +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
> > +		reg = drm_gpuva_in_region(mgr, addr, range);
> > +		if (unlikely(!reg))
> > +			return -EINVAL;
> > +	}
> > +
> 
> -----
> 
> > +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
> > +		return -EEXIST;
> > +
> > +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 
> mas_walk() will set the internal maple state to the limits to what it
> finds.  So, instead of an iterator, you can use the walk function and
> ensure there is a large enough area in the existing NULL:
> 
> /*
>  * Nothing at addr, mas now points to the location where the store would
>  * happen
>  */
> if (mas_walk(&mas))
> 	return -EEXIST;
> 

For some reason mas_walk() finds an entry and hence this function returns
-EEXIST for the following sequence of insertions.

A = [0xc0000 - 0xfffff]
B = [0x0 - 0xbffff]

Interestingly, inserting B before A works fine.

I attached a test module that reproduces the issue. I hope its just a stupid
mistake I just can't spot though.

> /* The NULL entry ends at mas.last, make sure there is room */
> if (mas.last < (addr + range - 1))
> 	return -EEXIST;
> 
> /* Limit the store size to the correct end address, and store */
>  mas.last = addr + range - 1;
>  ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 

--xgWBGL0J166I1n9/
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="maple.c"

/* SPDX-License-Identifier: GPL-2.0 */
#if 1
#include <linux/init.h>
#include <linux/ioctl.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/maple_tree.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/mutex.h>
#include <linux/printk.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <linux/types.h>
#endif

struct maple_tree mt;

struct va {
	u64 addr;
	u64 range;
};

static int va_store(struct va *va)
{
	void *entry = NULL;
	u64 addr = va->addr;
	u64 range = va->range;
	u64 last = addr + range - 1;
	MA_STATE(mas, &mt, addr, addr);
	int ret;

	mas_lock(&mas);

	if ((entry = mas_walk(&mas))) {
		pr_err("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last=%lx, entry=%px - exists\n",
		       addr, range, last, mas.index, mas.last, entry);
		ret = -EEXIST;
		goto err_unlock;
	}

	if (mas.last < last) {
		pr_err("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last%lx, va=%px - not enough space\n",
		       addr, range, last, mas.index, mas.last, va);
		ret = -EEXIST;
		goto err_unlock;
	}

	mas.last = last;
	ret = mas_store_gfp(&mas, &va, GFP_KERNEL);
	if (ret) {
		pr_err("mas_store_gfp() failed\n");
		goto err_unlock;
	}

	mas_unlock(&mas);

	pr_info("addr=%llx, range=%llx, last=%llx, mas.index=%lx, mas.last=%lx, va=%px - insert\n",
		addr, range, last, mas.index, mas.last, va);

	return 0;

err_unlock:
	mas_unlock(&mas);
	return ret;
}

static int __init maple_init(void)
{
	struct va kernel_node = { .addr = 0xc0000, .range = 0x40000 };
	struct va node = { .addr = 0x0, .range = 0xc0000 };

	mt_init(&mt);

	va_store(&kernel_node);
	va_store(&node);

	return 0;
}

static void __exit maple_exit(void)
{
	mtree_lock(&mt);
	__mt_destroy(&mt);
	mtree_unlock(&mt);
}

module_init(maple_init);
module_exit(maple_exit);

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Danilo Krummrich");
MODULE_DESCRIPTION("Maple Tree example.");
MODULE_VERSION("0.1");

--xgWBGL0J166I1n9/--

