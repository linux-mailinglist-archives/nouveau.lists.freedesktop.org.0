Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8731506E
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 14:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531B76EB3C;
	Tue,  9 Feb 2021 13:40:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050286EB3C
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 13:40:02 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id y21so4256237oot.12
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhfQbnhwDGpqGDadCiKHjxS8DmSjilEDHzg3CJ532pI=;
 b=JigqNdgDEFgtQlKMjnmdnlDlN7M4qkzWm5dhzF1dd992sb4eU3A75DIikN86A5yKF3
 +HYqLOXv3f90n0bmYdNvleTeiQcUc5RdDT1mXps9fTyTu9OPEPFxGyjMaOdfAf5jGZOp
 LN5zBs74rUhwch5wHpsKumLLOkAYJemIb3dfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhfQbnhwDGpqGDadCiKHjxS8DmSjilEDHzg3CJ532pI=;
 b=KPnYAUAO/rSqVxfeh9oNDYQSSFStyUXTF7eBlpDDH3TZxzLSfd0sPC6n/VoV9aixVg
 t7BBK0zLgZYPqVcJi2NYDS3jTkqxgLlSLpUD8/CFx1Wr1d1dUVtbDkS/zLahdb8ENu3D
 pPH/U6IzlMdUqy55V2HiZIF0gMnhdnGChc4oZPSf98IW9HL+rrL+LELNk/xnKgY8MZ8s
 qJsHVeAz4vS0pNv7EYWYL9gBst6nh4sE7wjT8zcTfG0MmrjZwuA4zyl6bRTRm/A0zAhM
 v69muCN6VuNh5U2BeZWT2Qta3ZgcUxTfYzz549Sg10MGd19oXYvLROpYMkHvZvedbCrw
 TLng==
X-Gm-Message-State: AOAM532ck0LJl5IFfrQ47aAu8LzDhpwjgxC+2/hI1SzuyYfVrYfTQxEO
 93k651T4sE6+KY6PEtCWgGX0ml8LOs8+e8eLD7nwwA==
X-Google-Smtp-Source: ABdhPJxCuVVi8kRB1kkxAZJFWPpa7yPv+iZrvRDXXQ3OzMMiP+Pm+I8NUjrdp4w6xRd7m67NamfzG5rvygCAv52MFRA=
X-Received: by 2002:a4a:d891:: with SMTP id b17mr15851254oov.28.1612878002267; 
 Tue, 09 Feb 2021 05:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian> <20210209133520.GB4718@ziepe.ca>
In-Reply-To: <20210209133520.GB4718@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 14:39:51 +0100
Message-ID: <CAKMK7uGR44pSdL7FOui4XE6hRY8pMs7d0bPbgHHoprRG4tGmFQ@mail.gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 9, 2021 at 2:35 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Feb 09, 2021 at 11:57:28PM +1100, Alistair Popple wrote:
> > On Tuesday, 9 February 2021 9:27:05 PM AEDT Daniel Vetter wrote:
> > > >
> > > > Recent changes to pin_user_pages() prevent the creation of pinned pages in
> > > > ZONE_MOVABLE. This series allows pinned pages to be created in
> > ZONE_MOVABLE
> > > > as attempts to migrate may fail which would be fatal to userspace.
> > > >
> > > > In this case migration of the pinned page is unnecessary as the page can
> > be
> > > > unpinned at anytime by having the driver revoke atomic permission as it
> > > > does for the migrate_to_ram() callback. However a method of calling this
> > > > when memory needs to be moved has yet to be resolved so any discussion is
> > > > welcome.
> > >
> > > Why do we need to pin for gpu atomics? You still have the callback for
> > > cpu faults, so you
> > > can move the page as needed, and hence a long-term pin sounds like the
> > > wrong approach.
> >
> > Technically a real long term unmoveable pin isn't required, because as you say
> > the page can be moved as needed at any time. However I needed some way of
> > stopping the CPU page from being freed once the userspace mappings for it had
> > been removed.
>
> The issue is you took the page out of the PTE it belongs to, which
> makes it orphaned and unlocatable by the rest of the mm?
>
> Ideally this would leave the PTE in place so everything continues to
> work, just disable CPU access to it.
>
> Maybe some kind of special swap entry?

I probably should have read the patches more in detail, I was assuming
the ZONE_DEVICE is only for vram. At least I thought the requirement
for gpu atomics was that the page is in vram, but maybe I'm mixing up
how this works on nvidia with how it works in other places. Iirc we
had a long discussion about this at lpc19 that ended with the
conclusion that we must be able to migrate, and sometimes migration is
blocked. But the details ellude me now.

Either way ZONE_DEVICE for not vram/device memory sounds wrong. Is
that really going on here?
-Daniel

>
> I also don't much like the use of ZONE_DEVICE here, that should only
> be used for actual device memory, not as a temporary proxy for CPU
> pages.. Having two struct pages refer to the same physical memory is
> pretty ugly.
>
> > The normal solution of registering an MMU notifier to unpin the page when it
> > needs to be moved also doesn't work as the CPU page tables now point to the
> > device-private page and hence the migration code won't call any invalidate
> > notifiers for the CPU page.
>
> The fact the page is lost from the MM seems to be the main issue here.
>
> > Yes, I would like to avoid the long term pin constraints as well if possible I
> > just haven't found a solution yet. Are you suggesting it might be possible to
> > add a callback in the page migration logic to specially deal with moving these
> > pages?
>
> How would migration even find the page?
>
> Jason



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
