Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45812CBACB8
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C034910EB6D;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeTpmcQz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449310E004
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 23:26:04 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b6a42754723so25861a12.3
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760657164; x=1761261964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
 b=LeTpmcQzoGIYyrqy1pwBs+eLsy3sP2nXueaz5noJCx0yvBk3hRsZPBKF657h/mzor/
 o1DPjNRxIaVSVfEQZubL8DWvCZZbASTNFOaaqz/VNwniUnV53F5iOVChA7GGbQcp4VDS
 cosCi3b59YmxwHHV5ORhBmg77d8Ar/iFReyjGt3WGR/6r//ibers5eJh+OeLHSCmVgkE
 l+s4iKc3c9Tbp8hbkOsKM8tbBUMLEDtq3VT61YkNu05P2ImMiZQAEllrWl1rk3MHu/PC
 Xv3rhp0NP15FbpQFBu7laDnxAlEJW+aX2pqMkx6280V/jwtk8k7Fkfv7L6zwsh6y0SLR
 YaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760657164; x=1761261964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
 b=nFV4I2qhTMDZxLn1eD3sb/QKPWnmi+vBOJ2Tzszfgg5xdKHKXPE9nj9TQPJbFJQXR0
 7NJ5NkSSwfQ2q6pJsLUjOV77x3/ftApSHpE1P+s0GGuZJOh/J1v/FFFkiwbOO1u5D6Wq
 ishoztRG0vzpz8J0nW036sYIpi5KJ1rS63iq5x5z4/9gpd67asXPWD4Vko6UJZe5W+I7
 yH1vAPJ67YBopi66Hnm7siijbMRgdy/7qhQEolTCiaprSqSNVVKV/grTXDfe4zd8qp9d
 PkVbo0c+Vi3kRjmYpf38n3woWg70KPcvAy8CkaeWuJTJoCLaaAcU+oPG5gCrY3FUEZF0
 yuFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Xxdc959TZ8doCEYnnmSD7wkwUVnTkJO/h0uzdL7AIZGftNHr44nj3w9hHRPvc7Xom6KJJIBk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyetFjaYgdvrQkwPQZgY6/A2+H6x/ZQdNBqBavjOMTL5zSzY1cV
 K9rm+9d86h9ml2q2tAuQkrHSqQ9llLDDPOrUJJxEXtRlGsmrCfNQY8YjlMspAmtStC1BhFMj1ky
 EynNx9ISdMOkvN27z1LKxh4DavmsD4yk=
X-Gm-Gg: ASbGnctBV/KElx9dQrCSHJBCU9Nwx+YUlLYhZs0o9XopEgyOg0G036ZUi9WAkEO2bPA
 SVf/lDcxUzCXkWwZY6/tVWQ7oMcs41YpPgt/BdZfmrgflcTmi0trYW7P2NrSE0V//i/caoePqsm
 N571D/cYWKmclAXFOs2fcrojALQSkls4EDdeiAuUGmgxqxMbd1ykC1qXhyG2KWQbq+0C7uNshPX
 vfPgtTyr/wMksyXooLSxjRmt6kdX2y6ML8glICoe1Kv5NIbyOpyeyuxDSKxayc7ak7gMkS/fV2m
 FpkAtWmoqtwEYdlbr2OKFm4Pfrb0V1giMepBhiDgrolAWibIfT64UQBGsUeTtYuUtaQ6t1Ohwa9
 CqYbqKwyEAmHlkA==
X-Google-Smtp-Source: AGHT+IHnRUogCTLR4j2SRK3tnx9yJeIhgejmiTK6A9npVoSOmDy3a5IB+8s4WFVWl7NclfK6Oapzgp8ltJtmKXRKyH0=
X-Received: by 2002:a17:902:d484:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-290cba419fdmr9896625ad.7.1760657163954; Thu, 16 Oct 2025
 16:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
In-Reply-To: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 01:25:51 +0200
X-Gm-Features: AS18NWAntWCgqHJ-0gybXjQxgpqfISwElGAlnBfAxtiow_eCYUtIQUGW5snmefQ
Message-ID: <CANiq72=bXR4oodrPS8_Dk59cNQa54EOzAPxp3r6e7BAKoZy2Wg@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Fri, Oct 17, 2025 at 1:11=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Since nova-core depends on CONFIG_64BIT, I think we want a helper functio=
n that
> converts usize to u64 infallibly.
>
> This helper function can simply generate a compile time error, when
> !CONFIG_64BIT, etc.
>
> We can do this locally in nova-core, but it could also find it's place in=
 the
> generic infrastructure. nova-core clearly won't be the last driver runnin=
g into
> this inconvinience.

Indeed.

Cheers,
Miguel
