Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14473CBAB36
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117410EAA9;
	Sat, 13 Dec 2025 12:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGgoXRET";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184A10E156
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 01:04:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-244581cd020so2291705ad.2
 for <nouveau@lists.freedesktop.org>; Thu, 21 Aug 2025 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755824648; x=1756429448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/oT083UvBsRBS6hZ73RCoP0PWmJw7QiMgbEgQofiOc=;
 b=QGgoXRET/mEe/0Ikq+T8BPWRrUK//1l2koxwDD9ai5zuExxXIwYpFXxZPLdjWTGXpb
 Oi+7E9Sq7YtWA/aLetqWC9MTfyzUdbhH0iq6bVGgLzkG/KhnsfWe/98B84VmKr21maBb
 Qqhd7wvr4MjgezfPySLcAgcO6Xoa09o/D9eiK/hYQv1p+QC3BnDe5U0EPr1Lzbur2vKh
 FyhllP/0m7rXKpZjcejRMvLGefkH1DC50QFekn2KsznxFy+m7m7t8SYgTAIQoWjmTEPg
 P2r8hzaOLuoSut6Xa8DFfBK1hvu1kU46l4NKnwddJx9hli0OpCCs+21jLev1Ew2+5TFs
 +e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755824648; x=1756429448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/oT083UvBsRBS6hZ73RCoP0PWmJw7QiMgbEgQofiOc=;
 b=HhLN5N5RHPTBX85Venxz0F7u+h7QnYptZe74zTydmdTjkD7i5Xt26MIXl3NvykSpMC
 TyXmaIhQEhS2Rs71VWFcNBkztSNq58RTn90HB6nTm0xwUg/7ts81P+Bswnb6S6WJlMDO
 XFtJ5IzKaRE9vST9XTcgQtSZ13rN21gM34bX+MhI8tTJaTAEABAhkGAFWqkKyQp7r9Q4
 axzubyp1veiFrSRekchJIcT1UqUD6TNKXPTs6IUQ6VzGnbOb2jXb8apGTb2UHHckWUAg
 zjL/9Sdy+f5626NZi8Nq7fJgsNE6WIrWYkVhEb+xjkIz6//XUHhkMHh6n/oYtH2TEfZs
 74KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4femxb/SMp2h5iEBcp3Md4hkTySFnNoVqdeixw8bo+hP7mBHgbYPXXQVbhinldy8ioyRdx62o@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH/JSMJt77VLmnjBhVomHwbBZ6a4qZd0s/4UecwbV4yzn69jKM
 QvOvdfHBUZaGD6kkIOMt6RCG+Fk2G7mOZKXVMtq2oDSBt0U1fnokIdop82EAVSsDQknOc//6EF0
 tUoSD5XUkwZcU2AxyaxNC7X0B24gTpYE=
X-Gm-Gg: ASbGnctHADAJyxZetWqPp08rtVkTWRRvvVBFbrxbZFxCLcPuI6Uv4HgjgVo2WIeOvgQ
 TQxkcJtxPc5m57G08ecJ46nQAkwgHCHOxzCXNHGAFTWqhTO6CTyTeNcz6BepSt/PCM5TYrf7g+1
 QCMF+TOtsE1UQqd16nOrBCm8kzFsriJ/wvw1VkW+6Vw9RXW8b4pKJaFUHSIqgfNJBdSB++AaPrf
 CBUhQd89QJnU2aHQHD7H4acqJnnlaMqieeCsH5NCOFUAcSLH61SgIOR+gZjNXhyxik0J/sEKvTt
 km+zidZ5QggAAaU9BvE5GyLTxw==
X-Google-Smtp-Source: AGHT+IG1pfrx0CDcHH5YIWUaVT3XeEYgLK2FE/WIstqerPC4ya0XceUMKWOuBRJ00fvYKDFqfW4XYx3/m37svKscg8Q=
X-Received: by 2002:a17:902:ecc6:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-24630149490mr8902805ad.10.1755824648271; Thu, 21 Aug 2025
 18:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250818013305.1089446-1-jhubbard@nvidia.com>
 <20250818013305.1089446-2-jhubbard@nvidia.com>
 <aKVFVO3wbzClcLwg@archiso>
In-Reply-To: <aKVFVO3wbzClcLwg@archiso>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 22 Aug 2025 03:03:56 +0200
X-Gm-Features: Ac12FXwhH15AUsgGlwJRqyMw3OprDu14FpxrTqbVSws_CTfUXO2lf2JLddNl5wo
Message-ID: <CANiq72=aavHWOSxnLh3L8kR3BcbznZPFJWDJJJxEm9cssYe-=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: pci: provide access to PCI Class, subclass, 
 implementation values
To: Elle Rhumsaa <elle@weathered-steel.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, Aug 20, 2025 at 5:48=E2=80=AFAM Elle Rhumsaa <elle@weathered-steel.=
dev> wrote:
>
> All of the functions could probably be `#[inline]`ed, though I'm not
> sure how much it affects the `const` functions, since they're already
> evaluated at compile-time.

I don't think that is guaranteed unless called from a const context.

Cheers,
Miguel
