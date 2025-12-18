Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03561CCC5AA
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:47 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6210EA21;
	Thu, 18 Dec 2025 14:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sBEbtPot";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B48BE45644;
	Thu, 18 Dec 2025 14:48:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069294;
 b=ZaXOBt5SotfItfheRP/7nSiNjHiRnYhcP/Hhiy+UR/VEfUKugIgyLSS6Symf+a1rUsjW+
 bs3kSL1pMuLP/kmcAZ+PkBvx2fEV/G3xl18/QEO8C7S9jbbXsYtRU72gfEg+GYX1B52EA+6
 oV5/MkPyTOGqJv6VsB04JW2oNekDxnd93XUdaP60SwaCcUB6B8i/JtnGCJAElxP5OZj3MnB
 CHnQ1qHbIL+W3MqBIy6hbkog7iw7IW1iDw4Q9VMSaVGIYE4Svcow8XnlxQIe1eHeGzqIAwR
 A1TJzzv6Td5U9fvvzdlsoNz18WwV1Q3Xi87jvNvs3V1db25P93b7unjeV9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069294; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vgIb/JAKdJ9AMUp0JYBMyMI1p+JfdQH1RwjrrN6xlRY=;
 b=zlBaPWJsZA9/1BTY+QOjGL9c6lFGEVl5VHv5e+/45/6emvABKoAjSw775xl0nsnI+Ohwz
 2kqADMAppWJ9kr5TM9uuxmOqM55oKVVjb2iNXWK59wVT5v6Oo9bn2AKIWq+4fSy9TwFPN2A
 IWujztkOYogKQo/HBuWzOk0MSMOEK2Q7UndB+RtXWwvuoyWYlaG/NhIyi2sKBIx+AD2GVGs
 tP8+RNz4kpybhXVys3w90d8DPevMvEbjRxm7w9S8/sbdltO/k+l/lbXL4l0nKKt924fpJ55
 5LVbLkW7W+PagGHj+AtwKImQTFgoOQ2F9kSmtj0pi8WlV6gYjKYn+z6/0H6w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 906FF45667
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:53:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B980E10E888
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 09:01:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F250160010;
	Thu, 18 Dec 2025 09:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A25C4CEFB;
	Thu, 18 Dec 2025 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766048479;
	bh=afeAQJRCnu4GRHnu5E5kfLOK1xWhPyYLbd+eFtITJ+w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sBEbtPotMzYJvW58gLZbIA2sN4jEkILwBFePD5sTuF8TqonBXGW4QYxLuCvusY7gI
	 U/9bFCey1JZhHUyfb5zyHXNcyvVxlwjRjmlww/6IflJuJNGwsEC/y8AVlPNB/aPCPW
	 PL4oG/YylRUKKTfgypYpUN0FpISqhjrmlI7GGLZ0MQuu6TRQvwvvRfSJiqwSVIyXQA
	 RSE6QRmp5bWu1VeRhsshxE9wNCD2Yi34uah2mTiTbugyZqE8mRdZ3ZNk/Mbk/nc4zN
	 GfmFcosRvKDbOv0MXWQLFV22MashEyvjpmIk0oaB+jaywLnt760m1oArdLowTi9ipo
	 tz3m4ksujvphQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 10:01:16 +0100
Message-Id: <DF17XPT1MU64.ZXT4LSXR9CIG@kernel.org>
Subject: Re: [PATCH v3 5/9] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-6-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-6-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PIQ7WBSZEVHHBDG3WMF4PBPGMBBG72PH
X-Message-ID-Hash: PIQ7WBSZEVHHBDG3WMF4PBPGMBBG72PH
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PIQ7WBSZEVHHBDG3WMF4PBPGMBBG72PH/>
Archived-At: 
 <https://lore.freedesktop.org/DF17XPT1MU64.ZXT4LSXR9CIG@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index b98a1c03f13d..01353be103ca 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,9 @@
> =20
>  //! Nova Core GPU Driver
> =20
> +use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> +use pin_init::{PinInit, pinned_drop};

Please use kernel vertical style [1].

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

> +
>  #[macro_use]
>  mod bitfield;
> =20
> @@ -21,13 +24,27 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -kernel::module_pci_driver! {
> -    type: driver::NovaCore,
> +#[pin_data(PinnedDrop)]
> +struct NovaCoreModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> +}
> +
> +impl InPlaceModule for NovaCoreModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        pr_info!("NovaCore GPU driver loaded\n");

Please don't add such print statements, drivers should be silent when they =
work
properly.

> +        try_pin_init!(Self {
> +            _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
> +        })
> +    }
> +}
> +
> +module! {
> +    type: NovaCoreModule,
>      name: "NovaCore",
>      authors: ["Danilo Krummrich"],
>      description: "Nova Core GPU driver",
>      license: "GPL v2",
> -    firmware: [],

This change seems unrelated, please send a separate patch for this.

>  }
> =20
>  kernel::module_firmware!(firmware::ModInfoBuilder);
> --=20
> 2.52.0

