Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58BCBAEF5
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D743B10EC53;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL0IjXL4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2BA89CC1
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 22:50:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-297e2736308so5207815ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 01 Dec 2025 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764629445; x=1765234245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
 b=NL0IjXL4ppEsD8It9WKJQ2oCmbQgUJClYKnnVewEvUCAhjM1jcXEnsSv0ePGpfv2sh
 JhFG/y7IfeAEnPopVIvcnMz/JcScTs0PKQoEsSeK8htDv6rN6Ss9mIg+45BPnot2MFYi
 CpmaO20eL3Eg2wjQU6dW+ljx0E8IwEv2AANHXhx2OAGB4GFODtxtWZXRheqqyUDM5nlg
 WQhIxjRwdXbjA73hV33Yn1FO+7Fdps80pJ8Hyb/1iKeD21Cf8EdNfXVS+3xjcaWBVdR3
 x69+wBgTPqKdwUsja9vNqs1jwLI+IaGauErDssFB03nE/yFpZI9xa/OBo/UoLCSXRWYy
 eqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764629445; x=1765234245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
 b=rOdue2iiZK2O5b5L6AHBHS5zGFvY3DMfHW0lh1bsOW3kLNkrAE1QT4oPlxz+WTLtY2
 Fanhr4azbBR4Z1iLQIKExzvA6xkcnAWc2LiI4STCbHzDe/WnhcCxZ70JZ1B/bGResavY
 81vUBtwDhvz6VnfJLESQOXUePX6C8xz77Bnq/bfTPbLyELBVenuZUGwOEJebH/CYpCZA
 pkEJH7O8OWtFJwhhH4OTAjEd9fxEAVgxkmmdVnBUO4mZhT5cxS3cmrioIbrV0ZZVrzxl
 BhcEO0QpYxc3bsG1ZozBYUBM5ooYXgk6Uixz/kcNeFeU9Ha4yN+PcOayNVHycJvtiX/M
 m9QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSMsZ93UlRV0FUJ8+U48GFl3MqWGD0Ep2afxvCscwauDD975foSTT5suSNkPKU1b02wiS7PRxo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjnC+QsI7jp0ek14/eqfHU2tmD0eUKlE2Gq/ifUXmwCG/DWwhY
 Z5+YwBovZtLNj9S18adYJXqa/Rbqg1jaDHNLklqzG4cQRSLVakFjhgY2N+MH0HibxbszsiTw3P2
 M/wy/cWvqoYEo1NASndZQy8TcxB1dBlI=
X-Gm-Gg: ASbGncvpooOTW2mfJopewomY15PvE8j/fRiSO8hpNm8GQ5+7U/K3mSK04I+hbJ6j7VS
 fruswnqgV6Ex/m5ArHI6CFgFcNPakTb2hZSBam0Aujeg3pW5dNp9Cat/CCzdiPA7eqd4pn4MJha
 69XkZHJt1LwntEsACwzalZMoR9qJFEoxdpA2iGRmwFjoFMzMi3xKO2xcEtFKk7uyhASj0WC3QHB
 CZsLoh0TIwvpDF99qk273CGDzFlsOpxmScygTK5ZkJE1j8eWsoJwuT3kzWt/XKwZMgUGNjXkHpT
 uKPDYz/SYf0X+D2tCX2PQCh5ssmGtV8jJ8MzDVugbxLrSloYZ8p+OilBJAYiq9TmDDtEvNBwCXr
 x9VwL4EQEHFUBgw==
X-Google-Smtp-Source: AGHT+IGHxGCGzFVwRUGMDnjtYFSdBL47/yuzjgLbitj4yeg6ia4ATcJFfArtvcqBElQcbvEvQwVhmeOGDZ21tUc8jmo=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr25658546eec.0.1764629445406; Mon, 01 Dec 2025
 14:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
In-Reply-To: <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:50:33 +0100
X-Gm-Features: AWmQ_bn7_DfyaSJT0jy3fNrYUWknruqwwH7bRpIZRSHNxUbqTeaYfAUp-OMWGok
Message-ID: <CANiq72nhkOMGGb7evGn441J-8nX=jSWeDTASn0gj+TCa692B+A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
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

On Mon, Dec 1, 2025 at 11:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> But for API developers, the problem with doctests is that no one has ever
> actually *run* the code. It's just a build test. And so critical bugs, su=
ch
> as the kernel crash/hang below, are missed.

No, it is not just a build test. Doctests are actually transformed
into KUnit tests automatically, and `assert!`s inside them actually
report back to KUnit too.

It was a major hack to implement, but I am proud of that one :)

That also allows us to build them with Clippy, to e.g. get the safety
comments right, which is something normal Rust doesn't support yet.

We are actually getting a feature from upstream Rust to support it all
in a stable and nice way!

Cheers,
Miguel
