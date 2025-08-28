Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B8B39E23
	for <lists+nouveau@lfdr.de>; Thu, 28 Aug 2025 15:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E010E332;
	Thu, 28 Aug 2025 13:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KMxNGo4z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D110E332
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 13:06:05 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7704799d798so754944b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756386364; x=1756991164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEg72LM7YmmLe/X9iW3od6t+U8qtbnknaRFc97jQIUM=;
 b=KMxNGo4zza0WVh0a9AahYZDHEZ9ATVBw3FYMFyIvB+/hCEvu5t8OTjxMD7JkSn7fjQ
 4NWBqutGXEO3TJ0dNT9z9ztcd5TdYG/0lqgobJ5tKhWqX2b00xrBaGIcxyJk03ihiI9i
 lnK+Zin/QvlcoLFYu0bPxF58Vmo7Si95dTKOsaeQry6AJHsc1eWw8Kcd3KbABrM0llD3
 WrTTUPktMKU/7/HskQY7N+LOoprteZF5qgj051eUNu6OVVO7WB7aOOLi5Y2DvaQWyemD
 dweTgPzkn0fldMBmoFLwRwsRClGjiaKWbtY1vvLZq7FeP6qvBUolpTBIzK+/XwLIMO4l
 I0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756386364; x=1756991164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEg72LM7YmmLe/X9iW3od6t+U8qtbnknaRFc97jQIUM=;
 b=rhcF9M3ZRSqRkBlvHUeK5upxXWqDxpMbisjEOeSfYt7a8pQQyzivAFZlWGyYcwoMOZ
 UH8cqQJQeUtn+MLdLPVsGkwwY0DBhvB9Ykzgc3yxL5uhkz0k5I6i58m63M731B6rGw1c
 Hk7j0eYGbMavVQa9S09gbP9ktqpsK4nh/mB4BBk0SdIC3wWTUUTHjrUyTpYvvr/6ATWF
 64L2tVeXWdaEU9TYDb+RWl8URMRqhCDarpjjUc+IIFByGzNhn4Om3AOovPtC6moOaa+x
 Zt9u5T/0vEK+xOf46NHDldr3Qptf+FBAWjdIQkbHXHRe4YCSyZpAfvDhPZ4EM6CeTkwr
 Ce5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdL3H6iD2F9fVaW78nSjcoB19Lh4wi0ipspIEHnFqxOCanXSqtIPxCxNNXTHq11XQJFB7LOQqL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG+9tzMO9ihIgTMVhjs5UPu9JI3Op214s0JXyCnuHg0XJjoaqi
 ocpL/sFBmjJxLfICZZOtgHxJbOQpSsgRDFuTs6WwwD7lYLdNng1vBNEfegU6Xdx5TcRodetjn2h
 GUidOLQrqsUFUMOFkGhoxq4ByLmZBV+/7dIMp08tx
X-Gm-Gg: ASbGncsHBoprLAm8InRqN+v/SgOt3LoqlCz5Itrb0dOR6Zo8ANaC2TBkmbIDoaeBUJV
 9hKmW2oNUNGaf9Tb6kXzUXUyPHL3P5nB+VUEB9QN7Yuw2WD0OcJaHkk3h+hPWGSj+orEJQZM/4M
 eK9UBdQA9kzlU+hzrpsECIb7YT8Iue3uOjoas/1DBhfVAN8R+0GITsmIMhtxyZrCtjfPMxXBt7B
 RDyNnW+QMmkvFwpiXnKf5NAv3crf1cnXOCpy75Q+jGsZgeaz/kPG8W9umyr3jQukZQLM3dOwHY=
X-Google-Smtp-Source: AGHT+IEijpLfmDUkI2YRHjD1JTnwxBU7IhvhlzVkA/BtS2G2IpI0QWOacCq7I9/JLZl5QwxZz27rxdhYKViR835y/Ls=
X-Received: by 2002:a17:902:da4b:b0:248:f30e:6a10 with SMTP id
 d9443c01a7336-248f30e6dcbmr10418755ad.35.1756386363491; Thu, 28 Aug 2025
 06:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
 <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com>
 <DCDVIR91LFHQ.1C87G5A0OBJ39@kernel.org>
In-Reply-To: <DCDVIR91LFHQ.1C87G5A0OBJ39@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 15:05:48 +0200
X-Gm-Features: Ac12FXwH4U9kGaajYn8SjgOofY0bZTg3SyJryTzi3q7AIGGDgeurcC2n44p8_rs
Message-ID: <CAH5fLgjDwayRzHXS2Dp6ztURBvnv3md3_jnzyL0ZmBQzTnH7gA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Benno Lossin <lossin@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, 
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

On Thu, Aug 28, 2025 at 9:14=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Aug 28, 2025 at 8:39 AM CEST, Alice Ryhl wrote:
> > On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com=
> wrote:
> >> +    (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> >> +        $v.push(::proc_macro::TokenTree::Punct(
> >> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing=
::Joint)
> >> +        ));
> >> +        $v.push(::proc_macro::TokenTree::Punct(
> >> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing=
::Alone)
> >> +        ));
> >> +        quote_spanned!(@proc $v $span $($tt)*);
> >
> > Not a blocker, but if the way to implement this one is to push =3D
> > twice, then I think the pattern should just be a single =3D and then yo=
u
> > push a =3D once. The pattern can match twice to handle =3D=3D.
>
> You can't do that, since the first one needs the `Joint` spacing and the
> second one the `Alone` one. `=3D=3D` also is a single token in macro inpu=
t,
> so matching only on `=3D` doesn't work.

Ah, ok. LGTM then.
