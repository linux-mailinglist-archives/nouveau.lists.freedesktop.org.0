Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA55BBF6F3
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8010E5ED;
	Mon,  6 Oct 2025 20:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPIgJSQS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BF010E944
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:44 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-7f7835f4478so6060146d6.1
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808544; x=1759413344; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WAkOv1RieyKvIfCAhJItgJq0V7Rg1TFOU5lVc6t6PUg=;
 b=DPIgJSQStIgXCXZ7XrMt1zYMFwhY10OG3ywpnU7SuBqAIjpPRkIheRfa6FlKcuSTdF
 H2i71A/nqQr+tBxOKd8j9jH9hgsFiSv6ZX0VpTEBlTeLeKPoC2iJmM4yYdDC6iAP6oF8
 bHSULgVIZUMVSzvFqv+SUwZrc6B+7U41p5G1s7OJAt4P2VrtMW/i/7D5DLFvrSn7qU79
 dYzy8J1al0ofiR6pJgKOcuHOiGGEdQkkrlA/cQmEO14I69ekO6IVMo2tv55TmrQtm3OP
 JOl8tw6k6sWEM106YIOuTCufi591vC75zdvvNZRbXAFLuA48lJcGG1/9kyqaV+uZ+BWe
 Qr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808544; x=1759413344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAkOv1RieyKvIfCAhJItgJq0V7Rg1TFOU5lVc6t6PUg=;
 b=icrDbjA8019LRACkSzh3FD9zypEM16I+gGcCNKvGqx2WwmoM55gYh2Qa1mNlQDFjIK
 u2wnaEUqJ9nV17cRlvIhYqtOiAi9EIbVVlWQFuZCbU6yM4SCD4gMtDWzl+mzVMgSn1in
 BqESzZ9Q5jkiOxYuED5rVr2iY1cNFq9SG52PO5+vadcvqih0b3D0Oe0X8DmW91BkNuz5
 f5mzmQYsOGjqyRNTr2qYeG3B777nhgS8jYhT7jZZkW/CtdW2Vnee7FlGK0dM9uv5xLgA
 dJvveM84/wvVIjyRKKeDqtCj1IumfsInllomI/en5VdFyjJdZgnT5y31MKhTe7pCJHTV
 p9rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/6oPxfbyYay9IMWAI3uWWxF8sbc+geNM/Uxxkyt2UWpi0AOoYrufK9mWcJ7ayVwCO2VuUiw4T@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv3aWo2G8VQjO4LE903b61S5drajuDjp/pIMfm6Vt2pD4hx1sS
 JivfeyA9mIefXIpgj8ZpuBuxZ9cVLjXk41hBPHmphFBvhDejlY1y1fzX
X-Gm-Gg: ASbGncvipBu+pN8hc0gyX4bW1MtpeAey54jhSWG5nwfLqnJXT/pUrN4etNo0r8k/5M/
 1kffgLfC1CoOBAkIjfM58DUPK5u0l2uyYneFh6MS4t/4gGJXAAFEdJ4AQg3NdDjdpcR1TrnIukj
 IbLmdtJrg13GyabW4Fzvl8rKlmVw7/6HQqZUEsO3DWZrevtyXTO/0aoYaobkCtZ5X4nNEbXGFtn
 FnoFT+y3s0XLoR9kqQyjK3vJtPENaR/Eao3nGD5Ba6pyG723Bo/eR/y5dq+HGNQdnvoRQknbg34
 /lSXGw1kTN/+EDWwKSuHWGkbkPr4hT7qn5zAaQLIwqWjDO7bZdVhgQZ9sd8L9hfDKwqVNTV1cnu
 i+6sIqTwv0/ahquOThhGhNXns2duVrLt0ig/xkgwR8rWWiA2OqqSmJOnaRVNvQGrA+b5swrMXde
 9Vfe8KwyfEypfYuQtfaOxpNBtvIu53F5O8u5sLhnlelvUpylaHV6P5xAAeAc1PiUAzLVLM
X-Google-Smtp-Source: AGHT+IHF9UuB9For1/7YW0Qxf6nPTFMieeyDSqN58eT9nYnL6TeBAODoPScd1hJnleJiIi565hDfTQ==
X-Received: by 2002:ad4:5bc9:0:b0:76a:fcee:97aa with SMTP id
 6a1803df08f44-7fc309ec826mr47856686d6.29.1758808543310; 
 Thu, 25 Sep 2025 06:55:43 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:02 -0400
Subject: [PATCH v2 14/19] rust: platform: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-14-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=6208;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=cGT2p8vWeMd9yhCscAqtKB14P0MqjieptZpD6VjuDnQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAqXnSTSLC5DSGmrQ0rUUvFP5bu0JMFwcjJ+FLO2nGEH20VIfZHuQ47CF/8jOiBsSKPADtt8TtP
 7X9bJlhhLGw8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Mailman-Approved-At: Mon, 06 Oct 2025 20:57:16 +0000
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/platform.rs              |  6 +++---
 samples/rust/rust_driver_faux.rs     |  4 ++--
 samples/rust/rust_driver_platform.rs | 30 ++++++++++++++----------------
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8f028c76f9fa..d1cc5cee1cf5 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -135,7 +135,7 @@ macro_rules! module_platform_driver {
 /// # Examples
 ///
 ///```
-/// # use kernel::{acpi, bindings, c_str, device::Core, of, platform};
+/// # use kernel::{acpi, bindings, device::Core, of, platform};
 ///
 /// struct MyDriver;
 ///
@@ -144,7 +144,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///
@@ -153,7 +153,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_ACPI_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
+///         (acpi::DeviceId::new(c"LNUXBEEF"), ())
 ///     ]
 /// );
 ///
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index ecc9fd378cbd..23add3160693 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -2,7 +2,7 @@
 
 //! Rust faux device sample.
 
-use kernel::{c_str, faux, prelude::*, Module};
+use kernel::{faux, prelude::*, Module};
 
 module! {
     type: SampleModule,
@@ -20,7 +20,7 @@ impl Module for SampleModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Initialising Rust Faux Device Sample\n");
 
-        let reg = faux::Registration::new(c_str!("rust-faux-sample-device"), None)?;
+        let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
 
         dev_info!(reg.as_ref(), "Hello from faux device!\n");
 
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index ad08df0d73f0..b3fe45a43043 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -63,7 +63,7 @@
 //!
 
 use kernel::{
-    acpi, c_str,
+    acpi,
     device::{
         self,
         property::{FwNodeReferenceArgs, NArgs},
@@ -85,14 +85,14 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
+    [(of::DeviceId::new(c"test,rust-device"), Info(42))]
 );
 
 kernel::acpi_device_table!(
     ACPI_TABLE,
     MODULE_ACPI_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), Info(0))]
+    [(acpi::DeviceId::new(c"LNUXBEEF"), Info(0))]
 );
 
 impl platform::Driver for SampleDriver {
@@ -126,49 +126,47 @@ impl SampleDriver {
     fn properties_parse(dev: &device::Device) -> Result {
         let fwnode = dev.fwnode().ok_or(ENOENT)?;
 
-        if let Ok(idx) =
-            fwnode.property_match_string(c_str!("compatible"), c_str!("test,rust-device"))
-        {
+        if let Ok(idx) = fwnode.property_match_string(c"compatible", c"test,rust-device") {
             dev_info!(dev, "matched compatible string idx = {}\n", idx);
         }
 
-        let name = c_str!("compatible");
+        let name = c"compatible";
         let prop = fwnode.property_read::<CString>(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
 
-        let name = c_str!("test,bool-prop");
-        let prop = fwnode.property_read_bool(c_str!("test,bool-prop"));
+        let name = c"test,bool-prop";
+        let prop = fwnode.property_read_bool(c"test,bool-prop");
         dev_info!(dev, "'{name}'='{prop}'\n");
 
-        if fwnode.property_present(c_str!("test,u32-prop")) {
+        if fwnode.property_present(c"test,u32-prop") {
             dev_info!(dev, "'test,u32-prop' is present\n");
         }
 
-        let name = c_str!("test,u32-optional-prop");
+        let name = c"test,u32-optional-prop";
         let prop = fwnode.property_read::<u32>(name).or(0x12);
         dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
-        let name = c_str!("test,u32-required-prop");
+        let name = c"test,u32-required-prop";
         let _ = fwnode.property_read::<u32>(name).required_by(dev);
 
-        let name = c_str!("test,u32-prop");
+        let name = c"test,u32-prop";
         let prop: u32 = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:#x}'\n");
 
-        let name = c_str!("test,i16-array");
+        let name = c"test,i16-array";
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
         dev_info!(dev, "'{name}' length is {len}\n");
 
-        let name = c_str!("test,i16-array");
+        let name = c"test,i16-array";
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
 
         for child in fwnode.children() {
-            let name = c_str!("test,ref-arg");
+            let name = c"test,ref-arg";
             let nargs = NArgs::N(2);
             let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
             dev_info!(dev, "'{name}'='{prop:?}'\n");

-- 
2.51.0

