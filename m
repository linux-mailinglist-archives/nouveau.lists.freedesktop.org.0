Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334DA272BB
	for <lists+nouveau@lfdr.de>; Tue,  4 Feb 2025 14:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8A810E64C;
	Tue,  4 Feb 2025 13:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="D/DJmxfm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E78B10E64C
 for <nouveau@lists.freedesktop.org>; Tue,  4 Feb 2025 13:26:17 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e41e18137bso12802846d6.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Feb 2025 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738675576; x=1739280376; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
 b=D/DJmxfmOqDE6SolU0VhraPAa8rML326gKhetO7LOgVWW6QJuWN0+RDwQe1NlpXlVp
 gCZO3coL5NFx0np5yhyX+FHyMbVJjvzaxZBYLEGjSECedY/mqWhgCAxTbqgq0tmiy3yt
 CPWpXnT1g1SW7eyl3QgxYDpjV4IiYs8z9QU5X1PVQUVVZKJDQ5X4Dwnfi+Cr3bM6uNq7
 YHOfb6rQSdfAhlhBhQKFT6mNZCnHaJkBFHKMsRX13KVCrsfsmCHDs2s6dvhZtpAP0xMC
 XwapmzoB6jSL3QoK7FmSv4iy0gc0QV5Sn8/NsRS9wYJos06lS7ImVuu2egoQ86e7SPhP
 Ao5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738675576; x=1739280376;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
 b=a6NzcH1fa5OshLUWDh0b0nt/HngJadEqNzGK1BcMwYjnOARowb+mRPOw0oEjoIgiz4
 QHROpcG/4bv6cFu0qbe1QjtYpHr8HftVwJ8QOd8ivhldLe/QeO9Vgl7CPb68CLPJmzrP
 e/TjWkcMtZA3XXiBubZ1+qni+Qeb7k+vIOcx/NKBELRzVxKfxFkPWGNHxcLBp1fuif02
 4lrqnBDWUabd5A+Gh5K89popV7OlHrqx158uA+nhZh1BDKdgIJZXh8Dvgd9UMjPslPPY
 4eXC+PpIhBiy9ApJv2lS2Bu9LEQ0XmpOnej1t/zDH34tza0eaz5SuAU316z7abe2TmPf
 rvQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3rXtI6IYPS+oww4rjUPGnQxLrraGT1lwBoAHRd/mzkCVWGo+zjlhcNQ2xa9DskY5VEwBo+r8s@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO+70GJEsBp4XGyI7FKA3/ND3EuBq7aiuJ/MmDxzl5w2wBKSDG
 LnDb8i7gpmci8cdNANdf6uSsj1PQT0ev5uZ43dCcFfWRmnxHGEda7LKGJb7aDJs=
X-Gm-Gg: ASbGncsv2dmnIQkyHChIWbVsrRHYw5UO0xd3cDj+JWOvgZYf+foGobFd6oXm/LodeAU
 OaiV+/rBbS6gBKL/tJnmhYs3kWnmpWOHZZRETDGzgp/1ea5Q0IuxC4FWXJ1fpUUkR3cpYS9jYSH
 bY3hzrlwjoXJ1Qg/Fl67LFER2OgSmmfY6dfeDaroLU0uLtLMlhl8tbIauj0Hf47XfteWXALpWqA
 wFeSvoaHpjEb14iYzG9MC2NdcqGtUuMOaPXNpurotCZilyfh/6C16jMCAWXToBMP8dFIXnrN/fP
 67GwB0pEPtfCPYrx0sIfgX8sr8sY+9shab+KmVrfL4II1Tg8JKeeIhFBf6zQv3UC
X-Google-Smtp-Source: AGHT+IHlCOKBY+zoBFq/ioLTJPh7bDGQBSV2BY/QCHd0dQL9OkhFoX4vLeuIVKLlvifCm+9qEIE5+w==
X-Received: by 2002:a05:6214:5d87:b0:6d8:a5da:3aba with SMTP id
 6a1803df08f44-6e243c3b07amr371097016d6.20.1738675576494; 
 Tue, 04 Feb 2025 05:26:16 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e254814d1esm61954386d6.38.2025.02.04.05.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 05:26:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tfIwR-0000000BRNQ-1pE0;
 Tue, 04 Feb 2025 09:26:15 -0400
Date: Tue, 4 Feb 2025 09:26:15 -0400
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
Message-ID: <20250204132615.GI2296753@ziepe.ca>
References: <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
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

On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > I would not be happy to see this. Please improve pagemap directly if
> > you think you need more things.
> 
> These are mainly helpers to migrate and populate a range of cpu memory
> space (struct mm_struct) with GPU device_private memory, migrate to
> system on gpu memory shortage and implement the migrate_to_vram pagemap
> op, tied to gpu device memory allocations, so I don't think there is
> anything we should be exposing at the dev_pagemap level at this point?

Maybe that belongs in mm/hmm then?

> > Neither really match the expected design here. The owner should be
> > entirely based on reachability. Devices that cannot reach each other
> > directly should have different owners.
> 
> Actually what I'm putting together is a small helper to allocate and
> assign an "owner" based on devices that are previously registered to a
> "registry". The caller has to indicate using a callback function for
> each struct device pair whether there is a fast interconnect available,
> and this is expected to be done at pagemap creation time, so I think
> this aligns with the above. Initially a "registry" (which is a list of
> device-owner pairs) will be driver-local, but could easily have a wider
> scope.

Yeah, that seems like a workable idea

> This means we handle access control, unplug checks and similar at
> migration time, typically before hmm_range_fault(), and the role of
> hmm_range_fault() will be to over pfns whose backing memory is directly
> accessible to the device, else migrate to system.

Yes, that sound right

> 1) Existing users would never use the callback. They can still rely on
> the owner check, only if that fails we check for callback existence.
> 2) By simply caching the result from the last checked dev_pagemap, most
> callback calls could typically be eliminated.

But then you are not in the locked region so your cache is racy and
invalid.

> 3) As mentioned before, a callback call would typically always be
> followed by either migration to ram or a page-table update. Compared to
> these, the callback overhead would IMO be unnoticeable.

Why? Surely the normal case should be a callback saying the memory can
be accessed?

> 4) pcie_p2p is already planning a dev_pagemap callback?

Yes, but it is not a racy validation callback, and it already is
creating a complicated lifecycle problem inside the exporting the
driver.

Jason
