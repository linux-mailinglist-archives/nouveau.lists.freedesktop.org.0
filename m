Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56D36227B
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 16:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEF46EBFD;
	Fri, 16 Apr 2021 14:37:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683046EBF6
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u17so42504688ejk.2
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=EZGprGprx9G7TEQ68Auk+daq8vbCTAQMFTsyZFPKo4Phxj0vwWWnhuFEnSZXapOAKT
 THtuKKPY7eTB5HZr+G07ksaPqGhpWv/I38h3wy3YUFsXTZHGtn5UAvCCW+rDaGQ+sPg0
 qnsycTSyDtvv+/k5jd++8THPcSq8XE0ZqvkXHNmNQMtIyG4h0GVRs8H71GVrN92xksLj
 WUHkYR+i66WWHaxgq4KbXH8cmw0G4Fe4k0jSH77EaRzk2Q6+Nhh/QIXUi7DHa28bkcEq
 pmWJOdZEjvZovPLobeHwdyD1d75fBLv6QiyVolMRxqhWV7jviOV+Q90cSenbtYDqqeke
 +iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=OHHYonK9oZu+4HxB77ROInnqzmx4If9QkB7ozvp54ScroRPZ8Kg3MOvWFz9CA/xE6y
 dwMVndHJB7Z/43wiwgjC2zmfsKop7uiBZ7UIsmbnpHzTiBokQ6sgOCld4ZK0gJMHsjGa
 j7FC3maxWgRz/zBnBfiQYQuzZ+Sa1ZlouQgGLFllvn+km1IExMMF8SoP8B/d6Ey7yuMI
 95hJG7bBvzAl0PrF7YSzA5GziyT6vi2Jq87EoGkbikMPMy2VXMIuiJ2hrMt8bgob7tBc
 7qERhGUKfNz7Qx0I/N+UnZwtXXFzSrN5ZxQ2idLK8wgQLnKhN3++oxvLuJGu5A8w4XR8
 XcvA==
X-Gm-Message-State: AOAM531Ep8nIztiazh4krNNZMeBqtKHCgKy8IM6SCa7HGYfI220T7OIv
 FDFkAXnvRuiCLqMs4dSxgcaNbg==
X-Google-Smtp-Source: ABdhPJzks9fZldZx/wSb0VN/VG2NSj3lApLtnjqtRex+X74agUe6ql5EYvMhZPXct8zUnQC4X96DPw==
X-Received: by 2002:a17:907:760a:: with SMTP id
 jx10mr8921163ejc.126.1618583857134; 
 Fri, 16 Apr 2021 07:37:37 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:51 +0100
Message-Id: <20210416143725.2769053-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 06/40] drm/nouveau/nvkm/engine/gr/gf100: Demote
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
