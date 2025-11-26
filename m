Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D6C8A0E9
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 14:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4FD10E60E;
	Wed, 26 Nov 2025 13:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ih0oJEJT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0EB10E60F
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 13:36:12 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4779981523fso64906605e9.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764164171; x=1764768971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Q8o5oQFKTnZYDsBsx/PuxZXI29/RuyX5KMdnVdIm3yc=;
 b=Ih0oJEJTilr9nB6/yQn/Ge3JBE/E6jJxvftCMIjUC4D+olcbDNAQR6wPywIAFbEipy
 e6ys5u9aqmw2E87jW8YVfsya1akd/NkGoS5aIZ66d2z2UMCn8srj4x4fEYyYVED9N1RG
 PHoRsbVFOpuoIk+Uno8H6RhCAQvLTT6MwBn5dTpEupwiyB7Ksf3qjy6CGPfHOpGNC0p8
 xHGv19083kc9Vh3jcFhTPzIusWwZrqg267S6ciUF6snoqwBFPTn+Eg1Niuy61I2Z9mXE
 BhYKZr3Shf+ePeVxUn2K/V/TmUwO19IzIIxMJhlGCHw+KRNpAQUTDYAe0EwWDST8ExNK
 spHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764164171; x=1764768971;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q8o5oQFKTnZYDsBsx/PuxZXI29/RuyX5KMdnVdIm3yc=;
 b=qt0kxGDpeVdDWXSVh4cO4L4X8CMOcFmWpkP19643BcTmzD+StZPLRsHZfFbAY601/b
 oigYswGigkt63gw60qv7jq8hwGQ81AGEahJqQCuwDPKCVFrq3UGyVbnaMe2KS8ysxUSk
 9V5i1CnBFiAVPYCBP+tnyQrUT5hoHOj+5cdGuZzE1V8m2PWJ2Avhi4ErNXXbs44P+/5O
 SUddr6tNJOVGego8w1v2ofVEmdY6SodZNrJaycjylyPx/ovQBCCpcHUBjuZQ5mDmU1iR
 YpCnSIDIJmvhqOG7qkOkOjw4mJMCWaaOXl4wiz6/J4b4FujkbyIpkGVqbqtlw7Iocwo8
 jrqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUibZ2CXQWmE0FCPrzYwqLh8Rj1PI8ZDzfFq3syC4E7R6f6H04EYTo3nfIF0SkRY03tKVEq+pyg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyBnpurOgg8tUkBsgpsib56iKJJiZwjvuP4MopoFKg9BJDob8k
 ft4ceBUWO6nRgnX4rRSBDyj/dAA8W71j40Ym34ZGy0933UgLFkiqnPdNmFVOeNN49NCq0ZX/U8Y
 mtTCnjH4SWpU+S6m57w==
X-Google-Smtp-Source: AGHT+IHen7o1Czj6RjgQRXRqkTbhtMnJFEarMgnQPY2qznUW0hQvxakckzeXCkXRtdO8m2SgjikqhLj8GFnp7XM=
X-Received: from wmqh18.prod.google.com ([2002:a05:600c:3512:b0:475:dfb5:f4be])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350e:b0:477:ae31:1311 with SMTP id
 5b1f17b1804b1-477c10e2a64mr169973505e9.13.1764164171266; 
 Wed, 26 Nov 2025 05:36:11 -0800 (PST)
Date: Wed, 26 Nov 2025 13:36:10 +0000
In-Reply-To: <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com>
 <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
Message-ID: <aScCSnRIsRjLrccU@google.com>
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

On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> >> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@=
nvidia.com> wrote:
> >> >>
> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourb=
ot@nvidia.com> wrote:
> >> >> >>
> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> >> >              return Err(EINVAL);
> >> >> >> >          }
> >> >> >> >
> >> >> >> > +        let aligned_size =3D page_align(size);
> >> >> >>
> >> >> >> `page_align` won't panic on overflow, but it will still return a=
n
> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which =
let's
> >> >> >> you return an error when an overflow occurs.
> >> >> >
> >> >> > The Rust implementation of page_align() is implemented as (addr +
> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on over=
flow
> >> >> > if the appropriate config options are enabled.
> >> >>
> >> >> That's right, I skimmed its code too fast. ^_^; All the more reason=
 to
> >> >> use `Alignment`.
> >> >
> >> > Alignment stores values that are powers of two, not multiples of PAG=
E_SIZE.
> >>=20
> >> Isn't PAGE_SIZE always a power of two though?
> >
> > Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
> > It sounds like you have something different in mind than what I thought=
.
>=20
> I thought we could just do something like this:
>=20
>     use kernel::ptr::{Alignable, Alignment};
>=20
>     let aligned_size =3D size
>         .align_up(Alignment::new::<PAGE_SIZE>())
>         .ok_or(EOVERFLOW)?;
>=20
> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a const
> in `page.rs` for convenience, as it might be used often)

If you're trying to round up a number to the next multiple of PAGE_SIZE,
then you should use page_align() because that's exactly what the
function does.

If you think there is something wrong with the design of page_align(),
change it instead of reimplemtning it.

Alice
