Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F88A2B841
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A8010E9E5;
	Fri,  7 Feb 2025 01:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="KWdCV3WM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B0810E0A5
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jan 2025 15:08:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4361f796586so10980935e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jan 2025 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737644899; x=1738249699; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnvF918MExGqpW1JhPiFqDMhjdc3YrQOLeaZRhdmR1k=;
 b=KWdCV3WMC9xRLdi20guqKEi05oRWqnEo0mfpK4wPHRhLlTZlrsNnlk6z+dxY0kMnNc
 0nHZf//t8NNp5Tg5rw/12Or5TqxPV6khTHfS52JbrwUJrLhMdvDOlDyM2+uEFhOtzMr/
 dWo5A1hpEU0y2s5IdWMTIRe7hb4LW5GLBP1yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737644899; x=1738249699;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnvF918MExGqpW1JhPiFqDMhjdc3YrQOLeaZRhdmR1k=;
 b=YaXCo2kA5f7oGREA311LQcNgUfjguir0pvAEdgCR8WyIBrb6Fm695GVc2cBiXMDGr2
 qIgqJzgV3HlG/jpdclyMs1G70sTcmlufDD/xYR+9nfIB1qmnpUpVoBDF1NtOTDSutBxF
 sZegWMdIylwgWb1ieK4coHoVpppwufJfJNJJENk4aK7lPIvb2itA5+jj1faeommhkEi8
 WJHtMp5QUbd8vsJ/2xdqFevjXOGhrRnLk95JvOTtEvyt1jVrlfF4HxktI5+4Sq2WSJuT
 j9BVWZ3RyS77YwN/PGpWX9lddcZ+woZiADXnXf0yYFzjsMAzri6Fr/ruQysKO4Y4zwby
 4euQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ7N1c+HyTDaxoNJaS3mdmazq+lXtSW8zQ8Bf1ePJWncDNEP8oGaLIS2/vlbfBUZYjyONEBI/m@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ6vZxk9C65UDmwgf/QbYMQ6JXeyoxiK7AMjybnLc1SInGYUdq
 q7vN4cWJwNVg5wgwedW+r9zU+bWGF4cQWgDtP4B9T8bkjjIuGZuHzyohwTLuDRo=
X-Gm-Gg: ASbGnctDghU5MVSbYqoKeCafpM5Bz71KfpJ7/4RBbc25fgY4e9v5jjPrblgDstPGbaS
 L0kOFdkP0qz76UltFBiA1emWjNm/0fglrAtN9I9m5+4VcCUpIa97JlyeD0Q2xuUOtw8AH6f7b9N
 qizZi40n1N8q2d7881ZsJyQrHk0fy8UzIBQobTcT8aMPJxNDgmcF0eIJmSDo5jOyHIjG7yuT/0L
 JD+jYRouJcoDZ3NpnMOQib78eZ97X4iJnIqcXUofjXATA5Rrrw1Q6GHdg2Xd4OrSUS+smzURDWF
 UsLc5MKUr8skoaGY
X-Google-Smtp-Source: AGHT+IFe5bvrufD5E2WCU0xgHozwkEfe52bL8rsuxcBOdIdAdnpMPzPUDgbaIWl03oauCdgHt4m7yA==
X-Received: by 2002:a05:600c:4e06:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-438913c60e1mr250217565e9.4.1737644898467; 
 Thu, 23 Jan 2025 07:08:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31ae155sm64915825e9.20.2025.01.23.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 07:08:18 -0800 (PST)
Date: Thu, 23 Jan 2025 16:08:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 23, 2025 at 11:20:37AM +0100, David Hildenbrand wrote:
> Hi,
> 
> I keep finding issues in our implementation of "device exclusive non-swap
> entries", and the way it messes with mapcounts is disgusting.
> 
> As a reminder, what we do here is to replace a PTE pointing to an anonymous
> page by a "device exclusive non-swap entry".
> 
> As long as the original PTE is in place, the only CPU can access it, as soon
> as the "device exclusive non-swap entry" is in place, only the device can
> access it. Conversion back and forth is triggered by CPU / device faults.
> 
> I have fixes/reworks/simplifications for most things, but as there is only a
> "real" single user in-tree of make_device_exclusive():
> 
> 	drivers/gpu/drm/nouveau/nouveau_svm.c
> 
> to "support SVM atomics in Nouveau [1]"
> 
> naturally I am wondering: is this still a thing on actual hardware, or is it
> already stale on recent hardware and not really required anymore?
> 
> 
> [1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/

As long as you don't have a coherent interconnect it's needed. On intel
discrete device atomics require device memory, so they need full hmm
migration (and hence wont use this function even once we land intel gpu
svm code in upstream). On integrated the gpu is tied into the coherency
fabric, so there it's not needed.

I think the more fundamental question with both this function here and
with forced migration to device memory is that there's no guarantee it
will work out. At least that's my understanding. And for this gpu device
atomics without coherent interconnect idea to work, we'd need to be able
to guarantee that we can make any page device exclusive. So from my side I
have some pretty big question marks on this entire thing overall.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
