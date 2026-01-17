Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8BD38E2D
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 12:22:17 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97E1A10E0AB;
	Sat, 17 Jan 2026 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jhUk/iRm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1572F44CB3;
	Sat, 17 Jan 2026 11:13:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768648418;
 b=U4nkilHEU57vWDPQqB5/ptyL6f3O8N3tRSu5mokXmnR9A3qVMB47Oz4ElwCWqnEJpL1Iu
 dCoRcHDh3ilc644yUv2rqfjGR1bGYdp6lWhX7nXixoD70OJQE0W0GPRbtXb1uvb1pfmfURn
 I17inWwQ08EiMh45OET8pSDYZFPOFeBfBYu7fD70zagNFgsEZlxG0PguL979aAjVESVISLl
 06aEDqbOz+7DyFXxtwjYIcGhiGaWGWhbfH0+7DOlZ1ekQzAMvYOhSnIv8kkXWes4ocuOtmK
 PZZNq6DsdotPumc7LaK6E3m2XlhBl+iZKeJwxUks+bwe/wNfs6fl3hg/rHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768648418; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X/P3NWtMA5222OVjK2SKjJ9i88dRpT4mPgQkQ7EkbNk=;
 b=ixexYxzlatlKZBw/lwkPZppt9VfyKLF46pwut91EJ1uDHpddhFN8cB6rC+7J7AEI22gZe
 k+r7UgUHXn2KVr2Tz5EeQKxKqmpzrJHTSfWvSJAmfgrO4NPNHJzVCTxR1HTttVOkl0dTK++
 qWpl/CAp67e6qtmak7l2KmMMY/33nnbWVm0MExHxSXW4ypn1qN1eb1lVh1T7RUMAMxr/YI1
 oyxNZMCr9AmWVvPfqrdvT4pOeZ0SdkiAgrnfsFjgpPcpIfOSPWglYBIfkGRiTDTDnpuEibU
 BZd2fhTwu616gScLXNe0HmLUt8qnihOUz6DmYOHw5FavZjeCK0Nbl0A/R37A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1FCE244C5E
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:13:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6634310E081
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:22:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8CEC60127;
	Sat, 17 Jan 2026 11:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8608C4CEF7;
	Sat, 17 Jan 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648931;
	bh=gQYle7bmqsKeFxTdSshuxLs1w1nsZICRxGz1P8bBGKI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jhUk/iRmczWd0SBcURXiYN7qpZKkmECliDQ7Llt3hAwycPxuXwHbbdII+20NcXm52
	 t/IBJBWSh0zyTaCyACIfQNcEGqxYWqFMlEK7SITpJG+7QqS70SR99cwlqrBogTxsze
	 8h/kKmNsFwtOg60Pmhwn9qhK+upQY5zoSb5oq8CaNZVdA5am6xcKU+AW4rVC6FnLfB
	 VhGp+qOVEBEZBnEaqggD8JW8dOx4LmPBUWKj28nEe/cX7Nm0VeQQELx84Ye6PwGVQ7
	 276W8yds15RF+xWPT+OmmRKF+MF9p7fgtRnY3m3Zz6+AG4N0umgBgp4cRzQPglkaUX
	 lu58/5KzRC4SQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:22:08 +0100
Message-Id: <DFQTPWTDRYQF.U2OSSLI2173W@kernel.org>
Subject: Re: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for
 LogBuffer
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-5-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-5-ttabi@nvidia.com>
Message-ID-Hash: RCF4TZDLC6PMZJM4L2IW6O5EPR4X3NVB
X-Message-ID-Hash: RCF4TZDLC6PMZJM4L2IW6O5EPR4X3NVB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RCF4TZDLC6PMZJM4L2IW6O5EPR4X3NVB/>
Archived-At: 
 <https://lore.freedesktop.org/DFQTPWTDRYQF.U2OSSLI2173W@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 766fd9905358..273327c33aa7 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,45 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {

Let's move this code into rust/kernel/dma.rs and make it an impl
debugfs::BinaryWriter for CoherentAllocation<u8>.
