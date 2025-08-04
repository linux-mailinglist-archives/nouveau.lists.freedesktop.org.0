Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D453CBAEC4
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039C10EC32;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3s9bARV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB7210E0C5
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 14:16:38 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-75f7fc34691so259616b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Aug 2025 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754316997; x=1754921797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgDAHWFhVwGpRNKhb0AEdmDTrFYe+pHDBd5Ka/1/dW4=;
 b=k3s9bARVFAC0mdHg9CpsKzWF/7hwK70QB61AKXmdyp6GojrI/33GHro6O4/ImA/6IN
 NWfzwiMPvxmYESkth4jeisNdmIKAW/j/9s/fJ71NN50RTGvIowbRyXcqb63fb6uDipgd
 6ofh5/y2YC0JtZ2a2YJzuddPN9o3RcYwnyGFpSRooJu6AmObRbQYDAo7gUv1jDUFbZ5T
 +I/iSW7fAABu6p+RpRMXK0hAaNLtMORVsheWMCI36KsnyqSDF5M0Lvp2BomVw+zZw59u
 Q9lH1UeOIkycHOA29HOw0GdlpAtzTWtDGQBiW0hc8SEI29z9ojQF8b6lKoqioJeasGw3
 Af9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754316997; x=1754921797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgDAHWFhVwGpRNKhb0AEdmDTrFYe+pHDBd5Ka/1/dW4=;
 b=hKfaXuGmniTDwpSBuNCBWPP8M6yt7lRaWTb5+QqFAAiheEs8Wd1LKVthei9DIbiBbz
 VIqcJnOPQ3DJVm8R5dnvY2f39K8wy665DQnZxl1EYvcqI/UragBicXi4tSf2DOKkdtUc
 QiyLa+Qh6iGvaVDXlpc4NGXcqT9hR1mcCNZwCTTQYgG6mGCTBnziTNaP3dmJHAcyHbFU
 fojAD5Ey2BPQRx/9jnAoF7Y16gQueUKovs0ythHyny95t5AV+o7m1g79papcSebLyzNJ
 bgREK2i6qmrWTX8Pg35p51tO94kfeGOF+bWlDRgzw5YvqYc67efyrsur01+k/x7tJa+e
 XM1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3RQ0Nl80Cp5bTjkcn1LsVpTTe63ecu6VUJrhfDkzC/zYhvAad36F77dik5rhfZuhyU3dx8jDK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSRP5y4ml77kHo5j/4NXC8jS1L4KRESaJpSaNuDJ7xWYAhO0va
 4MYa/QcCEAN0hnx0F5RDNeXM5FK8/0a7rRsgAOtNbDL/lhBK+7K/RkS9EG3IGXkKN+P3QcY+yk0
 tenkBG/bRazpDA4AT5FFHI22EDhKQaF4=
X-Gm-Gg: ASbGnct/76CNOL0g4CrHfMd7DJOG4mr4Ci5Y3iyj1nUtFOlEJWH+PzZ3mXj8nTx6PAR
 M0JOvYu3TfJ7h6QeQvmk3laHFSBRgnTf/e3CY6SPdY5z2YBbvoq6RqdsoBLW+1uSQEBit1MoXug
 Lb6aE8NtCFm259Lep4hZauwn4WSNoRY9pHrvqbGwlMg9fKz7GtBHpGJFqCAdOOk0CvVpbDaDhxR
 DgYX8X4l46JbkaLSmc=
X-Google-Smtp-Source: AGHT+IHHggR0XTFbQEEybwLhQWYFEh3VycMYEY6HgdFW8J7vPcer8wJi9FGlCMFZ72vcVudiPgvVRU7PL/+X8CjpuXU=
X-Received: by 2002:a05:6a20:c6c1:b0:240:17b3:3851 with SMTP id
 adf61e73a8af0-24017b33c2dmr1069613637.1.1754316997374; Mon, 04 Aug 2025
 07:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
In-Reply-To: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Aug 2025 16:16:25 +0200
X-Gm-Features: Ac12FXzU7NmSVNVwYMFLEOWr49mfh3wxZZCCON1MnCd2t8fHQm-Ufjf7MXkUMZ0
Message-ID: <CANiq72mEDhT_OvSo1b=z4Z4VhND8+DFzeGBY_NNfXhq9jy5GhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
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

On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> - The `last_set_bit` function is dropped, with the recommendation to use
>   the standard library's `checked_ilog2` which does essentially the same
>   thing.

Yeah, let's see what people think about this one on the kernel side.

I don't mind either way, i.e. to have a few wrappers with slightly
different semantics if that is more common/understandable.

> The upstream `Alignment` is more constrained than the `PowerOfTwo` of
> the last revision: it uses `usize` internally instead of a generic
> value, and does not provide `align_down` or `align_up` methods.

`PowerOfTwo` seemed fine to me as well (or even implementing one in
terms of the other).

> These two shortcomings come together very nicely to gift us with a nice
> headache: we need to align values potentially larger than `usize`, thus
> need to make `align_down` and `align_up` generic. The generic parameter
> needs to be constrained on the operations used to perform the alignment
> (e.g. `BitAnd`, `Not`, etc) and there is one essential operation for
> which no trait exists in the standard library: `checked_add`. Thus the
> first patch of this series introduces a trait for it in the `num` module
> and implements it for all integer types. I suspect we will need
> something alongside these lines for other purposes anyway, and probably
> other traits too.

This part could be avoided implementing them the other way around,
right? i.e. as an extension trait on the other side.

It may also be also a bit easier to understand on the call site, too,
since value would be first.

> This generic nature also restricts these methods to being non-const,
> unfortunately. I have tried to implement them as macros instead, but
> quickly hit a wall due to the inability to convert `Alignment`'s `usize`
> into the type of the value to align.

I guess we could also just have one per type like for other ones to
have them `const`, like we do for other similar things like
`bit`/`genmask`.

Cheers,
Miguel
