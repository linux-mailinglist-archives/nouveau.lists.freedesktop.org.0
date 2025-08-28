Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857B8B394CF
	for <lists+nouveau@lfdr.de>; Thu, 28 Aug 2025 09:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8193810E16A;
	Thu, 28 Aug 2025 07:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hnbCebaW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F5A10E16A
 for <nouveau@lists.freedesktop.org>; Thu, 28 Aug 2025 07:14:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E935601FC;
 Thu, 28 Aug 2025 07:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC691C4CEEB;
 Thu, 28 Aug 2025 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756365259;
 bh=y2E6jAgZ1n8UgRxjbTT0G+yEp9u8bfmkdgducgSp1d0=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=hnbCebaW+/ZLccWHgtmbMBfUty5cPnUOU61XOUviSlYcgKcJWP2w5mPHSKuR8506E
 L7/GFGB7h1F5DvmwfHGHiGnMWwDvjXQ//Skzo75bYoAT+I7TFxP5y/M/p9P6pK4una
 PZf86pEZZZIbrkZB5V32KUrREe4/8VLl6MisvX7/CYjkbJjTfyOBR3glAYCuChBSsn
 N6fbUSv9iz+Z+FVi/ahE+E5o7L2wfZMq1VGByHcKCzQ2LvtK07YsjucUtj7/wAAJSw
 /+qzg+v4+1FL0QtPe/SF3UexJjGjcdAi3bysML6W7q3q2n8bp1eZeVAEaFIWaGlnqv
 Pl+ItArZnHVDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 09:14:14 +0200
Message-Id: <DCDVIR91LFHQ.1C87G5A0OBJ39@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
 <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com>
In-Reply-To: <CAH5fLgjyd7zNqLFT4T0_=tzcPFyw9xwZX+QTA8ShBxZ_Fa6o6Q@mail.gmail.com>
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

On Thu Aug 28, 2025 at 8:39 AM CEST, Alice Ryhl wrote:
> On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
>> +    (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
>> +        $v.push(::proc_macro::TokenTree::Punct(
>> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::=
Joint)
>> +        ));
>> +        $v.push(::proc_macro::TokenTree::Punct(
>> +                ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::=
Alone)
>> +        ));
>> +        quote_spanned!(@proc $v $span $($tt)*);
>
> Not a blocker, but if the way to implement this one is to push =3D
> twice, then I think the pattern should just be a single =3D and then you
> push a =3D once. The pattern can match twice to handle =3D=3D.

You can't do that, since the first one needs the `Joint` spacing and the
second one the `Alone` one. `=3D=3D` also is a single token in macro input,
so matching only on `=3D` doesn't work.

---
Cheers,
Benno
