Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5CCBAE91
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6110EC2D;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/bD1jlp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137C810E23F
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 11:29:00 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-323267adb81so7456202a91.1
 for <nouveau@lists.freedesktop.org>; Wed, 20 Aug 2025 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755689339; x=1756294139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zOnk2+rOYpz7eECwYsk6p5gDf1G+hGGjc9uxMwX3oe4=;
 b=V/bD1jlpGvqHDq00lycyEO63631mad2bR2/ubi8ArxPrHfmqRNbmgtIV+3xMI6vkUj
 2CJrM17XUjc0dseHW6CantVeQ9BVvGSH6Y4knYqGVE/QXtxLu3KdYWRa6YHPhQ6Re6eo
 YywoNOXurlR6sJKcyI/ZcPQ8LhfBzFtOsJwSmZ2kIARbcv5cIvpuCg3dpnk999HbArvr
 OWShsfsATfe713iOpDVPpqr7OK64nxgGnHPjOno9jrLhfeNPey+0t7Yu2KVFyGKG8O4G
 o6h3bsBWV9enHUBiSecxVpkp+c5uxp417Sz+QXVFTX/VECoxlRFz9HR48RaOwNUMCA0E
 /vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689339; x=1756294139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOnk2+rOYpz7eECwYsk6p5gDf1G+hGGjc9uxMwX3oe4=;
 b=NFQKnUryjWjPWAIUC6AnPcDiBugqG6xzUTWY97xEIi4FjPbycCdH3fC7FUd3BmQHXk
 s2JQVxGEBIFlGh3xdrhXc6g1aCiwOrat7GAO7Zp5nSTxhTqsl0Yp0GO1yLZF2MIka4/0
 wsk5kIbxpxtfOA+VoXmb+w4KkvP2SQ7sCHCTqv6PAwNL18XEXRCeR27I4pCALn/4JKoV
 2O0WKq9nUMCZON0wJfw74PU2QvmTgnOb8AxqmUekveNCdnm+A1lGz7PcHYCBJdI9tFyt
 4S1sxMzQ29WQAmSVzgnjgolWmg8ci6bOVORHUcaaMn0oHFQPT+mzPzu9KLBc5tWC8y+n
 vNuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI+VYRLN1P3GIMbIAJwYxkuxgk4A7chEBb7bujLSuBCDFZK0RtL38isAgi2rKiQ8EsBGx5AtGh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztfZfnjcFrOizRvEVdfoLN0QDFTmjeopAcGeAw0zh4mXNcTAGh
 hX1g4juhtnVvSKhocqNygEttNRhqkIkmXZ2u114WW5Ab3ky67aV9T5Ym
X-Gm-Gg: ASbGncuDza5qMwQNOybMDnnsyIm0e7o/FCl07ZFgH2skj8bdbt4gJHxf0cd5qvySI1z
 RmNssT7wsPIbv4eMDAs0Jh6qGTVkMrVBb2ROXZvj49XYZRD8U7MwpYesOgHPevkBeMsr0oWskas
 snoJeMfyhMhYreTb7bH7x6eNpexfauzppH/Gw+luY7jmvE964E41QzMpNEJw9sDOMDimNxUfOpa
 lO67xaIgqVk4ptpUgMIVlbi1mIZCVhBv2UqIXGH28RF5UII+ZwgI0GrWhXWeT5ZFV+w/jZ1D0mN
 SFmnGFEuA//4yxlKqfvio0obLu8ir5iHKDpCp62zzI/hF5vgnV3HGMVgFAVf6nbUgCLOCws2ZA/
 gBuimQuFi/tIEwq7HdSm2yrjshdw6eKL/LLrdNE7AmI98zoU=
X-Google-Smtp-Source: AGHT+IHC1KRrmEby70STQpwjwfXQJpf3nJ6cbTi+qa72osCtJ7TF9Egj/X+S+o+F/xIiixul1wuoNw==
X-Received: by 2002:a17:90b:514c:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-324e1463fb6mr3542427a91.27.1755689339366; 
 Wed, 20 Aug 2025 04:28:59 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.31])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640d509bsm2114621a12.55.2025.08.20.04.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:28:58 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH] rust: nova-core: Update ARef imports from sync::aref
Date: Wed, 20 Aug 2025 16:58:46 +0530
Message-Id: <20250820112846.9665-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Update call sites in nova-core to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
It part of a subsystem-wise split series, as suggested in:
https://lore.kernel.org/rust-for-linux/CANiq72=NSRMV_6UxXVgkebmWmbgN4i=sfRszr-G+x3W5A4DYOg@mail.gmail.com/T/#u
This split series is intended to ease review and subsystem-level maintenance.

The original moving patch is here: (commit 07dad44aa9a93)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440

Gradually the re-export from types.rs will be eliminated in the
future cycle.
---
 drivers/gpu/nova-core/falcon.rs | 2 +-
 drivers/gpu/nova-core/fb.rs     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index d235a6f9efca..645e65175cb6 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -7,8 +7,8 @@
 use kernel::bindings;
 use kernel::device;
 use kernel::prelude::*;
+use kernel::sync::aref::ARef;
 use kernel::time::Delta;
-use kernel::types::ARef;
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4a702525fff4..68559902ae78 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -4,7 +4,7 @@
 
 use kernel::prelude::*;
 use kernel::sizes::*;
-use kernel::types::ARef;
+use kernel::sync::aref::ARef;
 use kernel::{dev_warn, device};
 
 use crate::dma::DmaObject;

base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
-- 
2.34.1

