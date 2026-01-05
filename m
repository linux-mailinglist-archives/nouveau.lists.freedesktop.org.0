Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC242CF2FAA
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 11:29:15 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6531210E1A2;
	Mon,  5 Jan 2026 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f7gJE84s";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 994D144C94;
	Mon,  5 Jan 2026 10:21:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767608462;
 b=wYxPtz2YS4up5NqK5Q04FMSVzB1/61tAP4d4MMJoGFFBVg9bK/KU8mm7bD2ZzIaKi/e6S
 dn6MMf+uTjoNXQNgLpiJco09ORKIX3H9c8hkOBwKE04zOgxfAtSgX73ZLCgTpX5H1/XguFF
 vcADDeTIZ+SvFsOfbzEktQeJ0NZ1Pt+62idP9dc/PMZnh0zoawZXEpIO8DJBiGMsL+g11+v
 c6IUQyAolXc+4gsF6CpX8yfA+VzIIjz4W7s/864nz1F9c7C980E+h9JhpjK3kBlzrC7b/Yr
 Ts/mKTVzuGHi4nf2bOT/psodgSdxW23DW++ULzKv9OhkhVh1Z2pzPcN5DTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767608462; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZY10t/C1aiDKwdd1UbY3puinOltwLYQ1DyXZdChX+ug=;
 b=P3DZIFcu70MhvGWXcxUiNuOmqQ2KXqJi/M8kwXtJRs9kZXTLosZBF9I9tRdRSPjE/ZoEc
 cgJfaJUypXSR+Q8mAg107ck2PvxOsxoREQy6IyhKAsOJ3s1hF0NiA3YeGmXxjy4Mz/Bkjl/
 1eE8X9q32ADtjiwRKWVrKs7h53JIykMtVNimG4IID5EuomHHppR1OXxrAoxEZNCytIlEpIz
 jRtYkdPGVI31AKm31wG2QCgq4kBBkv0VqB2jtukeR8t4bQyt+H3QTls8S6LX/7qE+bKe91W
 9tCwvLjGtWasuk3bRSPLCsQaO2GOUIdjhI06el4AUpyA8TKKJTs3eXvLTopw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DEBBD44C90
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 10:20:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6947510E0B7;
	Mon,  5 Jan 2026 10:29:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2146C44362;
	Mon,  5 Jan 2026 10:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B15C19421;
	Mon,  5 Jan 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767608949;
	bh=ZY10t/C1aiDKwdd1UbY3puinOltwLYQ1DyXZdChX+ug=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=f7gJE84sdtUUggDQ6srNOAJXkMbLkp28Q6mNDcNb0vpVKgqPcYsnsnTzkd9HzE+rb
	 4ZSP7GnvOwkflwE4x3Tws5bT/cNPyyBbgUjMSFdCM5WGYL8Ux6lWHu/qrgDHDuurRt
	 Vy1ZwD2hccrT3IkU82BsPuSBxFuPH9h71DV+Bru5YojRSTwh/rgxXc5DGAVguhZU+S
	 H7h7KAUqxvCL34c8RkVyBYj0C2yQ6APQq+lGUwC4TLD7866U1bCVpCUKM5rW47FXIE
	 1NkzUbSapRsCwYAAaBlZMXwulxaMv+VtPm+JtPb7B8yHMa5816z3vYh5dgSx+xx+nb
	 urldBqXzJPkzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 11:29:04 +0100
Message-Id: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
In-Reply-To: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
Message-ID-Hash: B2NBGC5YBZG65JX6D3MRNZYGNE7RGRQX
X-Message-ID-Hash: B2NBGC5YBZG65JX6D3MRNZYGNE7RGRQX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maurice Hieronymus <mhi@mailbox.org>, aliceryhl@google.com,
 acourbot@nvidia.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B2NBGC5YBZG65JX6D3MRNZYGNE7RGRQX/>
Archived-At: 
 <https://lore.freedesktop.org/DFGL2QTNH7FE.93EN71L7BXFM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>> Add a derive macro that implements kernel::fmt::Display for enums.
>> The macro outputs the exact variant name as written, preserving case.
>>
>> This supports all enum variant types: unit, tuple, and struct variants.
>> For variants with data, only the variant name is displayed.
>
> I don't think we should be adding this. Display is designed for
> user-facing output and so it should always be carefully designed and no
> automation should exist for it.

In general I agree, but simple stringification of an enum variant for a Dis=
play
implementation is a very common use-case and it seems pretty unfortunate to=
 have
to fall back to either do the below (especially if there are a lot of enum
variants) or having to go the declarative path of doing something as in [1]=
.

Especially in combination with things like FromPrimitive and ToPrimitive it=
 gets
us rid of the cases where we need such declarative macro mess.

Eventually, drivers will most likely implement their own proc macro for thi=
s or
repeat the declarative macro pattern over and over again.

Maybe we should just pick a more specific name for such a derive macro than
macros::Display.

Maybe something along the lines of macros::EnumVariantDisplay? We could als=
o
have an optional argument indicating whether it should be converted to lowe=
r /
upper case.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/nova-core/gpu.rs#n25
