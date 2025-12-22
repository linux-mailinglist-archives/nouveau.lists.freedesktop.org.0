Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D411FCD65DD
	for <lists+nouveau@lfdr.de>; Mon, 22 Dec 2025 15:28:44 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 120F810E6BE;
	Mon, 22 Dec 2025 14:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YoIALPLq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F23444C4D;
	Mon, 22 Dec 2025 14:21:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766413262;
 b=Hk2QXaO/dyL4UQfmVqQW/grXFjK0xJnfsLcuxbIbbo79QArUk9LjNNe9elzu1199PZ+Y+
 Zm0XRR8Le4CE13okdpjNGrSNvQ9iTKR3uVQ/85dKJ+SIXuPjYyeBM5fq0rRaaCrRwIGDHZG
 iHddV9lLOPUDtpQXC1eIRiGcVq0hXZVbCC9l7hxcQp1eE0rMYSlu1lTwXqzfXX4v9d0jJ1q
 EKrSMh2kCAZLtj8tRzESLL5GoGyesdDPnL75Qo6cZ7CBnpwVrvFVeI/iHYOCUSDNPONYTym
 lgd3L7Tll6DKS6TxeLpiaqSNobmuX2BGAThvwKDbnf4hsGnWFPyiDsPRz5MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766413262; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1IHzftE6pqH7b16lrsnXTjD+Dbu+oz0HhOml5yDROoM=;
 b=I4FkyZ8dhbF5sjoKAKSkF8UyjiwwcSY0dkhH/HcgQ6X8Mi7ljdOb4VtkBQtG/SMNrT7Kv
 3BzpJJQrberrpWAxTGXsHf5c3BpS/wtrirxYqk1zYxNy7ntDme/PX6Zzy68jCPY6v9dGl9u
 b+h+NjOvaqNCKbMWwcUkm5j/3ulKunerjSgCsiNnFZQoZDQ6gYsScgGqK4OQ+I8eIFTEg9I
 S6me6iA8J9xO8p72qX5Ili9gBuEp5Wq1GcHigzdExvdFIGjdugFQi4XUMYt79ccEAgqSqx7
 v9DQfe62DD+fiQZ34i22/c1tFP1gccOblr6iJj4q/+6SzAH1ULleUOZcljlw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F09844C47
	for <nouveau@lists.freedesktop.org>; Mon, 22 Dec 2025 14:21:00 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 953E310E6AF;
	Mon, 22 Dec 2025 14:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766413713; cv=none;
	d=zohomail.com; s=zohoarc;
	b=KmoK9aOCbcgZrCXEi89MPC/gIpCxlQBUXKQYwTtJCAlnQvIByFgwTRxateT/aIUtEg9fHcaTeGCkbuC1DkOHTFYEGqiVRLC3Dfv71OyQPpSKy8EMhwnpw8uy/czWQQKiE0z7fjPqdyCWUK2iMUt+ssRHpAUE3fXxn4ICOVDFh3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1766413713;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=1IHzftE6pqH7b16lrsnXTjD+Dbu+oz0HhOml5yDROoM=;
	b=RWmEgkZWEow31F8vknRJpc9m6UuQWvYHZlY3DGkf+XJ1vpFhfKhe6yuPZSNFWlAgfeF7dDb9Ov5TIaiRHkKZ58qKeI3ghANZfGQJ4gNbrjj/TqwcjhDewGgQtqxrMO1Y619axojK2wr2T8b1VkiFk1yL4TruO5WoX+h2XtCEhAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413713;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=1IHzftE6pqH7b16lrsnXTjD+Dbu+oz0HhOml5yDROoM=;
	b=YoIALPLq+wbCnQ4N2DbH+pQfQLM4GxpojNfXYQYNgCz0AklbpBBfOL5+j48834p7
	H95HlUgc5W+NlloCm+B+1HXcx3165HvtMFgNlz86+ikg2u2o2ideb7Ite00NSAa8aJX
	fXhgHHdTVx5jq++BtjbB3qQGgloH58aBCfIDLWRU=
Received: by mx.zohomail.com with SMTPS id 1766413712508187.41210361032677;
	Mon, 22 Dec 2025 06:28:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
Date: Mon, 22 Dec 2025 11:28:15 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF29924C-81D0-4478-908B-204C3071EF0A@collabora.com>
References: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: REK46N2XQYEBLJI2RXY7UPFHSRSO5U54
X-Message-ID-Hash: REK46N2XQYEBLJI2RXY7UPFHSRSO5U54
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/REK46N2XQYEBLJI2RXY7UPFHSRSO5U54/>
Archived-At: 
 <https://lore.freedesktop.org/AF29924C-81D0-4478-908B-204C3071EF0A@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



> On 22 Dec 2025, at 09:20, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> drivers/gpu/drm/nova/driver.rs  | 12 +++++-------
> drivers/gpu/nova-core/driver.rs |  5 ++---
> 2 files changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 2246d8e104e0..d24ade17f7a0 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -1,8 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> -use kernel::{
> -    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, =
prelude::*, sync::aref::ARef,
> -};
> +use kernel::{auxiliary, device::Core, drm, drm::gem, drm::ioctl, =
prelude::*, sync::aref::ARef};
>=20
> use crate::file::File;
> use crate::gem::NovaObject;
> @@ -24,12 +22,12 @@ pub(crate) struct NovaData {
>     major: 0,
>     minor: 0,
>     patchlevel: 0,
> -    name: c_str!("nova"),
> -    desc: c_str!("Nvidia Graphics"),
> +    name: c"nova",
> +    desc: c"Nvidia Graphics",
> };
>=20
> -const NOVA_CORE_MODULE_NAME: &CStr =3D c_str!("NovaCore");
> -const AUXILIARY_NAME: &CStr =3D c_str!("nova-drm");
> +const NOVA_CORE_MODULE_NAME: &CStr =3D c"NovaCore";
> +const AUXILIARY_NAME: &CStr =3D c"nova-drm";
>=20
> kernel::auxiliary_device_table!(
>     AUX_TABLE,
> diff --git a/drivers/gpu/nova-core/driver.rs =
b/drivers/gpu/nova-core/driver.rs
> index b8b0cc0f2d93..5a4cc047bcfc 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -2,7 +2,6 @@
>=20
> use kernel::{
>     auxiliary,
> -    c_str,
>     device::Core,
>     devres::Devres,
>     dma::Device,
> @@ -82,7 +81,7 @@ fn probe(pdev: &pci::Device<Core>, _info: =
&Self::IdInfo) -> impl PinInit<Self, E
>             unsafe { =
pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
>=20
>             let bar =3D Arc::pin_init(
> -                pdev.iomap_region_sized::<BAR0_SIZE>(0, =
c_str!("nova-core/bar0")),
> +                pdev.iomap_region_sized::<BAR0_SIZE>(0, =
c"nova-core/bar0"),
>                 GFP_KERNEL,
>             )?;
>=20
> @@ -90,7 +89,7 @@ fn probe(pdev: &pci::Device<Core>, _info: =
&Self::IdInfo) -> impl PinInit<Self, E
>                 gpu <- Gpu::new(pdev, bar.clone(), =
bar.access(pdev.as_ref())?),
>                 _reg <- auxiliary::Registration::new(
>                     pdev.as_ref(),
> -                    c_str!("nova-drm"),
> +                    c"nova-drm",
>                     0, // TODO[XARR]: Once it lands, use XArray; for =
now we don't use the ID.
>                     crate::MODULE_NAME
>                 ),
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-nova-c13a8ec1d068
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
