Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7DC8CA132
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2024 19:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3B10E640;
	Mon, 20 May 2024 17:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VNaxJBTw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5D010E4D9
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yDyFo5QAsShU2UXMrrT4xAbvXT6OnwazMreT8PcbZM=;
 b=VNaxJBTw+qwU60Xn/Kly6YNs1DOi5GXweiWqMVG8iR5zhwbCRL9BDAYo24MWhgaciSf9+A
 OHxwSXleYQtXRUKZ+7FMV7meBpGLDT+u3Hg10FAmplFmA0UGOBNk6VpjzD99/wEZal0gU+
 30oEFmt+GeCho4PTvN0UN+R87DHPRhY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-xeoxtBo7P2Gd7N85c2j7iA-1; Mon, 20 May 2024 13:21:20 -0400
X-MC-Unique: xeoxtBo7P2Gd7N85c2j7iA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41feab38d16so47801235e9.3
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 10:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225676; x=1716830476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yDyFo5QAsShU2UXMrrT4xAbvXT6OnwazMreT8PcbZM=;
 b=oDM2yfHk1kknG/5dji50el9gurnfQVKdx85TCgva+gIvltoY2hJukZ114D3Uc1C29J
 ulphIhr5creIqYbKlksQkYREkgY+w4caDzlWf761eV+Y69mxa5f8OVYFEsxEWUB0sx58
 zNDryRvcErsEyq1TtnZ2ZXRuDf72OaLXqiGiM02054MulJK3sXL2CknCAYQ2RKpY2qRy
 QpdxRDOlpPuLH8mUHSuKLSTwvFw3hA07xI/xDjEUYh6BjvHHwjGUXkC9qtMieCfITWiO
 +aFK3sp/bM9XLUpyAOuAiS11hFHY5Yb4FMdm+gMtEy6vpC8lucq9qTS/njecKuVHDMp1
 ufaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC1GKyMBiVXmMRrm+wdrvqoCUBf3d9GMlxDYLtxhXdFCvKnO6OxoThHQnKS2sZJ8HU/si9IWnb1CY+cbpdlf5GeIIEa2Yv0uPu66JGog==
X-Gm-Message-State: AOJu0YzCImbFwFOr2BPKtSGZyEcY2iXpXSmLEbhpMsmRibLhaaBRzblm
 U6OxnVYHwhXgDquZklyUvVQKz0ByK0rCFtRzurwN/9FaP+tGYc21UDjU8W7ccNVz7zOWH6zQxIP
 H0L8eOtUOIJcUCSnMeczzVe0y6eWvz9PBubAPE6aVAfp5YV1z7fC0AHDFzDTf6Xs=
X-Received: by 2002:a05:600c:4f42:b0:41b:a670:a9f1 with SMTP id
 5b1f17b1804b1-41feaa2f409mr202751865e9.7.1716225675943; 
 Mon, 20 May 2024 10:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfuWyiq6rqJZ4UVuzu/rSymC+StzNm4hbcpBUY0IqZsQhhXqZBG4ZtoNnNxU/lFlphDCd8rw==
X-Received: by 2002:a05:600c:4f42:b0:41b:a670:a9f1 with SMTP id
 5b1f17b1804b1-41feaa2f409mr202751525e9.7.1716225675040; 
 Mon, 20 May 2024 10:21:15 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88110f3esm466021575e9.29.2024.05.20.10.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:21:14 -0700 (PDT)
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
Subject: [RFC PATCH 1/8] rust: drm: ioctl: Add DRM ioctl abstraction
Date: Mon, 20 May 2024 19:20:48 +0200
Message-ID: <20240520172059.181256-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Asahi Lina <lina@asahilina.net>

DRM drivers need to be able to declare which driver-specific ioctls they
support. Add an abstraction implementing the required types and a helper
macro to generate the ioctl definition inside the DRM driver.

Note that this macro is not usable until further bits of the abstraction
are in place (but it will not fail to compile on its own, if not called).

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   5 ++
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 5 files changed, 162 insertions(+)
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 32221de16e57..14188034285a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
new file mode 100644
index 000000000000..79d720e9d18e
--- /dev/null
+++ b/rust/kernel/drm/ioctl.rs
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+#![allow(non_snake_case)]
+
+//! DRM IOCTL definitions.
+//!
+//! C header: [`include/linux/drm/drm_ioctl.h`](../../../../include/linux/drm/drm_ioctl.h)
+
+use crate::ioctl;
+
+const BASE: u32 = uapi::DRM_IOCTL_BASE as u32;
+
+/// Construct a DRM ioctl number with no argument.
+#[inline(always)]
+pub const fn IO(nr: u32) -> u32 {
+    ioctl::_IO(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-only argument.
+#[inline(always)]
+pub const fn IOR<T>(nr: u32) -> u32 {
+    ioctl::_IOR::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a write-only argument.
+#[inline(always)]
+pub const fn IOW<T>(nr: u32) -> u32 {
+    ioctl::_IOW::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-write argument.
+#[inline(always)]
+pub const fn IOWR<T>(nr: u32) -> u32 {
+    ioctl::_IOWR::<T>(BASE, nr)
+}
+
+/// Descriptor type for DRM ioctls. Use the `declare_drm_ioctls!{}` macro to construct them.
+pub type DrmIoctlDescriptor = bindings::drm_ioctl_desc;
+
+/// This is for ioctl which are used for rendering, and require that the file descriptor is either
+/// for a render node, or if it’s a legacy/primary node, then it must be authenticated.
+pub const AUTH: u32 = bindings::drm_ioctl_flags_DRM_AUTH;
+
+/// This must be set for any ioctl which can change the modeset or display state. Userspace must
+/// call the ioctl through a primary node, while it is the active master.
+///
+/// Note that read-only modeset ioctl can also be called by unauthenticated clients, or when a
+/// master is not the currently active one.
+pub const MASTER: u32 = bindings::drm_ioctl_flags_DRM_MASTER;
+
+/// Anything that could potentially wreak a master file descriptor needs to have this flag set.
+///
+/// Current that’s only for the SETMASTER and DROPMASTER ioctl, which e.g. logind can call to
+/// force a non-behaving master (display compositor) into compliance.
+///
+/// This is equivalent to callers with the SYSADMIN capability.
+pub const ROOT_ONLY: u32 = bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
+
+/// This is used for all ioctl needed for rendering only, for drivers which support render nodes.
+/// This should be all new render drivers, and hence it should be always set for any ioctl with
+/// `AUTH` set. Note though that read-only query ioctl might have this set, but have not set
+/// DRM_AUTH because they do not require authentication.
+pub const RENDER_ALLOW: u32 = bindings::drm_ioctl_flags_DRM_RENDER_ALLOW;
+
+/// Internal structures used by the [`declare_drm_ioctls!{}`] macro. Do not use directly.
+#[doc(hidden)]
+pub mod internal {
+    pub use bindings::drm_device;
+    pub use bindings::drm_file;
+    pub use bindings::drm_ioctl_desc;
+}
+
+/// Declare the DRM ioctls for a driver.
+///
+/// Each entry in the list should have the form:
+///
+/// `(ioctl_number, argument_type, flags, user_callback),`
+///
+/// `argument_type` is the type name within the `bindings` crate.
+/// `user_callback` should have the following prototype:
+///
+/// ```
+/// fn foo(device: &kernel::drm::device::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::file::File<Self::File>,
+/// )
+/// ```
+/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+///
+/// # Examples
+///
+/// ```
+/// kernel::declare_drm_ioctls! {
+///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
+/// }
+/// ```
+///
+#[macro_export]
+macro_rules! declare_drm_ioctls {
+    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
+        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
+            use $crate::uapi::*;
+            const _:() = {
+                let i: u32 = $crate::uapi::DRM_COMMAND_BASE;
+                // Assert that all the IOCTLs are in the right order and there are no gaps,
+                // and that the sizeof of the specified type is correct.
+                $(
+                    let cmd: u32 = $crate::macros::concat_idents!(DRM_IOCTL_, $cmd);
+                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
+                    ::core::assert!(core::mem::size_of::<$crate::uapi::$struct>() ==
+                                    $crate::ioctl::_IOC_SIZE(cmd));
+                    let i: u32 = i + 1;
+                )*
+            };
+
+            let ioctls = &[$(
+                $crate::drm::ioctl::internal::drm_ioctl_desc {
+                    cmd: $crate::macros::concat_idents!(DRM_IOCTL_, $cmd) as u32,
+                    func: {
+                        #[allow(non_snake_case)]
+                        unsafe extern "C" fn $cmd(
+                                raw_dev: *mut $crate::drm::ioctl::internal::drm_device,
+                                raw_data: *mut ::core::ffi::c_void,
+                                raw_file_priv: *mut $crate::drm::ioctl::internal::drm_file,
+                        ) -> core::ffi::c_int {
+                            // SAFETY: The DRM core ensures the device lives while callbacks are
+                            // being called.
+                            //
+                            // FIXME: Currently there is nothing enforcing that the types of the
+                            // dev/file match the current driver these ioctls are being declared
+                            // for, and it's not clear how to enforce this within the type system.
+                            let dev = $crate::drm::device::Device::borrow(raw_dev);
+                            // SAFETY: This is just the ioctl argument, which hopefully has the
+                            // right type (we've done our best checking the size).
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
+                            // SAFETY: This is just the DRM file structure
+                            let file = unsafe { $crate::drm::file::File::from_raw(raw_file_priv) };
+
+                            match $func(dev, data, &file) {
+                                Err(e) => e.to_errno(),
+                                Ok(i) => i.try_into()
+                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),
+                            }
+                        }
+                        Some($cmd)
+                    },
+                    flags: $flags,
+                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
+                }
+            ),*];
+            ioctls
+        };
+    };
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
new file mode 100644
index 000000000000..9ec6d7cbcaf3
--- /dev/null
+++ b/rust/kernel/drm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM subsystem abstractions.
+
+pub mod ioctl;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 15730deca822..cb0dd3d76729 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,8 @@
 pub mod device;
 pub mod devres;
 pub mod driver;
+#[cfg(CONFIG_DRM = "y")]
+pub mod drm;
 pub mod error;
 pub mod init;
 pub mod ioctl;
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 08f5e9334c9e..ed42a456da2e 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -7,5 +7,6 @@
  */
 
 #include <uapi/asm-generic/ioctl.h>
+#include <uapi/drm/drm.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.45.1

