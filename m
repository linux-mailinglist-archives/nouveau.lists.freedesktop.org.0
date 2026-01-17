Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943FD38E32
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 12:24:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD39510E0AB;
	Sat, 17 Jan 2026 11:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JadbjWt8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 54E4144CB3;
	Sat, 17 Jan 2026 11:15:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768648531;
 b=B6X7vRbtKheufIMh0Z5tIXhoSS349yVtXyM64Soxwj8lRVBXgaWAzX3OMd0/Z/lsx208/
 1NTdK3/ztMZoXbUMCVgMzL713U/Ez8iuBNpWLRpHn0XuX2nZ2EH7/YozzoYE1splWI7WRot
 RMGFsLdictC4ijkSaamTBb+dvaPhrTGURAFEJseDJOmKZQkVq5YRgc6aELNYouCS36/wfv6
 NuoFdbYyXYjTMcUtghzxPDKzsGl2q6yoMfPcjMtwlxQmC2K0gO49DOYkkahhiclmFUM8utF
 d/EKRZbDx+35H8KWEq1Q297hWNjUEvuMWTFfY/Cu72H0WKq9I9wGyzqx1qGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768648531; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sdUdwh0/kELsmG/W/xSwG0nO6D8TCJ0rO7FAQ1hzi6I=;
 b=xGmiCinjNxRWofzq0dfC8vvvoiNlvuxhoOwKs4PYepDbEUrap32QUhj7HE012ECDVg3t4
 HTbQ9L4KTXsHdoMiD2v3ZgqeTSk1Sx0s8n4eF1rgrL+mYIdeWob+jhot2YfErO+wkGEWq/u
 t1YkzmiQop76eR/swimh4bBFCBPm4aH4A0VFxM/qCyTiALbvhUBUK7/MNRPdjz6wrN36vOW
 bQNkJkJXWI7xUo9OIjElgggDw34vXcYf4kdJVdAwa1YpLwrsStEACBeNGd2Mb0TctUw83iJ
 4yVTsro7GKGN/CzJV43Hk46POwXoe2HWAhHFPuspSXenaNtmzULN98u95zYw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 197DD44C9B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:15:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEFA10E081
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:24:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3366840C13;
	Sat, 17 Jan 2026 11:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E6EC4CEF7;
	Sat, 17 Jan 2026 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768649046;
	bh=y1VqaXEkPKmolU8tuUd7ehCwYdrV2lX2sTBowpAwuGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JadbjWt8wCHgJkTrvTK+O2Xf7dHwdsca3hEosLp8S7+IqgMtVQmW+ukBAISkpZ0xp
	 2/vvvXZVXu6I0vK41Al3PRhYFrpeMARqmpx535iqVdHDcfzbKshyVsr+DZsRpGQ0fv
	 gK5ifup+WWV1K25heb2ygdldWiEFJOuJOT+lUSVIF9PKHAYdZo0nA92kuXSFsBOBUf
	 9awmRbPKrBKg5pSBeYNEBvDY4K3HKdlgczx1m+/HdWXLiv7B73GiQ+o6zELGMWHD0K
	 pQfubArMSP/t+p50OkZ/urj5k+iQBJ9Gn0ZWMW84JYc62KwALaj9WF6or4vBvOBZQI
	 Yx20OVzQsWUOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:24:02 +0100
Message-Id: <DFQTRDK9BO2M.995Y3QDQM7CG@kernel.org>
Subject: Re: [PATCH v5 5/8] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-6-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-6-ttabi@nvidia.com>
Message-ID-Hash: E2UI6NJDPYLKGGGRAE2RMLLVSU4Q447X
X-Message-ID-Hash: E2UI6NJDPYLKGGGRAE2RMLLVSU4Q447X
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E2UI6NJDPYLKGGGRAE2RMLLVSU4Q447X/>
Archived-At: 
 <https://lore.freedesktop.org/DFQTRDK9BO2M.995Y3QDQM7CG@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Replace the module_pci_driver! macro with an explicit module
> initialization using the standard module! macro and InPlaceModule
> trait implementation.  No functional change intended, with the
> exception that the driver now prints a message when loaded.
>
> This change is necessary so that we can create a top-level "nova_core"
> debugfs entry when the driver is loaded.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..d0df8db3693d 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,13 @@
> =20
>  //! Nova Core GPU Driver
> =20
> +use kernel::{
> +    error::Error,

This should be covered by prelude.

> +    pci,
> +    prelude::*,
> +    InPlaceModule, //
> +};
> +
>  #[macro_use]
>  mod bitfield;
> =20
> @@ -20,13 +27,26 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -kernel::module_pci_driver! {
> -    type: driver::NovaCore,
> +#[pin_data]
> +struct NovaCoreModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,

Let's import driver, such that this becomes driver::Registration<_>.

> +}
> +
> +impl InPlaceModule for NovaCoreModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        try_pin_init!(Self {
> +            _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),

Same here.

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

Should be a separate patch.
