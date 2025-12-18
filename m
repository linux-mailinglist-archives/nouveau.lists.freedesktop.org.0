Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE1CCC5AE
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:55:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4998E10EA31;
	Thu, 18 Dec 2025 14:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KWgYRsg2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5BB154562F;
	Thu, 18 Dec 2025 14:48:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069296;
 b=Sz+L3sKO0j275jJ3TztGaPZzxG8yMFvaYGsk2pqTalKsJjnGXFDS0xygml/MjT2oSdocR
 1IGMW0hFDQ26h4xXGgaMzskVF/UVLO2egBiIZp07L8zEfhBGmsxCyumCswrYEk6mWjxNgMt
 QDxIeC5VadxidOTO+iMOwBvpnO27/Q032J3ZjFC0elpbN/ZispNQPxvPUTvpnMkm+Ay8CIi
 d6PsSZnEv47CvBCAYDXsjvXn3UapEgQGA4QqFthnEVFLxCsSjIp8GVNNkWW4NxW8WAczjGe
 2rUfEaBZbBys3KMfgr6AlzIW8CPtbCirJnlkWZXGvnI/+B5JtGGozS+qB8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069296; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aye5aqYFjN75r3Pp7g2w6KcchjkEF3vYe07D24wcvHk=;
 b=xgHPgH9RTLi4YBOPnztGDzkuC0DksBf+ZIPg8dG6FbnVu3g9M9coCSQpXV+hbm25PE6re
 6QRQ8oCoH9iPwmxRym9TiOm8buqzZPqqn81uw4AihCStYuFPwVI+Z8K3aPm6p2DY4ERru9k
 FLyn0x3eCoIn3k8hwNegopnnJvSffZm1UPttHfYtfuiPyyxfPGHhmU2wAitm544rxdRNKC0
 iKDAb6pPhW07ljYX3y6Edtld3ihC+KDyqf/VEnOAKKCYe42zM8bmtKHfhvO1r0irGVBIQuF
 gCI3XTFC8qtdi648Xhk6h6SGx1VTLqF7XV+zyR6RbgRHaXug2POOdxjv7MDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3657D40057
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:03:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 554F710EC76
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 10:10:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41556600AC;
	Thu, 18 Dec 2025 10:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A00C4CEFB;
	Thu, 18 Dec 2025 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052656;
	bh=k4AnuEM5cM2z9536PBg/Etme6m+ff94jyEewMOwsOmk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KWgYRsg2Zn8mcfSAfiVY5zZ3Mb6ClUOuvpSD1be8ebGq7DKvMBoulmUEN/qqT1ABs
	 kmcu1WtCY/heLLMzzIeORfZjOA3tma5Fre45E7KS0ydN2LLDostkJwZtJwyv126DZA
	 mkKihaIKIyksnmQro1Xs6KG8XNcddQfNUnMiey4Q0sZ1hb66c9HvFicZdS2U8cSwcH
	 tDVQJ1zib5UfbMxzXw4DZdeDFbh1Ol+l3XyCSMfKjWK0vLLCg+g1tZmCbfmYTOVxka
	 WfXbvIrJx2oMktIkqDir5wfGgArm3iunR6/6a1X075eZ5PeLG/U5Xt/cyGgAGNmVT0
	 d9aM+4ae853jg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:10:52 +0100
Message-Id: <DF19F07P95XZ.32ISH5C9QQK75@kernel.org>
Subject: Re: [PATCH v3 6/9] gpu: nova-core: create debugfs root when driver
 loads
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-7-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-7-ttabi@nvidia.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: COIE6X4IB2OSGKXZ2H642RWNBWVWLZGK
X-Message-ID-Hash: COIE6X4IB2OSGKXZ2H642RWNBWVWLZGK
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:48:10 +0000
CC: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/COIE6X4IB2OSGKXZ2H642RWNBWVWLZGK/>
Archived-At: 
 <https://lore.freedesktop.org/DF19F07P95XZ.32ISH5C9QQK75@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
> The Dir entry is part of the NovaCoreModule, so when the module
> unloads, the NovaCoreModule object is dropped, and that drops the
> _debugfs_root, which automatically deletes the debugfs file.
>
> Field order in Rust structs determines drop order - fields are dropped
> in declaration order. By placing _driver before _debugfs_root:
>
> 1. The driver registration is dropped first, which removes all PCI
>    devices and their associated debugfs subdirectories
> 2. Then _debugfs_root is dropped, removing the now-empty nova_core
>    directory
>
> This ordering is critical because debugfs_remove() performs recursive
> removal. If the parent directory were removed first, it would free the
> child dentries, and then the child's drop would attempt to remove an
> already-freed dentry, causing a use-after-free crash.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 01353be103ca..f17505e5e2b3 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,8 +2,7 @@
> =20
>  //! Nova Core GPU Driver
> =20
> -use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> -use pin_init::{PinInit, pinned_drop};
> +use kernel::{debugfs::Dir, error::Error, pci, prelude::*, InPlaceModule}=
;

Again, please use kernel vertical style.

> =20
>  #[macro_use]
>  mod bitfield;
> @@ -24,17 +23,24 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  struct NovaCoreModule {
> +    // Note: field order matters for drop order. The driver must be drop=
ped before
> +    // the debugfs directory so that device subdirectories are removed f=
irst.

This is not correct, subdirectories have a reference count of their parent
directory. Hence, the drop order does not matter.

>      #[pin]
>      _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> +    _debugfs_root: Dir,
>  }
> =20
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
>          pr_info!("NovaCore GPU driver loaded\n");
> +
> +        let debugfs_root =3D Dir::new(kernel::c_str!("nova_core"));

I'd just inline this statement below.

> +
>          try_pin_init!(Self {
>              _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
> +            _debugfs_root: debugfs_root,
>          })
>      }
>  }
> --=20
> 2.52.0

