Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522FA2B857
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55C10EA02;
	Fri,  7 Feb 2025 01:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="YMQTrhfM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126D510E33D
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 13:03:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so5473755e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 05:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738242225; x=1738847025; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
 b=YMQTrhfMuIouZkAQ1kn8DwNTuu+DeQVuzd4roQ51G2X4qImkqcMaSgrdSoZPY4wbmA
 GHkFaxCn7EJI4xT0a8hFFbEG9WpmLU8Q2sK4GVa09/Y8uRovMLwdmldnswgA4+w1HFYL
 zR1quM9jptSjivmvTKVnof8T5A+2eXsBgBnr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738242225; x=1738847025;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
 b=JDMo9LENG1k+/hvGXRRw3wl4PU3TUs7fUs2fsRAm3jmF/cWFopm6fTRuv986lL/2D3
 HIU4CJ4QMrJB11o5oorqlsaYqRVJAvAlUsYHC9UhbZnEDrTbcqV+AVFGYS9icd6z35m0
 C6dPV6vf6CqM2u0H+k8gXtuL359cDY9HmTjdEhO5VkniPufdEhgAZYIlKp6WyCxfObGg
 2I6zSa4OShxiRVwVxZu8o5hPJX8+ttiQhcrWiqClfMFoAYyoach/Mib5M0utc9thFfTo
 r45zFzuK/1TSsUeQ/b/wX5KK5+vo77TesWRSYnS4RV+c6OCz8Q7URZB679N8mFzSwprZ
 c4Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV33xC/oHad2VsMKyFrbbLjRwOhNNTnjac3gIodXUmjjwp25LzExV1+JEtz7uqB87rGzd9wiaRX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz3YnoL0LHnm5WpptuOUOL6VuzLKD9xNI0pUJ2nI32Qn43tIAb
 KVxwyktZuZSwAqi+BMYmDu8lObanCQzVNN4PzwNrGV2vmzsY58XCrfn9GEbMVrE=
X-Gm-Gg: ASbGncsT/dLbLL3xYh5Zc8ZWC3xp3e6qxhoqu/+h+vgEN+XfaZ5GXtZGNj1VST13L2l
 Z5fHWxl4wUBMb7maZv83O3/QhqqLsNtp0xvior8wvM5V1hdvWsCUu8l/GZ56JDKKrnNboInZd/R
 Imwbt1+TYPGVIUIRDtO5uF1xs69KpWjIcdKpxuQ/QRSY1r1hRh44U4SSZhSTNMKJTIi7SpZ+MEb
 vOktSTbpi3LloiFl1NYEpQO9+LFZqDNxXEYBd4mXgD6CQ0gL0AKn30yoyi9L4WkWqiTc/ek7Grl
 VkoJW77dXnUl4h0Nmd3KcKJvJUQ=
X-Google-Smtp-Source: AGHT+IHJ4PQVE5HpkzCPzrNWq8zl2Gl6Pk4aDkS8eqlkDUfbDlT8A12K1IbiCiXTus+F/gF8+q2ayQ==
X-Received: by 2002:a5d:64ad:0:b0:38b:ecec:8576 with SMTP id
 ffacd0b85a97d-38c5167b5bfmr7295312f8f.0.1738242225257; 
 Thu, 30 Jan 2025 05:03:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm59239255e9.8.2025.01.30.05.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:03:44 -0800 (PST)
Date: Thu, 30 Jan 2025 14:03:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
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

On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:51, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > can_change_pte_writable().
> > > 
> > > Set the PTE only dirty if the folio is dirty: we might not
> > > necessarily have a write access, and setting the PTE writable doesn't
> > > require setting the PTE dirty.
> > 
> > Not sure whether there's much difference in practice, since a device
> > exclusive access means a write, so the folio better be dirty (unless we
> > aborted halfway through). But then I couldn't find the code in nouveau to
> > do that, so now I'm confused.
> 
> That confused me as well. Requiring the PTE to be writable does not imply
> that it is dirty.
> 
> So something must either set the PTE or the folio dirty.

Yeah I'm not finding that something.

> ( In practice, most anonymous folios are dirty most of the time ... )

And yup that's why I think it hasn't blown up yet.

> If we assume that "device-exclusive entries" are always dirty, then it
> doesn't make sense to set the folio dirty when creating device-exclusive
> entries. We'd always have to set the PTE dirty when restoring the exclusive
> pte.

I do agree with your change, I think it's correct to put this
responsibility onto drivers. It's just that nouveau seems to not be
entirely correct.

And thinking about this I have vague memories that I've discussed the case
of the missing folio_set_dirty in noveau hmm code before, maybe with
Alistair. But quick search in archives didn't turn up anything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
