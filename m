Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A61C3F36E
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 10:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DC010EA4F;
	Fri,  7 Nov 2025 09:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KZN7wrus";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269310EA57
 for <nouveau@lists.freedesktop.org>; Fri,  7 Nov 2025 09:42:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C5F6E40930;
 Fri,  7 Nov 2025 09:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965BDC2BCB3;
 Fri,  7 Nov 2025 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762508574;
 bh=9ZMD++yk3gyPxg7lu0dYQuNvvC4ocprc4MAaAT8RRdI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=KZN7wrusq4dGgvNuEuNLZd49NQG5vWE9VIQqZvDmsHIytcXYjf6+MY5LpgQCsRI6h
 1zJIMJzu8m+TX+Fhfs4wnCbr6+j0cEbGBIIq3W7mshJaKDYePwJXjUdAfQ2SFKP2I+
 vjU+qPMy/yS7A15UxRmtNuBqu8ar4Zxaxg1xVyn9c9KrN6AYa98a/Uigyktc1/mppU
 gNZ66Ts25R1YVd4cyF+leXMdQG87Q6vDj7YxvPLyJr41FMlfhioXgbBgu01fxQe13t
 RETXwUI1KNiXfqM/3ZJTlWc0YQ6nHVE34250CZ68xpOJg5Elk9EbFZZOew4e+10L74
 8YUl48XYe0vJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 10:42:48 +0100
Message-Id: <DE2D56N69NP8.2X1SGEBDM92DG@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: apply the one "use" item per line policy
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
References: <20251107021006.434109-1-jhubbard@nvidia.com>
In-Reply-To: <20251107021006.434109-1-jhubbard@nvidia.com>
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

On Fri Nov 7, 2025 at 3:10 AM CET, John Hubbard wrote:
> As per [1], we need one "use" item per line, in order to reduce merge
> conflicts. Furthermore, we need a trailing ", //" in order to tell
> rustfmt(1) to leave it alone.
>
> This does that for the entire nova-core driver.
>
> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks for doing this!

Few nits below, I assume Alex will fix them up on apply, so no need to rese=
nd.

With those fixed,

Acked-by: Danilo Krummrich <dakr@kernel.org>

> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 27d9edab8347..53e718510568 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -2,16 +2,24 @@
> =20
>  use core::ops::Range;
> =20
> -use kernel::prelude::*;
> -use kernel::ptr::{Alignable, Alignment};
> -use kernel::sizes::*;
> -use kernel::sync::aref::ARef;
> -use kernel::{dev_warn, device};
> -
> -use crate::dma::DmaObject;
> -use crate::driver::Bar0;
> -use crate::gpu::Chipset;
> -use crate::regs;
> +use kernel::{
> +    dev_warn,

Should be in prelude and hence can be dropped.

> +    device,
> +    prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +    sizes::*,
> +    sync::aref::ARef, //
> +};
> +
> +use crate::{
> +    dma::DmaObject,
> +    driver::Bar0,
> +    gpu::Chipset,
> +    regs, //
> +};

<snip>

> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 4179a74a2342..895309132ae0 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -3,18 +3,24 @@
>  //! Contains structures and functions dedicated to the parsing, building=
 and patching of firmwares
>  //! to be loaded into a given execution unit.
> =20
> -use core::marker::PhantomData;
> -use core::mem::size_of;
> -
> -use kernel::device;
> -use kernel::firmware;
> -use kernel::prelude::*;
> -use kernel::str::CString;
> -use kernel::transmute::FromBytes;
> -
> -use crate::dma::DmaObject;
> -use crate::falcon::FalconFirmware;
> -use crate::gpu;
> +use core::{
> +    marker::PhantomData,
> +    mem::size_of, //

Should be in prelude.

> +};
> +
> +use kernel::{
> +    device,
> +    firmware,
> +    prelude::*,
> +    str::CString,
> +    transmute::FromBytes, //
> +};
> +
> +use crate::{
> +    dma::DmaObject,
> +    falcon::FalconFirmware,
> +    gpu, //
> +};
> =20
>  pub(crate) mod booter;
>  pub(crate) mod fwsec;
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index b4ff1b17e4a0..4d2a6502a879 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -4,20 +4,38 @@
>  //! running on [`Sec2`], that is used on Turing/Ampere to load the GSP f=
irmware into the GSP falcon
>  //! (and optionally unload it through a separate firmware image).
> =20
> -use core::marker::PhantomData;
> -use core::mem::size_of;
> -use core::ops::Deref;
> -
> -use kernel::device;
> -use kernel::prelude::*;
> -use kernel::transmute::FromBytes;
> -
> -use crate::dma::DmaObject;
> -use crate::driver::Bar0;
> -use crate::falcon::sec2::Sec2;
> -use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoad=
Params, FalconLoadTarget};
> -use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature,=
 Signed, Unsigned};
> -use crate::gpu::Chipset;
> +use core::{
> +    marker::PhantomData,
> +    mem::size_of,

Same here...

> +    ops::Deref, //
> +};
> +
> +use kernel::{
> +    device,
> +    prelude::*,
> +    transmute::FromBytes, //
> +};
> +
> +use crate::{
> +    dma::DmaObject,
> +    driver::Bar0,
> +    falcon::{
> +        sec2::Sec2,
> +        Falcon,
> +        FalconBromParams,
> +        FalconFirmware,
> +        FalconLoadParams,
> +        FalconLoadTarget, //
> +    },
> +    firmware::{
> +        BinFirmware,
> +        FirmwareDmaObject,
> +        FirmwareSignature,
> +        Signed,
> +        Unsigned, //
> +    },
> +    gpu::Chipset, //
> +};

<snip>

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 9d182bffe8b4..de87efaf09f1 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -1,13 +1,27 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::=
*, sync::Arc};
> -
> -use crate::driver::Bar0;
> -use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Fal=
con};
> -use crate::fb::SysmemFlush;
> -use crate::gfw;
> -use crate::gsp::Gsp;
> -use crate::regs;
> +use kernel::{
> +    device,
> +    devres::Devres,
> +    error::code::*,

That's also in prelude.

> +    fmt,
> +    pci,
> +    prelude::*,
> +    sync::Arc, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    falcon::{
> +        gsp::Gsp as GspFalcon,
> +        sec2::Sec2 as Sec2Falcon,
> +        Falcon, //
> +    },
> +    fb::SysmemFlush,
> +    gfw,
> +    gsp::Gsp,
> +    regs, //
> +};

<snip>

> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index aec9166ffb45..b4711126038b 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -2,16 +2,27 @@
> =20
>  //! VBIOS extraction and parsing.
> =20
> -use crate::driver::Bar0;
> -use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
> -use crate::firmware::FalconUCodeDescV3;
>  use core::convert::TryFrom;
> -use kernel::device;
> -use kernel::error::Result;
> -use kernel::prelude::*;
> -use kernel::ptr::{Alignable, Alignment};
> -use kernel::transmute::FromBytes;
> -use kernel::types::ARef;
> +
> +use kernel::{
> +    device,
> +    error::Result,

prelude

> +    prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +    transmute::FromBytes,
> +    types::ARef, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    firmware::{
> +        fwsec::Bcrt30Rsa3kSignature,
> +        FalconUCodeDescV3, //
> +    }, //
> +};
