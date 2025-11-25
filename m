Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD4C85775
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 15:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC0910E41A;
	Tue, 25 Nov 2025 14:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="l4/zizJj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F5310E41A
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 14:42:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so37149135e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764081726; x=1764686526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXLwSJeOSrSWJj4MBoSNOzvUQJm8IEmFrwojTcmAovQ=;
 b=l4/zizJjvegUUlyaOaf27gpMS8uvO3YvM9E36DaqyFx3izNnRNOn5bbA1+1tKiwaBC
 Vda64Js3GmfzTu5ngv8MD23J+5v6hXrveqwBbR2O2Dvr3hQEW2rUrWuGsBluCnCQnrg8
 lLqKqDw/10n7Za9Z2biHLiEQ9w6rlcBMlE3xTyyu71yx1BjbbU3tqCtHXFRZ0R9aAL9F
 fpfvOT36yLhIDaLba79QT71VN1wJsaXZ6rKkk5cyiqYXCqH2VmUjJaYg/lLLIox7EceU
 x+Q63CEiTzQAoZSOTDLeS4Hn93/e1zLO7e017s3Q1XhusVXKY2TUBxFgFP+8IcXzzurR
 7rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764081726; x=1764686526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wXLwSJeOSrSWJj4MBoSNOzvUQJm8IEmFrwojTcmAovQ=;
 b=J1IMzvIRX7HFfnD8ZSiNDzZbOwi8uir8O3RUbCfygC7J8x3EkQOPNQecAU1DqfTP6q
 M0CjDj3m5PlxwPszAxMXM+C7qVZYSaZSZHihdH1OqUMtAZNp9H095QGsXTFUF6cjBX+p
 SpTx49tG/qDHgBrp1JKUnzygtpkRKT5BZ2nGSITZ6Vre5kEIe7PjRwcX3EkxwuqkDNoV
 +z9lf5nxu1WAxHsILNwTYirn4W1ruBIuZDU71izRNEhLxa1R2Ua6yYUER13p8qD6Sqxn
 Cvz+mZd0VSBjkxyK5imC3c5mm46Mc7I4eGid4T8LOCI8HKxUGIlZiFTdAIaeTirDTJzw
 mS2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5FpTVBK7l/N1a+2NYb+cakwVtYx71kqh7yPdr+UWRp/k3tNIdZuQAcILGm3qEP+CBaqogFuo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxocpyCXxLuKtC4Wqt5ICEQU4grPNMRz1ELSBRquYPTWwjAswym
 ujGIjPOsp7eppuWkRtRUUmo4tiprq8Wa6Xe+zRZWnvpftwtqqJWvT28kLI73I/I/w4yOqFlqOLA
 muenTp9yMd/XjJ1aP5OE8VWOfLnF6kY7OBVRx7Bb0
X-Gm-Gg: ASbGncvkVFbDjZKmx6nP6WT8ssEywEfzEmUpqid/1T1gmEkRd5Q6Wa62f/EzbL51MMg
 a+svSC0bF/34AyJCQBvf/k301C7BENYcOj01g3BSDQ/e49xUQVf0cnzS/Bu/VSHUOXojiMIHKAZ
 +Zb8Bopla2+jeFRK8rQ5r/vyNAhkJON+Xjf/g9bfPD09MQr2kUsqfvrMZAOhUE/7frBFprWnBgu
 8wuo0nWs6deYR8cAW2jU2DeV7oP96oMXrIXUszlbYxchxAnSic34/UXsG29+qnlfkbtzsUfeOi3
 m7wQq9nnnrQ0PRQBic2RTg==
X-Google-Smtp-Source: AGHT+IFeGKwYcckLABLoDuRwmbL2FHkAYRKu3xHvkzEUN1IJnKUZxlmUhaOEldPOHQwm1zmx9YWX1tsv6zNfJS+RYAU=
X-Received: by 2002:a05:6000:1887:b0:42b:3cd2:e9bc with SMTP id
 ffacd0b85a97d-42cc1d352d7mr16108251f8f.39.1764081725765; Tue, 25 Nov 2025
 06:42:05 -0800 (PST)
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
In-Reply-To: <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Nov 2025 15:41:52 +0100
X-Gm-Features: AWmQ_bmxXNLN_J61y5iHUicjavjvWZzYRwJvu9pIn74Mqof194vnRt_A4XvclTI
Message-ID: <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
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

On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> > Use page::page_align for GEM object memory allocation to ensure the
> > allocation is page aligned. This ensures that the allocation is page
> > aligned with the system in cases where 4096 is not the default.
> > For example on 16k or 64k aarch64 systems this allocation should be
> > aligned accordingly.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > ---
> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> > index 2760ba4f3450..a07e922e25ef 100644
> > --- a/drivers/gpu/drm/nova/gem.rs
> > +++ b/drivers/gpu/drm/nova/gem.rs
> > @@ -3,6 +3,10 @@
> >  use kernel::{
> >      drm,
> >      drm::{gem, gem::BaseObject},
> > +    page::{
> > +        page_align,
> > +        PAGE_SIZE, //
> > +    },
> >      prelude::*,
> >      sync::aref::ARef,
> >  };
> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl Pin=
Init<Self, Error> {
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<ge=
m::Object<Self>>> {
> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> > -
> > -        if size =3D=3D 0 || size > aligned_size {
> > +        // Check for 0 size or potential usize overflow before calling=
 page_align
> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>
> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
> I'll admit it looks better as a placeholder. :) But the actual alignment
> will eventually be provided elsewhere.

What about kernels with 16k pages?

> >              return Err(EINVAL);
> >          }
> >
> > +        let aligned_size =3D page_align(size);
>
> `page_align` won't panic on overflow, but it will still return an
> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> you return an error when an overflow occurs.

The Rust implementation of page_align() is implemented as (addr +
(PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
if the appropriate config options are enabled.

Alice
