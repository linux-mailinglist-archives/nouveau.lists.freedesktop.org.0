Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B235BA2B83F
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662D610E9DB;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gELzBhjP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D143410E969
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 13:29:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso9135895e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738243764; x=1738848564; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
 b=gELzBhjP5rj9u0V3C3KxvU1RPhE1C3tEK4B5kyz4ACcUljKWwZuFhPZZCPQLF1HiP0
 kWJM6i9nqdm4t5qoLsplKzNKMe9DMJZjYbkfj7r+N18RbSp6UBNpcQKqNz+5anBiCGxl
 yUGtdjXq0LWYngu0zIEFcFCeRp3AyWo37fKMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738243764; x=1738848564;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
 b=ZeppoBjjxLsjOou06/l7WPe2v4G6Doj2yyXioyRrsayI8y+x/PHC5fUbllEUjJD7pT
 rk0xeBTcQEBt8ErAOi7H4JNnZzA4W9EMkkkB6oUZCQ7BbFDWYN9H4TKjvDyEkGRy+LF8
 1CgS5/DX/wj1aJVQ9Z4gbLf6x33H9omvhjLEBE3Br0tmhtn1uGB2AePPRsrmRNrALfLv
 ABaYXLZdZDXSgbO6IeXlOf5b5SC1kpcGD0MmeUJ6ObY2uR+oXqGinTavAxqmcSpkX9qI
 t4rrPIZljVr09PQZfsThu2eTToIH3Q5UkYpkZ67eN9NTY4BVkbFMtbMPlTQxeiHOzoh5
 /csA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzsSYCmHsDmbg9Cq3W+6FRyPX2Y/8TPT9h1gG0AO7OPhijmqCgYiAlUkLzm7MIx6Y7jItAmZDZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNEX8SUmR09R/TorMeHjRFELwd1LZehX+RwnyoTFBpFSIraAT2
 xly8xrXB983UQsWVf82lxqK9kqx1CEKiXVE2gVhQyPE/h6wgI7Zrb42UMX1uvKQ=
X-Gm-Gg: ASbGnctBAz3mCaXGEc+6msV/Pqv/v3ylMFqi9hagLpwCf8EeKnMANT4ld2wUQOWx1h4
 SGqzm0VX019sGjWtJSYN9/EejBM3nukAdavKgfeJPF/Dll3wbt4YXx9NDv8tyXcfFO/SqemIzs9
 krdF3S3/XS5RNSsO6X7381YlH7OFBR//V2Z8DirlujlibhBY99e94FYWm/d33HaGxVVi0PiOVAT
 zRM7Gbpi8LsHNw43slTmRQOlPn0gzg5mb6vMCHjLh2YU6V1f72rb59/gXl2kIi/Nvgs0ELleKh+
 ccbdqJ+3MFHt7AD6c8ZwA+NDdRI=
X-Google-Smtp-Source: AGHT+IHdrFYxzPnGyvPL9diVxB5aO5ood/KWzCJUp9hx1GIy5lqLPzKFdL5gi+Wc6C+yM8JgD/EQ9Q==
X-Received: by 2002:a05:6000:2ce:b0:38c:3eab:2e13 with SMTP id
 ffacd0b85a97d-38c52093f22mr6600046f8f.46.1738243764347; 
 Thu, 30 Jan 2025 05:29:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm2028563f8f.60.2025.01.30.05.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:29:23 -0800 (PST)
Date: Thu, 30 Jan 2025 14:29:20 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
Message-ID: <Z5t-sFymrz5kFafV@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-3-david@redhat.com>
 <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
 <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
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

On Thu, Jan 30, 2025 at 10:28:00AM +0100, David Hildenbrand wrote:
> On 30.01.25 06:34, Alistair Popple wrote:
> > Looking at hmm_test I see that doesn't use the sequence counter to ensure
> > the PTE remains valid whilst it is mapped. I think that is probably wrong, so
> > apologies if that lead you astray.
> 
> Yes, the hmm_test does not completely follow the same model the nouveau
> implementation does; so it might not be completely correct.

But unrelated but just crossed my mind:

I guess another crucial difference is that the hw (probably, not sure)
will restart the fault if we don't repair it to its liking. So the
hmm-test does need some kind of retry loop too somewhere to match that.
But might be good to also still land some of the other improvements
discussed in these threads to make make_device_exclusive a bit more
reliable instead of relying on busy-looping throug the hw fault handler
for everything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
