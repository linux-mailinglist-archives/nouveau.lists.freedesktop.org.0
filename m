Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDF3893C4
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3E76EE2B;
	Wed, 19 May 2021 16:29:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628FC6E106
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 23:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621381511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NyB3nRYXEIw9i58PAbApIYiWHD6bmSqOFX83eNLmrgQ=;
 b=A2azpbbzdV/hO2S7UbDnm1Fx2eXKsptBL034xKb3UlLDkbq81PQhDZoUD4pgiUcK6YbySp
 XAV6Hn5WoWOcGs+xbPOZraJ7jR6wdTngSdwgpPkXNVruH7qkCECWrI5UYYCTXVCwBM+k5p
 7y6JT25I5ausTL1NAx1XNt1E63DVrKY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Ua3gkldDPBSdLsXYAw_KHQ-1; Tue, 18 May 2021 19:45:08 -0400
X-MC-Unique: Ua3gkldDPBSdLsXYAw_KHQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 r25-20020a05620a03d9b02903a58bfe037cso2507814qkm.15
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 16:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NyB3nRYXEIw9i58PAbApIYiWHD6bmSqOFX83eNLmrgQ=;
 b=X89g4tL4YvpYgP7PL7EIAgefvER0qqRazDDENx7GcMhCeFYcLatPi84qxHQOzsX1qP
 pENlRRFfuT7XE5Fe+FGXEE4pkNIYQlwRm0zqNKqsQNNg+wma2xwgFYUFjeqF+josuMRi
 f0wjFRKs0lDXVVHkCkuAl4hyQrJXqRLKVKviZYGm3s8dXakuVDoFDmAPD/nQwcnCRa70
 Ty2G4cwtLwU9Gjl1yN51B4VCbKjvdBsqJ/bwZT75OYh9NcOTzrJ2XFo8PopFJDY3BRY3
 3B5WkrdEjvpnywY2RxtIItTp4+0sWVJUzgXggGndEN3U5B6uBosYr78vUg/aermM8FcI
 t0OQ==
X-Gm-Message-State: AOAM530Twnfy4UraxqK6KlVcwH2lRKsjEmYM03usU2P7rb/bMjB/fk52
 XAmAzvntYJZFWzKicwONaalKRJB6w2JNl7phCS+uFWrMkEX0Pz1EGjOnxvJO+tl2Av/LLLn+joI
 ozlx4M+o80RMMZa0/2sbmY7LHFA==
X-Received: by 2002:a05:622a:350:: with SMTP id
 r16mr7491995qtw.27.1621381507347; 
 Tue, 18 May 2021 16:45:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ExMzzZXtIx7iGUTcSpCi16S7VAiLXsFhzha61Te2cv+Okvdh1uyfL/4TjC80GU7c5+ldwA==
X-Received: by 2002:a05:622a:350:: with SMTP id
 r16mr7491943qtw.27.1621381506771; 
 Tue, 18 May 2021 16:45:06 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id 7sm15927040qtu.38.2021.05.18.16.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 16:45:06 -0700 (PDT)
Date: Tue, 18 May 2021 19:45:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <YKRRgZmRMdk1vH7A@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s> <20210518230327.GG1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210518230327.GG1002214@nvidia.com>
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

On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> Logically during fork all these device exclusive pages should be
> reverted back to their CPU pages, write protected and the CPU page PTE
> copied to the fork.
> 
> We should not copy the device exclusive page PTE to the fork. I think
> I pointed to this on an earlier rev..

Agreed.  Though please see the question I posted in the other thread: now I am
not very sure whether we'll be able to mark a page as device exclusive if that
page has mapcount>1.

> 
> We can optimize this into the various variants above, but logically
> device exclusive stop existing during fork.

Makes sense, I think that's indeed what this patch did at least for the COW
case, so I think Alistair did address that comment.  It's just that I think we
need to drop the other !COW case (imho that should correspond to the changes in
copy_nonpresent_pte()) in this patch to guarantee it.

I also hope we don't make copy_pte_range() even more complicated just to do the
lock_page() right, so we could fail the fork() if the lock is hard to take.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
