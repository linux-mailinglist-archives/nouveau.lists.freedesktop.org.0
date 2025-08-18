Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACCB2ADBC
	for <lists+nouveau@lfdr.de>; Mon, 18 Aug 2025 18:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF5010E494;
	Mon, 18 Aug 2025 16:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nLhkO/I5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB710E494
 for <nouveau@lists.freedesktop.org>; Mon, 18 Aug 2025 16:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4581C4198E;
 Mon, 18 Aug 2025 16:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06318C4CEEB;
 Mon, 18 Aug 2025 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755533208;
 bh=8v0DGj5nN7LXQV4s3kH37ZEpxqadMxuWtRA9XKaDv9Y=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nLhkO/I5LOKz8LcXkJw6s406OXNSXyb2a8ICLRCrn0YxIbTmVUchl9L0VOnJ1hNzm
 h+UKxqH0PksQediircWskG1IV4nc3tC4Tiq4BRaP9Tvjg0OeTS0o4M4zg5HcNNp5el
 chwhjTzmvI//dfy5Y1A+B41xCDfte+A6e+4ZXH8JzMTLmI4PeWMWms3UvQsSrt+y36
 33dFrnFPfHFZiAHxD5NVSVt+sQCfUjJNcLOo1ChgIuHgJdaqVXo2oXSe3VmZKgbVEw
 SGqBH9NzwKYyGE/DWsLuRBEqnkmKRvE5bBj4HNMszv9S/0UdGUGbU8TZi/rQQGYQQk
 DMdojNV4K+e2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 18:06:42 +0200
Message-Id: <DC5OKZHPTDWC.L6YD327Z0WJN@kernel.org>
Subject: Re: [PATCH v2 3/3] rust: pci: provide access to PCI Vendor values
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
 <20250818013305.1089446-4-jhubbard@nvidia.com>
In-Reply-To: <20250818013305.1089446-4-jhubbard@nvidia.com>
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
> +            /// Create a `Vendor` from the raw vendor ID value, or `None=
` if the value doesn't
> +            /// match any known vendor.
> +            pub fn from_u32(value: u32) -> Option<Self> {
> +                match value {
> +                    $(x if x =3D=3D Self::$variant.0 =3D> Some(Self::$va=
riant),)+
> +                    _ =3D> None,
> +                }
> +            }

Same here, I think this should be `impl TryFrom<u32> for Vendor`.

> +
> +            /// Get the raw 16-bit vendor ID value.
> +            pub const fn as_u32(self) -> u32 {
> +                self.0
> +            }
> +        }
> +    };
> +}

>  /// An adapter for the registration of PCI drivers.
>  pub struct Adapter<T: Driver>(T);
> =20
> @@ -335,9 +656,9 @@ pub const fn from_class(class: u32, class_mask: u32) =
-> Self {
>      ///
>      /// This is more targeted than [`DeviceId::from_class`]: in addition=
 to matching by Vendor, it
>      /// also matches the PCI Class (up to the entire 24 bits, depending =
on the mask).
> -    pub const fn from_class_and_vendor(class: Class, class_mask: u32, ve=
ndor: u32) -> Self {
> +    pub const fn from_class_and_vendor(class: Class, class_mask: u32, ve=
ndor: Vendor) -> Self {
>          Self(bindings::pci_device_id {
> -            vendor,
> +            vendor: vendor.as_u32(),
>              device: DeviceId::PCI_ANY_ID,
>              subvendor: DeviceId::PCI_ANY_ID,
>              subdevice: DeviceId::PCI_ANY_ID,
> @@ -396,7 +717,7 @@ macro_rules! pci_device_table {
>  ///     <MyDriver as pci::Driver>::IdInfo,
>  ///     [
>  ///         (
> -///             pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_REDHAT, b=
indings::PCI_ANY_ID as u32),
> +///             pci::DeviceId::from_id(pci::Vendor::REDHAT.as_u32(), bin=
dings::PCI_ANY_ID as u32),

We should change DeviceId::from_id() to consume a pci::Vendor value directl=
y.
