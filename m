Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487EA2B850
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8762610E9ED;
	Fri,  7 Feb 2025 01:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MFygSdqp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164510E0A7
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 20:15:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43618283d48so43696335e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 12:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738095303; x=1738700103; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jfne+1E0DxYE+tkkNd2LaEnYSrvpDi+VKE9gDmVZgHA=;
 b=MFygSdqpIijHPGp8JAYr+hxuDLZbB71vrNijwnE7Lb9H/z8HIjzw4So2gnt4+7QB3o
 JWZXlvJnhe+jXy5c+9xWrzMvWj2kWIMRXOYfkqTSi7CGVmDg4OH2NnQdu/fajcZ3L/6b
 Vw5d/b62P9JbfTFfh+bcqYHS48Wlis3csC9Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738095303; x=1738700103;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jfne+1E0DxYE+tkkNd2LaEnYSrvpDi+VKE9gDmVZgHA=;
 b=sRSkEPwWABH5yre1lbgpJI/kl8I5JFxBRRm+9XKFsFVrlQtVh3a3AYpmhF++7PlMy9
 mJhmVu9d1TjblZtbwKPYzQFcej6ceoHQW3mQ7TEQSky0g8i56xjPeGJjPJXTG9v+jGsT
 sbqlC/UebbsY2C9d9rd6XHQCuC/mzjC59ZrvtDBX4VIiGZH7Zhl/NZhbCGJMARNJMuuE
 g9rZCGOYAeUngE3QKoJM7FElRZCdk+8LSsv3w2BfDMF5BX/ki7YriIA+Pkiki0S9lWlw
 3ZxHGqBBxNQ+Zo6uzAUWuESaNW2Swgpzta6Gf7K7sTiGgn0OHuiR148otCu21F9tIZnE
 nLjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3JqwvTK1qn42rR4+03/ieJmPeAZBZS+M7C9NhfafVgsHgovfuVCnRCntcF2zB1y6DIVKdh2O9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5DMJDZSvKzcJSbw7GQjQC0wcPgvUrdMUqpeG1y4kRnoqQjank
 sxZ/X534O9/vma4TuRIwJtyoL1HMeQ8aVGXHkQHp0ZUMJNUO6sNYMkfO7J8k68A=
X-Gm-Gg: ASbGncsKU0jW5QDAHUmKK6E466blEmi+LGC0rgTN7EEU0SGerRGvL1PL6M+s8sUbwWL
 jHlFdLevyzuyOvxCBgoTcu/0la7pz3Bl6NnSzZZJmChA8VKoICP6E78Qtqw0BNgwh0dmZoYACaS
 jzneMQeoCCUNJSgf8lPpDXhkB24SXWjKFxxJG/c0Kp3GJ57PyeSwjWVE+5KGDWpJsxIlAGyvroB
 Hu7oSdtpVbRGz6SWZlshEXLjWJLpGi0rE32YEPdCBM240oPvbNY9m4MFP5DtV1FJuYNy9o/qfqL
 7qrSpN6toV0XSrJ3VDErN+xqR6I=
X-Google-Smtp-Source: AGHT+IFCpJVPpO9rfXvd1jMOU5Y8GXvqZMpsBrMYN7aXsmHR2MRFFuNi1zjP08VspD+cMw3VvnJFqQ==
X-Received: by 2002:a05:600c:1f18:b0:436:1b08:4c78 with SMTP id
 5b1f17b1804b1-438dc43093cmr2810575e9.31.1738095302513; 
 Tue, 28 Jan 2025 12:15:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176490sm14733002f8f.1.2025.01.28.12.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 12:15:01 -0800 (PST)
Date: Tue, 28 Jan 2025 21:14:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@redhat.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
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

On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
> On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
> > > > > On integrated the gpu is tied into the coherency
> > > > > fabric, so there it's not needed.
> > > > > 
> > > > > I think the more fundamental question with both this function here and
> > > > > with forced migration to device memory is that there's no guarantee it
> > > > > will work out.
> > > > 
> > > > Yes, in particular with device-exclusive, it doesn't really work with THP
> > > > and is only limited to anonymous memory. I have patches to at least make it
> > > > work reliably with THP.
> > > 
> > > I should have crawled through the implementation first before replying.
> > > Since it only looks at folio_mapcount() make_device_exclusive() should at
> > > least in theory work reliably on anon memory, and not be impacted by
> > > elevated refcounts due to migration/ksm/thp/whatever.
> > 
> > Yes, there is -- in theory -- nothing blocking the conversion except the
> > folio lock. That's different than page migration.
> 
> Indeed - this was the entire motivation for make_device_exclusive() - that we
> needed a way to reliably exclude CPU access that couldn't be blocked in the same
> way page migration can (otherwise we could have just migrated to a device page,
> even if that may have added unwanted overhead).

The folio_trylock worries me a bit. I guess this is to avoid deadlocks
when locking multiple folios, but I think at least on the first one we
need an unconditional folio_lock to guarantee forward progress. Since
atomics can't cross 4k boundaries (or the hw is just really broken) this
should be enough to avoid being stuck in a livelock. I'm also not seeing
any other reason why a folio_lock shouldn't work here, but then my
understanding of mm/ stuff is really just scratching the surface.

I did crawl through all the other code and it looks like everything else
is unconditional locks. So looks all good and I didn't spot anything else
that seemed problematic.

Somewhat aside, I do wonder whether we really want to require callers to
hold the mmap lock, or whether with all the work towards lockless fastpath
that shouldn't instead just be an implementation detail. At least for the
gpu hmm code I've seen I've tried to push hard towards a world were the
gpu side does not rely on mmap_read_lock being held at all, to future
proof this all. And currently we only have one caller of
make_device_exclusive_range() so would be simple to do.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
