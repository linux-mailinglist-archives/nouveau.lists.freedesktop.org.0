Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411ACBAE1E
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650310EB30;
	Sat, 13 Dec 2025 12:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV88R8Qk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23B610E00E;
 Sun,  3 Aug 2025 15:15:40 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b42309a87easo484345a12.1; 
 Sun, 03 Aug 2025 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754234140; x=1754838940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS2ZQ64JMN79CNmjPInj6p4XsgBG9AkgGO1OR+ihdmo=;
 b=eV88R8QkxA/5edfKP2vR+RBmMq48NFfx8Jn0avmFZ0G0UGvMqi+NN0pOr+4AMyHR2/
 I4c7UHeeuaJAAPfDikZLKWTr44lbeCp7T9QTET9UVqVh/21+gOAuC4/ulJs14qVCPBRD
 crK8Mrvz2fj+ZFldLrWMcNuN+Cl1e02ngraS/4VUJOono5vjmrbYHJNff1oYm/MNDHs4
 w9zeKojBcKtyQnDnFKVMTD06Wx4Dh92miomKh4t02a+zfTDJ3QFP03FvCmEZRAV1CPwQ
 SFJFqBH5gcl+HB9XiiHJkJ1BRFTyPebIP8woqBLk7t8ETwfaKRmd7b7XlU89xTc9n/C0
 87gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754234140; x=1754838940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wS2ZQ64JMN79CNmjPInj6p4XsgBG9AkgGO1OR+ihdmo=;
 b=K8XPxy4nL8utz7zHLgV7Ck2dMFkR1uIcPJ5zb9TYdAp2BcKBhAsgwdqVOfV5W4/ajz
 16TjGCPQc3UfJhVv4WcZl/+N4KjdGcyCOH2R/T0F4QgIk3xgLyjWQTClQxib0shHp8se
 2z9zgLOaXukkISsh2V7iqKLyCkpiUDwwwQi0qs8hsZvEdo9lYuEMLicDi3/k2gCvJoot
 SUjQrI7Me6t2IDkMDIMoxKqUPktYVsGYO4vOJYnipj/3xKbf2u5sm9vo7uZtrnQFIVgr
 Z6XuCAYPK+yHo1XroP1M7V3qnNxHSAXij3GLt3UBx6rAFhcikRibNFBkVdklvJ4xLg5C
 oL+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA5olcoDFfZnsOpcMvdr1W1V1DCwN3WYGemDPbUMSc7SCPdWn7Sk4ELqcGUNLmSDKSDh82YRqFRT5JFqKatRQ=@lists.freedesktop.org,
 AJvYcCWmVZlsSLA9YhPEXcTVfI1lYaFMB7bS7/HC6Ktgmcn3321ns9JEeiZDuPIUYY/oY5SV4FKxNVTMnA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSEr99mFFPY8O2vOBujkOvkgflrUbBIpZ0zBH4NN1VqRALBv5h
 x6ymSFLre8JL1u8DQ28zHjQPdBOIhkAqMsNI9YE5+JISoNOftGQnrStHD7rIo2GW5IN0dt0mJX/
 xruw1cSaG0GCc6EwC2neHqnM4lXNCpbFcHufu
X-Gm-Gg: ASbGncsvAlfsq1P+zf4Y+7113eeMsTOCo4guISjXL4wLT+FWmsOxlTPLPZlvUkqbCaB
 rNfKtA4PDznJXxe3VGjvp+xLLgHNTVgZ49k1bW4I9NNSNpBXavmR2y3LzSl5vgHlJWP6ckjnDdC
 ZWg2OyqwrGO4pXgn9SZ3/JKEZKNRrLmdDIWCiqCzP7JzcarMRZZ89PeCX+yD8+ncCurSWc8B3kg
 6Iez6iICQi955haElo=
X-Google-Smtp-Source: AGHT+IHqgBoMTYQAjZYRy/NgnlRibK1XTFSf+41lsaqpZtXit+NR5xBn313BlZqHreigej+f3dIGY4kEoQHDi4FMj4o=
X-Received: by 2002:a05:6a20:9f86:b0:231:242:2596 with SMTP id
 adf61e73a8af0-23df907ad0fmr4579577637.5.1754234140028; Sun, 03 Aug 2025
 08:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
 <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
 <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
In-Reply-To: <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 3 Aug 2025 17:15:28 +0200
X-Gm-Features: Ac12FXxirE0lWx5ricQYZYpLZRTFS8QojNMzDEVSWYmJtosPsvKX9UIzXFb0rZY
Message-ID: <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Sun, Aug 3, 2025 at 3:13=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> We got some interesting feedback on the ACP already. I have been pointed
> to `checked_ilog2` as an equivalent of `last_set_bit`, and it *does*
> indeed work well as a replacement - with the caveat that the name is
> not very natural to me (or anyone familiar with the C interface). Is
> this something we can live with? If we decide to go with the existing
> standard library method, how can we make sure that folks looking for an
> equivalent of `fls` find `checked_ilog2`?

One option is using the `doc(alias =3D ...)` attribute, which makes it
appear in the search in the rendered docs, and would show easily in
greps too.

Another option is simply wrapping it in an `inline(always)`, I guess,
but I think we can just use the upstream ones, unless we want slightly
different semantics.

Cheers,
Miguel
