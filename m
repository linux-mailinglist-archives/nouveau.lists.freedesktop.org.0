Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9480ACBAC91
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5B10EB72;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwmjthrt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7910E03D
 for <nouveau@lists.freedesktop.org>; Sun, 21 Sep 2025 11:42:09 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3307e8979f2so983527a91.2
 for <nouveau@lists.freedesktop.org>; Sun, 21 Sep 2025 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758454928; x=1759059728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K916KUx2pRc33+DQRqSv33PWW4YfoGyNBVmdt55/SZs=;
 b=bwmjthrtidLvmDxNnuHHFxe/SZ8vjugVfbHNo65Y8hplPrTkqXvc/Ohm8tl2eRwPsr
 8zKe0Y7O8u1FwNy0ktZLGGN1wiTcRi2xpPdIqrLR5k0xa50WrgJql6psZv48LDI55xN9
 MXk50in5qUcULwulchrAV1kJron30GbKJLFEdama+pfvTWtplOQdEavPIUDZnwsUhLLE
 aHVtVKMKLV+4mPyLCNn2aMis/dARwaCqGL6NX601gsw5eOw9U2KNAPTlrEA0kGVfFwbX
 dfbT3wqT/eNox0fzN6l9Ue8T6zQqJ5kI8WPk5RW0w2fBrKzPKvTix1iKffEkp6uVN8ax
 iFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758454928; x=1759059728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K916KUx2pRc33+DQRqSv33PWW4YfoGyNBVmdt55/SZs=;
 b=ij/Py8dX+0GOIUg30OaPL2j8LcBHvaZm3Zm1OS5rTb6BXVqHgu1+5hfwL/VTP8IiOd
 puD2mcE3hq01mvtu7VJdoN8VhwuSSwlqwZhxicuojSpKXrpBBs8rd7cI6T+nLZ6FIqDT
 3vJPij7214NijjtIEECylxbnVQ7tVSFe61M3MukHXG28/pq+QalAxhNq6MafS4iYNESV
 FbGh7IBqneePvJnGeIRyeks7MVFXkpr2B50fpB5R6RSVxqfTg8Xc6suMe83huEEiRrjb
 agIhTevWVV9B2lIQtxZHLihzQC4p7/poEGYoDDmcYFwojPtLpkLx4f/lWi88+A1mKt8W
 /ilg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVGMeTq35bEG6dM22nAG8LTBnlZXI7kDSWWnxCC4mxtQXd33CbqcpU2liRz9xP7sif3DQrAMJP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqYaFfHhEv+EmMkcXuJufbYLe+k292deePEzYnFwpKEzlQwYXC
 7XKE5XHUY7wXuRsWPOD90Zqwy7NuIrlEp8FN2dgwJOfd9L6ea49sWxPzeaPqYP1BnN7J5A4L18w
 cxBzKK0km+U+xuukOCIcKBQvUAoczJNc=
X-Gm-Gg: ASbGncu+cMdNx0pQ6+l9t3/kh4fGlb3VUcGi/i33on/rcyz+48klxiLYEd7QLp4Yfz3
 N88vbIg7PJYoCRxmoiFnhOnEGTnULHYO+CKKXGuubFXW18RGoH/UufWs/FWb4iNF2SHJ+cFvxp+
 T/rlAAfIv7/zs14Cov4SSBo3nae7kB3eudWFaU1w7VT/Ger8GpVaKKO8AkE5ECr7cwrsysjhwx8
 zQ0DqAH808vzA8dzXIl2i4g7OkjL0Ap94iYDFZ4wu2F3mv2gipDMXOXZ6wMWXBef3jmY5uerOj3
 ArZA9mDqtA3YlnKvP2h/vdNF6LX8ymRkT04b
X-Google-Smtp-Source: AGHT+IFRSGavmihE0jeFmf3/2ErrEQ7lVZdNPzc90R+azLE4QPTS7uO3XKCP8dBGdcZnR+PQiMPrb7CuZa2GRwXI02k=
X-Received: by 2002:a17:902:da81:b0:258:a3a1:9aa5 with SMTP id
 d9443c01a7336-269ba26087cmr64556325ad.0.1758454928589; Sun, 21 Sep 2025
 04:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com> <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com> <aMIqGBoNaJ7rUrYQ@yury>
 <20250916095918.GA1647262@joelbox2> <20250920003916.GA2009525@joelbox2>
In-Reply-To: <20250920003916.GA2009525@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 13:41:55 +0200
X-Gm-Features: AS18NWAEK_G6m5-8BL_C3aor80z6U_cj8cDpyNPkB8wcxKLKwKj_z5k0IO6zsJc
Message-ID: <CANiq72=uycGrGAVH=8KjVQ3e-P_-B0c=_mUBa1__sh44eiQ3=Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
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
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
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

On Sat, Sep 20, 2025 at 2:39=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The C checks use BUILD_BUG_ON, in rust-for-linux we have build_assert but=
 it
> is fragile and depends on the value being a constant.

What do you mean?

`build_assert!` works essentially like `BUILD_BUG_ON`, i.e. after the
optimizer, and does not depend on the value being a constant.

You may be thinking of `static_assert!`, which is the compiler-based one.

Cheers,
Miguel
