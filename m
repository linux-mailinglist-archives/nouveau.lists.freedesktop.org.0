Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBFCBACCD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E697510EAB3;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULZaOTcX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A910E33D
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 19:19:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-27eca7297a7so1574455ad.1
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760642346; x=1761247146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
 b=ULZaOTcXb2h1JC7Bl7LMad0whuqjedwsD6TdJjIQ6E1YJxLqx7JFnWu64tg5368A+7
 rpeojB8hGpjxareQ9tTlQ2Ov1y+SadNpYHg97us1Vs4Hb2z6QkpIo1HFymyxBw1ELhrv
 aKY9ciYPERyiSkW1iYN6weZLC8RtohxTHmkWTKGpJR715jaXdvd/q2SRo5stCcvl2t0y
 yEK4qfTJ8+4GdXcFfkC53yiKnPUzmW/8WHutx1c6M+9Z52nP0GGtmtfn+sO03uvQzmSB
 TBiQoZMr9Y4UhyWPmViGOc60Ci/SxVINIS8m9siDxwXh37OrswD3qsmEdDx93wbiIuak
 vv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760642346; x=1761247146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
 b=HYz2VUM0KdL6ZUfLAPkWvZCamvRGJVdVdosxaB3i+NWzANr3erQgUH1ais89wF0geX
 XI7+i6smeA6JQ7dx5i79268e57b8X/xmZAYZA0tP7jcxpW3EqxEqWkrkXZ+va5Iqonuj
 DgF8kgbmHywv1EbWl3DGCeHbQ/wqJSEIJeBZnlKtkcrcAy0tPvCmIoO/A/gu2ZhlaKaf
 JXUkswatsNoOI5fSdmRfqNKslxhpp9mkKpTnCuVbvaCINCkHWZvvBEoW0be9BW+U5zNa
 xQUMxqBhODUnIf2M6rXZwhQe4ZgmVyJemluS/qhqMYWsxzLif8wpJDzvSmfFippAUvNc
 XkOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVnJHk/X0+fKLOUP0qgvjcXrxA1McRaws8af9KCO8H33tpiUtdAhCBs2VTIIdQRcTxxaWe/5O/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCnfnmEvceA/4MYojzu1EuDuaEwVCV2WzxIlhPL54xcTlL4PTO
 NHvN8xA27G0kGRuNkLcEoOStgxWWdJUR+yEYFGZymhCuJ4nkKOls0uuG1H3qVDbQAUyuNrlICEc
 IJww6cR72TkKsYNUR/Ho0odI9Np3PNog=
X-Gm-Gg: ASbGncvYfsXC1bIa7gfsopMbUBthXWmQzKdZkpXfCHmb29PBtGXm0gTnSqFwjycQQsE
 WjoVKvxmbvnSg0RcmthftMe4EQYPWovU+1279I1uX0FtG8YvpobNTcp/4YwXxnOaZFdek/Cd1HR
 axqFJs7we8y3oo+tZugKrij0PVbfVffi3Dp80K0iDr1uyDXj4Fe8T0M5QEupC6L72iQlzxNpi3d
 D7zjBZ/IGIgW2OGYxJidWc4WX1xgOiDIN3LGOcArD0Ywjd/HunI1n8QESrC2PgpEhqEXtdWJPWU
 vWqqVYMHkuuFe8dekXdqF+vqvQF4GflltiYVrMlfIcn2t8N4pIwTamt160TnhZaZuSw28/6rvZ5
 kZmU=
X-Google-Smtp-Source: AGHT+IH0YWgGKSo65cgBPX5W3p7j4HkK3bVU7l78fZ+js9jI7tU4OLEp6GPUbGx58mDOvsKGfrW9fh+1rWFnGpM/2VM=
X-Received: by 2002:a17:902:e950:b0:290:7634:6d7e with SMTP id
 d9443c01a7336-290cc4ea8f2mr6194375ad.11.1760642345509; Thu, 16 Oct 2025
 12:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-5-apopple@nvidia.com>
 <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
In-Reply-To: <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:18:52 +0200
X-Gm-Features: AS18NWCOXO5Nlj8i8ZNj-U23NNA7RJ1ucE47naAt3VXCGXJAjL5KZrU7UJiyBhk
Message-ID: <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
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

On Thu, Oct 16, 2025 at 8:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> >
> > +/// # Example:
> > +///
> > +/// ```
> > +/// let mut buf1 =3D [0u8; 5];
> > +/// let mut buf2 =3D [0u8; 5];
> > +/// let mut sbuffer =3D SBufferIter::new_writer([&buf1, &buf2]);
> > +///
> > +/// let data =3D b"hello";
> > +/// let result =3D sbuffer.write_all(data);
> > +/// ```
>
> This example doesn't build - there are several things wrong with it. It
> is also missing statements to confirm and show the expected result. Here
> is a fixed and slightly improved version:

Yeah, I mentioned this one in a previous version -- the section header
is also still wrong too.

Alistair, please check the link I gave:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

or other code in the `kernel` crate for examples on how it is usually done.

It is not critical today, of course, but the further it is from what
will be needed in a few months, the harder it will become to start
building the docs and running the examples as KUnit tests.

Thanks!

Cheers,
Miguel
