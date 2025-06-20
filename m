Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F9AE1CF9
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 16:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CA810EB6F;
	Fri, 20 Jun 2025 14:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XFB5l5K5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E69710EB6F
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 14:02:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so20549015e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750428142; x=1751032942;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrglQsoKcEeOYOt0yvjVwUQOZYMIEJIvNwKImKH8jF8=;
 b=XFB5l5K5VjUX31oX5W6WDp0Tz8zQy8H/Vtjx4ZVLDOxAvJ2fp4tddwoaJmWo8tKT0b
 SzxPWPQHLiHibVYa8v7nboZYw90qoYpI/C+nKfYLq9iAEqUyOa6tGyywIoXYMaGrbK/V
 uatbfm0vuLcdzaXLvZqBRXtDwfWNSIUYchquwdF/hQAAe0ZugmPqu7Y7g+H+IO8nY7J7
 ZD5lGmfqOaQQCjVibg2ibI6WCw2MEy2H+Hgok28vJRlRW246SKS53mTrM3d719PNtp5D
 RMlko57Qxk4lfYp3DinHooWLVKPhzO1dfKZSpvJh5LcPrBktoS+0I6qlHQoARG9HtZeh
 +9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750428142; x=1751032942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrglQsoKcEeOYOt0yvjVwUQOZYMIEJIvNwKImKH8jF8=;
 b=kK/d9ZtFLzHfmY/O+cbPIraIaZoJTbU3dGRIdJxWk32lhRsalSK2iXxChvaBN7JqDV
 l3vTWKeDGkFKy009ikNpk6eztrB/7Wjjjc6L0R9AHOtCG5WXcqY+AgvdjPrnHRWncmK3
 DBzc+AVtrfsCatgoFpLjC+ruJ3xfIXk/Y9HrFEEkAGePGje+HUVm8HIdjqjugqoG4knE
 ntPWDN5yduztObLfb0iW6dmSg1dVm/nuTHiPZtVV1Ci4QKSi6XDmvvC/rG5OfGJsr26c
 r+4NlcAslcUGzP5XEdDWNPuI1UaZFwhNoX+9yB/meONAnfB6uhuXXUTJMibODyXY6Rpu
 smgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5UCOIHKK2jdRDghWlBjRna/pHg3DZ5Dd0dVNgS8ZAxdJDetnL7mVNAYOyLlLDvptUuOPnTzZP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVjsvaWxpcjQKScZdxKAYDZLA4rlAdHUrQ+0YFzp9ciWDTDEe+
 +hzn6u22UBGV2yBslrmT20cqeIiZlCON2yMXTrrMBRXV7mrTqRw3Vf5YvtfFZXhsyku6vvpOi2i
 JjOuoVbH3/fn9wkASUt9uHKI/d+UFjnZe4CD5fRKy
X-Gm-Gg: ASbGncvISudLPOqjmAPfySe89et2WpgUHYxDu0cAFhwvjWvOLI5DF9T31ZIiZgWRLOm
 JKBeYupSr9KoxnB1muWOzKBdkFB2Yx46opqfghJIFVTVztwz+5uG/Z8G/MVg0GQx9S4ogj1U7Tt
 awGxM0SQM+RRwzJT5xn4syTAzK7QCOCkmre7t2Q4PiFNYBx5JFhBc5spJ+qFaGaaymbnspW11hA
 g==
X-Google-Smtp-Source: AGHT+IEutL1VNX/hRHqOTi+mnqSm7ws/5NToJ5fnCdAaVgC5P6bkQB47Cg6RbXBAVp8TtUFltoGDzmM/jRWhYrGYMfE=
X-Received: by 2002:a05:600c:3115:b0:453:9b7:c214 with SMTP id
 5b1f17b1804b1-453659b896emr28450745e9.29.1750428141761; Fri, 20 Jun 2025
 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
In-Reply-To: <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Jun 2025 16:02:07 +0200
X-Gm-Features: Ac12FXwzBXdyGz8le1CMJiiIArNhimA33xIPls6XDWTBt2Clkd7qT2GytcDFqHE
Message-ID: <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Fri, Jun 20, 2025 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
> > Similarly, if they stabilize the `Alignment` one (only) and we end up
> > only using our `PowerOfTwo<T>` for `usize` and those use cases, then
> > we should consider using the upstream one (and adding any/all methods
> > that we need).
>
> `Alignment` is very close to what we need, so I don't see a reason to
> not adopt the same name at the very least.
>
> This reminds me that I should also check whether upstream Rust would be
> interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
> for contributing looked a bit intimidating, with RFCs to write and all.
> Would you have a pointer for where I should start? Maybe a Zulip thread?

If you want to add a new library function, the correct procedure would
be opening an ACP, which is more light-weight than the RFC process:
https://std-dev-guide.rust-lang.org/development/feature-lifecycle.html

RFCs are mainly for much bigger changes.

Alice
