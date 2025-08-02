Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F23CBAF7C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0F10EC9E;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO9Fw4kt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B1B10E0F6;
 Sat,  2 Aug 2025 14:18:23 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-31ec977d203so568756a91.0; 
 Sat, 02 Aug 2025 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754144303; x=1754749103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL+4avU1H8oGKZXlNOwDFTlYSKmu/Vf7eqNV14tYb/M=;
 b=WO9Fw4ktDO9DAXVzf91XiN+zt1kmzt92XXM+TH4QOxwrfzVcPDTlqnDaMa43mwIDZ+
 LXdk8i2gyb++/gIL3VCuYNycJfBVQFXVuvpmnGW6ioUE3SgSqtLs0kGl0z4ftfWQVe+a
 2/Jb9ecK2H8H8dr8/aq1DdB+vcKcSbdinoNHJ1eE6T8u9QB0N5+ohWOEDGK98L6RtoHU
 BcYjqa42qx5Cin07+E0YoZHUXDaZz2ypsP5syHsSiNRonT33IKhO9iRuCfAmEzA0xfeX
 b5bL2RoCIf4wd40Yt+Us+9BUAKaBTyNG/biPklFYZem+wrEPntAqzQGfaz2SkJV/JCew
 OhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754144303; x=1754749103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL+4avU1H8oGKZXlNOwDFTlYSKmu/Vf7eqNV14tYb/M=;
 b=WriEHlqNgiC9ZUNKu8UFqp7P9BK8kcLpuCILNVgXldM0SypZiwlDpgBQ1QqQaY7WKI
 HcBSawRCFPfTDbK7ocG2O4NTR3j7maOUZyNJAweI+IZWanPvE3LbC1mGbBd5zfMXulbf
 5zXxbl9bhWMub4h0bk+gGYJOUd+MwxOu6iQfY4ejkvTS2nlNH4jwnPRbVVacUt77+/Sx
 fQKQuxm0ve0PxGVMo9DR4yoskMs+mPsB5DCOdgPI683FZc8/jleZ1pJy2OOnbp/m/+pv
 jW9MrM6wR0cMsUQDm4uMt4BlK6ffo6iQqrpFovFkOw8mXgy5OsVnp9Of+bYmF10oHu/E
 jwQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9AfQl79R1Vv5akW4OdwXcu/NBF/Xi+E5H78rY/onhIFlLMeJFcX1uU36n8olo30L6B2p0gTWFcw==@lists.freedesktop.org,
 AJvYcCXPgTamA46e8rQgKhUs7+soSWzK4P7tTHO8NiNR+eL+qXXgvl6nLteRdK5bgV0Ib30rKRSuTfap8tWZQ+FL6AE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa5UnGJN+Kabb2GQlokNykXRyv8bKRF1TQzoO5U/W82LENYkg3
 qdPLUJ0cGJFttCWqBDS6WtF3miFGhH/ecpb6NC9XFPiLtdIwIOx+Ws352nTGVfRhVWSndw/7DQ0
 sDEZVW+PPatOGlXTy1MVGk/n21o8Wsuw=
X-Gm-Gg: ASbGnct8J9PEHkwVR+rXy0hCXxxUyNKriFBuYZon/uSNxFIRpVuk+qEikwSAttj20gw
 kBh6eLcnOXmxADIKtP2pjbVUYSoVzPm8T13HGlIzIwjkekCA1jAekMYqiwxheGMjU2rUrCPdwTk
 TQD/q9MRjC6ncFgRiirEmw1ZuRUUA9RUf//xPieYUIw1bBo12IeQusZXTEyYr9O8WZyZXxHF6TY
 A5wbn9K
X-Google-Smtp-Source: AGHT+IEYyK4FnrbzDvIfn4l13uARdRAi1BsUu+rKXOV0Jybw3LuyofhD64+Vp6yv6vQyxgpYLpFrKDkYAuq4rhRVUTw=
X-Received: by 2002:a17:90b:38cf:b0:31f:3f2d:25ad with SMTP id
 98e67ed59e1d1-321162b5699mr1806962a91.3.1754144303280; Sat, 02 Aug 2025
 07:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
In-Reply-To: <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 2 Aug 2025 16:18:11 +0200
X-Gm-Features: Ac12FXzP6tbJ3FK59a8caJxtumpeBsG760k67kwwrIw1GCiks-gr_mjRWnNBb2Q
Message-ID: <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
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

On Sat, Aug 2, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Belated thanks for the suggestion; I have finally opened an ACP for
> `last_set_bit` (and `first_set_bit` while we are at it):
> https://github.com/rust-lang/libs-team/issues/631
>
> I am still entangled with how to best leverage `Alignment` for our
> purposes, but think I am getting close to a v2 of this patchset.

Thanks for filling that one -- linked now from our usual lists :)

    https://github.com/Rust-for-Linux/linux/issues/514

Cheers,
Miguel
