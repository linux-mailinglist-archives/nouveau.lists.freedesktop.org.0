Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD474E485
	for <lists+nouveau@lfdr.de>; Tue, 11 Jul 2023 04:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4A910E2E7;
	Tue, 11 Jul 2023 02:57:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DE910E29A
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 02:56:58 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0QWV36WjzBHXhl
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 10:56:54 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689044214; x=1691636215; bh=zNGdXSCrepNnpHI2tm0LU11EN7I
 YuGJuZ9JquOYvrBk=; b=TVYD53cHeWBScM6QIXrZLNpyS09iVctY2Wpqk9wgO2V
 QU9fxCh3JnO+A0dngh/LByaHM8sjmW4l398PPPrchi1yx4ozUyiR3HqaqGx7mOBf
 Db5v/MK5G11mAdAke85Qk7qlGNxjdnKJjjjXElmrErXiv3Uey2R3BGLif/29Cc++
 vuJvljiebigoEPRD+oCr54Fdsd6VIp9xOeVXioLOMpHDiKq+9wYBxc48qiMPC6tE
 gNjR8mFsy8urBY14vR7tcDFOFv4paSX7i+JkAfYTr5r5HQ+qaJ33mH2KWekLinS/
 qbWy+YAJKNKLx4B94+X4c3oRTUBF6Z2llBmaQcBIz4Q==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3LpsNld5r5gb for <nouveau@lists.freedesktop.org>;
 Tue, 11 Jul 2023 10:56:54 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0QWT73LQzBHXhc;
 Tue, 11 Jul 2023 10:56:53 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 10:56:53 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230711025534.78623-1-xujianghui@cdjrlc.com>
References: <20230711025534.78623-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <74ae796ec79b9f4ca90ecdf352c110ad@208suo.com>
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
  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
index b5f3969727a2..ce72079353e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
@@ -524,13 +524,13 @@ gt215_clk = {
      .prog = gt215_clk_prog,
      .tidy = gt215_clk_tidy,
      .domains = {
-        { nv_clk_src_crystal  , 0xff },
-        { nv_clk_src_core     , 0x00, 0, "core", 1000 },
-        { nv_clk_src_shader   , 0x01, 0, "shader", 1000 },
-        { nv_clk_src_mem      , 0x02, 0, "memory", 1000 },
-        { nv_clk_src_vdec     , 0x03 },
-        { nv_clk_src_disp     , 0x04 },
-        { nv_clk_src_host     , 0x05 },
+        { nv_clk_src_crystal, 0xff },
+        { nv_clk_src_core, 0x00, 0, "core", 1000 },
+        { nv_clk_src_shader, 0x01, 0, "shader", 1000 },
+        { nv_clk_src_mem, 0x02, 0, "memory", 1000 },
+        { nv_clk_src_vdec, 0x03 },
+        { nv_clk_src_disp, 0x04 },
+        { nv_clk_src_host, 0x05 },
          { nv_clk_src_core_intm, 0x06 },
          { nv_clk_src_max }
      }
