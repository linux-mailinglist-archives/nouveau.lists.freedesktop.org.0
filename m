Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF3A25DEC
	for <lists+nouveau@lfdr.de>; Mon,  3 Feb 2025 16:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986310E0F4;
	Mon,  3 Feb 2025 15:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BGBI2CnA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051B10E0D8
 for <nouveau@lists.freedesktop.org>; Mon,  3 Feb 2025 15:08:08 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7b6e5c74cb7so371881285a.2
 for <nouveau@lists.freedesktop.org>; Mon, 03 Feb 2025 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738595287; x=1739200087; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VIfqpXWa2saTTZIkeCGgjoPhbUp2hEhSFcQHJJf5WU0=;
 b=BGBI2CnAqg1nrtVPhbjl/uBO/sURhoQ3TaNAzrsqYqBLfwvgvj4sbo1e4cwz3ilIbN
 B3allo2yvmelueVfbnQjkntXwKHVy0OFAlDbNR/a48dk53iLvJO/XNj3e65Z0eoz7Vvo
 dKdHdjO7l+tU98kjipBJbNfMQa11my3BWALLka3VqvOo6BHOIPjr0MDXtQlqpGM7eXPG
 1FfckFkeViDlnjt3r/v8e3VJszwxLwBBCi2y5OqeBxAyCriWXsRIzEqYfiqJ/wjHWhYZ
 beD2cyzBUVSOWTtUib6TKoX8MkjPk2CvV7SX0AO7d1KzxzEVxNUrPL3rFbdrqMVrV3tI
 aBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738595287; x=1739200087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIfqpXWa2saTTZIkeCGgjoPhbUp2hEhSFcQHJJf5WU0=;
 b=aPFfJEuke2r5NaBZxq3GxK+x8fxc34pyJfNt9uuvwIzx12Znw6XMRzKI3v3euZW+Xa
 1YA5thfjfncgE29/bOsS8oZEd4BtJHlgOICFqG+rKVr/hWpZAO6Bops6NMh9yF6GThly
 VTodm96BN0B5Nm415DFz81TiVQYZu8zb+JW3lTSKVFS6ML9GCRo+RQLdrriwjBqjLDry
 cTMAtxtJcNVqHBhG3/5L6S70s65nDahdDIaMDwWp2V3xxoTm/yUmxnJyDVqdqPbkihWb
 7nQ8JoQW52UEbQjVh7MmwkizwNAyHnvURUiO8xEiROh2ZjCXwBOej6PlMkI1SajMPooH
 +4lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+Y3Xwg67+4+0nV5P0v1Vmf3BbZST03OyxoRGYwBKOknekgCkacQLhxiVbHc/A5tenC0IqOBQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ZLxfyr9YX+rDzffanYgAaSEMdUvqDSzSa29KaiPMmIJMSIAE
 zp7GE3auwHEoZJrC6PSu2j7/gVFQbZBmrbT4myBJMcKeMmp10NHL6t4xSbSGuek=
X-Gm-Gg: ASbGncufte9kM5ZB+XX/rP9z09g1LOJZtYxpINVOI+Yzk7Vx8JahxxSd3bWs6J2HQLl
 Iese2qhZ7+sdqkKyrU+mPtNcjiP5Ds7cW9qirxbuTavz9BH3OVHL6Plqj8RXoOmM7hNzrCM3JKv
 P+nhheJr5PIL9VaL/WcYCHZc0GMFisbx44gZ9DWFWeWmYJtjkN6i7/A2smhK2Otty/Spfy77Zxe
 DMuhtwokJvLZzaDW2jwEtYIOvXxF1j9rDeAmXtMwZzDoHa8aTaYAxRuwBe8V+wpOQ==
X-Google-Smtp-Source: AGHT+IH/qa1lrVLcKxozjVl1Axtfg0S5tmpdY0Hz1inHc6vNMg7mQBJDuUSeOKIlGn70ib6W5YOi8A==
X-Received: by 2002:a05:620a:19a8:b0:7b6:c540:9531 with SMTP id
 af79cd13be357-7bffcce8d01mr3518318185a.18.1738595287317; 
 Mon, 03 Feb 2025 07:08:07 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c00a8d1280sm534889985a.45.2025.02.03.07.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 07:08:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tey3R-0000000As1Z-1rVV;
 Mon, 03 Feb 2025 11:08:05 -0400
Date: Mon, 3 Feb 2025 11:08:05 -0400
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
Message-ID: <20250203150805.GC2296753@ziepe.ca>
References: <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
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

On Fri, Jan 31, 2025 at 05:59:26PM +0100, Simona Vetter wrote:

> So one aspect where I don't like the pgmap->owner approach much is that
> it's a big thing to get right, and it feels a bit to me that we don't yet
> know the right questions.

Well, I would say it isn't really complete yet. No driver has yet
attempted to use a private interconnect with these scheme. Probably it
needs more work.

> A bit related is that we'll have to do some driver-specific migration
> after hmm_range_fault anyway for allocation policies. With coherent
> interconnect that'd be up to numactl, but for driver private it's all up
> to the driver. And once we have that, we can also migrate memory around
> that's misplaced for functional and not just performance reasons.

Are you sure? This doesn't seem to what any hmm_range_fault() user
should be doing. hmm_range_fault() is to help mirror the page table
to a secondary, that is all. Migration policy shouldn't be part of it,
just mirroring doesn't necessarily mean any access was performed, for
instance.

And mirroring doesn't track any access done by non-faulting cases either.

> The plan I discussed with Thomas a while back at least for gpus was to
> have that as a drm_devpagemap library, 

I would not be happy to see this. Please improve pagemap directly if
you think you need more things.

> which would have a common owner (or
> maybe per driver or so as Thomas suggested). 

Neither really match the expected design here. The owner should be
entirely based on reachability. Devices that cannot reach each other
directly should have different owners.

> But upfront speccing all this out doesn't seem like a good idea to,
> because I honestly don't know what we all need.

This is why it is currently just void *owner  :)

Jason
