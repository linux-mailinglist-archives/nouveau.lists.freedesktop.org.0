Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF4CBA9F0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CB210EA1D;
	Sat, 13 Dec 2025 12:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDGHWxCL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184FE891D9
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:14:46 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b31f22d706aso2682601a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750691685; x=1751296485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4L+SLp5sEjKp/3F3270exGqS9NQW7oUMk/S+cCYt5Es=;
 b=MDGHWxCLa8ZEM2QeRcC3xkErx2W7jOsvp2pkHxMn9HZjPFbyY7TGqrh6YRNf2d/MGl
 r6XPw7BOFZAAhBVBZIsoAQHqIuQ35Wmbul59+BotyD0CJS2PcyGt2HaHid/RWcX2hiJG
 pjaT0umR0uPuJFZJSZi9+wRO4V4/xI/nS4F7WYmesIDQFj/+GCANJLTjXYrGU5SlU7Ad
 beHk0QirAU6s4CvLe8lUmHBf+neyz9uBJOlzM5yZeltUD9omO8HIihFNgBnNesjd2fep
 YtD5sme2DXZMeSxygkVdtfC4PcjCEOb7bCYmQ+L25YwuZoHL8UKMwVKjRopBL/R4WKte
 2LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750691685; x=1751296485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4L+SLp5sEjKp/3F3270exGqS9NQW7oUMk/S+cCYt5Es=;
 b=Xy3Z/jQwDfzPmYcX4IN9KCiqOSLRno9+5PcLtJ1KpMYUFC/vd4F3xctWQ0nLRoNdbX
 U8Dx8e6iW6dl6FwU9NwbWDa76Z04R62f4I9Ehl9lrXkxJ+VrBqHophBLC55FKCDDC1XU
 yXeC4AvveKxElMtqSVxOlgTLFVB+IXI4LoC/DHczOFR8KHleHRz7591rj6FX2NuzCojW
 uVoGwOFFYbYVKvXH+yBk+ANc95NNdwttFjpn9/EtxfpAAHHGB7lMy8KsYlabJ6YNkVVM
 BBdmshTrsxJ0wRr4iWIwgqoGimbBiGs+F2YzEMpgC0X6ksqasAxF5KbjE6EoA+fcs24f
 5zlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8byJWVMCKmav2Fs2HCS1gxn6xkWnEjo8GyVJJNHQaDQNqiu/k6rt0R7hgJM1Qu3npm3vY6w7f@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPy6yVdNa+Xn/8e7t/DPr4aiEot+qeOMw7BnRQNE2zSLIzqmHe
 bCdi2oIDRZIU9jgMtI/DpNw4tDb05Vc1WX1bmM9Ssm5qf+MYOXo2MXeW
X-Gm-Gg: ASbGncs/kKRrPs4llh83+FWBjsu0vgWU4Aw37QuYRDNBKw1w9wHlSGEtMXMB4cmcGR+
 eo33597dlIkEgP8DBlezZ3/xDMlZpMWY1mfvvpHBNVY7owote2uGyAzXsHyqmziAMSWOE3cQMRR
 1QxUmNdK94IFtp6c0BjxwhM+7DYm5MT7LRFS5kiqvDNOEfjwgveUzhyG+q1Tr9Z4VrC5trvjQMe
 q4rU1PzF4vtkxpx0amU70PNXUOpRAn9BT/ZPorZZLLWmmOT2RAlVMWGS6Ise9n+PF9LB/TD+2K1
 k9GmVeNGw/RY7tUPoQhbY3rjkYatIZCZPbIcwSuvHDQwmmHAj27newYMolS7Ymym+CJo3sEua5P
 hSuyKRdQ=
X-Google-Smtp-Source: AGHT+IHjXjnNaJs4mpv+QbUUX8obW8sAmU/EZar1U85z03oyOBaK0Zh98OMIpjOXdxPItTkxI0ZxFA==
X-Received: by 2002:a17:90b:4f46:b0:312:e49b:c972 with SMTP id
 98e67ed59e1d1-3159d68a9cbmr18302917a91.15.1750691685273; 
 Mon, 23 Jun 2025 08:14:45 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 08:14:44 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 1/4] rust: introduce `FromPrimitive` trait
Date: Mon, 23 Jun 2025 15:14:27 +0000
Message-Id: <702d21d34368b1dcd896343771b00a2303e9a312.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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

Introduce a new `FromPrimitive` trait under `kernel::convert` that
enables fallible conversion from primitive types to user-defined
types.

This is useful when numeric values need to be interpreted as structured
representations such as enums. These situations often arise when
working with low-level data sources, for example when reading values
from hardware registers.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/kernel/convert.rs | 154 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 rust/kernel/convert.rs

diff --git a/rust/kernel/convert.rs b/rust/kernel/convert.rs
new file mode 100644
index 000000000000..fb01a0e1507a
--- /dev/null
+++ b/rust/kernel/convert.rs
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Traits for type conversion.
+
+/// A trait for fallible conversions from primitive types.
+///
+/// [`FromPrimitive`] allows converting from various built-in primitive types
+/// (such as integers and `bool`) into a user-defined type, typically an `enum`.
+///
+/// At least [`from_i64`] and [`from_u64`] should be implemented. All other methods
+/// have default implementations that convert to `i64` or `u64` using fallible casts and
+/// delegate to those two core methods.
+///
+/// Enums with wide representations such as `#[repr(i128)]` or `#[repr(u128)]` may lose
+/// information through narrowing in the default implementations. In such cases, override
+/// [`from_i128`] and [`from_u128`] explicitly.
+///
+/// This trait can be used with `#[derive]`.
+/// See [`FromPrimitive`](../../macros/derive.FromPrimitive.html) derive macro for more
+/// information.
+///
+/// [`from_i64`]: FromPrimitive::from_i64
+/// [`from_i128`]: FromPrimitive::from_i128
+/// [`from_u64`]: FromPrimitive::from_u64
+/// [`from_u128`]: FromPrimitive::from_u128
+///
+/// # Examples
+///
+/// ```rust
+/// use kernel::convert::FromPrimitive;
+///
+/// #[derive(PartialEq)]
+/// enum Foo {
+///     A,
+///     B = 0x17,
+///     C = -2,
+/// }
+///
+/// impl FromPrimitive for Foo {
+///     fn from_i64(n: i64) -> Option<Self> {
+///         match n {
+///             0 => Some(Self::A),
+///             0x17 => Some(Self::B),
+///             -2 => Some(Self::C),
+///             _ => None,
+///         }
+///     }
+///
+///     fn from_u64(n: u64) -> Option<Self> {
+///         i64::try_from(n).ok().and_then(Self::from_i64)
+///     }
+/// }
+///
+/// assert_eq!(Foo::from_u64(0), Some(Foo::A));
+/// assert_eq!(Foo::from_u64(0x17), Some(Foo::B));
+/// assert_eq!(Foo::from_i64(-2), Some(Foo::C));
+/// assert_eq!(Foo::from_i64(-3), None);
+/// ```
+pub trait FromPrimitive: Sized {
+    /// Attempts to convert a `bool` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_bool(b: bool) -> Option<Self> {
+        Self::from_u64(u64::from(b))
+    }
+
+    /// Attempts to convert an `isize` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_isize(n: isize) -> Option<Self> {
+        i64::try_from(n).ok().and_then(Self::from_i64)
+    }
+
+    /// Attempts to convert an `i8` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i8(n: i8) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i16` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i16(n: i16) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i32` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_i32(n: i32) -> Option<Self> {
+        Self::from_i64(i64::from(n))
+    }
+
+    /// Attempts to convert an `i64` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    fn from_i64(n: i64) -> Option<Self>;
+
+    /// Attempts to convert an `i128` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    ///
+    /// The default implementation delegates to [`from_i64`](FromPrimitive::from_i64)
+    /// by downcasting from `i128` to `i64`, which may result in information loss.
+    /// Consider overriding this method if `Self` can represent values outside the
+    /// `i64` range.
+    #[inline]
+    fn from_i128(n: i128) -> Option<Self> {
+        i64::try_from(n).ok().and_then(Self::from_i64)
+    }
+
+    /// Attempts to convert a `usize` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_usize(n: usize) -> Option<Self> {
+        u64::try_from(n).ok().and_then(Self::from_u64)
+    }
+
+    /// Attempts to convert a `u8` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u8(n: u8) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u16` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u16(n: u16) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u32` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    #[inline]
+    fn from_u32(n: u32) -> Option<Self> {
+        Self::from_u64(u64::from(n))
+    }
+
+    /// Attempts to convert a `u64` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    fn from_u64(n: u64) -> Option<Self>;
+
+    /// Attempts to convert a `u128` to `Self`. Returns `Some(Self)` if the input
+    /// corresponds to a known value; otherwise, `None`.
+    ///
+    /// The default implementation delegates to [`from_u64`](FromPrimitive::from_u64)
+    /// by downcasting from `u128` to `u64`, which may result in information loss.
+    /// Consider overriding this method if `Self` can represent values outside the
+    /// `u64` range.
+    #[inline]
+    fn from_u128(n: u128) -> Option<Self> {
+        u64::try_from(n).ok().and_then(Self::from_u64)
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..861c9340d9c2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,7 @@
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
+pub mod convert;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
-- 
2.39.5

