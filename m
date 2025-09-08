Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B587ECBAE18
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90110EBD9;
	Sat, 13 Dec 2025 12:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7Gu51lo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7210E5AB
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 18:39:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24b157ba91bso11015415ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 08 Sep 2025 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757356774; x=1757961574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
 b=f7Gu51lofdvhr7d/QjJd9LTgbPm66tZe2DNTvW3TxhWVdNOxHDeQm1YD35EVzxI8So
 ZL4z1ulkX89PCYWWPO9HuaQMvAfNbXBUIaEPl9lfijxE4IKn2yO5S5bu4ihVmuXlbbAS
 39Px++IP/4evN+S2gVv+hm9cQMpDoTKgsyvoD+aoajHmH3GIGUfUBwU6OuFI10sxsGgh
 /9ETJhYnd94VkGXWAfUXTxWsqlOiITJYQbyjxIjqcry/RoCxlAxu3px2jx3cTlFlktfc
 hVOo7WI69oaM31CnIe7FqIILalZqc2NhvzKEoj/9BXvhfUbap2lIHCpfxtpnON/SGmCv
 Ed9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757356774; x=1757961574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
 b=AllbAgkauj8r6ngvgz+AGngIwl2PcNaDqewqtTCulfBrOMZsRm0OtRKk4MXDd/7Ore
 rvO2GtOFiFTyKEVs+CkJuYbwmIqvtxUn1O56j0G7kJ6dlDFuSJAGQypIYw7UzPTVTdo4
 gnrwCTbcgQNPlGP4UgsskDBsYAejCSArto9z9+fkNwzhMar7Xe5lwfnsDb8+4hZivvV6
 BglosqcY9b/4O5zNZtYMz01qIjYzVrfmfA1jsX0E5T5HpzISNxBXd5AgWoiUcI+cRwCY
 cLAJRiVAzfLsYTj2kwlk6CL5KgJUSWLs+0GPGVhVVnIwrHYGHjs3xpV0Hi71++1dvXph
 VyVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6cCge3RzXw5+14zJP2Umkh1GpJU9wdoxOmDjcpeV99uXvCgb7t/fDWLv5ZnnrFhPXD2JOsb58@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY5FnDm3at3d6euhyL9GzZK1VAjulYe+WnXE5MH6vjmmxiXCmU
 nNVYx2Bw1CmXdWi3czJTOUBTEGV0sVzkvgA/3Bz49HcK+Jj8mqSu0E2mO9skKs5u4dV81Gt4Dml
 0Xh+xTmuyTYaabyqEOeIp+70JOh51Iis=
X-Gm-Gg: ASbGncuLd4IK5ftnDFl6NphWJO1dWDLOSXZkzdjpa8xl9c4CLM9GqfWMIt6Ge4b4i/p
 U41/PZRfXoGryjGjcYhePAGgWq0F3RFQlOXrgcmdXS9Tp3vBSS/oi+Xtuj512QhhRUkZ7JHFdI2
 gRpRuQpajIaQAJdy+VkNMc1l2r8sd5c5LCGUas/qnRRmdBw0cJNFstyOmqAnPliw8jT8ncvKECl
 9SqnYvm62FNZ8bGnKtHJVJOySFbj2vOPD9wsVYMwAhVBsxjgvoVvrYX4u6hv2HhqWyZUbrQm1Gt
 umRQHlerwg6oHjFkG51NvOo3LDX+LUVX771+
X-Google-Smtp-Source: AGHT+IH29cFvlel6V8ScTGbGDxPZ7K0P7UvZ0rL/JFEyC2Ho11m+AZ7lO/QBBk0RySgAp1Ke1kTHpxcO0Uo0l31ICC0=
X-Received: by 2002:a17:902:cec3:b0:24c:7bc8:a51c with SMTP id
 d9443c01a7336-25172e31d9cmr69938435ad.9.1757356773568; Mon, 08 Sep 2025
 11:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
 <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
In-Reply-To: <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 20:39:19 +0200
X-Gm-Features: AS18NWA9wdmUAfNEz9N39DTUDKozBSdy8jPLQYkAjRGgYpyBnhyvWqsDm-DJFzA
Message-ID: <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Sep 8, 2025 at 7:06=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> The issue I ran into is, without adding it to prelude, the users of regis=
ter!
> macro will have to import both bitfield! and register! macros explictly, =
even
> though they're only using register!. I tried to make it work without addi=
ng to
> prelude, but couldn't:
>
>   use kernel::{bitfield, register};
>
> Also not adding it to prelude, means register! macro has to invoke bitfie=
ld with
> $crate prefixed  ($crate::bitfield).

I am not sure I follow -- macros should use qualified paths in general
so that they assume as little as possible from the calling
environment.

It should work without the prelude -- what didn't work?

Thanks!

Cheers,
Miguel
