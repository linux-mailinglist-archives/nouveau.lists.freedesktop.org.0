Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5418CF29
	for <lists+nouveau@lfdr.de>; Fri, 20 Mar 2020 14:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB936EB3E;
	Fri, 20 Mar 2020 13:41:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD996EB40
 for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2020 13:41:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z12so4884228qtq.5
 for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2020 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rSXMnA8Bh+EyZeJfpwZeazUxxET567SafNKmRBbaqJE=;
 b=IRiBcy01pez/c8Esw6ABdeGlubYq6UBTvnqE08m54TPmYJSk0iZY8NRy4Imfi9RCkq
 pgYtuxDrHqPgjM1o0KyPLUcQQOMmsp/8AwWKrGmPWY2V2zTpecXI1Hmww1TRzifRUqv1
 DX4dzAVbSR13Fo7jjIz8YUYee5enxM6pJW/X6pJz59lxOjUg+6nvHnnEaT8pcTz55OMt
 jRul4tANsV8+/6/1gFaPw67m4l9Hc++lvsRpUhKs8JRwfn579xSKiU2xI9uEr0dnW7Fr
 mnPY+dq6nTjmuQ5ZDgFDKjScE6rkcwbkGcsH6sXXBgbbcYl+h27ZHv6LeQTB09f7WjYe
 iTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rSXMnA8Bh+EyZeJfpwZeazUxxET567SafNKmRBbaqJE=;
 b=Awcvr0hg2YdOXpVTptvh4FS8lLZsR+oT+9t5KK0lFZhqICwxoIUjRHtSQNBY3YaVPn
 0pXxXLCuwNavBie3DAWOuyvchQNTNnF+h2eGchp/cqIaSKHCcwKA7To3ZGDK01qqO6kg
 LapmMx4iuyAahKy17nJN3xyyMeSQYEkcuP+VnjtpIoM9aJJp4wzHNJvfXTYBkVUMcg8G
 7f9GRXCC2pqDJ3aZrfKk5Yde63YxwIGHU983gYJPlgo2jV5p0EmtfGSbLn2zcoaqFA34
 32/E8Eyslz0aRcTCPbQHgqGus+4WVFf7wcCAfdXIic+2TKGviEtuPWONBkx/oHXPX82p
 qLLA==
X-Gm-Message-State: ANhLgQ3KLl+lpnC5/4Sm0QyDv2qalTFVpROLo4I2HIRWMowOOQjxULYU
 EabGGBmR6CqZe+68BMaA8/9Xig==
X-Google-Smtp-Source: ADFU+vuEJLxLBoH+558rgkm+/X3kgiU5w6V/n0Oh7c+Ro7Jb1c7KonYggFNpdI58VU/1xg85hzcxdQ==
X-Received: by 2002:ac8:4782:: with SMTP id k2mr8138084qtq.1.1584711670687;
 Fri, 20 Mar 2020 06:41:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id p23sm4024398qkm.39.2020.03.20.06.41.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 06:41:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFHtd-0007xE-Gf; Fri, 20 Mar 2020 10:41:09 -0300
Date: Fri, 20 Mar 2020 10:41:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200320134109.GA30230@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-5-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 4/4] mm: check the device private page owner
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
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 08:32:16PM +0100, Christoph Hellwig wrote:
> diff --git a/mm/hmm.c b/mm/hmm.c
> index cfad65f6a67b..b75b3750e03d 100644
> +++ b/mm/hmm.c
> @@ -216,6 +216,14 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>  		unsigned long end, uint64_t *pfns, pmd_t pmd);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static inline bool hmm_is_device_private_entry(struct hmm_range *range,
> +		swp_entry_t entry)
> +{
> +	return is_device_private_entry(entry) &&
> +		device_private_entry_to_page(entry)->pgmap->owner ==
> +		range->dev_private_owner;
> +}

Thinking about this some more, does the locking work out here?

hmm_range_fault() runs with mmap_sem in read, and does not lock any of
the page table levels.

So it relies on accessing stale pte data being safe, and here we
introduce for the first time a page pointer dereference and a pgmap
dereference without any locking/refcounting.

The get_dev_pagemap() worked on the PFN and obtained a refcount, so it
created safety.

Is there some tricky reason this is safe, eg a DEVICE_PRIVATE page
cannot be removed from the vma without holding mmap_sem in write or
something?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
