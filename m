Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C5C8920E
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 10:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5CC10E597;
	Wed, 26 Nov 2025 09:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oXD97pSb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B6E10E599
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 09:54:36 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4779981523fso63172065e9.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764150875; x=1764755675;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=P4pWV52Y/VlAYshTv/rppE52D3hyLd2Ys7b3DAPCZVk=;
 b=oXD97pSblzFcpySZZISFonpqw++FcC3kQoqU6E4tolPCnkk3QGsKLMEF5QNrccZ3be
 p0V41kZ81NGR6sKMIEAH7IKCKAkZ5jnXff+oSrrCzMhUNTEl9sCTRIe21zlSFZH2j/39
 Itln5ReeaOG57zs+QDx2vLiatRpNXtap/kh8YvsOQ/xZA9B5NZAWRadAtwa+0dPDDlur
 1qQ+Molfgbq/di7I0mmFpu8IKkYrDXI/l1QFPB9Ocdq1MFgWAaDDetyJ2z7g/PBL0/m5
 mmuJkkyHpV8fMockXeeB1EP67uQbwJhtPmMhrNvMJS/r/fVLLQoB7yUg3U9daUFOboYY
 ANEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150875; x=1764755675;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P4pWV52Y/VlAYshTv/rppE52D3hyLd2Ys7b3DAPCZVk=;
 b=e2BgmCcGttpuNpeHzBB8l+xkPx/cH9J/ef6vtjpX4LFs3LiQeQj+ahApPp1QxdfIk0
 zA5rH3mfA0+GEypaNwl+/Zjn8nfRg9FnZTOh48fs0ZlNxRbiOAZLluS/gwE8MJobq+Tl
 3QGYUiFO1BhwCYAZym83lFJPoDDgraA5ee24WLEs+Eug+7/7vhXjASXoqsPxCvSslYsI
 baKiueKN25AOVZTrwnPhGKHSwKRJSMLYMY08aHJrtSJvNslEZvN/a8ZF0Yt1brhZtKrA
 /XO3eA+0eF6pdZlJvLsGnjnO0mXxIQxrYiOAG2+nHl7yqiPAh83WCBnM+rJZ2dJaw0LB
 qxcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF+pXyBQA5+BEADikvm//9Fs4+3LieTODkOCk5up6D+CbPfvsExnMiU/fSbXqwWuLQ4cdoroWC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX3MSRu5VDVIhLWCdlPxHDacXWnPHFptypyt3dat875H/QXtCP
 asU98vhQDThFrOuN716qN7fJpCRj3RkjLCo8/6Ays7VYN8kDJ0zeHa2SYWQDQBLyaGqUAeTGHAd
 yKzjMCpCfPR0npsNJ0A==
X-Google-Smtp-Source: AGHT+IG/3B9kpEdz3dehtGK7evQWMTHrI4wGty5GonhDLixPcoHZ9HaKZwpzZ8t04fw05yHSRgs2R0qwKzxHGLg=
X-Received: from wmri27-n2.prod.google.com
 ([2002:a05:600c:8a1b:20b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f85:b0:477:7b30:a6fe with SMTP id
 5b1f17b1804b1-477c1116013mr170632525e9.18.1764150875157; 
 Wed, 26 Nov 2025 01:54:35 -0800 (PST)
Date: Wed, 26 Nov 2025 09:54:34 +0000
In-Reply-To: <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
Message-ID: <aSbOWhKIpCBm0NKL@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
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

On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@=
nvidia.com> wrote:
> >> >>
> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> > Use page::page_align for GEM object memory allocation to ensure t=
he
> >> >> > allocation is page aligned. This ensures that the allocation is p=
age
> >> >> > aligned with the system in cases where 4096 is not the default.
> >> >> > For example on 16k or 64k aarch64 systems this allocation should =
be
> >> >> > aligned accordingly.
> >> >> >
> >> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> >> >> > ---
> >> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/g=
em.rs
> >> >> > index 2760ba4f3450..a07e922e25ef 100644
> >> >> > --- a/drivers/gpu/drm/nova/gem.rs
> >> >> > +++ b/drivers/gpu/drm/nova/gem.rs
> >> >> > @@ -3,6 +3,10 @@
> >> >> >  use kernel::{
> >> >> >      drm,
> >> >> >      drm::{gem, gem::BaseObject},
> >> >> > +    page::{
> >> >> > +        page_align,
> >> >> > +        PAGE_SIZE, //
> >> >> > +    },
> >> >> >      prelude::*,
> >> >> >      sync::aref::ARef,
> >> >> >  };
> >> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> im=
pl PinInit<Self, Error> {
> >> >> >  impl NovaObject {
> >> >> >      /// Create a new DRM GEM object.
> >> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<A=
Ref<gem::Object<Self>>> {
> >> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> >> >> > -
> >> >> > -        if size =3D=3D 0 || size > aligned_size {
> >> >> > +        // Check for 0 size or potential usize overflow before c=
alling page_align
> >> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >> >>
> >> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - =
well,
> >> >> I'll admit it looks better as a placeholder. :) But the actual alig=
nment
> >> >> will eventually be provided elsewhere.
> >> >
> >> > What about kernels with 16k pages?
> >>
> >> The actual alignment should IIUC be a mix of the GPU and kernel's
> >> requirements (GPU can also use a different page size). So no matter wh=
at
> >> we pick right now, it won't be great but you are right that PAGE_SIZE
> >> will at least accomodate the kernel.
> >
> > In that case, is PAGE_SIZE not the wrong constant? What's the actually
> > correct constant here?
> >
> >> >> >              return Err(EINVAL);
> >> >> >          }
> >> >> >
> >> >> > +        let aligned_size =3D page_align(size);
> >> >>
> >> >> `page_align` won't panic on overflow, but it will still return an
> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let=
's
> >> >> you return an error when an overflow occurs.
> >> >
> >> > The Rust implementation of page_align() is implemented as (addr +
> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflo=
w
> >> > if the appropriate config options are enabled.
> >>
> >> That's right, I skimmed its code too fast. ^_^; All the more reason to
> >> use `Alignment`.
> >
> > Alignment stores values that are powers of two, not multiples of PAGE_S=
IZE.
>=20
> Isn't PAGE_SIZE always a power of two though?

Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
It sounds like you have something different in mind than what I thought.

Alice
