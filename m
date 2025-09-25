Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B880CBBF7C2
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D0E10E626;
	Mon,  6 Oct 2025 20:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgggwUs8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B1310E942
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:38 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-79390b83c7dso6779616d6.1
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808537; x=1759413337; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mswzqg1rIlmw6HicVVCtXv0e5vufLTaFX3VKtK98wJ4=;
 b=BgggwUs8L9wp138Fa7WyikZ43Q6RKEXjpDwPyl9+oNhPN3AjFKeO2ErtqHhfCpN+mK
 E4NaVf9N7INfJzA8444HBzVDcmg/JQYrUWrU6qxcg4iG6mnqQBiZ1ijtDguu/uC8Z4Wn
 riOfD/0q17+yH4PZ1wOqvNfKtEmYMPpIHH702PRZ2h1mhm5UyRyQ83tHVoFQYVL94oGo
 N8yZSFvdxA1cmIqfEjYtjNHB84PAfXjWBSy7L7BMWaAQjhpwzSEVKN1LfFxrD316PR+o
 zxQOWJvFzxXI2+hiZlmThBnIrl8pIE00W1zueT1VjwM4L6eelQfgK9OFn8BB4V0TFtIB
 H1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808537; x=1759413337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mswzqg1rIlmw6HicVVCtXv0e5vufLTaFX3VKtK98wJ4=;
 b=amPCrPiGAOGwA+6RKoFEBo2INTfn9YBYqwn9b77+YrAYzaZB+GL2W4fdoQC5vv2KLn
 oo0EcPfEJ4lWnFlIIlphvQWKmtUe4iB0sUl41hWPaHHEDb+jVuc2Ux1Sz0S9RdeWZ2Ig
 1ScNnrQj5f9Q44url9CGkbIkqGeyXOVoxs7mmGcySkYvfU4E3FztAItno3cL1A7x+yoX
 jONdiXih1d+ec10DYyWvUYZF6BX0hY7DppMgGHOCptb4F3tBbUaG9B7N9tZaOPiv/2ua
 EfQfjLMm1cmD/OrAStqbijkUnJ5AmEVoD8Vt1tUTRbjcDbRfhp6Ty+WH8hR9aon8kRND
 VxMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXR0SY86NITbuhJparC6lRsE7rIojnCVGPXGmSEO4M+gWJryU24hozOEXqUx2c+UozY04sG9mj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj3SVHIXWXlqb9n1t/eLjD+ztC/s5DE8/d2qMAgPeCjp6zdmaw
 Yyudpjr7RniSIWb0VlLtCF/N5JsQYLjvr5DRY6fo8EXGlp2fw67Hqyf1
X-Gm-Gg: ASbGncvISawgQN/2578In/T0lKrZoQCzz50y7y0gDOCueGEHdv5EWQYhhKty0maCAlw
 RYEzuD87Aywn1/42Wy2bgAqCyWkGP39WdA+Kp7pUJnFqOixezvS0XT5G9RcjDtVHM8TKsi9HxPA
 d5ema7JUcTG9D7azjDQ6IVWH+kb4Dx80YsQnD67K3WiZ04v6tHEPQxaMfB80D1F8UfG0RyADdVJ
 0gYYnVqLPXRju1suZw8i6h3bnAFXiXo8UpLzBFQKqo3DS9cH9D93N34zt/LJyE+BLTkBJLeGAe5
 rPy3amX97PTzWJh/9dYR11SOs/GjyS6KKRN+r33V2YNsq8bOmMkO/G5ks1IC+mOV0pO/c5YxFG8
 njUmcFxO+C6guflACHccPeikIvTlb9keEvlQzICKiqTJt10Bts5+R/TB5VR28+FkvVqrmMgm5wH
 lEEDmywAOV1eIeh62Ah6CTRBbFjBNmokRcP5FLNoNvzo8M/iSdy/cEw5Hkkbj8f09It1q1
X-Google-Smtp-Source: AGHT+IG0JSBlGu1RB4uMilSaBh7PnIkXhnuatHF4cSQpYwaqP/zzSQ9G+tSnzQTTn3K53FoLTANywA==
X-Received: by 2002:a05:6214:4001:b0:70d:6de2:50c0 with SMTP id
 6a1803df08f44-7fc43a4e9e0mr40876536d6.61.1758808535790; 
 Thu, 25 Sep 2025 06:55:35 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:35 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:01 -0400
Subject: [PATCH v2 13/19] rust: pci: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-13-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1469;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=9ZmEu11QXJ8phGJATObrsBrPngKGUQeOptVynfUL8WM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLLvUlNLZLAaXK2MqYDhZdBweEQ8R3sKV9FI/C2n7BV5P0I7OA8y5a1a/1zJuYaQ3obw7TFfFmi
 JTjNJLSMGawU=
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
 samples/rust/rust_driver_pci.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 606946ff4d7f..e0e9d9fda484 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,7 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{bindings, device::Core, devres::Devres, pci, prelude::*, types::ARef};
 
 struct Regs;
 
@@ -79,7 +79,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
         let drvdata = KBox::pin_init(
             try_pin_init!(Self {
                 pdev: pdev.into(),
-                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci")),
+                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci"),
                 index: *info,
             }),
             GFP_KERNEL,

-- 
2.51.0

