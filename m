Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849512B333
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881C6E419;
	Fri, 27 Dec 2019 08:14:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5746F853
 for <nouveau@lists.freedesktop.org>; Fri,  1 Nov 2019 18:26:14 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u22so14047777qtq.13
 for <nouveau@lists.freedesktop.org>; Fri, 01 Nov 2019 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gf48vjpUJOI371bNO6wuyPSeEKQoVC5o/vcfCQf27GI=;
 b=JWQs9dhnB75sOXYZXe00Sx8Ycjn6wXVLJb4bA4loebrzhAwONRCd3M5hdaM0XcPXz1
 0pyWtlLrDj1njuvPs0zQ0ulMeEyYu9AvLupxmw9YV4Vil+0G3KASfmA7bMmkBjsVbLm0
 NwKPrT73FZLPw9yxM2LsvyNjyyW57QaAakB9IZRdrjquWCFH5qzR698e9e1ojGeAZOIU
 KBToGNUChheA/LNzlqzqO22UYmvZ00/yxcgviEIwglK7aIkeobtD5FAioyP3loLN1pgO
 xAWVbCdTVv2/yYYX7qXzDiZnl3pkn6y+wuJtS5dp5Cn2pGV9z3geaSwd6yE4+Biq0CTg
 qgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gf48vjpUJOI371bNO6wuyPSeEKQoVC5o/vcfCQf27GI=;
 b=oLyyYlSbiGcGRBMdnLvt1YCIqJkWiYs9FVgkfTwwa/wRKGwFsnRmzcXKi2RJef1Tl+
 2Li7WNyDPOprH6dJIt2Zfe4rLgvzRtjzQpGAi66IJIRSovVhlUzZ3hCaMm8zgP1Bh1nd
 1hH0HCa27bbdvEfVF0kStar/V3+xPNZ8ThbeHY0P67YZAksR9xneTWjnLDR2zxIicRoh
 ZQvnYzEbQiqEnQD5/z8KdkPR6opV+nrw2Qd9qOEMpii3a0mM1yZ2jrMvGOcrZO5FPLsa
 PKurRUlqtUUgaMXa+f1uzrJ+qMuSQZi1o4eY0RSpGwDXTeh/3MXvX9sGDXQbb7sI+GOC
 sPvA==
X-Gm-Message-State: APjAAAWcR7WlQhjUO30KcB0petkGAR9hjFQnyo4WoclXxGzwS+ZYop6o
 /9UPLn9eq733rcVPGpFGRrkqnA==
X-Google-Smtp-Source: APXvYqxlEpFiUQP9ickqdfrdsM0skeumHMpJp062tTi17mtiKR8bSsZEkpehUJ8EZgMrejKnz1agZQ==
X-Received: by 2002:a0c:8884:: with SMTP id 4mr11433684qvn.248.1572632773480; 
 Fri, 01 Nov 2019 11:26:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id x10sm5932634qtj.25.2019.11.01.11.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 11:26:12 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQbci-0008HC-0J; Fri, 01 Nov 2019 15:26:12 -0300
Date: Fri, 1 Nov 2019 15:26:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Message-ID: <20191101182611.GA31478@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-9-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028201032.6352-9-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 28, 2019 at 05:10:25PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> DMA_SHARED_BUFFER can not be enabled by the user (it represents a library
> set in the kernel). The kconfig convention is to use select for such
> symbols so they are turned on implicitly when the user enables a kconfig
> that needs them.
> 
> Otherwise the XEN_GNTDEV_DMABUF kconfig is overly difficult to enable.
> 
> Fixes: 932d6562179e ("xen/gntdev: Add initial support for dma-buf UAPI")
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>  drivers/xen/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Juergen/Oleksandr/Xen Maintainers:

Would you take this patch through a xen related tree? The only reason
I had in this series is to make it easier to compile-test the gntdev
changes.

Since it is looking like the gntdev rework might not make it this
cycle it is probably best for you to take it.

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
