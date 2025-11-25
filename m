Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87CC8500E
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 13:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD51E10E3CE;
	Tue, 25 Nov 2025 12:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bPXYu7Cp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5427510E3CF
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 12:39:50 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so51939085e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764074389; x=1764679189;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ojWe1b8r/UImKNNJCHWtNLHUmExFFE68AIjW9wlYavw=;
 b=bPXYu7Cp1PP2vrLBIGLHjP575h/MTqFcGyljrmJl2Ug2YfOrmqEEdbgndq/qDiqKk5
 QZ1JOyzkCFq5rdQYTyHA5QaZ5Jj03x94wE1ebPqUEsJutHWpaKKL8WEsXI6+fe7YwywW
 nr0WHDBA+F10hZPAapgQrg2xvgZVhvbhmH5sQOfiBQlelsfP1XN6Gt9K7U7fqzmTM65L
 jTaXBj4ybtMXbZl6I56vOr4g7/9ocRgYmYQj9r5sODoW+dvY4yE2aoL6mXt3B4Mu6Y0N
 wySQe6JoALEi8cHtDj+f+ivNs+pBRxMHHaMXpecQEnaFKCC7r3SnuRES3taO24bY6UgZ
 j3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764074389; x=1764679189;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojWe1b8r/UImKNNJCHWtNLHUmExFFE68AIjW9wlYavw=;
 b=wi53iwfJTPlb4cXU2ZGW/Iw0HUZ3geqSYG+PM3mhIUa+olaPA0p0KXnQafZBavR4Al
 EPkdQTJgSHCZJtDXZ4YyA+DDmxJAZM/aBbIbHbylB+hifHgGhhWlwLyFgz4/ac//XGqy
 lZiEOZjUXHuDTZgRcYZ89klN9IlgaGX+w7BzDT58b2nkBuc516eWoUXav21pylUXj/Vm
 NP5H4mVrnHeNy+mYVIgpuoGhUPuAOSGFGbPSFmmmN7jO/sBr1u26PL6GCcx0LMU/kvLg
 x0z1znK+ZgPlkAzLwyMTNtEDiLNEr6GBeGcFJXrJa5ltCEoGNNl1JoyCqRo23IstwZT6
 eWMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlqQ5BQlPJNkwtbYE/+hOcvItQvAnLoRIc4yDBXErhUANbNWh6QFiwAV5zo1etdc/NFSauuaoJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/uf98VNvPFHhplmYV2OAfWGW6EFlAw79UKfCaN3LNA2cErdrA
 Y7+clGFKsJ+iCTAvA7LXJDkEmjvXK195sgf1QWh3zM87ALhfMTm8IXzRz9KYomaDlQFkM5+la22
 dBggoqyP0u4RkNGtJiQ==
X-Google-Smtp-Source: AGHT+IGGYXbl3NW70HoCq1BUicduv2r9uYzD+uC5Jcg7P8rx3FquzssE0TqvF8nfpxyfE19H4MBFZ8Ly+NNtPC0=
X-Received: from wmbc14.prod.google.com ([2002:a7b:c00e:0:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id
 5b1f17b1804b1-477c10d6fdamr159756165e9.10.1764074388898; 
 Tue, 25 Nov 2025 04:39:48 -0800 (PST)
Date: Tue, 25 Nov 2025 12:39:48 +0000
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Mime-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Message-ID: <aSWjlJFD6SVGXBqE@google.com>
Subject: Re: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
From: Alice Ryhl <aliceryhl@google.com>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Sun, Nov 23, 2025 at 02:54:28PM +0530, Shankari Anand wrote:
> This series updates the import sites of `ARef` and
> `AlwaysRefCounted` in the Rust kernel code to use `sync::aref` instead
> of the previous `types` module.
> 
> The refactor to `sync::aref` from `types::` was introduced in the commit: 
> commit 07dad44aa9a9 
> ("rust: kernel: move ARef and AlwaysRefCounted to sync::aref")
> link [1]
> 
> The goal of this series is to complete the migration of these
> types to `sync`, as discussed with Miguel Ojeda [2].
> The last commit in this series removes the temporary re-exports
> from `types.rs` that were originally added to avoid breaking the
> build during the transition.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440
> [2]: https://lore.kernel.org/lkml/CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com/
> 
> Shankari Anand (10):
>   drivers: android: binder: Update ARef imports from sync::aref
>   drivers: gpu: Update ARef imports from sync::aref
>   rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
>   rust: drm: Update AlwaysRefCounted imports to use sync::aref
>   rust: kernel: Update ARef and AlwaysRefCounted imports to use
>     sync::aref
>   rust: kernel: Update ARef and AlwaysRefCounted imports to use
>     sync::aref
>   rust: kernel: Update ARef imports to use sync::aref
>   rust: kernel: Update AlwaysRefCounted imports to use sync::aref
>   samples: rust: Update ARef imports to use sync::aref
>   rust: kernel: remove temporary re-exports of ARef and AlwaysRefCounted
> 
>  drivers/android/binder/process.rs      |  2 +-
>  drivers/android/binder/thread.rs       |  3 +--
>  drivers/gpu/drm/tyr/driver.rs          |  2 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs |  2 +-
>  drivers/gpu/nova-core/vbios.rs         |  2 +-
>  rust/kernel/device.rs                  |  4 ++--
>  rust/kernel/device/property.rs         |  5 +++--
>  rust/kernel/drm/gem/mod.rs             |  2 +-
>  rust/kernel/i2c.rs                     | 10 ++++------
>  rust/kernel/pwm.rs                     |  3 ++-
>  rust/kernel/scatterlist.rs             |  3 ++-
>  rust/kernel/types.rs                   |  2 --
>  rust/kernel/usb.rs                     |  3 ++-
>  samples/rust/rust_debugfs.rs           |  2 +-
>  14 files changed, 22 insertions(+), 23 deletions(-)

I will pick up the DRM ones (patch 2 & 4) once the branch re-opens on
Dec 15th.

Alice
