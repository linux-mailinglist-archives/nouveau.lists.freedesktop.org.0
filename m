Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD2A20F84
	for <lists+nouveau@lfdr.de>; Tue, 28 Jan 2025 18:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718110E0E4;
	Tue, 28 Jan 2025 17:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Arfb5DgB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7010E6DF
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 17:21:25 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6d8e8cb8605so30447116d6.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jan 2025 09:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738084884; x=1738689684; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WQb9VqqmKpGrKRk3ww/ULOiy6hcfV9wcFh+Cwya87Xc=;
 b=Arfb5DgBAMrX0nRdBzXD9pLpgjpqxo6fG8KrGPuxj//hfgWj1ooRaFFb8RTuxapdD+
 QkUHTVwyN8RkT5dCQ5fuPIXLe1FILzuxSFyFnRO1T5p6ie6EEnarWUHIBt7qwl0vBNsi
 /m0RSvQ8QVW2lWEg0JbU6YiFdEjA0/y6nE6D9pbAiahdCMpGgL+qGdGAMHP61vMMIkNT
 2t4DjOr76Ncy1uMeWkhh6aXV/RvC61+Me5q4Mjb/i7uwIPOMaj2O2HnpmZUboJ/135pV
 dulE52b00pJov+QUOGSbpJeOjIrkLagI+flr8G/A0oFGXQ8NSn5dnxVJeku829hw3DtN
 sZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738084884; x=1738689684;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQb9VqqmKpGrKRk3ww/ULOiy6hcfV9wcFh+Cwya87Xc=;
 b=BvCiS4Aw/ktHLJXFN+WTJqQrvAwFndELaalNtcW+CUvayxMBjOWJz8FhxsytSb97B4
 HFRp2ibNgkN4+LPKfzK0p26b4UVHmwhKVZlu3tyATFUaxcC2efw/9Tu6j8SNqVmZTUSi
 /h44CjhiI1IVC55Xgeays1wDbVvV+WF2JDM7LE0uUHRRj7p5RgwJLgUqj6cz4lif/qXA
 0cOiZWG4l+etupLXyNAQivH/8n0nzAX3Z6GN52DMlgJxkPSA2h2hJSEvnv5q4TbtzfhK
 F43recRCVrSsy5OONPDF/8UArKOLFp7k1Hxz8b6FmqYgFUoJJVi2ulQ0ZwRzuWzO9k9H
 c+gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQRoUDct/qDq4MbwPIyZOq4gcJAXxZR94AK/0rqYv1ke465aOy+Yet3B85KQIsKB7zwzdR0umv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiYfHA/XSWorSbWd37K5ZdEiubxBAWQf0LXFI+lSl2cnbWJuVZ
 4eRR1eu17XozU/QUSN4xOnFkUVX9ogHmOa6jyE8Kk2M5Qh57YWcHu+l+r2s7ILU=
X-Gm-Gg: ASbGnct+wYMs5Z8jMKgdvbdrRuQEo4sQY+v5aGwglG+Vy4bDg3z0QO1XKxVfcitzxrG
 9h5xKWP0fGCIHwzt9nHoJwf3goCGs7RDo/tiNiiwwseU0+zZCHaxXa9mcCXNDXSFmJbQpyzJ5HS
 PQ17GotMTnuzQkUWJoUjW8fAO2WkgoQ39WBukIIXdAM3geiFRPpio6TSki3BRNSPvd6be6x5YV1
 gn2ylnqSw63yxD1XIaQXx3Ifz4InorsLYQjDpiLEtCYXy6nNfF2aO5fEeRGPUFIr0liDsUW5SSq
 V8iLrFVCtyo5LvnOB51D3UG+sqPFhUah59R2aKPky8kS3jUmgNzdqghQ1uMQiHLV
X-Google-Smtp-Source: AGHT+IFAz/5UyS+F0PBK9pFt62lYn0eXOpLs0OowxWjeV7IrxMQsEK70VEddYKwgKGQF4XA2ZTXc8w==
X-Received: by 2002:a05:6214:260a:b0:6d8:8a60:ef2c with SMTP id
 6a1803df08f44-6e1b2140cadmr656249486d6.2.1738084884552; 
 Tue, 28 Jan 2025 09:21:24 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2057a8ab6sm47105096d6.81.2025.01.28.09.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:21:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tcpH9-00000007f7z-2OLv;
 Tue, 28 Jan 2025 13:21:23 -0400
Date: Tue, 28 Jan 2025 13:21:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250128172123.GD1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
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

On Tue, Jan 28, 2025 at 05:32:23PM +0100, Thomas Hellström wrote:
> > This series supports three case:
> > 
> >  1) pgmap->owner == range->dev_private_owner
> >     This is "driver private fast interconnect" in this case HMM
> > should
> >     immediately return the page. The calling driver understands the
> >     private parts of the pgmap and computes the private interconnect
> >     address.
> > 
> >     This requires organizing your driver so that all private
> >     interconnect has the same pgmap->owner.
> 
> Yes, although that makes this map static, since pgmap->owner has to be
> set at pgmap creation time. and we were during initial discussions
> looking at something dynamic here. However I think we can probably do
> with a per-driver owner for now and get back if that's not sufficient.

The pgmap->owner doesn't *have* to fixed, certainly during early boot before
you hand out any page references it can be changed. I wouldn't be
surprised if this is useful to some requirements to build up the
private interconnect topology?

> >  2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
> >     The exporting driver has the option to return a P2P struct page
> >     that can be used for PCI P2P without any migration. In a PCI GPU
> >     context this means the GPU has mapped its local memory to a PCI
> >     address. The assumption is that P2P always works and so this
> >     address can be DMA'd from.
> 
> So do I understand it correctly, that the driver then needs to set up
> one device_private struct page and one pcie_p2p struct page for each
> page of device memory participating in this way?

Yes, for now. I hope to remove the p2p page eventually.

> > If you are just talking about your private multi-path, then that is
> > already handled..
> 
> No, the issue I'm having with this is really why would
> hmm_range_fault() need the new pfn when it could easily be obtained
> from the device-private pfn by the hmm_range_fault() caller? 

That isn't the API of HMM, the caller uses hmm to get PFNs it can use.

Deliberately returning PFNs the caller cannot use is nonsensical to
it's purpose :)

> So anyway what we'll do is to try to use an interconnect-common owner
> for now and revisit the problem if that's not sufficient so we can come
> up with an acceptable solution.

That is the intention for sure. The idea was that the drivers under
the private pages would somehow generate unique owners for shared
private interconnect segments.

I wouldn't say this is the end all of the idea, if there are better
ways to handle accepting private pages they can certainly be
explored..

Jason
