Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0ACBABE3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EDB10EA6C;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="jljsarGb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657D710E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:46 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2980d9b7df5so42006475ad.3
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890066; x=1764494866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
 b=jljsarGb00oTxd5Qx8XDsb4D+icmyjoepUYfbcjjgbl55/0VRo+A0pU5k5BecV8pgu
 x4zkqFn8Xw4hDy+4/Usv0Zpk9y1wk1lzrsbIgDlaqp5T6A3vCt0PrfP58tIv8bdM6+b9
 zo2h9kg1bQgfE9nMjg5nAjGs46Jy6mlMtw36M4cZlOGkaaZZrkQX+XZTcDTaLRhN1K04
 zLWFnQHTfXO6ZK74mYJIPBXVD3y6damGFObwbG/KiqEoEhRcjbhLisUplFS0o2KnosJp
 pLJJjshMHZXLj6ghfBS70oIeOPImU1nYVXuhOAf5EujplyQYzznZ+fwwDgQ9kUIc+l6B
 k5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890066; x=1764494866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
 b=m0Z0sqMqf0PXFWPFjIgO1SfbKN75DWnkooeVEGULn5G4a0jLc0GHsbsTRVh+Su2gI8
 u7f2MRYA0lwW1JPcau5t+gAHIFUHSRi681hEYw/I2fnNphscDrCc8XtlGkBT9fNpgiCe
 3TCpoda3Tenmf6M4Tm2qywioKF16vDSdxtGT2dDCZhbt8Anatu1ho3fSoRrPgkqcgSol
 qHfFxC4PmacTez4aHI2MJ4l2ffR/dnxXGaCbvTUKgglTyL394hy06hl8kGQiOrpPFeTP
 UdwMwcJKpZK4KAixXHml9PFqTWZefN0rJic1J24tRXun314vbNfA3zh2CiKg1GkI1VFk
 faDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX55xoDwsJZfa55Vp+/gVShNG5XDbdMEGxAXHyYNhUWJy4CTbhgKZ9ohZk+wumrx86qBPy0ZFpi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOowVtJalBYvyWREH06hvfWw8+/b4mM4EaNugcHi5f1wtiLMPJ
 VOTr8bCCrMT0O4G4a/WHibmNKi82NPrzhLQEKL41iqJvOM3AbBfpi3yc
X-Gm-Gg: ASbGncsNenHDF2TndskmNpg72Auz/31Fbcv/HZ+1rZYSblEpyAL2AKsTdENoROiOyNi
 bI6+lyk4C3Opz1OG3QMjDPwm1XBDQYGOe++5Nt4h3N3yLgnkDS+t4B1189p1hgJ8Seu5VXawpiL
 qkrYzbPHqvTdsXsvOYUpooINyWW5La6VFkSFZqmd8d/qZlMKri30nEkt6VpLQUWtOddweKXSsCp
 s79D4sE9swscUF90PZmzyiJgrbTy3Erh1V2EKFSBzsJMzlmr7o2uZh9JvbFnKQoJZ3hNVWX39oF
 Dpnk5DCr8N0yf3N/zmov6Ifnrobrzml0V4myZLI02+gq7dsVcsULbBKXsGkrA1lDUL3DXf+0bBO
 +MIwc+QVcrn8b+L+li3rL/wzJUtvKOIqclrEhIGuTnAi7SDSeMqHw9jNeY+eH9znnbj+hMRxpAX
 ocebJYc+yfIsOOjtv3kKqL+QAT1g==
X-Google-Smtp-Source: AGHT+IExQFsNPtBs1Xj5miLvxmintvWHhiICyxn8q5+dbslUtcud5J24RqOaI8yRZ14HHbP/D4VKng==
X-Received: by 2002:a17:902:db0b:b0:295:28a4:f0aa with SMTP id
 d9443c01a7336-29b6bf5f036mr89773335ad.43.1763890065882; 
 Sun, 23 Nov 2025 01:27:45 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:45 -0800 (PST)
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
Subject: [PATCH 10/10] rust: kernel: remove temporary re-exports of ARef and
 AlwaysRefCounted
Date: Sun, 23 Nov 2025 14:54:38 +0530
Message-Id: <20251123092438.182251-11-shankari.ak0208@gmail.com>
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

Remove the temporary re-exports of `ARef` and `AlwaysRefCounted`
from `types.rs` now that all in-tree users have been updated to
import them directly from `sync::aref`.

These re-exports were originally added to avoid breaking the
kernel build during the transition period while call sites were
incrementally migrated. With all users updated, they are no
longer needed.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/types.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9c5e7dbf1632..4329d3c2c2e5 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -11,8 +11,6 @@
 };
 use pin_init::{PinInit, Wrapper, Zeroable};
 
-pub use crate::sync::aref::{ARef, AlwaysRefCounted};
-
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
 /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
-- 
2.34.1

