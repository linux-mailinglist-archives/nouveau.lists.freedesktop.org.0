Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C608B3ED95
	for <lists+nouveau@lfdr.de>; Mon,  1 Sep 2025 19:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFAB10E03C;
	Mon,  1 Sep 2025 17:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xu6OJ+S4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D6110E03C
 for <nouveau@lists.freedesktop.org>; Mon,  1 Sep 2025 17:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD86D44840;
 Mon,  1 Sep 2025 17:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5EDC4CEF7;
 Mon,  1 Sep 2025 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756749497;
 bh=lnUYxEo+qbQ/4L8pc1O8ViES3IqqvQLMaCk/XcJ2ZZY=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=Xu6OJ+S416039lcQl4+pAQ8cJbk+JNPmi8uGtmHLpLMOU+d8DhBYVYD+qpvto5aXn
 CaXjNnhZxpzdmX7Qyfi29U9SvWv6eFeYsmNOSBNjd+Jv6B01BHplQ47vHpfIgqiru3
 xWOye+MsWB2q7for6LafODy2ijg7hQRnFigzy6ANdmbfbHpeszEsM8DiEj+pmwa9oT
 oME75FpJxUOaZP/cfCR7EcMGqE6Q//F5cKQBO0iosgx8EmhHi0K3PqdW/srebeoAB2
 eRxTxWBlOG2dx1g9CuNl7X7Jc6urnHpxh8YAauCuUQaqieytpdMp+yY/gdZ3JpdUZf
 6AH2ttoIWVGwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 19:58:11 +0200
Message-Id: <DCHNPZ8G5FP8.3VTQ0RQMQ6NT@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 0/6] rust, nova-core: PCI Class, Vendor support
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Elle Rhumsaa" <elle@weathered-steel.dev>
References: <20250829223632.144030-1-jhubbard@nvidia.com>
In-Reply-To: <20250829223632.144030-1-jhubbard@nvidia.com>
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

On Sat Aug 30, 2025 at 12:36 AM CEST, John Hubbard wrote:
> Changes since v7:
>
> * Applied changes from Danilo's and Alex's and reviews (thanks!):
>     * Removed a blank line, one each, from the Class and Vendor macros.
>     * Moved example code location from struct Vendor, to vendor_id(),
>       and introduced it in a later commit, in its final form.
>     * Applied Alex's Reviewed-by tag to the series.

I think you forgot to align Debug and Display, i.e. Debug still prints deci=
mal
values.

Is this intentional? If not, no worries, I can fix it up on apply (which a =
few
minor doc-comment nits):

diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
index f6ce8f8a2a4d..f534133aed3d 100644
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@ -26,7 +26,7 @@
 ///     Ok(())
 /// }
 /// ```
-#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[derive(Clone, Copy, PartialEq, Eq)]
 #[repr(transparent)]
 pub struct Class(u32);

@@ -81,12 +81,18 @@ const fn to_24bit_class(val: u32) -> u32 {
     }
 }

-impl fmt::Display for Class {
+impl fmt::Debug for Class {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "0x{:06x}", self.0)
     }
 }

+impl fmt::Display for Class {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        <Self as fmt::Debug>::fmt(self, f)
+    }
+}
+
 impl ClassMask {
     /// Get the raw mask value.
     #[inline]
