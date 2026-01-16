Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B911D386A9
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:09:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17D2510E1D4;
	Fri, 16 Jan 2026 20:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rBMsKbeK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02C4044CAA;
	Fri, 16 Jan 2026 20:00:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768593653;
 b=fWittBCHN/2Oju4nS5jpUnBobuUF0OXuiCAcpyjGn9B34fyhjqDN68e7vvK7s271HiMdn
 +kEzQaNV8RkyCC90to6AwgJ4vL61x3Q3OFRrl0NhE2M4pVPancvexlUC70AxTBuRfbMHomD
 aZ3Irv/uVjs2AAplUecxnhbWo8F2ONZ80qdxDTj21QjXFtPu8G23XIlT50bJVb0KqA0wtAR
 g1n0ktudJwTCAA6UJ6lrdiVkjCrJMpvTAX8mj3+cu3jjmxjcS8muImuZTuhhJ/Ty8g+0Pwv
 d3+eD7mOAAnc13cGqS2ut/mQPqLuPe5mzjvsQPoaWNyFwoZg84GSv03yHbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768593653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EpPcvE86FHI7tsABvoLplPkD+gBvn2ap+SFcFt1BIwY=;
 b=nHtX8YJWbPkNx1vM2UduJ7UnpT0YK+Po6SBfrFctUwKB+eqhIFi7D0cekSHqMdhV40dd6
 Bo1o+Vh4U7KNjzLzBJ5XPalMIG0eV+GKcamNo1ooZm2AJ3hd59INB51FKoRNsrKcQzB56g4
 NsOPO7Hh63XuRz9Q9wxmi6tNhjyBHhouKAeUHBejjUd/I6M/MqbH0E01bQMica/nTQLNd/A
 N44rhIhCarUIH50FtuevTMoFVi6WUhxcynjsW0a2VAUxaQhyJTEzUF4IcB7rxrFFTzfIrBC
 c8jlRwghf+g4m2SUoatu3nc/OIqL7XLkkZxmfcRLZnvcTAZ9+QCBjcgINuIQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E8C640744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:00:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1510E03A
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:09:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB72440780;
	Fri, 16 Jan 2026 20:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7167CC116C6;
	Fri, 16 Jan 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594166;
	bh=EpPcvE86FHI7tsABvoLplPkD+gBvn2ap+SFcFt1BIwY=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=rBMsKbeKNfP/0L4dTqxmM4SevVuwOiA1wptZ6L2YR+4KtReus1oL7bmr2Bjx36puP
	 UFfkO54XdfHid2DuJjnDDnH30g/2S4pR3+HnaldulTC+f0oP3b9U+0a4VzWrV3eJKV
	 Mo3uC/yt11Zy0ZA9BzCSsq0KMtVh+GBPWVzlgMHlvxVy+kJKjfJ+/L1pFrgipCTxgQ
	 wO7hImQ1/3IO9Ya0QIInrs3GFbk0fl4FjOrLtkcfDxNQj2TUCEzT8m0E2jZSorOEn2
	 fyXVroj5n85DuN17tsGzfMNy9eG9aj+lEE7GjB6+oopPuDxmNQevNWhNxpwKSZHT0r
	 mL4nCutJUHODA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:09:23 +0100
Message-Id: <DFQAB2CZQ3O8.3R8RP5YJ6DXL1@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-10-ttabi@nvidia.com>
 <DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com>
In-Reply-To: <DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com>
Message-ID-Hash: 2L5JNBHGO5NLLY5R2AD6EI3SKXRT6EXT
X-Message-ID-Hash: 2L5JNBHGO5NLLY5R2AD6EI3SKXRT6EXT
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2L5JNBHGO5NLLY5R2AD6EI3SKXRT6EXT/>
Archived-At: 
 <https://lore.freedesktop.org/DFQAB2CZQ3O8.3R8RP5YJ6DXL1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 4:23 AM CET, Alexandre Courbot wrote:
> It looks like John and I have a different opinion on which approach is
> the best to handle the v2/v3 headers (a match in each method vs a new
> trait and virtual method calls).

Unless performance is a concern (which obviously isn't the case here), I th=
ink
the dynamic dispatch is fine and leads to cleaner and more maintainable cod=
e.

> TBH I don't really mind which approach we adopt, but I would like us to
> stay consistent through the code. This patch adds the trait and
> implements `Deref`, but then the chunk above still performs matches.

Yes, please be consistent -- Alex' diff looks good to me.
