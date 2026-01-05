Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8FCF59E8
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 22:11:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 78F4810E460;
	Mon,  5 Jan 2026 21:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tefjr99v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q0o2Nukg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B5B2B44C9B;
	Mon,  5 Jan 2026 21:03:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767647022;
 b=kzOOdQpGx4uooRBGozkopkHokz83Fze9ly+DHYthvImyVpmTzzZ2BeyD5oibODICfFFS5
 m3AJLqtHAg2FW9Vd/lPjDveLqP8ijYRnoI7zYVdZZ7Bun5S61vxKV68txgg/sM8rsNJOsjK
 c8wtiqc2YwpytXOo5cWaLICk7KG0yXIHsZr/pUHtrDWZ+owwWtJo8i/GN9yBnw8jzT7LlIG
 BtLb/HFIImkf613KQfKr22sFWhnH0IwbEYw8j4ix3M0fe7BM1vr0PZhHENxeGp8Q1sOnaCa
 4njoWC5JeFIOMguYKrkSlFzxY9wFuW3CpQeZ70bINnKNhmA6XBuqMTj16iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767647022; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2HI5WpvrjxWjcJrI6UBSQlk6VzP6z9tGQtFytnWsSSk=;
 b=HapXrGnjZ/7JTEV3SbgdVUbReluitvpMFnUUdElZ5BMF+pWxfhgth5rsQpnDb9UiHUJce
 rGh+03rlUEMAEtRIqK3nn0riIG9yPWS9hk15mLDJ9TUJwvD7/LtVMOygzWkEGS7mORzoXPf
 b/5XJsz1wXUSGDUezJ0JLkYetqgMvmAkvIQGBi8VWhfE76YeO7tqptD8XcY+gIy/yU73VQe
 z24FVmsrhUuHLrTCHWHr7EJSDxJggVr92i6lNcA6oW0QRGyR8FwEXvIO3BM0TpFWZBobMs3
 Dyzlt9RhXjOn7bdprGT/+0pU+32o29gBD0cNLx9slfdJigFRHn0fPBXrj3Sg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2024D44C95
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 21:03:40 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 393D110E448;
	Mon,  5 Jan 2026 21:11:51 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlRnJ5WwYz9t7s;
	Mon,  5 Jan 2026 22:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767647508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HI5WpvrjxWjcJrI6UBSQlk6VzP6z9tGQtFytnWsSSk=;
	b=tefjr99vbWPESve1qc6HX83gNPDv/eemhfdaqSE0vbiJHdTXP1rehD4Ez8BX3Gpq1ZsDOg
	/QNC+mU8WDZwoInNaJu39AqlK7kHQNtfP4DdFy5+zUea7xhzkUnU58HSe5yYZ3Qoq8+q+l
	5Ub1J6wOpc2LLMg/uZgrW8LtzCXKTf5+yS8oimrRcnHHI81JsGaPsa+WrwL1YLWAwqjcAl
	Iy3ZQ7R26v25bKgUIpe+Vmn2XYpeIdd4qH33apqiSg41193SjSorekqEME92L6S7m6w4m8
	4E4/mOK7rPZr/lILHVwSUUCswAzy07bH1uMD4gG8NErtQ/2fQFHimtRXVvLZ3w==
Message-ID: <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767647506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HI5WpvrjxWjcJrI6UBSQlk6VzP6z9tGQtFytnWsSSk=;
	b=q0o2Nukg4efahLioZYLQvszxK/JkIcaoVvsr6SjQEj8aND8mNdSH4xd1dyoCFKg64V4ibs
	X/nmgIx0S1kEG6oLjulz1NNvOwZN3FAKziywRssqf6ulEPMqVPJxTGUJRq5YGD264b10e6
	NMLb9NjyApQL11U+RLFD7wz22KpB1OOqYzzJVUXdAnuEsZmPSMXjVLvL5G3HhDVfIOaXSf
	QOU1JVvSUsOcI3vxXvAxbbaTzLxDFQJhMxv2/5J1o5/+QpbqeShzXUHho8hYMLwRAfyhCN
	BY8L+YbY7dZt5KD4xS6o15vPY/h9epkM6RilQyXzODqbnB0dK4qfdjBOss+EoA==
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Benno
 Lossin <lossin@kernel.org>
Date: Mon, 05 Jan 2026 22:11:40 +0100
In-Reply-To: <20260105161110.5d1ab548.gary@garyguo.net>
References: <20260104200733.190494-1-mhi@mailbox.org>
		<20260104200733.190494-2-mhi@mailbox.org>
		<DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
		<DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
	 <20260105161110.5d1ab548.gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e3b37c8d848180c9f6d
X-MBO-RS-META: q5k68eeri1785xog9na8rjnqh9reutb7
X-Rspamd-Queue-Id: 4dlRnJ5WwYz9t7s
Message-ID-Hash: QU2BVHFEROYZTSLFOFPMOBKE6FUJXTBN
X-Message-ID-Hash: QU2BVHFEROYZTSLFOFPMOBKE6FUJXTBN
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: mhi@mailbox.org, aliceryhl@google.com, acourbot@nvidia.com,
 simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QU2BVHFEROYZTSLFOFPMOBKE6FUJXTBN/>
Archived-At: 
 <https://lore.freedesktop.org/cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 2026-01-05 at 16:11 +0000, Gary Guo wrote:
> On Mon, 05 Jan 2026 11:29:04 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> > > On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:=C2=A0=
=20
> > > > Add a derive macro that implements kernel::fmt::Display for
> > > > enums.
> > > > The macro outputs the exact variant name as written, preserving
> > > > case.
> > > >=20
> > > > This supports all enum variant types: unit, tuple, and struct
> > > > variants.
> > > > For variants with data, only the variant name is displayed.=C2=A0=
=20
> > >=20
> > > I don't think we should be adding this. Display is designed for
> > > user-facing output and so it should always be carefully designed
> > > and no
> > > automation should exist for it.=C2=A0=20
> >=20
> > In general I agree, but simple stringification of an enum variant
> > for a Display
> > implementation is a very common use-case and it seems pretty
> > unfortunate to have
> > to fall back to either do the below (especially if there are a lot
> > of enum
> > variants) or having to go the declarative path of doing something
> > as in [1].
> >=20
> > Especially in combination with things like FromPrimitive and
> > ToPrimitive it gets
> > us rid of the cases where we need such declarative macro mess.
> >=20
> > Eventually, drivers will most likely implement their own proc macro
> > for this or
> > repeat the declarative macro pattern over and over again.
> >=20
> > Maybe we should just pick a more specific name for such a derive
> > macro than
> > macros::Display.
> >=20
> > Maybe something along the lines of macros::EnumVariantDisplay? We
> > could also
> > have an optional argument indicating whether it should be converted
> > to lower /
> > upper case.
>=20
> I think the proposal is reasonable.
> Being able to print enum name is very common and this is why crates
> like
> `strum` exist.
>=20
Before I start implementing, I want to reach common ground.

In my opinion a derive macro which implements Display would be
perfectly fine, as long as the name suggests what it does. So for
example #[derive(DisplayEnumVariant)]. This would communicate the
intent clearly to the user.

Benno, would you be okay with that? If not, Gary and Danilo, are you
fine with the proposed trait implementation (e.g. the variant_name
function)?
> Perhaps if we want to make user having a thought about what names to
> expose to users, we can have the case conversion argument be
> mandatory, so
> they are forced to make a choice rather than blindly stuck
> `#[derive(Display)]` onto their enum.
>=20
Are there any common use-cases where one wants to change the case of
the enum variants? If not, I would not implement an argument and rather
name the macro accordingly, so the intent is clear.

Thanks,

Maurice
> Best,
> Gary
