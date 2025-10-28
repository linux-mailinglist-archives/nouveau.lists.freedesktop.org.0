Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E2CBAF73
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8634310EC97;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="FukL4cc6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD3410E5E7
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 15:12:44 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b63e5da0fdeso609838a12.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761664364; x=1762269164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
 b=FukL4cc6FuL+wglYe9k3OxWIgW+PfCksR0a+z1H8YU1zoHee44E8ogQoasMD0sFf8t
 EVb1FIXWjJqllJ9fQNlfVw+PTw1AGaZcqyCm/Xa35bMmLCL1aLt34CJUqG1+ynIf/uK8
 IqG+dKsPO3VK0zNrfCF2KNEaukxNfLwIUjp8uLu3lJjkRGiZ4ifXWEueE3aoaCbjoQe6
 htjNU58myKGIHvpxZAEc0EI1f/G6wQRUiPqS7GgP+aEl6xhnl6PlV3jMalUvtADAoDQn
 i0HbiwSZ8TqW61DtAPW6Qcn2JNcGYTUgl7oDh1N0tt7NRMpzW75Pyvqk4xJ2kFKuiPVN
 Kzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761664364; x=1762269164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
 b=T6W6fSu8hvaPxnGr4RN12yVfoFDf34O3kMYhJ8hxfIVNWNp9vls2rlaPl9A83gvSpF
 XzvFF+hZvYVhwewrEwXdBATpUzocmUbb0y7PWNs5sG+RJIdOVjXlSw0mXMiVDf5SA+F+
 Tem8YIiFksiUTGn+v5HSG+AhXgoVzY6ovb2r4KmSyHwn9pYtvUFGmOnXNLoINplHE90d
 micitgIdQYF3I2NJ18CpA9/TFrlj/V96i7KEpDnLsy+NoOldmySdMKZQFCrgmACzFBgH
 HLYjRtsUNlv2RmA8HrvUf/vac0b8HJA0AMq1HReAZtzuOLMF8uvwxSkJFizjyTF+/iws
 wDQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEP7BA0Y9PyLfXWcrRzukkfwyUZkYxLq6sv9a08SlsHuYpifIm+YkpfRnOGk5V1GTqU+odD/eJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkAghO98YmHcP/0G3D3BTU96vAKbTI+QxF8nKNaB+E/mjJzfQ/
 axrrQuu+MrqsIZgeH1UwS1GYmtsH7+h0mgNtfTNZRmvoIbBTu52oMYTAQ/jMX+k3E0nscwG3tXK
 L20RPFvgWmMM5lPuSJQ6hGOTMWTI8nJg=
X-Gm-Gg: ASbGncsL8wdCpI2/gG6uvLb1RSCYYOjRyE+svGBLgn1PSIpx3mCYhZWw3lG9oo2QChp
 Lu0uCtYc8Ywj71rnZF7bX5TEcU2wBasznCwPqITjAxZ2+vsFdAAsZyMMoU5FmZ/FMWeuNcAQdLq
 IrlnAIKU59t1KAoY9MrdYSMewlt5gdtBob0SJX1juU3Is28rhPiCfTLkJ+3l17Hz2eqhxoFYhy8
 rL84ioJ4aWA6LJSU7bceKL0tIN/24NAhrC4C1XzJJrdSKyx8y0Pt79p+42SP4MCRgp+nXcEs2XO
 5yYIvTyzWkbomZxKMVovIiJgeb11Ni4ifx8DeOeKayL6dlk+v3uY71sKuV32tf2oKtOE/ZDjqpB
 +O2k=
X-Google-Smtp-Source: AGHT+IFYPGiAfq6Bkpv4VIZbnQ2eB25p+ZAfZMrF5Pziev/2opSXlTlA+Qb2DBeslIA+t2R0h3bM5akBnOcG/++7Z0U=
X-Received: by 2002:a17:903:8cb:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-294cb500277mr27314415ad.7.1761664364153; Tue, 28 Oct 2025
 08:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
 <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
In-Reply-To: <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 16:12:32 +0100
X-Gm-Features: AWmQ_bma5_85Uxd8PIaUq6SaqwUjakaAH7XUFCSDVLctaYXwoFO8A3BqGERgpOk
Message-ID: <CANiq72nbYiwFO6Vqc+yoW1-qT_uMN-CftgOpPe8Mqn56b1Fq9g@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Tue, Oct 28, 2025 at 3:44=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> intent with the latter was to say "I would normally have done an `as`,
> but instead here is a method that attests that this operations is indeed
> lossless and safe".

Yeah, so you want that, when we see `_as`, we are reminded that this
is the equivalent but lossless of that, which sounds OK. Though I
wouldn't say "I would normally have done ...", but rather turn it
around and say "Since we want to avoid `as`, here is a method ...".

Now, I suggested a change because typically I would expect names to
mention what they are about/do, rather than how they are implemented.
The implementation in this case also doesn't say much, i.e. a type
cast expression can be used for many things, and worse, the operator
may or may not be lossless, so it isn't a big hint.

But, yeah, I understand that you want to evoke the relationship above.

I also suggested it because when I wrote the message I was thinking
about the `cfg`s message, i.e. most of these depend on the
architecture, and thus having an `arch` or similar does evoke a
"careful, my code may not be portable anymore".

On the other hand, it is true that the `u32_as_usize` case will most
likely always be available, in practice, unlike the others. So an
`arch` for that one isn't great (but I guess it could still matter for
someone wanting to reuse the code in a different project/domain).

In any case, personally I don't mind it too much either way --
whatever looks best for most.

Cheers,
Miguel
