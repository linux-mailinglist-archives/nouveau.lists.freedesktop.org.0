Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D390DFEE
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015510E7FE;
	Tue, 18 Jun 2024 23:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CwknXHpt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5F210E80B
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jpXHd+jXOaH8DsZOi8XKN320BhvYlcEJISRJoUGPNMs=;
 b=CwknXHptwakdnf6iDDUZm+OH9m24D3dUPHMJGeluP9A8BKwR7DST6GfEQZQhPZNb4dWgIt
 B/EwTn7dfpRECZSIzVgxcF7o9oZXTHIVr8AJ7WjmQAK3LKoc6oKTDpNGjDA8EmAQK9q6XP
 rYHNt5MGUEDdHV5pFRvbHu+Fe98Ynd4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-T-d60gTaP6GTwWqz4wG_KQ-1; Tue, 18 Jun 2024 19:33:44 -0400
X-MC-Unique: T-d60gTaP6GTwWqz4wG_KQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4246cf4c87dso14548095e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753623; x=1719358423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jpXHd+jXOaH8DsZOi8XKN320BhvYlcEJISRJoUGPNMs=;
 b=SnOhj9L6C8fMhp3+9vRV5EKQcbn1la9KUJZLR+3KzwrcFQnmsaGblK8o1VcSv62f8o
 OiF+aH5WV3cDtX2wDZAiFxodAJxVtjI8nVuPql8x0H3eCS7GhIiD0fPWfP00aYEhfoib
 Rw2Z/DlZmONHIit/Wfs73MFW79vZhst7yPP900tDNhnTGM3USTzxapEFccorulj+/Hh3
 RJPY4ELXBk8/suSp8iVP5lStwMt5+7Ly4fEh0l+VMe1Hdyw+EomoAJGWxQDoj3M+dTN5
 WAzrNjnuWY7DsIRXEJhZOk4ntqf/8kbtp9R3rBdSgKQegMsapDWiFH1Rcu64zEIDxnTv
 bUwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQjpj0CoviM+bbd9aZDPDHtxp9lZ2Vb1LA0uWDg16utdaPlhZ7BcKRRi6haEYGoN3m4GmbAoZu4ZXsUei6shUQoCf4TL22ly4NwGDSLw==
X-Gm-Message-State: AOJu0YwgWzEYwhA7/8utZuwoLp6NBBzjBQvMvcBnWIcy+CQPw54glrKV
 Q5k9U7oCQRMk896+eLC4HFkGRoVM75KPQwM6nlNBTTglzIbrW6m/1VNtyFT5BYSeBR9EiMIRQE5
 ltJcfoA13SM0DESa8HP4Z3H0Y56BandJ+iHXnzuJLoVYtcoAqLmOciQ5TZdlbPGQ=
X-Received: by 2002:a7b:c31a:0:b0:421:f68f:a144 with SMTP id
 5b1f17b1804b1-4247529c55emr5094935e9.36.1718753622771; 
 Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK+B+d6Q+UBC0SuUD/NJqwziXMqMYTgFshtNZO9KMt8w0uzmrD33Wu68wj0NfFBPKPshI+mA==
X-Received: by 2002:a7b:c31a:0:b0:421:f68f:a144 with SMTP id
 5b1f17b1804b1-4247529c55emr5094835e9.36.1718753622457; 
 Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36087457258sm10773875f8f.89.2024.06.18.16.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
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
Subject: [PATCH v2 3/8] rust: drm: add driver abstractions
Date: Wed, 19 Jun 2024 01:31:39 +0200
Message-ID: <20240618233324.14217-4-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
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

Implement the DRM driver abstractions.

The `Driver` trait provides the interface to the actual driver to fill
in the driver specific data, such as the `DriverInfo`, driver features
and IOCTLs.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/drv.rs          | 141 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 3 files changed, 143 insertions(+)
 create mode 100644 rust/kernel/drm/drv.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ed25b686748e..dc19cb789536 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
new file mode 100644
index 000000000000..cd594a32f9e4
--- /dev/null
+++ b/rust/kernel/drm/drv.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
+
+use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
+use macros::vtable;
+
+/// Driver use the GEM memory manager. This should be set for all modern drivers.
+pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+/// Driver supports mode setting interfaces (KMS).
+pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
+/// Driver supports dedicated render nodes.
+pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+/// Driver supports the full atomic modesetting userspace API.
+///
+/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
+/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
+/// should not set this flag.
+pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
+/// Driver supports DRM sync objects for explicit synchronization of command submission.
+pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
+/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
+/// submission.
+pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
+/// Driver supports compute acceleration devices. This flag is mutually exclusive with `FEAT_RENDER`
+/// and `FEAT_MODESET`. Devices that support both graphics and compute acceleration should be
+/// handled by two drivers that are connected using auxiliary bus.
+pub const FEAT_COMPUTE_ACCEL: u32 = bindings::drm_driver_feature_DRIVER_COMPUTE_ACCEL;
+/// Driver supports user defined GPU VA bindings for GEM objects.
+pub const FEAT_GEM_GPUVA: u32 = bindings::drm_driver_feature_DRIVER_GEM_GPUVA;
+/// Driver supports and requires cursor hotspot information in the cursor plane (e.g. cursor plane
+/// has to actually track the mouse cursor and the clients are required to set hotspot in order for
+/// the cursor planes to work correctly).
+pub const FEAT_CURSOR_HOTSPOT: u32 = bindings::drm_driver_feature_DRIVER_CURSOR_HOTSPOT;
+
+/// Information data for a DRM Driver.
+pub struct DriverInfo {
+    /// Driver major version.
+    pub major: i32,
+    /// Driver minor version.
+    pub minor: i32,
+    /// Driver patchlevel version.
+    pub patchlevel: i32,
+    /// Driver name.
+    pub name: &'static CStr,
+    /// Driver description.
+    pub desc: &'static CStr,
+    /// Driver date.
+    pub date: &'static CStr,
+}
+
+/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
+///
+/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
+pub struct AllocOps {
+    pub(crate) gem_create_object: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            size: usize,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) prime_handle_to_fd: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            handle: u32,
+            flags: u32,
+            prime_fd: *mut core::ffi::c_int,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) prime_fd_to_handle: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            prime_fd: core::ffi::c_int,
+            handle: *mut u32,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) gem_prime_import: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            dma_buf: *mut bindings::dma_buf,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) gem_prime_import_sg_table: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            attach: *mut bindings::dma_buf_attachment,
+            sgt: *mut bindings::sg_table,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) dumb_create: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            args: *mut bindings::drm_mode_create_dumb,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) dumb_map_offset: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            handle: u32,
+            offset: *mut u64,
+        ) -> core::ffi::c_int,
+    >,
+}
+
+/// Trait for memory manager implementations. Implemented internally.
+pub trait AllocImpl: Sealed {
+    /// The C callback operations for this memory manager.
+    const ALLOC_OPS: AllocOps;
+}
+
+/// The DRM `Driver` trait.
+///
+/// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
+/// drm_driver` to be registered in the DRM subsystem.
+#[vtable]
+pub trait Driver {
+    /// Context data associated with the DRM driver
+    ///
+    /// Determines the type of the context data passed to each of the methods of the trait.
+    type Data: ForeignOwnable + Sync + Send;
+
+    /// The type used to manage memory for this driver.
+    ///
+    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
+    type Object: AllocImpl;
+
+    /// Driver metadata
+    const INFO: DriverInfo;
+
+    /// Feature flags
+    const FEATURES: u32;
+
+    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
+    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..d987c56b3cec 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,5 @@
 
 //! DRM subsystem abstractions.
 
+pub mod drv;
 pub mod ioctl;
-- 
2.45.1

