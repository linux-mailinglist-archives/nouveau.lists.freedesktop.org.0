Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE67CBADF4
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BABC10EBA4;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us7pqBjI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A1510E23C
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 17:06:27 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313290ea247so360893a91.3
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750439185; x=1751043985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nR8JCkDCS0gb3QmY+xkreXhapsXDdGblPAP/bOLVoRc=;
 b=Us7pqBjIWOL6zHG+gaAbbrD/D/M9ke9V0QJf8c+iaBmvTvj/XpFet6jOh7qmicTqvs
 rWOXsd3r6Do8S8RyMU6mZ9DX+YQgyD94jrG+BYD8vuKuXtaBWlE4luCs9JMhSdorGqDZ
 DgCN4OQqK2XttU+6zv80QL2boIYWv3xQa6z4QbjAJIThNsHkrJ2wVypZP7wiPrlgh71P
 TWh35pdAoUIlDKiDAH4pWcYb+omM8UWjADpuBZCBfMKUN2M3HNBNwpbVuTWgJHnbnv/s
 RWgKKg+DpfWgiaFeZvNsx5TPgEdZs5EuFpvPBrTYg4cfrs3iIV2uWUdhM+0Kf11NdSdj
 pUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750439185; x=1751043985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nR8JCkDCS0gb3QmY+xkreXhapsXDdGblPAP/bOLVoRc=;
 b=Erv8mKXSfP9Z+IWO65d5UfC8EJdp+5QC89OansHLBKeYVLo4Vs+nH4XYsGjpujYq6b
 7IwVb+Xgg4evqQoCU2mx9eAj6MPPJWHbVH4SZ6evPdnEN/Y2NTNCtp42uDbqhrSg94fI
 FRxhxzY9JD0MMovydMF4BEPUy5qfBPBixAa+R0laNL3xuDLSvi85+m9wgQF6J6rt7qV0
 kFzqftsjtNrslqS/j43XIHvK/QvMKsuZmkx2q7tD8P41kmgijdZh1uNZDb9v+8WteDdf
 ke7GJGhYE1QLL98D5n4wQbWhMtrGowAiNe4xW/USsKTLBcbDMdEpF3Od7khTv7KRb0cT
 S3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIL3NR0TEz8w93qVvP2LlOo03TDODIDTWDOXbuhjBwIzlzH+JyBk3e6clopDotc0bfNp2oT5jP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAOJcli1SSGhe6u9jQtA00Y/MctBL0ORMNerg0qqLb6lNhjT/9
 Pzj82rIHkHa4P8KDtTdOPSJS1f6Z4fvdYGDRV3t+AoJILvFm/taf56+cd8jDrwhw8/b9K1Wavk4
 MdxKfM1sRKpxzP5XZXsSDn5do1HfjzrU=
X-Gm-Gg: ASbGnctEX+dHF5/qMNb9P5tkaxkLICC+ShUz88bnSEz+UnwMX9i0MCTv0NFmY6DWVC6
 8TTYP+KUwW+xX1ACvPMIZPOTvXAz4YMj42VN2I8OPbwFZQgLsBCzHsVwxXIUk/IkB5HbycmZdTh
 RdqI9btDg9/2qb0ic4mGyJRKhZLkhqClIJzlb+WWk0CpixgJ72wOL3Yw==
X-Google-Smtp-Source: AGHT+IFUdRD9ff/2AXzkajZ014jgzqnnrOctCnqUh751BOw8Une3qB2C2bF1iaF/ptF/GHz1mrxH1fQWMGB98YE9euA=
X-Received: by 2002:a17:90b:51c3:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-3159d8c6cedmr2366780a91.4.1750439185108; Fri, 20 Jun 2025
 10:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
In-Reply-To: <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 19:06:12 +0200
X-Gm-Features: Ac12FXy9impNFri4YJFlzwQ3T6GDHruzREl_6st0yjIG4jjsANoToHYXbGIIsEw
Message-ID: <CANiq72=kfhLwpXL0s2HWbW79QEZNTvJ1UKBSzp6MHyoVEUAC1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
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

On Fri, Jun 20, 2025 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This reminds me that I should also check whether upstream Rust would be
> interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
> for contributing looked a bit intimidating, with RFCs to write and all.
> Would you have a pointer for where I should start? Maybe a Zulip thread?

I would say it is actually quite straightforward compared to, say, WG14/21.

The first thing I added was a method too, to see how things worked,
and I started just by sending the PR.

So I would say, go for it! :)

Cheers,
Miguel
