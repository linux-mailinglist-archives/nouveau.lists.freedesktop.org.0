Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9473CBAB6E
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6241010EAE9;
	Sat, 13 Dec 2025 12:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="W43ofVqS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E3310E433
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 14:38:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-27ec3db6131so10873775ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759156706; x=1759761506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
 b=W43ofVqSnrumy6nxQgZIIE94r9l6wH588+eChhCM/M6oWcSKt6AYViJAqj3bDRQ+FD
 xTmTReii+ly8VKsJnbMbDQJIcCdEbCIUgOdIHv5uTzKX7QttXym0bSC30juttAKUL3Cq
 0NkgZpd4kK+X+shRyZaAwK6jAC1un49GKC6i/6r1fCvtJvYwN+aBf+CYpJ+XnloG4OFf
 KSIXDvjXcDxqGkfI4RDmj6ugSu7GSlbhURwP2+DbUbpL8r5NYFMXa96bDke2JiUUY25R
 1zE3N/mRSlj8zvxbsgDvoJhnxVQUDPuFhNKWqurU86pENK9k/Tr2GWhTgdq1DxvH6ub1
 TY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759156706; x=1759761506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
 b=BBCXI3tNx5xk/nhte+ChNWyyxSRaEhVpY6MlYkvPNBMT8DI8GcJGnQUR8jgdWTngQC
 Ske5lShTTSDa65bJhvm/hHYDfgV9MgcbdY+Ys8dnyOfo3a2ZfizEPi+lrmmKzpGwpZAK
 XFzqcXaiAIWlurFIkFp+zcuWWdwJG+cK1VD46y7SYJZvDOQIGkaZOzROpy1Q5y6kNE5Q
 EzpL1xsi++5XIfVGCMj8Z0AHgfAQ+RZd/H1mV3veandoYK0ezINb0/UjKoTYP7benzy0
 KYll7HSH1R/VM4wpliEAB0mId9/8HotRr4fj/KCSGbsZtPzB8arxHo/x2s0InZBNDbZx
 WJVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOHWydOSXs29K+d4CfrgTrq/XGTfz/g1+HEIk211Ntwiw8s0RO0s+LZSvIUqXDXRMD8fuZKqzm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGXJTKggWurd9wb/HHlGhw0aikMqpkXtKZL7STGqqpHlzIXTZc
 Z11B7d8b44iTBFtx/2kIkuItfqOf1oiGnUcRKj3Ae3mmmoifjTj1X2uZ81Ou/+tJkdWbodMVo4/
 P1B1fKnDO/kLGO312ilIedxwvpWc4rKs=
X-Gm-Gg: ASbGncuE0+wsKd0EnP/XZL+ZrNVYEWhCVYCgZJ5f0bhAHYI7yZDPSMrXbnsI/6Li3Tl
 OyAA0FUkAVWaGhrHF6v0yqNCasoIzb7iNW6UtFN00Eq26dSCN0nE9c0fPIMpSxV0CTxIYvfPkTJ
 6BwUuqKlIBHqgSFjDG5sZ+s6jNRZCgYfiM4AjSsCMOBxOYyKEYeCe+eq/bzeZitBUJ4DyCHt9tx
 fYe6Ot/PfiEnUVxYpv06FSv93P4yivCo1uvM8Jryhd/3+0AsuP+PpQxRghGaJ4jpZZA5gK+Gone
 VPV9kuJVtAmMSMa1oMuCu8EUMWkgubvjQHtvlb0cJNwg8ZA=
X-Google-Smtp-Source: AGHT+IEuajVdRt/zkJ/UX7z6Wnp/1y6NOw3KWFiaL0wSJ/2A6J51idlMClGnkDk/Tn16oxOvOKsoW449qVwpqNver/w=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr106185325ad.10.1759156706206; Mon, 29 Sep 2025
 07:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
In-Reply-To: <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 16:38:12 +0200
X-Gm-Features: AS18NWBU5ftnpGhJqKd4k_6D7IlxaPNAUhkxayMY9q8yLGmTLeUS7TVSiAU2z4g
Message-ID: <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Mon, Sep 29, 2025 at 4:34=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I think you will also need to explicitly enable the feature somewhere -
> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
> different crate I am not sure where we are supposed to do it...

`rust_allowed_features` in `scripts/Makefile.build`.

I hope that helps!

Cheers,
Miguel
