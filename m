Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA4A2B83C
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371BB10E9E0;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ADTG2bdY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D04210E7A6
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 11:28:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436341f575fso74357495e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 03:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738150108; x=1738754908; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z2VbjRVyCbXR+8Dg8WLIWe582fw710vs2oZGBMizD0s=;
 b=ADTG2bdYNndxjfz990x8AstSWMSgX+JLljhgySHiL1Y9WJLzRr1m9BxEj+B12ZwLbD
 QvYTp8t4EQSmSYsWu2OYHC8e0n4yTlktDD5Zh65q/S7cALh4xRzxDzbOiy9Qvw8hPBjc
 2W0nn0rLF1Z0SxXeokiAdw2AWMtMfuiz2cd7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738150108; x=1738754908;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2VbjRVyCbXR+8Dg8WLIWe582fw710vs2oZGBMizD0s=;
 b=VspCyzaHH1pypDrUngTtq/j70DQ9VJVXQrmgqhGlq8yB0445ehBRRaaHQHeX+vA9x3
 /Wky8ou0V67g0DL7qIPNzuw2G1R+CRAtyhAYyQ0v7xO2zsasf9hpGa8bVvzbqaYG+aeR
 7LiY5RV2SC+f1uE3Pw+y0TAis9wKvWhyrJpHquqX7tAdlsm2hwRnAsZlMsrvPhlpK3uA
 9BC+KLvOPJ5RyF1AP44Ptc1HoMdCu56X3+noIDHtY8W3oUUocTqZqLn7ti0wNuva8JBX
 I3mu8Nme8PcVRHYSfcrl2+xwIQmzish+yydO2mgO6BV9dJx+Hs5HGHvnub7fOdqSWA1+
 p7QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0tzGAMzArtZB4Hx3uP5UJ8i2077eu/EThKVKgP46ipOOP4DW+gPLbxCdx6jxY41X8YhFX/j/e@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmLrgDCidCSs2vbIlj2Qgq0Px5jsxyb9jqhEAdFWfg7cY5Ux++
 ydJkeHv740rmvIK/jNCZmWoD51XHTy8u1jqSgcWfon2c+mDBxj3xe8yWe0alurA9UQZhqeuYzOh
 X
X-Gm-Gg: ASbGncuhcFpE/LRKvOeLoUmBaEYzjKf754PHiuorEs2zxxjLW/7QuHHd6V3u9yZKL0s
 Fbc8q3xcLnYvtNt760VGKuonkaaZU5b1OwG1C+BwtVortiW63BAz/toA0a6LzmudE2WWjXbhtkB
 OhExM1D9n+rAOh23okAMM6xZj4esg27rSqfPHB/2UEGoEmPz2bu24Bw1lVXTULni6caoDos+FzD
 C1z4HF1Um/B232zHikVmBaR60QclBV5S49cgYj3tv37aniASTVobRSwkKsUlZsRR40na/SShwmI
 pOPtvtssvoLM8ZTF8+/IcO9tIxU=
X-Google-Smtp-Source: AGHT+IHg+He9FWfYDRGN+VU9l4bW9JJdgPPVmyUVVgTnOLsxQcZLamrOOWh8CGRSyngbepz9UL4uNQ==
X-Received: by 2002:a05:600c:1d1e:b0:438:a1f5:3e41 with SMTP id
 5b1f17b1804b1-438dc3c387fmr25071285e9.12.1738150107630; 
 Wed, 29 Jan 2025 03:28:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13202sm20014415e9.5.2025.01.29.03.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:28:27 -0800 (PST)
Date: Wed, 29 Jan 2025 12:28:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5oQ2YV1cRUc0KnD@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
 <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
 <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
 <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
 <Z5oHY1pjjwBfRN1g@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5oHY1pjjwBfRN1g@phenom.ffwll.local>
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

On Wed, Jan 29, 2025 at 11:48:03AM +0100, Simona Vetter wrote:
> On Tue, Jan 28, 2025 at 09:24:33PM +0100, David Hildenbrand wrote:
> > On 28.01.25 21:14, Simona Vetter wrote:
> > > On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
> > > > On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
> > > > > > > > On integrated the gpu is tied into the coherency
> > > > > > > > fabric, so there it's not needed.
> > > > > > > > 
> > > > > > > > I think the more fundamental question with both this function here and
> > > > > > > > with forced migration to device memory is that there's no guarantee it
> > > > > > > > will work out.
> > > > > > > 
> > > > > > > Yes, in particular with device-exclusive, it doesn't really work with THP
> > > > > > > and is only limited to anonymous memory. I have patches to at least make it
> > > > > > > work reliably with THP.
> > > > > > 
> > > > > > I should have crawled through the implementation first before replying.
> > > > > > Since it only looks at folio_mapcount() make_device_exclusive() should at
> > > > > > least in theory work reliably on anon memory, and not be impacted by
> > > > > > elevated refcounts due to migration/ksm/thp/whatever.
> > > > > 
> > > > > Yes, there is -- in theory -- nothing blocking the conversion except the
> > > > > folio lock. That's different than page migration.
> > > > 
> > > > Indeed - this was the entire motivation for make_device_exclusive() - that we
> > > > needed a way to reliably exclude CPU access that couldn't be blocked in the same
> > > > way page migration can (otherwise we could have just migrated to a device page,
> > > > even if that may have added unwanted overhead).
> > > 
> > > The folio_trylock worries me a bit. I guess this is to avoid deadlocks
> > > when locking multiple folios, but I think at least on the first one we
> > > need an unconditional folio_lock to guarantee forward progress.
> > 
> > At least on the hmm path I was able to trigger the EBUSY a couple of times
> > due to concurrent swapout. But the hmm-tests selftest fails immediately
> > instead of retrying.
> 
> My worries with just retrying is that it's very hard to assess whether
> there's a livelock or whether the retry has a good chance of success. As
> an example the ->migrate_to_ram path has some trylocks, and the window
> where all other threads got halfway and then fail the trylock is big
> enough that once you pile up enough threads that spin through there,
> you're stuck forever. Which isn't great.
> 
> So if we could convert at least the first folio_trylock into a plain lock
> then forward progress is obviously assured and there's no need to crawl
> through large chunks of mm/ code to hunt for corner cases where we could
> be too unlucky to ever win the race.
> 
> > > Since
> > > atomics can't cross 4k boundaries (or the hw is just really broken) this
> > > should be enough to avoid being stuck in a livelock. I'm also not seeing
> > > any other reason why a folio_lock shouldn't work here, but then my
> > > understanding of mm/ stuff is really just scratching the surface.
> > > 
> > > I did crawl through all the other code and it looks like everything else
> > > is unconditional locks. So looks all good and I didn't spot anything else
> > > that seemed problematic.
> > > 
> > > Somewhat aside, I do wonder whether we really want to require callers to
> > > hold the mmap lock, or whether with all the work towards lockless fastpath
> > > that shouldn't instead just be an implementation detail.
> > 
> > We might be able to use the VMA lock in the future, but that will require
> > GUP support and a bunch more. Until then, the mm_lock in read mode is
> > required.
> 
> Yup. I also don't think we should try to improve before benchmarks show an
> actual need. It's more about future proofing and making sure mmap_lock
> doesn't leak into driver data structures that I'm worried about. Because
> I've seen some hmm/gpu rfc patches that heavily relied on mmap_lock to
> keep everything correct on the driver side, which is not a clean design.
> 
> > I was not able to convince myself that we'll really need the folio lock, but
> > that's also a separate discussion.
> 
> This is way above my pay understanding of mm/ unfortunately.

I pondered this some more, and I think it's to make sure we get a stable
reading of folio_mapcount() and are not racing with new rmaps being
established. But I also got lost a few times in the maze ...
-Sima

> 
> > > At least for the
> > > gpu hmm code I've seen I've tried to push hard towards a world were the
> > > gpu side does not rely on mmap_read_lock being held at all, to future
> > > proof this all. And currently we only have one caller of
> > > make_device_exclusive_range() so would be simple to do.
> > 
> > We could likely move the mmap_lock into that function, but avoiding it is
> > more effort.
> 
> I didn't mean more than just that, which would make sure drivers at least
> do not rely on mmap_lock being held. That then allows us to switch over to
> vma lock or anything else entirely within mm/ code.
> 
> If we leave it as-is then more drivers accidentally or intentionally will
> rely on this, like I think is the case for ->migrate_to_ram for hmm
> already. And then it's more pain to untangle.
> 
> > In any case, I'll send something out probably tomorrow to fix page
> > migration/swapout of pages with device-exclusive entries and a bunch of
> > other things (THP, interaction with hugetlb, ...).
> 
> Thanks a lot!
> 
> Cheer, Sima
> > 
> > -- 
> > Cheers,
> > 
> > David / dhildenb
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
