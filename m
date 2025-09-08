Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A260CBAEFB
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F31210EC57;
	Sat, 13 Dec 2025 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQng9Q4o";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B455D10E531
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 14:21:39 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b47174b335bso450634a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 08 Sep 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757341299; x=1757946099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fX9DC1fZNQkRHn2ACjPhGN+9jbwsbcB0Idr+2XnvFo=;
 b=UQng9Q4o0gS3EZXRnDWcfYK9o1xv3TPrm+sdxwpl1aoBCGf4QebZcP0R7wel5pwn9e
 76wvVoUzqjUAG5LzF22BuvSuA0eMHbg922XaRAQAcz7qZt5wVk4sBKSeUXe42arw91Yi
 ViSXylURx3Ufy86ICVI1LY5jH38YW471pBwVhbLCu2M7Yq9zTjKrYfKQYptMFROEyvD4
 4ofMjYfwz+jS2O4NYZfd6P6SmTHDN+qXhco4u0WqLItFMavHTI5W61HygFXH5Rhud50A
 0uLSkgcbZ4Rfn8xwkX0U1JyzuQbj1/pxkgWK6a7He1Cf/zkyDSaJwNauQntI4xKnTLjT
 ii9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757341299; x=1757946099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fX9DC1fZNQkRHn2ACjPhGN+9jbwsbcB0Idr+2XnvFo=;
 b=uHFvWtC0HdLmmK/JcWPRYhImgnpGE0KN3a8moVwUFlR3HowuB0UNQwhV/8f5hujQNj
 U0PY+3luRv6jK2UkjwW112Wbbgt/f3zP+6m4D14Q++VXgAjll3Nbq84PLhseoCdK3qIn
 yUYBRzNzZn+btfXcfFfrL7qO37DGvogpCYLgRnyGpCahi6wMQRD4gesxZuYNFsR8tnbx
 8iCLQ8TQ1a7QNxl4+H4Pp8sxKonNnt5cmeZjcEJF9ba+3FRPJ11r/ZJwNUcmcAa1+G9w
 K+ZbWzHsRIHqRLL26AeC5EpgMbUdut9/naBcZncZySpFYmurqyjK3we7M3ZvmjBB5+nu
 wjTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDX6CHAPE2RzaOv6Ycx40gI3NByf9yBJdWTcuaBqI5SPefqr0/Xh5G4uvqpY1KByGu48vt95Ft@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6s6bkIBWeNdhbnnTNcE0NscPZMVwHi+IPOgPYxwleFWbof18M
 8eV0Nx8KaGDMjMIX1renH2xgxRKasqdjhOpJwxNT0mMEOrvN8sqy/jgdHo/mu2VLuQozYeJdltW
 ww8Kx1cA4kKU5V7HJTE16sZSTXf3Lcao=
X-Gm-Gg: ASbGncv5ZOAQpIG3JtakNTnOIAawEU7nNXl0k0EBxxrFOAxTtA3pfLvuJmCYGwx04Qv
 YeGTQ4jbduU8HmVq0eEpvqnxVrF9JSb5uKzapuHcLaPnh1YpXiwmOJdWu/Wg+4wi+OPlTeCVRp7
 CUUw99HexAJahekhGcbny44/fbZj5+uQIS6dmfoJtHmPS3FHLHWFZvOoGvJ/g6I5GRx1V2SZQ2a
 4yEgyVCn9nketnTH9VylZoqp5U9bD15MLgs1eITFXyIRtKYy6oPaCHGtk8jgHs/gCpf6J6+9YRH
 HrFJwgSDZVtaXZ0g9Ht41Q+Ki8MydYi3ToRV
X-Google-Smtp-Source: AGHT+IGFDNWEzR+hV5I6QdUVy03a1/7tXTmOQLf+GpNdlfKZ504RA/zXUJf2avq4t3EcVfEw/QWRxQ/DDabXjK9CYqI=
X-Received: by 2002:a17:90b:1e53:b0:32b:7082:b4 with SMTP id
 98e67ed59e1d1-32d43eff842mr6514245a91.1.1757341299091; Mon, 08 Sep 2025
 07:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 16:21:26 +0200
X-Gm-Features: AS18NWAfR5raXlS_a2FxsPSSP3cBVpNTWSI1d9yZGzogiu6fnijmKILcUd_FVZM
Message-ID: <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
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
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +        if ALIGN.is_power_of_two() {
> +            // INVARIANT: `align` is a power of two.
> +            // SAFETY: `align` is a power of two, and thus non-zero.
> +            Self(unsafe { NonZero::new_unchecked(ALIGN) })
> +        } else {
> +            build_error!("Provided alignment is not a power of two.");
> +        }

Would `build_assert!` at the top work instead?

> +    /// Returns this alignment as a `usize`.

Intra-doc link.

> +            // SAFETY: per the invariants, `self.0` is always a power of=
 two so this block will

"Per".

I can pick this, with or without the user -- or do you need this in
Nova this cycle?

Thanks!

Cheers,
Miguel
