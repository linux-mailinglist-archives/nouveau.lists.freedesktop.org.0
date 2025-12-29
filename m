Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CECE6AF3
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 13:30:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D660D10E442;
	Mon, 29 Dec 2025 12:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WznmjLYV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 87D9844BAD;
	Mon, 29 Dec 2025 12:22:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767010929;
 b=Xbci57yYqrGbkGsFUTe7Vn2xBDRa5ParbVjGjl1HzoQm9TrDUtUxX1NDbToKFM7tBVJbt
 lvhdA4OTNHhLv1VaQ5yq2Ju7X7WJfPksGbZWCPWs4PH9YDkcg4XUmVkAiK6Lma6Hhh1SpI0
 oiFX0lOIuzJhhEEZJQHOyEtdoGOJ7WFFWgvm+4JOr30XoD1oKtiruRIRWnRa6PaoOIgbyyU
 uIq6Hk2TAsscl398BgfXSRrn/blNuvpNF4Ss3uQkNrnOiB1mrjknk/w13jtmq21h6T9YwSI
 aDrSkkakUo3paGhDDZNkZpiteGj0rOiI3DFsKrR0B1+folP1pWHO9yaZnP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767010929; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nNlRh+FneH00PSxZ8P4vqxaIgbthTMHFAwc5+WdXwbg=;
 b=UA0r2JLzTrmL+CwEfDm/eKYFgn1cZboJUuhhOJkbqv5tFJfl3IzvMnMHE9rdyge9qCoTf
 txu5X5k1QGh1JQenZgXERZIb6IEeT+kSjxHG7BIR3heGRV8LQ4rr8YqmySFvrgDE9EVS0Wx
 524RKJeXSEHovT2ZKSYF7HWo8BUWyhMNLiOQ980XOFgQmhRZiRg04x8gKWOOY7mJhE2j5iT
 5j9jQDxltRE3h6qYsJ1uW35kTBuxtwL+9d8NlrK/lHBkgOuESkQrpPP6GRbjVSCVubAtUfq
 0LLeV9oRn3D3k0Tu/NDwuPIJLePq7cx50vKU9utdkjQT0J2glaO9Msz7ApLA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 979F641B4D
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 12:22:06 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E810E43A
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 12:30:01 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-3e0f19a38d0so6505389fac.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 29 Dec 2025 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767011401; x=1767616201;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNlRh+FneH00PSxZ8P4vqxaIgbthTMHFAwc5+WdXwbg=;
        b=WznmjLYVt6uAamN5oaRvOF/3JADDg/Ny7DTiXsgC3JSC41cmrCUd/pTl7OEyuf8e/m
         y9aCPy5TtD2vvnaYfZIIuj8o+zjH9D5p3r5EMyBlCntca6Q4Oo3Z7l6j8SFIhd+pTMac
         AewWtKO3fl4Kyxg1DyMh2R5MkMPtxZX3KAWb3QCnBDRV8DwMBSvk2qQ9bKT/FASC969Q
         6LmoVsMDxAWoSoKMwhBLeG7HyGa5hf5L7AdyDWkzn5ZrUW4VTZRPdw2mMx2ASUFjNxJE
         uFT0UeZ9tT5kBbSXjcGLqSEH+N/HsS68BmWzItx3tvqj6d7Ze1diUINZ23zgk16vOR+M
         atpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011401; x=1767616201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNlRh+FneH00PSxZ8P4vqxaIgbthTMHFAwc5+WdXwbg=;
        b=o3UX7pxrBHIlbH8xrux1xpvDM2urtMn3yO5GK0U+wMCkJvUDbPBURyI5poXJmRFwqo
         8f+FO7+JLUocU/1zNY6zxsD2+Y0GIMuRkC+X2mWfPcBXMKGdPwaUHINpKl0Ks0EHzb1r
         OCda8RP7BYds8d1HD/ekmKqyXFGcNYLrBtECVHHSYbfQYw78qmePgUNWBc/5eNBM0oKF
         Pxh1GAgbQbIDK0iiNzlTTNr5zBelkLQZnUCkrpz0DIzSSJ6TviixYe7ZGdqWresQ5OVf
         Etl03fm4QQg0JOuT4QkFwyIhcxxKRhIGrnGUahs+TLAbTx1RW8iWQqDvXnNxJy3juCuC
         gJ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGEEePMnT+YOF6Q77u6zC0euYcZWan4KcnEWRcV6tK+4t1DM+YIwOwVCXLTSe4phk1MlO2VK7I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnPHslu/XMLK2tRtNXjK0CQKSf7pVda5STcH/4gNmIDVUk2ndQ
	keHne3X/fonZOjTrlSHIM1/XI3iHFmA67u61ITBXrSZfyJVtZX9UnULDjlKS320B8v/Ul8SLpYn
	wG930TK8pciAjF9rb+Hvc2gIf4WFtPo8=
X-Gm-Gg: AY/fxX4ZL2S79DY6/1i6UbOvmJwVSGi/2UhBlQ319DrksMNsU7I3fCX8p4tJlhSQgGW
	+YB+ZAo+YqeiSvw4kOw9lABMuDSN972oXpRnKR6N/URH4S2DKAxXdpL9I6gT9l2AKnIGRLDN1FZ
	ilO7Uy0pfnfudpW0GNsklHL/EDDmXPUy/fvmQ+2BY1Awk5KAaQPW9bit0xyrNATcEQ7yRYaXVB6
	iiS+I2ZKp8pxw1rDHbx7iavQ6Ce5R5PJE+WDKva1UZ5VNqG2V4zH3UvEHDsomqFjIHfbmw=
X-Google-Smtp-Source: 
 AGHT+IFv9e/7aJqcQPz+g/ACAA2KWN58Q5VLbp7DW/p83i8XMHNJzhEzH4BHF62jWLN8bcWxLDB36ri/VDXl2M9P27Q=
X-Received: by 2002:a05:6820:22a6:b0:657:48ac:99f4 with SMTP id
 006d021491bc7-65d0e94d523mr11981668eaf.1.1767011400613; Mon, 29 Dec 2025
 04:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
In-Reply-To: <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 29 Dec 2025 21:29:49 +0900
X-Gm-Features: AQt7F2oq3PqcyMSgNLEMYRMylRuI_V-ZWEZMGEC6qCrS17Ex_bVyXrrTY8Xfgh0
Message-ID: 
 <CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
To: Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DOC6ZP3NCOALZRTUYMEK4DTBTT356EO2
X-Message-ID-Hash: DOC6ZP3NCOALZRTUYMEK4DTBTT356EO2
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DOC6ZP3NCOALZRTUYMEK4DTBTT356EO2/>
Archived-At: 
 <https://lore.freedesktop.org/CA+tqQ4+Xp_Uv+O32JgCyN0vB-AJEaJdUWoWDOx0nTogeiDbj6w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:

[...]

> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> >> > +    //
> >> > +    //   In C, enums with discriminants that do not all fit into an=
 `int` or all fit into an
> >> > +    //   `unsigned int` are a portability hazard: such enums are on=
ly permitted since C23, and not
> >> > +    //   supported e.g. by MSVC.
> >> > +    //
> >> > +    //   Furthermore, Rust interprets the discriminant values of `r=
epr(C)` enums as expressions of
> >> > +    //   type `isize`. This makes it impossible to implement the C2=
3 behavior of enums where the
> >> > +    //   enum discriminants have no predefined type and instead the=
 enum uses a type large enough
> >> > +    //   to hold all discriminants.
> >> > +    //
> >> > +    //   Therefore, `repr(C)` enums in Rust require that either all=
 discriminants to fit into a C
> >> > +    //   `int` or they all fit into an `unsigned int`.
> >> > +    //
> >> > +    // As such, `isize` is a reasonable representation for `repr(C)=
` enums, as it covers the range
> >> > +    //  of both `int` and `unsigned int`.
> >> > +    //
> >> > +    // For more information, see:
> >> > +    // - https://github.com/rust-lang/rust/issues/124403
> >> > +    // - https://github.com/rust-lang/rust/pull/147017
> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f705=
5a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [=
1]
> >> > +
> >> > +    // Extract the representation passed by `#[repr(...)]` if prese=
nt. If nothing is
> >> > +    // specified, the default is `Rust` representation, which uses =
`isize` for its
> >> > +    // discriminant type.
> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.=
html#r-items.enum.discriminant.repr-rust
> >>
> >> I think we should error when no `#[repr({integer})]` attribute is
> >> specified.
> >
> > Not a blocker but just out of curiosity: are you concerned that the
> > default size might change in the future, leading to silent side
> > effects?
>
> `isize` already changes size when you switch between 64 and 32 bit
> architectures. I think the author of an enum they want to convert into
> integers should think about which size the enum should be.
>
> They already can choose `repr(isize)` if that is correct in that case.
> As a default, I would have choosen `i32` (but that conflicts with Rust's
> default, so we can't do it).

On second thought, I've realized that enforcing an error when
`#[repr({integer})]` is missing would prevent users from deriving
traits for `#[repr(C)]` enums. This is because rustc currently rejects
the combined `#[repr(C, {integer})]` syntax. For example, a user might
want to do this:

    #[derive(Into)]
    #[into(u8)]
    #[repr(C)]
    enum Foo {
        A,
        B,
    }

In this case, the code wouldn't compile if we strictly require
`#[repr({integer})]`, even if the user carefully picked `u8`, keeping
the enum's size (more precisely, the discriminant range) in mind.

Since we already perform a compile-time check to ensure all
discriminants fit within the types specified in the helper attributes,
I believe `#[repr({integer})]` isn't strictly required. Even with
`isize` changing size across architectures, our compile-time check
remains effective and will catch any overflows.

To sum up, I see three options:

    1. Drop support for `#[repr(C)]` enums entirely.
    2. Special-case `#[repr(C)]` enums: allow them to default to
       `isize`, otherwise require `#[repr({integer})]`.
    3. Permit missing `#[repr({integer})]` generally.

I am personally leaning toward Option 3, since our existing
compile-time check provides a sufficient safety margin to allow this
flexibility.

Thoughts on these?

Best regards,
Jesung
