Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C28CBAA97
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3510EA64;
	Sat, 13 Dec 2025 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKuaER3t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1196A10E44F
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 15:17:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-26e81c17d60so9350705ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759159059; x=1759763859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iLyMxHlvLqemJX+awTsijKkDTe2O7NspoX88eyf7wY=;
 b=TKuaER3tkbwMkbGgV3XH0EF3yBC4+dK1/KgKLRlvB6B9yhsI22OSucPs5Dn17pAKcg
 EE8SLQkErDHLwHmTWvnMXGL75PC1irQJr2aDolEqKT/advNIMy1UNpg9tNncwh/AI0MU
 nc1oDP9QtuffyUOqw1zGSxXeG0YEducasRNx1DcNhK4ObyhHSBEKhucUxdbZcO86WXgY
 pDmp7tYyxhfab5zbL6Ya9bf8zBcfFvmqo9AVgIA/cJd/27kGF37AkkRALWThmVLRrlNz
 dA72mmlKNDeEPeAe4Nw4YZ8QfbUUYzZbyoopgcrotO79sJ6w22BM/J4rXoBeNxRtvVJp
 kYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759159059; x=1759763859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iLyMxHlvLqemJX+awTsijKkDTe2O7NspoX88eyf7wY=;
 b=OKI0kns6UoWUegSuEoqbTDzpxcD733mRB/ajC474FCWR/0+VkLmhAiTXfmqkHq7MHL
 pZQqzeIVex9XKBVF2n+1U112a7urMLIUcjnErPBIxtrPNcW1UWvUwg9pWIqv0nzWkT6Q
 fXqmGwMHPX+dOT1c98TrON4BLrZov5C4t8Wk65x9oiP4bxsmh/Fc/TOv5aDpc8xPlB+O
 Wlh8mSvWjEQ4Ws6eeOIkZg/MILPbKjREJTpz2F1LxlHWrmhH6zLrlA/2DYVtUknn+IgM
 6XFXT3aoCBvHlv0TXUJLP1R9PmKyOrSTXfcM7Q3b3Fu1KeHoZjuE/fLyCzky1sH0GO4x
 2iVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6eQj09vrH57DDdMiSKr1QHB+IHOSXJRvy+dMAVN38sYbNl1A3gh+ROYNoMAAzPs3zh0dpzfgr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRzNuC9sIDCe8v1f+b2X5EQ5L/bpiiv3uQXrXNj9wB7U2+FvPj
 TRDUR0qNmSsBchwV/cSVkgDyz6/8EfX6BkiNa2N01TgSr/4PV0K+JcbjtFQuohW2gAu18UiyDc/
 eRiz8BmefuwHzlSiyS3tyKlA7DL9XczyX9nr/
X-Gm-Gg: ASbGncviNRgfs31nhiOTAf/5BMkt1qWCfNdua6v501MNlN9fLIHECmWXUIvRg5XH2+S
 KjZM8PQGnhTLFR2A9LuuI0InGaROtkYmgEKqlKVsnfIcVFje7uzyFTzH+DQYRnydpcOURJNf2py
 FH1y3b4fk3U+g3WFdklZ3KEG6X+9MGWrrAMybx0qPXik32CoZSVhkLPH792cOqppzigfus1SFkQ
 C2xUlTAc/tfbbEOu4rErP/ApGUmVegyQKy3iumGdV63DT1zCmWeOnG8GWlWWWYFQurcFikL6y6B
 QPHBYKExV1xaGpsXvICPtNLUYw==
X-Google-Smtp-Source: AGHT+IF+JvH4jpihgghfd5nlg8ufLea8+tJ9snOXOMk1JKbPQlxyBxaIt2jz343GE+cDEAtKIOGKVPpUKeLyULsn0zo=
X-Received: by 2002:a17:903:1386:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-27ed4f8284dmr68541345ad.1.1759159059465; Mon, 29 Sep 2025
 08:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
 <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
In-Reply-To: <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 17:17:27 +0200
X-Gm-Features: AS18NWCkUheGDFaapzA6FmlukqlhAVxssnWmdmmXWlzMCMUthOlFQRmkWB4hggM
Message-ID: <CANiq72nTrp0Mt72hJ_5qwZtJYSg_ir10ENcX5nXELC_=5vvpew@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org
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

On Mon, Sep 29, 2025 at 4:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> A bit radical maybe, but correcness ensues. :)

I am all for Ada/Pascal-like ranges and similar ones as long as we can
make them ergonomic enough with our current Rust and as long as we
still define newtypes over those when appropriate.

Rust may get support for that eventually too (called pattern types),
but we may want to do our own thing meanwhile, just like `Alignment`.

Cheers,
Miguel
