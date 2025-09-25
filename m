Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63BBBF7FB
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07710E64F;
	Mon,  6 Oct 2025 20:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkfAqFUg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA7010E938
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:54:34 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-7960d69f14bso4700366d6.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808473; x=1759413273; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2xzf6OZF5c76vENMOs87EjkdVa89C5AWM8vex+/TLyw=;
 b=DkfAqFUgNwuk9LmGbTsaxYxrckcWpnkHYnlYxKkgJjjSOi5vTnPmvY0x7yfWSOYtyA
 QIfq2xVgYF7KiIsbOKJc+rEpDhz0vWBlqUJ7VxSy79POpd7VqpvG7BBCuFl7bLffG12j
 AiF2UMhEPzqowsncNojmd6Q0tgsJw+7fJJEELR3Ss+KEmxEph6yH8Qard9tbaEIxfX4c
 tqwIit86uAtMSCULKdrBnB+6ZhPk7ECqtgTpZwEEWBuCg3C2m/o0iC6L2WlKxsrLs+UH
 H2FI1QniJS3K7sBep4bbAbJiEVM27Zmpao2j77kZhtWiOkxcRwofApJjwliPZJHu11Gv
 thcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808474; x=1759413274;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xzf6OZF5c76vENMOs87EjkdVa89C5AWM8vex+/TLyw=;
 b=c/2OdM3T47BC/Xq54MHDnHwrMyN28Ucxi/7NKB+RnBqhqRmEwEen8p8VjFO3NJPSWp
 hgb6hW8+y6PBvfbcIkHLY1duu6Qrx8r577gte/kY/aPB4Qda+Az8LnHujFxhuvoh+GpZ
 qf6EBzqUzDdvlC1U7+R+4Pb3bJKtcGbUBHol9ACTNrte5y+nbjE9TyAs0RDPa4/8L77q
 D7VJr8X6l9XZj4ST9ID979aU5TBwXqdtWlFbtUT8yMBBgE27Ztco7/p8GJ+Zj4whyRXG
 Oof2D63xr9Rid+Dfm5he281ZGDppbecc5hvhWWvKC/FUOiT+NC9G6lcTrC9/EWFw5SpT
 TKdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdnoG/1kvmaUJIToQjcOjiX9g8Li9nCAKZZQ5crDJAKJ0hLfJN4A/XoOyhupFuGjCek9AbJm9n@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx37o3DExDkcHj8MX+lVjYJo24sV1NFOVtKpJzrgoptctNsBdI8
 fk7BSu9caB+s8dehJaKZqiVhGav2QiPXEBL5owXtdKrRvB9oTyQRfsAX
X-Gm-Gg: ASbGncvk02jZi4wgXBXH5hBQ5WsAyH3vFnaZ/L7y+rsfNXjtv69VGzGYV67Z4iEVvO0
 1N7usy1c4NTR+GzaKPJetR6EHIGmysvDYz2/0ZeaSjT/1KAop95nMSGxnzSK0wTjoM/m5Kisop6
 RBwT6ZK8hUsCU5zRn1gbVQnrV6iMfHtsvMtTwZZ8yshyp4aSSYF3yC8H8Jyg+Gbow4q/82t+cCh
 vX/UmV0G6DQ7UFJh86pFu1sUSRFjQJMqne7/cLVlxJROpIrpcazuh5NiIbTRN9vBXLrUj539VQ8
 tnYbdaTl8sSqc+53Q9Xcw7bQymbOCUEW29Ap2dSICj21nB1Cdf1I6WxeWegj6MFb/rh98FWlmIk
 ccI4aN2h2PZGU/jpR+5PbkjbLhRHB1iaaQ2l/Ksa1xodbOQVgsQvwbnHnoQ5RZBqVNWf1JyXFxL
 6vSjMSXDw94QVYNct/pAlcAPxE6toZzqqEscYEoRxBbHvD+Qm1SEkrPUJzaXEmojQIJQLP
X-Google-Smtp-Source: AGHT+IF/YXOPVFfPbsLgNMSmKy5gMrqFYiERb3qNmBjJICdsnhp8ZUohxvtzmsCi+i1Rv5C0gLGPJg==
X-Received: by 2002:ad4:5bc9:0:b0:76a:fcee:97aa with SMTP id
 6a1803df08f44-7fc309ec826mr47810606d6.29.1758808473264; 
 Thu, 25 Sep 2025 06:54:33 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:54:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:51 -0400
Subject: [PATCH v2 03/19] rust: auxiliary: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-3-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=1276;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=hAcmGZ1oTJ4jVBQJEYJ6EMTc7nRfLDtEyG/sjigYIyU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEE+jmobZ+OS5gJ2DI0z3t4gywTvP6wS/uYHw9wdi8Q0VEYO/oiFsjlDMO0nWijf77etP3ctTic
 ZfcFfCn7DRwM=
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
 samples/rust/rust_driver_auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f2a820683fc3..7c916eb11b64 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,13 +5,13 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
+    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+const AUXILIARY_NAME: &CStr = c"auxiliary";
 
 struct AuxiliaryDriver;
 

-- 
2.51.0

