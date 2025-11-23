Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D7CBAFCA
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708B410ECC2;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/bYqC/V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9710E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:20 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2953e415b27so41070955ad.2
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890040; x=1764494840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
 b=R/bYqC/VuMHFKRnaEf2MrgxBblNMvC99q6gv9wQyH5BcTx3S0dMKP10IegXug8KXF8
 7rqxxXlUTK2MEVuu3SJyrsIx39K6FbCA20N+U5E5exklZZ+AmMYGcmQ1Z4KdqQw2Q6Fk
 JzWYO2n3NXmVGMM97N0j5RQZErKF5xMguUJdgZ3MFe5tvaaK/MZC7uACOLeiLHVJpC9l
 njdu21k5siC/vvLR6Vl4/pTQB0KKhxGfV+zUeR1ir83WSyfokmNF12ni9mv7ONg5qwxx
 iQeO1WI0jp2GB9vqf57IQSs87Ou3gTesuAJhi9qr5bJ16/VJgtKRFUlzp+1sg2NJmKMC
 lAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890040; x=1764494840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
 b=tvNkD54gtwKm2OpHze6fKZuNkksRVb28qRu4lzTHd/rcd+VJzY4nx3BO9+NItPiwla
 e8EcHZdtYYu5ExhHkSYMQnpUeaVLtZuDlJGINBG42308M7b1Ak3PdG0lXbL30U1QK8Ah
 EDW0htJ8qy5fK7fEYQBrc8WPgJx6V8hJy7HgdAC9UMImYYYz+jsCTcC0Sv3JAn5q48+6
 spE0kp10fGb8UscsyLmnZlr+uVUlLU/ITbv4o8kSdFa20AQyu5/NyuqiuPXmZGFltSul
 ca75yHjzV1HDARZFpOjgGTmPu8y9lMKVJVNMhtlFCy5v1i3FlhzLraxVdb+mtu/FzsMn
 O0tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY03c1R1aFdRH9dkDjS1xWLNM6X0Yk2AO2t9cBWa0VW82O3mau0FGrfvM6bukSVRKrLs3MSfwf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC0EWBwUEH96aHiWdDAseSqozJpAgXZW46HX/7pfE+/c6paeVr
 w2lWnbRQrY/KYUxDxv6OQvjWE31XHBV3iZMSAW5XIuTjS4e1iOU/gfEZ
X-Gm-Gg: ASbGncs7ffJdn2OaJ3qsR7iKOrPQDu07MLxKAV+/W2UWucPY/nicRQLLealWXxp9eyt
 NXHBQFJHx2uKUXpMSooSkK6kO5ms2IO0rBsT2AZTvRKbsYM3aOJ+JufRI5IHk2DfMZYHVQbdQYM
 ONWa8RrLXTcZdw6hPHQIOC1QNmGzsLVg/h8gEmLJxlYvIDE86QX1ERlgLyVsY+nqYrdgzBCo9gS
 Dlzsrssy3rF16yZwz6qvQCqReR4K1+t6JTyDSl5+W1bOdZ8Afak3BjsMuDGSwa5s4vAf2+g2n5f
 gdupOiMO4c1c/gxR2cjH6blMGnHc+nMtpkDGYlwhY0pjYuPIXtzrOCvQIFdUZq3WMeHIA6Tetk+
 E2zabJxqcl2GoPGz/HtKDID0udMf63F6Z+vgIv8UUvf+Rg+hm3z758Yx2PaKtxOwO1h/UpLGpbs
 r7LamLShq5B0rOWae5jmaGi/jo6A==
X-Google-Smtp-Source: AGHT+IFMN2aUokRTTtS+sIFfNu4kcDd93MwuGAJrh+xf6L/Jjr+U1cR7WS31QoNboosVEzIBjpWEvQ==
X-Received: by 2002:a17:903:2c06:b0:297:fc22:3a9f with SMTP id
 d9443c01a7336-29b6bf19f1dmr93932225ad.38.1763890039910; 
 Sun, 23 Nov 2025 01:27:19 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:19 -0800 (PST)
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
Subject: [PATCH 08/10] rust: kernel: Update AlwaysRefCounted imports to use
 sync::aref
Date: Sun, 23 Nov 2025 14:54:36 +0530
Message-Id: <20251123092438.182251-9-shankari.ak0208@gmail.com>
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

Update call sites in `usb.rs` to import `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/usb.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d10b65e9fb6a..79ff2f881572 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -12,7 +12,8 @@
     error::{from_result, to_result, Result},
     prelude::*,
     str::CStr,
-    types::{AlwaysRefCounted, Opaque},
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
     ThisModule,
 };
 use core::{
-- 
2.34.1

