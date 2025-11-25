Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E692DC86FB5
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 21:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813B410E460;
	Tue, 25 Nov 2025 20:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kRwaym21";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7BA10E45F
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 20:17:38 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b2da83f721so23483785a.1
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 12:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764101857; x=1764706657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5xbOi/JRw9fbDfoOPiueWSD+D+pBvn2T4pJf+V+WQY=;
 b=kRwaym21FR0SDpPU70BAAqnxMrHy7RIHn6StgkrEhagptorXLlxzjFe3aWKPri9d+o
 CHlEm60F5+j0I0nnalgxQtzmObrJLmOIa92M1ottCqgsFr7/5fUFDGiovAWyfloC0a5o
 Ch3io8v9X1EX4sZDdxkzDEH3d43CXskX0e+DDoKw+iqgq5CZISY7M9GYoBPvzU7Gjh/U
 wxq7TQIl9ta9fFtqEq/FRtxVaLriZ8ylAZcR6Sx3U+3kZfd09Hv7Np3riG8i6zMqWMBl
 BLa5vUBz163EYHdlUl06JbHN91AL5byDfpDES+lX5To6LiJNcyLxiwAoZ1LY/DSL1kDE
 j2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764101857; x=1764706657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i5xbOi/JRw9fbDfoOPiueWSD+D+pBvn2T4pJf+V+WQY=;
 b=SYUMWvl0ESnHl8rRKGl3Cwzpiw5S3qowAsk2SNqyD0p+xXvM96DpbVgXUnjCzgvJRa
 /XpzSumswdmYKqp7srbCcRKcP+3QmjroAj4znqq7BmR4BuFamywu3OZ7u0yfVRls2uX3
 KxrCuY109PKVg0D4N8WnFPFB+1++a/rFnYEfoT9EeaUaCmGCGI8xPtdGI7W24pZmpiQn
 S05RIibXnZ4ZlqIDDV9qBojPLYii6iTKRST+tPzBXm6FUcj4gl7qoMmn7kjhsODWPA4h
 5PYWdTFuOYoNbXof2QGuEz8bP4GQsc0TnBPv4HJ5T/KjP46ba7lg9HP/LZZPDLuuFG1u
 Dc9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHZ9ScFiRH3PMWXT618YOgWvyrL5iOapbnuNwbBc0Zt8UXjXBHAMheTWZYOFlRwRMZog3jGNa0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV/sWmrLtlsfzz6WRl/i+PqDxfl34gANcU+JGxOh6sI/jdnKov
 gE/Q7h8+Hb1/kq56eEA8h0Nth7FnSRPMQm05bCed+fl18b+Z4db/CW6nAOX3xs1Raozf2GLR3Md
 D/S25o/2GLs4RGZYpvdWt3GRmgqyFZY0=
X-Gm-Gg: ASbGncu7th0o+JMozCuGi1hJW53rjwcQXks18V9x7PpDu3C9M2GCNSPjDPmoK8YEktO
 vlAKgubVWP6L1xJiaVm6jDL65DAn9Lm7Tu+MW4iu7V0zj8IeRi9pW1V27m63Ak6MgiZUqtgvx1q
 xYQQioF31n1jJMZbmOpaqX/2SdBZLyGrwVPtjZiJTo49CRXyhnC5ivaVqdX1IH6qErFRNK5WU5H
 XasRFMQ6p4XXsFa8ZQ+uEPV8fYZ1UDEAfwq4bRlqPV3JdH+Oy7/OqX8PZxeMJjK04QJRz8j1AMZ
 Rdlj
X-Google-Smtp-Source: AGHT+IHkFdHWZaY4LOLQkKFmHBql2cXu9IqsP0TX4ELpOPpCajUvQgW7eqKX4cHfwlYxtJIqgi3EGKK4Y8sqki2XcH8=
X-Received: by 2002:a05:620a:6910:b0:8b2:faa3:5639 with SMTP id
 af79cd13be357-8b33bc68daamr2220226285a.11.1764101856982; Tue, 25 Nov 2025
 12:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
 <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
 <cc0db376-6cff-45d7-b3a3-d13be664700f@amd.com>
In-Reply-To: <cc0db376-6cff-45d7-b3a3-d13be664700f@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 26 Nov 2025 06:17:25 +1000
X-Gm-Features: AWmQ_bl_uhqER-0YSILUF1BfRs5LdG2TEdIVo4_rhtDFefamEG9auPeZIzRmvoQ
Message-ID: <CAPM=9tx5neQ=TbmK+2eAO=O-XW_67VhOGO-791kqyVDJEpTA+w@mail.gmail.com>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
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

On Tue, 25 Nov 2025 at 19:15, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/25/25 10:08, Dave Airlie wrote:
> > On Tue, 25 Nov 2025 at 18:11, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> >>
> >> On 11/25/25 08:59, John Hubbard wrote:
> >>> On 11/24/25 11:54 PM, Christian K=C3=B6nig wrote:
> >>>> On 11/25/25 08:49, Dave Airlie wrote:
> >>>>> On Tue, 25 Nov 2025 at 17:45, Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >>> ...
> >>>> My question is why exactly is nova separated into nova-core and nova=
-drm? That doesn't seem to be necessary in the first place.
> >>>>
> >>> The idea is that nova-core allows building up a separate software sta=
ck for
> >>> VFIO, without pulling in any DRM-specific code that a hypervisor (for=
 example)
> >>> wouldn't need. That makes for a smaller, more security-auditable set =
of code
> >>> for that case.
> >>
> >> Well that is the same argument used by some AMD team to maintain a sep=
arate out of tree hypervisor for nearly a decade.
> >>
> >> Additional to that the same argument has also been used to justify the=
 KFD node as alternative API to DRM for compute.
> >>
> >> Both cases have proven to be extremely bad ideas.
> >>
> >> Background is that except for all the legacy stuff the DRM API is actu=
ally very well thought through and it is actually quite hard to come up wit=
h something similarly well.
> >>
> >
> > Well you just answered your own question, why is AMD maintaining GIM
> > instead of solving this upstream with a split model? the nova-core/drm
> > split would be perfect for GIM.
>
> No, it won't.
>
> We have the requirement to work with GEM objects and DMA-buf file descrip=
tors in the hypervisor as well.
>
> And my suspicion is that you end up with the same requirements in nova as=
 well in which case you end up interchanging handles with DRM as well.
>
> We have seen the same for KFD and it turned out to be an absolutely horri=
ble interaction.
>
> > kfd was a terrible idea, and we don't intend to offer userspace
> > multiple APIs with nova, nova-drm will be the primary userspace API
> > provider. nova-core will not provide userspace API, it will provide an
> > API to nova-drm and an API to the vgpu driver which will provide it's
> > own userspace API without graphics or compute, just enough to setup
> > VFs.
>
> Ok, then why do you need nova-core in the first place? E.g. where should =
be the vgpu driver and what interface does it provide?

The ask is for a driver for cloud providers to run on their
hypervisors that does just enough to manage the VFs through VFIO
without having a complete drm driver or any drm infrastructure loaded.

The nice pictures are here
https://lore.kernel.org/all/20250903221111.3866249-1-zhiw@nvidia.com/

You will only be loading one of nova-drm or the vfio driver at least
in supported systems, depending on the GPU configuration, whether we
allow users to do things like that isn't well decided.

So far I haven't heard anything about needing dma-buf interactions at
that level, and maybe Zhi has more insight into the future there.

Dave.
