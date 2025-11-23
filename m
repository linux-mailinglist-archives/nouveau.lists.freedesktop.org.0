Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ACDCBAF0D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69AA10EC24;
	Sat, 13 Dec 2025 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLP7vvLu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332FE10E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29586626fbeso41368095ad.0
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889961; x=1764494761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
 b=WLP7vvLuiGGRRTkRH1ICmYOl8SXbEkRWQlieb4uQNnJwz9ZKUUhfMqXFSGf320D6SO
 DWvERj+aLnIenB8ydxgfGdx0iSklthhgHM+cDA1mv8vO68jpkGZdwGap3LOXPnV2pYVK
 5MgaNx9jXYEdNgXNbWP4liNHd+duzCkGYXvcNVI6mHKwxn/eSRq7GSd9dJjYaL+9+4p9
 v0wx37aGoyastiXMKEFbcliyWH2FCzVwG+fg3CrlHRuYXMFQFKvofYWgSBCj2c1y2AOv
 w9ZICuXM5Kk5ohUQNoWTQMNBnxGs+qG8ARNxfV0OcGocLj1ej4OsUUy0LL3NSm4M234O
 nCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889961; x=1764494761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
 b=eVA6tNghCjcFXZZCWrlkQML7cUGuG9ZJoRothuZakMZdUnOBc3jidUWmGTrxO6RGUv
 Qa3gcixRqerJ/ms3BbvEXu+SSbjQleMQ/fwf/UyNl43Wj3tEhzmWCZ1fxrQmtuenlybo
 mv2QT1SllKbAD8e93raokL2jAMig3A/TFAOUD+jMqwjJrbrsUZh2EnmMJqA2YBZqJ9ph
 w4UjHI4i43NbQ8cbadtuD4SF+nKhtsGotpHyWXHPyYDK6qBEzI6Zv2wb9Sdrxg0RjsF1
 QTfa2BsDE58nThbpwS+iB864siGdaibCEP6wucZby24FztPU79PwWcOWnIYL74Fmp1cq
 L1EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhIjTeB0mz4hAgJBdCEKD9SjQJ2snWXqXv+4Y+M7H+UHMjy8wRvm2MNWKuiE7oq1U+mP5SZ2UP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzQoQnb4MF1F0TC9nC2dmOFuA7sdDLrfGadrqvt7vq2Vh49KZ7
 uskirlb7ro9pXNePY9LU4apEAnh6P2OBv1kXWhIekzSGsPmj7IKwaCRN
X-Gm-Gg: ASbGncs3VnBIGSAs7ewt2D+Tzx6u8qcbg1X7YDVmL23n8miqTLJ2PT6DRHp/EXNcgl5
 aYSTE+rFZzBGJDMOcK8hgMeEOOq9soL4ISIS+ehSCYnb9/HzN4AobyjVOMzfmW8nEtuywHKDWJt
 lpwA/9h8cECTu2N3uTFgvwum9p+ATAWlBG0UAJZt8nDumU0/PHBqZ0sSVWl0ssyo+0lQ5RnKQDy
 JuMnuX+7xDbiXUEZIPCGc9px3hMK1WnxMCCdLwPYG4hcAAs72OliGxrm5wnujWaltAO80peFxAV
 CydXs76BYMAhSW3E0R2dn3vZw/e0NaMWafJMKpl8z3tlju44OcyKRwdgiRjR+w/iKI3fvXOY7bO
 o+bmEnn5dqR0JE3iahV8LjJvFEFQaZgI3+O4qtf2fT/njqAdmkKbsZHXRU5Cj+dOODA/VTpNzf1
 2u3PUYjTSVlHlUTkV/lo2BTjnubA==
X-Google-Smtp-Source: AGHT+IFojSe5onG6l0184Qd+32Us2flx99qw215kwkBj86ninqiLXlY2kvADM9/iJBS4TWCcsIsZyA==
X-Received: by 2002:a17:902:f548:b0:295:4d97:84fc with SMTP id
 d9443c01a7336-29b6bf3bcc0mr89250955ad.32.1763889961522; 
 Sun, 23 Nov 2025 01:26:01 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:01 -0800 (PST)
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
Subject: [PATCH 02/10] drivers: gpu: Update ARef imports from sync::aref
Date: Sun, 23 Nov 2025 14:54:30 +0530
Message-Id: <20251123092438.182251-3-shankari.ak0208@gmail.com>
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

Update call sites to import `ARef` from `sync::aref`
instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 drivers/gpu/drm/tyr/driver.rs          | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 drivers/gpu/nova-core/vbios.rs         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..264c2362237a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -16,10 +16,10 @@
 use kernel::regulator;
 use kernel::regulator::Regulator;
 use kernel::sizes::SZ_2M;
+use kernel::sync::aref::ARef;
 use kernel::sync::Arc;
 use kernel::sync::Mutex;
 use kernel::time;
-use kernel::types::ARef;
 
 use crate::file::File;
 use crate::gem::TyrObject;
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2d0369c49092..9c689f0b21ab 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -14,12 +14,12 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    sync::aref::ARef, //
     time::{
         delay::fsleep,
         Delta, //
     },
     transmute::FromBytes,
-    types::ARef, //
 };
 
 use crate::{
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index abf423560ff4..7c26e4a2d61c 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -11,8 +11,8 @@
         Alignable,
         Alignment, //
     },
+    sync::aref::ARef,
     transmute::FromBytes,
-    types::ARef,
 };
 
 use crate::{
-- 
2.34.1

