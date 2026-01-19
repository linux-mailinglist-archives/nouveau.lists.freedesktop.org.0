Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBAD3BBD3
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 00:35:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A810E554;
	Mon, 19 Jan 2026 23:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WPACwENQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E4B3344CA1;
	Mon, 19 Jan 2026 23:26:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768865206;
 b=XVN01mzfSkPTyJt831EBTctKOTlmFGzrhrYyel8ntvn/e6c6Yl5ACNQrniuFPZZr84z41
 JC+kxDWNdB/ibFZclOYKX4hzgVWkyIFFQ90qBmvymJAeROw70lH7EdILBilO6G0vyLCTkxw
 Etg/Qmjrc5FmZ+EYNm9MnbJzblcDpN9/9T7FmhNCGhalk7vbdDZnPlO16wRBJiGJjIqxFVs
 zSsl6H+GKMCb6ht9WYHxbpjlNPzHnmbcAodZfAR3NfOjVbX7hXsnuknAH8aIFQE2NF2zVDY
 AZee9GDkvGt5Z0ASTVvUgx/Uq9VRZsBJ2/Fe0cxYGfe6Y7LmhOKZoLZrTlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768865206; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rXG/5GXrMMO52N9hznk/smvR/uCaCB9NhVxyJsh7NbY=;
 b=KJnd+4D8zJtZ/dlhzAMCL0dBAVHdV+41h7qQ5v3D87cuPVulGtAB/8jlUEPwZBqgx6hp1
 6CpQoqRmRnsfoAyIZNzcXUWjsDAcTpt+hhLNQmf/qrUTv6fYW7JT0kzXrIfY0SxwG/0Si7t
 veJAkR4ZzogyNBt+NnhyyRRSW2jtFvGXmZBSRNkp/6hDCHU2WS4uRltIwRaiYgabvdObMOP
 MEO3Oys5L+knRYWwWgyAQUeB3UohnWL6OHROBkrs3MhOlzdM+3ZBcCaEr5C0KptTyQjlJI8
 veRFcATYyutMbxplTx9wGUcWuRED2Qf6d2DOjQnWKraHtMA79thbIXRAwYnw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 36A6244BDC
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 23:26:44 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0164D10E550;
	Mon, 19 Jan 2026 23:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768865725;
	bh=EIDY6ukxUEx2jxZ91hlUz1UpHM1wcNP5YSPiCVbXIpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WPACwENQrJn3WLax62DYRlEEkSjznVzkFa+CO+Ru2XXDU6nrutxv/Yt5Sj2st5FGn
	 rux1XlNr1livVuP8LOlq1VaiME27uNcZ4nUtu2b4CYbWYzmZZOEwjZ/NZ2Ay6NSgdd
	 HsBn0VxB1GIndrkL4p82PoH6twHWDt40xwtuObIR+0JZxKYBtOCWh+SAEozhJ+sBu0
	 LdRgKH8C0ozAy8htp3w0ysE9EaEHqinZQTLVYGKnqUf/rqLMJsF1URqJHSWRZMLAzB
	 KLcV+xHLEEdLjsv/WbjXMw8fSnTDwc98R3Lmi8JJK5eZk2o2LWhVrekfFNrKkFOWmX
	 sef/a4LfZrfhA==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BA6B17E0FFA;
	Tue, 20 Jan 2026 00:35:22 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 19 Jan 2026 20:34:47 -0300
Subject: [PATCH 2/2] rust: drm: add FeatureRender
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-render-v1-2-8326e4d5cb44@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
In-Reply-To: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
Message-ID-Hash: AACZ66OBJHEY5EI4Z3FYZFCDQQN5FRBK
X-Message-ID-Hash: AACZ66OBJHEY5EI4Z3FYZFCDQQN5FRBK
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AACZ66OBJHEY5EI4Z3FYZFCDQQN5FRBK/>
Archived-At: 
 <https://lore.freedesktop.org/20260119-drm-render-v1-2-8326e4d5cb44@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a feature for drivers willing to expose render nodes to userspace. This
comes with an added safety requirement in the DriverFeatures trait. This,
in turn, exposes /dev/dri/renderDXX nodes that can be used by userspace to
control the device.

This is then enabled in the Tyr driver, while it's left as NoRender for
Nova for the time being.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/nova/driver.rs |  4 +++-
 drivers/gpu/drm/tyr/driver.rs  | 12 +++++++++---
 rust/kernel/drm/device.rs      | 10 +++++++++-
 rust/kernel/drm/driver.rs      | 37 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 247a05f7b3a7..4de1e4cfdc5d 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -73,4 +73,6 @@ impl drm::Driver for NovaDriver {
 // SAFETY: This trait requires implementers to observe the safety requirements
 // of each enabled feature. There are no features enabled, so this is safe by
 // definition.
-unsafe impl drm::driver::DriverFeatures for NovaDriver {}
+unsafe impl drm::driver::DriverFeatures for NovaDriver {
+    type Render = drm::driver::NoRender;
+}
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index ec2aa30515a1..c12ad8467605 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -192,9 +192,15 @@ impl drm::Driver for TyrDriver {
 }
 
 // SAFETY: This trait requires implementers to observe the safety requirements
-// of each enabled feature. There are no features enabled, so this is safe by
-// definition.
-unsafe impl drm::driver::DriverFeatures for TyrDriver {}
+// of each enabled feature.
+//
+// For `FeatureRender`: we do not call modesetting APIs in our ioctls, and we do
+// not use any APIs requiring a DRM master. Furthermore, it is not possible for
+// a client to interfere in another client by design. This is enforced by the
+// `VM` layer and, at a lower level, by the system's IOMMU.
+unsafe impl drm::driver::DriverFeatures for TyrDriver {
+    type Render = drm::driver::RenderSupported;
+}
 
 #[pin_data]
 struct Clocks {
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index cfc2f34e8cc2..b2c2e6c195af 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -62,7 +62,15 @@ pub struct Device<T: drm::Driver> {
 
 impl<T: drm::Driver> Device<T> {
     const fn compute_features() -> u32 {
-        drm::driver::FEAT_GEM
+        use crate::drm::driver::FeatureRender;
+
+        let mut features = drm::driver::FEAT_GEM;
+
+        if T::Render::ENABLED {
+            features |= drm::driver::FEAT_RENDER;
+        }
+
+        features
     }
 
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index fdfd083ba2b6..331a998e47e4 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -15,6 +15,9 @@
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
 
+/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
+pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+
 /// Information data for a DRM Driver.
 pub struct DriverInfo {
     /// Driver major version.
@@ -182,4 +185,36 @@ fn drop(&mut self) {
 ///
 /// Drivers implementing this trait must ensure they comply with the safety
 /// requirements of each supported feature.
-pub unsafe trait DriverFeatures {}
+///
+/// - For drivers implementing `FeatureRender`:
+///
+/// The render-accessible subset of the driver's functionality must not allow
+/// clients to interfere with each other or require master privileges. In other
+/// words, any ioctl declared with [`drm::RENDER_ALLOW`] must not call any
+/// KMS/modesetting APIs or require `DRM_MASTER`.
+pub unsafe trait DriverFeatures {
+    /// Feature for render nodes.
+    type Render: FeatureRender;
+}
+
+/// Controls whether render nodes are supported via `Self::ENABLED`.
+pub trait FeatureRender: drm::private::Sealed {
+    /// Whether render nodes are enabled.
+    const ENABLED: bool;
+}
+
+/// A marker type indicating that the driver supports render nodes.
+pub struct RenderSupported;
+
+/// A marker type indicating that the driver does not support render nodes.
+pub struct NoRender;
+
+impl drm::private::Sealed for RenderSupported {}
+impl FeatureRender for RenderSupported {
+    const ENABLED: bool = true;
+}
+
+impl drm::private::Sealed for NoRender {}
+impl FeatureRender for NoRender {
+    const ENABLED: bool = false;
+}

-- 
2.52.0

