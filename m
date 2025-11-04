Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC535CBAC82
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CBB10EB86;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1ztI35s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A6810E5DB
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 13:52:16 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b62e55af64aso389575a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 05:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762264336; x=1762869136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgxSC2aKqxilandHAezVm5gKzGGQcz0P4+qV+dri/oU=;
 b=L1ztI35sVSOx+hFlHTBdwSkV6fYmyA7jTo0io5W3EV7SiLVDrnmq1D8+6wPs4fCy5F
 SAwdZdAvob8l3j6y3du0l8WAguilj5RW+emiE6zSsLY9lul+uVIFdKBXWUclP8028Y4A
 dlC4P0fd9X2TmqEfBf5/FzVtUN4F4HpiZ99aKSNYsXEgXLD9Ixv3hj7vOaYuYSIIqCUG
 ff7HtYRWT+NruF0S2dJF9seajxGaSrse7yhKbdCCVxbJ+JVFKmAYZVU1CdqdegXErQxm
 NYUPWeM+Zv+G2sHBstyuPjwPD1k9XW/nZJPKtmKBtU5YRzYzFnqaBVzGv58nOTZZqfaX
 V/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762264336; x=1762869136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgxSC2aKqxilandHAezVm5gKzGGQcz0P4+qV+dri/oU=;
 b=h8URhHGONfXnOGDGkmvJq678hE2jh+Kos18qLzGIoFYax7M5LXjw3xGGNmXVtQVLYb
 SbCdjbH6iL6VlhGZh2xv9y393JThuH7bpwrBo+jG28fbklH1FmU3VV5Yj5fB9Chbpfh/
 owz3STW4KSWa8xuFxIn0dlSSnY0bKSwdjx24r7JnUWiwfnRVUHPMs4z2OGJ2Ap/HjOId
 GV8SKEC5dFrLHQbocXWcB3OQK4VHYwpznZVvF0GkWPeSuPWhXKcDF1iNY/8fQDFE0JiG
 YM46VjC7gqkWDSdX+cvb002cbpeYt5MhhYOcJVAMOyUOK8uRRlmQLRKV830eMf3kvc3W
 6ktA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Vk+SRP4WOa2WitMEDNqx/xeCSrO1uMX/YhUF8T2YcQOB/7UGJMDGkOC0Rw6qk+r+xVtPyTn4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsxJEM+AL/ShZHnrx01Fg7Ho3pVnUPv5YZylLDDjTkQJkLemwO
 fBzcUUGanwoZ/wRl5KFl6Z65P8W4IJaXjoy/I0MKD4XGhMUwu26IhmLQZ5cBwCOa5KOkuAjIqJ2
 UO7XA71PP+N1yCY/kLKyN+9i4RJR18y4=
X-Gm-Gg: ASbGncvZZ4EaJAWV6QmP9BhENBkNZrX7L+0RvEj7IggcwfEFEGk3MCIy20/Tf2QI9Fq
 HAC+0M7D2qPxM9uMW4ROd6s716Apbcz1tee7whkDCgErMkvr/Z7pL3aU1QU9/Trs4Xe78cSptuF
 Uc06QqNNSpQz7CWFuPBId78F7vTgSyBRCJAWRHCVm86/KfW0j39X7yQ0Q+Vtnnl+0uUfRQHZ7oL
 ZSH82CyYqpb1VZ0akp+b8E+YXVz24X7cSvF8yqwhq4iCv9W1s4fSGJ1d32kcXZbyWgezwAZ2sRm
 JnUbRTB28cNb7g28mUif9xQcSwGtMNiir2lFFNLFBsooVB5jBLY1oEh5zLcYlwZjRZdjMj8W1eE
 qzkI=
X-Google-Smtp-Source: AGHT+IEHIHWibqjAZGWyvY0H8m2w47BvrG2lZbXh2UQMD9AI1DeCBy/GvhFpcB4QhflEwGDTQ3v2/JNfuI82Byb03zs=
X-Received: by 2002:a17:90b:3b87:b0:340:b8f2:250c with SMTP id
 98e67ed59e1d1-340b8f22df9mr9464706a91.1.1762264336293; Tue, 04 Nov 2025
 05:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2>
In-Reply-To: <20251104005812.GA2101511@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 14:52:03 +0100
X-Gm-Features: AWmQ_blJ7jEt0nl7CKtiOJzaUdItBJ90fhDQUgIcURkC12jl_69-w8beSolcQvU
Message-ID: <CANiq72m692bb+W32QN1G+LJa7sHs=gU8k6dri3mu95Smj7GiRw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, David Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 4, 2025 at 1:58=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Perhaps wrapping it is #cfg is sufficient.

`cfg` attributes and the `cfg!` macro should work in doctests -- we
have already a few instances, e.g. this hidden one:

    /// ```
    /// # #![cfg(CONFIG_OF)]
    /// use kernel::clk::Hertz;

Cheers,
Miguel
