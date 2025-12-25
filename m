Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E0CDD839
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 09:38:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5860911AC14;
	Thu, 25 Dec 2025 08:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GO0/MFk+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6436E44C69;
	Thu, 25 Dec 2025 08:30:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766651416;
 b=IBewemRNH9fQDj7/6Y/0Otk26L7c5kGr6XvpvgQUHQhqAJ/HJVctgYLvg0AlZTsQNiTyJ
 perfQv6YwTVcnvjHkDjt+qF1eA6PFwCgdG/BU5g7MRFzFHJAyfoeANJMgHVj51mz+/HCAm5
 5fWqsQ+fwctjYi3A7S0XFSoXPhdaw1zNRdwhXF1W2lLp3RRBRduJLRWDUhuKPIoTOXVfMZ6
 9d4N0FVIBqDsXcXZ38a7RbpnUpW+o9jqe8AoKCgrhFkob1I0M0O2GgEm1rcFzQOz6xFoq5W
 O0M5HOKVbUeIHp2i6h8gVHUWQJprIqoga32MgSu5Kv++CmKd7EIj/aKFi8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766651416; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rah6RBp2RcpeJY2cawPpvCzx3nE3lom8ezgPB+v1qDo=;
 b=Iui9j/FiWVNLaymnAIDMI0uIcShPFt1/hW8MbOmg64xPB+IlXDVmTpq2jmND4dNjlRu9K
 9jTvOlEeLvTqaK3j+yl6TI4kPtP56UcL7C7l2+O41w8u4sQQO2C8Lm7TwqGQv0IR5V72YP1
 AcNnirKEpChoipA9FK3oKaJuh05A6mjIecl4LGpibBwo9/ajN1x/pJJARVSjqdKDgqcxRwN
 j2TMw3VZlP+QagKbxiHPUWGZ3VlHsRbLf5N0sWWQ0uNK6opHPHnB9gefXOkbxJ3p6mX06p2
 73fzD/RJjjef/xTIYXxyjc7Y0A8LNTXFLzQf5e204QqIMBkiqoYRPBBwfeMg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1ADDE44C67
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:30:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E34B910F3D6
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74DCA4449C;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46372C19423;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766651875;
	bh=eBZWbUMtB9g7AP2jiTel5PiCma6wU3T2xSvKajGCa+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GO0/MFk+Zww35ruZgCPHwcBXrPNtjt/EXlCrRRWa+BhlO4aY+LUJta+tEnCaI03vm
	 XD99w2M6W00RsKhZ8OKwQiosMC2l+WUbj4ubSIlOO4YX0f/9YcHo7vQ81+5Mr6hF+Y
	 WdILR0Cydgp+KiWVf8GPPzbQ0YA0+OyoWWR/+jPIbZjvuNP8FFA7g+eksy8cQMgsxm
	 KiDNd/9zrcoSef0qEiBow5URUTVY6dB/0M9Cam8KFrHNp9BTaZlZMcOckLQXLiYelF
	 pnJhfyxLda3OqOE52o9gcb1X+O0Vvb6czYHWjAbHatqHjnUHmVEEvu/RcWVLiJcd6w
	 H+tr8DHTpmN1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D986E7AD45;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 08:37:49 +0000
Subject: [PATCH v4 3/4] rust: macros: add private doctests for `Into`
 derive macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-try-from-into-macro-v4-3-4a563d597836@gmail.com>
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766651873; l=12327;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=lMOPIc4clzbCypgXQIv3rNSmwd950xQ9+ntiFJzHqx4=;
 b=T6p9JQKyPNjovnL84Q1S3wtM1tzNhIr3rm4p87AtpW7GOZWsR6H2HEDWIsDNdhCNbb1lFdv9o
 A+zo9xyyrgPBpL3GHCsJ/uaqKUT0pR7B5uyNv+5w7sIzcFglQrx+AY+
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Message-ID-Hash: NLZ6GGVN7SLMXMOVMNZN5OPXOS7CYIPV
X-Message-ID-Hash: NLZ6GGVN7SLMXMOVMNZN5OPXOS7CYIPV
X-MailFrom: devnull+y.j3ms.n.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: y.j3ms.n@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NLZ6GGVN7SLMXMOVMNZN5OPXOS7CYIPV/>
Archived-At: 
 <https://lore.freedesktop.org/20251225-try-from-into-macro-v4-3-4a563d597836@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `Into` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 436 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 436 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index d49a58e85de16d13ce9a51cafa31940e42c5840f..63b391a47867fde3ed3d4873daccfc50b0872314 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -529,3 +529,439 @@ fn is_valid_primitive(ident: &Ident) -> bool {
             | "isize"
     )
 }
+
+mod derive_into_tests {
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u8)]
+    /// enum Foo {
+    ///     // Works with const expressions.
+    ///     A = add(0, 0),
+    ///     B = 2_isize.pow(1) - 1,
+    /// }
+    ///
+    /// const fn add(a: isize, b: isize) -> isize {
+    ///     a + b
+    /// }
+    ///
+    /// assert_eq!(0_u8, Foo::A.into());
+    /// assert_eq!(1_u8, Foo::B.into());
+    /// ```
+    mod works_with_const_expr {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(false, Foo::A.into());
+    /// assert_eq!(true, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `bool`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `bool`.
+    ///     A = 2,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_bool {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     A = -1 << 6,      // The minimum value of `Bounded<i8, 7>`.
+    ///     B = (1 << 6) - 1, // The maximum value of `Bounded<i8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ -1_i8 << 6 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 6` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = 1 << 6,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `(-1 << 6) - 1` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = (-1 << 6) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    ///     B,      // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ -1_i8 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ 0_i8 } >(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `1` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `-2` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = -2,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = i32::MIN as i64,
+    ///     B = i32::MAX as i64,
+    /// }
+    ///
+    /// let foo_a: Bounded<i32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<i32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `1 << 31` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = 1 << 31,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `(-1 << 31) - 1` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = (-1 << 31) - 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_bounded {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     A,                // The minimum value of `Bounded<u8, 7>`.
+    ///     B = (1 << 7) - 1, // The maximum value of `Bounded<u8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 7` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = 1 << 7,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    ///     B, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = 2,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     A = u32::MIN as u64,
+    ///     B = u32::MAX as u64,
+    /// }
+    ///
+    /// let foo_a: Bounded<u32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<u32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `1 << 32` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = 1 << 32,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_bounded {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = isize::MIN,
+    ///     B = isize::MAX,
+    /// }
+    ///
+    /// assert_eq!(isize::MIN, Foo::A.into());
+    /// assert_eq!(isize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = (isize::MAX as usize) + 1
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_int {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = usize::MIN,
+    ///     B = usize::MAX,
+    /// }
+    ///
+    /// assert_eq!(usize::MIN, Foo::A.into());
+    /// assert_eq!(usize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_int {}
+
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>, i8, i16, i32, i64)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i8, i16, i32, i64, Bounded<i8, 7>)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    mod any_into_target_overflow_is_rejected {}
+}

-- 
2.47.3


