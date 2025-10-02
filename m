Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AABBB4F28
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 20:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16F710E38C;
	Thu,  2 Oct 2025 18:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T8wOR4zC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A18710E38C
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 18:55:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 239CF408B4;
 Thu,  2 Oct 2025 18:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48284C4CEF4;
 Thu,  2 Oct 2025 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759431319;
 bh=iBuI1IKCcI3ACqI+D1Yi8xJA58gX+7AgVRKHpdGsNww=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=T8wOR4zCyX6MF3M/MH5K2+QWrrVRuudVY8SbYJf3bRKh0c/1+Qmm/q0FsWPrRoV6v
 9sgu6CFZCVu0pq9odRZdqawa55NQi4buzCkzpYZeFmLUpR89ZxiQXfNe2yEt0GCtj5
 qF0A9TIz3hHgP7YLOqdSd0wHS/a9D5Mz26BAQYS/BKKCenA0Ed8PZPAynQ4L70jTZx
 xH7mLxDh46pfkSYbrgcreY1GpalwKtSlYxTdiACy09mY7J7xcRFxtA+V80sBIxQ7i3
 yUvhWXNeY16X3uDou4pgWI+76ntGTyayXJ8pDsIqZd1H0vECaT/HK6iTUEJyoczQI0
 KVMKdyrkcWfEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 20:55:12 +0200
Message-Id: <DD82CIS1RKUX.GRLSUUL05D8E@kernel.org>
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251002121110.GE3195801@nvidia.com>
 <DD7TWUPD83M9.5IO0VX7PP1UK@kernel.org>
 <20251002123921.GG3195801@nvidia.com>
 <DD7UVCEVB21H.SQ00WZLLPINP@kernel.org>
 <20251002135600.GB3266220@nvidia.com>
 <DD7XKV6T2PS7.35C66VPOP6B3C@kernel.org>
 <20251002152346.GA3298749@nvidia.com>
 <DD7YQK3PQIA1.15L4J6TTR9JFZ@kernel.org>
 <20251002170506.GA3299207@nvidia.com>
 <DD80P7SKMLI2.1FNMP21LJZFCI@kernel.org>
 <20251002175603.GB3299207@nvidia.com>
In-Reply-To: <20251002175603.GB3299207@nvidia.com>
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

On Thu Oct 2, 2025 at 7:56 PM CEST, Jason Gunthorpe wrote:
> This is certainly one option, you can put #2 in an aux driver of the
> PF in a nova-sriov.ko module that is fully divorced from VFIO. It
> might go along with a nova-fwctl.ko module too.
>
> You could also just embed it in nova-core.ko and have it activate when
> the PF is booted in "vGPU" mode.
>
> Broadly I would suggest the latter. aux devices make most sense to
> cross subsystems. Micro splitting a single driver with aux devices
> will make more of a mess than required. Though a good motivating
> reason would be if nova-srvio.ko is large.

As mentioned in the other sub-thread, I'm fine with either approach, but I =
think
I'd also prefer folding it into nova-core.

> Then you have two more:
>
> 4) A PCI driver in a VM that creates a DRM subsystem device
>
> This is nova-core.ko + nova-drm.ko
>
> 5) A VF driver that creates a DRM subsystem device without a VM
>
> Zhi says the device can't do this, but lets assume it could, then I
> would expect this to be nova-core.ko + nova-drm.ko, same as #4.

Indeed, but there'd probably be an overlap between the logic in the VFIO dr=
iver
and the logic required in nova-core to make this use-case happen I suspect.
