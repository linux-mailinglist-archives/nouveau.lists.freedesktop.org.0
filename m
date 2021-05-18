Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5224387EAA
	for <lists+nouveau@lfdr.de>; Tue, 18 May 2021 19:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581866EC55;
	Tue, 18 May 2021 17:44:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683A6EB84
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621347432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
 b=i12pKO1RKYDjcrP3hmNwAffhNhCxRoYhRDqQq6jXj0bG5DZuap+fL43ViQF1jOwn/RIlwI
 9Nd+w60Gil0uHf7qOB67RlGOpp4mcVkM75zxHEVuvKmc4NZ1RsiIVQdM2PcJBgfvQ9gLe7
 XjEpexGFx0ZydG3eA+wPQSK/pjG+DjE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-SVF_3yklNGCmoWCj7OeFug-1; Tue, 18 May 2021 10:17:09 -0400
X-MC-Unique: SVF_3yklNGCmoWCj7OeFug-1
Received: by mail-qv1-f70.google.com with SMTP id
 a18-20020a0cca920000b02901d3c6996bb7so7408754qvk.6
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
 b=jy97CL7KmgJlW9Det/qGpNW94nQYDxIZ7wZ1dPM54fwIo3az2YUX7c7Hw+Hf8AmyNe
 ufaexMBB4bAIhksZfC7jBcX0jrkmrCpFcLRb1jXez78K7a18qEGdLzYk7JWVMZsYESLg
 iec+Vk2ou4fKf7lc7XwhzoLfYF+ciK8yOqL78Eo9RCCy1JwVE/KWFp/DP8N08dX/Tnr2
 U3q+beZs7nxYRe/SB8vIa45DPSJuYFaKYbuvRmYPDAU8RM36huWHW0Q11mnfk30F5+oy
 TklOiFjeZFTTF7W4HBCusilN+Bw+73QgozXPxVavsSoJJAetOvuFJk+TXbSjnGV8EQr+
 zTVA==
X-Gm-Message-State: AOAM5328tiEdDefMQiisYev5aHeesXaF1KKBt7LkELokzASdsllAknEw
 O2D/pGfRgyJ4kqdLW9tSc+j55fZZkVEtpLRbDRQ9ClxttDK7ONndpDDyLRMg1eIXS83ZH4+HtEY
 FyLMdPtB6mLYWgmYYDHFbRCF+sA==
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567977qke.83.1621347429187; 
 Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNwMG50chJ/VK9YBnzgEPGUA+fkxk4jQnSOcxrE0QnRfHFDXo6jlaBwydyt2CUYa9cICfbkQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567929qke.83.1621347428799; 
 Tue, 18 May 2021 07:17:08 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id a23sm12742012qtd.60.2021.05.18.07.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:17:07 -0700 (PDT)
Date: Tue, 18 May 2021 10:17:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKPMYuh06R2DXPHS@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com>
 <YKMjvKGIHdwQN2Ml@t490s> <2009782.faHf7sVjGQ@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2009782.faHf7sVjGQ@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 18 May 2021 17:44:54 +0000
Subject: Re: [Nouveau] [PATCH v8 1/8] mm: Remove special swap entry functions
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 bsingharora@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 09:58:09PM +1000, Alistair Popple wrote:
> On Tuesday, 18 May 2021 12:17:32 PM AEST Peter Xu wrote:
> > On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> > > +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> > > +{
> > > +     struct page *p = pfn_to_page(swp_offset(entry));
> > > +
> > > +     /*
> > > +      * Any use of migration entries may only occur while the
> > > +      * corresponding page is locked
> > > +      */
> > > +     BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> > > +
> > > +     return p;
> > > +}
> > 
> > Would swap_pfn_entry_to_page() be slightly better?
> > 
> > The thing is it's very easy to read pfn_*() as a function to take a pfn as
> > parameter...
> > 
> > Since I'm also recently working on some swap-related new ptes [1], I'm
> > thinking whether we could name these swap entries as "swap XXX entries". 
> > Say, "swap hwpoison entry", "swap pfn entry" (which is a superset of "swap
> > migration entry", "swap device exclusive entry", ...).  That's where I came
> > with the above swap_pfn_entry_to_page(), then below will be naturally
> > is_swap_pfn_entry().
> 
> Equally though "hwpoison swap entry", "pfn swap entry", "migration swap 
> entry", etc. also makes sense (at least to me), but does that not fit in as 
> well with your series? I haven't looked too deeply at your series but have 
> been meaning to so thanks for the pointer.

Yeah it looks good too.  It's just to avoid starting with "pfn_" I guess, so at
least we know that's something related to swap not one specific pfn.

I found the naming is important as e.g. in my series I introduced another idea
called "swap special pte" or "special swap pte" (yeah so indeed my naming is
not that coherent as well... :), then I noticed if without a good naming I'm
afraid we can get lost easier.

I have a description here in the commit message re the new swap special pte:

https://lore.kernel.org/lkml/20210427161317.50682-5-peterx@redhat.com/

In which the uffd-wp marker pte will be the first swap special pte.  Feel free
to ignore the details too, just want to mention some context, while it should
be orthogonal to this series.

I think yet-another swap entry suites for my case too but it'll be a waste as
in that pte I don't need to keep pfn information, but only a marker (one single
bit would suffice), so I chose one single pte value (one for each arch, I only
defined that on x86 in my series which is a special pte with only one bit set)
to not pollute the swap entry address spaces.

> 
> > No strong opinion as this is already a v8 series (and sorry to chim in this
> > late), just to raise this up.
> 
> No worries, it's good timing as I was about to send a v9 which was just a 
> rebase anyway. I am hoping to try and get this accepted for the next merge 
> window but I will wait before sending v9 to see if anyone else has thoughts on 
> the naming here.
> 
> I don't have a particularly strong opinion either, and your justification is 
> more thought than I gave to naming these originally so am happy to rename if 
> it's more readable or fits better with your series.

I'll leave the decision to you, especially in case you still prefer the old
naming.  Or feel free to wait too until someone else shares the thoughts so as
to avoid unnecessary rebase work.

Thanks,

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
