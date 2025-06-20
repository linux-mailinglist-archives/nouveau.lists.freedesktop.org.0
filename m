Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110ECBAC9A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BCF10EB6A;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7AKNFdf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC1610EB59
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:35:27 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b31c9132688so271236a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750426527; x=1751031327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciykJwNPy2VNieSQKGV5yGfXBWXTz3pnWQQit/GvIGg=;
 b=h7AKNFdfl0MkA8RH1O8Oj1js5m+pVDMh91DL6N9LCiv60I3A+ywMHrNiPMiVv/7PZx
 UaarO+jHKm5sjW+0IMs+Zwy9vQoTz671nU2mlp5p5dlZT8T3vXyFtcAMJ6zBrReGm82F
 3EYTEC2Pulls96+ffauzn+g4ZcOazjtvlqJIOXybDmwPuQf5+3DecWM7ybVB9mKsC1Ud
 Y5yCPW5BvGp5aqn4PbG9IJVQcws0js5dha2YahOxV6rfYda94P0k8366E2FMTZTluwAy
 ZfYfNCTLPusOuWFYEHSrvHMBb6SIYXg5W9jWISuR2fGPSXqjVexz8poz8TKlouvYN9gV
 m0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750426527; x=1751031327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciykJwNPy2VNieSQKGV5yGfXBWXTz3pnWQQit/GvIGg=;
 b=CVy4c1NNKlROJsZde2b6Q298wd5NhIjYIWxxzE9ueEFZKvAUoeYX6i4nYNm9O7mKgm
 xh2QsGZHcszrQpVLITtinU8W5nBCkVXxeFv1+cYTlme+05UImfno4bSCxjGkS2VMmJ2S
 Qj8wrxfDBwSDtxKxsv78XDUEu6K62nECSnm9yk16JbNngY6bK0QDLM8MOBp4J2OZLx1L
 T7vrN7Y4vDJ3aKWPQKtXWAxBJry69jvRc6o8b2mtblq0p8wuYA4pldLDprVkAW2kaxMs
 rvGmX5BitTHr0loJtU+YRVwcJ8nhSbOznxIkLWBHBAQsx11ShpxUNu4K1e9xEprLquUY
 Zw7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbpG0OzNgJeoKuGPQwhLFGVdwYMd5sv4jE8SsjiCkGzTNYNFT5GbdbH7FTPJpuTl9BoYbpT8HL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjTdf/G7VpmZgWn1BL9Byl63XiXjlw9TPtgLl49l2x3t6rDs8x
 tZm7ZDqh24PrezgtNd1YVry2DnCU5ZmVVqh3BECygeL5siH8yvuVHjp1fL/jnue2bG4DEfBKw5K
 5gvguSsWuqnR5E1cNJy2eu6eNOyEZURo=
X-Gm-Gg: ASbGncupNWx7gZdN/RvEOMtgsFHtSxtE6ohx8lgqmie/Saivo00534blaz4hkljeC01
 GqG3xi0IxygS24o5tqlA5Fg73yC5ISAAbD358Dsd2meStJEg1t6G1RT5r29r/h56UTpoGRSjFRo
 JdzmHuO81u8WYMpDS5M0eobv5EAJhDn0dnXYUhsmi2VNk=
X-Google-Smtp-Source: AGHT+IFPthesqIFSi/O171CaK3dBItc40f2bqdqoBwA2MAUv9vVgFRzwoXgjNy0n53Ha/Xt7WBxaFVSen5LG/UgilkQ=
X-Received: by 2002:a17:90b:3a43:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3159d8e2be9mr1716522a91.6.1750426527235; Fri, 20 Jun 2025
 06:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:35:14 +0200
X-Gm-Features: AX0GCFuVT1QLcBO2haDSwB53syExrcXNwY3AyOzQthEHRsH2T3KmjtBuf1buWgA
Message-ID: <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
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

On Fri, Jun 20, 2025 at 3:15=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
> that guarantees (at build-time or runtime) that a value is a power of
> two.
>
> Such a property is often useful to maintain. In the context of the
> kernel, powers of two are often used to align addresses or sizes up and
> down, or to create masks. These operations are provided by this type.

Before I forget: the other day in a call we discussed powers of two
and I mentioned that there is `Alignment` in the standard library:

    https://doc.rust-lang.org/std/ptr/struct.Alignment.html

    "A type storing a `usize` which is a power of two"

So it would be nice to ask upstream the following if they have plans
to stabilize it, and whether they have considered a generic
`PowerOfTwo<T>` type like this one, rather than one just for alignment
purposes (possibly with an alias or newtype for `Alignment` if
needed).

Similarly, if they stabilize the `Alignment` one (only) and we end up
only using our `PowerOfTwo<T>` for `usize` and those use cases, then
we should consider using the upstream one (and adding any/all methods
that we need).

So I will ask them the next time we meet. I have added
`ptr_alignment_type` to our list (in the "nice to have" section).

(Apologies if this was already discussed!)

Cheers,
Miguel
