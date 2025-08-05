Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F5B1B5E5
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 16:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2FE10E22D;
	Tue,  5 Aug 2025 14:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="RSx1ldD1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9310E276
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 14:09:28 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so31881431cf.0
 for <nouveau@lists.freedesktop.org>; Tue, 05 Aug 2025 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1754402967; x=1755007767; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uzAYIR/shPSYacUrOQJo0K9+jh4P0UFNjUkTluGngLM=;
 b=RSx1ldD1zI2ZDlYuF6Ugnz0fGbwUYM3adITZFVEiU9lekvpprDe0OypwTwKOv92AC6
 +fzAbOMRIoRjPdH8t+1cUIem5XbQdUxIBiB1mVZ4003znfGi9QR9nFrgS96/wkmV7ufO
 wCuWAH6qPqiDBdJULrHfaXuUoPd7nPSdVdzsoyzWM7DcEh2crS+YYEuUVNQf4lUPIt+a
 lVKZZbNIpfwk3YkTCtGUEbv+pmyYc31vo9/+jGXPrywDKlul8Wy7V4mHrT1qJxYHZcqv
 pWYJxFJYcCLlwdhVNKm+1rGJ+Mn2MutJrb0nceaGy14ECdaLnSGaFXRHved1kuJcOgKW
 78OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754402967; x=1755007767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzAYIR/shPSYacUrOQJo0K9+jh4P0UFNjUkTluGngLM=;
 b=M66jI2UFYRQD3c1Gc2o2xWfHQffHCkdo93gcaEa1lnICMI9Hz8krI3YwaZerAHdbeT
 pLF49wBkbHS7tDO6TGfyUlvz/e3G4f+ZqMSbqG25nQt46aw0n/iOemT4uyef50hhSFRw
 wDXq/buLFJIyq2vN2a+yVMicgVh6uY+Jgrot1k4H/c4wQctMjjZJE+YXoJmNt5Uh12r3
 ++agNtOBueRKx+YOVrW31K4vwgjrzyYkg4YT1Z1IUowhDrdA830kREyIevSaMU6aVPF6
 QnouiWXpay3/6TX5e6vHFbzBmILYLIvmfVu11pHgo+2bTy2INcQGbsU/Gbyj3hqEO95X
 7nAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiJRpGtAQgXM8JIiP323dPdRekr6sBysUwdZ8d0tQoOLlRmvIP269MvLxaAQLr9AHHQwblRsrU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz266xYO2wHKVLOKouKcBk8mWAH4pIPJWOpGVOMUK/wxXZz1dgN
 i4B8RgxYRA/yTj39cnWXkvQbJrWibbUOWjY4plhH0qkjBclPOuOf/WzAGhmKvM3CO5c=
X-Gm-Gg: ASbGncv/ulZ144z3iXxh2+GuSvkaJ6sFOskw8MPjrFRL1lv8wKpFXYhDlyBbzNguqg1
 mRjYXDKWhlBrKlAKwvmNEIWbpW8uLcLK3n0fgTfC7c1kGz5sgca2ZE4ClPBWNRjxR1TofU06wam
 UZH2c2kZbz6ubzznE9vgmvmo9BBU9d/c3QczRIStkzhsvMvwSJMreAz0VyRi5MUrNtsRx0qhLIO
 D2sRD9jj1eAPZi7cw7Z5D2TZBXbHpDQv8GxkqIr2nbHvYvt9rDtvSZ31PS6Gr3MfZ/TUvYQU2fk
 SLcuNU9U+DsAcnyadyTf6sazZGq/KAz08JByKV8y0IGTaW29SoVZCSLs2PMOtW2O5TR+BQVodo7
 NVoI88SFwR3XbjGaoEy3IMnR+kzIrFLckvm9o2+oUvPRnMZafy1bZKxzYC7O0HUMVCAh3O+Q638
 QtP1k=
X-Google-Smtp-Source: AGHT+IHL+J4sqP2SxcyYA/bm344OksrCpi3leJPwTfOOG1s5eCheuA6YOXSpbD6tw1CHk8ksExeFwQ==
X-Received: by 2002:a05:622a:4a14:b0:4a9:a3ff:28bb with SMTP id
 d75a77b69052e-4af10a1abd0mr240543491cf.25.1754402967223; 
 Tue, 05 Aug 2025 07:09:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4aeeed669c0sm65687951cf.33.2025.08.05.07.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:09:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1ujIM1-00000001XVj-3WEg;
 Tue, 05 Aug 2025 11:09:25 -0300
Date: Tue, 5 Aug 2025 11:09:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250805140925.GO26511@ziepe.ca>
References: <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
 <20250801164058.GD26511@ziepe.ca>
 <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
 <20250801165749.GF26511@ziepe.ca>
 <vscps6igy42u5limiigiok6y35mjx6acawi3qmvzbrpvltp4qp@mkydml7lz6fu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vscps6igy42u5limiigiok6y35mjx6acawi3qmvzbrpvltp4qp@mkydml7lz6fu>
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

On Mon, Aug 04, 2025 at 11:51:38AM +1000, Alistair Popple wrote:
> On Fri, Aug 01, 2025 at 01:57:49PM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 01, 2025 at 06:50:18PM +0200, David Hildenbrand wrote:
> > > On 01.08.25 18:40, Jason Gunthorpe wrote:
> > > > On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:
> > > > 
> > > > > The only issue would be if there were generic code paths that somehow have a
> > > > > raw pfn obtained from neither a page-table walk or struct page. My assumption
> > > > > (yet to be proven/tested) is that these paths don't exist.
> > > > 
> > > > hmm does it, it encodes the device private into a pfn and expects the
> > > > caller to do pfn to page.
> 
> What callers need to do pfn to page when finding a device private pfn via
> hmm_range_fault()? GPU drivers don't, they tend just to use the pfn as an offset
> from the start of the pgmap to find whatever data structure they are using to
> track device memory allocations.

All drivers today must. You have no idea if the PFN returned is a
private or CPU page. The only way to know is to check the struct page
type, by looking inside the struct page.

> So other than adding a HMM_PFN flag to say this is really a device index I don't
> see too many issues here.

Christoph suggested exactly this, and it would solve the issue. Seems
quite easy too. Let's do it.

Jason
