Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF7BBF77A
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F510E61A;
	Mon,  6 Oct 2025 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoawMhH/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491E210E944
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:50 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-78e9f48da30so6745296d6.1
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808549; x=1759413349; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YGNwJdiqffAB8BrNoFOc3im0f57lc7sAudNYea1lra0=;
 b=SoawMhH/FXi+01MQv+smfCqyMiavadsEtRO16DrfOILOwYc60vqeIn4/uxNwMxe+5a
 G5f4LyEJ/DyW8YKY0I5qR4ktvMJR6DXIx98VFWvkRB29LmTZy1sCYu39X6pyn/s8MJoY
 3LqIODUW938eMj/TJklz9oXLI0RghvHWBwZYqWIlUEfOW7OAv+AefQX/tNwApSxKm8yr
 5sgVHP17FX4f9vlQlbfb6o2wRb++Fq+S4l+Go2UEfLdO01M1w0WsLWnkSRXOz3SHuj8f
 c9V3PYqm+rPKLPl5qrAmLzMd9i+yTAHz3yYSYhV9Rg5lkMlyQb34/ajXo/W4vXhuihaf
 wohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808549; x=1759413349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGNwJdiqffAB8BrNoFOc3im0f57lc7sAudNYea1lra0=;
 b=tRfNUe75PZZd5mvstRSlzBewdrTEFE27Qp1KRWhMNfwlIA35jcDl+nQGReIGqdGu9Z
 wjVBeru4DnIOVvMlo1+wl41k2xibXFSvqBZkgnBRubxPmqsHkvD8yIBMlv9g1Njs0sF6
 e3sxcqra4ene1UgYIklpE3rTTlylrsuCJP3CdoBXsP2gblJ19BTvfTrYUYZ/UcX6oEh2
 tcrj0waZpG5jtwv3Wi19NK78LoBk/TOs2QqnF8Z5q/lH3fIpHce8vEvJwnQx7a6aPvE2
 1Z61lrqiRd/OTkqro839XmYavu7HUgU3PnDA6GiBOIDvDuBNp8V5eiPUrS9tU5TgAR9I
 ZsOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPCYIBhrhNVFaALk4VnTng4vXsgwSSrz7mlW80TF2aa2lXquNW4mEAZ7EoSOf+rwyntJx5c40n@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyomUCJ40QSHB5Cnbk4B8tiekMQu2/rXH8PcaaQ+EXkYyri5uKL
 Em7ux3aGyTzJfoLYEjv6jjXdfkjCiVSEdqNgzYrnK8+uSXgbAKiE3Tra
X-Gm-Gg: ASbGnct+XaAFeiCgsMA/hshWmeYaZV6KkytrulPCXfLMi8qy8RmisMPRjWy1Vc9BrHx
 nl3F/sNKKd9HXw5PZ2Iktm5scIGcFuNjsLD9aOtxcTbPAcf4ulpN5Ajn74fjb1fjJJGRZmz8daE
 LRmra6UXiYhymU7eWH4rj+QLQKR2FBOiGpBb0OSXVl9z7qeYwKRu7lDY5UcsN7utx2CXL3X8rbs
 Q2TFQMlFVagk+9cpNPKeP9CShK8j0GVAomFl05K7+uKA9FVB6O7tLZq34ARVkXsYUCt84PLxIof
 5jUL/8chdvMSx+cmUfE0Afc4zLnjhcmriGFyd9ZAwKNDANnWjURULqWM398E1n/z6fURCyeTFOj
 i2bjwqs/C9Qmqi5kbyYMTFZCbf4Bhb2vwaIFWTPu/nXCLIa5T8vYgdOygVP0E/7tuHbbpr8vSi2
 or+vb4pnyEwpE9qXuN+NM+p0ko8/+ZmAcSSUEFGeSJZN3FZeqj1+WONsp2Zcd1GEVyOf90
X-Google-Smtp-Source: AGHT+IHxxrN1qiYt8CkNZDH6mAY2ag9p3EBYWx12nFthYZnZa+rBx1Nas4oNQjITBFEWvlFgd3yNGw==
X-Received: by 2002:a05:6214:27c3:b0:7f0:e84e:b2b2 with SMTP id
 6a1803df08f44-7fc451680aemr56106776d6.57.1758808548877; 
 Thu, 25 Sep 2025 06:55:48 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:48 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:03 -0400
Subject: [PATCH v2 15/19] rust: seq_file: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-15-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1328;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/zHlMKa0b7Nk9siO6gKcN+x/h82Zk8zkURVvpzNt6AA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAXSvElYTE8YxZCsGrWl/FvFn0PcrKAZK3BdoNzxQTxfQ/m2OpN47pZ17tScZDRCYR8bMK67o/2
 oeQSiKFoeSw0=
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
 rust/kernel/seq_file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 855e533813a6..518265558d66 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }

-- 
2.51.0

