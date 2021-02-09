Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4B31505F
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 14:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DB06EB20;
	Tue,  9 Feb 2021 13:37:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7D56EB20
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 13:37:44 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id m7so19390045oiw.12
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N841iQ9kWSoyGbDxnyS2lfPbTFn9GbQBCWGWYptwBjo=;
 b=dZnwC0EP2oRvQWDzVYjaBz0mpRcOi213Sz/23TmswG07qWiPNm18GTaVBf5tLMQHnN
 npPa0SIiwwz5hq4z6EPRBu6MenNeP46VigR7K9W+N0XELD7lgOgModNvxP1ianmO1OUC
 WgV8qTbjUWfRbzNtOTCmMhaBEd+myqyLjIfv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N841iQ9kWSoyGbDxnyS2lfPbTFn9GbQBCWGWYptwBjo=;
 b=UTO/e/pSbHOxwm1JZblhkKLeshdkLpKaVzU4wlyf/hRJ+s/ZNZ6GlOB+Yp63RJ+h0H
 ZfVvNu+IPMYMyulTPemB13qBM5glS8qYIxUJITGGMSRlwGuMfoCkvQ0ab2okWdZIRXU+
 E18cMS3R32R6HnbLyaICL7hu05gm2OoZJ3YTMuuBHKNIOD1Yj8NYUGPZSQOmSikdvDCW
 VSvcFfvv8ifJg0wfSFRRP1GrX4Jn3QtC9IwPVG2zNeglC8HgpKrjFG1SKeFT7074Euak
 sEssC9/BZcIEYyrxJL/vejiWDumsNBgz2eGTwCdE6rSz0+LXNd5zP164On0Gwaw+k8sh
 Yo2A==
X-Gm-Message-State: AOAM5335naiygwwRsjnoca8t9/KZqUu5z3ahej+gCnn348JddWpMqI/q
 FSCzWuFXep7g1X7PnpjLgPnbke8vnsWDhR01Y18dTA==
X-Google-Smtp-Source: ABdhPJyy5MepLQLdvLY0EPRLtIDNjgs2IIyBoFeuNQNErnK1iydPhtA2Lf5mM4hgfdSRq9s19tLXbQJR2E7el+1dVPg=
X-Received: by 2002:aca:df42:: with SMTP id w63mr2479956oig.128.1612877863700; 
 Tue, 09 Feb 2021 05:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
In-Reply-To: <3426910.QXTomnrpqD@nvdebian>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 14:37:32 +0100
Message-ID: <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
To: Alistair Popple <apopple@nvidia.com>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 9, 2021 at 1:57 PM Alistair Popple <apopple@nvidia.com> wrote:
>
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
> been removed. Obviously I could have just used get_page() but from the
> perspective of page migration the result is much the same as a pin - a page
> which can't be moved because of the extra refcount.

long term pin vs short term page reference aren't fully fleshed out.
But the rule more or less is:
- short term page reference: _must_ get released in finite time for
migration and other things, either because you have a callback, or
because it's just for direct I/O, which will complete. This means
short term pins will delay migration, but not foul it complete

- long term pin: the page cannot be moved, all migration must fail.
Also this will have an impact on COW behaviour for fork (but not sure
where those patches are, John Hubbard will know).

So I think for your use case here you want a) short term page
reference to make sure it doesn't disappear plus b) callback to make
sure migrate isn't blocked.

Breaking ZONE_MOVEABLE with either allowing long term pins or failing
migrations because you don't release your short term page reference
isn't good.

> The normal solution of registering an MMU notifier to unpin the page when it
> needs to be moved also doesn't work as the CPU page tables now point to the
> device-private page and hence the migration code won't call any invalidate
> notifiers for the CPU page.

Yeah you need some other callback for migration on the page directly.
it's a bit awkward since there is one already for struct
address_space, but that's own by the address_space/page cache, not
HMM. So I think we need something else, maybe something for each
ZONE_DEVICE?

> > That would avoid all the hacking around long term pin constraints, because
> > for real unmoveable long term pinned memory we really want to have all
> > these checks. So I think we might be missing some other callbacks to be
> > able to move these pages, instead of abusing longterm pins for lack of
> > better tools.
>
> Yes, I would like to avoid the long term pin constraints as well if possible I
> just haven't found a solution yet. Are you suggesting it might be possible to
> add a callback in the page migration logic to specially deal with moving these
> pages?

s/possible/need to type some code to address it/ I think.

But also I'm not much of an expert on this, I've only just started
learning how this all fits together coming from the gpu side. There's
a _lot_ of finesse involved.

Cheers, Daniel

>
> Thanks, Alistair
>
> > Cheers, Daniel
> >
> >
> >
> > >
> > > Alistair Popple (9):
> > >   mm/migrate.c: Always allow device private pages to migrate
> > >   mm/migrate.c: Allow pfn flags to be passed to migrate_vma_setup()
> > >   mm/migrate: Add a unmap and pin migration mode
> > >   Documentation: Add unmap and pin to HMM
> > >   hmm-tests: Add test for unmap and pin
> > >   nouveau/dmem: Only map migrating pages
> > >   nouveau/svm: Refactor nouveau_range_fault
> > >   nouveau/dmem: Add support for multiple page types
> > >   nouveau/svm: Implement atomic SVM access
> > >
> > >  Documentation/vm/hmm.rst                      |  22 +-
> > >  arch/powerpc/kvm/book3s_hv_uvmem.c            |   4 +-
> > >  drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
> > >  drivers/gpu/drm/nouveau/nouveau_dmem.c        | 190 +++++++++++++++---
> > >  drivers/gpu/drm/nouveau/nouveau_dmem.h        |   9 +
> > >  drivers/gpu/drm/nouveau/nouveau_svm.c         | 148 +++++++++++---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
> > >  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
> > >  include/linux/migrate.h                       |   2 +
> > >  include/linux/migrate_mode.h                  |   1 +
> > >  lib/test_hmm.c                                | 109 ++++++++--
> > >  lib/test_hmm_uapi.h                           |   1 +
> > >  mm/migrate.c                                  |  82 +++++---
> > >  tools/testing/selftests/vm/hmm-tests.c        |  49 +++++
> > >  14 files changed, 524 insertions(+), 101 deletions(-)
> > >
> > > --
> > > 2.20.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
