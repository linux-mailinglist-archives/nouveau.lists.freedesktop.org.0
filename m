Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFFCBACBE
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529910EB71;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky+Nl0bK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7D10E4FA
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 12:18:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32d89e962cdso179377a91.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Sep 2025 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757333939; x=1757938739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnVwoVyn//Z2vM4s+si2Kxwai71xQMgGvo/eM3BxEEQ=;
 b=ky+Nl0bKHvll2K1WRUk5WVJJclXEv+oFxApnKWeLKduOWZnSCPdW/o2u9SpwyIC0jm
 ZYnOyGdwzBlHUcrEVqLg59NsTSK/RNT3T8CvrXHfSfGiJ/9tR9EvOWALv2teAsa25pBQ
 bKlnU7RwOMMgYW6ahoHv/lW97UtXZ5HAZeknSrtmp5lVLV7LGureBE30we8rRWr0rgVb
 yML6dAaS2JSNv2iEpYvnAvf5OF+ktASdt7cD8EM7C2h4OcrJNSGVIVKIZrbQkVWr97LV
 2MwLhGbtVSBvZhyd4vkdyBBCUYgAXYpt19GStwp1Yh6RC921WQA62UnSh3p/ICrNs11N
 0g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333939; x=1757938739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnVwoVyn//Z2vM4s+si2Kxwai71xQMgGvo/eM3BxEEQ=;
 b=JCpOsgCv7sLfLE2GiEM6yja839ftuy8RorgCL74anGWaDyYxkDhogcuMtfn3K43ckV
 26qFnYZQgOpwaXv9++hp9z11Z1qp0CuyCau3jSv9x/RjU2wRfYudcKAETJszI4VcKI1f
 UwGO7UtDiXEjphQSaiERYEVYgae4BpRzCJbHAxdE1B29Vi4ttLU8htD879usGvPtmAdM
 VdGxGWTilJgVs8RQz01zQvO1qrErQyaAmJ1IKPSorgMfkHdM1lz/aj6w7pEg6vrSct44
 oBJGsLfOF/tlLraDKEyddAfk1seMaghPfxTvpA+TLg8HIl2Zq20hPwdltBvFXZA7AAH9
 effg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVDNktjKsLWXo14xQ/vpJt7AgDpmPOwed3sfPTPVM5KG1X7I3+3HdCYxjvodzQCJgvkPdjLJ/n@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz33khaW0HQO4Aj67azHOHxxtsazmADccBQQVo28Op5lI2aKnbG
 n+CCs2mH2cgBWEMePB7Gu/Xej0Fity43h2OOC2djPgw/UFG2Mie+eWjArthD4DWi69P5pH2F9DD
 Ao6jmil7mWhBIKWM3ZOW7A0N08zatugo=
X-Gm-Gg: ASbGncsfOUDaEHLVG19VDBALgWi+9lEpy5UhfYDF36ouEKrAHX8+6CBe5TevEKZdpw/
 IvWUT6RMqepyIFcAsZF4F3yNgVFqbP4Usr2zDoOx/mB+puZ98Vhr7GhEPxK3Py1uqLjjbBOlmT8
 6KXB9iudhQUGJGG1g1E9gsroYCB+EJXuzlP7bwn/80kLbUHfJwfBUIOflcTtKmKVeD0DDpFcp6x
 xRpHfTtwYe62XcEWoqcUx+4UTlALlQvfpEoBZeSAjbKNWU1orA4nSIJphUp5qCtJ74YZjzG4xBr
 kxSu42dW1zeBaVOnTh7KYxpRxKg2uvZHAVJD
X-Google-Smtp-Source: AGHT+IExp7vrnfrB+oYdUfZxpaoGpWB4pYjPADczIeby99Fh1CAe5jhOpEJKx/4M3VoqQi9Cy2FogH2NYNCkfA8iWfc=
X-Received: by 2002:a17:90b:1e53:b0:32b:7082:b4 with SMTP id
 98e67ed59e1d1-32d43eff842mr6206525a91.1.1757333939205; Mon, 08 Sep 2025
 05:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
 <20250821-num-v4-1-1f3a425d7244@nvidia.com>
In-Reply-To: <20250821-num-v4-1-1f3a425d7244@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 14:18:46 +0200
X-Gm-Features: AS18NWA_7SYOMxlej0IqsywHZCPkpSHFIWWWt1sNnYld0p5CsJB3tagME3ZntpI
Message-ID: <CANiq72=wsLQtOmXuqAnLJbppq7BgdU=XoZ7hT86LkwLYEWp3nQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
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

On Thu, Aug 21, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +/// TODO: Temporary substitute for the [`Alignment`] nightly type from t=
he standard library, and to
> +/// be eventually replaced by it.

Should this be a comment, i.e. `//`, rather than part of the docs? (It
is fine intermixing if needed, or putting them at the end of the docs
too).

> +    /// Validates that `align` is a power of two at runtime, and returns=
 an
> +    /// [`Alignment`] of the same value.
> +    ///
> +    /// [`None`] is returned if `align` is not a power of two.

"Returns [`None`] if ..." is probably simpler.

(Sending these two nits since you will send a new version with the
const generic.)

Thanks!

Cheers,
Miguel
