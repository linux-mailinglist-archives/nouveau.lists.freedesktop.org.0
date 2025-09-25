Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C260FBBF82E
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A9610E659;
	Mon,  6 Oct 2025 20:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH24nTHx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31F10E941
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:24 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-7957e2f6ba8so8139806d6.3
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808524; x=1759413324; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9F//OQcCcTSCVUN93IinXT3LeiwclsyrHd76W2OsUHM=;
 b=FH24nTHxM5S1iH43u+rTdNZJs3YSSCqZZQMCB2Xg+jp6GrLwl5zN67B+ZONm97wKru
 AFdMxp04v3AyNLtftdkShL7s3kNiCe8WUPGEb+ShDLqRUE+kd1y+to9c4qjMR1XMwMD3
 A4qhUX3kjSXlIPqqVVDOADF1tytmdP6cFmr+L3OlSP3m7tYQGlKnQZUoGh8BBAWx5zlb
 5q3ETn0ZLyRCq/UJ63eO/4SPAXLB8qh1Frk2cK+AVVamuLqjMJAynbKJk90i+0Nnmk44
 taupk7IjMf7aVe3RTwlM8QFLzEEFn+yc4oLCa3wDd66m59DsfvPXNcpMqVHxBJZYe/5q
 uEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808524; x=1759413324;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9F//OQcCcTSCVUN93IinXT3LeiwclsyrHd76W2OsUHM=;
 b=N6CDOtKUv4PB/fzQzRLL+brRD7VQgys6G7F5joNtCt2GQGPku12aOycUpmXYopWyic
 alW6Y8KT9KvVuf3K/DoZrZ7Bzg75jTT8vwkibvZW9stSiycg4qnL1xwatF3niYvo4ILC
 OGoU1k8Ai1+jLS5qDIdPm49o+/wsK95OyOFIUWMq055z0Gr+f//Bggt2TNjed0Dgaq3m
 qyY+wBr3lFQNRVYGoQy781cgXMTOtzSRXiScHMzJiGqs2IQo88qTPzhlU6BnVg96zobJ
 IGrWWfQ9Uze5vzhi3Iq6ryZ+VIEe8CpzsKsBJQ65frLRoZXEbmp8+quMwYfua8BiqzLl
 0Z0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUSPX6irPzUZCg5y2lexLW91eLJusJJIOhC6Ptl14kvox/11RpEc2ROCrXV6G713bszZ5czBRe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUebWO3jygz5CnDKIjqV+KpU6FlqmUHY41H9fQ3wb2V7vWWoEO
 4i+nahYWp+nZMEO9Qxtxh+CX3+ugiI+pYReRYhjwROwGQlHAKLE3QmAt
X-Gm-Gg: ASbGnctUi3E0uNUEijRJ7nlVpV62enk0sEWioRHwnRGAWDxPSJP+RDmqm4iS3xq+rcb
 mqKQW123++RIZTUrTdVmLSw6v7/joOH7+RgnBR+1+U1EqpXTB5EFfq31iPIAqg3J4YPZ2jicuzx
 xq0yTgQi2vizmqZ9T/h3SFQ6tB574tMDvXi0q+58zvIQrzT83+woYrmZ8iq7ruexwqm2mBwTAkq
 nIOwdkypVCUJiA4yl4xtXgE3rsrqgzSvwfsEN4LR9sQhANBvTDb1sBLEuy7czYwr/EE/iRKYCmK
 D5NkDs3rziuCYpVH27MS4HCGZ2454sXecnEC7wogb5inWuvJ4uglaLmcpBsKtmhc/GpgvLKA7NB
 JBJHwTNgOP17ATtRnaGwxujTTGmS/Fhvxl+bzXz66W+aIFvpVa+5znlDOWbcv6DxqcHdt45ENRR
 57zgNT472T+GoM4Pzq+Icb1NTtgj/yaw5ahKBikp1o4OwB1Z47nZATerUTJoE1nRWRwaPS
X-Google-Smtp-Source: AGHT+IG8Gyrq/9aswoyGrByufUDOEDDpB4vAZLNl1cBk/1ws0VqwO4eeWj7YZE4dhPO66F/wFvg1uw==
X-Received: by 2002:a05:6214:1d28:b0:7d6:c615:ecd1 with SMTP id
 6a1803df08f44-7fc4ec0e7dcmr46038496d6.61.1758808522761; 
 Thu, 25 Sep 2025 06:55:22 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:22 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:59 -0400
Subject: [PATCH v2 11/19] rust: miscdevice: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-11-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1136;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=G1wsZhjB9YFMrkpz5gcBxDMgotSl9l62JYKqp+2kvv0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDPHa5h0Ln008NycRhnUYHSwita6ft61YpP6UIaouguWtU37E7gPYJQE7EoOJeFshI2ze3iWBrO
 I6yLKReNrlA0=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_misc_device.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index e7ab77448f75..60ab10b02574 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,7 +98,6 @@
 use core::pin::Pin;
 
 use kernel::{
-    c_str,
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
@@ -133,7 +132,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
-            name: c_str!("rust-misc-device"),
+            name: c"rust-misc-device",
         };
 
         try_pin_init!(Self {

-- 
2.51.0

