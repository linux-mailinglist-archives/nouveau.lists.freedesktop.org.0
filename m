Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC83893C0
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D047E6EE27;
	Wed, 19 May 2021 16:29:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30556ED91
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621426546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
 b=iWJyJ2JzQRelZ805GCtdPoB9VQ1XEdIFM564RmmA7mx2ZGzJqSwzReDjGZYbV/b2mEll1M
 EWEOflN3vFnYnv+LNtdPgqnUgeQAmdbryad4yfCU6fCUY9bC7BpELXBFv9n0mkZJyVjMMT
 fKznwmsLn0Y2agTqb3v5v8170IhBbME=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-gcop4rCfNFy-wF9Kw3Iv3w-1; Wed, 19 May 2021 08:15:44 -0400
X-MC-Unique: gcop4rCfNFy-wF9Kw3Iv3w-1
Received: by mail-qv1-f69.google.com with SMTP id
 r11-20020a0cb28b0000b02901c87a178503so10112425qve.22
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
 b=FnEPvL1Iue9busYOotRsN9hWJbWhgkUcQvW/RP79YFe7Y5pmOJCxeg5tXgE+v2Kpzz
 MOFPlJXXfYYRLraqFZojYz1DBDXJOaBBR/B8oZwLKjzVbbTZ+eHOYaG+VaDzJl8oJl+/
 ua6kyHOaM6wndQWdonyjD1VndwOWOcoC+uZ3shsGvzDSqFVRnw1om9IKY32m7p7oJZ2N
 qpWce++4z2VPWSsrhjLef9dtRWFqvm1ufSfCULKpeiEyQsSUXXgDjJ9/mkOQLog649y+
 LY12XtUfT7Xod1+zAl9S7h3hXqkFGf5F6hmMg7mqlvuih87XHFjwMwZJ3wVnjWp2cW8r
 0lKw==
X-Gm-Message-State: AOAM531nK5uT9dU+Ty6uJDnKqhC1/C4hJrY0hC+g0i5WLEVeeOBL6kpf
 MNztiXTPd9UizpvCsc1XyU/Ca5LaUKsQDhwo2oxYrdr3DIDYco+1x1lNpO08kDbAfXyq2mNOGkt
 fTGpwYnDJApixxxEJ8um73lykLA==
X-Received: by 2002:a05:6214:20c4:: with SMTP id
 4mr13195003qve.38.1621426543765; 
 Wed, 19 May 2021 05:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJeMvnD48yKledjvAvmUkVuVahWxfS9KHq8l5vFptQfcG6pDYRH4satuz1xLVBYj0ZmxaSVA==
X-Received: by 2002:a05:6214:20c4:: with SMTP id
 4mr13194979qve.38.1621426543531; 
 Wed, 19 May 2021 05:15:43 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y9sm14576208qkm.19.2021.05.19.05.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:15:42 -0700 (PDT)
Date: Wed, 19 May 2021 08:15:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKUBbVuvm5FUJRMl@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210518230327.GG1002214@nvidia.com> <YKRRgZmRMdk1vH7A@t490s>
 <2235357.HsqDk0zIjc@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2235357.HsqDk0zIjc@nvdebian>
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

On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> Failing fork() because we couldn't take a lock doesn't seem like the right 
> approach though, especially as there is already existing code that retries. I 
> get this adds complexity though, so would be happy to take a look at cleaning 
> copy_pte_range() up in future.

Yes, I proposed that as this one won't affect any existing applications (unlike
the existing ones) but only new userspace driver apps that will use this new
atomic feature.

IMHO it'll be a pity to add extra complexity and maintainance burden into
fork() if only for keeping the "logical correctness of fork()" however the code
never triggers. If we start with trylock we'll know whether people will use it,
since people will complain with a reason when needed; however I still doubt
whether a sane userspace device driver should fork() within busy interaction
with the device underneath..

In all cases, please still consider to keep them in copy_nonpresent_pte() (and
if to rework, separating patches would be great).

Thanks,

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
