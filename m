Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500169E2D6
	for <lists+nouveau@lfdr.de>; Tue, 21 Feb 2023 15:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5B710E336;
	Tue, 21 Feb 2023 14:59:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD4A10E336
 for <nouveau@lists.freedesktop.org>; Tue, 21 Feb 2023 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676991582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zR01m6f0KMxaCdW6/9YON73JqwNOZ58NWx14UlZixkQ=;
 b=HFlgERdKH3B4MUQw8XNh3AuhtaJqo+v4PT/KUtsoYR+HYujvs0a4nwOmGeO5q4jO7b5uiX
 LE+FVwrlIbxxOYYUkscDCc+cBabBQADPp1HYFQWwdjesGpvxMcU/WrarWbhWx0lxf276Nn
 pX7wTgwvnb9jRIDhgNVZnnCAT2o3m6s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-COxZxn9MNB2lY1RfoQXWbw-1; Tue, 21 Feb 2023 09:59:40 -0500
X-MC-Unique: COxZxn9MNB2lY1RfoQXWbw-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec13-20020a0564020d4d00b004a621e993a8so6104039edb.13
 for <nouveau@lists.freedesktop.org>; Tue, 21 Feb 2023 06:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zR01m6f0KMxaCdW6/9YON73JqwNOZ58NWx14UlZixkQ=;
 b=0/kIw/aZpgZ2DvXeOK85etQjb4AKQNrAoA7VzjvH8gzL2Wx0HQBN+HO4XP6EbghMNA
 +DWwbQcwXcZh/7Jk1xi2NdpS2zApVb+khgSfGfnDwKlaZOW3lUGvtSWsJ6KiuTtY1a7j
 cLfk2N9ZfDS6BLosoUhySj2oAOQOjkwZ7Y2hyuWcBwbPRgABMzFVxXldjfo09e4OzNk0
 OV84HzUSp7BbTMakc/WseSlozX3oeiDytLVut38pQ5p4ayMFs0FtIXtHsn+5vTYz+03Y
 nEXsw9W9oGDKXphpYov6BUPueEyH3Owds3n73ckFEThSl91R+6tbdoqeSnqHGYC01BL0
 jVpw==
X-Gm-Message-State: AO0yUKVM42t/g+OCvT3gGC1MSYs6Oi+Wqi8bpoc+yXCbwWHAWwCwmcC4
 MxLTgdpzahrUfc0BmWGVI0ZdhvG4deUOkycpPbbJppc6qLssLAXQ1QVX5qf1qsrbwtcwSo9SPWs
 Dghc/Akx7mHNp1mFb+JWvdRhdzg==
X-Received: by 2002:a17:906:f298:b0:877:8ae7:2e44 with SMTP id
 gu24-20020a170906f29800b008778ae72e44mr10449585ejb.5.1676991579521; 
 Tue, 21 Feb 2023 06:59:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/rd+60WkR9Pb5ZCfi4/q+0aDmwntl5Cr4CAeiqkkwHXnHhiHRgUbf3dBpXyGaefcHcmhtyMQ==
X-Received: by 2002:a17:906:f298:b0:877:8ae7:2e44 with SMTP id
 gu24-20020a170906f29800b008778ae72e44mr10449559ejb.5.1676991579247; 
 Tue, 21 Feb 2023 06:59:39 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 dt23-20020a170906b79700b00889db195470sm7194952ejb.82.2023.02.21.06.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 06:59:38 -0800 (PST)
Date: Tue, 21 Feb 2023 15:37:49 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y/TXPasvkhtGiR+w@pollux>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
 <Y/PZH/q2Xsr3od9m@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y/PZH/q2Xsr3od9m@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH drm-next v2 04/16] maple_tree: add flag
 MT_FLAGS_LOCK_NONE
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 08:33:35PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 20, 2023 at 06:06:03PM +0100, Danilo Krummrich wrote:
> > On 2/20/23 16:10, Matthew Wilcox wrote:
> > > This is why we like people to use the spinlock embedded in the tree.
> > > There's nothing for the user to care about.  If the access really is
> > > serialised, acquiring/releasing the uncontended spinlock is a minimal
> > > cost compared to all the other things that will happen while modifying
> > > the tree.
> > 
> > I think as for the users of the GPUVA manager we'd have two cases:
> > 
> > 1) Accesses to the manager (and hence the tree) are serialized, no lock
> > needed.
> > 
> > 2) Multiple operations on the tree must be locked in order to make them
> > appear atomic.
> 
> Could you give an example here of what you'd like to do?  Ideally
> something complicated so I don't say "Oh, you can just do this" when
> there's a more complex example for which "this" won't work.  I'm sure
> that's embedded somewhere in the next 20-odd patches, but it's probably
> quicker for you to describe in terms of tree operations that have to
> appear atomic than for me to try to figure it out.
> 

Absolutely, not gonna ask you to read all of that. :-)

One thing the GPUVA manager does is to provide drivers the (sub-)operations
that need to be processed in order to fulfill a map or unmap request from
userspace. For instance, when userspace asks the driver to map some memory
the GPUVA manager calculates which existing mappings must be removed, split up
or can be merged with the newly requested mapping.

A driver has two ways to fetch those operations from the GPUVA manager. It can
either obtain a list of operations or receive a callback for each operation
generated by the GPUVA manager.

In both cases the GPUVA manager walks the maple tree, which keeps track of
existing mappings, for the given range in __drm_gpuva_sm_map() (only considering
the map case, since the unmap case is a subset basically). For each mapping
found in the given range the driver, as mentioned, either receives a callback or
a list entry is added to the list of operations.

Typically, for each operation / callback one entry within the maple tree is
removed and, optionally at the beginning and end of a new mapping's range, a
new entry is inserted. An of course, as the last operation, there is the new
mapping itself to insert.

The GPUVA manager delegates locking responsibility to the drivers. Typically,
a driver either serializes access to the VA space managed by the GPUVA manager
(no lock needed) or need to lock the processing of a full set of operations
generated by the GPUVA manager.

> > In either case the embedded spinlock wouldn't be useful, we'd either need an
> > external lock or no lock at all.
> > 
> > If there are any internal reasons why specific tree operations must be
> > mutually excluded (such as those you explain below), wouldn't it make more
> > sense to always have the internal lock and, optionally, allow users to
> > specify an external lock additionally?
> 
> So the way this works for the XArray, which is a little older than the
> Maple tree, is that we always use the internal spinlock for
> modifications (possibly BH or IRQ safe), and if someone wants to
> use an external mutex to make some callers atomic with respect to each
> other, they're free to do so.  In that case, the XArray doesn't check
> the user's external locking at all, because it really can't know.
> 
> I'd advise taking that approach; if there's really no way to use the
> internal spinlock to make your complicated updates appear atomic
> then just let the maple tree use its internal spinlock, and you can
> also use your external mutex however you like.
> 

That sounds like the right thing to do.

However, I'm using the advanced API of the maple tree (and that's the reason
why the above example appears a little more detailed than needed) because I
think with the normal API I can't insert / remove tree entries while walking
the tree, right?

As by the documentation the advanced API, however, doesn't take care of locking
itself, hence just letting the maple tree use its internal spinlock doesn't
really work - I need to take care of that myself, right?

It feels a bit weird that I, as a user of the API, would need to lock certain
(or all?) mas_*() functions with the internal spinlock in order to protect
(future) internal features of the tree, such as the slab cache defragmentation
you mentioned. Because from my perspective, as the generic component that tells
it's users (the drivers) to take care of locking VA space operations (and hence
tree operations) I don't have an own purpose of this internal spinlock, right?

Also I'm a little confused how I'd know where to take the spinlock? E.g. for
inserting entries in the tree I use mas_store_gfp() with GFP_KERNEL.

