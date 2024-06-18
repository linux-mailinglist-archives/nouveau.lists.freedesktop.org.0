Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2E90DFF0
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11E10E800;
	Tue, 18 Jun 2024 23:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WbNf8C/0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EB510E800
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs256xb1pxB+aLKo07WjvAHliW0Oujj+1OqKwCCaFMI=;
 b=WbNf8C/0zG/1DUSNsb36EMG1y1qvstrj8dZTQVnzNZo9RBdYekUqO+sakQ7PMqE2ndzELI
 G/NVRUAM2+jbvp3YYYQ3aijElsbhcVP0rel6WDvyqieLMHbHgisijC6S/MAWQW3KEPOTNL
 afpXJWVWGscNH6k0MN1F5gtTuvyUQQs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-JOU911P5NI2AGuJegFIdag-1; Tue, 18 Jun 2024 19:33:48 -0400
X-MC-Unique: JOU911P5NI2AGuJegFIdag-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-36376ef0221so34380f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753627; x=1719358427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cs256xb1pxB+aLKo07WjvAHliW0Oujj+1OqKwCCaFMI=;
 b=clRVejUEvFEJIfS0CEKHsseqqbNtODf96rmYDp9FvdXg0g5W4egyNfLBHsulnMkl3S
 KIZxad+qartsUzBI4atE31wOsii3HYg1sNkuhYvbTxBjULU4/gzoTP4U7flhfPbBEOLP
 CS+q4hyFJVAUyLtRosqlmssTPCTKZ/HAm2XoVHofhm2FkqSgBOF9Zr/ScZt74zdFoD88
 x7Kd7FxNjfSHrl9RjEZV+rGuYs/ZmdtqoCHkw8YGhWjF8KPhMEuOm+u7cRmuOezlERhm
 yBHmwVLeZ8hvJNlE79zcwr4/7Yacz2EJOp28ZNtjz1Y4iAHEQYeRfIqIjKAnKcBGYUd8
 0p6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6SZdvRKeQt8WXqTD4NK3XszrI4Zsu+RnapSHEEdVxce94YfUMfzy+BNX36RfRW72AF/K8up67ofwkKvfpW5Ep5ZnaPcdeG2bXD87ZEQ==
X-Gm-Message-State: AOJu0YwhgK6UCSbrp3PH1wiCD4SR9Op6gKNt8kfRcKf86fSUVeNkFRuy
 +8ggavpw3jB2+EUmPDHyB6A0R3evBvNBtnU8f84z/lIL6WeGeb/AgJ+inRU8C4HsXU6CF7bJ7XQ
 t+cdWxbvdtsYo6e3T9H5Si3kcXfbh9yScxF3MT903EaUxgE5rzumWSMZcjbTNF7o=
X-Received: by 2002:a5d:4b46:0:b0:360:8683:c072 with SMTP id
 ffacd0b85a97d-363192cde9emr559764f8f.50.1718753626815; 
 Tue, 18 Jun 2024 16:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDj4GU8KQkEGYxDKLz5FrCgHzqL9Xhx0LSLZPJwbhGZtUQiAHQgPGzyjn01QpFDvnhXqlOWw==
X-Received: by 2002:a5d:4b46:0:b0:360:8683:c072 with SMTP id
 ffacd0b85a97d-363192cde9emr559749f8f.50.1718753626458; 
 Tue, 18 Jun 2024 16:33:46 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36245fc625dsm2349536f8f.115.2024.06.18.16.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:45 -0700 (PDT)
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
Subject: [PATCH v2 4/8] rust: drm: add device abstraction
Date: Wed, 19 Jun 2024 01:31:40 +0200
Message-ID: <20240618233324.14217-5-dakr@redhat.com>
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

Implement the abstraction for a `struct drm_device`.

A `drm::device::Device` creates a static const `struct drm_driver` filled
with the data from the `drm::drv::Driver` trait implementation of the
actual driver creating the `drm::device::Device`.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/device.rs       | 180 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 3 files changed, 182 insertions(+)
 create mode 100644 rust/kernel/drm/device.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index dc19cb789536..1d12ee7d3c97 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
new file mode 100644
index 000000000000..c62516f79221
--- /dev/null
+++ b/rust/kernel/drm/device.rs
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM device.
+//!
+//! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
+
+use crate::{
+    bindings, device, drm,
+    drm::drv::AllocImpl,
+    error::code::*,
+    error::from_err_ptr,
+    error::Result,
+    types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
+};
+use core::{ffi::c_void, marker::PhantomData, ptr::NonNull};
+
+#[cfg(CONFIG_DRM_LEGACY)]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*,
+            firstopen: None,
+            preclose: None,
+            dma_ioctl: None,
+            dma_quiescent: None,
+            context_dtor: None,
+            irq_handler: None,
+            irq_preinstall: None,
+            irq_postinstall: None,
+            irq_uninstall: None,
+            get_vblank_counter: None,
+            enable_vblank: None,
+            disable_vblank: None,
+            dev_priv_size: 0,
+        }
+    }
+}
+
+#[cfg(not(CONFIG_DRM_LEGACY))]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*
+        }
+    }
+}
+
+/// A typed DRM device with a specific `drm::drv::Driver` implementation. The device is always
+/// reference-counted.
+///
+/// # Invariants
+///
+/// `drm_dev_release()` can be called from any non-atomic context.
+#[repr(transparent)]
+pub struct Device<T: drm::drv::Driver>(Opaque<bindings::drm_device>, PhantomData<T>);
+
+impl<T: drm::drv::Driver> Device<T> {
+    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+        load: None,
+        open: None, // TODO: File abstraction
+        postclose: None, // TODO: File abstraction
+        lastclose: None,
+        unload: None,
+        release: Some(Self::release),
+        master_set: None,
+        master_drop: None,
+        debugfs_init: None,
+        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
+        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
+        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
+        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
+        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
+        dumb_create: T::Object::ALLOC_OPS.dumb_create,
+        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        show_fdinfo: None,
+
+        major: T::INFO.major,
+        minor: T::INFO.minor,
+        patchlevel: T::INFO.patchlevel,
+        name: T::INFO.name.as_char_ptr() as *mut _,
+        desc: T::INFO.desc.as_char_ptr() as *mut _,
+        date: T::INFO.date.as_char_ptr() as *mut _,
+
+        driver_features: T::FEATURES,
+        ioctls: T::IOCTLS.as_ptr(),
+        num_ioctls: T::IOCTLS.len() as i32,
+        fops: core::ptr::null_mut() as _,
+    };
+
+    /// Create a new `drm::device::Device` for a `drm::drv::Driver`.
+    pub fn new(dev: &device::Device, data: T::Data) -> Result<ARef<Self>> {
+        // SAFETY: `dev` is valid by its type invarants; `VTABLE`, as a `const` is pinned to the
+        // read-only section of the compilation.
+        let raw_drm = unsafe { bindings::drm_dev_alloc(&Self::VTABLE, dev.as_raw()) };
+        let raw_drm = NonNull::new(from_err_ptr(raw_drm)? as *mut _).ok_or(ENOMEM)?;
+
+        let data_ptr = <T::Data as ForeignOwnable>::into_foreign(data);
+
+        // SAFETY: The reference count is one, and now we take ownership of that reference as a
+        // drm::device::Device.
+        let drm = unsafe { ARef::<Self>::from_raw(raw_drm) };
+
+        // SAFETY: Safe as we set `dev_private` once at device creation.
+        unsafe { drm.set_raw_data(data_ptr) };
+
+        Ok(drm)
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
+        self.0.get()
+    }
+
+    /// Not intended to be called externally, except via declare_drm_ioctls!()
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
+    /// to can't drop to zero, for the duration of this function call and the entire duration when
+    /// the returned reference exists.
+    #[doc(hidden)]
+    pub unsafe fn borrow<'a>(ptr: *const bindings::drm_device) -> &'a Self {
+        // SAFETY: Safe by the safety requirements of this function.
+        unsafe { &*ptr.cast() }
+    }
+
+    pub(crate) fn raw_data(&self) -> *const c_void {
+        // SAFETY: `self` is guaranteed to hold a valid `bindings::drm_device` pointer.
+        unsafe { *self.as_raw() }.dev_private
+    }
+
+    // SAFETY: Must be called only once after device creation.
+    unsafe fn set_raw_data(&self, ptr: *const c_void) {
+        // SAFETY: Safe as by the safety precondition.
+        unsafe { &mut *self.as_raw() }.dev_private = ptr as _;
+    }
+
+    /// Returns a borrowed reference to the user data associated with this Device.
+    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
+        // SAFETY: `dev_private` is always set at device creation.
+        unsafe { T::Data::borrow(self.raw_data()) }
+    }
+
+    unsafe extern "C" fn release(drm: *mut bindings::drm_device) {
+        // SAFETY: Guaranteed to be a valid pointer to a `struct drm_device`.
+        let drm = unsafe { Self::borrow(drm) };
+
+        // SAFETY: `Self::data` is always converted and set on device creation.
+        unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data()) };
+    }
+}
+
+// SAFETY: DRM device objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: drm::drv::Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_dev_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::drm_dev_put(obj.cast().as_ptr()) };
+    }
+}
+
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
+// SAFETY: As by the type invariant `Device` can be sent to any thread.
+unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
+
+// SAFETY: `Device` can be shared among threads because all immutable methods are protected by the
+// synchronization in `struct drm_device`.
+unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index d987c56b3cec..69376b3c6db9 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,5 +2,6 @@
 
 //! DRM subsystem abstractions.
 
+pub mod device;
 pub mod drv;
 pub mod ioctl;
-- 
2.45.1

