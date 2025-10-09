Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86728BCA5AE
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 19:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1E610E27B;
	Thu,  9 Oct 2025 17:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uNC7TuaN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503410E27B
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 17:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E40E245B3B;
 Thu,  9 Oct 2025 17:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC0BC4CEE7;
 Thu,  9 Oct 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760030317;
 bh=kFsIMObArLcyoFFIMA4L5RDZSvrQbbMBoX1+KItsqQU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=uNC7TuaNBQ719jUSqL2ej2bN+y/WjYBNMvCjjaLce+TWEK2i7X7xetVsaFN0tggaQ
 /kHdfDbiFPi9VIL+/2DAvZ7X+4lPJe87kjLeoLFqTj28gjko1F3HqQ6Jh+E4PRicjT
 usCom3hlJ5aN2hHwmsMPsmFraTCddLbfEkJ9+M+jahqgMFdfAeSXOGqpBHomAUHlF9
 1rQ3EI69b/izWALKWqMneqA7y56ccCEe28uZBvvhLs9V/1hFxWWRAxD9Cy/UuT6d0d
 XrU2mJEWZmkvKyHd6mGkxDhM9vwlEf5055TosfKJjLXCdPmIreLB27+Qtgla5JEgtU
 0RgEaTJJ2DG9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 19:18:33 +0200
Message-Id: <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org>
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
 <aOflmmHe8O6Nx9Hp@yury>
In-Reply-To: <aOflmmHe8O6Nx9Hp@yury>
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

On Thu Oct 9, 2025 at 6:40 PM CEST, Yury Norov wrote:
> On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
>> Use BoundedInt with the register!() macro and adapt the nova-core code
>> accordingly. This makes it impossible to trim values when setting a
>> register field, because either the value of the field has been inferred
>> at compile-time to fit within the bounds of the field, or the user has
>> been forced to check at runtime that it does indeed fit.
>
> In C23 we've got _BitInt(), which works like:
>
>         unsigned _BitInt(2) a =3D 5; // compile-time error
>
> Can you consider a similar name and syntax in rust?

Rust is a different language and has its own syntax, I think we should not =
try
to use C syntax instead.

>>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>> -            .set_base((dma_start >> 40) as u16)
>> +            .try_set_base(dma_start >> 40)?
>>              .write(bar, &E::ID);
>
> Does it mean that something like the following syntax is possible?
>
>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>             .try_set_base1(base1 >> 40)?        // fail here

Note that try_set_base1() returns a Result [1], which is handled immediatel=
y by
the question mark operator [2]. I.e. if try_set_base1() returns an error it=
 is
propagated to the caller right away without executing any of the code below=
.

>             .try_set_base2(base2 >> 40)?        // skip
>             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
>
> This is my main concern: Rust is advertised a as runtime-safe language
> (at lease safer than C), but current design isn't safe against one of
> the most common errors: type overflow.

Where do you see a potential runtime overflows in the register!() code?

[1] https://rust.docs.kernel.org/kernel/error/type.Result.html
[2] https://doc.rust-lang.org/reference/expressions/operator-expr.html?high=
light=3Dquestion%20mark#the-question-mark-operator
