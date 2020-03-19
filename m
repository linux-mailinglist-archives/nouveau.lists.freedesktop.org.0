Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33318A9C3
	for <lists+nouveau@lfdr.de>; Thu, 19 Mar 2020 01:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E26E9A2;
	Thu, 19 Mar 2020 00:28:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7376E9A2
 for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2020 00:28:51 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id a10so113523qvq.8
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 17:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DIzPGl46tibPTC4Nr1Fne3idEkZVxe0vRVzC9BmYyk8=;
 b=a9OAhtzpaqy8M7ZOiBkM5EuSVHd4yNecpRtC8dRP+l2pPqyfnSd8K92zu0TfGABk1Q
 hYEfZ+7acI2k/zKRdQldlZU6QmFtX2HRogB/BKnbdEtsKAhQeU6fd+MnUlz8ghM8TEw4
 4FSfDydFj/Zz5Td34FIN8pCf7ZG9IBYZHl9AGTNXWI1pvNTxE9cBf86JQxD+vBXs5Fu+
 P3YN0S0cijWwxtWJa0nTOxVZ/FIsv/TFStTBQI0wKucqAubr3tyWjsrl2pHJSEDRw/1M
 2hLIJPL3HFVUmwFiwQrI21J4bRRmujEiUZiEYQWN4CJhod6KqfASdjQsItMOv/RwHOO/
 50tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DIzPGl46tibPTC4Nr1Fne3idEkZVxe0vRVzC9BmYyk8=;
 b=UHVjopM4vZMfSa+H1IkXPd/6O0dvSxC2s7lP1eEPHwR/6QIR1t1ab1N6q/6IYKA9Tk
 mv2Uy/uR9pbsM8scxx2FD7xw1Gc9yI1BPaDu7M4PXox3gxJSdvSo5ZTXlQ0doUoQpbq9
 Lk72tMfs1pC+X1u9bvoSZ8iJuq4MaAnqeQxEaR7uFVSiYLBB1+eSd3kB4dwqm+pwEjYZ
 mj7Z9IyZlWz5XIBV6TGTVqeehKyWrLQOWdTIqxrLQKj+IT53T8I3E7zQiH/5JK1f71CN
 T3ESf+H7NGmrVzVk6gfxWXNtjU2JPp/TAnwYPBed43CwEfLyGg4gjIUhpwkCj15Ay+qy
 FMRA==
X-Gm-Message-State: ANhLgQ2aRCdUep+5uCw9sRlxG1YDaH5rdHAe1gE8y1mJJuGQOwOU9N9l
 Ee5eMQvLlFH02FoG3moVNii01g==
X-Google-Smtp-Source: ADFU+vvSjLkx34MB68Vj6dW6PS73cWO5A0gn+n/cmS/y+KLQ6+BjGr0q6lYXU7A7Xm/H0ApV84kRRw==
X-Received: by 2002:a0c:e7c3:: with SMTP id c3mr620345qvo.62.1584577730703;
 Wed, 18 Mar 2020 17:28:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u123sm433965qkf.77.2020.03.18.17.28.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Mar 2020 17:28:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEj3J-000273-Ln; Wed, 18 Mar 2020 21:28:49 -0300
Date: Wed, 18 Mar 2020 21:28:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200319002849.GG20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] ensure device private pages have an owner v2
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

On Mon, Mar 16, 2020 at 08:32:12PM +0100, Christoph Hellwig wrote:
> When acting on device private mappings a driver needs to know if the
> device (or other entity in case of kvmppc) actually owns this private
> mapping.  This series adds an owner field and converts the migrate_vma
> code over to check it.  I looked into doing the same for
> hmm_range_fault, but as far as I can tell that code has never been
> wired up to actually work for device private memory, so instead of
> trying to fix some unused code the second patch just remove the code.
> We can add it back once we have a working and fully tested code, and
> then should pass the expected owner in the hmm_range structure.
> 
> Changes since v1:
>  - split out the pgmap->owner addition into a separate patch
>  - check pgmap->owner is set for device private mappings
>  - rename the dev_private_owner field in struct migrate_vma to src_owner
>  - refuse to migrate private pages if src_owner is not set
>  - keep the non-fault device private handling in hmm_range_fault

I'm happy enough to take this, did you have plans for a v3?

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
