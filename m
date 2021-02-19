Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBC31FA37
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 15:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74BF6EB3D;
	Fri, 19 Feb 2021 14:01:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426F6EB3B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 14:01:09 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id v3so3937739qtw.4
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
 b=I5flSyH/gLTP7kfpLHlSgh5tXtA+Jh1EsK+6uIgyy09vUXp0IZUoyofNXle2UG8+9x
 6bQcZMjTHGSnCjsIADBeVZNPoafr3TSU4gbVUKm8tx7gxct5TAh1oqibAjgx2ny24Qlv
 nA8b7dO5wJoNvKGJUaq5YdpKB1knNz20AuCjHXqPKjX/HXDnk9GUA8KprUxsiW5TqfOU
 9o+5AHrQgpJl5wOCAeVJMcNlnBgpfbhD2hv2/vQ80bpHkUbm4gdpFUasgTAZI9JejzbF
 hWMAig8ep9wZI5JeASo7p/0n5GOB7qV6LVTspTVmRmVoA3TvIzBilhfwzcUDD73XF8lP
 SRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
 b=RJzEno2C1Vx14iFqPJhvnmVnYPt/5WJi6C6ikxxC9fLnuuAvAvvM3VXhcZdlJbdogH
 Pmg+i9y+azt7E9BZUTEADTDZBAKoaxPuTcextcqEKkIT/EASoS44gZ+9sk0UL6l5A7Q2
 Pl+coOdFZRqJ4bhxCQ0k9Yf3BEcYNOqkpLzMYaxfCSqy6wt7JYcO4ihcEA2nP3adsU15
 UuuESBr/aHXIe6xbyVROpEb23Z+Y6M1sHddwzN4eyg9kx//ChaeZMMV+eamjJA3I6xir
 G085VFPEJyICgkF+BHmGpD1qVNdbED4VM3kCfs21gm+aMZiFc3RFMMgXIoJ0qqWqW+6E
 jVbQ==
X-Gm-Message-State: AOAM532+wE7KM7SiX0k6LCjMnZ3nTSuTLr4MIkx4wxGxzZB5D5GmkpuM
 2xigheXuVYDLoH02mIffBRjOWg==
X-Google-Smtp-Source: ABdhPJwvDnWgEME/UBp5mpDqS0tmSE99XXBjYe+mDgcmjGaB5orYQxdcs7Ze95f3nVqD5XVW9Zc5qg==
X-Received: by 2002:a05:622a:306:: with SMTP id
 q6mr8969998qtw.15.1613743266418; 
 Fri, 19 Feb 2021 06:01:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id 14sm5338161qtx.84.2021.02.19.06.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:01:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lD6LB-00CPnQ-2t; Fri, 19 Feb 2021 10:01:05 -0400
Date: Fri, 19 Feb 2021 10:01:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210219140105.GE2643399@ziepe.ca>
References: <20210219020750.16444-1-apopple@nvidia.com>
 <20210219020750.16444-2-apopple@nvidia.com>
 <20210219094741.GA641389@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219094741.GA641389@infradead.org>
Subject: Re: [Nouveau] [PATCH v2 1/4] hmm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org, bskeggs@redhat.com,
 daniel@ffwll.ch, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 09:47:41AM +0000, Christoph Hellwig wrote:

> > diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> > index 866a0fa104c4..5d28ff6d4d80 100644
> > +++ b/include/linux/hmm.h
> > @@ -109,6 +109,10 @@ struct hmm_range {
> >   */
> >  int hmm_range_fault(struct hmm_range *range);
> >  
> > +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +			unsigned long end, struct page **pages);
> > +vm_fault_t hmm_remove_exclusive_entry(struct vm_fault *vmf);
> 
> Can we avoid the hmm naming for new code (we should probably also kill
> it off for the existing code)?

Yes please, I'd prefer it if hmm.c was just the special page walker
and not a grab bag of unrelated things

Is there is a more natural place to put this in the mm for this idea?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
