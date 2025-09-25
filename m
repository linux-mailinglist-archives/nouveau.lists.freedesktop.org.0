Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58575BBF751
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A9F10E613;
	Mon,  6 Oct 2025 20:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6kZgU3x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73710E93E
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:07 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-84ab207c37cso75488785a.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808506; x=1759413306; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YqTcvT5yONUFeYmOIO5vRSTnodd8gLQVUhuVrtBW+JA=;
 b=B6kZgU3xh7DKTM0FVmw07r2/LYKvs1PGtu1/4mAa0wuSkqt6yZGQPxzMIqWBlGtWHk
 J3C9RgJuYxX09OEmUwwrR1VUo1cYQazYdwsmKRqq98rZSzdGm+f31qaCT/LD14q4TvzR
 22ZNNYZZ63f2xWdxl6Dldwbs7DudMNM4cxbYXhy4iXPpefbpo6h9VxaGxbVOqHYIb+XB
 pf8oD6vxUmGaa5KtIQi9m5mAZEDqN4oe3GPcgQvMvqlZhxeKOHv0lKhkSvYwnTP/EUM3
 RAhgBeslr4fS7istYGDJW7/0CJ3nU6cIm+I24NjqbS1vn7kL+Gweki3fIhPPYJXjpzJH
 taVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808506; x=1759413306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqTcvT5yONUFeYmOIO5vRSTnodd8gLQVUhuVrtBW+JA=;
 b=tCDMOgt2lb38kQ/CDtIALYnNlZ27VhApC6WGd1P7sqZgjTqn1vlkWW4n7Ru1I6wuS0
 +DByemPNeEn6McWaF/EEfIWGqxiPiN5w384wFKH37gdVvMRh65IKPAS57csf4DJPvYiP
 CUYT+E3xkqlRzc+PFMmcJ9I9wZCqjLCo4Xysp3SBoagHo7ltl2y1927RNL92r/35szej
 TrkKZUJPxsZn2iPJv1O1u8D3FhwtXN+3UWTeXH0UUok7mPyHl/TY9eGi87s79D25HeQO
 rbCKml/q4Wlw4zt0T9+9GBIqphL8aG5jyhnfEWifSAzCj5Mv8P78hFHjfq7upaw50jrf
 76aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+bjCK2R8yRYNoJhHo41axm+k9bDFdqrmQy7LWEZd2VBAY5IocbOmgelQpdInz7v0rDDARdse@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNavzTkiAnu80X6weW4Xt5+0pCmtbJ+p4KwJuK67FJhd4W3l1L
 nJnov86QggJT41c73n7ub4EYBb3zsYiJRNh/xL4wRgM2bUKMBxYBNdQ/
X-Gm-Gg: ASbGncsuC5pJS6AkFYS8wChVuclUQVPOB5ittzlxyvzyrvVJgLZcZEuGf2QqW+xbMw0
 hTaj8utznD+R9t83/QJUJk+eEm+DmCDd5EDw5lWjBgSPLZb3XF3mmoBYdjwJEjd4n/QlbhYuieZ
 0CbFQM0phWs/3GSbrtHw0S7qMi8rz1jQBrY6v65iZ5PYFTHW60PGu7/H+RFWpKdg/0k3xfBmksr
 iww1R1Ok+oPL23Zf039s/G9weJOmX1C1ijEfa20+jAzcK6JQubi4Z+cl3Vs+dXI6NvnZvHeTKFe
 G9lAsV5UEDeISsQC8qDrFGn5dX4s3JmasxvQtUKfL7r6AUtbo8vTfL2wChak2VwF679d0fHB9bK
 pqPCI9bSbsHOCEwibSJg1ILPEt+0GG80h2X7HCQ68w97gBlndxoXalibP43V/w+w65IZ+lPu+oU
 zPXMfE2jRhfzianShg02CVya2VyCpHFP9L9aODPW2O0kbNO97OYPFMXgj65P4Y7Qhm047j
X-Google-Smtp-Source: AGHT+IG6EzTyEA3INGOgld+kkM2E6bSTO6bhB+H8gEAN47wRnZax/H9RzJp1nvFdm1VelrmNbN2bBg==
X-Received: by 2002:a05:6214:765:b0:809:5095:4144 with SMTP id
 6a1803df08f44-80950954186mr19841926d6.67.1758808505713; 
 Thu, 25 Sep 2025 06:55:05 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:56 -0400
Subject: [PATCH v2 08/19] rust: firmware: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-8-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=1629;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=bPZeninN2/V/7zw/PYEF64yfGflgZsOfq0JcAWxkVI0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD4rak/xDK1Yk5v1duIKSYGyXctY6/oZ8jehaiqaTOxIbpGhy5zl8Kext0tE9Jsy8CWrpsliDV5
 3U5gCpsnnhAA=
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
 rust/kernel/firmware.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 376e7e77453f..71168d8004e2 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -51,13 +51,13 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{c_str, device::Device, firmware::Firmware};
+/// # use kernel::{device::Device, firmware::Firmware};
 ///
 /// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
+/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///
 /// # Ok(())
@@ -204,7 +204,7 @@ macro_rules! module_firmware {
     ($($builder:tt)*) => {
         const _: () = {
             const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
-                $crate::c_str!("")
+                c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
             };

-- 
2.51.0

