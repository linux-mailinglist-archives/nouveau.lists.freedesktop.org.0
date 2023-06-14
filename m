Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4D7373D8
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56A10E354;
	Tue, 20 Jun 2023 18:20:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 08:47:42 UTC
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE56110E42F
 for <nouveau@lists.freedesktop.org>; Wed, 14 Jun 2023 08:47:42 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QgzRp3WVbzBQgny
 for <nouveau@lists.freedesktop.org>; Wed, 14 Jun 2023 16:41:42 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1686732102; x=1689324103; bh=h+SpAy2nuTWlCvtX2/0Ll4CB5fW
 +IZqeULGpgLetKiY=; b=YPl3IUT3c8A9pD7JjJZRLaCPkv8lYszY6faKW+FkZ+g
 ms5Ugg2d1JtqRgms5GLDz78j02fjR71+ffUdkMOg5ViBvcufuWE8UnE4Hux+xp/G
 UvaUCMbqvtGeeqVlIUdoBnm5dv+a4iWYOYT2IoF7PEECnfWYqmjRqYZ1l5ZkS4tZ
 AQlDW8/YIb1GaL4hfcTTnZVIy06/Z/PIK++DeGdo2xkFGtr4L+uub05RW8iBUycK
 H8zHXwobqTF3FBNjoOcm2sQUpEXD1356ujKasAPtUNNVfsOSUEvTOatw9lgBXZ5+
 36rI+xIG1OBlFC82JI2isD6Lzno2gYDxOD+/xvJzlNw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2l8XLxMGvNWP for <nouveau@lists.freedesktop.org>;
 Wed, 14 Jun 2023 16:41:42 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QgzRn71C3zBJJCt;
 Wed, 14 Jun 2023 16:41:41 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 16:41:41 +0800
From: baomingtong001@208suo.com
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230614083928.30151-1-luojianhong@cdjrlc.com>
References: <20230614083928.30151-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <a43c84a95c83eb9b049c1d99a092aed3@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:13 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/nvkm/engine/gr/gf100: Remove unneeded
 semicolon
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

./drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded 
semicolon

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c 
b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..204516891ece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct 
nvkm_fifo_chan *fifoch,
              return ret;
      } else {
          ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, 
chan->attrib_cb,
-                      &args, sizeof(args));;
+                      &args, sizeof(args));
          if (ret)
              return ret;
      }
