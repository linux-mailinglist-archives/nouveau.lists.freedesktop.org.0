Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0B9CBAA7B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDEF10EA4F;
	Sat, 13 Dec 2025 12:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="GpcTHbhN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D9610E698
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 03:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1755661696; x=1755920896;
 bh=qIDOe0QSvA2p3uohZj2DaxRg0Kq5ls/HnNnWTRUdDrE=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=GpcTHbhNWGLmNYiGuteRHZmUj5G+dd1Oq4feazckGhttqPzBF61QGT1JPM8xnbdqV
 yI7TaX8pdW568cSuRPacdBrmD3AC6m+lFkniTBRjyxdB2oGvwjHBdCAEMGllqxVpTt
 GGTVHGM1GA6nCliN7hNViwLzKZ5etZY2bCJo0lw8IPG7eNHz8WIUFxroz0XqYZX8Tk
 +PhbOXC0Fg9fRlg/jDK6dMpv5ta7Kr3iARTVNVKUcdZoCq0Cq7wC7a0nvGAZk4pPHB
 MfBr4LJicXSUjn7FsAu3B3tm7eYbhy0JJJwJgUsrUwh1B7wcyPC0YiOsy4b/AUNtfV
 zKDH6EGUx+huQ==
X-Pm-Submission-Id: 4c6C8s63rSz2Sccc
Date: Wed, 20 Aug 2025 03:48:10 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: pci: provide access to PCI Class, subclass, 
 implementation values
Message-ID: <aKVFVO3wbzClcLwg@archiso>
References: <20250818013305.1089446-1-jhubbard@nvidia.com>
 <20250818013305.1089446-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818013305.1089446-2-jhubbard@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:43 +0000
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

On Sun, Aug 17, 2025 at 06:33:03PM -0700, John Hubbard wrote:
> Allow callers to write Class::STORAGE_SCSI instead of
> bindings::PCI_CLASS_STORAGE_SCSI, for example.
> 
> New APIs:
>     Class::STORAGE_SCSI, Class::NETWORK_ETHERNET, etc.
>     Class::from_u32(), as_u32()
>     Class::MASK_FULL, MASK_CLASS_SUBCLASS
>     DeviceId::from_class_and_vendor()
>     Device::class_code_raw(), class_enum()
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/pci.rs | 202 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 887ee611b553..9caa1d342d52 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -23,6 +23,179 @@
>  };
>  use kernel::prelude::*;
>  
> +macro_rules! define_all_pci_classes {
> +    (
> +        $($variant:ident = $binding:expr,)+
> +    ) => {
> +        /// Converts a PCI class constant to 24-bit format.
> +        ///
> +        /// Many device drivers use only the upper 16 bits (base class and subclass), but some
> +        /// use the full 24 bits. In order to support both cases, store the class code as a 24-bit
> +        /// value, where 16-bit values are shifted up 8 bits.
> +        const fn to_24bit_class(val: u32) -> u32 {
> +            if val > 0xFFFF { val } else { val << 8 }
> +        }
> +
> +        /// PCI device class codes.
> +        ///
> +        /// Each entry contains the full 24-bit PCI class code (base class in bits 23-16, subclass
> +        /// in bits 15-8, programming interface in bits 7-0).
> +        ///
> +        #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +        #[repr(transparent)]
> +        pub struct Class(u32);
> +
> +        impl Class {
> +            $(
> +                #[allow(missing_docs)]
> +                pub const $variant: Self = Self(to_24bit_class($binding));
> +            )+
> +
> +            /// Match the full class code.
> +            pub const MASK_FULL: u32 = 0xffffff;
> +
> +            /// Match the upper 16 bits of the class code (base class and subclass only).
> +            pub const MASK_CLASS_SUBCLASS: u32 = 0xffff00;
> +
> +            /// Create a `Class` from the raw class code value, or `None` if the value doesn't
> +            /// match any known class.
> +            pub fn from_u32(value: u32) -> Option<Self> {
> +                match value {
> +                    $(x if x == Self::$variant.0 => Some(Self::$variant),)+
> +                    _ => None,
> +                }
> +            }
> +
> +            /// Get the raw 24-bit class code value.
> +            pub const fn as_u32(self) -> u32 {
> +                self.0
> +            }
> +        }
> +    };
> +}
> +
> +define_all_pci_classes! {
> +    NOT_DEFINED                = bindings::PCI_CLASS_NOT_DEFINED,                // 0x000000
> +
> +    ...
> +
> +    OTHERS                     = bindings::PCI_CLASS_OTHERS,                     // 0xff0000
> +}
> +
>  /// An adapter for the registration of PCI drivers.
>  pub struct Adapter<T: Driver>(T);
>  
> @@ -157,6 +330,23 @@ pub const fn from_class(class: u32, class_mask: u32) -> Self {
>              override_only: 0,
>          })
>      }
> +
> +    /// Create a new `pci::DeviceId` from a class number, mask, and specific vendor.
> +    ///
> +    /// This is more targeted than [`DeviceId::from_class`]: in addition to matching by Vendor, it
> +    /// also matches the PCI Class (up to the entire 24 bits, depending on the mask).
> +    pub const fn from_class_and_vendor(class: Class, class_mask: u32, vendor: u32) -> Self {
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
>  
>  // SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `pci_device_id` and does not add
> @@ -410,6 +600,18 @@ pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
>          // - by its type invariant `self.as_raw` is always a valid pointer to a `struct pci_dev`.
>          Ok(unsafe { bindings::pci_resource_len(self.as_raw(), bar.try_into()?) })
>      }
> +
> +    /// Returns the full 24-bit PCI class code as stored in hardware.
> +    /// This includes base class, subclass, and programming interface.
> +    pub fn class_code_raw(&self) -> u32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
> +        unsafe { (*self.as_raw()).class }
> +    }
> +
> +    /// Returns the PCI class as a `Class` struct, or `None` if the class code is invalid.
> +    pub fn class_enum(&self) -> Option<Class> {
> +        Class::from_u32(self.class_code_raw())
> +    }
>  }
>  
>  impl Device<device::Bound> {
> -- 
> 2.50.1

All of the functions could probably be `#[inline]`ed, though I'm not
sure how much it affects the `const` functions, since they're already
evaluated at compile-time.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
