Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2ACBACEF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5522E10EBB5;
	Sat, 13 Dec 2025 12:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCjY8R+t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E894310E303
 for <nouveau@lists.freedesktop.org>; Sun, 26 Oct 2025 16:11:15 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-28d18e933a9so5136325ad.3
 for <nouveau@lists.freedesktop.org>; Sun, 26 Oct 2025 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761495075; x=1762099875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
 b=lCjY8R+tE1vtQQ2xzH6BMxRC10J1SeS4wXL1PBGfTWffhiu5Mr37eO62YowBqF/Yqw
 DtYPhlXuhQYrnJeqMMWzp8+/HK9hB8ew4OHnuXmN3DXVyyqcIvbFClucEKwpePzvLgQu
 7oP2viLZge46XS+VzBMcqPTIHypqQKhZUshbzhuxblH9+bYrnMa0EsrsEGgUcNlRePZB
 lAgwygTJ1374hDNAJjWI7XB0Ijx6z775dCWs6oDcP/B4+/0lnIOMlPWqB2o14+TQgbNJ
 hmTXbLLDxH/Jr3J5nk6ano66xgZ7XCHaRDXhCxhacU2Rfqxv4hauTLl4YUj4vOll8iW2
 sl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761495075; x=1762099875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
 b=ZmMgo4o06xqzltuXzPacQ1ILAURHcZETxC/PdYpCX0XXAR7jY/TpPvlrzgc7Vm2EhO
 QOcihRBfR7hXjY64MCFMm3GCi3noDKOijAq5crXl/MxQBe9BfbvYl9tEXtufIn3KzFM2
 4OpbvEfT+hKWIkLnk9C48TBbYNqPicWSY61eQtZSB3qU+E30Fir1jIO2xWIKzh8sTPZI
 FaoX5fNmgafhr9wURgY73CaTYLt0Xnt3t+bLhc0x0JTdk8UtksRqRRX05TqjljVUFWXt
 lcr+SNuYfo4TcMaPOIHxG1dLg1IXwnbWYOrwOHQGNpXmUtGmQ6c5LD7bDfXYc9QcHZso
 a5/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9vhkNQ3j3eHuSZhbgynKwq6t5d6mgnWeF71ujuUyIjsKhC3l8+9Mz7KNe6qJQI6H9eqavXqEc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrkoZ6LHKA34Dmq+eVK+tLJpYGgLhKoAAGMt5EGh6jm14Yt5Tr
 L6JczC4bUPSTJ7WAeuSlFZe05RUlOreDHXM1uCEdxZvBD1op+F2RKWv8zsyoftM5Xy3lApyBMZ3
 I1Uulsb2mHBT6O6IcCEnOsofen8ocXRQ=
X-Gm-Gg: ASbGnctiZC1PrLGxsvAkccwrUUCZUMCnA9lxYb1S0REW2TFgXVTaNpNtO/t68SY+038
 DmBtReuQvgewBKlNz7NtpylzyOH5UsmNSSl85CI/+8b8hYtY8khNppkYlhJIkxj99y5uB3k+w2f
 kOBImMAPwr7ubtDF3CIBANjUUgEcrlZGG75gshJtzbIPXvLwJC61fA7a47Oh2YFz5PbXuI+hsjL
 qZvpyOlSArzvwhAXMretoh3+6eIqNeyqgxgd4DvV0KAFjdXcxzCABbeJ4HWAuO0Hk9CxY4UQ40h
 acOVuyNSBIFZMHw3Byp2B99hmVbaG0qldYTJDQ+wbFFfuRSj0UyTWWFpQGMok9Q0t2WwX4klfOQ
 t0/k=
X-Google-Smtp-Source: AGHT+IFI6sg3xeU/Y+7ewS/quTbjQS82OqC83SGue3QsM3IMT+1H7kuNPGEtqVWO3pz2NXoXOmWS4q2L435vkLC65I8=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-292d3e50f14mr137740975ad.2.1761495075335; Sun, 26 Oct 2025
 09:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 17:11:03 +0100
X-Gm-Features: AWmQ_blYJsh-bUnlNpdDu-je1LAAZ23ehLx8sNiiMWM4JI3qmhDsJ4Jmtvqb2i4
Message-ID: <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
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

On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +            // `as u32` is used on purpose since we do want to strip the=
 upper bits, which will be
> +            // written to `NV_PFALCON_FALCON_DMATRFBASE1`.
>              .set_base((dma_start >> 8) as u32)
>              .write(bar, &E::ID);

We are not very consistent on this yet, but I would suggest using `//
CAST:`. We are working on getting `// PANIC:` in Clippy, and we could
get others like this one eventually.

Cheers,
Miguel
