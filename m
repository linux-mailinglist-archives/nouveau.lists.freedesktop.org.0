Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079A2794ED
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6ED6ED79;
	Fri, 25 Sep 2020 23:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2DD6E096
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 18:46:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c18so4724207wrm.9
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
 b=hNVaqgoiF4i4BUKziRlpXfyKzDqaE2Y0RasEA7QnYZaUqmrhYmxmR65VR3QsZGT0/N
 elfdI2ZtE21gOt8NsKBS76ANRONmfTntZIUBb37OAepaErQ4mHfX26H/avNX5Om2F5Th
 iF/y4L9RdXJwUeLTzBdv6H/xNDzBbfk+2GMdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
 b=pAxCCR5Wnz0/SPZVey2rHfw86pMBtjU2CadUFba0Tf8Muwwcvi2gjaE/YWkEOdx5xm
 NpGfjpy6rC6YKVPjaw20rpUq8/AI8Tl5Ls2eULSAPfj1PqBWLNdty2NbCXFBjkAs8fyk
 Oo+U6+Q7Sb/NZZAQbNcOajLJVVdsmnlKx9q/1/6JpTSmvPj1HzLK5BmvlPYtfuYVsTZg
 Uku4qmN/Jz6b2xyW+yYchR1XLDNc/75Kc5OpFYD6U2lGNZbHVTzhRRbZJNOp0I+fCxKk
 j+jNpt9cK72EYBKdS9EoaZBwLJ3UqK9Wn+arS3AxkIsPzejTBC8BpEAFwHF1kFaM6+vb
 VB1A==
X-Gm-Message-State: AOAM53309nXfFfumkp/jlanWkg9wOOwIw5zAfujDCD0PXOqNVq+pdrJm
 5b6MHO0uMSMDQcE391I7MMZ+Ag==
X-Google-Smtp-Source: ABdhPJywG75RJx/fVTLzqgivIcRb/Gp708YyNw5VwVyHEf689ET8en+rXMvfgfeOwhu5XQytInH4aQ==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr5730549wrw.261.1601059584552; 
 Fri, 25 Sep 2020 11:46:24 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id z8sm3728264wrl.11.2020.09.25.11.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 11:46:23 -0700 (PDT)
Date: Fri, 25 Sep 2020 18:46:22 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200925184622.GB3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-18-hch@lst.de>
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: Re: [Nouveau] [PATCH 17/18] dma-iommu: implement ->alloc_noncoherent
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:21PM +0200, Christoph Hellwig wrote:
> Implement the alloc_noncoherent method to provide memory that is neither
> coherent not contiguous.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/dma-iommu.c | 41 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 

Sorry for being late to the party and thanks a lot for the patch. Please see my
comments inline.

[snip]
> @@ -1052,6 +1055,34 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>  	return cpu_addr;
>  }
>  
> +#ifdef CONFIG_DMA_REMAP
> +static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
> +		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	if (!gfpflags_allow_blocking(gfp)) {
> +		struct page *page;
> +
> +		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
> +		if (!page)
> +			return NULL;
> +		return page_address(page);
> +	}
> +
> +	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
> +				     PAGE_KERNEL, 0);

iommu_dma_alloc_remap() makes use of the DMA_ATTR_ALLOC_SINGLE_PAGES attribute
to optimize the allocations for devices which don't care about how contiguous
the backing memory is. Do you think we could add an attrs argument to this
function and pass it there?

As ARM is being moved to the common iommu-dma layer as well, we'll probably
make use of the argument to support the DMA_ATTR_NO_KERNEL_MAPPING attribute to
conserve the vmalloc area.

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
