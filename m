Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32F74E55E
	for <lists+nouveau@lfdr.de>; Tue, 11 Jul 2023 05:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDB010E2F4;
	Tue, 11 Jul 2023 03:34:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1143A10E2F1
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 03:34:23 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0RLh30YGzBJJhp
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 11:34:20 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689046460; x=1691638461; bh=6ZIvBKyTDToEuxpYq+WPdlVRvsd
 sgjAeBAYi1t201Go=; b=oM/9maOl0zk8HJwP0Qi3lax5f6SXFaQdwLBaxDEHGIa
 tjqujcmdSF7uDMW36JIm8MiqLwvpF7TRTstUCWi1aiLqkVZqxCYwcONmaKx7xO5b
 A9Wpu2T2FBDz/gcFpwHuN78uj18HpBzu5NgxNYn6A5atJUXYU0C/V21yMD5UnKGp
 hTtzfwuV1JhMSJlH9alM1bMJKsw4eTXBS1fqKpeGfikiZGiAuNUDPyF/mw8L67hD
 I7l7/wlHWjfvwAIdfNahDEiCbeTnf7hQBpaxCKQAHE5RnOuH1sz5oMMtcTQ/wulY
 eMtcHwYb/tHlFf7wqWcMBmeVVTxylWT2igc8Vx+wLuw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zZmaKScoOW9q for <nouveau@lists.freedesktop.org>;
 Tue, 11 Jul 2023 11:34:20 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0RLh0N2CzBJ8kq;
 Tue, 11 Jul 2023 11:34:20 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 11:34:19 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230711033246.79078-1-xujianghui@cdjrlc.com>
References: <20230711033246.79078-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <757078717970984a2ba9642044e37259@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] [PATCH] drm/nouveau/clk: remove spaces before ','
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove spaces to clear checkpatch errors.

ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  .../gpu/drm/nouveau/nvkm/subdev/clk/gf100.c   | 20 +++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c
index 6eea11aefb70..09face813805 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.c
@@ -453,16 +453,16 @@ gf100_clk = {
      .tidy = gf100_clk_tidy,
      .domains = {
          { nv_clk_src_crystal, 0xff },
-        { nv_clk_src_href   , 0xff },
-        { nv_clk_src_hubk06 , 0x00 },
-        { nv_clk_src_hubk01 , 0x01 },
-        { nv_clk_src_copy   , 0x02 },
-        { nv_clk_src_gpc    , 0x03, NVKM_CLK_DOM_FLAG_VPSTATE, "core", 
2000 },
-        { nv_clk_src_rop    , 0x04 },
-        { nv_clk_src_mem    , 0x05, 0, "memory", 1000 },
-        { nv_clk_src_vdec   , 0x06 },
-        { nv_clk_src_pmu    , 0x0a },
-        { nv_clk_src_hubk07 , 0x0b },
+        { nv_clk_src_href, 0xff },
+        { nv_clk_src_hubk06, 0x00 },
+        { nv_clk_src_hubk01, 0x01 },
+        { nv_clk_src_copy, 0x02 },
+        { nv_clk_src_gpc, 0x03, NVKM_CLK_DOM_FLAG_VPSTATE, "core", 2000 
},
+        { nv_clk_src_rop, 0x04 },
+        { nv_clk_src_mem, 0x05, 0, "memory", 1000 },
+        { nv_clk_src_vdec, 0x06 },
+        { nv_clk_src_pmu, 0x0a },
+        { nv_clk_src_hubk07, 0x0b },
          { nv_clk_src_max }
      }
  };
