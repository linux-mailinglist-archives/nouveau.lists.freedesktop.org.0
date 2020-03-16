Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F351873BE
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 20:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546A78982D;
	Mon, 16 Mar 2020 19:59:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFBA6E4C7
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 19:59:25 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d22so15430485qtn.0
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EAEH/7t5ubtIMhw4ZTeVgjQSlcx5QOWTPoLF4PtWhvw=;
 b=RmOqUe+R4l5H6YpqEib1W4LfA1h1/OZym/f9ehFr0qPoTlxgBeLu6AJhJEmNnQN1Dj
 VE0p9XlPU1CSB+PhFNJXeVAL1LDo4nVZlApvnbIOxbw+r/nV9Gg6fFNKzOdwP2Rv+Tcn
 jO4CyQOKGxDjCENXESz3JqP8SloGlWtsxFs4A+S9T2ZlNyxyjePg81CckrADJ18xntlN
 aHclWcT2nw64C3P/y74znOjO+t0uMLoSAJuwol49hiClFZErw7yVlf364WCNiDmO2nJm
 W+hBIi0t5YKyy6lPGMloSf+ZExCMZJ+fh4fYcxzQVhaJT+DK5PvzuCPkceNPvN3cAj8p
 AGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EAEH/7t5ubtIMhw4ZTeVgjQSlcx5QOWTPoLF4PtWhvw=;
 b=qztf/3bCfc3zB/uSt214FWbcF7KTcBmoCeHQH5yB07fBePQNMz7m+pcNkLKxoxOcui
 EnTEfdeGfhb5lh7nOdDBxtA8wwRC1nO9eglWnGbpp3/ay1qx87ZOQfMScwG7oT+FvURN
 pq+NKNDPuLKxCOASqgg/pawWeywO7t8tgRqfpSPLYp2B1QbiFW0Ogp5o0Wcduc83uxQF
 dgiZGZDzr+xjJvYurNGzdn29CpC0PV3IgiaVcMWPWER+uDhYDs/ssH4yNWdz9jZmfJqw
 SVQr0qppnqJpV6E9GU9fNl3GNwY8l2g1QD0RzCcTl6IbVKZbEU+3RrE2kWl0z7gsEGID
 YzKA==
X-Gm-Message-State: ANhLgQ3SNLfNiRmMamMFLQJjg3akE4YJWE2dHyyW/3gsrYun6SHPJw0+
 dRKR/v6NvXB6krpnf47d3HTsNQ==
X-Google-Smtp-Source: ADFU+vtbRUKVYcUI2Gq+ZWCB4v8nheFcrqCqLhbHdThlbs4ZekZNUobGzi4WVSGLSw/oM8Fkr1QlJA==
X-Received: by 2002:ac8:7396:: with SMTP id t22mr1961185qtp.182.1584388764690; 
 Mon, 16 Mar 2020 12:59:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x22sm488565qki.54.2020.03.16.12.59.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 12:59:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDvtT-00078y-K3; Mon, 16 Mar 2020 16:59:23 -0300
Date: Mon, 16 Mar 2020 16:59:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200316195923.GA26988@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-4-hch@lst.de>
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
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 08:32:15PM +0100, Christoph Hellwig wrote:
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 180e398170b0..cfad65f6a67b 100644
> +++ b/mm/hmm.c
> @@ -118,15 +118,6 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
>  	/* We aren't ask to do anything ... */
>  	if (!(pfns & range->flags[HMM_PFN_VALID]))
>  		return;
> -	/* If this is device memory then only fault if explicitly requested */
> -	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -		/* Do we fault on device memory ? */
> -		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
> -			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
> -			*fault = true;
> -		}
> -		return;
> -	}

Yes, this is an elegant solution to the input flags.

However, between patch 3 and 4 doesn't this break amd gpu as it will
return device_private pages now if not requested? Squash the two?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
