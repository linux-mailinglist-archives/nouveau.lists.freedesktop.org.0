Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44840BB3D00
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 13:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F34710E195;
	Thu,  2 Oct 2025 11:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PVLsTUV1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3610E195
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 11:49:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 16E4163D68;
 Thu,  2 Oct 2025 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA28C4CEF4;
 Thu,  2 Oct 2025 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759405783;
 bh=oJQ7C3Km27dzf9R9tsuKLeHkk518hp3tLVzdWr3kU0w=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=PVLsTUV1a8WRDlRxHPAmCIkBmj3obBmxbDxNYZSsbc2ZvZ8Ex0eE+dPqumkvfX+Y5
 ZLbLL+c3EwpOyZIhMGHEIttkZWQZLp2w3gFwGloTSQWH7VXDTlzmKUNiCaS5cl0QMN
 Vdp+EBndJ6v6lgBdMCOjbdiwz6nGGWZKC+qKMso1XQoagkDE/m2+tdfZP59aufIrfc
 y7yQgwAuBMwMco4RFjuBaIxmrgpur+IBcvk3++Xqm6IBS+wu/fETAmUhEDtSC1ZhJ4
 oXZ2j1vOjTRZpNbeZQuyg2M3oBXho93bPSF4UwFDF7OFWxxT0muhjtAYZcvXp6QuIk
 3LLgxjwXD+qkg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 13:49:37 +0200
Message-Id: <DD7TANT8PB1W.2SVA4TOU80BFN@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pci: skip probing VFs if driver doesn't
 support VFs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Surath Mitra"
 <smitra@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alex Williamson" <alex.williamson@redhat.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
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
References: <20251002020010.315944-1-jhubbard@nvidia.com>
 <20251002020010.315944-2-jhubbard@nvidia.com>
In-Reply-To: <20251002020010.315944-2-jhubbard@nvidia.com>
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

On Thu Oct 2, 2025 at 4:00 AM CEST, John Hubbard wrote:
> Add a "supports_vf" flag to struct pci_driver to let drivers declare
> Virtual Function (VF) support. If a driver does not support VFs, then
> the PCI driver core will not probe() any VFs for that driver's devices.
>
> On the Rust side, add a const "SUPPORTS_VF" Driver trait, defaulting to
> false: drivers must explicitly opt into VF support.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Zhi Wang <zhiw@nvidia.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/pci/pci-driver.c | 3 +++
>  include/linux/pci.h      | 1 +
>  rust/kernel/pci.rs       | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 63665240ae87..588666cc7254 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -412,6 +412,9 @@ static int __pci_device_probe(struct pci_driver *drv,=
 struct pci_dev *pci_dev)
>  	if (drv->probe) {
>  		error =3D -ENODEV;
> =20
> +		if (pci_dev->is_virtfn && !drv->supports_vf)
> +			return error;
> +
>  		id =3D pci_match_device(drv, pci_dev);
>  		if (id)
>  			error =3D pci_call_probe(drv, pci_dev, id);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 59876de13860..92510886a086 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -983,6 +983,7 @@ struct pci_driver {
>  	struct device_driver	driver;
>  	struct pci_dynids	dynids;
>  	bool driver_managed_dma;
> +	bool supports_vf;	/* Will bind to Virtual Functions */

I don't see any driver changes in this patch, are we sure this doesn't brea=
k any
existing drivers given that this defaults to false?

Obviously, the safe call would be to invert the logic, such that it default=
s to
VFs being supported, though I clearly do prefer the opt-in.

Also, in C this always defaults to false, whereas in Rust we have the choic=
e to
make it true by default, hence in C we'd need to invert the semantics, whic=
h is
not desirable either.

>  };
> =20
>  #define to_pci_driver(__drv)	\
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 7fcc5f6022c1..c5d036770e65 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -47,6 +47,7 @@ unsafe fn register(
>              (*pdrv.get()).probe =3D Some(Self::probe_callback);
>              (*pdrv.get()).remove =3D Some(Self::remove_callback);
>              (*pdrv.get()).id_table =3D T::ID_TABLE.as_ptr();
> +            (*pdrv.get()).supports_vf =3D T::SUPPORTS_VF;
>          }
> =20
>          // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> @@ -268,6 +269,9 @@ pub trait Driver: Send {
>      /// The table of device ids supported by the driver.
>      const ID_TABLE: IdTable<Self::IdInfo>;
> =20
> +    /// Whether the driver supports Virtual Functions.
> +    const SUPPORTS_VF: bool =3D false;
> +
>      /// PCI driver probe.
>      ///
>      /// Called when a new pci device is added or discovered. Implementer=
s should
> --=20
> 2.51.0

