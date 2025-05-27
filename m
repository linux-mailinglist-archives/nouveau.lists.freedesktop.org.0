Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF5AC4ED1
	for <lists+nouveau@lfdr.de>; Tue, 27 May 2025 14:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02E10E4E2;
	Tue, 27 May 2025 12:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="s45UJUjL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E910E4E8
 for <nouveau@lists.freedesktop.org>; Tue, 27 May 2025 12:44:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so22650045e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 27 May 2025 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748349881; x=1748954681;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+1ORexpCal/yWarvUklj5P7KVERu3osu4+FfJ0CMj4=;
 b=s45UJUjLmB95wp247BuHhYBBbwtrCf7jbg6QVyGymfvH7Jf+iJBulUTHEy7LWOP1TV
 fDSolYjLIEQmaL6Yc3mez+LZVKCNC4LyWrkiYvJJaN+ck7/AbtPo/rlUezayQt2iSOdk
 NbBYNbchV8VnkUNypdDhWIMfp6wuYugu5O+9kXv0HXBWr/ReCet0OpqmkhctPHR0bbkJ
 AwTbw867Y891tHOba4rneYYqPFzNtjR47o915xQAp5hvWbX/PNYdIOq1L9/jlXcDAw/x
 Bn7vI6UkKS1DJEfBju5XcZl8iUuBu6fNTON07UAmsC4qZQ/s67yWFA1znzDYa/4xnMxP
 N4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748349881; x=1748954681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+1ORexpCal/yWarvUklj5P7KVERu3osu4+FfJ0CMj4=;
 b=JBFy2CgS9KynSphYgK4Of7PmArg2kcymMq3ZoPW+awo170OoWF/kE2/Fv7qqrsRHWV
 tyNEDt2bgmuKpHvoXW+EwMvfZa4FwBwORsDLWzd3M9fNzJXrGRVDVZpgg6jccIhOuKBL
 k1TIXFiuqiYIpgNR27ArXDWEWOCk/BGfySM9Svq1yvPuN4rG0HB0fl98vnOMfNI3bhCy
 TNQLubE2F7ZmCNApW6AsbqytwRiV9rN/a3Txg2pRlNnSs6goEWtTjrV8Qyc2E7adugsm
 47G60wKoLhSPdIKd5ImOFERZO3Cs9AgDYcHU1AE5OmoJiIh+ggnxCmvbAmzVrSuSC1iz
 LoOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxR312rcvnFRRwTqQ8a2bf47u5gX2m2/oD5jekGMcIKfIjAyzimmUP2Iu4FAO313YHqd6BrKbk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeFU63NB+Fb/3Rb/zTyYow/GLHMc7uruYNsa4CnSL7pCKAPe7+
 FGNLS2Vxy3x226F1oPhf8U52EhcZw6G5Sa/miTDOf8T7qpRxnLgFDo1rplQgulTTpQLhzpDJYoj
 KhrwjGAeyfOzNqZVLaxhEYgZq/YsZu5Afj07+MqWP
X-Gm-Gg: ASbGnctryowB6AXXGcgfdcBCqmEvFCgjrF+oXjmgQaXAKq59sjCqI+HtQ52vy950PmC
 LsWLI9tPkxK25V9M5fkpNvDiGOm11/csSBMlMBgJRdnK5rucNuuSCTIHlqfSWviN4TfW3hDseV6
 IZnZTX3OrLqMf0E8qSwOAd2HOZenX/XDuhUA3r7W7H4YpXO+lVUW0IjGsW/28QhpWRv1N5V8DP
X-Google-Smtp-Source: AGHT+IEky1d5meo1qHzcDPYMKOo6itgabi6xnmNH55BIUhfTHja5jzKInw1nb+GfsRVDFZjoQp10Sz6+0092+zxkyU8=
X-Received: by 2002:a05:600c:54cc:b0:442:ea3b:9d72 with SMTP id
 5b1f17b1804b1-44fd1a229demr3814135e9.5.1748349881244; Tue, 27 May 2025
 05:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>
 <DA66BBX1PDGI.10NHLG3D4CIT7@kernel.org>
 <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com>
In-Reply-To: <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 May 2025 14:44:27 +0200
X-Gm-Features: AX0GCFs41915HXTpfqcCKH3n_1X5KqqnwxYwkDK8S1yQqomTcDJwCXbrNKkuqdo
Message-ID: <CAH5fLgiUhvp9P7oSf4Rtv5jK1SNebW9-r5YFHVzCZjEwaR=Mjg@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Tue, May 27, 2025 at 12:18=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
> > > +}
> > > +
> > > +fn make_ident<'a, T: IntoIterator<Item =3D &'a str>>(
> > > +    span: Span,
> > > +    names: T,
> > > +) -> impl Iterator<Item =3D TokenTree> + use<'a, T> {
> > > +    names.into_iter().flat_map(move |name| {
> > > +        [
> > > +            TokenTree::Punct(Punct::new(':', Spacing::Joint)),
> > > +            TokenTree::Punct(Punct::new(':', Spacing::Alone)),
> > > +            TokenTree::Ident(Ident::new(name, span)),
> > > +        ]
> > > +    })
> > > +}
> > > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > > index d31e50c446b0..fa956eaa3ba7 100644
> > > --- a/rust/macros/lib.rs
> > > +++ b/rust/macros/lib.rs
> > > @@ -10,6 +10,7 @@
> > >  mod quote;
> > >  mod concat_idents;
> > >  mod export;
> > > +mod fmt;
> > >  mod helpers;
> > >  mod kunit;
> > >  mod module;
> > > @@ -196,6 +197,24 @@ pub fn export(attr: TokenStream, ts: TokenStream=
) -> TokenStream {
> > >      export::export(attr, ts)
> > >  }
> > >
> > > +/// Like [`core::format_args!`], but automatically wraps arguments i=
n [`kernel::fmt::Adapter`].
> > > +///
> > > +/// This macro allows generating `core::fmt::Arguments` while ensuri=
ng that each argument is wrapped
> > > +/// with `::kernel::fmt::Adapter`, which customizes formatting behav=
ior for kernel logging.
> > > +///
> > > +/// Named arguments used in the format string (e.g. `{foo}`) are det=
ected and resolved from local
> > > +/// bindings. All positional and named arguments are automatically w=
rapped.
> > > +///
> > > +/// This macro is an implementation detail of other kernel logging m=
acros like [`pr_info!`] and
> > > +/// should not typically be used directly.
> > > +///
> > > +/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
> > > +/// [`pr_info!`]: ../kernel/macro.pr_info.html
> > > +#[proc_macro]
> > > +pub fn fmt(input: TokenStream) -> TokenStream {
> >
> > I'm wondering if we should name this `format_args` instead in order to
> > better communicate that it's a replacement for `core::format_args!`.
>
> Unfortunately that introduces ambiguity in cases where
> kernel::prelude::* is imported because core::format_args is in core's
> prelude.

I'm pretty sure that glob imports are higher priority than the core
prelude? Or is this because there are macros that now incorrectly use
kernel::prelude::format_args when they should use the one from core?

Alice
