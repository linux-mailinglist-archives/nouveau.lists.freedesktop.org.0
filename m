Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D002A51805C
	for <lists+nouveau@lfdr.de>; Tue,  3 May 2022 10:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F8510E5C2;
	Tue,  3 May 2022 08:59:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4DA10E5C2
 for <nouveau@lists.freedesktop.org>; Tue,  3 May 2022 08:59:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id k126so6097900wme.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 May 2022 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GCu2xWed9CM+ArEeSF/elieQKXtvbW75cN6mOBPfRTE=;
 b=BSQHGDEWrXzBJ4ICiqA1JPLzkO7BeY/eZsYvEQJQ/UYkEKIK97nVpdXbnWB/Vok2dN
 /tsCpE2JMLwxdYRp1bPxgN/LBSQ9ko6aEZr90il0AzMFr6aHDnVohOBaOabdiDdlOgfX
 WshnkK0MgF2c4q3XIEBRKRdDZ0vZqWavfQLWDXH0FRiqPpGuUa91DjhsfCPVVZ4b/USL
 PZGgGIAT5XDrbsoy5q/MGCFi+QIx94XhNSaI3iwfG5zp1A9OuKSci2etmUVlW10bK9Cx
 PfQ1AJcxtTeDJr9ilPUdibeKku688TRLKmGptoP9wrqF5hZAs97R8upSYJWjedxWKVS9
 4oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GCu2xWed9CM+ArEeSF/elieQKXtvbW75cN6mOBPfRTE=;
 b=OXfxkrXl/WUxTqISJcJipCmU011Ad0uuUErhTIGmy2kMEdPcbBzQsnUogf7DZduZRv
 SH1+fNynzBPH9Sd0JWzshLyychG2BeL8ONHxm0/uq4/XUKvGOOYQ0XRohJ6ML7icSd4M
 LS0/avZRSsohMFp89w6EyBJlneNxcwIzR0Hkukg13TbxAi+qjXWJ8cz6T8t5/KVZ+NJg
 Ha0u7kuk9HfxQ53OXYfYJwWAxdq69wN3sxxBWaJMe9O9tOA0QvLq9N1WI4ttRWLMV/oh
 LQEZFQpHE5H6e68nJ3rdqlQ8b+R/pzPgXcGMQZ4wGxGxoRKazCQnw4UyrLXav6h4WnxS
 hOdw==
X-Gm-Message-State: AOAM531fO2zboiFwnldPxx/qMwM7XnT3eq65LFkEwcFgZf3nw/v1fMh/
 2IJGvU4+S0LXqLGdG2R/I/GpAWHKJ5M=
X-Google-Smtp-Source: ABdhPJw6aYSdYMYPG8tRj0w6DoWwXKe/L3qQbnVRBh8RX1EUWmryzPkSnI1X1iHBaKIP4VRmrkmsnA==
X-Received: by 2002:a05:600c:2c4b:b0:394:36d4:e0ee with SMTP id
 r11-20020a05600c2c4b00b0039436d4e0eemr2503146wmg.28.1651568377518; 
 Tue, 03 May 2022 01:59:37 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c024d00b003942a244f35sm1513777wmj.14.2022.05.03.01.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:59:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: nouveau@lists.freedesktop.org
Date: Tue,  3 May 2022 10:59:35 +0200
Message-Id: <20220503085935.11023-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau: remove trace_dma_fence_emit
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hardware drivers which don't have much difference between emit and init
shouldn't use this trace point.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7f01dcf81fab..abcac7db4347 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -224,7 +224,6 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 			       &fctx->lock, fctx->context, ++fctx->sequence);
 	kref_get(&fctx->fence_ref);
 
-	trace_dma_fence_emit(&fence->base);
 	ret = fctx->emit(fence);
 	if (!ret) {
 		dma_fence_get(&fence->base);
-- 
2.25.1

