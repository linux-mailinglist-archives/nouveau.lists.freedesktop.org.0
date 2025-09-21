Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BACBAF88
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E0D10ECA0;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="NodQgKxP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6510E06B
 for <nouveau@lists.freedesktop.org>; Sun, 21 Sep 2025 09:59:19 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-26808b24a00so6384775ad.1
 for <nouveau@lists.freedesktop.org>; Sun, 21 Sep 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758448758; x=1759053558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
 b=NodQgKxP8s4XG85Z5nuFoQN9gso1SpDNaz8Is0GPlUW/l2O6C7EiESA1ztWqLKYeNU
 w/MpknwFRo1enhNgvrUDRJkEwXu9Gkll5ZLHWyiObklmwbxVOVbzRDOjLMdoZn5Qgwb/
 G3afBuZDJPoTjLbN1IjXyqXNVfgjJjxttdXo4AiGvqen/nV/tyQdzcwT3yd3rPw40G87
 NqaN+9AxpvGwh8MdAJaHQ8MjzqqeOblJtq9tZMA2cgr72xVVlHw1gUK8/hpdgP7bng0m
 2cxDWBxtBZyV4tN0YsQDYF/ZirLFqBU++hVOcbAzHwfprs2KiMzLM/T2WekZq4IQeekF
 Y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758448758; x=1759053558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
 b=QYq6njz/tsc+uFzOvi2R9gvjmdbiHCCXiYuXgNKOD2v/mThArRQQKReU2djfenkRu4
 vH4NEbhP8acaUwQm0RHfN7WJjo/tA3totoz2fP684PmTdB71h3srBAGcfVZ6x456PXvF
 u36Ft3K22bbBmQzyTeDLchZZRvx5Kr54cIO9HrntvT/i885XPJN8bAglI5BLXq+FDdK7
 6HDzZRCs3VShGBDWJGTwINLXc07bhj2B2vK7VOuvt964xhXJ6F7BPOMYYRFdI5H/fIQh
 JWWsQGZs5pzf0XMVW3XAnxbXXURwqn8gLFSQBIX28m1PEQrFbc3/RIuDMom1iWGLPXzE
 aFqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULvttliorRf0XB3t4nsWbeWR2V2h75kdreEj/yvXy/KUazrzkV4BN0Tb0qFKhw7RZQ3T3HycL8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlZvK33/ejbgOxHvJUfL+BCOp2FTrwDMZ/cIrCoRti24AbVBKB
 QXrj/CLKW34241om8WptkeNKtlJQQ4faTofDNd9NdPAcRNBrTTTuaz9/TmX5q7CGdtAiMs3dQiE
 1nfJzqX5d30Pv+eV57agh5aFNO6o38oI=
X-Gm-Gg: ASbGncvbStYN4e8buGxRlOpDhbyEkVxVCMvvyRBOMBKp07vT/BsKPJPItKslbMkvymi
 F0Amrxms8Ree6Db/qIHNu4aWkv6f+vOUBvHmZdUeWZKkLdiuGJl9Z56TKQFdkaO6neVZvpKWaT5
 7CqmE79lXl2uslb4KpFzx51XnneFpDXp7PeWy9Y9ikjFT9lG9UXU7xnoCgVsAWasFZn4e5cXk8W
 KkSD+pH+pGC0ZdRsYY9YtcWSLEoJNCAx8fg1I1Uwdm4wpfP1wwlNCqQEZVWmib3LPiFoEcidgR8
 WXAZ5O6/omwo+vvY7QcPeDkMF/IDe5gZd9dS
X-Google-Smtp-Source: AGHT+IE/M5n7k5EV9oBMoTKSdZYNJ8k/u28SAzpBTSTXvI/1sciYsCvywr3oY6EDALdphOvsgrpqPOmhVakNTvvKCsI=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr70599375ad.6.1758448758376; Sun, 21 Sep 2025
 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
In-Reply-To: <2025092157-pauper-snap-aad1@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 11:59:05 +0200
X-Gm-Features: AS18NWAX2coIcjtRAeKTjf4CFDI4YK6EYgm8hWO5NK1pOl2WGGAfjpcS8VVdy_0
Message-ID: <CANiq72mk1-Ew11RB0kfep5BtB8M_5H6o_Rb2MwamrZd-FmzFWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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

On Sun, Sep 21, 2025 at 11:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> And where does this allow us to define things like BIT(2) for values?
> (ok, that's kind of not the point of this patch series, but it will come
> up over time...)

We have the `bits` module since 6.17:

    https://rust.docs.kernel.org/kernel/bits/index.html

(Or do you mean something else?)

Cheers,
Miguel
