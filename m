Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F08B2BCD1
	for <lists+nouveau@lfdr.de>; Tue, 19 Aug 2025 11:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334D610E035;
	Tue, 19 Aug 2025 09:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EIZ/ATd4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8140210E035
 for <nouveau@lists.freedesktop.org>; Tue, 19 Aug 2025 09:16:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 402F5459D7;
 Tue, 19 Aug 2025 09:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34472C4CEF1;
 Tue, 19 Aug 2025 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755595000;
 bh=pBfQ1Kjl7wTAxur8QpXNGs9LaE42NaS0o3uiaMX/tdo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=EIZ/ATd4bWFl/l1pWl/sIIjoiI2AJ62g/WRMndIRddH98fNEsu/1HQW9JfERdoJx8
 OeenBcjwGoM34bQqvMJrEVLTfxvOir58YaFtPNji0/sCOSJom3BIEk6VajzVdUlcIv
 j7w2l7WeCtt/z52Q4tiqEXmqHYBYn1O8r0oNZZZz9sfxFuAdnGYojNClAxTKnyKuR8
 gaUp8QHnPlUuGDuap3u4dJ2bC0oCplQ/p8ogWE5LTtYUsPR1kdLXf0rnCVDPvzRzyj
 K+3aMsfMWLEzJM8thChlUtsVhUTQJwvZ7i9/qjJ9MXE1x7sZLF9QC/6hGNBar/DiuO
 jBfhshsKtT+zQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 11:16:34 +0200
Message-Id: <DC6AHIFTOH7O.1USOTN2YAHGF9@kernel.org>
Subject: Re: [PATCH v3 3/3] rust: pci: provide access to PCI Vendor values
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
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250819031117.560568-1-jhubbard@nvidia.com>
 <20250819031117.560568-4-jhubbard@nvidia.com>
In-Reply-To: <20250819031117.560568-4-jhubbard@nvidia.com>
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

On Tue Aug 19, 2025 at 5:11 AM CEST, John Hubbard wrote:
> +/// PCI vendor IDs.
> +///
> +/// Each entry contains the 16-bit PCI vendor ID as assigned by the PCI =
SIG.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use kernel::{device::Core, pci::{self, Vendor}, prelude::*};
> +/// fn probe_device(pdev: &pci::Device<Core>) -> Result<()> {
> +///     // Validate vendor ID
> +///     let vendor =3D Vendor::try_from(pdev.vendor_id() as u32)?;

Why not change vendor_id() to return a Vendor instance directly?

> +///     dev_info!(
> +///         pdev.as_ref(),
> +///         "Detected vendor ID: (0x{:04x})\n",
> +///         vendor.as_u32()
> +///     );
> +///     Ok(())
> +/// }
> +/// ```
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +#[repr(transparent)]
> +pub struct Vendor(u32);

[ Vendor impl and lots of ids... ]

Same as for Class; probably better to move it to its own module.

We could also move both Class and Vendor into a single module, e.g. id.rs a=
nd
keep the module prefix. This would have the advantage that we could have
pci::id::Class, pci::id::Vendor and pci::id::Device (which, eventually, we =
want
as well), without getting a name conflict with pci::Device.
