Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C43A2B840
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6925C10E9E2;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ObkglLFd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D47C10E3FC
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 17:00:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so2060332f8f.0
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738342852; x=1738947652; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNin4moK4eUBxK3vPAgTMhDUk/P6pM+fAX5RqvxKF3I=;
 b=ObkglLFdVdtKzWkc/c213LmgfhTdv4tYVHP0x9BJOhsaZlC/cqgEgOoQLNUrd/4iVk
 9QNjxpCUzPfAMIKcRgpSPzkjojjAhljwLM3pzDTOqQk0JVROfUQdBL1YNeVpHjdW451G
 /DI/01QDa8XuE34Co/6lEUhklvyvdbCqYk0+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342852; x=1738947652;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aNin4moK4eUBxK3vPAgTMhDUk/P6pM+fAX5RqvxKF3I=;
 b=ugPDmkuD9nnO9hfI0j5pa4kEYgSNzzFqqDPfTwnPEgv1S/j1sjkbBHlonrV0KHg3BK
 z/sBpOnWGJFm6QU9NoLHKuxsbiTKLYER9wib2J3Br+d7w/2D8HcTpf8YQcQXfulC/GZR
 0Qxx+j7aNUuRMcBIykf5o0Jibd1fT5WadKykINgcdj2mDaF3jWzQJPQjectxpkeyL4TW
 D/p/iHw6/Yd832HpJUkPO61gvxkF1YvlepKhFK6x6l5ZY4ZMss2dKb1bpcZoN7CnMp7z
 rQ/4PqwegFDr4oEFjPliGboMehKr9d0YMLcY2PqYP7IEaPJhurPd08jEiEOuOpVjYaDE
 YvuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX45bWMPHF1gwNiorRH57Hw430+HmFU7Evhx5Hc3XThxou+PwHEf/10SMvK+cCVf5PrilIqkf9F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgpaFEx9gCwP8cF+uMTz1KIKOz94VBn/c0ZF0+GvBvV+cGVfN3
 YUnydrrUbZWK45WcvUd3ZB1646WpbzNMYy9Nm18vi4NK3fUT88xmKWyTUc0SDWE=
X-Gm-Gg: ASbGncs5723PGbAYtS9cSHYaBiWl9JkbbHZEFg9t1OKeEFMQTKqcEVlxoRI/aTdqpAf
 C3iWd0TzlTBAKBjYpnfM+NCL4492mYP5YxsR/EVBLFuhsslVXabHbQfCW9AxLxaxYHRp6QhsjH5
 ZIpYH1Doh2fa3IxjmphLBBNpBCQpD2iQcZgp85DLwbKGj1PnQdSeCgSlKEtrFjatO23hykEnVan
 uqdV+2NCagPtmWG2nqg+ESKQ2VIxFXc03RYIS91SZwvIZE9IIfj46xC4Xa1kL3X1ArVVdG1nhzz
 n7pOiUNnThXaj4nAh1FcxxC1zuU=
X-Google-Smtp-Source: AGHT+IG+wK8v3ltoU+dMOZ5Egg+X1fduaSB/k0+6guPHhIiHiZusmikjMEVA/Y4fTi33o54vzPLBkg==
X-Received: by 2002:a05:6000:400b:b0:386:42a6:21f2 with SMTP id
 ffacd0b85a97d-38c5192f4afmr10830620f8f.10.1738342851857; 
 Fri, 31 Jan 2025 09:00:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0eca02sm5194639f8f.12.2025.01.31.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 09:00:51 -0800 (PST)
Date: Fri, 31 Jan 2025 18:00:49 +0100
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
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <Z50BwZSh1rT4LDJS@phenom.ffwll.local>
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
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
 <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
 <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
 <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
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

On Thu, Jan 30, 2025 at 04:59:16PM +0100, David Hildenbrand wrote:
> > > > > > Note that the PTE is
> > > > > > always writable, and we can always create a writable-device-exclusive
> > > > > > entry.
> > > > > > 
> > > > > > With this change, device-exclusive is fully compatible with THPs /
> > > > > > large folios. We still require PMD-sized THPs to get PTE-mapped, and
> > > > > > supporting PMD-mapped THP (without the PTE-remapping) is a different
> > > > > > endeavour that might not be worth it at this point.
> > > > 
> > > > I'm not sure we actually want hugepages for device exclusive, since it has
> > > > an impact on what's allowed and what not. If we only ever do 4k entries
> > > > then userspace can assume that as long atomics are separated by a 4k page
> > > > there's no issue when both the gpu and cpu hammer on them. If we try to
> > > > keep thp entries then suddenly a workload that worked before will result
> > > > in endless ping-pong between gpu and cpu because the separate atomic
> > > > counters (or whatever) now all sit in the same 2m page.
> > > 
> > > Agreed. And the conversion + mapping into the device gets trickier.
> > > 
> > > > 
> > > > So going with thp might result in userspace having to spread out atomics
> > > > even more, which is just wasting memory and not saving any tlb entries
> > > > since often you don't need that many.
> > > > 
> > > > tldr; I think not supporting thp entries for device exclusive is a
> > > > feature, not a bug.
> > > 
> > > So, you agree with my "different endeavour that might not be worth it"
> > > statement?
> > 
> > Yes.
> > 
> > Well I think we should go further and clearly document that we
> > intentionally return split pages. Because it's part of the uapi contract
> > with users of all this.
> 
> Yes, see my reply to patch #3/

Ack.

> > And if someone needs pmd entries for performance or whatever, we need two
> > things:
> > 
> > a) userspace must mmap that memory as hugepage memory, to clearly signal
> > the promise that atomics are split up on hugepage sizes and not just page
> > size
> > 
> > b) we need to extend make_device_exclusive and drivers to handle the
> > hugetlb folio case
> > 
> > I think thp is simply not going to work here, it's impossible (without
> > potentially causing fault storms) to figure out what userspace might want.
> 
> Right, I added a link to this discussion in the patch.

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
