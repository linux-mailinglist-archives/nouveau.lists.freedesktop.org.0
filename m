Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688590DFF1
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA810E812;
	Tue, 18 Jun 2024 23:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="InI+7fkg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B110E811
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqSGu/f2yD5TNl1pw8ZmNP+UDvwFAhTgkcVL/JJamjQ=;
 b=InI+7fkgfMZFmEE2zcj3zT1GReBg2Vv311Qa5bSO+3x+Jot0LtjdImhWYCe/tP/YQw+y8c
 +M4Z+Xav7YYU3LXwNjeIopzoBrOalA5Z06mCXSfV27I+ColZaNpyfn3CANTOaa+HnCYg5A
 u5Wy/E3ahdUTPkQijDzLF83BrPIWTgI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-ZMz4PqqJMmuZF2OWOQydDg-1; Tue, 18 Jun 2024 19:33:52 -0400
X-MC-Unique: ZMz4PqqJMmuZF2OWOQydDg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42117a61bccso44483315e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753631; x=1719358431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqSGu/f2yD5TNl1pw8ZmNP+UDvwFAhTgkcVL/JJamjQ=;
 b=jq2SxNs5uls7Y3YFAiLMUPfdDcbd7RrR7fR4Esqz8gKxtROxwzw+owAfAWjMz2kmOn
 jln8ueDZ9g8ra/8eKNLBsGaTzEnO8N3S19zbIY8GwiSDfoMPeIodrAhfwlThaTi9po8X
 1lNuSmiZk4LcCXLlj5zZX21sRg85Ry4YaUjuk/c5HnnvcJLgzI8miv2abcGLinPIBH9X
 YCtu5m0WuYOSpWlvzVYQMDn0sdOs3EsLrCCdZejk2nu9jQQ3Mz2bZDA0ChpYHh/jW6aw
 TvXrPZjRbp1Zc/GDBvX9T62gaMgJJZRm8fdCi0AtkuDqpWL4eXLujtiRwcDfHBP7lvM9
 gQjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5lVpgJr7hRR6fIcGvPopNo4FxUKoMP3vmCQRsy2zhggv1Mx5D0XWXs6Vjrs/GPQQ14aqUb+p/Bb9qlxWbcPP2tA8rKOPOpxu/CRdxOA==
X-Gm-Message-State: AOJu0YzJnLW+BkhjOCe3k5xjEGtET/zIO4N7nbcirXrkWjJH/phRG1Pl
 qABdwHTGvLjj9BAG4ttdYhRAGFia3fqSEKqkf06IKaD109V/D8vafbEMW6CcqejJQHzvcKmc2Nw
 /U2Y7n4u3/P2+es8ZdPWa3kISJR6KpgKmAyKzY/g2nEzzz1GNQVtDAI9hQOhbZP4=
X-Received: by 2002:a05:600c:430c:b0:422:760c:e8b9 with SMTP id
 5b1f17b1804b1-4247529bc39mr5321875e9.35.1718753630736; 
 Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKcfqrCVLwgzl14jHwarSezwQ95FwnJewLnM1dqT+dP6InaU41TBqdzpeoc4as3zeDlqe6aA==
X-Received: by 2002:a05:600c:430c:b0:422:760c:e8b9 with SMTP id
 5b1f17b1804b1-4247529bc39mr5321695e9.35.1718753630483; 
 Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246bddc59bsm68246815e9.5.2024.06.18.16.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:50 -0700 (PDT)
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
Subject: [PATCH v2 5/8] rust: drm: add DRM driver registration
Date: Wed, 19 Jun 2024 01:31:41 +0200
Message-ID: <20240618233324.14217-6-dakr@redhat.com>
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

Implement the DRM driver `Registration`.

The `Registration` structure is responsible to register and unregister a
DRM driver. It makes use of the `Devres` container in order to allow the
`Registration` to be owned by devres, such that it is automatically
dropped (and the DRM driver unregistered) once the parent device is
unbound.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/drv.rs | 57 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index cd594a32f9e4..ebb79a8c90ee 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -4,7 +4,16 @@
 //!
 //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
 
-use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
+use crate::{
+    alloc::flags::*,
+    bindings,
+    devres::Devres,
+    drm,
+    error::{Error, Result},
+    private::Sealed,
+    str::CStr,
+    types::{ARef, ForeignOwnable},
+};
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -139,3 +148,49 @@ pub trait Driver {
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
 }
+
+/// The registration type of a `drm::device::Device`.
+///
+/// Once the `Registration` structure is dropped, the device is unregistered.
+pub struct Registration<T: Driver>(ARef<drm::device::Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Creates a new [`Registration`] and registers it.
+    pub fn new(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result<Self> {
+        // SAFETY: Safe by the invariants of `drm::device::Device`.
+        let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags as u64) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self(drm))
+    }
+
+    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to `Devres`.
+    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result {
+        let reg = Registration::<T>::new(drm.clone(), flags)?;
+
+        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
+    }
+
+    /// Returns a reference to the `Device` instance for this registration.
+    pub fn device(&self) -> &drm::device::Device<T> {
+        &self.0
+    }
+}
+
+// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between
+// threads, hence it's safe to share it.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration with and unregistration from the DRM subsystem can happen from any thread.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    /// Removes the registration from the kernel if it has completed successfully before.
+    fn drop(&mut self) {
+        // SAFETY: Safe by the invariant of `ARef<drm::device::Device<T>>`. The existance of this
+        // `Registration` also guarantees the this `drm::device::Device` is actually registered.
+        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+    }
+}
-- 
2.45.1

