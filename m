Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C845FB00330
	for <lists+nouveau@lfdr.de>; Thu, 10 Jul 2025 15:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B4810E8DC;
	Thu, 10 Jul 2025 13:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MyfFEi35";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E110E8D8
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jul 2025 13:20:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so883115f8f.2
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jul 2025 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752153654; x=1752758454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
 b=MyfFEi35Kr+iTzjME+6300aKpTDri+yX3mWlIXak2qCzVTs3JAOlRMCA80J3EQepuu
 uy8Gcs1mDuhOngjSMj0kmKK+lGDEfLs0eYgzap3ynWvN/F3kCY4sIHbnJ6FqOR5Dq9lo
 mCgu506a6Qw/qBUjgkmoWhR9qAaR8cGA81xF9Lq0OW6Eo5HUNXtCJNa6J6pTf88tpJg7
 BEhzno2P7lE7GiRub2wEVLoQ8lTRFhHPv11gGONkb7FkVHdq+FrRL9s1ONzhvlHEV5GK
 ot7FHCAYrmIR4XEdsMwVjS7iqyRPZrsahVXnQm3Wnh5jkFVcE/CX4eRYvGj0n0/2MwFS
 N9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752153654; x=1752758454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
 b=gi1mo37avuge0fIdy4iZsRewDhg6qWZykmNpKlu90e1ei58kT94ZYguviONAyS0a8R
 eKMgEnkwqhzkpD6gQ39TmBQeNgCu9k406uyWJnNy00YrVLxv744L1gckAGCzoKrGr0jm
 QdPEA8cJepyR7TACP1s29AHnF8DtMeJrIWcLB8AePvO6stYcxHoQnI5n5u4lJ6Q+bYoz
 ecsGIjbou0/UxMHJaC6cb+rdaFneFiBo38lQd76gi89H2yn5SFFBOlzcLOFBhIzx2Nk0
 P2J2InpBExvq7rMbCwUXf+RQuGONuyRthTzdF8YY3kwqooKYB06rYNfvY3EVewNgwo5T
 D5vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsx/H2vLysbbr9Q2wq6Ts8knpGixl2xa283Vr+iWFr3FCrOJXuR1SP2fS79Xx2/L037S9kGNfw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGv8lFT3ZMLt0gdrCOyaEG5Xup1Kt3axKAI9/YK4BlMl4u+j/S
 K0oSOFgpchPaD0BnJYT2Qw86aO9ET1az9Sccym9IdiaozhMQzCKdpACcH7+M3Zc/+05KVEYqyTB
 cR2BBEapcn9qjygbOHO9iwINmSxWzbHvN9o8bfyPG
X-Gm-Gg: ASbGnctZJjPr7HcIfYy4/uKmSUEKYRFfjVqHWxM808i2aZzfrotcrBSGodSm6RKIGSH
 kPyYPH+Ads0VOgjqiyh+mFmOKz5me91UJyq1sUCJ5ur+Pb3vEBhg7yMsp7FW+E0JuHHUfo7sJHl
 LlN7o9z2iumUNXnnCDPvRsH0W01Lbc/0kReHd0bzrcVXfStvhwDATrmNPtRMcCgFs+r0AiRl5QN
 w==
X-Google-Smtp-Source: AGHT+IFujM42vH3V09euhJ0T7/vZlUGl5l2Mqd+XJHCpPSNb1kApqRjCh9Jtd3SgLVxJgkK09tgAyiBl1EsMOOSUJIA=
X-Received: by 2002:a05:6000:2806:b0:3b2:e07f:757 with SMTP id
 ffacd0b85a97d-3b5e788d3d0mr2685032f8f.1.1752153654256; Thu, 10 Jul 2025
 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 15:20:41 +0200
X-Gm-Features: Ac12FXzitYxvRbQjbTDWexl7FT9vfcJPNeta0DSIvcawfTODepd7_rNw8p5wCA4
Message-ID: <CAH5fLggU_DsJ4-gj_xBeGgG8mS4CSrypNsmOqu6c677Lyyvqxw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Replace `kernel::str::CStr` with `core::ffi::CStr`
 (cycle 1)
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This series makes preparations for the replacement of our custom `CStr`
> type with the analogous type available in `core`.
>
> As this is a large migration that touches many subsystems, it will take
> place in several cycles, each of which may see multiple series:
> 1. introduces facades in the kernel crate that downstream
>    code can reference. [this series]
> 2. migrate downstream code to kernel crate facades. (N series, divided
>    by subsystem).
> 3. replace kernel crate facades to allow `Display`ing foreign types
>    (such as `core::ffi::CStr`). Replace `CStr` with `core::ffi::CStr`.
> 4. migrate uses of `c_str!` to C-String literals. Replace references to
>    `kernel::str::CStr` with `kernel::ffi::CStr`. (N series, divided by
>    subsystem).
> 5. rename `c_str!` to discourage use. Remove `CStr` reexport from
>    `kernel/str.rs`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (6):
>       rust: kernel: remove `fmt!`, fix clippy::uninlined-format-args
>       rust: kernel: add `fmt` module
>       rust: use `kernel::{fmt,prelude::fmt!}`
>       rust: str: remove unnecessary qualification
>       rust: add `CStr` methods matching `core::ffi::CStr`
>       rust: use `core::ffi::CStr` method names
>
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +-
>  drivers/gpu/nova-core/firmware.rs |  5 +-
>  rust/kernel/error.rs              |  8 ++--
>  rust/kernel/fmt.rs                |  7 +++
>  rust/kernel/lib.rs                |  1 +
>  rust/kernel/opp.rs                |  2 +-
>  rust/kernel/prelude.rs            |  2 +-
>  rust/kernel/print.rs              |  6 +--
>  rust/kernel/str.rs                | 97 ++++++++++++++++++++++++---------=
------
>  samples/rust/rust_print_main.rs   |  2 +-
>  10 files changed, 83 insertions(+), 50 deletions(-)
> ---
> base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
> change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
