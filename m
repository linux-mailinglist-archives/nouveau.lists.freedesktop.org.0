Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49272CBAEE3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2210EBEC;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0U34g9k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565710E3A6
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso28027765e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285083; x=1762889883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
 b=O0U34g9kjzfbX7orcTctDELNw1P6JVo7NioFiBrqXNp6OPIdGal/EaoyY/f0dWRnI5
 dYFe8owGiac/r9LucdOgY64X9GUcnsEWzug10qIQXAHmqUrc5d/S91vKAfjelomAftp0
 ptcQzYeamjhEGJXHAVhe8zoQLlrEZQnTZ+LeovRiFHrDFBbyAuX2yzhGEAPgP6GFPivD
 UayaLw6KQ3OXx2cxhM98hjiTLfsLOmrF+O+7yVU7ir7tf+MRZJp0V3dC24PzRLqjulA6
 S6cA5YMEo1pSE2Iw+a+xiFVZ5ntPAZd1n5NA7vojT4XUF4aay3iTHkhm+t10Arfy4zmo
 0K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285083; x=1762889883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
 b=Li10itTC0m97PVshDhztmSwqkQC9wT+iJlvFVhPYizdl1PENYHkOhDuuzB5EAQs4oi
 yA0SLHn0vuOy4HF9i4N7dnqwMUscxQSusrO1KOwNPffKdK3hPP+GyyS/4jIQ8jf8nX57
 hympGGnbqNFPyPWKAjgwkqBLCOAnUs44WjkBOqXQesAaIR6W4rx54swOEaTqMNKf43rQ
 TPiSI6PhrcRNMJlRoW7c5iwTN8kRIeBQnv+ta9V69bXuhtXKXkcparR+kiAqi80XQu8M
 PDroiFUVE/uVpMJwR48zvnR8vuFuWXWkFtpN91QfyNq0HgbzhpfSicOAfjoZyO8UUNtk
 Ep8Q==
X-Gm-Message-State: AOJu0YyJYcLuWIII+58OD+WnBrgkcQ3vBPK1xhQP5oAZl1jx8+mCAVGR
 tipSUZibX4Ut6qLXh+LXMKruVTJl9jlNTDiu8zrEV0DKT8hrnCOyqQRL
X-Gm-Gg: ASbGncsytpTcQeoLSZ2LLe3f/QJZtfwSfv9VIsomG3i87Hb1mcbKRu0ewIeKQDtJnvA
 6huF6LhOnoTfQPhsshtPZ+R2aerRwAMBKOh+aMleb1ju443ZSXQQIYN3VdqTw9MBkJPrFKtlOaX
 q6RGJbKxNI+gj5tXrWVy9+Exe1zVedTTM/0MCEouH15iqfwG45dk96rXq31cgPMOvgDZK/vnbpu
 tVkEZsAg5DvXQAmSnuyjlHA2o79ZjA5Q62c6XPCHMhAn4QN6hBZuuMPnuvBm36vNN/tIXHZs+wo
 h0GMC1zodb064waR1XBLEUyq45BhjA17yPMFkJdIVk1uqRbs92f6BzNlG6+N3cwYE2Jz/gXWgWu
 WFB44Kov4i+9d9q5WwaU9BkUTeOu7XzwjuAgEodQKBbSDAQ3b16lMqRjr6F4gQ1gIqoFxSFAaFD
 juzyfy943eBKxCeGWMNw==
X-Google-Smtp-Source: AGHT+IEg6aUY+0P7kqhINTv2xiPrN6T4RUVpHv5FGmHlhfMEaLbEGCK4acGBL7ICAZFqqzMOEyKd6w==
X-Received: by 2002:a05:600c:8216:b0:471:1716:11c4 with SMTP id
 5b1f17b1804b1-4775ce20dcemr6765225e9.34.1762285082750; 
 Tue, 04 Nov 2025 11:38:02 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:02 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 2/4] nova-core: Fix capitalization of some comments
Date: Tue,  4 Nov 2025 20:37:49 +0100
Message-ID: <20251104193756.57726-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

Some comments that already existed didn't start with a capital
letter, this patch fixes that.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 4f268fe09573..7d5203268313 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
@@ -44,7 +44,7 @@ struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifV1 {}
 
 #[derive(Debug)]
@@ -68,7 +68,7 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
@@ -82,7 +82,7 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for ReadVbios {}
@@ -96,7 +96,7 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsRegion {}
@@ -108,7 +108,7 @@ struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsCmd {}
-- 
2.51.2

