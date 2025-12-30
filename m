Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E173CE927A
	for <lists+nouveau@lfdr.de>; Tue, 30 Dec 2025 10:10:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67ECA10E880;
	Tue, 30 Dec 2025 09:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N1qiO14G";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1D52244C67;
	Tue, 30 Dec 2025 09:02:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767085325;
 b=IBJnBfieeVw1MF5lNjtZzSRE+7/nk1gXGM/9PXHzuhKfLQBbZfuSlG7JVOShB2YI4XHbn
 Mekoi1GX4OS/6vV2hK6Wvel/TvHkckaFo+Q4h9ibYLgHKeuFYFinpscHG0BRr/5OgrIPJ6D
 NGSpRDu3739VpVjoz1hzVDL4Z6TQslodhM1cf7jBiKblWveYMNzzPwieA5yhgVk5z9LpN4I
 uXOv8l0RMhXHZDh1rU7YKG1Wsb+ID+0IuBMzdDktvJOyFFZuq8L9FGGFkyiKuhvCkeSvMV+
 NLJ19UDYhNJ1PX9xz/Ukz+uC52tBrLfYM5U1HG5RSOCGeg1B5+kBdgvMgs8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767085325; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lL8t8M+yuhjNdkA0uVGgtgwTc3OP6ShE8qN6rQRiB2U=;
 b=wL+/lvgKqrF4Bu1RbQD+3MgJZDqbO0opyACI9VwyzWdwwDZILYco/bTPhjDh2uJVnQ52B
 ZGD/y5l5K2/NtvVINtLvEjaL8fpKJpyddD8jt//o1hsPwgASYEfvEXO03+PZ5ts3qYCYleP
 NlFJtuFCFqaX3BD5JwN59PqJnJ40VnMMJbLhyBH4dSywNl99LV3PEvtkWVkyApUypcnkWbw
 oU5tIsMf34VD3g1GYakWIc9PKax8Dku/+7FVU0dUcAIOyI+0Wi6kWZmhsOJ0odI7l9YHxDa
 HpWs4P+xsXqP+zXonEn31BeFMcmm6/Bsdit+d12RiR13dcC8A4hBKMcuNI5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ADD0E43E41
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 09:02:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9487A10E87B
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 09:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B849060051;
	Tue, 30 Dec 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A59C4CEFB;
	Tue, 30 Dec 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767085796;
	bh=7KdJALN0K+r9nZo/WfD49aKuvWF+zMNEeTAc2yOuSFc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=N1qiO14Gvf5WrZiBFb39OFVVnCvtMz/+32LHFDuhzVXPUG6COb2/MPRt2/bEVfIWD
	 StPrjqG5qUQWUAQgU9C81zjcdCxv7XVnEv3TX9Mgj/PR0zc8MiAtazm8eJjPoyB387
	 vlWGVelYlHyICRkLJgrj9ivtkaovNbOPkOCfUAkE1UIOKCsKC3JArAmyQtQt2gj21Q
	 q3E7axxwRM+hGGIMKnhr7AKCp2tuuDXqjMlgEpEi2bpKUkeajFz0bSnnWH05F6R3Yo
	 u+qQ5Vlmon4x6Df3I6Nxs6QdY1LCUxNp59GN+xrqythc+blU6Y5HlwKuf0Y+qLWuac
	 NazMhPjbeUefg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 10:09:51 +0100
Message-Id: <DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
From: "Benno Lossin" <lossin@kernel.org>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
In-Reply-To: 
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
Message-ID-Hash: CSEB47OOHQLE6KP7ISUJWPLCDGXUIYRS
X-Message-ID-Hash: CSEB47OOHQLE6KP7ISUJWPLCDGXUIYRS
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CSEB47OOHQLE6KP7ISUJWPLCDGXUIYRS/>
Archived-At: 
 <https://lore.freedesktop.org/DFBFMTS0ZRDB.30O3L4GMYW4XJ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Dec 29, 2025 at 1:29 PM CET, Jesung Yang wrote:
> On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
>> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
>> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
>> >> > +    //
>> >> > +    //   In C, enums with discriminants that do not all fit into a=
n `int` or all fit into an
>> >> > +    //   `unsigned int` are a portability hazard: such enums are o=
nly permitted since C23, and not
>> >> > +    //   supported e.g. by MSVC.
>> >> > +    //
>> >> > +    //   Furthermore, Rust interprets the discriminant values of `=
repr(C)` enums as expressions of
>> >> > +    //   type `isize`. This makes it impossible to implement the C=
23 behavior of enums where the
>> >> > +    //   enum discriminants have no predefined type and instead th=
e enum uses a type large enough
>> >> > +    //   to hold all discriminants.
>> >> > +    //
>> >> > +    //   Therefore, `repr(C)` enums in Rust require that either al=
l discriminants to fit into a C
>> >> > +    //   `int` or they all fit into an `unsigned int`.
>> >> > +    //
>> >> > +    // As such, `isize` is a reasonable representation for `repr(C=
)` enums, as it covers the range
>> >> > +    //  of both `int` and `unsigned int`.
>> >> > +    //
>> >> > +    // For more information, see:
>> >> > +    // - https://github.com/rust-lang/rust/issues/124403
>> >> > +    // - https://github.com/rust-lang/rust/pull/147017
>> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f70=
55a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 =
[1]
>> >> > +
>> >> > +    // Extract the representation passed by `#[repr(...)]` if pres=
ent. If nothing is
>> >> > +    // specified, the default is `Rust` representation, which uses=
 `isize` for its
>> >> > +    // discriminant type.
>> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations=
.html#r-items.enum.discriminant.repr-rust
>> >>
>> >> I think we should error when no `#[repr({integer})]` attribute is
>> >> specified.
>> >
>> > Not a blocker but just out of curiosity: are you concerned that the
>> > default size might change in the future, leading to silent side
>> > effects?
>>
>> `isize` already changes size when you switch between 64 and 32 bit
>> architectures. I think the author of an enum they want to convert into
>> integers should think about which size the enum should be.
>>
>> They already can choose `repr(isize)` if that is correct in that case.
>> As a default, I would have choosen `i32` (but that conflicts with Rust's
>> default, so we can't do it).
>
> On second thought, I've realized that enforcing an error when
> `#[repr({integer})]` is missing would prevent users from deriving
> traits for `#[repr(C)]` enums. This is because rustc currently rejects
> the combined `#[repr(C, {integer})]` syntax. For example, a user might

It's only rejected for field-less enums, but those are what we're
interested here.

> want to do this:
>
>     #[derive(Into)]
>     #[into(u8)]
>     #[repr(C)]
>     enum Foo {
>         A,
>         B,
>     }
>
> In this case, the code wouldn't compile if we strictly require
> `#[repr({integer})]`, even if the user carefully picked `u8`, keeping
> the enum's size (more precisely, the discriminant range) in mind.
>
> Since we already perform a compile-time check to ensure all
> discriminants fit within the types specified in the helper attributes,
> I believe `#[repr({integer})]` isn't strictly required. Even with
> `isize` changing size across architectures, our compile-time check
> remains effective and will catch any overflows.

Hmm that's true.

> To sum up, I see three options:
>
>     1. Drop support for `#[repr(C)]` enums entirely.
>     2. Special-case `#[repr(C)]` enums: allow them to default to
>        `isize`, otherwise require `#[repr({integer})]`.
>     3. Permit missing `#[repr({integer})]` generally.
>
> I am personally leaning toward Option 3, since our existing
> compile-time check provides a sufficient safety margin to allow this
> flexibility.
>
> Thoughts on these?

Looking at the nomicon documentation [1] again, I found the following:

    repr(C) is equivalent to one of repr(u*) (see the next section) for
    fieldless enums. The chosen size and sign is the default enum size
    and sign for the target platform's C application binary interface
    (ABI). Note that enum representation in C is implementation defined,
    so this is really a "best guess". In particular, this may be
    incorrect when the C code of interest is compiled with certain
    flags.

Which to me reads as "don't use `repr(C)`, if you want to know which
repr the enum gets". Especially the last part is concerning to me, as
the kernel uses lots of (bespoke) compiler flags. So I'm thinking we
should just drop `repr(C)` enum support. Any thoughts from others?

[1]: https://doc.rust-lang.org/nomicon/other-reprs.html

Cheers,
Benno
