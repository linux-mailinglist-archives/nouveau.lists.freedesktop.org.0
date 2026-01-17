Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C3D38E77
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 13:21:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A77CB10E051;
	Sat, 17 Jan 2026 12:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BjlY7aZK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 085EB44CB3;
	Sat, 17 Jan 2026 12:12:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768651952;
 b=bih8spWjnCyIMXhMJzZ34zAFfG8nbaZfzsv68f8qzM0cZd6eLRvdn23CvEieCbxVhdqJ2
 rKfI/zYzHqT4yrBo8jDhmhvnCY5EGwsuSywQpF6tAAMPfsWR7YMmh1EO8qaj3WCxt1DQUUq
 pAitl2C/LnWHLyTzmwH/bp3RJ/I1fHE/zh2AyzmAGfr/FnsxbAx1V6ZHgazM0zF25RTe/hT
 l7dqMbQ9NmFaqF8CdzRguaWXGz+O7F0T4wRuTZDmTPmcnwERN0rbzmAh4vy/j7quk6tqQ4u
 v69OyxdggKvcY/JYRPa5pZia+ZSly5cmOvWsIIDv+rqGdIOAgo74nhVlHDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768651952; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SH2DyTk9WG2cN4FDfXOj5bDhj3S0QO3qhALybBsb7qM=;
 b=Y75pA3M/kAq12Wget89k/JdABGcb1J1IR2sCfVXWz3rPMWy4kAevjZmxpz5GSaiGEspTB
 L2iYW+jnlceF2qUGWOOy0TntqW43bpN4zg+eayEOMx+UCkraT6spTPUCOq4vzFLrXJpOWDh
 zGeONLTheGvJXhqE8xqL0vQls3X9XyrKywA8Wp1da+igfx4i7g5Q/WssQ4+cTf1TXhq49XC
 kyaoJsfDujvg1/+8V3Xc0vqa61ekvlaMdaub7+yraPkazcQdCHrFl+lWoH8qW23iLwm3eE/
 YH2AXzQBsueQ52lLWM6uNTLgAzmRfdF5lHy/AXYT9yeDhwymSUtX1uviyKCA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 62E2344C9B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:12:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B25CC10E008
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 12:21:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C580660127;
	Sat, 17 Jan 2026 12:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D6EC4CEF7;
	Sat, 17 Jan 2026 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652465;
	bh=aTKgDt63RyfhxxV4HEUKvM9YGl8WmNS/R2HSy/ldFSo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BjlY7aZKzPmlIHTKY75wC43f0NCqxcl+Z0PZ6VPtcQ5iy+Lki2wglc8SOAZlmLAeF
	 az/0tGtq4RonUAC8r1bIEedl8wkK/HLIaatIS2LagSTVdttLpdZ797JfzOA/YrmV0+
	 nU5eAZYYueh4B18cPJTc31gBgGnaFSH0twPWowY+Vg976mjSYiXtbWOq6Vtn6Clm4W
	 RYDcXpr8KeGpTqF6Bf85zMiSm4m0RrtLq5ixSXPXRjXz4lv9/9hOpAZwsDb/GrFdg+
	 I64c0SRDo6rf2jLlqhGECa1JG7z4MdJu2NgIaxpm4gEKVeKSUdy8VzlsZABCaxXO8B
	 ZD2szie8uccKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:21:02 +0100
Message-Id: <DFQUZ0DA9LJ5.2194XUZDLF0T2@kernel.org>
Subject: Re: [PATCH v5 8/8] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-9-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-9-ttabi@nvidia.com>
Message-ID-Hash: E5VCWFPCQQ4M2XQGBT4TDLSHVZDGN3QN
X-Message-ID-Hash: E5VCWFPCQQ4M2XQGBT4TDLSHVZDGN3QN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E5VCWFPCQQ4M2XQGBT4TDLSHVZDGN3QN/>
Archived-At: 
 <https://lore.freedesktop.org/DFQUZ0DA9LJ5.2194XUZDLF0T2@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
> are the three primary printf logging buffers from GSP-RM.  LOGPMU will
> be added at a later date, as it requires it support for its RPC message
> first.
>
> This patch uses the `pin_init_scope` feature to create the entries.
> `pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
> reference by delaying its acquisition until the time the entry is
> actually initialized.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 45 +++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 273327c33aa7..4b194bb805b4 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    c_str,
>      debugfs,
>      device,
>      dma::{
> @@ -101,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>      }
>  }
> =20
> -/// GSP runtime data.
> -#[pin_data]
> -pub(crate) struct Gsp {
> -    /// Libos arguments.
> -    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +/// Log buffers used by GSP-RM for debug logging.
> +struct LogBuffers {
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
>      logintr: LogBuffer,
>      /// RM log buffer.
>      logrm: LogBuffer,
> +}
> +
> +/// GSP runtime data.
> +#[pin_data]
> +pub(crate) struct Gsp {
> +    /// Libos arguments.
> +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    /// Log buffers, optionally exposed via debugfs.
> +    #[pin]
> +    logs: debugfs::Scope<LogBuffers>,
>      /// Command queue.
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
> @@ -163,15 +171,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev =3D pdev.as_ref();
> =20
> +            // Create log buffers before try_pin_init! so they're access=
ible throughout
> +            let loginit =3D LogBuffer::new(dev)?;
> +            let logintr =3D LogBuffer::new(dev)?;
> +            let logrm =3D LogBuffer::new(dev)?;
> +
>              Ok(try_pin_init!(Self {
>                  libos: CoherentAllocation::<LibosMemoryRegionInitArgumen=
t>::alloc_coherent(
>                      dev,
>                      GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgum=
ent>(),
>                      GFP_KERNEL | __GFP_ZERO,
>                  )?,
> -                loginit: LogBuffer::new(dev)?,
> -                logintr: LogBuffer::new(dev)?,
> -                logrm: LogBuffer::new(dev)?,
>                  cmdq: Cmdq::new(dev)?,
>                  rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_=
coherent(
>                      dev,
> @@ -192,6 +202,25 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>                      dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new=
(cmdq))?;
>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs))?;
>                  },
> +                logs <- {
> +                    let log_buffers =3D LogBuffers {
> +                        loginit,
> +                        logintr,
> +                        logrm,
> +                    };
> +
> +                    #[allow(static_mut_refs)]
> +                    // SAFETY: `DEBUGFS_ROOT` is never modified after in=
itialization, so it is
> +                    // safe to create a shared reference to it.

Well, it is modified in module_exit(), so you have to justify why this can'=
t
race with module_exit(). I.e. because you drop the driver registration firs=
t.

You also have to say that the debugfs dir is created before the driver
registration.

> +                    let debugfs_root =3D unsafe { crate::DEBUGFS_ROOT.as=
_ref() }
> +                        .unwrap_or_else(|| debugfs::Dir::empty());
> +
> +                    debugfs_root.scope(log_buffers, dev.name(), |logs, d=
ir| {
> +                        dir.read_binary_file(c_str!("loginit"), &logs.lo=
ginit);
> +                        dir.read_binary_file(c_str!("logintr"), &logs.lo=
gintr);
> +                        dir.read_binary_file(c_str!("logrm"), &logs.logr=
m);
> +                    })
> +                },
>              }))
>          })
>      }
> --=20
> 2.52.0

