Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C427B3A381
	for <lists+nouveau@lfdr.de>; Thu, 28 Aug 2025 17:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECD610EA0D;
	Thu, 28 Aug 2025 15:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fNd50m/g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A7E10EA07
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 15:07:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4ACA960055;
 Thu, 28 Aug 2025 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D832BC4CEEB;
 Thu, 28 Aug 2025 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756393671;
 bh=Kj50zdPBviEYi26Fg8fevksF75QfPqBuDfGkidcgEXQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=fNd50m/g2iC58hqfHBnPA3m3/oN9kGwb6UGmTUY8d7E1lq4G7ZMA1ETSM+/bj/Z7l
 eU6D67UWxyqbFc4hdjWeRSxcuoh/+7BSgQf4mDZDyGYPAckD7OSapkDYY/ebQVbIBc
 zgVCHdLFfe1SkSNVWe+yKqkH8fiR0KVpvfayLMgf4SIZJPiMzsyGeGTfTiSTW4K5+h
 oE/KEQx0FKDDYh+MEhUe4XXtcLX3pcSoa/Rr0TrB3hTVFvpf186sEtJWzIE2pvWBef
 StbPY4k/fw+kH/MvmHixBrQ2cX4+VgtOFYmWq+GSbi8hpE2GeiyTwY+lREv3ZhjebQ
 WkvWpMHQsikHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 17:07:45 +0200
Message-Id: <DCE5LAQ8XWRQ.30YBZAIE63ECO@kernel.org>
Subject: Re: [PATCH v7 2/6] rust: pci: provide access to PCI Vendor values
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
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
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250826231224.1241349-1-jhubbard@nvidia.com>
 <20250826231224.1241349-3-jhubbard@nvidia.com>
 <DCE3ENGCR4T7.25B37IKXHCC8O@nvidia.com>
In-Reply-To: <DCE3ENGCR4T7.25B37IKXHCC8O@nvidia.com>
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

On Thu Aug 28, 2025 at 3:25 PM CEST, Alexandre Courbot wrote:
> On Wed Aug 27, 2025 at 8:12 AM JST, John Hubbard wrote:
>> This allows callers to write Vendor::SOME_COMPANY instead of
>> bindings::PCI_VENDOR_ID_SOME_COMPANY.
>>
>> New APIs:
>>     Vendor::SOME_COMPANY
>>     Vendor::from_raw() -- Only accessible from the pci (parent) module.
>>     Vendor::as_raw()
>>     Vendor: fmt::Display for Vendor
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Elle Rhumsaa <elle@weathered-steel.dev>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  rust/kernel/pci.rs    |   2 +-
>>  rust/kernel/pci/id.rs | 349 +++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 349 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
>> index 212c4a6834fb..f15cfd0e76d9 100644
>> --- a/rust/kernel/pci.rs
>> +++ b/rust/kernel/pci.rs
>> @@ -25,7 +25,7 @@
>> =20
>>  mod id;
>> =20
>> -pub use self::id::{Class, ClassMask};
>> +pub use self::id::{Class, ClassMask, Vendor};
>> =20
>>  /// An adapter for the registration of PCI drivers.
>>  pub struct Adapter<T: Driver>(T);
>> diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
>> index 55d9cdcc6658..4b0ad8d4edc6 100644
>> --- a/rust/kernel/pci/id.rs
>> +++ b/rust/kernel/pci/id.rs
>> @@ -2,7 +2,7 @@
>> =20
>>  //! PCI device identifiers and related types.
>>  //!
>> -//! This module contains PCI class codes and supporting types.
>> +//! This module contains PCI class codes, Vendor IDs, and supporting ty=
pes.
>> =20
>>  use crate::{bindings, error::code::EINVAL, error::Error, prelude::*};
>>  use core::fmt;
>> @@ -109,6 +109,69 @@ fn try_from(value: u32) -> Result<Self, Self::Error=
> {
>>      }
>>  }
>> =20
>> +/// PCI vendor IDs.
>> +///
>> +/// Each entry contains the 16-bit PCI vendor ID as assigned by the PCI=
 SIG.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// # use kernel::{device::Core, pci::{self, Vendor}, prelude::*};
>> +/// fn log_device_info(pdev: &pci::Device<Core>) -> Result<()> {
>> +///     // Compare raw vendor ID with known vendor constant
>> +///     let vendor_id =3D pdev.vendor_id();
>> +///     if vendor_id =3D=3D Vendor::NVIDIA.as_raw() {
>> +///         dev_info!(
>> +///             pdev.as_ref(),
>> +///             "Found NVIDIA device: 0x{:x}\n",
>> +///             pdev.device_id()
>> +///         );
>> +///     }
>> +///     Ok(())
>> +/// }
>> +/// ```
>> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
>> +#[repr(transparent)]
>> +pub struct Vendor(u16);
>> +
>> +macro_rules! define_all_pci_vendors {
>> +    (
>> +        $($variant:ident =3D $binding:expr,)+
>> +    ) =3D> {
>> +
>> +        impl Vendor {
>
> Why the blank line here? (same for the `define_all_pci_classes` in the
> previous patch).
>
>> +            $(
>> +                #[allow(missing_docs)]
>> +                pub const $variant: Self =3D Self($binding as u16);
>> +            )+
>> +        }
>> +    };
>> +}
>> +
>> +/// Once constructed, a `Vendor` contains a valid PCI Vendor ID.
>> +impl Vendor {
>> +    /// Create a Vendor from a raw 16-bit vendor ID.
>> +    /// Only accessible from the parent pci module.
>> +    #[expect(dead_code)]
>> +    #[inline]
>> +    pub(super) fn from_raw(vendor_id: u16) -> Self {
>> +        Self(vendor_id)
>> +    }
>> +
>> +    /// Get the raw 16-bit vendor ID value.
>> +    #[inline]
>> +    pub const fn as_raw(self) -> u16 {
>> +        self.0
>> +    }
>> +}
>> +
>> +impl fmt::Display for Vendor {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        write!(f, "0x{:04x}", self.0)
>> +    }
>> +}
>
> Possibly an exercice for a future patch, but do we want to display the
> vendor name if it is defined, rather than its hex code (which is more
> the job of `Debug`)? We could leverage the macro above to do that. The
> same should be doable for the PCI classes.
>
> I suspect strings for all the names already exist on the C side, in
> which case we would want to reuse them instead of defining new ones.
>
> Note that I don't think this needs to be done for this series - it's
> just a thought as I was looking at this `Display` implementation that
> looks more like a `Debug` one.

Yeah, this can be addressed subsequently; it might make sense to align Disp=
lay
and Debug though. Currently, Vendor simply derives Debug, resulting in the
decimal value to be printed.
