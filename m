Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE9CA51E3
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 20:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D1F10E9B2;
	Thu,  4 Dec 2025 19:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1dtV8V26";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B5210E9B2
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 19:29:28 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso83731cf.0
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764876568; x=1765481368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
 b=1dtV8V262sIsscTxrek85PKZwAiSXM9HvBWIXorHccvpRmebTCQxUTneJ0qzei4ESR
 lZK4vnbaBLsev4VzyuGY3cwriluek7HGtgcqJNO15Pcpcdyit9752ijpYoFcKEsWeF/Z
 LxPQIMztiGTpbO7PC921zIHtmeVHYT0zN6O5xTwHs5NxIJf1lst+NKNgfh0U9nkRogaw
 nzHy/wUCsZ88mUluyjLsQ0HVr6TQPX+cxm0IS7I+seOb6N+m0230uwepq8/IOcjJfl9V
 jq661lOVSPUIWFNnR7c/an8iLz11AQltjZ3bAyQlJX5FIh+rx0tvri6Dj+56ewFikWSZ
 X5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764876568; x=1765481368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
 b=LchXPm7RGFGgNhr3GoW1Ue0Ait98yy2JkL1/njtsnAq5M1BVdluC0emp+ymWGikuRO
 3nyXB/Ict8/z8AGqf4eQCrNhRVXDrhiYDIVZEitO2UnWXJp6V6EULhtN+9V4ReNOVg+P
 dlBlz8UQrHOtQL+ZzzMF7NFbVcx+gc/Q1IfBEHqFgNJwNxToG361gbhnBzWfMMl3nngi
 tYrse/ZZuU8rQbO174FjoE+WiNCJU2jkD29KR0I8mrj/W3NjjfeLRvRI5RKP4HVQalyB
 KjRMx/kWSyAWHiSe7Nd/gNWqzKscLpqK68RK0QiLJm9w/chwd2/ohWsyGrPuomxdD8ar
 MKTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeqgCyZM+QaSTCGeQZgqUU0P1Mwty/yjw76EAaw3syak6qnSz6+Jzl1HhZM9AnDoZNhYVO5aoh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDoB1SfUThgLd0aPIo8z2FCZI9uXQB9w+iE92yEcgq382LR61k
 PubaafNld7h4Rd0ZNvs4AoixX5PNE+4Tu6AsrunpD+xftJzeTfK/Tz8umTt5ynkAktR3I6XLG4B
 RqHAcBz9Pnhobp48lbrwGq1Se/6uDBD791+jRhAzR
X-Gm-Gg: ASbGncvveesZ8EAmtyC/02MfXUE6qh8HDM9JPygy/YqsDmOpDcUzEvhhUXiPbPUbax0
 ob+bpmSpTLEnINPxXd2hZ0UYco4RuRCAlAKjrXp9qko73bAH8ldPY2WXHg/CXKH+CncstR0vWQ1
 GpR+DOWWZDlnghN6M0eS1qoavZjrW5nX6cFa1V7/FUCa0ldZy0F/Vz8uXySgo4WGjhIOJRdaBO3
 sH/+jOpVI69n8u/mjHFXjQZQVGaWR5bxpDO4ZHHdz+YV9TqrEhOQu1kYbM7vIzU9mduG176HCB4
 ZCqVb/Ow+pHMjRGjftKzCJfs1Q==
X-Google-Smtp-Source: AGHT+IG/7kUZxd/9UMd9RxOWK7oRJw6LsWkyhbSwzHRq9dv3XGK3gE0ZwwYu8Q59dnHZWlQ+QWACJNmSaDdEdt4GFj0=
X-Received: by 2002:ac8:7d91:0:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4f0310036bbmr1019101cf.19.1764876567093; Thu, 04 Dec 2025
 11:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io> <aTGJdlwMRxGg2iZ1@google.com>
 <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 4 Dec 2025 11:29:13 -0800
X-Gm-Features: AWmQ_blF4lJt3BfO2o2NOJRf3_Ss0kAS-vrqLdfp0qFcfHcQVmwUbXFySwWbsjc
Message-ID: <CAGSQo01Am_rNeZqnqZU3hY7SwWG=dTHtzcksPSHUTiasgex+cA@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
 =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Antoni Boucher <bouanto@zoho.com>, 
 Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>, 
 Josh Triplett <josh@joshtriplett.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org
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

On Thu, Dec 4, 2025 at 6:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Dec 04, 2025 at 01:15:34PM +0000, Alice Ryhl wrote:
> > On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos =C3=81lvarez wro=
te:
> > > On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > > > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > Right. Earlier I also proposed using libclang to parse the C head=
er and
> > > > > inject that. This might be a little simpler, in that..
> > > >
> > > > Yeah, that would be closer to the `bindgen` route in that `libclang=
`
> > > > gets already involved.
> > >
> > > Yeah, so... there are existing tools (c2rust [0] being the actively
> > > maintained one IIUC) that in theory could do something like that (tra=
nslate
> > > the bodies of the functions from C to Rust so that rustc could consum=
e them
> > > directly rather than via LLVM LTO).
> > >
> > > I think the intended use case is more "translate a whole C project in=
to
> > > rust", but it could be interesting to test how well / poorly it perfo=
rms
> > > with the kernel helpers / with a single header translated to Rust.
> > >
> > > I personally haven't tried it because for work I need to deal with C+=
+,
> > > which means that automatic translation to Rust is a lot harder / prob=
ably
> > > impossible in general. So for Firefox we end up relying on bindgen +
> > > cross-language LTO for this kind of thing, and it works well for us.
> > >
> > > If I'm understanding correctly, it seems the kernel needs this extra =
bit of
> > > help (__always_inline) to push LLVM to inline C functions into rust, =
which
> > > is a bit unfortunate... But this approach seems sensible to me, for n=
ow at
> > > least.
> > >
> > > FWIW Bindgen recently gained an option to generate inline functions [=
1],
> > > which could help avoid at least the bindgen ifdef in the patch series=
?
> > >
> > > Anyways, it might be interesting to give c2rust a go on the kernel he=
lpers
> > > if nobody has done so, and see how well / poorly it works in practice=
? Of
> > > course probably introducing a new dependency would be kind of a pain,=
 but
> > > could be a good data point for pushing into adding something like it =
built
> > > into rustc...
> >
> > I already tried c2rust as an alternative to this patch. It works okay
> > for many functions, but it's missing support for some features such as
> > asm goto, though this is fixable. But a larger issue is that some thing=
s
> > simply do not translate to Rust right now. For example:
> >
> > * Atomics use the Ir operand.
> > * static_branch uses the i operand.
> >
> > neither of which translate directly to Rust.

I took a shot at `c2rust` as well, the summary was that `c2rust` was missin=
g:
* Asm goto support
* __builtin_types_compatible_p
* Deduced types
* __count
* _Generic

I was adding hacky implementations along the way to see if things
could be made to work, but the %l and %i missing in Rust itself that
Alice pointed out were not things that could really be worked around.

I also think that the bitcode-based approach is more future proof -
the kernel may pick up new C features that `c2rust` hasn't yet learned
about. If `clang` is in charge of generating the bitcode for the
to-be-inlined helpers, we don't risk any desync in terms of what
features are supported either by `c2rust` or by `rustc` relative to
what's in use by the rest of the kernel.

>
> Right this. AFAIK Rust simply does not have feature parity with inline
> asm. Them having picked a wildly different syntax for inline asm didn't
> help either of course. But Rust is Rust, must have terrible syntax :-)
