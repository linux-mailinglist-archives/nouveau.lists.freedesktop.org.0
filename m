Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7CC859A3
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 15:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09E910E427;
	Tue, 25 Nov 2025 14:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pBYHQbXd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0248610E42A
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 14:59:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso42169105e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764082784; x=1764687584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wVagC+UMR5yq8ETeNg34KLN87w696g4GRpmIO4FmPyQ=;
 b=pBYHQbXdHPohWemnZc0YWDznmuBvp9Q5lp2xBlbEejXMKG5XglIU5yOyyyWZRgTumP
 4osGvHCZ7322Cjpz8Xnpaaz/Rb9iZJAGvmQJk+2tsNLmPNaXlbah4a/kWqI/6MsiUnwA
 4KrHP6J9apr52LwrRZIpTA3jlSTxSlIxpY2Itrh3ZQwlW8GlqrCgtxPCxQENaYQQWO7W
 buhtFU8APkRTyHcXDNmm/VZdD++oLLTL80/bjQgj5hdXqIIqLAjAVXPniZXWVRd/ZNmN
 OuP5MvWXGzuH9U50W7VVCqwxQ9cH9jCeczoSmnDNrj+YdJ8WBQwaqoqrRMlRKFYQAvGZ
 pOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082784; x=1764687584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wVagC+UMR5yq8ETeNg34KLN87w696g4GRpmIO4FmPyQ=;
 b=vjsq7257EMrvDJCN3/cRdi66L35xAoxDViIMp4y66qBohA2FqWlgek5xV0TK5G403E
 ST/cTWQ8GS7GoE1iy5aX+TbOSQQRpiKRcT0drB5iE6ah5lku2SodxjGLQeh5nyxkx9TF
 bm42I1i4BTka5ejSoWY96NGkIHT6fuUn2V0wtT8+a1JGe6Inmdi8QzClQNQN7rfZgE69
 RENl0RTK8O8WF1TTM3q1nrh5VDuka8UhcJh2JGgCMrG/sn76Ye48PV8YbRONpONaj7AY
 zAStkTffrGZeAmDaa3vaQYtsNx3cklT6ciG2oLkT/b9R58dnAc+dLV+5Jifqd1soNqSJ
 S5Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1Pze2txY++Zcdmv8eqiD11kPQjaLW7NKY2UKsmv0VmqX2wEtqtBo3ydBayTzaKfk24NSlhgwR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw00+TZOEyG8LzKcQJuu3xTvA/dlIeBqIWO+dg0zNXnZNuB+QSA
 vPHgPXD7z5KluPo9Mxs+MWCUbrGF2LUT0T2UqMakA66TkLttEjR1haG7KyAKZ0SxmMJYrMLnW+p
 4TgVcbkLNNZfwwx8DxBkqunc4J9Rb5xJ0ajHsfIzn
X-Gm-Gg: ASbGncu5nuvGLWX11/1xdj1cpT77N6x0YWog9iC8pPZc2x1yIEpSVuI/qH+rUyhcyKV
 lhm1U+v1YWLUWtvIRi5zJLg3gk8DIVwQFU4ZBvn2pKJtwaj21mB3M0q+iXFFGv+agACTKrK2Ds2
 Jg1BSLgDbnTy6zdzjZhxM92XUMcuXdzbRvfCr1j6en3YoCipEIqwXEGcX2txTttgyOibNbH5WTI
 IppfZBZ45CZy2b45A8n/f3Mwe5hzROGUd4SsvE+i6lhx2KzIds0vCUFQKlCbBtwJ/1v7EcbHEUB
 OKBUk87mEW1vfddP3nVpdQ==
X-Google-Smtp-Source: AGHT+IGkJd1H6nFr3Y+NpL3Q4jL39vazsIi/C69U9vhgk38tOat9OMAKfcLlUtxyzxsSslltth5ttiPh5ErFrT8805Y=
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-477c04cfa31mr163605255e9.5.1764082784106; Tue, 25 Nov 2025
 06:59:44 -0800 (PST)
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
In-Reply-To: <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Nov 2025 15:59:32 +0100
X-Gm-Features: AWmQ_bndHTe5QCQ088hdVQsq2DsGQ4RRnTSFaROGBSL304Eztip9Q7IRWvmenF0
Message-ID: <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> > Use page::page_align for GEM object memory allocation to ensure the
> >> > allocation is page aligned. This ensures that the allocation is page
> >> > aligned with the system in cases where 4096 is not the default.
> >> > For example on 16k or 64k aarch64 systems this allocation should be
> >> > aligned accordingly.
> >> >
> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> >> > ---
> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.=
rs
> >> > index 2760ba4f3450..a07e922e25ef 100644
> >> > --- a/drivers/gpu/drm/nova/gem.rs
> >> > +++ b/drivers/gpu/drm/nova/gem.rs
> >> > @@ -3,6 +3,10 @@
> >> >  use kernel::{
> >> >      drm,
> >> >      drm::{gem, gem::BaseObject},
> >> > +    page::{
> >> > +        page_align,
> >> > +        PAGE_SIZE, //
> >> > +    },
> >> >      prelude::*,
> >> >      sync::aref::ARef,
> >> >  };
> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl =
PinInit<Self, Error> {
> >> >  impl NovaObject {
> >> >      /// Create a new DRM GEM object.
> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef=
<gem::Object<Self>>> {
> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> >> > -
> >> > -        if size =3D=3D 0 || size > aligned_size {
> >> > +        // Check for 0 size or potential usize overflow before call=
ing page_align
> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >>
> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - wel=
l,
> >> I'll admit it looks better as a placeholder. :) But the actual alignme=
nt
> >> will eventually be provided elsewhere.
> >
> > What about kernels with 16k pages?
>
> The actual alignment should IIUC be a mix of the GPU and kernel's
> requirements (GPU can also use a different page size). So no matter what
> we pick right now, it won't be great but you are right that PAGE_SIZE
> will at least accomodate the kernel.

In that case, is PAGE_SIZE not the wrong constant? What's the actually
correct constant here?

> >> >              return Err(EINVAL);
> >> >          }
> >> >
> >> > +        let aligned_size =3D page_align(size);
> >>
> >> `page_align` won't panic on overflow, but it will still return an
> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> >> you return an error when an overflow occurs.
> >
> > The Rust implementation of page_align() is implemented as (addr +
> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> > if the appropriate config options are enabled.
>
> That's right, I skimmed its code too fast. ^_^; All the more reason to
> use `Alignment`.

Alignment stores values that are powers of two, not multiples of PAGE_SIZE.

Alice
