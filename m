Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D687439337C
	for <lists+nouveau@lfdr.de>; Thu, 27 May 2021 18:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD76F423;
	Thu, 27 May 2021 16:15:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D156E12D
 for <nouveau@lists.freedesktop.org>; Thu, 27 May 2021 01:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622079867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpnQjRLTYtvem4bmBp1ngvgaZaWU0A6eMfZva3aBJoc=;
 b=B5RO3BafCwdd5e/C/Vpai1TiK9oVxl7N85p58LNFZmyiYpB3wOBKScfaOlXzQY38yzO6zk
 QQUNjNueMVvgheq0bK6uocsAotVbB7ykN0boX5dJWSLyyExGZv2pn8EAdOriNdfKkgF01f
 rqXzYKmr0rie/Q4mjZTUWTWYd5bgl4s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-M7nm0GI4Nayze5QYFnzE9A-1; Wed, 26 May 2021 21:44:25 -0400
X-MC-Unique: M7nm0GI4Nayze5QYFnzE9A-1
Received: by mail-qv1-f70.google.com with SMTP id
 k12-20020a0cfd6c0000b029020df9543019so2739788qvs.14
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 18:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VpnQjRLTYtvem4bmBp1ngvgaZaWU0A6eMfZva3aBJoc=;
 b=CReL0SWkbAi5FmSO/s/g8E4siZnOfeWMRaZqnu4Kw50zi5m+eRQHkV+cSVw40gzjEK
 JkOt1DoCHAiaVdPBXf9vfPHNllWcNvOrw6+J/XD80m9sdccjssya3RPz/C3bc7xwMkCC
 s/TwN+hYAnRA+QnsHqMkAo+yTchqGtmAHKhY1gv6SHtINwn9YNw618ot0EJJPF5yy5A8
 PX+O+kVvcTG/lyC//q2eKrVA8QdTGKIlUH07cxEOw8tpADyqSi7mfxryGmGZ65hvVeOE
 2rxkKZQ3tkZRZppw6kAxU7pzS+fyQQaD/yzOdPmlppmWEt5egltlBppWto0joUSnBxL2
 lgVg==
X-Gm-Message-State: AOAM532s5XFCPCobeugktIdF7QHDaLjEGchFjsuEd636K/zOecPwIhW2
 taLCJmpDwkx+n72FAhoSIGfewgsBjkJEol7IOGBeHxoHqTCpmO8r98o297cgjBYtbmkgXYZDCg6
 NN33uJk2gojx6EKelJEjem4Oi1Q==
X-Received: by 2002:ac8:58c9:: with SMTP id u9mr1105864qta.58.1622079865059;
 Wed, 26 May 2021 18:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfR+dYiNTc8bzg8Cbe+4NPqyuhJDn00JrMrexnADTDq6kNzSW0QT/5/OWP1wZQyy97uuc2Sg==
X-Received: by 2002:ac8:58c9:: with SMTP id u9mr1105834qta.58.1622079864805;
 Wed, 26 May 2021 18:44:24 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y1sm498232qkp.21.2021.05.26.18.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 18:44:23 -0700 (PDT)
Date: Wed, 26 May 2021 21:44:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YK75dpdwU9AIKJ6i@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-7-apopple@nvidia.com>
 <YK6mbf967dV0ljHn@t490s> <2005328.bFqPmhE5MS@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2005328.bFqPmhE5MS@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 27 May 2021 16:15:56 +0000
Subject: Re: [Nouveau] [PATCH v9 06/10] mm/memory.c: Allow different return
 codes for copy_nonpresent_pte()
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 11:20:36AM +1000, Alistair Popple wrote:
> On Thursday, 27 May 2021 5:50:05 AM AEST Peter Xu wrote:
> > On Mon, May 24, 2021 at 11:27:21PM +1000, Alistair Popple wrote:
> > > Currently if copy_nonpresent_pte() returns a non-zero value it is
> > > assumed to be a swap entry which requires further processing outside the
> > > loop in copy_pte_range() after dropping locks. This prevents other
> > > values being returned to signal conditions such as failure which a
> > > subsequent change requires.
> > > 
> > > Instead make copy_nonpresent_pte() return an error code if further
> > > processing is required and read the value for the swap entry in the main
> > > loop under the ptl.
> > > 
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > 
> > > ---
> > > 
> > > v9:
> > > 
> > > New for v9 to allow device exclusive handling to occur in
> > > copy_nonpresent_pte().
> > > ---
> > > 
> > >  mm/memory.c | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 2fb455c365c2..e061cfa18c11 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct
> > > mm_struct *src_mm,> 
> > >       if (likely(!non_swap_entry(entry))) {
> > >       
> > >               if (swap_duplicate(entry) < 0)
> > > 
> > > -                     return entry.val;
> > > +                     return -EAGAIN;
> > > 
> > >               /* make sure dst_mm is on swapoff's mmlist. */
> > >               if (unlikely(list_empty(&dst_mm->mmlist))) {
> > > 
> > > @@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > > struct vm_area_struct *src_vma,> 
> > >                       continue;
> > >               
> > >               }
> > >               if (unlikely(!pte_present(*src_pte))) {
> > > 
> > > -                     entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> > > -                                                     dst_pte, src_pte,
> > > -                                                     src_vma, addr, rss);
> > > -                     if (entry.val)
> > > +                     ret = copy_nonpresent_pte(dst_mm, src_mm,
> > > +                                             dst_pte, src_pte,
> > > +                                             src_vma, addr, rss);
> > > +                     if (ret == -EAGAIN) {
> > > +                             entry = pte_to_swp_entry(*src_pte);
> > > 
> > >                               break;
> > > 
> > > +                     }
> > > 
> > >                       progress += 8;
> > >                       continue;
> > >               
> > >               }
> > 
> > Note that -EAGAIN was previously used by copy_present_page() for early cow
> > use.  Here later although we check entry.val first:
> > 
> >         if (entry.val) {
> >                 if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
> >                         ret = -ENOMEM;
> >                         goto out;
> >                 }
> >                 entry.val = 0;
> >         } else if (ret) {
> >                 WARN_ON_ONCE(ret != -EAGAIN);
> >                 prealloc = page_copy_prealloc(src_mm, src_vma, addr);
> >                 if (!prealloc)
> >                         return -ENOMEM;
> >                 /* We've captured and resolved the error. Reset, try again.
> > */ ret = 0;
> >         }
> > 
> > We didn't reset "ret" in entry.val case (maybe we should?). Then in the next
> > round of "goto again" if "ret" is unluckily untouched, it could reach the
> > 2nd if check, and I think it could cause an unexpected
> > page_copy_prealloc().
> 
> Thanks, I had considered that but saw "ret" was always set either by 
> copy_nonpresent_pte() or copy_present_pte(). However missed the "unlucky" case 
> at the start of the loop:
> 
> 	if (progress >= 32) {
> 		progress = 0;
> 		if (need_resched() ||
> 				spin_needbreak(src_ptl) || pin_needbreak(dst_ptl))
> 			break;
> 
> Looking at this again though checking different variables to figure out what 
> to do outside the locks and reusing error codes seems error prone. I reused -
> EAGAIN for copy_nonpresent_pte() simply because that seemed the most sensible 
> error code, but I don't think that aids readability and it might be better to 
> use a unique error code for each case needing extra handling.
> 
> So it might be better if I update this patch to:
> 1) Use unique error codes for each case requiring special handling outside the 
> lock.
> 2) Only check "ret" to determine what to do outside locks (ie. not entry.val)
> 3) Document these.
> 4) Always reset ret after handling.
> 
> Thoughts?

Looks good to me.  Thanks,

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
