Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE522CCC93F
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 16:53:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 861CE10EA44;
	Thu, 18 Dec 2025 15:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gJLvBfZN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 83D1244B92;
	Thu, 18 Dec 2025 15:45:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766072735;
 b=Zwv+8rsm/Q4vLpaoyJfMCWLk54y4ECnAzIFIwwQ1CTg1q/OHrWlY0UK59Ruvwz2hquXC8
 H7mXZsJhw1r2UttAWBP4uZtc9PlSSDUVUuIYa8ZuXxj5VHUx6cPFZ1GFTzObZRO0VGCmzHe
 Dr9uBLEa7PopPvifRgh1yoyzRKO3AUzbLhis4KRlgNcv4XKGIQs2tEXOxB+ndpmwQxTi9TQ
 KU7GVRpIRb/2fIOp4oZ1muZwGCFXDQPUTI60e3yWwAwdM+9Xhw52PTMCdcEyhthynyrfuip
 WLvPedRzJTM2NIUEceATGIy8lz6OWDxtjAvT/iC3Oz6XATyraKxoePMQvYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766072735; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=G+MUqATQK5uJPOWnj4LSOA9Lhf/cOhsIJhgHTdvLHVo=;
 b=UMKya1DgXiESt4PPleHR0mHZMIu90DC+z6JBb4+F2FzIL+GTyd3VzaIW+SazF80njhIja
 yhlib7Fp469+Z0bbiCVURvzWt3QNUPF+KyeLfiqwv2f9shTnUaINJ4M85Mr6r6a6varhWH1
 BkIyvWXMPaUhKTRs/GJpRsmD7Gaiygqos3edJnviQztpkEASd5jKr1NC+WpzeHnRZnLZQNJ
 DjDtb6r2twQ5AuFmBuCgsQghvQzqG2v1qSzMkSo4OHB5u8TLUwnTPToxKA36hYSUfbmF2Ew
 bsv450hz/xG13IieuAPmIBUiUkaplIdAuDrqLxtLiS6Otq5nWl9b51c3aSyw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B7A4744B8E
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 15:45:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 974D710EA37;
	Thu, 18 Dec 2025 15:53:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C8A744474;
	Thu, 18 Dec 2025 15:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B29C116B1;
	Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073182;
	bh=Acvk5iLutO8NmjLHTbkDla+2OX0ZkKvT1OUyrVQAsys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJLvBfZNu53/I7LNeZPxDrRp/kr1nt6hLbP9EbfgjFWgpEAfRw611pH5sUiY5q/rk
	 C3lh2fx8IIR/2e3zmzdwY+bsS3D2VTH+UYkvfs8vrJ3O31hcYIJJBYUFoPmTt6WEam
	 CRu0dg3Q2YLh0vCQ6g0hsO5qhj+HZAYokXwQfLvF0Fg5AfqJlI395jpGhE6dYG/A0M
	 q6jt8p49hareHf1YkOLa9wBJYtIIogdxUGm7WAZqG+kNaxZK72UwdvtppykKYRFNGe
	 LqNLghldCNLLTKrJ0cdMZiyRCtOAxK+aNsXCl8rOEFA5qeD+Ik9RduPDeLb0z8WXNE
	 uu9B+f0O5IL6A==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Subject: [PATCH 4/4] gpu: nova-core: gsp: move appropriate code into pin
 initializer
Date: Thu, 18 Dec 2025 16:50:51 +0100
Message-ID: <20251218155239.25243-5-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JKXGA4HXMJHEDUERDNPA6ZDJQMH5ZE5M
X-Message-ID-Hash: JKXGA4HXMJHEDUERDNPA6ZDJQMH5ZE5M
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JKXGA4HXMJHEDUERDNPA6ZDJQMH5ZE5M/>
Archived-At: 
 <https://lore.freedesktop.org/20251218155239.25243-5-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Relocate the code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field
goes into the initializer block of this field, making it obvious that it
is not needed by anything else.

On the other hand, intermediate data that is needed for multiple fields
to initialize remains above the initializer, naturally indicating that
it is needed my multiple fields.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp.rs | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 8bc86e1bcac5..766fd9905358 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -122,41 +122,36 @@ impl Gsp {
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
-            let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-                dev,
-                GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-                GFP_KERNEL | __GFP_ZERO,
-            )?;
-
-            // Initialise the logging structures. The OpenRM equivalents are in:
-            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-            let loginit = LogBuffer::new(dev)?;
-            dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-
-            let logintr = LogBuffer::new(dev)?;
-            dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-
-            let logrm = LogBuffer::new(dev)?;
-            dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-
-            let cmdq = Cmdq::new(dev)?;
-
-            let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-                dev,
-                1,
-                GFP_KERNEL | __GFP_ZERO,
-            )?;
-            dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-            dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
             Ok(try_pin_init!(Self {
-                libos,
-                loginit,
-                logintr,
-                logrm,
-                rmargs,
-                cmdq,
+                libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+                    dev,
+                    GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                    GFP_KERNEL | __GFP_ZERO,
+                )?,
+                loginit: LogBuffer::new(dev)?,
+                logintr: LogBuffer::new(dev)?,
+                logrm: LogBuffer::new(dev)?,
+                cmdq: Cmdq::new(dev)?,
+                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                    dev,
+                    1,
+                    GFP_KERNEL | __GFP_ZERO,
+                )?,
+                _: {
+                    // Initialise the logging structures. The OpenRM equivalents are in:
+                    // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+                    // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+                    dma_write!(
+                        libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
+                    )?;
+                    dma_write!(
+                        libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
+                    )?;
+                    dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                },
             }))
         })
     }
-- 
2.52.0

