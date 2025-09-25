Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B5BBF837
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF9C10E64B;
	Mon,  6 Oct 2025 20:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6Y+vaGU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A7010E94E
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:56:08 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-78e9f48da30so6748576d6.1
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808568; x=1759413368; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sq31dC2vDN2a94utvC/B02Ptv/MXvCOxOItQtZFE3ic=;
 b=S6Y+vaGUija8INOlgHOfyrQ72w9LLuyu3tjrXPybQ0idW0ypZFAIDxWk0WJ8EmjGjH
 neuXeN8oq9p2f85Za0PbotoZnRfhry6GmvCKB5ETfvSun/iBpd3YwzxUjSH/2gzZ7b7y
 f/te+xvEV+sfiqS+MF6x+swgYvJxHGC/TtPWTlu90MJ8DEVvAZxwUkfc4asx0Eq2rwKS
 bCWdbHl3c06bsGrRfU/Wp3MURTn/Rr/8Jd+VFYDToq1ZLTcuQ6SG1GUFRZyO2wJDexwg
 aoRCAhBsNs4leOUcIjjsJZ9m5i3E7UpQ9cvzpJx6zvjGCZRHE5XuJZBJt6N5Mw6S+lRv
 FZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808568; x=1759413368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sq31dC2vDN2a94utvC/B02Ptv/MXvCOxOItQtZFE3ic=;
 b=dBkAFzVjAng57vD4E0X9gI0FNMynyxjrwIbQF6kRdd3e+WJLbFijv/lRD1QDFZl4Gv
 yl0lyHcXJS6oM1pmY/lqEcQjg5T9LI36Dg/zN3GJo670NoNYBXx091ettjgbHKmSD/nS
 I9SQsTIoFH77zmrTKcYVKN1gx2oABe828QA5we+CXvFdphbGvpAaTSXuNb/cSgIPqLJ1
 gULVUbfUAiRPsyzxr3p3ANWNKNiAzskJ0Yn9gcgMzAfPQa3CgehXi4PPw+6HKTwHTVnq
 8OTO7Egv7uAhf88J89VP+Ba7oJGMKfPqTKMvffPWBRYhIV6JdVww/0gitIaXFmIY2ANr
 CpLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVpPRooZK1QIIvHLTr6MKvfIl9ej0AXJ68gElOdVXXPnBP7poHaC14Z2S6v+kUj4WcNkmuHSAQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1FnGwtOr+chJfTjsQNdh5MegW3kpQRDiDBYa09cqwJtfYeKwH
 zAQbFsIPLkM17JukDE9/c+s7H6orCCJ20G4rYQL1Cm3sCyqV+dijbR6T
X-Gm-Gg: ASbGnctUORV9hwQCzL1+wb+fA2m2DL74kCE3MrfCaa7TH1I/9sjVt8f3EqULNXjMGyw
 RG4dBTafQKdIsgmpzoKKI+S/iwSsJwNDVtvDjlvtrpOpvILf3V3eEJoHEQ75oOnvKCtMPVPjoIL
 AN/n6GxEDr8xp0uVFw9f6fdNHIsBoL4cRJuZ78f0zD1oZ8w0k/4AVWTaruEACmNGnxanQhu7aHU
 s85XewL9rqFF7DMS5Ca/QXKKr+oihFgyUQ1yJ8YkeQ0AP8xLPGSM/nBG8/Ebd1arMP+qybnmITn
 rOZgRp8unOHVhHf3dkROnl68T+pb2lys+tPYz33QzJeNC0qy2fK2Q7nv6IuU+PhzSzTBQLeYWeA
 47IIoE/W8VxEbuJ9P8IUSsf/8NBcSZHF8yQiwrinG0vLCoqE/KBWIbnUmupukg7MlOtFUM3cK9n
 c1ht6f1ukcTM+nXs6xSht6wM9E+D8rRAvSl3POQqZrta1y8JSpEyrhuDjSC9VpXH9rGpT7hP6I9
 ixwBvI=
X-Google-Smtp-Source: AGHT+IEZhM30AGXNdbFILEQiyz/kr05nZm4O0BE8w754iMuzz8n1eM1enRH3Kra7C8BiuYUbQtPrdA==
X-Received: by 2002:a05:6214:3014:b0:80e:4f6d:23be with SMTP id
 6a1803df08f44-80e4f6d25a9mr15832686d6.62.1758808567133; 
 Thu, 25 Sep 2025 06:56:07 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:56:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:06 -0400
Subject: [PATCH v2 18/19] rust: io: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-18-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1724;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=cd10vY+LdNFm15kjf9buohLVZDsgfigdMJZaOhvjUZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNf162nJINfyau54ApOtSNUKBNqSEvAN/RUj/VaS1rCjXvJ9mtYy/yqZWgJQlP/HSnYEPjCYYdQ
 IPwDjgyMc4w4=
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
 rust/kernel/io/mem.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 6f99510bfc3a..2e42eb906061 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -4,7 +4,6 @@
 
 use core::ops::Deref;
 
-use crate::c_str;
 use crate::device::Bound;
 use crate::device::Device;
 use crate::devres::Devres;
@@ -44,7 +43,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -102,7 +101,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     /// illustration purposes.
     ///
     /// ```no_run
-    /// use kernel::{bindings, c_str, platform, of, device::Core};
+    /// use kernel::{bindings, platform, of, device::Core};
     /// struct SampleDriver;
     ///
     /// impl platform::Driver for SampleDriver {
@@ -164,7 +163,7 @@ impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
     fn ioremap(resource: &Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
-        let name = resource.name().unwrap_or(c_str!(""));
+        let name = resource.name().unwrap_or_default();
 
         let region = resource
             .request_region(

-- 
2.51.0

