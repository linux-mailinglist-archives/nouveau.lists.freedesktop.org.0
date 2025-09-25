Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1ADBBF714
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A9710E5F2;
	Mon,  6 Oct 2025 20:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="As5mJmRd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDA810E944
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:56:14 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-78e4056623fso6744956d6.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808573; x=1759413373; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=67z28WQrX/ogTxUcpWCJ1GAunLtCBeF3o3dpHhKNjK8=;
 b=As5mJmRdXP7fX7w0KoGwNoOFtm17ikMrEv/yA17JgGuUvT2fXlI1clOO4U6v7VTZqM
 Ww+AtvdW87u9tLrfn7FCMRNoA0vKHf+ablCvdHz45rU9x0AL4xaAY3lrOhCLnV8jE9H9
 FGm35tAPRVp5t2VBL8ee0qHkB23JQvx94Q+PzRsh2u0Tm/wSUn/YXnRHsYxoCDnUWFGj
 WhorCzsogcjy3v7F3nETCn1n1bIJ/fGb0r8VrJyLFU5XPwWseuc+mDyw3ZWEaRFVuhjo
 RwM/dr7mO9ov+fOpz5AjMo5UsUJvilo6VHeFxtgv0skk3PM55wj0XjJz9hv//esSY5kB
 AJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808573; x=1759413373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67z28WQrX/ogTxUcpWCJ1GAunLtCBeF3o3dpHhKNjK8=;
 b=aO8LiSJQUw/sx1Jcq3HOP8KetpEt4NLnRyaS/3gZ1eIkPIOGK3PHRzF+axTo1akggp
 dNn/IZlKxUH219cpgIxQduJMYYseAQdB4QL+3qNRwUmbePmGU7a6ry80laQG1N3T53Fx
 MGVXado04JD38OjAylLRKfiSBI4WNTOwl9o4r2KDhWxnhfnK4nka3QEoLq0cM4HSZynb
 iAQP9FxMcfL0gwjumvs0W0tdQpKslCv8c57oKbARCFe6iCR09GgLdWjfcnEKPxhBKtUP
 Dki6ODs4DLdeJlyzJ16VNNUGRYMTWKIVyVP1fWNwZ0Ss8/BTxzykj3PwQwt36WKCWJMd
 fneA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBdYvlBOzs7bwcJ9WR6dHqiYkAFYJ9aF11I8kqZPkg00IwfDPxtyyH2qEhpFouigdJRGJPq5R2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQrlJ3jbww6xl/JcDjens2XBKICknvNxMKCdbNliwp+9EQCyFe
 TnK9bmb5K0CKLLs3Yk7ox+aJ4gSQUmfnapB5v8J/nNOJ1FuFkMcJ/M0z
X-Gm-Gg: ASbGncuXG3vACnp8ePiUvwFIo5/gEwiZHHTo2YtBDmPxVGY15pwUuxtQtjCirtFc3S2
 ujbgKs3FtF/rAoLADNg5M+wUlLBp0xMOlgIv5KINamn5cNlTHTxsBQkTyC21TlFzdmXlW/On55C
 iQLWBboS9ZyTLSNLNlTxfCfI86hS87Fap6BqyUArgzfsrgEa/CXubitXNQcIy3d2VO2xwih6JpT
 x10JcomsAMxHGTa4ZkFpESytJ0XArACQEK2XMlHFZap5gPJH2RJ72YUui5+nUIczJpT3Fa7ARsd
 ZLAn2dY1gdiwoCkRyIqgAIuKuuWv6mIZbZNfBBSzV898HJ/SRbywnhmZLUM93M4qU+fcy5AP5+C
 k/IIQMjLz2JJlPEr3VgFr2VGv9Ti1K0s0ehMBBLTstuPCjJnnoE+uQG8JL3Np+hdazK7VItBufk
 ZFQQ5cybOvMElTuyYw42dYwf06jr3Nm70WrlG5m7+CdWPForRtD/XeYdVDuRAvzNhp8ZPq
X-Google-Smtp-Source: AGHT+IFqm26OFmsSA0nKzITzw08x0KzoFRvLAeGfptjPnF7Ljbfyc5/369jW8FthqI8ZOsSRAhkw7g==
X-Received: by 2002:a05:6214:1cc4:b0:786:e3b6:bb99 with SMTP id
 6a1803df08f44-7fc3128e0c3mr48349976d6.29.1758808572677; 
 Thu, 25 Sep 2025 06:56:12 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:56:12 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:07 -0400
Subject: [PATCH v2 19/19] rust: regulator: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-19-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808439; l=2550;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=O/wu2Lf29nUdzSaspIKYEix0WPxikVmVfF3mQ9scbuU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFsLawjfMUC3xaiUohpUXzdZt822yLFxnKyQ3hJFQI3UAkDtLeyUoqZ2lgOdZhmeuCD54hWBgXN
 /2qfobXSOOAA=
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

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/regulator.rs | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index 65f3a125348f..dff8fb00566f 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -98,12 +98,11 @@ pub struct Error<State: RegulatorState> {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::Device;
 /// # use kernel::regulator::{Voltage, Regulator, Disabled, Enabled};
 /// fn enable(dev: &Device, min_voltage: Voltage, max_voltage: Voltage) -> Result {
 ///     // Obtain a reference to a (fictitious) regulator.
-///     let regulator: Regulator<Disabled> = Regulator::<Disabled>::get(dev, c_str!("vcc"))?;
+///     let regulator: Regulator<Disabled> = Regulator::<Disabled>::get(dev, c"vcc")?;
 ///
 ///     // The voltage can be set before enabling the regulator if needed, e.g.:
 ///     regulator.set_voltage(min_voltage, max_voltage)?;
@@ -142,12 +141,11 @@ pub struct Error<State: RegulatorState> {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::Device;
 /// # use kernel::regulator::{Voltage, Regulator, Enabled};
 /// fn enable(dev: &Device) -> Result {
 ///     // Obtain a reference to a (fictitious) regulator and enable it.
-///     let regulator: Regulator<Enabled> = Regulator::<Enabled>::get(dev, c_str!("vcc"))?;
+///     let regulator: Regulator<Enabled> = Regulator::<Enabled>::get(dev, c"vcc")?;
 ///
 ///     // Dropping an enabled regulator will disable it. The refcount will be
 ///     // decremented.
@@ -193,7 +191,6 @@ pub struct Error<State: RegulatorState> {
 ///
 /// ```
 /// # use kernel::prelude::*;
-/// # use kernel::c_str;
 /// # use kernel::device::Device;
 /// # use kernel::regulator::{Regulator, Dynamic};
 /// struct PrivateData {
@@ -203,7 +200,7 @@ pub struct Error<State: RegulatorState> {
 /// // A fictictious probe function that obtains a regulator and sets it up.
 /// fn probe(dev: &Device) -> Result<PrivateData> {
 ///     // Obtain a reference to a (fictitious) regulator.
-///     let mut regulator = Regulator::<Dynamic>::get(dev, c_str!("vcc"))?;
+///     let mut regulator = Regulator::<Dynamic>::get(dev, c"vcc")?;
 ///
 ///     Ok(PrivateData { regulator })
 /// }

-- 
2.51.0

