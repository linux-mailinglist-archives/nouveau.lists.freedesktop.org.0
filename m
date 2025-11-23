Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7830CBACF8
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE0110EBDE;
	Sat, 13 Dec 2025 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUWRlt1y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810B310E126
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-298250d7769so25010855ad.0
 for <nouveau@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889988; x=1764494788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xs0t3Szo5vFHo7IPg5XaI/zhW3TrAdFJK24NyqJJsf8=;
 b=RUWRlt1y4HLc33xUwqQHxym6UrmFgjP54JnU2J0Qf5PIIdN/GsxKMuksbRD/RVgnDr
 GaFh4wUODF0ApViNtppFoaqyLvFq1AJ/OHd+ww+ccm8K1bUe/gIWhyTYBJBG2KA9ytEE
 Ayw6aghUtPfpdZStIQPwQDINscAvvWiUDVdS4BgED+vyNs9Qf0lt5ZVHG+ClgVEDBB86
 TsWdonaCmjXIfNssB2xyNdhikGBth2KcX0Tj4Sysm/BjrWencxgXWJGOTnpaLbDQOdj3
 1iNIS6BVChHzm9UESkqblc6IIOfUW6IqFdIaQA0Fc+TtQZCH2jiru6o3c69lTrRDux1x
 l0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889988; x=1764494788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xs0t3Szo5vFHo7IPg5XaI/zhW3TrAdFJK24NyqJJsf8=;
 b=dIPnes6Mnw58VXLBONAu7ThZllMpBux404SpWl1DPFi7HTUnroR72L9pRCVJnor14Z
 79QQTFZCYNQKc7KV6VNAAIsO+mT617s6FI/GazmDWouaawrG0BQea/bnAS+/azTp3SST
 RExqROnjTS1v/qMXl9pusCXFPxYc9FUB6w6WWMC2f8RfcmN+lpnV9zrWeriuSeSc/LuE
 nIwXJWYx5k+NwckLkr8A0La1D6WTpWfTBNVUk2oe4Txujvetwo/OEjOscAZTwxrrLB3V
 wpOBrXBWH7fICm0bOJoE/TlNtOFYesDbfwHPOhuECo40uego44b3wH9PaFaUWrVfUr7e
 r8jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVferOopaI9ucgh93lLP/d4EbO6Wsd1AXgdX4PhfOiPZptHLPzAbYEJQTMfuVvvQfaqpmiBaH4V@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwICTbig+M/VHtqgBI3HT2EJkuwkztxG6MNsRvgTuL81ObEXi4V
 TvAZuGgkXgAS6OkCKqY2rjDK6ZxBUVFJNna7TvvOlofD/w4Ou49QDVkV
X-Gm-Gg: ASbGncvi9nF6WxgxW2VH7QdIkLojRv+vPUuSF2Q1F0gL4yOfaQvW1wwZ5rooE0rCRwR
 Eg/KgFegrxyo4QSeFpQKiFUmz5FUd3y3/uHg11EvsCj/f1T5J5kP7JPTeYUkEUY0nHC7/LKfpVv
 5uVdTYlXSEOvUDBa1OPM2N/wWPO6Rqlqn4F4ZDeHbtQ4KtQTu6zR3zjOfV3ZZxPWD6OMD6yu1XL
 KLvSBgAD4xKmx/w0b/8WFJ5H19kH0S+bumkSPM6WPChAYI3J7a2dQdGXKMYmPqCI4aZ3OThCt1G
 fHy0WAmOdh3UYrBG2bYmaI3IZI7tvlRJexy5rQEsbsZl2BZn8affq621FJgE/VhpZvyJ4Ji/laj
 vyBVG7YgKY15Vpzz2/ge4jvGvaNSkbNSgkJxA+3KEpUuP7ZDnF4NP2p9USOxdn6o6TPRO9Uwj5m
 296qc+jpGgH67di3ELAXAgvu1GuQ==
X-Google-Smtp-Source: AGHT+IHrOOJNJDa2GgrTIgoioCLDvBuXEfSk2IH1c+DBdbSr+pLO2PBSd1zxccfzPHswbjyfTYl0aA==
X-Received: by 2002:a17:902:ccca:b0:297:f2e7:96f3 with SMTP id
 d9443c01a7336-29b6c6b693cmr97059755ad.50.1763889987877; 
 Sun, 23 Nov 2025 01:26:27 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:26 -0800 (PST)
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
Subject: [PATCH 04/10] rust: drm: Update AlwaysRefCounted imports to use
 sync::aref
Date: Sun, 23 Nov 2025 14:54:32 +0530
Message-Id: <20251123092438.182251-5-shankari.ak0208@gmail.com>
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

Update call sites to import `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a7f682e95c01..76e6c40d525e 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -253,7 +253,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
 }
 
 // SAFETY: Instances of `Object<T>` are always reference-counted.
-unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
+unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted for Object<T> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_gem_object_get(self.as_raw()) };
-- 
2.34.1

