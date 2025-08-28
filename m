Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEC9B393EA
	for <lists+nouveau@lfdr.de>; Thu, 28 Aug 2025 08:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033610E1A0;
	Thu, 28 Aug 2025 06:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ic0lwzuk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617EE10E19A
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 06:39:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b55ed86b9so2617775e9.0
 for <nouveau@lists.freedesktop.org>; Wed, 27 Aug 2025 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756363157; x=1756967957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fq+QWOVWk1Y3FU/NdzpdHSJIGaMxmBhizx2dy7P/9VQ=;
 b=ic0lwzukn4qYCY1PsVkuP4cjbkUieou3vF3R6jCJ503xxKy419hlAqtpQ8tdwWJnYd
 uGv9DFKd3jJkjMJNH7OYYy84+exN3iKJwENo0zC2hlNj11wnQZFon2ZxC4xw6if8eE4P
 jpingKCsANoA6IbspdqXDVIGf2HUW/SW8UQSP1sYIaZK5Y+HdVaMpLstZz+An2mHGWPm
 0Ca9vQYAVeFZE7fSw/M+ZQV3/nvK2d8ajQuXEua+sQe4Uyi0F7V+or5n/NIUIVt+kePa
 +4Ldh3euWqheh17+Hc3Qm+E+lXQgZaWbmQXfev5+JLJQ5Qbio68aiYZj06KPJexSjtkW
 3BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756363157; x=1756967957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fq+QWOVWk1Y3FU/NdzpdHSJIGaMxmBhizx2dy7P/9VQ=;
 b=fvG+N2ghLoHIwaI8qwc4VDIhVaO+JG98v+nxP4Ge20SKqmm6kmMjdCPVb6CrcVaBRh
 QsXYESnUo6qGf4Z6FDWgUe1JxzH3CvnKZ8trTg/G0Y9WBDcqjQlt75hxCqgjjxxo+YFv
 6e6PssJmN4StyqFlYLHIagxAcqIzDvhYS6wXzsB0haZp1zMPEfVRY1A8R1fU6EJp27cD
 YSXmLyaHMj+OxkoFUTI2FiXEVDSp9TmYivAL3RJhOFK7O4FWy/uExYBUzsFS3cdkEcVF
 jimiVg1U9dhdWVVjG2KlFbcHXcfdEZcOmR7UmhySJU1eLN+3/7q3V6WMXb7Rnv3gabnB
 UR8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsS6N1UfmnBrLc4/CuRb7LeMInmTacwojdVVNnA/v4Xh5uuh+IUe+PKgCRpJX9lLbDVGyMqT88@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUKF339xDagu5E8yTKaEGoLsO++PtoE58EK4ypVeZxN2hthIyX
 eHQJIG3mVYPLbBt7vF/J9E9wXdpe7PoDqVu4YKjOfaiF+zpbSfO9tu869FgCh+G06W6LhTPSHx+
 ztaAQYFWjdHsw5gU38TPSOoDCBKrlexW5QDrDoYoq
X-Gm-Gg: ASbGnct20Ex2UwT85qqfvczrN3szvVOzVH6siGCVWaY1vloTV1ztfytl5k9o56apSJA
 VjJN1zyhHS+lIRPKRWQD376zus71DeRXpkGrn/xJT8MPB9tXOlnHVw68sPLy1DkA092IshyP0gs
 droU/S2oiLmwnaHgU1pBGStwneiI8pPaztxvpMxVfp4MnJDY643urFKvF1MGrj2maXq3fhf6N+N
 lkBr3p0i9nvswkxTQbBYUyVgZxuwnLW9Cn/qjlpF1Q82og=
X-Google-Smtp-Source: AGHT+IF8+1ICS0fDql/XTK3pqcO7/04zx4tNEmPDhoomxN7vbO9FM9IgKE+/QooxVWj+KULkTlRwMy+CD9PKPUXPTH8=
X-Received: by 2002:a05:600c:3104:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-45b517e0364mr163915875e9.36.1756363156967; Wed, 27 Aug 2025
 23:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
In-Reply-To: <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 08:39:05 +0200
X-Gm-Features: Ac12FXzedyoztgDekujVPHBhDWZD7HkK8GfapuNv85gVHH0ZgPpQziBoPXzTTmI
Message-ID: <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> Extend the `quote_spanned!()` macro to support additional punctuation
> tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed wh=
en
> dealing with functions, generic bounds, and equality comparisons.
>
> Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
>  rust/macros/quote.rs | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> index 8a89f0b1e785..24764b04a07d 100644
> --- a/rust/macros/quote.rs
> +++ b/rust/macros/quote.rs
> @@ -150,6 +150,36 @@ macro_rules! quote_spanned {
>          ));
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
> +    (@proc $v:ident $span:ident -> $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joi=
nt)
> +        ));
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident < $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident > $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);
> +    };
> +    (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::J=
oint)
> +        ));
> +        $v.push(::proc_macro::TokenTree::Punct(
> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::A=
lone)
> +        ));
> +        quote_spanned!(@proc $v $span $($tt)*);

Not a blocker, but if the way to implement this one is to push =3D
twice, then I think the pattern should just be a single =3D and then you
push a =3D once. The pattern can match twice to handle =3D=3D.

Alice
