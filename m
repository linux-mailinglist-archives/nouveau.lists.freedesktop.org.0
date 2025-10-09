Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB222BCAB5C
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 21:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2118A10EAFB;
	Thu,  9 Oct 2025 19:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DNz8/E0I";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6F910EAFB
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 19:34:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D0B1601F8;
 Thu,  9 Oct 2025 19:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8C9C4CEF8;
 Thu,  9 Oct 2025 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760038449;
 bh=9wzBsfaQ4o3G21CLbZx/GZdiQupzsIsjHsxLz4XQQNo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=DNz8/E0Irw5AxbbhfZgLE1ZoPq4x03moJxzAnus/VheFh9O9pY3AoEOCEWP0WHhLZ
 VPjqFg2oErw0KEJ5kcu4ixRTRPp7Orox6rPVzahLrjm+nhlA6JP1tRty7/tsz4duEu
 Eu93DHXC5ZXGIxjCLCynTz6/ZZucMpFGJgPcYXj2uoh3JvekqMKm9fLZHMlgwtgSUk
 1oMlmLNeaaxEIgqaTdCYf1cMvHFKOtVq5156cVDtBSMUH3tSA1Z9VDtdT/s91Rc+3R
 SlSmhs9I6ZCifV7XV0iQPGN8TVvHZlC9dQpE9RgXfgO8GMw6ioRUvHlya9Vi76xOMQ
 l5qD9VK1lWafw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 21:34:04 +0200
Message-Id: <DDE1K39EUXQK.17AAVZXFZ4KEQ@kernel.org>
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feong@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Yury Norov" <yury.norov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury> <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>
 <aOf-s-XuhbN7MUlx@yury>
In-Reply-To: <aOf-s-XuhbN7MUlx@yury>
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu Oct 9, 2025 at 8:28 PM CEST, Yury Norov wrote:
> On Thu, Oct 09, 2025 at 07:18:33PM +0200, Danilo Krummrich wrote:
>> On Thu Oct 9, 2025 at 6:40 PM CEST, Yury Norov wrote:
>> > On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
>> >> Use BoundedInt with the register!() macro and adapt the nova-core cod=
e
>> >> accordingly. This makes it impossible to trim values when setting a
>> >> register field, because either the value of the field has been inferr=
ed
>> >> at compile-time to fit within the bounds of the field, or the user ha=
s
>> >> been forced to check at runtime that it does indeed fit.
>> >
>> > In C23 we've got _BitInt(), which works like:
>> >
>> >         unsigned _BitInt(2) a =3D 5; // compile-time error
>> >
>> > Can you consider a similar name and syntax in rust?
>>=20
>> Rust is a different language and has its own syntax, I think we should n=
ot try
>> to use C syntax instead.
>
> Up to you guys. But having in mind that C is the only language that
> really works for system engineering, I would rather consider to stay
> in line with it on semantic level.

I think you asked about syntax above; semantically it is (and should be) ex=
actly
the same.

> If your goal is to make rust adopted by system engineers, you may
> want to make your language somewhat familiar to what people already
> know.

The goal is to add support for Rust in the Linux kernel; to adapt its advan=
ced
type system features offering compile time checked lifetime and ownership
semantics leading to better memory safety and more compile time validation
overall.

In general I think we should stay as close to existing patterns as possible=
,
i.e. consistency does matter.

However, sometimes it is necessary to break with existing patterns and desi=
gn
things slightly different to take full advantage of the capabilities we get=
 from
the language (BoundedInt / BitInt is not one of those).

In other words, introducing a new language with capabilities that solve rea=
l
problems is pointless if we subsequently limit ourselfs to "what people alr=
eady
know" for people who haven't been in touch with the language before.
