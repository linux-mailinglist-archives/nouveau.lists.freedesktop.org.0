Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD375BCE2C7
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 19:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5C10E083;
	Fri, 10 Oct 2025 17:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qwBmfGq9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF58410E083
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 17:58:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 787E443B74;
 Fri, 10 Oct 2025 17:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F59C4CEF1;
 Fri, 10 Oct 2025 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760119137;
 bh=UlxrUPQWLbNjQIvsmFeBw06etFvGFPS6Aq9zWL2yWmE=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=qwBmfGq96lSO4LetfL8i48rlqARdeMOtsZqvd8Q6W6C4At+wHzv1560PF9kLB69ag
 jaCf/YH5rTLfWTRbkldjulxhJFoqf4Ag6nq2Wlx2Pz5IvPjvIvjeBgFmk0fX8fRHPR
 ktr1qOuTDTBc7Xsz4zpbBiF40XbwsR+T3g0tuwCsmNDOR0hpdgRG3n/PT+GnRtd/R6
 A3FAUgJewl9nzsJmVLUChIoHe3aIQQmY5Ixk+CyCe/NNTThbuIUnwr6yJ/33Qusaiq
 RyGghhPBxxZb1w+WQ8AtBgRvo8JzrQyM+DWCA6GHa+lcCxOV88nIHG0jgV5qIz90cq
 5kD8xgIB41G7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 19:58:52 +0200
Message-Id: <DDEU5QUB5PYN.3VIIA2TISYD7X@kernel.org>
To: "Yury Norov" <yury.norov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury> <DDEJ3X0C2RNH.13YEXJI3CTSPF@nvidia.com>
 <aOlAQaDo5HwlvRUk@yury>
In-Reply-To: <aOlAQaDo5HwlvRUk@yury>
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

On Fri Oct 10, 2025 at 7:20 PM CEST, Yury Norov wrote:
> On Fri, Oct 10, 2025 at 06:19:17PM +0900, Alexandre Courbot wrote:
>> On Fri Oct 10, 2025 at 1:40 AM JST, Yury Norov wrote:
>     register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>         3:0     cnt =3D> i8,
>         7:4     flags, // implied unsigned
>         31:8    addr,  // implied unsigned
>     });
>
> That answers my question. Can you please highlight this use case
> in commit message?
>
> And just to wrap up:
>
>  - all fields by default are unsigned integers;
>  - one may use '=3D>' to switch to signed integers, enums or booleans;
>  - all other types are not allowed.

We do allow other types.

In Rust we have the From [1] and TryFrom [2] traits (analogously Into and
TryInto).

This way, if some type T implements, for instance, From<u8> it means that w=
e
can always derive an instance of T from any u8.

Similarly, if T implements TryFrom<u8> we can always derive a Result<T>, wh=
ich
either contains a valid instance of T or some error that we can handle inst=
ead.

Hence, the following is valid is well:

	register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
	    3:0     core_rev ?=3D> FalconCoreRev, "Core revision";
	    5:4     security_model ?=3D> FalconSecurityModel, "Security model";
	    7:6     core_rev_subversion as ?=3D> FalconCoreRevSubversion, "Core re=
vision subversion";
	});

The '?=3D>' notation means TryFrom, hence the generated accessor method - e=
.g.
security_model() - returns a Result<FalconCoreRevSubversion>.

In this exaple all three types are actually enums, but it would be the exac=
t
same for structs.

In fact, enums in Rust are very different than enums in C anyways and can b=
e
complex types, such as:

	enum Message {
	    Quit,
	    Move { x: i32, y: i32 },
	    Write(String),
	    ChangeColor(i32, i32, i32),
	}

[1] https://rust.docs.kernel.org/core/convert/trait.From.html
[2] https://rust.docs.kernel.org/core/convert/trait.TryFrom.html

> I still have a question regarding compile-time flavor of the setter.
> In C we've got a builtin_constant_p, and use it like:
>        =20
>    static inline int set_base(unsigned int base)
>    {
>         BUILD_BUG_ON_ZERO(const_true(base > MAX_BASE));
>
>         // Eliminated for compile-time 'base'
>         if (base > MAX_BASE)
>                 return -EOVERFLOW;
>
>         __set_base(base);
>
>         return 0;
>    }
>
> Can we do the same trick in rust? Would be nice to have a single
> setter for both compile and runtime cases.

Technically, we could, but it would be very inefficient: Even if the functi=
on /
method is called in an infallible way it would still return a Result<T> ins=
tead
of just T, which the caller would need to handle.

Analogously, for a setter the function / method would still return a Result=
,
which must be handled.

Ignoring a returned Result causes a compiler warning:

	warning: unused `core::result::Result` that must be used
	  --> drivers/gpu/nova-core/driver.rs:64:9
	   |
	64 |         foo();
	   |         ^^^^^
	   |
	   =3D note: this `Result` may be an `Err` variant, which should be handle=
d
	   =3D note: `#[warn(unused_must_use)]` on by default
	help: use `let _ =3D ...` to ignore the resulting value
	   |
	64 |         let _ =3D foo();
	   |         +++++++
=09
	warning: 1 warning emitted

This is intentional, users should not be able to ignore error conditions
willy-nilly:

It is a potential source for bugs if errors are ignored. For instance, a ca=
ller
might not check the returned Result initially because a compile time check =
is
expected. However, when changed later on to derive the value at runtime it =
is
easy to forget handling the Result instead.
