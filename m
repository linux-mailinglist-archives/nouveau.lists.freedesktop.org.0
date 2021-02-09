Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3B31504B
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 14:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955C36EB2F;
	Tue,  9 Feb 2021 13:35:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D47F6EB2F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 13:35:24 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id v206so6220027qkb.3
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=25WUiLOJuw+GE+OUcQPIenFzwQPp8UMH3H3KE2iMm0w=;
 b=mzalXTaSQvqsMyTlcg2ocFEUjvAp99/a77nvoAG+uBoekFj7jweXCNHWlDPY2podsm
 yk9Mj1F2cz110lWiEY7yQblSp7LnblfxSgv5BUgT9Flc4ccAx72uC8Y2THXcbcbD6kGD
 MyoZYCBgQenxcNlyO8fljyQ6Jq2M8pigmK0+JOjqZBy3biXjyoLm+p+yERZ9wYNk+Bnn
 o52J19oTF3wLoOgSdYnYV1qzXs2BuOw4ltcx4+q08fA7o9lTx2BseR4h0neV0CMUVA5F
 HAUa4RtablrEiHfxqQTuyRNKLDapPyjHXbP+MKYcA1EGo2CxvAnP3VaRLHFNrbDuXCkv
 efLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=25WUiLOJuw+GE+OUcQPIenFzwQPp8UMH3H3KE2iMm0w=;
 b=isb4LpjHcSjoKVhNKG3A1zzxxXpgVeaQP166PCAoKjhzHsw0cCp0ZrEYYbni8uYmx4
 qyP+X60gm4/zrvkTK5vF6tFZkZvDscuJICCoy0KZadingvqOsd0ewb8PZnMVAwjBBTMc
 Bi1d7LZMoG0uNcPDHUh7qcOyxnIpHgCJ5wlk4i+tVEO4uVI6IowMbIUbhbT8WkBYBSad
 TBYsEB+R+7wWjRyPrysqDNzZSRwfXFVqn2VBkzPfwOe3CuVaPVLm+fCgohxWlX4NuApq
 0D+OXepSNNGnIuP7jEafmEqs4grKEXJ0JEUxciQqbiHHvqG4q6xwIVZZjQIhgQz6KpjU
 PJ9g==
X-Gm-Message-State: AOAM533ClTaJsSfhhh7QVbbnIc6YZFK4aSnZP1q4txTbWG8WNg6cXr0y
 GoeRsKCE4VA5sGguw8HYSzasiw==
X-Google-Smtp-Source: ABdhPJzbjksA775ifW6lQbAm7tuYtcAJCYrBFcFhoKRtCHGrYI9QO0U12fgq+gl/FMuI2/wmaQjtRQ==
X-Received: by 2002:a05:620a:6d7:: with SMTP id
 23mr8251839qky.460.1612877721350; 
 Tue, 09 Feb 2021 05:35:21 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id e66sm6901615qkd.82.2021.02.09.05.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:35:20 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9TAm-005RH4-8s; Tue, 09 Feb 2021 09:35:20 -0400
Date: Tue, 9 Feb 2021 09:35:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210209133520.GB4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3426910.QXTomnrpqD@nvdebian>
Subject: Re: [Nouveau] [PATCH 0/9] Add support for SVM atomics in Nouveau
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 11:57:28PM +1100, Alistair Popple wrote:
> On Tuesday, 9 February 2021 9:27:05 PM AEDT Daniel Vetter wrote:
> > >
> > > Recent changes to pin_user_pages() prevent the creation of pinned pages in
> > > ZONE_MOVABLE. This series allows pinned pages to be created in 
> ZONE_MOVABLE
> > > as attempts to migrate may fail which would be fatal to userspace.
> > >
> > > In this case migration of the pinned page is unnecessary as the page can 
> be
> > > unpinned at anytime by having the driver revoke atomic permission as it
> > > does for the migrate_to_ram() callback. However a method of calling this
> > > when memory needs to be moved has yet to be resolved so any discussion is
> > > welcome.
> > 
> > Why do we need to pin for gpu atomics? You still have the callback for
> > cpu faults, so you
> > can move the page as needed, and hence a long-term pin sounds like the
> > wrong approach.
> 
> Technically a real long term unmoveable pin isn't required, because as you say 
> the page can be moved as needed at any time. However I needed some way of 
> stopping the CPU page from being freed once the userspace mappings for it had 
> been removed. 

The issue is you took the page out of the PTE it belongs to, which
makes it orphaned and unlocatable by the rest of the mm?

Ideally this would leave the PTE in place so everything continues to
work, just disable CPU access to it.

Maybe some kind of special swap entry?

I also don't much like the use of ZONE_DEVICE here, that should only
be used for actual device memory, not as a temporary proxy for CPU
pages.. Having two struct pages refer to the same physical memory is
pretty ugly.

> The normal solution of registering an MMU notifier to unpin the page when it 
> needs to be moved also doesn't work as the CPU page tables now point to the
> device-private page and hence the migration code won't call any invalidate 
> notifiers for the CPU page.

The fact the page is lost from the MM seems to be the main issue here.

> Yes, I would like to avoid the long term pin constraints as well if possible I 
> just haven't found a solution yet. Are you suggesting it might be possible to 
> add a callback in the page migration logic to specially deal with moving these 
> pages?

How would migration even find the page?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
