Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F01B3185A
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 14:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1E10EAF1;
	Fri, 22 Aug 2025 12:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IJHf3AA1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1250410EAFD
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 12:52:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1b0990b2so15693355e9.2
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755867164; x=1756471964;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
 b=IJHf3AA1D9ZIV7tvZaXs994VSNYxfMQL1ERqHNJZSMnP7rRA0pP4K8g5pGFjQEPLu5
 2NvN4ErHMF+7e2NbBEVcDd5lH9OqC8RF1BZ7+gmcpYa23LudmV8T8EHHQPYORmyFmcKT
 8oUurgr3RXlU2ixvtp/ioZmloT0mREQvhPlw2GsaZL1RKV/VbhW/juuCuzM6/V2SIMSp
 36yjr1J5IjBzT/ah6aLu6f0sinrk/g6Fr5pJvtaSmNph43dKUoM3AYMcTLN5KPBuci1R
 2IULm+QmhDHgfYCkmjuy6kKXJnMeGgogEcvQmEAPqZ5kTTm2e04TUuO/htfWLsYxKY6S
 TsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755867164; x=1756471964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
 b=DRFxWziGseSAYf2TmNvuA5LLMOxSNSCHpVNEjOxY/KL80RVO2AP7ymJMCnI0bzhk8F
 pPzl1isgH+cgRFRFciVkkcogZ5sPD2tqK8+f+3ugKWNGS91Mhj7xmIB8aCoPa6eGXfMh
 gRuuGc4XOM55xNUuPWXoF7szGixM6FpiG8i7Ev4IhOhKZCBHTxM3ugizvgqiAiaYxsHc
 jHBC6hwv1dYv3+OhHZZmy6eJ+uL48zFD38W9u7K5ZR1aGLNfPYv8qWSNiDoW9SDX3O6u
 oShQcDqmBMQ2b5ijHjYR5AKT6KCEVS8F8x/9L4pqYt/JFd86A/apd4LwmCWrfj/xRIRF
 swxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJjdr6dHkRN0zJXzOpU00u6z6czT57WjK6gAOhZjTgP5/qKqYXliQ3NiyLHO38g9phPof86ZBs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaUKs5qsmeR3wc4en4VQcgN91i3EDz8OscZzN6ZSYlD/sYQt90
 6+RHEe3m/eLvl56Y2tQFrZOLOzpvvbZRR8bOnK3ewwvWIqAQCKJlHd8OSq15G4xpal90Magx4iC
 CbNZcnHo8s0ebZD9QCMWBUUOpagYLHe1hqHoXHgav
X-Gm-Gg: ASbGnctdJ90jND7kjGLfF6rkXnPkPlLRlaRerMzJRXkgCzdakk6ZUfsXpvu9k0Xow/l
 gFLfpxZPM4Uy78TrMUzWgpoip/8obrPZ/TWxKyUWfbxqyPP+M4C0/Lz01Alejn10XGv7Fh+/i9E
 4csNEFYpUyHpD62P2DFV3GsXJBZvMGNKu8e5Zcwobh29xghxnspVJr0Ue7qMbXt1YePJxvR/hhd
 hjZOKxWS3qlZ6MPyKJzH7KzIdjghLsTHeq1TSFedyZPD91cPfKFVeu5g0iDRJymTOfkU4NmhA==
X-Google-Smtp-Source: AGHT+IE7Y0lQvf5r/Ym72waDaFduU5pis90P/Y8BoW2WQ2ZgXRN4nLW4iRYkwU9mYPjzWGowKlbiftsAubogUD/WtkY=
X-Received: by 2002:a05:6000:230a:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3c5db6bb8d0mr2118466f8f.26.1755867164304; Fri, 22 Aug 2025
 05:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
 <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Aug 2025 14:52:32 +0200
X-Gm-Features: Ac12FXxHtvKHWX7r4WBjHUgk1Fpgkh30TWxJenE5FBjdNdkXpbTtw7CFj3EHlec
Message-ID: <CAH5fLgiXYj0f0UEPCTjDgykjX3mFo4hf9SUswRYwHzh6Vznwtg@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, Aug 22, 2025 at 2:47=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> `FromBytes::from_bytes` comes with a few practical limitations:
>
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.
>
> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
