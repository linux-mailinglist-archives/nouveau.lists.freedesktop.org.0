Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF91A2B852
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B5210E9F5;
	Fri,  7 Feb 2025 01:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZgvXskYE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B026F10E9AC
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 16:10:34 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso7527645e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738253433; x=1738858233; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
 b=ZgvXskYE3e42mS7ExUvNo6PbWaRzxYeECAyzlT1cOZmO6Ho80/HVdYWNz0letnlxoB
 0eNMIi40R6sd3vV9TfAW2/VH0pgJq+692DveSLil/bxDh/Kkrlur+UYRbuV4jTdK8I6P
 f0fobokyQliyiXFdkzpk+9+bqcxWmo9Ssiw5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738253433; x=1738858233;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
 b=Yx44Jztk73eunPtIL7oZGiLYeTtq7G7yVVoRPJm0jQsa03e4zotZCOIikt/K20lbnl
 JZu1NYulkLT4PAMLp9r4xjRfyoo3GOsrDnxoMEPViZ1WZiiXbHCyauxeQNkxtqiHGu4V
 IDmu273lB7hV+1xo/xsyL3oW9E35o9aNGe3DsswXKGhgiqrmx0Yzi1qt+kXQYpoHcC1T
 rdymFAb2VqSZ8qusp21M89oN8Oz++h5cDi9GtRPcSDHlPb0g4baiHajvWJcxLv5Wkb2P
 O3oKjxF4gsibK+CV3R971cgWarioo1/NTNcwvoMr1xHmg1QQzPcHvbQwV2dOGTb308hq
 7vyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZpsJyaHEp0T4D+kSQQ3o4t56wHR07bY4GY5cMoImanj/1Fi50Bj/8T9xNPaTFTkefHEc+WMoD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVGLPIxUISuy+7e8SD7hjrp+OyvmdeMG04imUraNgq6nFAftKZ
 tLNtDZ1v+htuNeGC5SoC8rC4sG5jlT6Y60UnaohQ6HE56tRM6VF/smT921Rjmgo=
X-Gm-Gg: ASbGncurmeuRNYlLBV0RFkjQsx59+hGuB/7JJAxc9k7i5ogvMudQjNZqIvUQ3fa/kCZ
 eRf0LAJyqiOI/DiOXnjXyWFtaN4RHNX5CA6bXMnW6sdDBn1HNrxJ7mO9wu0tNjZxyEgYA1Isc3o
 B3pqLRnJFHBEZLDtM4V5X3S1pYIXYWbXCukIwCwDSJPrJL7mZlFs20kVUMxDxZUgy6Y1RKo8r7R
 2ogKZcJJh8JEXyx8urtaHiKw3p1v8majDk35dQ8sb0Abniat5rJ7idZSJo8PLEL+43tjYhBe1qs
 COLyJKcNNZCi9MbiWJCEK2ZIo6A=
X-Google-Smtp-Source: AGHT+IHVd4DfU6AaL1PQgWpWv09mvfBE8UJUdITJOwxWpPybeOC1smy7UyEu+/Ad7rIxi3xBtlBrvg==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr81383795e9.5.1738253432989; 
 Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1315esm62266005e9.6.2025.01.30.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Date: Thu, 30 Jan 2025 17:10:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5ukdq6LG2dQKaPU@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
 <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
 <20250130140832.GM5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130140832.GM5556@nvidia.com>
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

On Thu, Jan 30, 2025 at 10:08:32AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 02:06:12PM +0100, Simona Vetter wrote:
> > On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> > > On 30.01.25 11:10, Simona Vetter wrote:
> > > > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > > > 
> > > > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > > > non-present nonswap PTEs.
> > > > > 
> > > > > Before that, could we also have triggered this case with device-private
> > > > > entries? Unlikely.
> > > > 
> > > > Just quick comment on this, I'm still pondering all the other aspects.
> > > > 
> > > > device-private memory is entirely owned by the driver, the core mm isn't
> > > > supposed to touch these beyond migrating it back to system memory in
> > > > do_swap_page. Plus using rmap when the driver asks for invalidating
> > > > mappings as needed.
> > > > 
> > > > So no lru, thp, migration or anything initiated by core mm should ever
> > > > happen on these device private pages. If it does, it'd be a bug.
> > > 
> > > I was not 100% sure about HWPoison handling, that's why I added that
> > > comment. In other regards I agree: reclaim etc. does not apply.
> > 
> > So maybe I'm just entirely lost, but unless you have a coherent
> > interconnect I don't think hwpoisin should get involved with device
> > private memory? And for a coherent interconnect it's just device memory,
> > which isn't treated very special.
> 
> I'm not sure it is meaningful, but in principle a driver could keep
> track of the poisoned private memory using that struct page
> bit. Perhaps in that sense it is more of a driver private flag than
> something the core MM would touch.
> 
> If you have a coherent interconnect then you should not be using
> device private.

Yes on both, that's what I meant.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
