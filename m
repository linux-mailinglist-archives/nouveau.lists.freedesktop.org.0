Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C351CD39121
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 22:36:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19CC110E1E9;
	Sat, 17 Jan 2026 21:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uEP4OsZ+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9228844CB1;
	Sat, 17 Jan 2026 21:27:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768685247;
 b=m3dTEbQnEWwgvCE6bEzfkm7ub8AmwCEzKeUoC4SHpq+itXRWX2+Brj/jCb2drvfeh+nly
 XuXsT2XxoStSXJ0ao21FtdTeejgnYJQwDECCat62Pq517GLsKDDc4nh+CG1exnYuFCl89Kf
 Cy90SGNLeQoMgkFl69PxJ/n9LZqrORfIYDjCWS7Cvu2qOFhwTzZBFZH4p6rC6mAPV1Ep4k4
 NPdxj6O9OzPWNBQHhvcYaRTLz7K1LsmsysR7U0/0JtA/H6GXHBr/hKy6us4lwI16w//0NbX
 YNXYYBA5aKA/OjAKrxbRUHZEx6TLUP20prASk7RwUgZ3U+8IsDQ7RgyMk9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768685247; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ghGIwWhcvd9DsGvqcUX2//Ilh/CAPkG7H6PCX6daWuY=;
 b=SSMqg3Q0m3sbFwE/hkx8gKeuk/C7LaECp6+jzPPYWx9kTX6gn/AmM5jGNbrFkX1TpxxZR
 2xPEQZyesQp6dyLMXcbGr7zJizV42AqBNDI6bbbeUiPr1qWtTJf2CoSpRI8PcwfLyWpL+CQ
 l6I1VXCoiKjEqNtpkVKXYOtXn9x48ggQ5WBcNERIYeUmvxqNad/t99kHglsLyGUErBqFeOj
 1NiLo2f0p2fb7bssIlrDC2Agrmf0RdSSj9yhGwXiqeQwXoKw0sAi/3XPUtOEjNG7Rc7OEf+
 KLFLfpFUk6NrHWGDgI3+Q+yLTtiYRBvgVuJa+LNxiYnWS/9CRWgobX7h/Jkg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F2B6F4032A
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 21:27:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2760510E15B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 21:36:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBC0B40D79;
	Sat, 17 Jan 2026 21:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21940C4CEF7;
	Sat, 17 Jan 2026 21:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768685762;
	bh=H0I0q9BLGW25tNeWsLq3ULFRIxBx3XEGEQrTR1cuWZs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=uEP4OsZ+JCm2i4Vkh9FRrqcAvjKO07nTNQRc8Oh9eM7qUMdx6YcCdkdSsF2y9T2aa
	 fT/La48ikDpHr2MYU3Soqae8umqYvpQZwAS86H5lSsAakmz0wgED0Y5xXscieIZH8D
	 wv/+FrnvElnozbI2OieU9pjFMJ7h8W1tbBWPOWIsGfKq2YHOjYFN4Z11qEu5e0ur48
	 aTS3yH21czDsJ1m0iIv0AzQZ7Ud/o5jsBs/y6cC6gHUf6vFrlbQsXzRWHGfZMLg/U5
	 1bW7QV/s/IG+ZJ3n/Bmb/gfyQuEQQWplArcWSnoDlXHq621iGS2Eg2KOABYnKypFOu
	 9svvDz20ccCaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 22:35:59 +0100
Message-Id: <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
 <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
In-Reply-To: <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
Message-ID-Hash: ZZP6MAKUIPLXYWNL6JPFC3TMW3XFUO5D
X-Message-ID-Hash: ZZP6MAKUIPLXYWNL6JPFC3TMW3XFUO5D
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZZP6MAKUIPLXYWNL6JPFC3TMW3XFUO5D/>
Archived-At: 
 <https://lore.freedesktop.org/DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 17, 2026 at 9:58 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 13:29 +0100, Danilo Krummrich wrote:
>> On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>> > =C2=A0 impl InPlaceModule for NovaCoreModule {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn init(module: &'static kernel::ThisMo=
dule) -> impl PinInit<Self, Error> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let dir =3D Dir::new(kerne=
l::c_str!("nova_core"));
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: we are the only=
 driver code running, so there cannot be any concurrent
>> > access to
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `DEBUGFS_ROOT`.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { DEBUGFS_ROOT =3D =
Some(dir) };
>>=20
>> I think you forgot to add a new Kconfig to nova-core to enable this and =
in case
>> not set leave it as None.
>
> You don't want the debugfs entries created by default?  That's how it is =
in Nouveau.

I think it's OK to always have the entries on keeping them beyond device un=
bind
has to be behind a Kconfig option.

I thought you want this behind a Kconfig in general, otherwise what is
debugfs::Dir::empty() for?
