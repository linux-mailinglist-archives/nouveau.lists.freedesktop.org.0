Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA1CBAFC4
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083C10EC75;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ1mSrqt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C884F10E503
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 07:17:27 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-91524f5e6a8so322612239f.0
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 00:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759216647; x=1759821447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/RLYL9C2/J8Q8nWHpTOfcWgDV+Di6Gs1p9meRtJDAk=;
 b=JQ1mSrqtxVZYbbzh/YvlCYoxBjz7Qt2rF8UfyllTvbj1/vFnwXOssUs/kTrLyF6xvc
 tOUAdhxJYFNhbZT/HXyXE2Wtv/5Z6QMeDL2p1ZdLwDN8gjzVK4me8TWyqm8oICmzAdaK
 oxzzKsTxBBtkxxjXf1Cyebp2jDqhQ2+2e7FsT+iAFGh9GkCU7SULeJN+QvIsQalGSpAl
 dyTKMIFr195Bc+mm4wMCdFff8FkfSAxBh1RXQlpcEOIwoJcXIlrWLp4/uCIqAR+F2yKs
 FAoDo3iVuoV7WJEOrd8eP1NQ7gQPTp+/qKRaWznBjz99quvG/hDbEQ6dNBEF4OKuYIfx
 7l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216647; x=1759821447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/RLYL9C2/J8Q8nWHpTOfcWgDV+Di6Gs1p9meRtJDAk=;
 b=rtrKZ1O7ich160yly1ogBoiTuaF/TZPJSO13x9d2cvCjLZBBGDVvoXgwXaNXFrUvoH
 Hyw/dberxyWvfjdBRedJjxQT1Sy5VtXHiL/1tRnP93AhAvf6Fj47CoZgIeoDQE/VSJ8l
 U70KbK02ShvTkNz/gksPQnc2/hmjQiR4XPC+m2cUIaHpeCvp5OvrTDT7BaDC+bnHRdFw
 ccAXAYsMPU8osExFYepKJrx3jtunK1ZF86QDZQmEFO8We4bIrkVO+jLuPU+hVgiv7C36
 Xk0UBjEnVg4AK0afi977uxhu40MAFMCzSGDxpAu9ejUkxEwcC1eYzObbXpoIlA5NB4Id
 EqaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK/v7raWidKYVqJHKiVBmMvwAadQnMBIf3fHCytpUZgRqK6JsNi7wOxtTUurO2Z1V1gTjsuEFJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlngzg49wuMZZVMIi8eCPqPjnjSuPrM8NbfktL2sRUdeJlwGWQ
 wcM4Xbj7yQ7BZl58vVSLuPj9SriJazX014TnaxL7dqVqjnqYw6ubVBEbnq/BdLygDgGXy/OHDaw
 5UDlJGbeiUGvsew+BiCcvwH7CRylaJmE=
X-Gm-Gg: ASbGncuVvnlEzn+P5b5zsCo40uM3jX4F25rkUZneoiVEjUSOLW/0gzngvYr88rtLOHX
 e4jmYcgsTcq5ac92eQTPQTzGpnKKu9/2j9jYe/HJ+piCekl7rAXkh1uICn1z+jpdQePtvvQ5H38
 GdPBkIwCmSXZ3OTs44IxQzF0lVY7kbtjjYYGT8vXSJ3iKPsK6ZAAnkZCfgG4ssGrcBWxXcOh7SO
 Uu6oHLBCM0cqvUFtF4LHBJ4VUMJUuYTTjhlIgGt8g==
X-Google-Smtp-Source: AGHT+IF6oX4c1oT2QtGdImEkUmXn1fXUlDQYi0f+7OA8UeT8rnRYJ0Dbg7DVj5ZgRDIjPNT7QjcBtGER6b7SwehrbY4=
X-Received: by 2002:a05:6e02:1686:b0:427:511c:f86f with SMTP id
 e9e14a558f8ab-42bfab93823mr84067065ab.17.1759216646727; Tue, 30 Sep 2025
 00:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
 <DD5VAPG2QFWA.2A58AL13VHPN2@nvidia.com>
In-Reply-To: <DD5VAPG2QFWA.2A58AL13VHPN2@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 30 Sep 2025 16:17:15 +0900
X-Gm-Features: AS18NWCt4CiaOBLLw6E3ZJGY5ZpvbTCUTklAJf6rpPrTAabktBULuqhmTF6POuo
Message-ID: <CA+tqQ4L9PN9n0e2A5BfGhn4n02v8LKSK+BRpHcfbK_fNUKBJPA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

Hi,

On Tue, Sep 30, 2025 at 1:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
[...]
> On Fri Aug 15, 2025 at 2:32 PM JST, Jesung Yang wrote:
> > Extend the `quote_spanned!()` macro to support additional punctuation
> > tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed =
when
> > dealing with functions, generic bounds, and equality comparisons.
> >
> > Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> > ---
>
> Note that this patch doesn't apply cleanly in `rust-next`, I've had to
> add the following on top of it.

Thanks for pointing out the conflict. I see that the commit
9578c3906c7d ("rust: macros: reduce collections in `quote!` macro") was
added after my patch series.

> I suggest waiting for -rc1 to be released and using it as a base for a
> new version - hopefully this will also give time for more feedback to
> come.

Sure, happy to wait until -rc1 and perhaps we'll get more feedback by
then. Once it's out, I'll rebase on top of it and send v3.

Best Regards,
Jesung

>
> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> index 76a99f7e01c4..bb6970fd2a26 100644
> --- a/rust/macros/quote.rs
> +++ b/rust/macros/quote.rs
> @@ -147,33 +147,33 @@ macro_rules! quote_spanned {
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident -> $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joi=
nt)
> -        ));
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        )]);
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident < $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident > $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::J=
oint)
> -        ));
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        )]);
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::A=
lone)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident # $($tt:tt)*) =3D> {
