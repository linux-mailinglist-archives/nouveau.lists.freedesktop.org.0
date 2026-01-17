Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C107DD38E75
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 13:18:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C52D10E051;
	Sat, 17 Jan 2026 12:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z13Ic91S";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AD86144CB3;
	Sat, 17 Jan 2026 12:10:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768651807;
 b=Ph3ObkG3tgNjew+EBNPKVud2ozDzv1ENuVoUpFVeRmtJ/iIrq7uUMCogxPbnxGBfpoXFe
 k4vmTytik+BPYBMJdQ6pSQUAZM0jnsDS21WQodzKhKyza/oAqNP1kxS+3gzhKgnzVOsLZzT
 hso3eEztUb0cpafvDA10TcwZ9g5YieVXqFX02uVZUi08T1N52x0DQFzqc+HnkHpK8gxmc6i
 HWs0hjlhp7m1Prpa3HDVRx7UpUvNg62EuWIn/GfayuXYMcXDnneVXOJdycbv6tWr9pXtxQb
 637MAp/3Gw8aALOICWt8N3XplMlrHECKM60/TrZx1OOIHAGGGJSqlHSn9YoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768651807; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Zi8LCWryDhvntCih4btEEYmkuq5T1pxnHKiRq0WgCac=;
 b=gEPskIf/YSPnc779AiKdID5wjortQUO6SMpdAlR5XtRhr9ByYr6U3J4hT5eZ/3r/omhFX
 4o3Fh81qwvuyG8b/t0ul02K3mgIrYFZN6kIG3yjvjm1x//ZjO0jhzvxr4VdzlDBenBWzkJW
 JckMct4v9qH6DBx5hJyMJxqmgJ3dGi+oRy2ESSIMzkvyLWXDowxYhxlQ3qqCT+j72Lmvl6K
 bYVy8vhgXhGYvAS3CZSSTR72d4/sBVUyY3vGnuTN/qsbGpkfSptLgomkYCBXJKfeuxr0A2+
 j9hElusceGZRl5GPyH8PM/upPdSGeDdDqrtVDNNkI7VDqp6xNO8t1QOxceJA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4FC8844C9B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:10:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0C310E008
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:18:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA9F560127;
	Sat, 17 Jan 2026 12:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0090CC4CEF7;
	Sat, 17 Jan 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652321;
	bh=1VFlYAb3J6PFjrajzHXUkRqFDo/2WFsWKu6N0B4R6lM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=Z13Ic91SW1AoXurh8xqXxhjcjj3n0TfsMf/N1IwLVTcNzL4zaCxiNZY3wnYR2oxjR
	 e/6hb1MGlTVMlBuwqbaTcpxbCwbzV8N66Rl1wVI8uH5dY5DFP1r6rBOUB7vH01pHJ7
	 +0ERx0JE7swKrlFVacKqN8r59FtM/KOruYROIeDNNqHOXwBB7ogKPhOWUdUzcxl+QH
	 YRa4R/mpcMc4gGEJy8pVW17QfFivipnWOv6JbAd51ngCPLwTRIwpfVaLvE0pPLJGEX
	 gzchcUANyqz8t1lZ5I0Ylb3X/4/6zHicsKSOwsdEFvxEP5KXgog3WfoAsWcx2AMuN3
	 LMsFES87JOjxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:18:38 +0100
Message-Id: <DFQUX68AGU1T.1QSGMOBWK6YC6@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-8-ttabi@nvidia.com>
Message-ID-Hash: WMKJZGOKFWV3AYJOW6YFE2THAG3XRBNM
X-Message-ID-Hash: WMKJZGOKFWV3AYJOW6YFE2THAG3XRBNM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WMKJZGOKFWV3AYJOW6YFE2THAG3XRBNM/>
Archived-At: 
 <https://lore.freedesktop.org/DFQUX68AGU1T.1QSGMOBWK6YC6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
>
> Normally, non-const global variables need to be protected by a
> mutex.  Instead, we use unsafe code, as we know the entry is never
> modified after the driver is loaded.  This solves the lifetime
> issue of the mutex guard, which would otherwise have required the
> use of `pin_init_scope`.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index d0df8db3693d..eceefa41cddc 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -3,6 +3,7 @@
>  //! Nova Core GPU Driver
> =20
>  use kernel::{
> +    debugfs::Dir,
>      error::Error,
>      pci,
>      prelude::*,
> @@ -27,7 +28,9 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -#[pin_data]
> +static mut DEBUGFS_ROOT: Option<Dir> =3D None;

Please add the FIXME comment that we talked about in the last revision and =
use
debugfs::Dir rather than just Dir.

> +
> +#[pin_data(PinnedDrop)]
>  struct NovaCoreModule {
>      #[pin]
>      _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> @@ -35,12 +38,27 @@ struct NovaCoreModule {
> =20
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        let dir =3D Dir::new(kernel::c_str!("nova_core"));
> +
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT =3D Some(dir) };
> +
>          try_pin_init!(Self {
>              _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
>          })
>      }
>  }
> =20
> +#[pinned_drop]
> +impl PinnedDrop for NovaCoreModule {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.

The driver::Registration is not yet dropped at this point, so there might b=
e
other driver code running. You have to justify that this does not race with
module_init() (which module_exit() never does) and that it does not race wi=
th
Gsp::new(), i.e. probe().

Note that probe() may run async, so you have to drop the driver registratio=
n
manually before dropping the debugfs dir.

> +        unsafe { DEBUGFS_ROOT =3D None };

You also have to drop the debugfs::Dir.

> +    }
> +}
> +
>  module! {
>      type: NovaCoreModule,
>      name: "NovaCore",
> --=20
> 2.52.0

