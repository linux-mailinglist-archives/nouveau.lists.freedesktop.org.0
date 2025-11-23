Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1988CBAFB5
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37A210ECAC;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md7aJjHR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DFA10E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:06 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-297e264528aso37046435ad.2
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890026; x=1764494826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxofK3PIJmJGptGWmPl6GxImW1KehJK8Ra0bi1cA/KY=;
 b=Md7aJjHRSntyC/Aeih3tkhnJvOH2CyI2ZiTLJP4BPZDIl+XWb1HzKGUSIK1mQIqciO
 JZwdw9nTFDBo6hvU4oadQFecECYobI5bx28vpPTdzNq0fI/KX+tSy+/S1Uv/oSAhcyjK
 /irYQgITECxlgWtp30zHFUMYSR1SWQ9KBQYV9LXLrHp39CXuNdMYr9SGIUlsi5YIvQr8
 5i8ekom5/93YCAK74wmsgBiFnWshTtXYV86x7N2mk9bVDvkvQv/WlInn1yI/iNz5n2qj
 qbfgtqzpVuFfEJuAbDee1uNU2CMA91bRjufJdWLSqGYGH93bH7VRWvQo/C2rx7XQgnIW
 /ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890026; x=1764494826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SxofK3PIJmJGptGWmPl6GxImW1KehJK8Ra0bi1cA/KY=;
 b=mdYTrfohD78nlh0pdB+9c3BjGuZqLwQxW4Tl9rBhK1Ln7yoCyb1bbME0qF0y376Ul6
 XUhsDkUJ73xNgcNQeIUev9TzlaN50cUAuSYpcmLkxTnFtPjXxIyOkd/3618FWHqJLmEw
 zgpaZrwZUerzSY6+c7WUyJvda4rZZk5UurKEQeJ5Ca2oWFaTE+FXHLz/DsP9F+V9FnI7
 0t1z8lv0Lrdioo34KuwzbpfY4vU+KD78mcpRoAZd9Mh2+wCS4Nj2APHf4FA/KdwIQejO
 8aaOGB4rOBnUOsggKA5zrjZqMRlEEMPwZsR1rSc36xKulU6WIttUyVjRRoKoyVtVa/Pp
 LT6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZScIHsuAF01w9JFQzQjkD5V7TtiOknVm4ooIo06YQzbkz6OzB8rFDwrpzcVkW3o/mZgpECQog@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk8sidNbkbYHAhq9JnRGr54Rs5wjZZJslQ2WT1wFPwXVGmfvfz
 Ed88+iyZYqJuNvpLLI70D9JVT1XMD4a09haipmoibaZS2hbWMIocoWkg
X-Gm-Gg: ASbGnct5J1bgX6JgXtoYEWbVyCYUh/c8soav1pXswFiiXIzz03YPcouisX9C1wFsnbx
 4fkNYzB72INBvMHk2S0adi40AbdfwtaKnX4mC+pnclHn31mRowsEvk9BASMDWgIUhRvy0AuIxx+
 LPOaegZ0BLZHlVpQK5a0dvMJVXWeZBmAOXw1oX5gPsUE2x68CJm288toGDf+2zYguV0K2Jkp3dQ
 gllzGO+H45l/a8KFBwTdXgzunH7B2GT/VAxWjRIc4RKV71c5FZruagiGvtOtqBWR2TnG1okO7D7
 XHzkEuPikrBn9OQW7P5eJPry7EuGhVn+zPCJAKHa8zHacA8H7CABWNq0S4gDI0injpGCI/fmuq1
 uqoeLs3UJ2eKWaugNdgOeGwHMrKcdqIOUhMEPbIwsGiRmlT5Se2+6mTJjn4f9VIxP7QlElHsR8/
 TwuZ7iWf5vufFpCS4zm84CFkSBxQ==
X-Google-Smtp-Source: AGHT+IH1U8t8hCw2WDyvXF/0DPfy18rrujnj6Em/QND/b9i4osv8+SLy39cyAfSRsaedSvrbycJTtA==
X-Received: by 2002:a17:903:290:b0:297:c048:fb60 with SMTP id
 d9443c01a7336-29b6bedf343mr95210775ad.25.1763890025910; 
 Sun, 23 Nov 2025 01:27:05 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:05 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 07/10] rust: kernel: Update ARef imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:35 +0530
Message-Id: <20251123092438.182251-8-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

Update call sites in `scatterlist.rs` to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/scatterlist.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 196fdb9a75e7..b83c468b5c63 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -38,7 +38,8 @@
     io::ResourceSize,
     page,
     prelude::*,
-    types::{ARef, Opaque},
+    sync::aref::ARef,
+    types::Opaque,
 };
 use core::{ops::Deref, ptr::NonNull};
 
-- 
2.34.1

