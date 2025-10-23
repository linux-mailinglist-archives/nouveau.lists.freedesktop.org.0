Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EC0CBAF91
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E6110EC9F;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkjkww1U";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0CD10E953
 for <nouveau@lists.freedesktop.org>; Thu, 23 Oct 2025 20:51:58 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-62fc0b7bf62so1971162a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 23 Oct 2025 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761252716; x=1761857516; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
 b=Wkjkww1UxhS30n2haOpGjns/zW0hiNgbmiGv9KA4xiMT1wfE3WoAIyIbPxEcx918yB
 lKXjWnZyq4ByJR9jEADClBRdV6GXY7R8Cb8lmTo/+nAPHkJoDzKeu1g+6kql+gzwBRnb
 XOBFXr0anmEewdQBD4gEnsuduD9mbwtMEkkGVyx1FMS2x8hLQMaqnwAD4uM6KCgMRpjW
 2mOiIAOWPaYfUPMVPcuqmuBstV25CHtj8G4UJnav4UY9eKnT5WU9RLMcRi9ZljqtSzQm
 rKEi8CDOiGzD8BcH7rarTwh/uvseu6sLNiuM/BX4PND8C9JAgL6doADfqr+ZAp3iox3I
 2Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761252716; x=1761857516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
 b=wXnYMtarjUh/O8NOICoqyCwD4frUmmPW4TYqhGP0jhLaF9ierUIuhXWkx4vmgMfmzv
 jL+81tU6yC65qgoLLYokrNLcTwq1LRS1DDHebkE0XEIFbPHvQ8oQhMbHWM2RT4Tgp/Hi
 8Jd0581EpZoLxtJR7dUg++Rb78dkiYaYH/+MRrEDnG7eHF9s06eo6NL86KX/WOiNxMJP
 daEhA5xiiX+BbDOlVtg6MXybrrOlM002pRbPh+pMhv9YuGDHwXSGgXRYY82yG8ZhJ2qy
 /VG8mG31Pef9ldrnK5sOSpBs5mYESx+QqRVE3KgVuWl6KKwzJxOV6b6x/Oj0z3v+PagL
 IO9g==
X-Gm-Message-State: AOJu0YyQNXpqklPyJrgs9fjGvcVPRmgmnfOw+Ci590FywburGEOmhv+y
 KCvfKkNTF2I5j0FjTW0ejGYZnIvHU90xIPzVR2Tw32fKkBL8mo8UhCIu
X-Gm-Gg: ASbGncvNeQI9duav0dzOB07P1nCtJTIOccQyEbNkXO9NXiXkt8afxhf26zr+gRnoYP0
 ZExxZUoQYlWy8I1H1paPcqldq8nIC/9bSNjthtxuBnTNXfH7tbxAkKCyGKtEYSxliQr/37UbDzf
 meudLUlPQqzyoDOjnetIwQHflBb9eRdXw1690H7xsiXqCGgAySVN9MztRVkhAxwd6SvFAvX8Hd3
 DHPVJKlyd76qBCPP+BA5zL1BHWr2siqRDHZqsb96s12A1TFJGjC9oA/zpBzyukFtYT2Urhlf2x6
 5KZMfWMmhMuQqhACohlbmYPtsv24qRnUpFmRL1b4ZqQe/NrChwu1qvidWIDcm85m90A7BBweQCP
 rp9V2JdgpsaryQe1FtJz19fkHLAmr4scCQ13xM0Az0Ljoo3dsHVQ+5ei7JHALAEPUTOrqPF9U4F
 xU4c3ddhxSi7jldvJlSA==
X-Google-Smtp-Source: AGHT+IFX0S8naZatH+IeZ+gFwMfUpBUu0mzJ5xLs/IvrcDwpmdXZobGQxw0XYiP34F1iyLjV8n51aQ==
X-Received: by 2002:a05:6402:50cb:b0:63b:ef0e:dfa7 with SMTP id
 4fb4d7f45d1cf-63c1f62ccccmr27493360a12.6.1761252716410; 
 Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
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
Subject: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
Date: Thu, 23 Oct 2025 22:51:36 +0200
Message-ID: <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
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
---
 drivers/gpu/nova-core/dma.rs | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..620d31078858 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
         Self::new(dev, data.len()).map(|mut dma_obj| {
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
+            // SAFETY: We have just allocated the DMA memory, we are the only users and
+            // we haven't made the device aware of the handle yet.
+            unsafe { dma_obj.write(data, 0)? }
             dma_obj
         })
     }
-- 
2.51.1

