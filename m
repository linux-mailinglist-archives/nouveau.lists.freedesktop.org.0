Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90077CFE054
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 14:42:44 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6138E10E5DD;
	Wed,  7 Jan 2026 13:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Gw/+h8xT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF9ED44CAC;
	Wed,  7 Jan 2026 13:34:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767792867;
 b=YAB85PZBp8Vya/EUoad6lybYgAhQt54KBtCglh5ATVTcRmWmmV701lLccKcibQW0lByCP
 LPPh015bgGV5Gy8eDlHCUKs7g/XX4eyPjwrbjAz4HinrSfjobx+d1bE1zbQ7oiYtiedSDs1
 mAoG88uwffGA6gVe5lcgBlxYfXHO5xftLCFCcEKWh5L2v/eClbKEUBXMT/Cnz23zJMaBwST
 tTKpNQKSBrJ1YZr089eeOX8meCnGT53RjnIoB/665PXS1lzRDDM2XnDIF/ohSQ6WDJO/r+A
 a58jr9kKlFdaajuNmIdr6peXoewYPb/Lke9dsTAnMlnD9QKE2zuJZTc7SHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767792867; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
 b=zrnWf8GwNXrFxKmDa9297NfyKuyJ298IYh+EYHfMAuk/prIpqfEVBj5yHklqFRmMbsjO+
 MGl7PDL23rVcG1oopTvOcI0S6rJg/NKcJWQgsJf06yn7IhnbmsD99eVmkA+uPsaTRg8vpff
 qfRLeZwHUlW89No1qv+4GdlDEDAJkCue1RkmlEBS6dO14IjfCYpOwLACvVfOExxNozDcG5r
 QZZ58ROcwmtO1ScMa/rbfvYxy/9xfq6pzv5ikavPiJ0MnxxJolmFzgjcQwjBMmDYwnf9Rk/
 +Egybm3f9qzykixchELr8KuP+iTZUu9lWMtB1Oo7N8X1pxKN0qT02hH1kg8Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1412544CA3
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:34:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26A10E5A6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:42:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so1132745f8f.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 05:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767793359; x=1768398159;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=Gw/+h8xTfURcUQLwkYjAIxtzGnToe6GVh2nd5hAYtFT6CzkhpGMi9ag4EjK6CMyMFi
         Rwb/gYFwyi/UbGUSYtMQ50K+VetutmuH8aj077fVgCU3F4dVP0oikinL81JS+C75PBsw
         /shHjavghfkuuat2GHyxoM+j6mztJH1wRNmwcRucxhLrwSqfD5ZxDJq+1xHH5Qdj2E7e
         Q5/z+QkmdAFkiF5frknP2ZFzgaQR39OPJm6XD7XTROWGicTjuZVfvvb2dzVETA0qr229
         ezSU+VzIdPLlBjiZmjzBDuAU7/9kg4KMYcwwq0TdqsI7IvE1X+9NCn0MoZ9Y2SJdWPaR
         xZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793359; x=1768398159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=NcrCzLi1dGyHJwWRL7v8f8wgQTKxeW6cSwwDoqJw5z6WxQ8ZP2QPI6jdChvl1zdvQ2
         oIUU5xo261/VY2jjqVUZsC8aT39vfLR7bPqPgHTI3JwRqtt1zFLagaY2wDAxRF9qESoy
         wGgha10gK/+Cd2AFA01PYNjHBB9AoHXUaeflYpxntG4arZopJAibNrg/FEdCenhNp2vl
         KTMvuiyE7+hMfUv22Az5Comnbqot6KnDa1G7849ux1RhWrOUj9BZtoAWrfEaU4Y7ytYL
         I4OCt2dnL2nWE1dqADaAmnBO+UFKl1hLf92AQ39iEsqsJip1T4LjjFJBOjYqrxXXx/ix
         XK2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGc7DnSz7we870tZLz0SCziaCOITDduyQ5Fq6maLZOh9X2vh6RlvbN6t+2n3E8uX2L/A2sOfGJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGKYpgSEAi9f0/l+kZkYpWQAH1lSfEPnLaTln5LPP3A1FIA/g3
	/U1mWwcI2Hqs0WujCg6O5CIkxmve5BK1QV7C9M72ZR8ORB2ap0BhY6hRzS25jG7f2azN4ur7L0Q
	A5+ifHHffMpOQOTYcLmOQSdOJUsz334e+4oxivaAl
X-Gm-Gg: AY/fxX6N0NbvrNJsXETlIQRR1pMe8re9LRB9ZZu3hltl/lxVH9w3Iy/TPD1STrr8t7t
	i1WZbP8w9xsZShbUDpr1u8GhfBGQq9Q7C51drmHIBMnTHg/hN3CkaWJRLJct1t7F6PPrGDvOjlT
	obVe/lnwy0Nrz5S4fzGeCdJ+kCP2QnKkC72n1h4DLK2oomyXCNkcgMnzuqYPY6bei86CUpMBwth
	ClXqhCyUn7xgk/W/oyO3THmf2tEYUCocdYHbYOkmL366Z0X58CxJ7LRmkaSYsvGy3v9nOHk/EQZ
	VtAM1+9SDZV08iKsJZPwyP8WRvTTzdhxZMbqvWGN79Cp85SBlZ+xaE5QVw==
X-Google-Smtp-Source: 
 AGHT+IEAUc1mXQn7QPlaWNlhB+oC5uC/VKZi1CsDAujRYSITqdy4Y0I5rdAfjg0XLN3IVv+rgZqfa1hd3+1gv9RykyI=
X-Received: by 2002:a05:6000:4301:b0:42b:5592:ebe6 with SMTP id
 ffacd0b85a97d-432c32f701cmr2574852f8f.0.1767793358358; Wed, 07 Jan 2026
 05:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
 <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
 <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Jan 2026 14:42:25 +0100
X-Gm-Features: AQt7F2pAZcR9-cuXntjPdly3bLnSH5zqd4_0Qf_i4GvgVh-5nOmI2NH4hmtXZLU
Message-ID: 
 <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
To: Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JZ2LLFJEVOB6YQRIX676R7CAGZB533ER
X-Message-ID-Hash: JZ2LLFJEVOB6YQRIX676R7CAGZB533ER
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JZ2LLFJEVOB6YQRIX676R7CAGZB533ER/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 7, 2026 at 2:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Peter Zijlstra" <peterz@infradead.org> writes:
>
> > On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
> >> "Peter Zijlstra" <peterz@infradead.org> writes:
> >>
> >> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> >> >> Hi Alice,
> >> >>
> >> >> Alice Ryhl <aliceryhl@google.com> writes:
> >> >>
> >> >> > Currently the only way for Rust code to call a static inline func=
tion is
> >> >> > to go through a helper in rust/helpers/. This introduces performa=
nce
> >> >> > costs due to additional function calls and also clutters backtrac=
es and
> >> >> > flame graphs with helper symbols.
> >> >> >
> >> >> > To get rid of these helper symbols, provide functionality to inli=
ne
> >> >> > helpers into Rust using llvm-link. This option complements full L=
TO, by
> >> >> > being much cheaper and avoiding incompatibility with BTF.
> >> >> >
> >> >> > I ran a microbenchmark showing the benefit of this. All the bench=
mark
> >> >> > does is call refcount_inc() in a loop. This was chosen since refc=
ounting
> >> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns =
per
> >> >> > call vs 5.73 ns per call in C. When enabling this option, the two
> >> >> > languages become equally fast, and disassembly confirms the exact=
 same
> >> >> > machine code is used (in particular there is no call to
> >> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> >> >> > improvement from this change.
> >> >> >
> >> >> > This patch is complementary to:
> >> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e1=
3cbc17a6@google.com/
> >> >> >
> >> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> >>
> >> >> I get the following modpost errors when building with this applied =
on top
> >> >> of v6.19-rc4:
> >> >>
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core=
.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] und=
efined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undef=
ined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko=
] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platfo=
rm.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.k=
o] undefined!
> >> >
> >> > Looks like it used the wrong static_call_mod() version, was MODULE
> >> > defined?
> >>
> >> CONFIG_MODULES=3Dy, yes
> >>
> >> I built without the patch first, then applied the series, enabled the
> >> option via menuconfig and ran the build. I thought maybe some dependen=
cy
> >> check is messed up so I retried the build from a clean state. Same
> >> result.
> >
> > No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE=
,
> > but the new quiet_cmd_rust_helper target does not.
>
> Ah, that did the trick, thanks!
>
>   diff --git a/rust/Makefile b/rust/Makefile
>   index 5365d53b6cf96..08d3dc1038cf5 100644
>   --- a/rust/Makefile
>   +++ b/rust/Makefile
>   @@ -483,7 +483,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(sr=
c)/helpers/helpers.c FORCE
>
>   quiet_cmd_rust_helper =3D HELPER  $@
>         cmd_rust_helper =3D \
>   -     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
>   +     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -DMODULE -c -g0 $< -emit-llvm -o $@
>
>   $(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
>     +$(call if_changed_dep,rust_helper)
>
> Is -DMOUDLE always appropriate to pass to the helpers? The helpers are
> also inlined into non module code.

With this option, helpers.bc gets linked into every Rust object file
separately (and symbols are internalized). We might want a separate
.bc file depending on whether the Rust object files is part of the
core kernel or a .ko file.

Alice
