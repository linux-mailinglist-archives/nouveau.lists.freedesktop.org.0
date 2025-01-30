Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00363A2B84D
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0E10E9EE;
	Fri,  7 Feb 2025 01:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kjCIKJ4V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0E510E2C3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 08:55:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43618283d48so3469525e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738227330; x=1738832130; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIslw6ufQaCzkTDQo2Y7rnWGVXJFTGegVErKgzJce74=;
 b=kjCIKJ4VjDEC4tGG25ey0geXiR/N9A/unjwkVRyFYMJXBe5MFqiS/wmq9yYBk8Yg6h
 eQD7xWY3ifR41qbfEI96wAb4x4HbpaHWyAdEdiodz1a25NFBGyEReR+14OLId3eSpe0Z
 APPGT9hHVrBCs3o5EK1Rs9QAZBfSi7qV1E91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738227330; x=1738832130;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIslw6ufQaCzkTDQo2Y7rnWGVXJFTGegVErKgzJce74=;
 b=V+N5aiuVWqc48PUDjNC4fSlnOi5rG4xPh3Jm0O/jP8SZcysLPFFmXSD4toTlBGsvfP
 x09Ween+MHWxjRhtHlUiIpcPkSFZhzqbyg2R/W6k44p5D169jn62b4NeBPBnSpEV8lqd
 /t6rdvL6KTHSJv5YEHHV2Q/oqoXvJhDxaG0L3R1sC/czF/RW2h8m51PGQpLFfAtFiSlx
 a+KDqQRJ3WlVBDSFJ+50DxO6Wr23ptx/Jp8pHC0TqkEH2IxZIQRJHpc7RMAXrdhLHQww
 MAur5spK1R6Mu2lEcBqv/hfRAJ28QZjXJRyvZrBTS+1Rj6ogtm/Qc9eiQAXWPwoVI+qN
 lHkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXlFraMCCK1/KTF9QwBkNGPce3x9xwKkUAWbcmNTqLwwTI4qDA5IAzpFXa7Z7ambEmhMxtJcen@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Ytzuq6GrKVkpqvHXI1V4VXH15Lyfv+04dv6HRd5ulkW0nxNx
 E+6I28qUzbAti4VRlX9E2iY78hhhFYuzmG/UMLOQVhuzXQd3VXaO8CV8hTnxLfeoC7O60pLO52E
 V
X-Gm-Gg: ASbGncvvK04+bOzAqz/RxikKNDDd87sOu9P9eVYE9RX7flZtaQuwToAIABYQyMOe32M
 xPdv65cFAl54zMgcJ/KztEB8+Dgkw3OHzMWNIN68fjJNucpXlsfyLTbweg0JG0UEBnCBuaNce7/
 Ud+2IGmPBqR0llNups0s+tKoST/PdykIP+p1J05SVKZSYPxgUDMn6qEkY41CIUTEXPMDGev/vtM
 tyP2XvzcgYYzQXOlNeQ4UrEtsAOsHom4Vrzy7v2MPQBZ3lBJRLhOUFunve+cJWJraLk9P06meJp
 UDoGt0+oOOFQg07DLvUsy/p+YVs=
X-Google-Smtp-Source: AGHT+IFyLToZ0gdk5jIE+m1EP+tgN9TteTZIvDJwNmgzXNNu1UsMwvchAhqyIMVoSY01MWwiaZ6shA==
X-Received: by 2002:a05:600c:138f:b0:434:f1e9:afae with SMTP id
 5b1f17b1804b1-438dc3aa785mr46269975e9.1.1738227330367; 
 Thu, 30 Jan 2025 00:55:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f0d2sm15613675e9.30.2025.01.30.00.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 00:55:29 -0800 (PST)
Date: Thu, 30 Jan 2025 09:55:27 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5s-f6UcT3VLVBFN@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
 <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
 <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
 <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
 <Z5oHY1pjjwBfRN1g@phenom.ffwll.local>
 <Z5oQ2YV1cRUc0KnD@phenom.ffwll.local>
 <c7891b99-3001-4d70-8673-8a76357db0bf@redhat.com>
 <Z5o1taCb6moJdPXW@phenom.ffwll.local>
 <8dfe1dd5-f4a7-4b8a-92c7-278519ee4c58@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dfe1dd5-f4a7-4b8a-92c7-278519ee4c58@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:42:11 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2025 at 05:13:41PM +0100, David Hildenbrand wrote:
> On 29.01.25 15:05, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:31:14PM +0100, David Hildenbrand wrote:
> > > On 29.01.25 12:28, Simona Vetter wrote:
> > > > On Wed, Jan 29, 2025 at 11:48:03AM +0100, Simona Vetter wrote:
> > > > > On Tue, Jan 28, 2025 at 09:24:33PM +0100, David Hildenbrand wrote:
> > > > > > On 28.01.25 21:14, Simona Vetter wrote:
> > > > > > > On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
> > > > > > > > On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
> > > > > > > > > > > > On integrated the gpu is tied into the coherency
> > > > > > > > > > > > fabric, so there it's not needed.
> > > > > > > > > > > > 
> > > > > > > > > > > > I think the more fundamental question with both this function here and
> > > > > > > > > > > > with forced migration to device memory is that there's no guarantee it
> > > > > > > > > > > > will work out.
> > > > > > > > > > > 
> > > > > > > > > > > Yes, in particular with device-exclusive, it doesn't really work with THP
> > > > > > > > > > > and is only limited to anonymous memory. I have patches to at least make it
> > > > > > > > > > > work reliably with THP.
> > > > > > > > > > 
> > > > > > > > > > I should have crawled through the implementation first before replying.
> > > > > > > > > > Since it only looks at folio_mapcount() make_device_exclusive() should at
> > > > > > > > > > least in theory work reliably on anon memory, and not be impacted by
> > > > > > > > > > elevated refcounts due to migration/ksm/thp/whatever.
> > > > > > > > > 
> > > > > > > > > Yes, there is -- in theory -- nothing blocking the conversion except the
> > > > > > > > > folio lock. That's different than page migration.
> > > > > > > > 
> > > > > > > > Indeed - this was the entire motivation for make_device_exclusive() - that we
> > > > > > > > needed a way to reliably exclude CPU access that couldn't be blocked in the same
> > > > > > > > way page migration can (otherwise we could have just migrated to a device page,
> > > > > > > > even if that may have added unwanted overhead).
> > > > > > > 
> > > > > > > The folio_trylock worries me a bit. I guess this is to avoid deadlocks
> > > > > > > when locking multiple folios, but I think at least on the first one we
> > > > > > > need an unconditional folio_lock to guarantee forward progress.
> > > > > > 
> > > > > > At least on the hmm path I was able to trigger the EBUSY a couple of times
> > > > > > due to concurrent swapout. But the hmm-tests selftest fails immediately
> > > > > > instead of retrying.
> > > > > 
> > > > > My worries with just retrying is that it's very hard to assess whether
> > > > > there's a livelock or whether the retry has a good chance of success. As
> > > > > an example the ->migrate_to_ram path has some trylocks, and the window
> > > > > where all other threads got halfway and then fail the trylock is big
> > > > > enough that once you pile up enough threads that spin through there,
> > > > > you're stuck forever. Which isn't great.
> > > > > 
> > > > > So if we could convert at least the first folio_trylock into a plain lock
> > > > > then forward progress is obviously assured and there's no need to crawl
> > > > > through large chunks of mm/ code to hunt for corner cases where we could
> > > > > be too unlucky to ever win the race.
> > > > > 
> > > > > > > Since
> > > > > > > atomics can't cross 4k boundaries (or the hw is just really broken) this
> > > > > > > should be enough to avoid being stuck in a livelock. I'm also not seeing
> > > > > > > any other reason why a folio_lock shouldn't work here, but then my
> > > > > > > understanding of mm/ stuff is really just scratching the surface.
> > > > > > > 
> > > > > > > I did crawl through all the other code and it looks like everything else
> > > > > > > is unconditional locks. So looks all good and I didn't spot anything else
> > > > > > > that seemed problematic.
> > > > > > > 
> > > > > > > Somewhat aside, I do wonder whether we really want to require callers to
> > > > > > > hold the mmap lock, or whether with all the work towards lockless fastpath
> > > > > > > that shouldn't instead just be an implementation detail.
> > > > > > 
> > > > > > We might be able to use the VMA lock in the future, but that will require
> > > > > > GUP support and a bunch more. Until then, the mm_lock in read mode is
> > > > > > required.
> > > > > 
> > > > > Yup. I also don't think we should try to improve before benchmarks show an
> > > > > actual need. It's more about future proofing and making sure mmap_lock
> > > > > doesn't leak into driver data structures that I'm worried about. Because
> > > > > I've seen some hmm/gpu rfc patches that heavily relied on mmap_lock to
> > > > > keep everything correct on the driver side, which is not a clean design.
> > > > > 
> > > > > > I was not able to convince myself that we'll really need the folio lock, but
> > > > > > that's also a separate discussion.
> > > > > 
> > > > > This is way above my pay understanding of mm/ unfortunately.
> > > > 
> > > > I pondered this some more, and I think it's to make sure we get a stable
> > > > reading of folio_mapcount() and are not racing with new rmaps being
> > > > established. But I also got lost a few times in the maze ...
> > > 
> > > That mapcount handling is all messed up and I'll remove that along with
> > > the rmap walk. Also, the folio lock does not stabilize the mapcount at all ...
> > 
> > Hm ... also rethinking this all, we don't need a lot of guarantees here.
> > Anything userspace does that re-elevates the mapcount or otherwise could
> > starve out make_device_exclusive is I think a case of "don't do that".
> > 
> > I think the only guarantee we need is that make_device_exclusive succeeds
> > against other kernel stuff like thp/migration/ksm and all those things, at
> > least reliably when you retry. And maybe also that concurrent
> > make_device_exclusive calls don't starve each another but eventually get
> > the job done (but only if it's the same owner).
> > 
> > > Here is my understanding:
> > > 
> > > commit e2dca6db09186534c7e6082b77be6e17d8920f10
> > > Author: David Hildenbrand <david@redhat.com>
> > > Date:   Tue Jan 28 15:25:37 2025 +0100
> > > 
> > >      mm/memory: document restore_exclusive_pte()
> > >      Let's document how this function is to be used, and why the requirement
> > >      for the folio lock might maybe be dropped in the future.
> > >      Signed-off-by: David Hildenbrand <david@redhat.com>
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 46956994aaff..caaae8df11a9 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
> > >   }
> > >   #endif
> > > +/**
> > > + * restore_exclusive_pte - Restore a device-exclusive entry
> > > + * @vma: VMA covering @address
> > > + * @folio: the mapped folio
> > > + * @page: the mapped folio page
> > > + * @address: the virtual address
> > > + * @ptep: PTE pointer into the locked page table mapping the folio page
> > > + * @orig_pte: PTE value at @ptep
> > > + *
> > > + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
> > > + *
> > > + * The folio and the page table must be locked, and MMU notifiers must have
> > > + * been called to invalidate any (exclusive) device mappings. In case of
> > > + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
> > > + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
> > > + *
> > > + * Locking the folio makes sure that anybody who just converted the PTE to
> > > + * a device-private entry can map it into the device, before unlocking it; so
> > > + * the folio lock prevents concurrent conversion to device-exclusive.
> > > + *
> > > + * TODO: the folio lock does not protect against all cases of concurrent
> > > + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
> > > + * must already use MMU notifiers to sync against any concurrent changes
> > > + * Maybe the requirement for the folio lock can be dropped in the future.
> > 
> > Hm yeah I was a bit confused why this would work at first. But since we
> > break cow with FOLL_WRITE there shouldn't be any other mappings around.
> > Therefore relying on the mmu notifier for that mm_struct is enough, and we
> > don't need to hold the folio_lock in callers.
> 
> Right; the devil is in the detail here; I looked at the SVM code and it
> registers an MMU notifier around that code to catch any invalidations that
> are happening while mapping the page. And it has another one to handle
> invalidations in general. I did not completely digest why two notifiers are
> required ... there likely is a good reason.

At least as a fallback you need a notifier for exactly only the fault, to
make sure you don't retry due to spurious invalidations. Otherwise if
userspace is hammering an adjacent page from the cpu we would not make
forward progress, and that's a correctness issue.

Now always inserting a new notifier for every fault in all cases isn't
great because it incurs a stall. But I discussed this issue with Thomas
Hellstrom a while back and there's a bunch of tricks we could deploy if
this ever becomes a performance issue.

So this all looks ok to me.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
