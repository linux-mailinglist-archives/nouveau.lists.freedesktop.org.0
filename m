Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81ACF1457
	for <lists+nouveau@lfdr.de>; Sun, 04 Jan 2026 21:08:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A910E302;
	Sun,  4 Jan 2026 20:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ItHY2sxt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="H9sW+hTB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 26D8844C6A;
	Sun,  4 Jan 2026 19:59:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767556791;
 b=o2fDBWXcCVj+a10niA0dRh3vS+0U5VxL+NVtm5GorX/SKXd3AZtBmabFknM5ox6IZbh1a
 UufvaoWcPfeGM1XEYzw0xfEfTOH7ahAp4BTCXSl1qTuruqcUXIvOZ1MkKQvc2fvbD2HAdaZ
 x2BmSIBiyGAC11oAZ4ntS7vvNIp6DxuW4/OD3pkWuFrinEAZLLVbdFgzOqNmtRXVFks6cKv
 FBA3Se+zOrDJ7+lHnrMe/pDSwQdQQx/Iz9L8RHoml6ZPWcziXZ+WLIysqYiwOSJymP9+Wae
 Dx2MRA+e6bWccXZJQykWh18lQMya3fCcMC+7tBSD73H2VB11iaHIce4YQmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767556791; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EI5J4p+axLP7z2aq6eHJ9D//w05BSzabU6OGTBUhdsk=;
 b=yUwTgCEdtpyjC92Bi5iek3UA3IFbN2JBlAXGD24ONd4Ckh1cqArQJVbiAgaz7ezC89I5e
 LspDTF17jKDlgR8W4AW1QwCHpX0dcr6+6AWCDSf8EZujZpusCBLuKQ1j2maV+7NZ88ohQuH
 pqoIJclPAhdJPkrSUebkexB7pAh8WlcEQRYWVyAGZHWawtqipnIszYGNJViWo70DVN38Jr7
 jRmk5NxLG+R5PskLSehepxG64KxmkeAvJLR4YcMZRApqrWZsQNtrys5SscIFj3/iI+yQGln
 4XWjT5PgfDuY9XplPc/Gny6sxmWYLtWY6mBTi7yi/mXNhj5jM0kELs4eELIw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 66670446B8
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 19:59:48 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2D10E2D4;
	Sun,  4 Jan 2026 20:07:57 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dkpQ40J97z9scL;
	Sun,  4 Jan 2026 21:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5J4p+axLP7z2aq6eHJ9D//w05BSzabU6OGTBUhdsk=;
	b=ItHY2sxtHXnRFL9qRwooDxKpsr2KnZiFtqX5LDtK1d+NmS7qffnU75C5ewSf+LqcpN53zD
	rJq6ab8a7N+TvXYs5Nn3e+CmSFHqN2k2SxTY3K1aCakvVE23Z4/QZSTg6UoVYsHFSx068f
	vtC2fJCaKKhzgakRjPEcvigvPQZTGoX9WVn4DiBXF+T2I3/5UBag0uczVhRFHNtatTyrAc
	jczDXBfT5jYVKGgcSz3cyh9WtYze56SYMCNBSuoYxtVq/TgmwBJKMLqoROZYDntWmuUmX2
	6zarqhMvyc4HnS03gdocOroKFnw/53x14+WU2KK/RbV3WxVbJgNC6Cbg/8kqyA==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EI5J4p+axLP7z2aq6eHJ9D//w05BSzabU6OGTBUhdsk=;
	b=H9sW+hTBOqmcGWmi+ll1NQbUVpWG1jeuxVQeRsGv5CZt+yHHPIrvGCgY5mS7R3pYPOzrQU
	XGiXSQ6e5bx7udKePQlhQMLgVTlHAqr3407YHne+6vnAERszXHxuP3mdDbobC5IVTDyVrB
	dZKm8mGHxIpLpe+1m7ZwCLCifHp39T73OkKeX3snz/KNj5sx1oNcglbqnzJ5D5qdj5rLSz
	xA9UYFyhHi7o1EiMm3DzlqPl0Bo933z0y1w9VLqkKYz8cD4o39ZRk9SANLSN4wawXQ17xA
	aKvnHkByX69kKedLsa9dz9noCcRycDrDj7bh25oVQbBZbCD9tpiRK3O9koBysg==
To: dakr@kernel.org
Subject: [PATCH v2 1/2] rust: macros: Add derive Display for enums
Date: Sun,  4 Jan 2026 21:07:31 +0100
Message-ID: <20260104200733.190494-2-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-1-mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a68a25a06434902dc54
X-MBO-RS-META: rmu7uzej3bqujr7x1kmbtarytfmx9si5
X-Rspamd-Queue-Id: 4dkpQ40J97z9scL
Message-ID-Hash: 2C6XCNI3AY35W3HIMMS4GVCQJOPH55KS
X-Message-ID-Hash: 2C6XCNI3AY35W3HIMMS4GVCQJOPH55KS
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, mhi@mailbox.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2C6XCNI3AY35W3HIMMS4GVCQJOPH55KS/>
Archived-At: 
 <https://lore.freedesktop.org/20260104200733.190494-2-mhi@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a derive macro that implements kernel::fmt::Display for enums.
The macro outputs the exact variant name as written, preserving case.

This supports all enum variant types: unit, tuple, and struct variants.
For variants with data, only the variant name is displayed.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 rust/macros/display.rs | 52 ++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 rust/macros/display.rs

diff --git a/rust/macros/display.rs b/rust/macros/display.rs
new file mode 100644
index 000000000000..5cd396d3900e
--- /dev/null
+++ b/rust/macros/display.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Derive macro for `Display` on enums.
+//!
+//! This module provides a derive macro that implements `kernel::fmt::Display`
+//! for enums, outputting the exact variant name as written.
+
+use proc_macro::TokenStream;
+
+pub(crate) fn derive_display(input: TokenStream) -> TokenStream {
+    let input: syn::DeriveInput = syn::parse(input).expect("failed to parse input");
+
+    let data = match &input.data {
+        syn::Data::Enum(data) => data,
+        syn::Data::Struct(_) => {
+            panic!("derive(Display) only supports enums, not structs");
+        }
+        syn::Data::Union(_) => {
+            panic!("derive(Display) only supports enums, not unions");
+        }
+    };
+
+    // Generate match arms for each variant.
+    let match_arms = data.variants.iter().map(|variant| {
+        let variant_ident = &variant.ident;
+        let variant_name = variant_ident.to_string();
+
+        // Handle different variant types: unit, tuple, and struct.
+        let pattern = match &variant.fields {
+            syn::Fields::Unit => quote::quote! { Self::#variant_ident },
+            syn::Fields::Unnamed(_) => quote::quote! { Self::#variant_ident(..) },
+            syn::Fields::Named(_) => quote::quote! { Self::#variant_ident { .. } },
+        };
+
+        quote::quote! {
+            #pattern => f.write_str(#variant_name)
+        }
+    });
+
+    let name = &input.ident;
+    let expanded = quote::quote! {
+        impl ::kernel::fmt::Display for #name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                match self {
+                    #(#match_arms),*
+                }
+            }
+        }
+    };
+
+    expanded.into()
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index b38002151871..4c95a132fefe 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -14,6 +14,7 @@
 #[macro_use]
 mod quote;
 mod concat_idents;
+mod display;
 mod export;
 mod fmt;
 mod helpers;
@@ -475,3 +476,44 @@ pub fn paste(input: TokenStream) -> TokenStream {
 pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     kunit::kunit_tests(attr, ts)
 }
+
+/// Derives the [`Display`] trait for enums.
+///
+/// This macro generates an implementation of [`kernel::fmt::Display`] for enums
+/// that outputs the exact variant name as written (case-preserved).
+///
+/// # Requirements
+///
+/// - Can only be applied to enums (not structs or unions).
+/// - Supports unit variants, tuple variants, and struct variants.
+/// - For variants with data, only the variant name is displayed.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::fmt::Adapter;
+/// use kernel::macros::Display;
+///
+/// #[allow(non_camel_case_types)]
+/// #[derive(Display)]
+/// enum TestEnum {
+///     Foo,
+///     bAr(u8),
+///     baZ { value: u8 },
+/// }
+///
+/// let foo = TestEnum::Foo;
+/// let bar = TestEnum::bAr(42);
+/// let baz = TestEnum::baZ { value: 0 };
+///
+/// assert!(format!("{}", Adapter(&foo)) == "Foo");
+/// assert!(format!("{}", Adapter(&bar)) == "bAr");
+/// assert!(format!("{}", Adapter(&baz)) == "baZ");
+/// ```
+///
+/// [`Display`]: ../kernel/fmt/trait.Display.html
+/// [`kernel::fmt::Display`]: ../kernel/fmt/trait.Display.html
+#[proc_macro_derive(Display)]
+pub fn derive_display(input: TokenStream) -> TokenStream {
+    display::derive_display(input)
+}
-- 
2.51.2

