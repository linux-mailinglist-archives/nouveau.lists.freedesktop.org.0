Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46A132B877
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4383C6E99E;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEE86E8D9
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so2882932wma.0
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=Lt9BZLEKeX6vZm5O1anyCQVHXnHAylqWnmLnxySRpm1uwZYBNJrww3+26dI4sP4eTZ
 3zZSDTnpns8MDlaOgJfHoN6qh+cm4BiWZzB1zBpqrWLL+E7kmxRHVKPXKqHib53fQIiD
 vhgBOjv906Y8rlLoQzee6gXFbwV4KGSgzl83yL9lO2lzIb4ewpLRrwJzPyeFn8nJb88x
 GM3CPy0U1XHTu697oiHMzETTXMJZjVYfe4oMQpLdhMuQ2LTsEoaqGxNeZLtU5stvUbeQ
 dlSdbiTfPzFjWFK3xqPiapITv1hmqABmayWWM7trUot3POqVeapO2PX4C25ehIPmg3ez
 rvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=KazIwz8N6GB2p5OGct5h8w/jgHjEma8SQdRV36qkjtX9GdZovIfGCnJ21eBLkya6zD
 lMuluNlbyJ5PU63Hvjxocv5qLuc2iUfoDIkGhfEfR/MEUCiBTN1cAVvU8d+5ed0236+u
 FgYRbO/K8ConXCGIUengUoLJR+S679VT8DeZuhAInIzcrmScb0RVhP50Bxhkth1n05cK
 o2p1bc6QOupvS8cJcUEOCcTb+2k+RApoBocqrRejsUV7hbsAkB5m7g8aiOyJh76iH6dZ
 c2XD7IxQ6xJpvf2Hx7daXaN3iBSpAyIAH0shilwJzU5O1WuYG2SNQCB2nuLBVJ1g5p4a
 0cjA==
X-Gm-Message-State: AOAM532gGhGxYxhdW6x/Xg0rMRXQmHZDmZ3mNozuxmZYZUO0gHdphct9
 puAHaAnTwCrQ8VqQYq+YHQdXKA==
X-Google-Smtp-Source: ABdhPJxnR8YWXV0kvaiGo4Fnh/JzG/G0i6PnEYHzmg21U6zym4qPrzBpBFNjcyj/LMiLGdnMfETvwg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr9540066wmq.159.1614779023095; 
 Wed, 03 Mar 2021 05:43:43 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:38 +0000
Message-Id: <20210303134319.3160762-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 12/53] drm/nouveau/nvkm/engine/gr/gf100: Demote
 non-conformant kernel-doc header
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 397ff4fe9df89..69e6008f99196 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
 	}
 }
 
-/**
+/*
  * Wait until GR goes idle. GR is considered idle if it is disabled by the
  * MC (0x200) register, or GR is not busy and a context switch is not in
  * progress.
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
