Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3865C08EBA
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 12:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723110E25D;
	Sat, 25 Oct 2025 10:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HX/iBvtl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2981810E25D
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 10:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE425439FF;
 Sat, 25 Oct 2025 10:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7352EC4CEFF;
 Sat, 25 Oct 2025 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761386501;
 bh=3E7nHw8V7OYWwjNd0Xu+uiIJixZZRRqw5azWYjFeTZE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=HX/iBvtleCf1FBOOrjFnSbkSXc03KfQ6PgjFCCUoTRVb81LQQuOZff8TZCR6ELHjZ
 xxIQNjAvEwEo9HyjO7ecC3FqWP1NMz0lwW+u3thfVpbUH6OqFwIcO8aHF1nn6vIcXR
 WoFZIOJYbMW8oI0Le8+VQfOTEKRrfjdBdO/1HC4QpEO4cp7fUovdI1mppeMYbRwos1
 VAwIliZQPL6FIy0JiV5TSCVQwxCpEQT7j2sNWstMu/E26AvF+70vXooGnDuw5Lwor0
 mGdwiakNZ5qUthPK02oGRkFI57Qodc3vZmFBqby+/N1fDQBg7KFDtFVMC9+cste767
 VIWbVqZkrZdxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 12:01:35 +0200
Message-Id: <DDRBEHGSMDFM.X7RQC8XCC7C8@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova: add boot42 support for next-gen GPUs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251025001459.491983-1-jhubbard@nvidia.com>
 <20251025001459.491983-3-jhubbard@nvidia.com>
In-Reply-To: <20251025001459.491983-3-jhubbard@nvidia.com>
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

On Sat Oct 25, 2025 at 2:14 AM CEST, John Hubbard wrote:
> +        // "next-gen" GPUs (some time after Blackwell) will zero out boo=
t0, and put the architecture
> +        // details in boot42 instead. Avoid reading boot42 unless we are=
 in that case.
> +        let boot42 =3D if boot0.is_next_gen() {
> +            Some(regs::NV_PMC_BOOT_42::read(bar))
> +        } else {
> +            None
> +        };
> +
>          try_pin_init!(Self {
>              chipset: {
> -                let chipset =3D boot0.chipset()?;
> +                // Some brief notes about boot0 and boot42, in chronolog=
ical order:
> +                //
> +                // NV04 through Volta:
> +                //
> +                //    Not supported by Nova. boot0 is necessary and suff=
icient to identify these
> +                //    GPUs. boot42 may not even exist on some of these G=
PUs.
> +                //
> +                // Turing through Blackwell:
> +                //
> +                //     Supported by both Nouveau and Nova. boot0 is stil=
l necessary and sufficient
> +                //     to identify these GPUs. boot42 exists on these GP=
Us but we don't need to use
> +                //     it.
> +                //
> +                // Future "next-gen" GPUs:
> +                //
> +                //    Only supported by Nova. Boot42 has the architectur=
e details, boot0 is zeroed
> +                //    out.
> +
> +                // NV04, the very first NVIDIA GPU to be supported on Li=
nux, is identified by a
> +                // specific bit pattern in boot0. Although Nova does not=
 support NV04 (see above),
> +                // it is possible to confuse NV04 with a "next-gen" GPU.=
 Therefore, return early if
> +                // we specifically detect NV04, thus simplifying the rem=
aining selection logic.
> +                if boot0.is_nv04() {
> +                    Err(ENODEV)?
> +                }
> +
> +                // Now that we know it is something more recent than NV0=
4, use boot42 if we
> +                // previously determined that boot42 was both valid and =
relevant, and boot0
> +                // otherwise.
> +                let (chipset, major_rev, minor_rev) =3D if let Some(boot=
42) =3D boot42 {
> +                    (
> +                        boot42.chipset()?,
> +                        boot42.major_revision(),
> +                        boot42.minor_revision(),
> +                    )
> +                } else {
> +                    // Current/older GPU: use BOOT0
> +                    (
> +                        boot0.chipset()?,
> +                        boot0.major_revision(),
> +                        boot0.minor_revision(),
> +                    )
> +                };

Why open code all of the above in the struct Gpu constructor? This could al=
l
happen within Spec::new().

If we *really* don't want to store the Spec, but only the Chipset, you can =
also
do:

	try_pin_init!(Self {
	    chipset: {
	        let spec =3D Spec::new(bar);

	        dev_info!(pdev.as_ref(), "{}\n", spec);

	        spec.chipset
	    },
	    [...],
	}
