Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A4CBAC73
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910FF10EA80;
	Sat, 13 Dec 2025 12:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPiLDzyP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823E010E3A6
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so2843855f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285085; x=1762889885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYgheLN32MsYWSBCELea5jaxOC/f7khm7azED0VQk/A=;
 b=LPiLDzyPdeQ8EHW203wIRtr7XXVMp3n8qYUkpxORybmQVFGWmoG4FV2RUfeZnZ6T6v
 ci2q+pVrxZqjzArPEiFQGdZpiMp/P69/DAdYlcV4CouVura5DdvVsdM4CkIhK+OBEX4X
 siDxlQ9HxqKh6crRgow0wYemWOTUKipmn+V/c57TQX+KnJPwE5MC3hoJyOS8Jzycx8Ba
 0CneNYb2crMWuNlWVM+DAYZ1XYOMnuZGLfjRN3Yl9NJYKQ1lfvjtUg/cxxpwXUWH0M2h
 ATNAJedQAGnwIZJxMxmZNAURLKbigZzpYNwtNSESsZ5EtnEaKEimIr9F5nu8wQp3DYNf
 zZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285085; x=1762889885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYgheLN32MsYWSBCELea5jaxOC/f7khm7azED0VQk/A=;
 b=oBp0MwK3T2sAZQP9RvZ765ZDSG3WffRxXe1oytonsp64rwfcGw8KZAiSPPw1hIHejs
 EPzOPvJhsnRGHMLNYAiLXWRWx7XARPWMzFlQRjw/DJFproWUJ0JOz6NYjdNFHp3OtEp0
 7k2C8C/Bm4Yii+7pgSyFaY1exiJotx48LA9yyQCaJLsPSF0DG7RZdD1li0GpkoTuABwM
 1ojCGEpSdBMg8cmoDFRlBkgSZnN8+1SKGVALh5GXcKw2IUyY/nkzI8a3GgP64Q16XCC1
 Nv27gOHqQKtncQUGUqRIKwkQerht65MWaqVDh6hfAK6EcAwRUjR/wp4A9axnIl+NWuy/
 iOcw==
X-Gm-Message-State: AOJu0YxYBl4RWWLg31DbXUgCNMwCvHHT0zIUTPGXiiW2mbYbFvB8gZzB
 cVtLgXpL2RBKfBtbltIkOXCOa2yaceDJXU6NdMyTdBxDxWNiHh4nAT2c
X-Gm-Gg: ASbGncsry5fUD/YNFu5oF91/Nra493NxlV2TGdiF5iTht8jWsWRugC7yL4AmrBAhWQe
 087WjUr5qXphDfTCD9Ps2EOOaM+booYXYIn/dhBK7hoxC21PF8buSjuazuXNb61mTqfYp9WC11t
 5aCuz5OgyKvRbkCg9K5uNnooCPvd2RDxro4qYMaNgtdAdrg+CJBD8tUACbRyl29YQus++FPy6XV
 mwGpqK4Z1R3zifpe5pf0sedD90h1tOEuaj08vT/zNtJFtP3dkINoLFAn1C5jbC9Npc6F4OTPKiK
 j4OGNj2205VN5htnUKKKvzLSfGMVk4Vsn+LyKTWFhIevcAlSmxZafMEdDVa2TmW3SgZJTnclN0p
 1Qsn5Cwzt86/lRa4J2u/12uBK7ZRief8Lw/pSo4GuqVnPcMj1L2zBeqKV7LJ70Vc3C0vXL1vXID
 QhYQp9LZydraK1LLYF7g==
X-Google-Smtp-Source: AGHT+IGkjMaYQNAOAYMzRxYOldsYeku+UMuN0PlwdK6jupihKC6msqilxvcotQ3WG/fqCuJVIjKe9g==
X-Received: by 2002:a05:6000:210c:b0:429:dde3:659d with SMTP id
 ffacd0b85a97d-429e3309ae3mr294212f8f.47.1762285084988; 
 Tue, 04 Nov 2025 11:38:04 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:04 -0800 (PST)
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
Subject: [PATCH v3 3/4] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
Date: Tue,  4 Nov 2025 20:37:50 +0100
Message-ID: <20251104193756.57726-3-delcastillodelarosadaniel@gmail.com>
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

This patch solves one of the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
It uses the `write` method from `CoherentAllocation`.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>

---

V1 -> V2: Split previous patch into two. One per reference to COHA.
          Added more details in Safety comment. Let me know your thoughts
          Kept the original map to avoid a temporary variable

V2 -> V3: Fixed compilation error.
---
 drivers/gpu/nova-core/dma.rs | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..9acbe2e4d4e5 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -25,20 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
     }
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
-            // SAFETY:
-            // - `dma_obj`'s size is at least `data.len()`.
-            // - We have just created this object and there is no other user at this stage.
-            unsafe {
-                core::ptr::copy_nonoverlapping(
-                    data.as_ptr(),
-                    dma_obj.dma.start_ptr_mut(),
-                    data.len(),
-                );
-            }
-
-            dma_obj
+        Self::new(dev, data.len()).and_then(|mut dma_obj| {
+            // SAFETY: We have just allocated the DMA memory, we are the only users and
+            // we haven't made the device aware of the handle yet.
+            unsafe { dma_obj.write(data, 0)? }
+            Ok(dma_obj)
         })
     }
 }
-- 
2.51.2

