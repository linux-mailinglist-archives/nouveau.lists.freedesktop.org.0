Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A662CBAB86
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5AC10EAED;
	Sat, 13 Dec 2025 12:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEvSJ2eS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C970D10E369
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 10:42:54 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-26987b80720so10377705ad.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 Oct 2025 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759833774; x=1760438574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
 b=WEvSJ2eSxSMWEij/zUfx3j/+82TVDLsFs2CLHAHws2sqBFy3JOSBvEt6V1Z9DcKnyj
 IwOF2sedKqjABewEqURwmz2YNULgbN3tCkNCrB9Qmzss+6oAhuC9hUnJFS0IsQTkd1Y1
 4yYs1dIiqwWuCNmWO3+kIg3L46K7icJLDJF7c47vwfLkxTkwA4DBKahOcTDPxW1jqD0p
 taw+pGeku7ARWwcpAs3zkOz0PKvaj6tRh3YS/sv1Ixl9X2CyWtvbOSlpsV3jzsHzlr+f
 giM+8bfOFKkv0P+jsuKq/ONdVkTrZd2DTPL9rRAGEUN+loi0ehpij8lb5WijouHGWGqt
 2pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759833774; x=1760438574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
 b=q2cyI8UgAk860vgFeS89BI7oN/mUiw+kxwlMKKllOK9YB4kRhjOynaP0DJ/+0SjtJP
 bxDFV9p3A2vMCnzU/9jovLaPiEAK4bsyAp492iOwaUrg5jnrQeiM/rW3KW9icGf3tLMl
 F0GLU3UYekTpBwooBLSEfK6UL0qXgBpJBG0sHPNfQ3gNdvOE/fGLXcVui1FbxDX9Msmm
 a1A8UxkJGeKBgJMSdYPJcx/9Tmc7L69rPRtMbFIW3nOyBbD0TPcWREUjfZDG+x6RwqfQ
 3IsH1HCpV3L64xfQGwEOCEab+gXyKlL70NIbtjxi9Q3kmrqDaUtvW4AWWHDlj0D5ynxK
 LSrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU71EKT8508HDrW1Xhuac9WRLwZC202wcKTeCcGWDeZvzP7LzgRYLrQgLMFhSjtXIZUNcpCjbwA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCbzOyiN9TcNpzfwL17bye7JwjMdNX0ZKWJ53NaevHGTSY6cIP
 u6qlI7O80FJduHXkTF+Bo7NAeFVtzSClctYhvQe0cBrgnz7YaIODtRI+9b8+Jk45HKjfO7UFWh+
 cyZKfunIP/Z/mgG6Qi6HlP8Wpfzou/Xg=
X-Gm-Gg: ASbGncvI/vSdQ5tug27tKrALKBm6k7s4K7z7sUdIfjqcN8ncOu7S2+QvbQadWYCxom7
 VPmvjlVgVSrcPxBSW6pslY5jR9InKSGuS4tWS+Wlg662s97m9GjplEAc/ow7L2N1CYOza1MfzVZ
 xv9BX7Esy6Bl2EJy8EVomQ+yBSqksNhlAd9vxoA1lboDuW081cIkrCKIZHjw0AKAqZ/S7b7g9Ry
 NphggpS/LGmknKp1oVRG0v4ICvenENEw2AevoUnhNwTUDOLcfHC9zv5lI/eT1is2nAARMBCwT3a
 w2tPKbv1RMhmV5xDJ1/V+etnyjMFYO2opfeamFHGNZReiZFaXw==
X-Google-Smtp-Source: AGHT+IG/tceer4xDFHi1fbtvymQWQEX0cfdjfz7qa3VEV1S1lLa9ROogqCppnvlWvrXrppWg7CAeyI7raGFpenio+L4=
X-Received: by 2002:a17:903:1a68:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-28e9a5a2ea2mr112471585ad.4.1759833774205; Tue, 07 Oct 2025
 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 12:42:41 +0200
X-Gm-Features: AS18NWDpvGktuowJke8BSxfgUaurFD3miGBpRkLVS9T4zoCecLy6NtllLzWGBNs
Message-ID: <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>
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
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
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

On Tue, Oct 7, 2025 at 12:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We can assume maintainership of this of course, but is there a problem
> if this falls under the core Rust umbrella? As this is a pretty core
> functionality. Miguel and other core folks, WDYT?

I think what Yury may mean is that this should get an explicit
`MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
agree that is a good idea.

Thanks!

Cheers,
Miguel
