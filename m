Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D918CCCC93C
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 16:53:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1786610EA3F;
	Thu, 18 Dec 2025 15:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lzH6VXSa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 08DCB44B93;
	Thu, 18 Dec 2025 15:45:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766072732;
 b=KdUwHvWnYrFACvO8lBUlewQ1vIyh4ZG/jOqXYD4SGaj21FTpW2BVxZzeUvoazxuJAvNVg
 K9MYykaXA7aUzjQAM4udKaFVxLVyUaG4XWiS2snOtlDvb9af5f5yWasxldYen5WX1G9rBEq
 3f1NpFg+GxZVJHNI0iKyZ+hAsFLdeMQFnhpjyrwMDuEuyyjk8QjVw+TFg70gKUazYMFFDBS
 I9/yDqjtbDzjoOLbvfzHPsOj3F0LXBckc1cqW8qo7q32WO4eRld2wH5aVkf0I42DdV2bM15
 50KQtNMbrCnpFBsFVQKGPG1sOHDFMqwbGbIAnjS2yCzBdbXJer/t2CddrVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766072732; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=w12iGA6nUZWek0LIDaNb85iRePusaHseLXQNqQqcD38=;
 b=rp06ZIBpdGPb/AODHpB0ftVj/1V5kGOvcjhyO48o0JcYVe9wLnLMCdWB1SOsFV8JJFpxl
 /1HyTSoFwzsnLJPgP8LGH/T7KAkbhxqlNy8rAhqL6kO9ZKvOEF5T/gS+L4rGEeKufCr3Ry9
 TLX2i9bWM9j+rt/v88KzNW8S1Ifi+eyhBQwumUUq7+NEdV+rxRo41L4HXSAmUeAk84BF0kR
 Z+CMMLqTJVIrVmooErzkMCEtQzv2dIW+I/R/txQ8etmOct3Gsfxf75UDz7zsDcZ0+1MaOKe
 E4dhZvFUdPObYHv72hvvHWU3ISAwsNc7x+anl4eL/eYh9nqNeBxvn72Uiqsw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7CBD444B89
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 15:45:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 441B010EA26;
	Thu, 18 Dec 2025 15:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B668660008;
	Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA34FC19421;
	Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073179;
	bh=mAqob5mbv6FapcPS/iSYQO3lcLOl40s89j9fmY+JxAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzH6VXSaSYuzW+LM5rHFjXy9bUhqsaHVxwYEUqlZwBYk6+ZIauHjc4tYlHr9Yzf3u
	 UfxCd230qworoQfHVYyjcU1dxlgT5x8evbKGdbuIpKO0mMFHWzyIpEjHzriS2K3RTx
	 6g6DG21lveBY/IrymygKwRMyIcX1svj5Enh3XLqNEdpnQZIIP9KS7FBru+7qEoqVnQ
	 9s3SpEvxRofLo27TiLo2pB1bPjwNK/SjSsMWDUMg+vudQmJFT/1cHUB47vH1qIeZXK
	 H3/dR48VYxI1bl+QBXRJWaHpp2hKwu7roF/lxc7NxLJ4lXkI9UJ/c1veerQpBtHFaq
	 4m6nRKTSNUemA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Subject: [PATCH 3/4] gpu: nova-core: gsp: get rid of redundant Result in
 Gsp::new()
Date: Thu, 18 Dec 2025 16:50:50 +0100
Message-ID: <20251218155239.25243-4-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NFN4AQOZQL7TCD3LUGQ44PFPJUTJXYHJ
X-Message-ID-Hash: NFN4AQOZQL7TCD3LUGQ44PFPJUTJXYHJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NFN4AQOZQL7TCD3LUGQ44PFPJUTJXYHJ/>
Archived-At: 
 <https://lore.freedesktop.org/20251218155239.25243-4-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In Gsp::new(), utilize pin_init_scope() to get rid of the Result in the
returned

	Result<impl PinInit<T, Error>>

which is unnecessarily redundant.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gpu.rs |  2 +-
 drivers/gpu/nova-core/gsp.rs | 78 ++++++++++++++++++------------------
 2 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..50d76092fbdd 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -281,7 +281,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(pdev)?,
+            gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..8bc86e1bcac5 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -119,43 +119,45 @@ pub(crate) struct Gsp {
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
-        let dev = pdev.as_ref();
-        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-            dev,
-            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-
-        // Initialise the logging structures. The OpenRM equivalents are in:
-        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-        let loginit = LogBuffer::new(dev)?;
-        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-
-        let logintr = LogBuffer::new(dev)?;
-        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-
-        let logrm = LogBuffer::new(dev)?;
-        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-
-        let cmdq = Cmdq::new(dev)?;
-
-        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-            dev,
-            1,
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
-
-        Ok(try_pin_init!(Self {
-            libos,
-            loginit,
-            logintr,
-            logrm,
-            rmargs,
-            cmdq,
-        }))
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        pin_init::pin_init_scope(move || {
+            let dev = pdev.as_ref();
+            let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+                dev,
+                GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+
+            // Initialise the logging structures. The OpenRM equivalents are in:
+            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+            let loginit = LogBuffer::new(dev)?;
+            dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
+            let logintr = LogBuffer::new(dev)?;
+            dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
+            let logrm = LogBuffer::new(dev)?;
+            dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+            let cmdq = Cmdq::new(dev)?;
+
+            let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                dev,
+                1,
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+            dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+            dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
+            Ok(try_pin_init!(Self {
+                libos,
+                loginit,
+                logintr,
+                logrm,
+                rmargs,
+                cmdq,
+            }))
+        })
     }
 }
-- 
2.52.0

