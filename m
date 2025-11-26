Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532AC8AF26
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 17:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249FC10E671;
	Wed, 26 Nov 2025 16:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cLLTgcPM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D1F10E679
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 16:24:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42b566859ecso8763f8f.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 08:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764174254; x=1764779054;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZ+MnFmvxcbGj8gDvckdvmeN/yN5otOzT9lT2F+v6UQ=;
 b=cLLTgcPMytz32hzgjrvvuIbu5nYVvGGkz0mEMCzqk/uP0FZzgomU7UvFx08aoo5xtv
 Uj9hnSd38PNNIhKp3ZbHYEpf26uvDv/vrut5Ow+tJfGh7uVR3MYKR0i7Z1K2rsLf/nBz
 FE7sZChkHZbOGK+1g7TJzPB+vZGQ/ejWlC+fqXFaRipb01enQ1p4shuDeWfmvCMyrTbZ
 yixoxpovoW8wGQOxxNIqmQ5BISHLFu2HinWnhI/tO4G8Z7hQ5FBeZEDwFVYXJA5c+taE
 ncvmHqmR2Pqfs486stYHB9q5r5lbhDXHIoZIxBymy4xuMuksW/8adVpABEmF1KVFrt9Z
 ud+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764174254; x=1764779054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JZ+MnFmvxcbGj8gDvckdvmeN/yN5otOzT9lT2F+v6UQ=;
 b=i1rSnrs5dY3QpQ/AkVb4Zm5SSTqGmBYP0HbTPITf37XfLKoZmLPYwq8SbrC+ApHnX3
 oWBPSu78d8ZX4DjrPXpC1VAx5WwwTbutBqB4jZaFWNZIcTx1M/Y86Xu7rdfz6JChdBFF
 tZuCN+QKVrNEbSaE96R+rR+7szhQSzaNzKO6P9BNZOhbQuCpMATnZeobb/JUsiqgPSGn
 FRZz4cWr8lX8a9jsjQ+gwnT2EMZ98Nt78+Cjh4wV0gTu/Jllj62VaCkKKj4ot9+uKeZU
 6QxZd90WRC2bNZl0qcFoN7TaixUbHNZoV4zyay9Nk1DDNt+e73ZHysDA41BWGa6DeMK5
 x4ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Ji8MGGu7BH39yKIauwaDkC+WRUTj84Zc6KPiRJxkszk8q5aLfT8GKe8Q6/7OJEOiV0ip7A8q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGE2zQI1ip7HBcAGZqqzmslOb3AeeRDhrPx8OGmMYh+GdN0TCE
 CPx8KJd140xMIZhhRwbgFqivPLSelXg3GQaJ6onw4IZGITuxzDUS8vhTO+xfAI2sLRVmmO9/pFr
 IjfCCVSrz7oDGsGQ7Lbsej+eoFP4TCEW+85CGugvu
X-Gm-Gg: ASbGncs3tmEQSMHiu2wgp1HDso95KTeEQeVQlsibz1Gi7ZTo8Pdtg3DojQ/R3LOgDie
 Jxsfdz2f5wdrByRupa2QNJsgmZRMA4QR23Kfje9de1hfXUFy+bdetrekGPLbwo8Ez1iAmdtKH7d
 nlytz1m1nO3954fehGVDN1EUjEJMQ6b5ncg/kHk6gs8jKsJG+c0v7E+79++xYuvxMhgl3zkWSWJ
 25kNzOs06YHQhIIRZjI55zwf0xPfdztCJ1L2JdrJQ52uT8FaKikJ+XonMiXC3qwzFGTl/wM8GX1
 hsolY9fZoiI4rAOHMgSkP04aP/A5b6EbD0X3
X-Google-Smtp-Source: AGHT+IH4RMT7QSLZ+vsE/OssFv9i0v+eE5reG4sjgmK1aZIhLLyMlxIjDy3M64DhaIpcihnqFxQMf+vBCBuh4vh6OYs=
X-Received: by 2002:a5d:5f54:0:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42e0f1fbd71mr8118952f8f.12.1764174253750; Wed, 26 Nov 2025
 08:24:13 -0800 (PST)
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com>
 <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com> <aScCSnRIsRjLrccU@google.com>
 <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
In-Reply-To: <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Nov 2025 17:24:00 +0100
X-Gm-Features: AWmQ_bmXv_KvskYx-qDLeZZWteMmdhGMSozdROh2oDdxwE6bbsKdeE4_XoFfqJQ
Message-ID: <CAH5fLgh+KZ4Fu23S9=O0e00v+iHc2t5oOhNvkEBBjAN6UtCYQA@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 3:00=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Wed Nov 26, 2025 at 10:36 PM JST, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
> >> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> >> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> >> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> >> >> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourb=
ot@nvidia.com> wrote:
> >> >> >>
> >> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> >> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <aco=
urbot@nvidia.com> wrote:
> >> >> >> >>
> >> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> >> >> >              return Err(EINVAL);
> >> >> >> >> >          }
> >> >> >> >> >
> >> >> >> >> > +        let aligned_size =3D page_align(size);
> >> >> >> >>
> >> >> >> >> `page_align` won't panic on overflow, but it will still retur=
n an
> >> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, whi=
ch let's
> >> >> >> >> you return an error when an overflow occurs.
> >> >> >> >
> >> >> >> > The Rust implementation of page_align() is implemented as (add=
r +
> >> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on o=
verflow
> >> >> >> > if the appropriate config options are enabled.
> >> >> >>
> >> >> >> That's right, I skimmed its code too fast. ^_^; All the more rea=
son to
> >> >> >> use `Alignment`.
> >> >> >
> >> >> > Alignment stores values that are powers of two, not multiples of =
PAGE_SIZE.
> >> >>
> >> >> Isn't PAGE_SIZE always a power of two though?
> >> >
> >> > Yes it is. Maybe you can elaborate on how you wanted to use Alignmen=
t?
> >> > It sounds like you have something different in mind than what I thou=
ght.
> >>
> >> I thought we could just do something like this:
> >>
> >>     use kernel::ptr::{Alignable, Alignment};
> >>
> >>     let aligned_size =3D size
> >>         .align_up(Alignment::new::<PAGE_SIZE>())
> >>         .ok_or(EOVERFLOW)?;
> >>
> >> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a cons=
t
> >> in `page.rs` for convenience, as it might be used often)
> >
> > If you're trying to round up a number to the next multiple of PAGE_SIZE=
,
> > then you should use page_align() because that's exactly what the
> > function does.
> >
> > If you think there is something wrong with the design of page_align(),
> > change it instead of reimplemtning it.
>
> In that case I would suggest that `page_align` returns an `Option`
> instead of potentially panicking. Does that sound reasonable? I cannot
> find any user of it in the Rust code for now.

That sounds reasonable enough to me.

Alice
