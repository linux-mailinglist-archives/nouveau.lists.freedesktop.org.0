Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F223893C2
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0D26EE29;
	Wed, 19 May 2021 16:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114206E1CE
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621433077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
 b=ailDZ4T5yH9yzP/6nWW8SEhnrD3t5BI3WDTv1DRsPkeyuVKdVHqh0FFgEJGJHo5yM+RuHG
 6NY302fJ3dEFy7/N2ZzKjD1DDzM448teII4/BiNFGYZIEoNRMTUIpzgHoLX+DOX1rBsThF
 LF99FAjeGc01GXSTmJVkR8Y+FCWUqco=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-UpEAdZoAOPKyZft8naCkZA-1; Wed, 19 May 2021 10:04:34 -0400
X-MC-Unique: UpEAdZoAOPKyZft8naCkZA-1
Received: by mail-qt1-f198.google.com with SMTP id
 g13-20020ac8580d0000b02901e117526d0fso9905318qtg.5
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
 b=k/ME4V+CRQsquT9vt2lG8hn3ZrPfwsCEUK1vC1kmWg+2gE1mlTc5Ai3XeoqD3HrHrQ
 xvgQ0yi7WFzG33hXQs/MZoTpE0pQfo7seWPcRk8YMW+uRFgWLlTmOG7mojz7cbkEXX1V
 tfwlYEDC1xzaPFrRG6hib1cOeCkeO+z16DPQW9e93xzXHXJaYCNkIwXf6ZjMjaBklP7i
 sh7SJCmI+LnO7wsvd8PABHz1HaHk7Zz+kvqIB9twlRIgLXx0EbhQmlTCbM6Ajzh9B6wZ
 JACF6P4qf9YXa6n+p+8qAR2OkkyG0ob54v3d6W7LGZYvnNfym1j1folGNkW6hWDzIgV5
 XX5Q==
X-Gm-Message-State: AOAM530d28sK3w2LLmE8wLvw0F+BKHzuQlQUWr3Pi/exjofTtfljIelQ
 GJ26o4cfeJqsfBpQkU1QndXgIEBu9aOjbf/SxNlNAKRbpOSmdMyRID/G6SNhaPjHyslU9D53RwD
 43AFpgFw/PjlkSgJxeOzYXwpm6A==
X-Received: by 2002:a05:6214:d87:: with SMTP id
 e7mr13037365qve.53.1621433074135; 
 Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6J2iQWttFbTggjwn9zrUjjmVN+9VOim38VY5Z448bl6PpUs3xqQHJcSoYTLuhDbSvYY+iNA==
X-Received: by 2002:a05:6214:d87:: with SMTP id
 e7mr13037337qve.53.1621433073770; 
 Wed, 19 May 2021 07:04:33 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id b13sm802748qkl.16.2021.05.19.07.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:04:33 -0700 (PDT)
Date: Wed, 19 May 2021 10:04:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKUa8HZjfFW2Dhb1@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <2235357.HsqDk0zIjc@nvdebian> <YKUBbVuvm5FUJRMl@t490s>
 <2569629.VzlulnA7BY@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2569629.VzlulnA7BY@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 19 May 2021 16:29:11 +0000
Subject: Re: [Nouveau] [PATCH v8 5/8] mm: Device exclusive memory access
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
 bskeggs@redhat.com, Jason Gunthorpe <jgg@nvidia.com>,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 11:11:55PM +1000, Alistair Popple wrote:
> On Wednesday, 19 May 2021 10:15:41 PM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> > > Failing fork() because we couldn't take a lock doesn't seem like the right
> > > approach though, especially as there is already existing code that
> > > retries. I get this adds complexity though, so would be happy to take a
> > > look at cleaning copy_pte_range() up in future.
> > 
> > Yes, I proposed that as this one won't affect any existing applications
> > (unlike the existing ones) but only new userspace driver apps that will use
> > this new atomic feature.
> > 
> > IMHO it'll be a pity to add extra complexity and maintainance burden into
> > fork() if only for keeping the "logical correctness of fork()" however the
> > code never triggers. If we start with trylock we'll know whether people
> > will use it, since people will complain with a reason when needed; however
> > I still doubt whether a sane userspace device driver should fork() within
> > busy interaction with the device underneath..
> 
> I will refrain from commenting on the sanity or otherwise of doing that :-)
> 
> Agree such a scenario seems unlikely in practice (and possibly unreasonable). 
> Keeping the "logical correctness of fork()" still seems worthwhile to me, but 
> if the added complexity/maintenance burden for an admittedly fairly specific 
> feature is going to stop progress here I am happy to take the fail fork 
> approach. I could then possibly fix it up as a future clean up to 
> copy_pte_range(). Perhaps others have thoughts?

Yes, it's more about making this series easier to be accepted, and it'll be
great to have others' input.

Btw, just to mention that I don't even think fail fork() on failed trylock() is
against "logical correctness of fork()": IMHO it's still 100% correct just like
most syscalls can return with -EAGAIN, that suggests the userspace to try again
the syscall, and I hope that also works for fork().  I'd be more than glad to
be corrected too.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
