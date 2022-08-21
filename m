Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0265A00C7
	for <lists+nouveau@lfdr.de>; Wed, 24 Aug 2022 19:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91D4BF0F5;
	Wed, 24 Aug 2022 17:54:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5DD8B312;
 Sun, 21 Aug 2022 14:31:11 +0000 (UTC)
X-QQ-mid: bizesmtp82t1661092257tqxhds2p
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 21 Aug 2022 22:30:55 +0800 (CST)
X-QQ-SSF: 0100000000200000B000B00A0000000
X-QQ-FEAT: Wyle2N1OIGk9/qf4RjOezsRwFlh5szDP0qWpg9ROsqG5sbiWbn0ZK8iUFuwsj
 r3CM24sDaCZXdJtyTH7UR/iKB5AGvqSXE0M2tE7adbPMbbOW+Eb5WCQZp7wOTqx1o8pRAsk
 CXe2/Vqov+MGzRUTOHniT+Dk/IsNPg5rWpg/ABfRk3rweBuwLR1l5ZvGGk1vhHqaf7fgbzn
 rMUljpC39odco41y9zm4P8FOqu1SK1SWgxRPJ2X3YqWxhYyZZqcr9X7TFSxgc/k4i8nnSlk
 vhsnjdGrKcNZ6kbDdTnQ1r25m708Qr5zkou5kvQxUoIQM5/2/L7OgA3/Tqk/w1Ay7uSWacG
 r0vR6qZ
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Sun, 21 Aug 2022 22:30:38 +0800
Message-Id: <20220821143038.46589-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Wed, 24 Aug 2022 17:54:00 +0000
Subject: [Nouveau] [PATCH] subdev/clk: fix repeated words in comments
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
Cc: wangjianli <wangjianli@cdjrlc.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

 Delete the redundant word 'at'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
index a139dafffe06..7c33542f651b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
@@ -581,7 +581,7 @@ gm20b_clk_prog(struct nvkm_clk *base)
 
 	/*
 	 * Interim step for changing DVFS detection settings: low enough
-	 * frequency to be safe at at DVFS coeff = 0.
+	 * frequency to be safe at DVFS coeff = 0.
 	 *
 	 * 1. If voltage is increasing:
 	 * - safe frequency target matches the lowest - old - frequency
-- 
2.36.1

