Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA45A21E21
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2025 14:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E6D10E06C;
	Wed, 29 Jan 2025 13:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="XWC0ytNF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1410E09D
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 13:47:59 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-467a3f1e667so41886771cf.0
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738158479; x=1738763279; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
 b=XWC0ytNFtdHYpPu1IhbMjjVcjVyUgdC+oq3yfh6bErdKGIkhBSKV1WZbcFjnYLitBq
 77vYJOuMrPAeHfHUBH/1hwvz/ymG2mAgfy/VnZ+zJomtjXYwmRXiNcHV5eCfZHlfHmuF
 DbPxw7MunzVhnORcMrz9C9ZJG85UwxQ8YSD82wxKJqetlAdunrxfK0qfVCExWdVBh8qG
 plJLTW7bzxji1cvez5oL8T64Ma9sRL9e1bc7+ffw+mUDCwy3gRGPy8ExOTemR+xwB3gC
 6IUhQJxULZPLZ5Pni6PuwkHb9wTgwvAvdPPLoa+Qpz90AheuKrfjNyBBWuAbljqWDs1h
 gEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738158479; x=1738763279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
 b=Vdr22sq1kwzi1VYF4djPNK1fE+8w8gJiNX/e9asW4aE1rz9JfsqhnH/ihsI3FxnIjP
 LraaFWvMJKJesItUrnU8nmwhHaDTSdqFvPEiQ93FXnY+KuoRQPHknuWgllNbK5zuwu5p
 F/5a7K4Zua2HNu6L0jvps3el5q+znBErnVSmz0DSRhvtZnFmYAChbA7qug21PP8UIssU
 FVyvnrsOTWPNi9k3NLmhc0ltwjuOZs592WEA2qsy7+pKXjiQS6jAWEUHsCxETULy1Tb5
 yE8h73mQJRO/iATqjwT6hnjy8IAuOkwcJtXlCfyS/iVV7hGYfQdfkza3qqnGTUNMe4BV
 gd3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBcjG4GjuYLg+oFJHGvgIwdFMLqps+KK2qu8MNNUsTBe3fy+rQLh5E05FwMreZeFGbB3HR1Pa8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpoy7DDZyMc3NREu2Sg/STwL8ncT/TIO87SlBSif9WiCXOSZJL
 yVybk6+kvxdTbYX6Jp8Ai5Pub1Q5FvmehqvoCfvRvGycRtXOGiUDcqQz/6Ym+9Q=
X-Gm-Gg: ASbGncslSXwEF+rr02x90YeWQSiXpG08DJSKZG8GqfMVZatz2pB2HLsx7u2bKjKZ958
 YyfXojvaGxtWN4TaRUY+/RmwsTHn545C4RUwfCjzk0vy7yeA76Z33mztds3T2+s+NAyfdHdxMwY
 Aa5vJt1pKAvYuO/bVKCCSz2b6VIbvc1CH2ATpEeD0NGmbE7SwY/M8kf8NzqA8D8UZ5cGSeCOz96
 V+BEl3LzIyPWF/cjXmlwJf3IdJpK7w6aX1r5tXgBZ/95x/UbpsiKtyuXt+af98eo73u5yYvpuMI
 4Jutdz2NL4FFbc1vuGnfzxm1WhwTiG65AiYvCR/oTf8+5AHnOXYXqJIW1balObqG
X-Google-Smtp-Source: AGHT+IHuYCAk+wYHqjFRDvmI1uuhKYfRXYz+H9jof+ajiAjSs3miFEirWAObJrrIBPKksD6vvP2lVg==
X-Received: by 2002:ac8:5a08:0:b0:46c:782f:5f85 with SMTP id
 d75a77b69052e-46fd0b98596mr53288201cf.52.1738158478735; 
 Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e66b67680sm62281881cf.60.2025.01.29.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1td8Q9-00000009BlF-1by8;
 Wed, 29 Jan 2025 09:47:57 -0400
Date: Wed, 29 Jan 2025 09:47:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250129134757.GA2120662@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
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

On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:

> > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > you hand out any page references it can be changed. I wouldn't be
> > surprised if this is useful to some requirements to build up the
> > private interconnect topology?
> 
> The trouble I'm seeing is device probe and the fundemantal issue that you
> never know when you're done. And so if we entirely rely on pgmap->owner to
> figure out the driver private interconnect topology, that's going to be
> messy. That's why I'm also leaning towards both comparing owners and
> having an additional check whether the interconnect is actually there or
> not yet.

Hoenstely, I'd rather invest more effort into being able to update
owner for those special corner cases than to slow down the fast path
in hmm_range_fault..

The notion is that owner should represent a contiguous region of
connectivity. IMHO you can always create this, but I suppose there
could be corner cases where you need to split/merge owners.

But again, this isn't set in stone, if someone has a better way to
match the private interconnects without going to driver callbacks then
try that too.

I think driver callbacks inside hmm_range_fault should be the last resort..

> You can fake that by doing these checks after hmm_range_fault returned,
> and if you get a bunch of unsuitable pages, toss it back to
> hmm_range_fault asking for an unconditional migration to system memory for
> those. But that's kinda not great and I think goes at least against the
> spirit of how you want to handle pci p2p in step 2 below?

Right, hmm_range_fault should return pages that can be used and you
should not call it twice.

Jason
