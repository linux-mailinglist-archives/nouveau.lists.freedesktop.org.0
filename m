Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88DBBF711
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B786C10E071;
	Mon,  6 Oct 2025 20:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyWFhvzr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9B10E93A
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:54:53 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-78ea15d3489so7122816d6.3
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808493; x=1759413293; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NcH0HLOTSj/FtySm//oEeXI3qjx7RwnfgKjEtc013kc=;
 b=MyWFhvzrQv07ccPjqzCHMxQAU5CJSSYlVltP6ONvxObO31obgbWJucb8jR5t9O+AIi
 va96i2Dww1Lv+xNYqpUUYgBenzZTICWEYEJ07avugmUYbe4YitVIPKAPQ0pz6sMy5X3D
 QWLwHo5v5ty2CodfuvCDGO7fLzghLtc0MFLuyO4WX2mffxrdixFZrucAANDOZHWxCUV+
 Xdna4kKWryyvcz5uGxqaIxAlFsNdWJCMt3jA8/taQ85MNpLi6hVfU3KlX7SiN89xytwU
 UR0dWgVwg5vFqOM85hDMNDAcECX+kPy2zyepHHT6CvVvI79emdXf8q1zv26fe5jHBr6b
 DpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808493; x=1759413293;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NcH0HLOTSj/FtySm//oEeXI3qjx7RwnfgKjEtc013kc=;
 b=FpH+sySBhopNWLtDSlxlQrVEbS7SQmOv6bx747VISrQP/jXnxfwZFZvwF0qP7DxV2/
 riXCziCIKI93YpygdMsH0nS0Q2c7U9If0JPPdVcT6TpNyBf4CxsXdfvdewcv6x9X1ONs
 zUYS1LnNvoq2wuiPO+1Dm/V6v5NvN7XRG4DeW/VIELemV73l88b15aOMygVJf9u5j1Ry
 Lb3c+xiJLkUAPDy94yJ2Y/g/UK95KsrGNlOK1p2FZBEGspnUX/CVZusFunnaXorcUW6O
 2JKKPQ/LCgrV5/WruD+43UlQjO91AJkdQBCkeaq9/XQ3KF+uo28Tt0hSiUA4bihfgU6K
 Rd9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkMXqAOw19zthBG5IaAsWzgi2Sic5dMKoCc5lwzC4bf3+g/UNR8x5bqHW5oYXaO+vI4BZJ1gRr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbFr1X5mwE0UsZL4z0tySFrUikwQG/wXNd9XU8Yx59R3llnjjx
 1b836ySbW3zb+1c8C6pkLAP53utrgyZNVhwtxwk1vBkiXWDE4mWTI8e8
X-Gm-Gg: ASbGncurjjK5XbuI3RcWVZrLkGhQRPl7ocRXmPXxQ1esCiYL4AoOuvzHLfXm7BorXLH
 1aX07wFES/koCkQ0CcHxMcmfZqH4ztCE8mF2kJSwPb78Vc/wvwyxdfkS4/TIu5IM/7GJZLzu4jh
 dAyf9mtI9iduK/BdtPhFJcksbbHM0i2UyrdBOoHBgFhy7B1aOPNzpk1iXwK0m+zEDxWucoy+PuC
 7qSb7XBwvGbKC8U++PdaFyCy7QoL6HgvrEmYJzJ7QnGFFJR9lRQvg0LVGDqfummrzqKAUtLCk7t
 3crRdt182QTeCUAENoA4zaFhu44mcjiq7bAUJb23+T06CODnLr+5p2xiOt2m2mKqA1qe0YaJcAV
 OTpj7izQmeg5Q1wSq5pE07b7vzC226wgH2HsJBnnuyItulDnv4zc+9Lbf7AlVbEfx2UGG3PcCmN
 xw0CZ3sZctBmQXuxkfSUkNe6QgyZlT+C5CL3tSrTOOjOzm0o8A5wAyFvF5v/msXbJd13cR
X-Google-Smtp-Source: AGHT+IFFa6JfDTmizjqmxfQvOyAEd2lLRtwY0ex2OgZ0+m8iJA/xUn2p1/EJZbMyBxylc7ieBx66XA==
X-Received: by 2002:a05:6214:20e5:b0:786:50ca:73dd with SMTP id
 6a1803df08f44-7fc40d25d17mr51916906d6.46.1758808492358; 
 Thu, 25 Sep 2025 06:54:52 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:54:51 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:54 -0400
Subject: [PATCH v2 06/19] rust: cpufreq: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-6-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=2379;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Min9lnjKt/hlKTHKx8DHe+UjEz1oTNKYHDrlD//vrww=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO2LsZad4F+RVkixHdOcMhyCY96m5gE5v9iNO38GMhdV/J/W7PblbDJmxH/UCygnEMUNp04FBPV
 HU86loJ89jQs=
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
 rust/kernel/cpufreq.rs         | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 7e1fbf9a091f..1120a8f5edd7 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -3,7 +3,6 @@
 //! Rust based implementation of the cpufreq-dt driver.
 
 use kernel::{
-    c_str,
     clk::Clk,
     cpu, cpufreq,
     cpumask::CpumaskVar,
@@ -56,7 +55,7 @@ impl opp::ConfigOps for CPUFreqDTDriver {}
 
 #[vtable]
 impl cpufreq::Driver for CPUFreqDTDriver {
-    const NAME: &'static CStr = c_str!("cpufreq-dt");
+    const NAME: &'static CStr = c"cpufreq-dt";
     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
     const BOOST_ENABLED: bool = true;
 
@@ -201,7 +200,7 @@ fn register_em(policy: &mut cpufreq::Policy) {
     OF_TABLE,
     MODULE_OF_TABLE,
     <CPUFreqDTDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("operating-points-v2")), ())]
+    [(of::DeviceId::new(c"operating-points-v2"), ())]
 );
 
 impl platform::Driver for CPUFreqDTDriver {
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 86c02e81729e..43ecdc56cb59 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -840,7 +840,6 @@ fn register_em(_policy: &mut Policy) {
 /// ```
 /// use kernel::{
 ///     cpufreq,
-///     c_str,
 ///     device::{Core, Device},
 ///     macros::vtable,
 ///     of, platform,
@@ -853,7 +852,7 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// #[vtable]
 /// impl cpufreq::Driver for SampleDriver {
-///     const NAME: &'static CStr = c_str!("cpufreq-sample");
+///     const NAME: &'static CStr = c"cpufreq-sample";
 ///     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
 ///     const BOOST_ENABLED: bool = true;
 ///

-- 
2.51.0

