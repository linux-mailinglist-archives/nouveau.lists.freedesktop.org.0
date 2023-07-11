Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2C74E735
	for <lists+nouveau@lfdr.de>; Tue, 11 Jul 2023 08:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A7310E318;
	Tue, 11 Jul 2023 06:24:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0C10E317
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 06:24:14 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0W6g2rWpzBJG9G
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 14:24:11 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689056651; x=1691648652; bh=fHSC6h1jLLQ0Gt6st2IMiN0SdnW
 4qTWCjSS9rRbdEV8=; b=cCmY3bz4EXGvSxOrtx8rS1T1yQJNYFt//QQhGACDJDG
 FNKBNFNtbh4vPPQE/z/RRO1sSucYtecEZrhMzfg0wrYMMJAsWS5DI+4NM51zQhJK
 BDi8JAqBLyT765zwXQURefoXjThTL6mtgvilAey/514bNqZDbaSeg2gxU9lkZnRk
 +vErT0ebgcOx9fXi/6hqSudEJGwXBwo2bqfBAqjZ/OMxbikYWNs761veKfUhP66x
 VKRaT/rMD+C5XodKqBDiH24PwoHQiN3CCxIN7SDm6UhKlCs1ALHjSuM/FuoUDKEA
 xgT8iFl4TK1PSANiIL/Sq24e1siZlMyBH5MyoAi64IQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZfXcnq2D4581 for <nouveau@lists.freedesktop.org>;
 Tue, 11 Jul 2023 14:24:11 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0W6g0Vp0zBHXkY;
 Tue, 11 Jul 2023 14:24:11 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 14:24:11 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230711062231.79778-1-xujianghui@cdjrlc.com>
References: <20230711062231.79778-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <06a42364d7f22ab01d90c0c3308deaf4@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] [PATCH] drm/nouveau: add missing spaces after ',
 ' and before '('
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

Add missing spaces to clear checkpatch errors.

ERROR: space required after that ',' (ctx:VxV)
ERROR: space required before the open parenthesis '('

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nouveau_drv.h | 28 +++++++++++++--------------
  1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h 
b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b5de312a523f..89ee6cba0ad6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -248,30 +248,30 @@ nouveau_platform_device_create(const struct 
nvkm_device_tegra_func *,
                     struct platform_device *, struct nvkm_device **);
  void nouveau_drm_device_remove(struct drm_device *dev);

-#define NV_PRINTK(l,c,f,a...) do {                                      
        \
+#define NV_PRINTK(l, c, f, a...) do {                                   
           \
      struct nouveau_cli *_cli = (c);                                     
    \
      dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);             
    \
-} while(0)
+} while (0)

-#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
-#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
-#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
-#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
+#define NV_FATAL(drm, f, a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
+#define NV_ERROR(drm, f, a...) NV_PRINTK(err, &(drm)->client, f, ##a)
+#define NV_WARN(drm, f, a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
+#define NV_INFO(drm, f, a...) NV_PRINTK(info, &(drm)->client, f, ##a)

-#define NV_DEBUG(drm,f,a...) do {                                       
        \
+#define NV_DEBUG(drm, f, a...) do {                                     
          \
      if (drm_debug_enabled(DRM_UT_DRIVER))                               
    \
          NV_PRINTK(info, &(drm)->client, f, ##a);                       
\
-} while(0)
-#define NV_ATOMIC(drm,f,a...) do {                                      
        \
+} while (0)
+#define NV_ATOMIC(drm, f, a...) do {                                    
          \
      if (drm_debug_enabled(DRM_UT_ATOMIC))                               
    \
          NV_PRINTK(info, &(drm)->client, f, ##a);                       
\
-} while(0)
+} while (0)

-#define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
+#define NV_PRINTK_ONCE(l, c, f, a...) NV_PRINTK(l##_once, c, f, ##a)

-#define NV_ERROR_ONCE(drm,f,a...) NV_PRINTK_ONCE(err, &(drm)->client, 
f, ##a)
-#define NV_WARN_ONCE(drm,f,a...) NV_PRINTK_ONCE(warn, &(drm)->client, 
f, ##a)
-#define NV_INFO_ONCE(drm,f,a...) NV_PRINTK_ONCE(info, &(drm)->client, 
f, ##a)
+#define NV_ERROR_ONCE(drm, f, a...) NV_PRINTK_ONCE(err, &(drm)->client, 
f, ##a)
+#define NV_WARN_ONCE(drm, f, a...) NV_PRINTK_ONCE(warn, &(drm)->client, 
f, ##a)
+#define NV_INFO_ONCE(drm, f, a...) NV_PRINTK_ONCE(info, &(drm)->client, 
f, ##a)

  extern int nouveau_modeset;
