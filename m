Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E52CBAF10
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FBF10EC56;
	Sat, 13 Dec 2025 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hy0vKzBs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A878910E0C0
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:25:31 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-29844c68068so36702665ad.2
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889931; x=1764494731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
 b=hy0vKzBssqKSMGRVc8GAamMNxp8fapNwYBKhDoWFXMY4zlW94RXT8vc8gYPLniqRgj
 jjN1Akp/f69FX705P91xVqn+BiGVmYxkwA0mw/HOeI+A3mfhGjKxxUFYBenEjy36Oopn
 bZ57einPSh95YDP3Rcfg/2mAHLzkYhganq8UkHS6ozO2fYxfbszvgBF7uaGAx3HyA+u2
 KTsbLMX+TXBo6rYX6hUWjklzr46YHuHyOC0gP8Th8CN5VYFCcmW2hSwmIsmcFQxzs7Of
 247WUWYQt2GZaZKjXWu4PZrpadaX7GeY8/WWTei4WVCnteMIUQbxfNq3G2gNFIfptU3K
 Y0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889931; x=1764494731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
 b=oSPXawJWW27pgCVYJN995D/I1zYUyrXnidw/IlGg26f7Rx5bjK+kNDSgmwbvW+RoTO
 myIvM5SJowRMZLySoM8gNYzhNIJQ6sIbiJbncv4Euh3agb7H+ujalTLw+ZL704Fbda2E
 hQg1LMUauPQq7JOYWuGyF/U4s2HdRAfYUHV543qJFpQQ+1+ukM6wFzFuWz2x+bIc9m6b
 bptZFdVVGIVcspbWD7mT1cdIcpTkdUFIaikOC+NTBT691Ojsigv1w7WjNxDVKI8rREHg
 FqFmobGTkZk0uivjgHFerzpn054DGrGhEHbvwX3SDFpOz0x0q9IydtBm6oyZb9Zo62U1
 lIyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGBjnJ6Dmwck6m5Y1nYY9CV+Y0AvF08v/ZxDorllSbJhhnuF6hdxd2SKXVO/1plfjYYIn4q3v2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6XkuHJOh0sZ0DmL4LfH9X5AeMQJELSWvWXVrV1vP0ueeEh2jI
 vNmePBRbiKmgUj+XJHCYDU2TefkrZj262rhvIwskd+Q7FRI52lhVbw6a
X-Gm-Gg: ASbGnctWhV0ZbP9W0UcrZVhBjCRPkv3EjBQIOekzR1hBxGq2ZUktEWfDy9pMtqFFuLA
 04kwQMhtqgL/wXRexZMKv8fJha9nGYmsqjS9Y8m9lnlF41wUrwrVNsk1cI6gibaqWmQux5w20j2
 fnBzj4ym/bHtt4hQ+vB6+wShUkdDg8rcdrcIVC4bb7L6cBzqZkXRqe3Baa+f1w/3EUH5SPdiJlu
 IowL9VL2AmqZkgUY0fNTZXrM8XEsrxHgyHHYeyEySqtGZF8hsiUFpGSoNSvRpLLlTNK5WFYB8XS
 0I+3VWTszCz6Mslv5D5B4BAbFsoFW6jHGeTXCocRTUDzuFMpZqpqs3NDzXjKFQFGmQZJmAN6wGK
 4GwBhw/UFz5zzfC5YnpuNcoEQVQTI0WL1FqNy/k69TZIParQg65Rq+TsWupv4H1B38YSxv7SYtw
 I+hnk1J6edEpCBytrQQECDMvw16g==
X-Google-Smtp-Source: AGHT+IH0c6lqi1+YOT+atVR2GQVjdlkn5EPFXDoVAJCKagGeZwAimktqjcIQnMFOvKx8Iio/IO02PA==
X-Received: by 2002:a17:902:c946:b0:297:c0f0:42d7 with SMTP id
 d9443c01a7336-29b6bf5f050mr110076125ad.41.1763889930982; 
 Sun, 23 Nov 2025 01:25:30 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:25:30 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
Date: Sun, 23 Nov 2025 14:54:28 +0530
Message-Id: <20251123092438.182251-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

This series updates the import sites of `ARef` and
`AlwaysRefCounted` in the Rust kernel code to use `sync::aref` instead
of the previous `types` module.

The refactor to `sync::aref` from `types::` was introduced in the commit: 
commit 07dad44aa9a9 
("rust: kernel: move ARef and AlwaysRefCounted to sync::aref")
link [1]

The goal of this series is to complete the migration of these
types to `sync`, as discussed with Miguel Ojeda [2].
The last commit in this series removes the temporary re-exports
from `types.rs` that were originally added to avoid breaking the
build during the transition.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440
[2]: https://lore.kernel.org/lkml/CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com/

Shankari Anand (10):
  drivers: android: binder: Update ARef imports from sync::aref
  drivers: gpu: Update ARef imports from sync::aref
  rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
  rust: drm: Update AlwaysRefCounted imports to use sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef imports to use sync::aref
  rust: kernel: Update AlwaysRefCounted imports to use sync::aref
  samples: rust: Update ARef imports to use sync::aref
  rust: kernel: remove temporary re-exports of ARef and AlwaysRefCounted

 drivers/android/binder/process.rs      |  2 +-
 drivers/android/binder/thread.rs       |  3 +--
 drivers/gpu/drm/tyr/driver.rs          |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |  2 +-
 drivers/gpu/nova-core/vbios.rs         |  2 +-
 rust/kernel/device.rs                  |  4 ++--
 rust/kernel/device/property.rs         |  5 +++--
 rust/kernel/drm/gem/mod.rs             |  2 +-
 rust/kernel/i2c.rs                     | 10 ++++------
 rust/kernel/pwm.rs                     |  3 ++-
 rust/kernel/scatterlist.rs             |  3 ++-
 rust/kernel/types.rs                   |  2 --
 rust/kernel/usb.rs                     |  3 ++-
 samples/rust/rust_debugfs.rs           |  2 +-
 14 files changed, 22 insertions(+), 23 deletions(-)


base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
-- 
2.34.1

