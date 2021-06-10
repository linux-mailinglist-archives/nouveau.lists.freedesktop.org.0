Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C193B50F4
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262646E079;
	Sun, 27 Jun 2021 03:34:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0C6E4DD
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jun 2021 18:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623348279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CEoL5V4Mmey/+otE2j2URoJUKULpKPt4rB1iuEzrSWg=;
 b=G6norW3i4bK27LW6BCb6fBgCQx1yBFMpw9I0bWinL1NMtiLwv6uNCH3gwJNc8YdXUraUU0
 708WvDvpOGVtvn3Ht61kyV0PkpLgiGCGSdF26qFkcchEqXSm+MhgZAhrfyhOt5+xy6CePH
 dVIZy3NdrrfEaUVnKIV1BzOVlvZNksE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-YDGohSZ3P9Gz1oK2oKsJBA-1; Thu, 10 Jun 2021 14:04:38 -0400
X-MC-Unique: YDGohSZ3P9Gz1oK2oKsJBA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d7-20020ac811870000b02901e65f85117bso345708qtj.18
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jun 2021 11:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CEoL5V4Mmey/+otE2j2URoJUKULpKPt4rB1iuEzrSWg=;
 b=VTx3DAABTRb+ZBp9b9Tx8u0zhDffSs+Qlug4GtZP99AU0t9Qf3ecx9eUrLr9Ww7t9a
 4YAWUDfn/2y3iBf/CPstAondVJEbW44hGXHSusTU1KOuKz0vscFJg19CmWWa3mQwrJwE
 n0rHjl92ccoc8XA0tJI6mvxJBzsYeURtH1ct1j865pHtsdcKYgqx7Q5TwWwQ8ZsY+MOP
 oI3IpQiBWB720CEKI0fdpLkHymEZOH54Lr2okcgFA/NqAEw5PY4cLOZi+rBmF9cnYw7V
 v/yijEfz/srplwuFvlR0eFcW95uM/bMqxGcWKKhg7uPfeJLhu4awG+y4fWu4DweXI4bu
 xinQ==
X-Gm-Message-State: AOAM531Eu5gf1BwPBJzhAJEcmmuUMcgoDp4bB1A6IegegcLNk/reLs5M
 vVYWq8HexrrtSoK28nktXe5gcGfNctbovk5TC/0MpBMB3kdGiGT0X8Z2iSuP5+21sGwXdUNKqnl
 9pU2NCm3W2Ca747pYGh4OYhjWaA==
X-Received: by 2002:aed:306f:: with SMTP id 102mr3458qte.197.1623348277896;
 Thu, 10 Jun 2021 11:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTTO+KkTdxTZkkMrHOmkbo6ejQaZkDXpeywK0BwU0l5R3cowlkisPdpRInl2BsP3WxC79JBQ==
X-Received: by 2002:aed:306f:: with SMTP id 102mr3418qte.197.1623348277505;
 Thu, 10 Jun 2021 11:04:37 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id o3sm2731692qkc.93.2021.06.10.11.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 11:04:36 -0700 (PDT)
Date: Thu, 10 Jun 2021 14:04:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YMJUM4sx1VclR7oz@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <270551728.uXnuCZxQlr@nvdebian> <YMDmsha6GDtUf3Vs@t490s>
 <2773835.D95cIkl9rl@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2773835.D95cIkl9rl@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v10 07/10] mm: Device exclusive memory access
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 10:18:25AM +1000, Alistair Popple wrote:
> > > The main problem is split_huge_pmd_address() unconditionally calls a mmu
> > > notifier so I would need to plumb in passing an owner everywhere which could
> > > get messy.
> > 
> > Could I ask why?  split_huge_pmd_address() will notify with CLEAR, so I'm a bit
> > confused why we need to pass over the owner.
> 
> Sure, it is the same reason we need to pass it for the exclusive notifier.
> Any invalidation during the make exclusive operation will break the mmu read
> side critical section forcing a retry of the operation. The owner field is what
> is used to filter out invalidations (such as the exclusive invalidation) that
> don't need to be retried.

Do you mean the mmu_interval_read_begin|retry() calls?

Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
internally which will generate that unwanted CLEAR notify.

If that's the case, I think it fails because split_huge_pmd_address() will
trigger that CLEAR notify unconditionally (even if it's not a thp; not sure
whether it should be optimized to not notify at all... definitely another
story), while FOLL_SPLIT_PMD will skip the notify as it calls split_huge_pmd()
instead, who checks the pmd before calling __split_huge_pmd().

Does it also mean that if there's a real THP it won't really work?  As then
FOLL_SPLIT_PMD will start to trigger that CLEAR notify too, I think..

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
