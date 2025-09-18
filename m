Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55376B2ABDB
	for <lists+nouveau@lfdr.de>; Mon, 18 Aug 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0F10E463;
	Mon, 18 Aug 2025 14:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o961xHW1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A76B10E463
 for <nouveau@lists.freedesktop.org>; Mon, 18 Aug 2025 14:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6BB0F601D2;
 Mon, 18 Aug 2025 14:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA8FC4CEEB;
 Mon, 18 Aug 2025 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755529063;
 bh=fxjpl7asl8KgiwlfZoIW1bbJhs+WMizR72o5Nm2FTt4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=o961xHW1StP2YxwSH+foXj9a462Mbib7uaamtopiOykiFOo8Lqp488gNnQZiKVOra
 MM0uwwNLsx0nxoqW+9XrItJcOQShnLNMM5CnNYTmZ6qPu8lWkaMCIcYzh/E/r+CYzN
 mdOqIvq7SF83SDYQiHe33rkzRhC3h/y0kGHaCVMzVXawtgokZlj4DrARzFfVcMu85Y
 +/NWuIiWY7r52y57iLA8HnB7JsoGMmwdJ+EcUkLzV6LS+WN1qzAK9k7nzwy1dVoSrz
 U6N54yRdCXkvq0k5nchDsBqn3z00X7VeHgKxyBB7zrwuT3D6Z6rMKN4fXJOtQxO63F
 HRVE5SWhU0zTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 16:57:37 +0200
Message-Id: <DC5N439ZNA6E.34LSQ3K5366P7@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: pci: provide access to PCI Class,
 subclass, implementation values
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
References: <20250818013305.1089446-1-jhubbard@nvidia.com>
 <20250818013305.1089446-2-jhubbard@nvidia.com>
In-Reply-To: <20250818013305.1089446-2-jhubbard@nvidia.com>
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

On Mon Aug 18, 2025 at 3:33 AM CEST, John Hubbard wrote:
> +            /// Create a `Class` from the raw class code value, or `None=
` if the value doesn't
> +            /// match any known class.
> +            pub fn from_u32(value: u32) -> Option<Self> {
> +                match value {
> +                    $(x if x =3D=3D Self::$variant.0 =3D> Some(Self::$va=
riant),)+
> +                    _ =3D> None,
> +                }
> +            }

Additional to the comments from Alex, I think one should be
`impl TryFrom<u32> for Class`.

> +
> +    /// Create a new `pci::DeviceId` from a class number, mask, and spec=
ific vendor.
> +    ///
> +    /// This is more targeted than [`DeviceId::from_class`]: in addition=
 to matching by Vendor, it
> +    /// also matches the PCI Class (up to the entire 24 bits, depending =
on the mask).
> +    pub const fn from_class_and_vendor(class: Class, class_mask: u32, ve=
ndor: u32) -> Self {
> +        Self(bindings::pci_device_id {
> +            vendor,
> +            device: DeviceId::PCI_ANY_ID,
> +            subvendor: DeviceId::PCI_ANY_ID,
> +            subdevice: DeviceId::PCI_ANY_ID,
> +            class: class.as_u32(),
> +            class_mask,
> +            driver_data: 0,
> +            override_only: 0,
> +        })
> +    }
>  }
> =20
>  // SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `pci_device=
_id` and does not add
> @@ -410,6 +600,18 @@ pub fn resource_len(&self, bar: u32) -> Result<bindi=
ngs::resource_size_t> {
>          // - by its type invariant `self.as_raw` is always a valid point=
er to a `struct pci_dev`.
>          Ok(unsafe { bindings::pci_resource_len(self.as_raw(), bar.try_in=
to()?) })
>      }
> +
> +    /// Returns the full 24-bit PCI class code as stored in hardware.
> +    /// This includes base class, subclass, and programming interface.
> +    pub fn class_code_raw(&self) -> u32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev=
`.
> +        unsafe { (*self.as_raw()).class }
> +    }
> +
> +    /// Returns the PCI class as a `Class` struct, or `None` if the clas=
s code is invalid.
> +    pub fn class_enum(&self) -> Option<Class> {
> +        Class::from_u32(self.class_code_raw())
> +    }

I don't think we have struct pci_dev instances without a valid class code,
can we? Maybe we should convert infallibly here.
