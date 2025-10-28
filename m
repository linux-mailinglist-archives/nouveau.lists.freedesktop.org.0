Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68957CBABB6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BA310EB10;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="deYdM41s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178CF10E5CD
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 14:46:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-290aaff26c1so16759145ad.3
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761662760; x=1762267560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
 b=deYdM41s1t6LJAlhggxCymJ+hBqxL+NHwS49vkHB/rWJMAMo2agpcJGTH+2jvAgSCO
 ygVEz/t/U3d871be/UGJRRE268bgVZiqAf2eAJjeSnMXg/V+Zf699WSdgQQqoGFwfzQN
 9jFERMYpP2FCwarXF7LWV9/YjcbG6AoooiaU+vAKSkJWquD9dHcL+ipB1NLWM6SBOXps
 MDOzo3+5mUnQDFhLCE6mvo2CkAEd3tFt4+YK9XFKrCJVYZniLMMmZzbHkhhSNPfWuK6L
 1Ajgn1N6hcyPrpalz78rcvnxzR+eKdVo6n3e6DjT50O0qIVr/FI8nGa4EMWUlLWEPjpD
 EAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662760; x=1762267560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
 b=AcBRYKaMt1D2BN8f9bC+ojCIwYkQ8Qk37tWgdbW+qs/42ofy/IBhBtFN8UubkUSwRO
 Q5/6sjS/oYjTPa3kJVyofF3H6JDfvqYIAQXgfJwc/X/ZicW69em/qdxhaYJX4pVatHTh
 EOnXO6amZsa9+KV82ExXgJwEa8uy/EE2DBr2Rc9ZEA9DeabaL8q+RPEAE37KicZ9kRLn
 +Z13UR5OYDhh+EteN57Xb3XajjZUTta09tuXWdJvaSFaeMRiUQxD1jY5Go8g+y7Ckw/2
 cS9MUwEP5k/au8L0Us24kiwB2Sp+KeNCC6CCuSOHUxPmFMq03coCQAWL2G0zZip0OO7A
 zUNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7AcGnSAmbkYCA6Xk2lZseJ96x07RfkemEENZJBWlv9sa+FhQob83dpj+2Pj+7ZUeIfghXIRD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymc7KEfhVQQZPTS+5JakPEDU6O5s6d2GojcXady6GglC6/cOCi
 wjRIkGTh7fbACa/ZJUglfLbkePms2YytPvoLs84EDXxM5vjHj56d3dbQGTY90WPCzwj091hnxsa
 pbi+e7ge/houROXnAZCHtS4ZiQcFdxy8=
X-Gm-Gg: ASbGncvAisPB5ZjiJkYZKtsFsBx2JJpSirWfeQmSHgsUX+E05E9BKv8yej4O7NiDvF2
 jPHUTElfJNKIjI6bcEKsPry+gs00xkxTpbjFvuwv0db7m3fCY0Hacn9nBOZCN5ksTUjsL118g73
 YCfgfGdLNDFTryS4tFDu8ozsJz8Vv6bVA08bvikUkuf8AVxYCcUYgNJFOxW9vkaUrN3FizVYfns
 Mk5GhYpXLj+tncvpB4C8eBbBNabpty6CTRiPLX9196rgTF47LYMawJfhnS5Hn4wOaK4FGxb4taJ
 oIPaUShCKVhvrFtT/PG9HmDvjXggkQtlnpOIVcSiTeDCVUJ7PR1m4UtKIAa8WBCpFvC/p5t+I9v
 wOqg8ndDMPTrZnQ==
X-Google-Smtp-Source: AGHT+IFfY89QqiTl3UPAk6WKNc6WSfg9maX4CslBrwsb+ya7LyhSlvq0HWbjx5qGqAFL/1tDdaDG4249vNygIfHTzN0=
X-Received: by 2002:a17:903:3c4d:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-294cb3e8bb7mr26098245ad.7.1761662760526; Tue, 28 Oct 2025
 07:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
 <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
 <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
In-Reply-To: <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 15:45:47 +0100
X-Gm-Features: AWmQ_bkouzgy_TlroPyjfTyhvmFTe0497ZQoaOPqA8hULwK1yxqY9ku9pkOIYX4
Message-ID: <CANiq72kUDtc+6hrJ_=bbVfAjsWOYzSjVvUiT_GOBKHWQRaLDMA@mail.gmail.com>
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
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
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

On Mon, Oct 27, 2025 at 1:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Sounds great, will do!

Thanks!

For reference, the other day I opened a couple issues for this on Clippy:

    https://github.com/rust-lang/rust-clippy/issues/15963
    https://github.com/rust-lang/rust-clippy/issues/15964

and added them to our usual list:

    https://github.com/Rust-for-Linux/linux/issues/349

Cheers,
Miguel
