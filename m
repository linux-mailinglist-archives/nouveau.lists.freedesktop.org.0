Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA9CDB4AA
	for <lists+nouveau@lfdr.de>; Wed, 24 Dec 2025 05:00:34 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D723210E331;
	Wed, 24 Dec 2025 04:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S7uJmHps";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8E18444C5D;
	Wed, 24 Dec 2025 03:52:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766548369;
 b=VKwGuLA9htk13ihX8CeyjVIMo9Xm+dSMiH9K7XwGy+rka8r3ePSrHr/lJ+AavTrtVVWur
 wyPMEYL861QJkqy3jDMyU3e+8ex+gPjy5aX3oxBP/hmrlX4AxiYoi+BDnf8hyh5iISkH94j
 C+PQuOGQw9LKj4owCePArBU7L/tBnJkO8+BewEgrmtrVJHkmVD0I4G6AAPSvu/sBOZ2TY9/
 XJLCz7Noyd0PPAIwi5he8Qts+zQv6XtiMtymtf32huqpL8jI3Gjjl3yJHubXjaGWMHcMCvc
 YTMCsDmV/M3UNT7Me895Uh9Y+zdH4m4bvPXaPTlC4WMB5sFNS9cxMnZj+9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766548369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mkwxtv2tcqZ+eg9BpVXUQ9wLIpxRDXBq7bR2sRAqPuQ=;
 b=KYN3EAoGhmeFh/lYpCN4/luTtb0DiYMOAMbnl9+fXkCC+K+CHHnLi2GoOOGdtTyYcN4xt
 Rj/9jqLGMkTyNfy883JSrStaQ6Wy2Ezx5sr4wTE4RWsF0VNIwzn/5J8AbFmAQGaL23a0+IS
 jYFnEfRRmzuwfCi++ienpsnUZIhn2XgiBPMKjgTwvTaSos1FYb41tuWe/gcxiVW6OSzXnUY
 caYM7u30X+Ol90nMDexz9jnlezVGCPxQEabaQLJt7HopaX6RISkAbMM8BK8E72BBTW/+09A
 Gl9o8/F0y9jWSmwsueMN/fW6ByGSC8HqUeurX8WGmRpPgwvVlcO5zRbzgg0Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE70B44141
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 03:52:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1210E32A
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 04:00:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7e1651ae0d5so4467616b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 23 Dec 2025 20:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766548829; x=1767153629;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkwxtv2tcqZ+eg9BpVXUQ9wLIpxRDXBq7bR2sRAqPuQ=;
        b=S7uJmHpshj3rj4jVLjEkn0ALnwGM6LVOhpVP9Kk2x4yEHPKkWEDETychuB9ZlhxMS9
         ghBRSGZU08qJJ8xjKcxwiDSSY3QtPDPOaAOhFvSYnlpMQd4KOekIjz06aOvSzudMu8c9
         3Y1UDA2E89TaNW7sqNP0lQM0GlapGn/p/MZagDRPUX0d3JMDc7jPj7j6OVnBjxNpD3MB
         1oho5fQ5PwJh72YKi5USvhU4JzGMxInXhfIomO2zsqGNSUYUWHpfypldbTTUA1gZt/zN
         Mi2QH7xK1oPEboYWn8R3sl5v/EbdArdfF82fT8l0UNPaMo5iogqZNYBV9ZKXmm8guK0b
         07bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766548829; x=1767153629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkwxtv2tcqZ+eg9BpVXUQ9wLIpxRDXBq7bR2sRAqPuQ=;
        b=s0TRVlrKSKhH0IV7HKDPASotWkAl09sGShFjc/qLRttTFohmn00CxSSaYnkxzSGT6n
         CkX1T/4ImCR3bBC4uLw7qK3VdVCyOHntHofF5pFOYJZLeeI2PBc1R9CbU+PodYXMPq2B
         eWXrGt/G47gH1Xl3x89SI6wM/FET0AEWdEMCZUzYzl1zPGwPx8gmKj7mdk/NeLJyT/N0
         6fMNoK6Ki/3VYNNQsy5Afy00GDWacQjNykRkT5B7T30AK2ajPz0992H5lW4rOr/VFX97
         WWOk3AzJ7/u/VTyGMS1sAnZsmqgz9PdFGBgBKUqgObr9zrbeiAh3bcnvFQ77rebDV1XP
         YPQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0lDb6lovgusl+PNqSayxBDudXYTZ69Nq26rxvoQa40+vAkJigfnd71BHZhKk1Twt6YcXdgpfW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrTuV8+OBc3ERHCHQldc7u+25xmiA07s1t1mgqJCZniRzXtGJo
	vSvQqjJ0//WFndh/c99Bw/LAU6ICIPHXb/YV4q/gArhtZf60Nm9Z7/e3
X-Gm-Gg: AY/fxX7m/gY6YiS4qRTEao5UFDeq1gN4c/IlPDbII+/jXi8SNE2DDJXuqCipu/kDpI2
	+SzRp49IourH2QJrNXIG3Hs85fh9NrE3DPIqlFR5/7ZZO5S0uqaktl7qAJ7AATzG0KBlBpca86g
	/1/HOXjP2xA/cso0z92Ew1yJPj8RZwi/LxwcAa5ydOiBUVOObzynyP+aoSJfuBo99sx43ZW1RQT
	m7BEawKl3X576KnA+M14fwzoo3PfrR1VVuADQ1wNl9q6ZVNZjbhsUgUaglu0PFC2MiRkytR4ptH
	B6onGyEe8Y/F8qoktfbUyhuGnkVBbPVy+OtF9P9+6DI54o3Wjv9xWGN1jENZRmGlNzAbM/PaQRh
	iETmIQwbozLq+xmen1Qv3c0YazqEKMNuZq+N7u4FQj+GFbKaulxXtoqNaVEHBL0JuUHqkdCvL+T
	5DD8V04o8kONqCRo3q36og/Q==
X-Google-Smtp-Source: 
 AGHT+IF8d3Ro11kpgCi6eRfTtq+mc1aavRgY7ZNgf4vUnw2+Bof1xnaW/PVlb6H/zAFCBHJVO7PXPg==
X-Received: by 2002:a05:6a20:939f:b0:366:1fea:9b54 with SMTP id
 adf61e73a8af0-376a96b9a4fmr13776384637.39.1766548829368;
        Tue, 23 Dec 2025 20:00:29 -0800 (PST)
Received: from localhost.localdomain ([104.28.249.217])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7c5307c7sm13255131a12.28.2025.12.23.20.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 20:00:29 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 3/4] rust: macros: add private doctests for `Into` derive
 macro
Date: Wed, 24 Dec 2025 03:59:56 +0000
Message-ID: 
 <8afdff63fdebdfd619000e711e010191641b669b.1766544407.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766544407.git.y.j3ms.n@gmail.com>
References: <cover.1766544407.git.y.j3ms.n@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQI7SVYKDGB6C5TSNTVQCMC6D3JS5VNX
X-Message-ID-Hash: ZQI7SVYKDGB6C5TSNTVQCMC6D3JS5VNX
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQI7SVYKDGB6C5TSNTVQCMC6D3JS5VNX/>
Archived-At: 
 <https://lore.freedesktop.org/8afdff63fdebdfd619000e711e010191641b669b.1766544407.git.y.j3ms.n@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add internal doctests to verify the `Into` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 436 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 436 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index ceaf089c1ecb..7159fb4dd187 100644
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

