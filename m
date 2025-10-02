Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A4BB4700
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 18:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823D810E80C;
	Thu,  2 Oct 2025 16:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fVAibted";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CFF10E80C
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 16:05:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6154961F6E;
 Thu,  2 Oct 2025 16:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3C7C4CEF4;
 Thu,  2 Oct 2025 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759421135;
 bh=FSsNLddF/JQI+ng0LO9L5eWcAwBOBZsP1GwaePkWVgc=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=fVAibted+YQXWHCfm/zSBcYzpFNyr92F86zW7Cr6T6/cvFzUIVMeVracte/91vNNn
 HrjXw3CZUbZN15Bh5Q11fW+0af71GqAUEVc0nYwYW/saJ5VnF3siAPz3vIAz/E5yjm
 315xGgkNRU2m1r6yjrMQG6AOgbHMkFZQMMjLZw3fMDxjOQ9Ij51wOJ1LOWWVodd9xI
 MEkaKwHZIUP5e9nWkJTErq5sKMNicg1SEvELbbFeZupHztW65Cn4vjbA760w+f20Nw
 ozI0Oi3/XHI1VS00dVwVKamy0YuX1wfb9pa2kDayIQm7QBBK0PaWZ0MJCt3AXBIjup
 fsZXTqfr6+OGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 18:05:28 +0200
Message-Id: <DD7YQK3PQIA1.15L4J6TTR9JFZ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pci: skip probing VFs if driver doesn't
 support VFs
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Surath Mitra" <smitra@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alex Williamson"
 <alex.williamson@redhat.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
References: <20251002020010.315944-1-jhubbard@nvidia.com>
 <20251002020010.315944-2-jhubbard@nvidia.com>
 <20251002121110.GE3195801@nvidia.com>
 <DD7TWUPD83M9.5IO0VX7PP1UK@kernel.org>
 <20251002123921.GG3195801@nvidia.com>
 <DD7UVCEVB21H.SQ00WZLLPINP@kernel.org>
 <20251002135600.GB3266220@nvidia.com>
 <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org>
 <20251002152346.GA3298749@nvidia.com>
In-Reply-To: <20251002152346.GA3298749@nvidia.com>
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

On Thu Oct 2, 2025 at 5:23 PM CEST, Jason Gunthorpe wrote:
> This is not what I've been told, the VF driver has significant
> programming model differences in the NVIDIA model, and supports
> different commands.

Ok, that means there are some more fundamental differences between the host=
 PF
and the "VM PF" code that we have to deal with.

But that doesn't necessarily require that the VF parts of the host have to =
be in
nova-core as well, i.e. with the information we have we can differentiate
between PF, VF and PF in the VM (indicated by a device register).

> If you look at the VFIO driver RFC it basically does no mediation, it
> isn't intercepting MMIO - the guest sees the BARs directly. Most of
> the code is "profiling" from what I can tell. Some config space
> meddling.

Sure, there is no mediation in that sense, but it needs quite some setup
regardless, no?

I thought there is a significant amount of semantics that is different betw=
een
booting the PF and the VF on the host.

Also, the idea was to use a layered approach, i.e. let nova-core serve as a=
n
abstraction layer, where the DRM and VFIO parts can be layered on top of.

Are you suggesting to merge vGPU into nova-core?

(The VF specific firmware interfaces, should be abstracted in nova-core, so=
,
technically, we will have some vGPU specific code in nova-core.)
