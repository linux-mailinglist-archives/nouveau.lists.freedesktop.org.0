Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E913BBF7BC
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A269010E5FB;
	Mon,  6 Oct 2025 20:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNrklmo9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8410E93A
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:54:41 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-79a7d439efbso7608086d6.0
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808480; x=1759413280; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r6lalX/iBRsGnpItoRbVPuxYp6EIBWS28tOUXJUE06A=;
 b=lNrklmo9Y0BYOkdtSVQAAFB8+gD8JHT0iiNxawKvbdUvZijP/35HU5EbsGxRa2F629
 gMRg7sXI3Z+LBlMUmmenodyKbk52rHE5yV9Rhkv52VIgstq8urz6Wkp9fpTriUFRo3NB
 +pz6WYlev0J5WCr0wEYdfHkuw3uUKbQMlDSocGsu+4xdhS4P0Fi7El2KhdW9o7uchAKw
 kkzMwGSs5EqGCdFBIg/OBSBrq27YlsV4IuY849SxPqroGEiot5OwczKQzE8JqNL6XVus
 r8Nqec8+DhTR7TEhQMTT0hxuMHT8tF72L13ms4erMbYu5qhtp/2Z4V+qq+Z2p+VDtk5A
 nNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808480; x=1759413280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6lalX/iBRsGnpItoRbVPuxYp6EIBWS28tOUXJUE06A=;
 b=NuTGpAr2oqUcGzlW9xquvBotkaokh3x5vokKHZpa4NvI5pqR/rNgQvAIkknvAIwOtY
 V417XfHmjT6uxulfkWEBrnzvP3BvMDThksJsp+/z7+g+QfBWx6Ngi3CwHPw7NhaTDxQF
 nzpimKnO8LYqyCCPZ2sub7/lAFYW2XVyfACQdJqgxrF9VaEaAH5WW/Als6XZj+SiehXc
 chUD7fp/J3spIUXv1e8mzMoEKtDO8vRQMYjamutoCEM4fo9jFLPTivHQqeDqItY/K39w
 GrWx6atIJ9+k774E6hoeoNlevcIQP09zAUi+BxqfyStqoGu3zYLfIwT4tjuihruzVdCJ
 xzmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmBfPb+Rnk4jfAZ3cCA7MhpjMrJSbyrpdVJx1oitT0KcSDREciVM5BtvlB0AwVi+wGHHIGnvV+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmiefThrZhxTKjHKnMH1WfyFx0sLCIKj3b1b9TDB1Et0DqWiFj
 ZOT2/VO8MTaedwIdqh8bNDoAXzLWN+waD0sq3SBW4of73uWQ3FnJeMsh
X-Gm-Gg: ASbGncvdeEbMw+DVzf6urAZuZY6NDVAGNO+dWwDKdFWSVcqvW9gN4idwW3lUG+LbnRJ
 2UrooHDy59zGJR0gO8Cntve1c1QBPdXg4Ac+ApqnQOyGc0IMLM/b3oDWqw3EE/CdHth8KQKtwju
 Gxx+FJLRTopr6+AOFJ+tnhc//jQwWnS6uNQzqQ4cwwni+cPW+I0GRnw8zWa7k8VGpflJ7mfjULS
 zG3UG64gPWu0TAqWYNit2N+PqwJ6cK9ataCxHm8DVjMaKBB2v0orDyv0/RvfRTk8cMvmVJEtUuw
 XFn0xM6D3yxsZjBymbXnWTICV/4VYRtphunx6CyFHxG+I13o76HjN3vXZNKpZlWzIgz65P87Ril
 qCCa1Z8StKNmutcTOvbZTxphaPoBt6PjylVmgEtvS1kwQEDEZroF/EvmgjAGPobepBvZ3FSxorG
 UdmqcLkdzT1Iq9UXMKP5xm7FicdIMeR6Kk+VuN9mT0XOecQc0H6dRvGhvvcd7lFLNeEMbV
X-Google-Smtp-Source: AGHT+IHepv29FfYPtTdxgOoNZgUW8YipGs8v8IsYeK+WMtrN5j7d3Ey2ZO1H0B0PLPCt/i6MFpqqEg==
X-Received: by 2002:a05:6214:e44:b0:782:1086:f659 with SMTP id
 6a1803df08f44-7fc39463963mr48276926d6.26.1758808479997; 
 Thu, 25 Sep 2025 06:54:39 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:54:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:52 -0400
Subject: [PATCH v2 04/19] rust: clk: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-4-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=1787;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=bBVznekpj7qdZ0+04IhJTyz4wbdj27t8Hhu1jfona5I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIaSBovkrkMRrRLSQD5J+u5uy+nbEnxtyP0CB8hGaKgQan89NKIGBwidRQmE8SW0OYKsdw9ArOG
 kkgFhmd1d2QA=
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/clk.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1e6c8c42fb3a..09469277e95b 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -104,13 +104,12 @@ mod common_clk {
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{Clk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = Clk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///
@@ -272,13 +271,12 @@ fn drop(&mut self) {
     /// device. The code functions correctly whether or not the clock is available.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{OptionalClk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = OptionalClk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///

-- 
2.51.0

