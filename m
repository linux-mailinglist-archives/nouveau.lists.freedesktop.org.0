Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB0CBAF55
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFFB10EC8D;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="iN4wyHl4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047BA10E698
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 03:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=protonmail3; t=1755661849; x=1755921049;
 bh=Pcc0kL2+l9Pmm6KFyVG73R66uWz7dqU0MavY6sZy6d0=;
 h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=iN4wyHl49SXYoo53Uk5Gv10Pdv8gmbqWjP6t/XOahDK1Zd5b8JnMiAEZDhzcMfjXU
 q2bW3kwrjQuPCaWTe/Rj5BHmxIiOB3yoXdgIh1Wu8sZ4tFT/1MK8+rxphnvzt97bLT
 tX+lzE8NJDfAr7kc209VeF0V9HEwanB9bHCMiiYZdvIwGoyB4BtLZCqTy0gn0cITxg
 lQ8tyIBL3cR7NgQ4x+hh0XhvauDMHZfnb/ekYLaSmkYGVij4p3dylQIGM+4now+Qlu
 8JJmsdLsWFO2GNM7Nr60E+dEnEFRH1tPUO2p3jnGCPTZqByGRBdrJme312MutMMi7m
 NqG6apNiGXStg==
X-Pm-Submission-Id: 4c6CCq1vDSz1DDrj
Date: Wed, 20 Aug 2025 03:50:44 +0000
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
Subject: Re: [PATCH v2 2/3] gpu: nova-core: avoid probing non-display/compute
 PCI functions
Message-ID: <aKVGFC4UVpjyAXWO@archiso>
References: <20250818013305.1089446-1-jhubbard@nvidia.com>
 <20250818013305.1089446-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818013305.1089446-3-jhubbard@nvidia.com>
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

On Sun, Aug 17, 2025 at 06:33:04PM -0700, John Hubbard wrote:
> NovaCore has so far been too imprecise about figuring out if .probe()
> has found a supported PCI PF (Physical Function). By that I mean:
> .probe() sets up BAR0 (which involves a lot of very careful devres and
> Device<Bound> details behind the scenes). And then if it is dealing with
> a non-supported device such as the .1 audio PF on many GPUs, it fails
> out due to an unexpected BAR0 size. We have been fortunate that the BAR0
> sizes are different.
> 
> Really, we should be filtering on PCI class ID instead. These days I
> think we can confidently pick out Nova's supported PF's via PCI class
> ID. And if not, then we'll revisit.
> 
> The approach here is to filter on "Display VGA" or "Display 3D", which
> is how PCI class IDs express "this is a modern GPU's PF".
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 274989ea1fb4..4ec5b861a345 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
> +use kernel::{
> +    auxiliary, bindings, c_str, device::Core, pci, pci::Class, prelude::*, sizes::SZ_16M, sync::Arc,
> +};
>  
>  use crate::gpu::Gpu;
>  
> @@ -18,10 +20,25 @@ pub(crate) struct NovaCore {
>      PCI_TABLE,
>      MODULE_PCI_TABLE,
>      <NovaCore as pci::Driver>::IdInfo,
> -    [(
> -        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as u32),
> -        ()
> -    )]
> +    [
> +        // Modern NVIDIA GPUs will show up as either VGA or 3D controllers.
> +        (
> +            pci::DeviceId::from_class_and_vendor(
> +                Class::DISPLAY_VGA,
> +                Class::MASK_CLASS_SUBCLASS,
> +                bindings::PCI_VENDOR_ID_NVIDIA
> +            ),
> +            ()
> +        ),
> +        (
> +            pci::DeviceId::from_class_and_vendor(
> +                Class::DISPLAY_3D,
> +                Class::MASK_CLASS_SUBCLASS,
> +                bindings::PCI_VENDOR_ID_NVIDIA
> +            ),
> +            ()
> +        ),
> +    ]
>  );
>  
>  impl pci::Driver for NovaCore {
> -- 
> 2.50.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
