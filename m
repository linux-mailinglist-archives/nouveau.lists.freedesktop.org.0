Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E1B33FDB
	for <lists+nouveau@lfdr.de>; Mon, 25 Aug 2025 14:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869DF10E450;
	Mon, 25 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iRcvpEov";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECD810E450
 for <nouveau@lists.freedesktop.org>; Mon, 25 Aug 2025 12:47:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 583A85C5D03;
 Mon, 25 Aug 2025 12:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274E8C4CEED;
 Mon, 25 Aug 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756126030;
 bh=HGYdcWZgKIhpwHPJu1s1DccprdUr4BAstL5WhCEEtgA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=iRcvpEovPSlpoqn7pESiOIcG3vbOMQiFFi1c8JCLsHmBfd6BEtH34oKXORDpzEap7
 iVZo+N5qdpf27netp92LZjqDWI37lW63fnddViaI9g8LrpQM4UnNLiag6AXyge8K/U
 9whieV9UY0RBha9YdcRDO8wT8JxKzGWovanQrG5w/C0SwmNesXwbp4cJvPCsviK+JG
 7kUgRtSSWDx9LBHmmXLuKhqGx4e/CDyikC8nFOQ8E6jOSxjoJ1EfTAmKnKLiv+wQ7r
 +u90sKqjqdFI0C9Dk9NNTB7/e9/yt8NV2TDzAs1uhbzgCmIaZRJt1laYh1Df4YzaUZ
 flKsi2/aiyZ/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 14:47:04 +0200
Message-Id: <DCBIPY9UJTT4.ETBXLTRGJWHO@kernel.org>
Subject: Re: [PATCH v6 2/5] rust: pci: provide access to PCI Vendor values
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
References: <20250822020354.357406-1-jhubbard@nvidia.com>
 <20250822020354.357406-3-jhubbard@nvidia.com>
 <DCBIF83RP6G8.1B97Z24RQ0T24@nvidia.com>
In-Reply-To: <DCBIF83RP6G8.1B97Z24RQ0T24@nvidia.com>
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

On Mon Aug 25, 2025 at 2:33 PM CEST, Alexandre Courbot wrote:
>> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
>> +#[repr(transparent)]
>> +pub struct Vendor(u32);
>> +
>> +macro_rules! define_all_pci_vendors {
>> +    (
>> +        $($variant:ident =3D $binding:expr,)+
>> +    ) =3D> {
>> +
>> +        impl Vendor {
>> +            $(
>> +                #[allow(missing_docs)]
>> +                pub const $variant: Self =3D Self($binding as u32);
>> +            )+
>> +        }
>> +
>> +        /// Convert a raw 16-bit vendor ID to a `Vendor`.
>> +        impl From<u32> for Vendor {
>> +            fn from(value: u32) -> Self {
>> +                match value {
>> +                    $(x if x =3D=3D Self::$variant.0 =3D> Self::$varian=
t,)+
>> +                    _ =3D> Self::UNKNOWN,
>> +                }
>> +            }
>
> Naive question from someone with a device tree background and almost no
> PCI experience: one consequence of using `From` here is that if I create
> an non-registered Vendor value (e.g. `let vendor =3D
> Vendor::from(0xf0f0)`), then do `vendor.as_raw()`, I won't get the value
> passed initially but the one for `UNKNOWN`, e.g. `0xffff`. Are we ok
> with this?

I think that's fine, since we shouldn't actually hit this. Drivers should o=
nly
ever use the pre-defined constants of Vendor; consequently the
Device::vendor_id() can't return UNKNOWN either.

So, I think the From impl is not ideal, since we can't limit its visibility=
. In
order to improve this, I suggest to use Vendor::new() directly in the macro=
, and
make Vendor::new() private. The same goes for Class, I guess.
