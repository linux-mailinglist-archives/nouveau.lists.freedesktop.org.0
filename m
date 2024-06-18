Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C890DFE8
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BC210E213;
	Tue, 18 Jun 2024 23:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BNCNh0AR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26EA10E213
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
 b=BNCNh0ARcGdIkhksk6hKKpRP0uDyPSAsQHGGXjkPIyjvc4n6KtdJ06CFq8J5Y5hS2hwmvQ
 Bn/nvryeXZVGxHLh63BZBF3VbtH3vOd3b6erKx+CDIUleRJLoaixXmwa68q57MSrANZMlk
 N7mbYTH9aoBBhpzl9UEHqn980KWGvG8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-dQU_KxnQPoipQjpI1B2xKA-1; Tue, 18 Jun 2024 19:33:32 -0400
X-MC-Unique: dQU_KxnQPoipQjpI1B2xKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42108822a8eso1387025e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753611; x=1719358411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
 b=v3ikionmOCwCmmTbSj0JIdHV66Hi82xQ6X3lpIZ0vnVmz6DYH72BNeLLUFDUAuZ8Wq
 3F1Whdmy4l4evcqWvO5MbQuNBnu4fQZ4rG0/DDIpSHyplWNXd+FJLRmteISKE7Plnvvq
 IXhNZHGriMuwYpE4f+7NMDPZQsc4Z+iwrsH5pYL5VOl9MllStdj5LULENwvwXZ23e3kX
 xpaUAgkZG9Nzod/9Owsnjbd3TFBv2B1FdYJKla3UOmYmBbVEnjes2lw6HWFH4kSyAbP2
 Q8crvUw5iIs6IHBrAb/smQx8Gv7lQveJoD34pbztChDo+Vcrnoq6ETGHqb303GNL4F7n
 M4gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrd54uTbWtO8ndBjznAQVOt9NVfN9oCubuoe3wDNuTxshHyO196YA2L86I19Fodj4FMipvJsWGvG4tPxhI944cEUEiTzwo9L0XEM9MtA==
X-Gm-Message-State: AOJu0Yx0c0UfZH6KQbY0FDzGpkpA/9sqFfOQRtws4npplHiigJxYQYEN
 KoE1EDCGS/s6tpTP4AhPZgU4UmqPfcoPkPM6KLup3XV9F78ZMiLSmecNN6xDV8Uasz3B4hBU57i
 TqlV5HaWWhU9ao1sj1K85kmKpOU6LatOt/LDozqsP/B0uSn5yhAVT/INKmEuYXJc=
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-42474d1ea69mr11067855e9.10.1718753610851; 
 Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkDTEXBpqJptvcXNzTpmzKVYUnQPN3GfP3sjrNY2yNnULq62acJnzYZiRMKe8J42NVExH3mQ==
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-42474d1ea69mr11067625e9.10.1718753610465; 
 Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de646sm246271855e9.35.2024.06.18.16.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 0/8] DRM Rust abstractions and Nova
Date: Wed, 19 Jun 2024 01:31:36 +0200
Message-ID: <20240618233324.14217-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This patch series implements some basic DRM Rust abstractions and a stub
implementation of the Nova GPU driver.

Nova is intended to be developed upstream, starting out with just a stub driver
to lift some initial required infrastructure upstream. A more detailed
explanation can be found in [1].

This patch series is based on the "Device / Driver and PCI Rust abstractions"
series [2].

The DRM bits can also be found in [3] and the Nova bits in [4].

Changes in v2:
==============
- split up the DRM device / driver abstractions in three separate commits
- separate `struct drm_device` abstraction in a separte source file more
  cleanly
- switch `struct drm_driver` and `struct file_operations` to 'static const'
  allocations
- implement `Registration::new_foreign_owned` (using `Devres`), such that we
  don't need to keep the `Registration` alive on the Rust side, but
  automatically revoke it on device unbind
- add missing DRM driver features (Rob)
- use `module_pci_driver!` macro in Nova
- use a const sized `pci::Bar` in Nova
- increase the total amount of Documentation, rephrase some safety comments and
  commit messages for less ambiguity
- fix compilation issues with some documentation example

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (4):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (4):
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  12 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  |  85 +++++++
 drivers/gpu/drm/nova/file.rs    |  70 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  18 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   5 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       | 182 ++++++++++++++
 rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
 rust/kernel/drm/file.rs         | 116 +++++++++
 rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/lib.rs              |   7 +
 rust/uapi/uapi_helper.h         |   2 +
 21 files changed, 1630 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/gpu.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/drv.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs


base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
-- 
2.45.1

