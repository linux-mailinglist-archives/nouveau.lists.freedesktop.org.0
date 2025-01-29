Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC5A2B844
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7441A10E9E4;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kd+hbita";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6681010E09D
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 13:39:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso48808275e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2025 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738157942; x=1738762742; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
 b=Kd+hbitaPFwi3dfoMSBaIgNshfGno/ktIfsEHAbKD1KU+hllXiRucOo2SixWF4lIdl
 uxVACD6pjZEzr8FdF1zOYM3fO8Ed57cC1tNFEqK2roBdqnZzi3AQzOZBfPKv1kB11Yt5
 4fNH0kY3GfOTu9pyoiLQFdOAeOGpn7IDnYZXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738157942; x=1738762742;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
 b=Rl66u8v+377RWn7YyokpoRCCTlEL3o81oBc6EcO8ERN3jVEOorMUD/9QRxbn2ejYUw
 Vt+XflO6oKs0aLHCJJ7OH7R7EtaXVT64VNZpLkzJGpkO2L1k6QVv2WzGT5s4baeO7yHf
 sAlTLjJlptzEOQjt+g1OELo65aXZyneQhldIWdZ+1keCcXz2f4qsiireFXqgsUNO+zf3
 YI0TeaAMy02+41VToAltCKTNcd2lcHbrek+9mj2R5lOtVN2itegsJPgoWz8iRhHadihV
 lZkCKh6YaTzel719P0bnFHHVgxY4/NWPvA7NLOc00TykTHm1aFF9v59RAPK80EW+LxxD
 uwKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQQMjlU+t3S1UWJQYJoM/gAzDY3YR3t6DWsZ0lCQorFqvA6fXk83DbKZk1nCYueL9KZIfZFQ0L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzOQOlaPVQHtPeZIaKjU//oxbXNSa/OPLm7iyG6EtdjAM1YS+b
 Fd5A0Y16aTihWtVfNv/jdqeRZG1k5zXMJSl7imzKogaa4lK3SGglZ0fsIciETfI=
X-Gm-Gg: ASbGncusb18jUkbnOVdDCZBBjlEh3hdz6c7mxhHLry5bfRwglzpC5q3Coi40x9KFZBS
 KacFyojQe216btP1/9+LB9Hc5M/jfQzRkDlH73IIPIFe36N7DQq5gCfWyz4ciX92tP0QMovSfww
 zJqQ94bEEF1xODNDrZRrccjMgThlGnpnHKhuJ0pQ+cvfrBEYAi62r3+R/fzuAuqWoKZ+t6SBtiT
 3CUGbo/eX7uVYX2QfgTFp1NLv1pbgH262wHCYz+ny8eOWY4AoMGM4ejZhyQdv7Or65ql1rdxhDD
 XThSst8K6M9zTj5nILRPuwMoUEo=
X-Google-Smtp-Source: AGHT+IFp40yYl/FrcEC18d1HA1Wbr1YBHRju+Twtn7vgv1BIenNhcb0w0RrYUn5K84MH3BCfQBYGmw==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr30211795e9.5.1738157942387; 
 Wed, 29 Jan 2025 05:39:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc263f0sm23501465e9.9.2025.01.29.05.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 05:39:01 -0800 (PST)
Date: Wed, 29 Jan 2025 14:38:58 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128172123.GD1524382@ziepe.ca>
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

On Tue, Jan 28, 2025 at 01:21:23PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 28, 2025 at 05:32:23PM +0100, Thomas Hellström wrote:
> > > This series supports three case:
> > > 
> > >  1) pgmap->owner == range->dev_private_owner
> > >     This is "driver private fast interconnect" in this case HMM
> > > should
> > >     immediately return the page. The calling driver understands the
> > >     private parts of the pgmap and computes the private interconnect
> > >     address.
> > > 
> > >     This requires organizing your driver so that all private
> > >     interconnect has the same pgmap->owner.
> > 
> > Yes, although that makes this map static, since pgmap->owner has to be
> > set at pgmap creation time. and we were during initial discussions
> > looking at something dynamic here. However I think we can probably do
> > with a per-driver owner for now and get back if that's not sufficient.
> 
> The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> you hand out any page references it can be changed. I wouldn't be
> surprised if this is useful to some requirements to build up the
> private interconnect topology?

The trouble I'm seeing is device probe and the fundemantal issue that you
never know when you're done. And so if we entirely rely on pgmap->owner to
figure out the driver private interconnect topology, that's going to be
messy. That's why I'm also leaning towards both comparing owners and
having an additional check whether the interconnect is actually there or
not yet.

You can fake that by doing these checks after hmm_range_fault returned,
and if you get a bunch of unsuitable pages, toss it back to
hmm_range_fault asking for an unconditional migration to system memory for
those. But that's kinda not great and I think goes at least against the
spirit of how you want to handle pci p2p in step 2 below?

Cheers, Sima

> > >  2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
> > >     The exporting driver has the option to return a P2P struct page
> > >     that can be used for PCI P2P without any migration. In a PCI GPU
> > >     context this means the GPU has mapped its local memory to a PCI
> > >     address. The assumption is that P2P always works and so this
> > >     address can be DMA'd from.
> > 
> > So do I understand it correctly, that the driver then needs to set up
> > one device_private struct page and one pcie_p2p struct page for each
> > page of device memory participating in this way?
> 
> Yes, for now. I hope to remove the p2p page eventually.
> 
> > > If you are just talking about your private multi-path, then that is
> > > already handled..
> > 
> > No, the issue I'm having with this is really why would
> > hmm_range_fault() need the new pfn when it could easily be obtained
> > from the device-private pfn by the hmm_range_fault() caller? 
> 
> That isn't the API of HMM, the caller uses hmm to get PFNs it can use.
> 
> Deliberately returning PFNs the caller cannot use is nonsensical to
> it's purpose :)
> 
> > So anyway what we'll do is to try to use an interconnect-common owner
> > for now and revisit the problem if that's not sufficient so we can come
> > up with an acceptable solution.
> 
> That is the intention for sure. The idea was that the drivers under
> the private pages would somehow generate unique owners for shared
> private interconnect segments.
> 
> I wouldn't say this is the end all of the idea, if there are better
> ways to handle accepting private pages they can certainly be
> explored..
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
