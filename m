Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B2B3EF91
	for <lists+nouveau@lfdr.de>; Mon,  1 Sep 2025 22:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174C10E174;
	Mon,  1 Sep 2025 20:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Efs6hQT/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B417A10E174
 for <nouveau@lists.freedesktop.org>; Mon,  1 Sep 2025 20:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A70F412EC;
 Mon,  1 Sep 2025 20:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02503C4CEF0;
 Mon,  1 Sep 2025 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756758389;
 bh=eF5HEy70tfeo1yW+uH2DRuxqaYZppSmTaxduRb9MIZY=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=Efs6hQT/z3OP2aSlyCKjerM6VE+/hjqwZEEEoxacgYAA8Mj0rZtK+PGz65I04d7dH
 YTdzUr7z0tfxgqJM2BoSCquSZF2sRtIrbCkP5SO9oSchNtqZav5hwvMmMquW0J0ot5
 OLcFT+YNoO8s+Wv1Ftdrz3t70PECmC5eDU8rX35dgxVuAax2yp1D7q/odl77PkI8Mo
 yiU0cfTUaQKf6rWIiavJ/1/mUvYsQAklbh2KB2dSEzUSqXtTt7YXkwMiivgU/JIXpQ
 9lUae+CoQ+JxFN0aMpyIt2JPVljdpIjbESYNcRFkfruixuuwyhAOW9IeBmnpbh4ZaM
 sGPPSkWDtJ0aA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 22:26:23 +0200
Message-Id: <DCHQVFTUYTLV.3F0N1WIXZHO96@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 0/6] rust, nova-core: PCI Class, Vendor support
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Elle Rhumsaa" <elle@weathered-steel.dev>
References: <20250829223632.144030-1-jhubbard@nvidia.com>
In-Reply-To: <20250829223632.144030-1-jhubbard@nvidia.com>
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

On Sat Aug 30, 2025 at 12:36 AM CEST, John Hubbard wrote:
> John Hubbard (6):

Applied to driver-core-testing, thanks!

>   rust: pci: provide access to PCI Class and Class-related items

    [ Minor doc-comment improvements, align Debug and Display. - Danilo ]

>   rust: pci: provide access to PCI Vendor values

    [ Minor doc-comment improvements, align Debug and Display. - Danilo ]

>   rust: pci: add DeviceId::from_class_and_vendor() method

    [ Minor doc-comment improvements. - Danilo ]

>   gpu: nova-core: avoid probing non-display/compute PCI functions
>   rust: pci: use pci::Vendor instead of bindings::PCI_VENDOR_ID_*

    [ Replace "as a validated vendor" with "as [`Vendor`]". - Danilo ]

>   rust: pci: inline several tiny functions
