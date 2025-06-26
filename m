Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C6CBAC76
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE1410EB61;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkWyyBel";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DD610E87E
 for <nouveau@lists.freedesktop.org>; Thu, 26 Jun 2025 14:23:13 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3df2f97258eso8931055ab.0
 for <nouveau@lists.freedesktop.org>; Thu, 26 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750947793; x=1751552593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PmJhzf1sJs2FN8a0RHNKuha/3rAM6VtFHnWa30sHCs=;
 b=XkWyyBel8siJAWPeDXL6+pac7l2SmEqc/+q4gCycahFOhhjXjVn63hlnuBi7eE43n2
 QXY8ReBG0V1HC5eLNVYFJgg61zp1MqiFMKFLQenRujqQ+78knAJUWVAg/VRmvls6ZUd8
 ZFzscVxll/IpcpDuinTwmDOcTQn4+22IkabY03MtqWbQLtsJ+V80k1Wmw58cXwkTBw+g
 7QrFQRTrxxBaK+YQw7YwoLARzdiu23HK7hhVoRhZGjQ99XKm0AsU03ohwjL5y3mNMdvd
 rvz5Gbd9NHk1tMdCrKVlQy+3xht/571NZxSq4m2ZgKqj/iyPJcVXcVw3EWsno516Grup
 benw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750947793; x=1751552593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PmJhzf1sJs2FN8a0RHNKuha/3rAM6VtFHnWa30sHCs=;
 b=FreHs4mKFX2ekPIGn7x+cICAqiJwizJnfWkuynL40bkCiTksFaEJsdka7TghPGTZpj
 1E1yHHF80bEDWnyJuje/GaHLrqIHpYu/bRyO4Mdnj8L2Ovm5Du2Od8uqaVuIxowsk2Kf
 Nr01vwoiVSWTJa192OAHAyzduaT3nmnui3qT1PGfp+8VPqhCQ1IJ+fMNZko1tG5tbYZ5
 tuzV1hGom8SI6DaC9uQgmMmVdYSOpUAjzT1JsqawOqMH9sRsziTSnffLUXhk6IYQcc5M
 nlsiHPPtD3ApDYUF2UzXa3oHYnv4RL95Hx+DiLq9U98g8yvGEWxq52hZn6a6V0Tngpbk
 F5XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD1xGMun6KrxsJWzpLCTeUX2e9nGSrzJJkBZOq/u/R0TRt3TWCTEM6+RBP4eGq5JpDT1M3c3on@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAIqZYGWE4AbrTkpBON2PQNsN4yd2XUkDYsqLuyhBPtVxWlC+f
 9RSsTFYxl6DUDx0sXtmTSMs87MBuYatem0aNR2kY0YYFWT+w8BTgTubelo+IrYCKMeiXR0lcEr1
 IriIYoI2M58zHzU2VL+Mh1z4speOXXiY=
X-Gm-Gg: ASbGncszWWe3+t6IcQa8gDydEj/cV26Be9Yoi4w/CILINFJDI4qPPCfTjklTQBUuQ8j
 jhWxP2K0qyyQ3zyOMRd0or7+HDVRdfT29BPKb152o+fpCSMxGmnMpbHnXP06xrPYxoGeKOlSc5W
 udOGwcDiQieyImTT8n8ASYcB6tO5uLB2fNfvEAYWQyrXg=
X-Google-Smtp-Source: AGHT+IF3rE0mC2CPX+Ugvjxi6nBUgivlndxS0obHPchi2LG/zWvKMmmAwuBdqywvKq+VzZiCw1orp74px1+xkgYq9ik=
X-Received: by 2002:a05:6e02:378c:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3df32852952mr95072965ab.1.1750947792809; Thu, 26 Jun 2025
 07:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
 <DAVO878E49AN.1L5TPHANBBHE6@nvidia.com>
In-Reply-To: <DAVO878E49AN.1L5TPHANBBHE6@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 26 Jun 2025 23:23:01 +0900
X-Gm-Features: Ac12FXzfN9fk03al47GYWZapf9guorVxLElMTuSPKfESyeSLvx8gJf-MiJnO3vM
Message-ID: <CA+tqQ4Ji486i=Gzy5oEsdZLOFDmGHpxT=Wkng2cyZpJ=u14FPA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add `FromPrimitive` support
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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

On Wed, Jun 25, 2025 at 11:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> If you add an associated type, I guess this means the derive macro
> should have a helper attribute to specify it?

The current implementation tries to detect the enum's representation
(e.g., `#[repr(u8)]`) and falls back to `isize` if nothing is provided,
since it's the default [1]. However, when `#[repr(C)]` is used, the
internal representation is not controlled on the Rust side. To quote
the reference [2]:

For field-less enums, the C representation has the size and
alignment of the default enum size and alignment for the target
platform's C ABI.

Given this, it would definitely help with determinism if users provided
an explicit attribute. Being explicit also often improves clarity and
makes the intent more obvious.

[1]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.en=
um.discriminant.repr-rust
[2]: https://doc.rust-lang.org/reference/type-layout.html?highlight=3Drepr#=
r-layout.repr.c.enum

Best regards,
Jesung
