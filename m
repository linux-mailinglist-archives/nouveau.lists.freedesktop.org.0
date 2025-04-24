Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB15A9A978
	for <lists+nouveau@lfdr.de>; Thu, 24 Apr 2025 12:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A3210E7C1;
	Thu, 24 Apr 2025 10:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kpTRX8fe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5410E7C1
 for <nouveau@lists.freedesktop.org>; Thu, 24 Apr 2025 10:07:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A1DA5C633D;
 Thu, 24 Apr 2025 10:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D91C4CEE3;
 Thu, 24 Apr 2025 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745489248;
 bh=yyLeyUNGU3/8laij0GGzuu+0DqJYDKth3Y/kTZOEoas=;
 h=From:To:Cc:Subject:Date:From;
 b=kpTRX8fem3VQJrSxMeffzEim00JBHw8UJs77oRTkMGX/99bxinghB8PPJqlnkvzlZ
 4Wz6TpqeAwdBvqjjLexDvTfm69hgSf7KqJimkMSysEuaccvDgg/XStYmcah4EJ47SY
 yLeGAllRpteDUMecFlfeLuucELmDdN0PiVhDoxEJs+SdoLM58p91+/g2IgN+NRGk6u
 rQhVn8oMT2nul0bf7fs3yJOm8dze4PwStB1ARF07XctJ0quvyFVVtNZl+pWy1Wn7q6
 m734bm/orBcbfJT0rhUh2tcce1V3e/1nZJ5MjAVVL3+oIC2HW6JYRegUPkXkcV/7BB
 91vVPS8yT69+Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: lists.freedesktop.org@freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] drm/nouveau: Remove surplus accel_done
Date: Thu, 24 Apr 2025 12:07:19 +0200
Message-ID: <20250424100718.27651-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
format") introduced a TODO to nouveau_chan.h, stating that an
unspecified rework would take place in the "near future".

This seems to mean the variable 'accel_done' below which is never read
and, therefore, must be a relict forgotten in a previous cleanup.

Remove the TODO and accel_done.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Remove accel_done, too. (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 2 --
 drivers/gpu/drm/nouveau/nouveau_dma.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..7133e4a03504 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -33,8 +33,6 @@ struct nouveau_channel {
 		u64 addr;
 	} push;
 
-	/* TODO: this will be reworked in the near future */
-	bool accel_done;
 	void *fence;
 	struct {
 		int max;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c52cda82353e..790045ff5fff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -92,7 +92,6 @@ FIRE_RING(struct nouveau_channel *chan)
 {
 	if (chan->dma.cur == chan->dma.put)
 		return;
-	chan->accel_done = true;
 
 	if (chan->dma.ib_max) {
 		nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2),
-- 
2.48.1

