Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299FA3893C3
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6DC6EE2D;
	Wed, 19 May 2021 16:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862936EDC3
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621433377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
 b=KFmiMj3s2us43/++cpPNGprz9FWDrJ3XOUFDYYYXGhqmakgiZ/af8CvyAPfS2kBeoNwt9l
 uPLmAoOb9RYF4gt6p5J4+UBUHQn+V6bSki4q/yB2cDS9v9MsxkV+4jW+9hH0GnZZ7GHvHC
 28jjjOWVpS4imP0Qszj0PUjZK5b7Kw4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-bCZDavjrPluxySxUG3PZBw-1; Wed, 19 May 2021 10:09:35 -0400
X-MC-Unique: bCZDavjrPluxySxUG3PZBw-1
Received: by mail-qv1-f69.google.com with SMTP id
 w4-20020a0c8e440000b02901f0640ffdafso5553297qvb.13
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
 b=TMRL0/AB0jkdG5G3dD6gqgnfSNT3B3O4QAamkcnj+aDtkZLKM4cPMj0EzItiW7LVHM
 AtyXSgbrCWq0iCjvN/1+OacJ5Si7fDS8DE/I5j5DVqwL/E85xmfmeJjV5D3JIGdEyvuq
 vD+/dgBoNsooVM0MldhK4kaRbzGdUegRcmIG9rtSBjMUXAKAgbg/MG75mBammraHU5bA
 N4GwnSJshRDZXBc/ZGJJa2s5N7fEJGdIvUEc/v7WGfQmM5jDa4LkCKOlDi1B/QNGQ6nR
 HezjydCCSqlwl3Wwe4p26YlMQPJNJYrnXYOHavfUDiIKSkMwsAQaMkoC5cgWdR1PDZ8T
 gqQA==
X-Gm-Message-State: AOAM53210kQOrFz0WbkAltL47+MZvCaMr4MEHUSLqY5pKdD5hqFVW8Wj
 BucTKlad17AGfW1FUMJZ/o5EEKpoaXIKoJ74qVKvZerUWslne6u4W9VBG+xtuoMcHKt6kbZDobk
 NVDX6OHlymZvmnG2/tBeVpswCaQ==
X-Received: by 2002:a05:622a:413:: with SMTP id
 n19mr11309608qtx.238.1621433375268; 
 Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfgXghdceBt0pzuJuLcMWZrj1qSDnzHPuTLDIdA4muPS9QaO8qeOo+lEtQMgzjzxGPQ17Ppg==
X-Received: by 2002:a05:622a:413:: with SMTP id
 n19mr11309576qtx.238.1621433375015; 
 Wed, 19 May 2021 07:09:35 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id c20sm15634299qtm.52.2021.05.19.07.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:09:34 -0700 (PDT)
Date: Wed, 19 May 2021 10:09:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <YKUcHfhQMbDnjXC7@t490s>
References: <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s> <20210518230327.GG1002214@nvidia.com>
 <YKRRgZmRMdk1vH7A@t490s> <20210519132842.GJ1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210519132842.GJ1002214@nvidia.com>
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, daniel@ffwll.ch, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 10:28:42AM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 07:45:05PM -0400, Peter Xu wrote:
> > On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> > > Logically during fork all these device exclusive pages should be
> > > reverted back to their CPU pages, write protected and the CPU page PTE
> > > copied to the fork.
> > > 
> > > We should not copy the device exclusive page PTE to the fork. I think
> > > I pointed to this on an earlier rev..
> > 
> > Agreed.  Though please see the question I posted in the other thread: now I am
> > not very sure whether we'll be able to mark a page as device exclusive if that
> > page has mapcount>1.
> 
> IMHO it is similar to write protect done by filesystems on shared
> mappings - all VMAs with a copy of the CPU page have to get switched
> to the device exclusive PTE. This is why the rmap stuff is involved in
> the migration helpers

Right, I think Alistair corrected me there that I missed the early COW
happening in GUP.

Actually even without that GUP triggering early COW it won't be a problem,
because as long as one child mm restored the pte from exclusive to normal
(before any further COW happens) device exclusiveness is broken in the mmu
notifiers, and after that point all previous-exclusive ptes actually becomes
the same as a very normal PageAnon.  Then it's very sane to even not have the
original page in parent process, because we know each COWed page will contain
all the device atomic modifications (so we don't really have the requirement to
return the original page to parent).

Sorry for the noise.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
