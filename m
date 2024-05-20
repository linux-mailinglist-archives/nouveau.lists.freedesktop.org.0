Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B78CA130
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2024 19:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2D510E490;
	Mon, 20 May 2024 17:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gCZSbOT+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C9010E490
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
 b=gCZSbOT+Kt39Kf4iNuzTn8UWyZtAKzTyHVUDEqDpYoi79bW1L/OpRO5mtpW6FGJXnQE5mI
 kfuabkYT+JNu5/1M4DEkg6WZOM6sZmD3V1MzcUVo0sxV19jdVzvYLcW/V7IYKUKFXhx86W
 OSn8QExnMELFEHrsXK/Xhn7AHkBm8E0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-FMrN_bsHNJ2ie-cn7qiClw-1; Mon, 20 May 2024 13:21:09 -0400
X-MC-Unique: FMrN_bsHNJ2ie-cn7qiClw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41fc6a4f513so60432015e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225668; x=1716830468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
 b=LRaCKff9N9zTU6OuMLKLafQE3EvihqY76ymFEIt5QpeyFInQGU0CvsFPUR9Q9zEHMX
 l5voLeefbv5ZPH9x+XYFWKi/Zq+Av0kTXDkICeX6we99Z44o6kVtvv8YFLm26jQtNbxy
 3Kxber7uvQvcuk65L4J6Hu+BXyzasadbGsyx97zPLbz8Jme6/5k5HjJefHTEPDsHveCZ
 kqouDsDiruaxp5JyFCsjmexqrOv/pNOGuKTZmgN5ufvbz6HCihJpbA2JmdJDVMNX+XiO
 alyYguEqEcED3Sq/rR7vgdlwj1spj6xbtSaGMGRFmY4o/izJEsTfcNXBOTDM88ZYfrIK
 HdQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeGNuLxozxPn3A6E9eoAm4iRDoLAPfrmLEDjwO15cY+nqqHjLomAp0eRhNH91tFcMANsgOFSazOPKgsrTwp6HjSPczMuAdl03GKsSCRQ==
X-Gm-Message-State: AOJu0YxsbzyOxcYx+kun82ip2cYEwT2+KGcCNLqn5MAzhp8I4/0/KOjx
 65H2/6ftgKN8op+ptmtTv23crFkTnzy3Z+6suQQAeUQlpLNh+/KCmtj4pWkNx/UdnyCdPMA6j+D
 Hh2HPqgEdO724RnHloalvmTes4MhpqM+V2+8NX0Q0ZHAb+b/zaMOFNAKVpFIUqYw=
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr57894695e9.9.1716225668274; 
 Mon, 20 May 2024 10:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhCFvLZoaDI3iSTKmLdqM1qyoeVh6xl/L8p8pe/aTnEVlkPoxeJ/ek4U0dG5zhg8lX2LhW0A==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr57894335e9.9.1716225667729; 
 Mon, 20 May 2024 10:21:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe36f373fsm407299905e9.20.2024.05.20.10.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:21:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 0/8] [RFC] DRM Rust abstractions and Nova
Date: Mon, 20 May 2024 19:20:47 +0200
Message-ID: <20240520172059.181256-1-dakr@redhat.com>
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

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (5):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: Add Device and Driver abstractions
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (3):
  rust: drm: implement `AsRef` for DRM device
  rust: add firmware abstractions
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  11 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  | 110 +++++++++
 drivers/gpu/drm/nova/file.rs    |  71 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 172 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  20 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       |  95 ++++++++
 rust/kernel/drm/drv.rs          | 321 +++++++++++++++++++++++++
 rust/kernel/drm/file.rs         | 113 +++++++++
 rust/kernel/drm/gem/mod.rs      | 406 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/firmware.rs         |  74 ++++++
 rust/kernel/lib.rs              |   8 +
 rust/uapi/uapi_helper.h         |   2 +
 22 files changed, 1761 insertions(+)
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
 create mode 100644 rust/kernel/firmware.rs


base-commit: 4a67fc8e2330cbd57b49d8ea703ffbf7292ef828
-- 
2.45.1

