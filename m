Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49871C63D0E
	for <lists+nouveau@lfdr.de>; Mon, 17 Nov 2025 12:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597E10E2F0;
	Mon, 17 Nov 2025 11:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Dg1L7f+v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509110E3AF
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 11:30:15 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso2461337f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763379014; x=1763983814;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Aj4+FQsxMyGtrmcGiS6DW5AMZ1bMpHqh6Z1FckhufBI=;
 b=Dg1L7f+vecu+sh0rB0of1hNojD0SJ6ahRDDilA+cQcL/fwyyyuQjBrFlY4+DgH+4+v
 L5SlmnbAokTgA4PFNyN0yTh0EwwKxMWtdYzfEJzaGJ9sMDojn+aD25cJbqVDwOxIkRDA
 FpAPQpqaOp8c1hhWlpzoCb+orDOv/fhK47Sj9Vjeyh0Ez0H22z06kJqjxADRe8P+d1N6
 1nT2vee3kxdIKtfmiHaUoxXKb1j238ZhIHc5eboCsmrLUnCnujGsAZFGAToP3yB55DoL
 4X6OgqMJ+T1JYE9vCGIyoxYfz5wEEYdFFS77PyQFTK7EN6Bp/+8Z0LvvdBduehSHqtG9
 K9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763379014; x=1763983814;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aj4+FQsxMyGtrmcGiS6DW5AMZ1bMpHqh6Z1FckhufBI=;
 b=rahUR41gnXYD0qFpkfIdLxeVNb3mRJjIDWn0zGV/CW17onwXOcF7Gy0BlGiEs4KdoJ
 JYNL9UHdj1x4JBdJQMLPsL12kyu/1sWtXDjWaYlbLPp3cJDBQiLKKzBfVvb2NhVbtYQ1
 bh2znrL66r/m0kH3xUy4hTcinozbLLgDBDOLjcdH7uaNCj/92FNFX0zmZkPaFKK0XpVS
 yzkNZk2HpazamyX8rTU1XWBPsJw/vj8EjlzfCShRtUQoogYzIiPhG2jfTzCTByj2fNSP
 QsDrpzGZSgrojr3maavVryXfRbX0EhFpETRKM/l/hQQ45HI0Ro13AuaWy1aKGpn63XgP
 d2fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgiPXlvmSUDBWDKL5S/jv7cvttyfHqXnKv04DpoVll3IbbiIZiI4u7382I4nOnPn7F4Rkq13uS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKAsSmns8Vov05hsExHWV3ZYkOtK6z53ykvDf8nC1zOhL/2eeT
 kB5E6+anAR1yMWw0Kzhzvk1XPGu6ZESfWotOE+9jUq6WiDHwEZNiXDK+2xSgVAn6RveYcjPISVh
 4InL2IqXE/xGk27hKDA==
X-Google-Smtp-Source: AGHT+IEos1s7OFBxCj/fM02CWcOnMb6ZLlOOnUqYdtRqihg4crPsbk05VLBssUA1B8VK3BKch9rwsZuNBWjNRJA=
X-Received: from wrxb8.prod.google.com ([2002:a05:6000:10c8:b0:42b:5eaf:119d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584a:0:b0:429:cfa3:5fde with SMTP id
 ffacd0b85a97d-42b527be676mr16328982f8f.11.1763379014132; 
 Mon, 17 Nov 2025 03:30:14 -0800 (PST)
Date: Mon, 17 Nov 2025 11:30:07 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD4HG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3bz8skTdtNwS3aLS4hJdM+PkFCNLAyODFDNjJaCegqLUtMwKsHn
 RsbW1AAstps1fAAAA
X-Change-Id: 20251117-nova-fmt-rust-63cd29020d63
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=IlBwznomCNY5hv8/BeD4ioOCllG+3LV3IzXw6zkP5VQ=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpGwdABBJKTzctYKpuoSnFbOIZk5NSpa+oTTrtN
 /za72t96UiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRsHQAAKCRAEWL7uWMY5
 RtnVD/4qapAyZ49F06sMtEJHVqKS8YqjwhykFgm+uZ/TniR0YxtO4KTpyxKcZKJE5RrE49eqhBu
 cQ9SaBpgoTjPsICBNHglk57Z8cTY+dOvnpyoUn1+Z7371RGOaBQBjOFr0vD6ybMMyswiT9UsSff
 GxeD4b77jCtNrFSqAr+1B2JXohggMwJ2bt2eOcm3HY9ANayh7g2nMEfV00JQP/1BMCpqoRu5nD6
 453QEn4HEySCIUIVstAjkIYozquYdmX2f85NKtLcBoXWDXLOTdr1ewAIh5RrWBgHot+CxCU95f7
 pRJQHYiUjxYPF4OHnXz6Opc0/2XYybl616H6fjD21tUfIZNM8DZgy6x5dA1O/vZaNl5s3+JNMeJ
 jeJclOWQSY3NRJXgXjJfTJkWR9Xc6HZDhuTfQ+nbQlcTQzyNHWqWqmQCXcT97MRq84OlyVVHKnP
 3b8MbdY5JhXbrXyykTSdGJ719EVbxJXU3T1XL9zZeNuFZYJMgwTcy4z2iJhybK/ogS/A1od9hNL
 vwPOeYdAhON/ED3qRKT2FWEdxHQ6kO/Qo9zhrmERY3mGCUwYvxwKjw5bnK1cYk+FGPLfIwymxCX
 8lZ492X8GCr/DI2RWLIcCzDoPxcivc5fGDhjBVeaIK5K1yHOmUc/23uUKYRP3GOZd85Y8h3NV+0
 zIiTCq8bX1l8KOg==
X-Mailer: b4 0.14.2
Message-ID: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Subject: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
drm-rust-next introduced some usage of the Display trait, but the
Display trait is being modified in the rust tree this cycle. Thus, to
avoid conflicts with the Rust tree, tweak how the formatting machinery
is used in a way where it works both with and without the changes in the
Rust tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/nova-core/gpu.rs    | 5 ++---
 drivers/gpu/nova-core/gsp/fw.rs | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19755af6ad045f4d42835985c2048868dac23dbc..629c9d2dc994cf79f37d4aa71ce65957f45736f9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -227,13 +227,12 @@ fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
 
 impl fmt::Display for Spec {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(
-            f,
+        f.write_fmt(fmt!(
             "Chipset: {}, Architecture: {:?}, Revision: {}",
             self.chipset,
             self.chipset.arch(),
             self.revision
-        )
+        ))
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 8deec5e0a1d4affe705860401acd646ca8add11f..abffd6beec654466202abe70c4c52c9bd4504d14 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -6,13 +6,11 @@
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
 
-use core::{
-    fmt,
-    ops::Range, //
-};
+use core::ops::Range;
 
 use kernel::{
     dma::CoherentAllocation,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,

---
base-commit: ce89e3e019f1ec4b11356f35feb8bd8c0f2c6bf7
change-id: 20251117-nova-fmt-rust-63cd29020d63

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

