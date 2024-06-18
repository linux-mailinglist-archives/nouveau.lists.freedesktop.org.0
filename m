Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB0690DFEC
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B0110E806;
	Tue, 18 Jun 2024 23:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F+iNPXmg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A372410E7FE
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
 b=F+iNPXmgbPqu0vKQarrL6gD812IKC0+OUXWkY+1T/ZRUDzattX7mRV/0Hl6fF13MW9JC8o
 lJgi6xJRMao+FYa92NAVn9Sqd8hpRzP6q5golNWiD0AZBgcxEAHvZ25R/7EpHOeLAnBjCW
 ax1+a0vzfBSHfLbzGqWIwYloY6Ix43Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-J7D1qE21MICybZ41Nz0GEQ-1; Tue, 18 Jun 2024 19:33:40 -0400
X-MC-Unique: J7D1qE21MICybZ41Nz0GEQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52c9894a547so4846350e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753619; x=1719358419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
 b=B7ngm+dU4MNCl49aDA5kD2ncv0gzLRaJHfPTmbaj41h6Beh7hy9qaTxCUblEubEV1V
 V8XjgmuKUxBC75PdatbQmJSLkZJUykH94vKf45Z/KhCLJ8lcHcEMSTsXoRSbPVNwmW5a
 KuhrsgDVrWuKiKaohw/LbKXh7biwlxhkTWEouzDK6UyA++DqVtYagY4r49S0nPyX24Zi
 9DcV673xu7DeH7F6s7sfZIL+XdgLmWflw+//ba3bNK3p8pcJFhr9fKokmfy7e9VvaUOJ
 Q9CFRDHYK/xbzD9OisN2KCCL2h5SYv/luS9RnRrIfhSfGsK4sceoFuvhsnBQ9L2PpFvV
 sENA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDyqdv/xVmT9P4xyZrkQnfWsL/M9pAsYHOLiVSoIqh5EzGNuSFlCV61BjXyIH24AQXWbf2PH7lhWaeZDn6vtiCwnNKyR7fz5r7rxgC9w==
X-Gm-Message-State: AOJu0YzjBE+S8mzruKP/7NSH0fu1a4PEQZilmyblUDmChWdSJEGIfmj2
 kIZ5itIQ/0yjYoY3Sb8WJRxC9WDKBJsqUvN0MJWQ2wrxMHagVnNw5balLiZL5R3Gx9Eaz2V5D9O
 e7XAt4j7h/mMx0a72YwXShtysGEQqSwEtp34JiZgHiJOPX3zaCkhKZHDbyNueSWw=
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id
 2adb3069b0e04-52ccaa5856bmr685577e87.7.1718753618838; 
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR5TELOyHF36z9x2sDA7EG2pwK1HEt4LI7J206JjJ23kRVx6cagS1d8R8DZaXj8i3UqYOx4A==
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id
 2adb3069b0e04-52ccaa5856bmr685559e87.7.1718753618490; 
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f2407sm15548805f8f.72.2024.06.18.16.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 2/8] rust: Add a Sealed trait
Date: Wed, 19 Jun 2024 01:31:38 +0200
Message-ID: <20240618233324.14217-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Asahi Lina <lina@asahilina.net>

Some traits exposed by the kernel crate may not be intended to be
implemented by downstream modules. Add a Sealed trait to allow avoiding
this using the sealed trait pattern.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 5a68b9a5fe03..d83c4c58834f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -68,6 +68,11 @@
 #[doc(hidden)]
 pub use build_error::build_error;
 
+pub(crate) mod private {
+    #[allow(unreachable_pub)]
+    pub trait Sealed {}
+}
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 
-- 
2.45.1

