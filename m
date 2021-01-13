Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C992F4EE5
	for <lists+nouveau@lfdr.de>; Wed, 13 Jan 2021 16:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A256EAD2;
	Wed, 13 Jan 2021 15:37:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FDA6E08E
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id c124so682454wma.5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAO678R3RtkgY9IPzmyb5UFyGCUGLlAwXrenaR2xREY=;
 b=n4HHJXja9efTgsY6gSGtpsDgEfkqFcI3Zk2w8ic/TG6PTg+1W5grCJIbuifEleQBPZ
 +27CrufSyUIL17ZLNP/BTz7Z2J4H2ueddAgeLSJtVPh6AMWSPZ9wFaZSizslJYKksV6v
 d3uWqiyUM7xUzIhGoRencnMz142jUwpfu0hfcSL3UywLJ+vBZ0NYSSP2nHBQqJbcJS8o
 deHY7DmgUSQvCFk/Lt05jaAxGT843B4s6fy56BFPCmDYGy1FYj/cvJQ2/CHecvPP2e1Z
 Szjpy6et/cTX4d0k69ZzZZStXiNPmrmvTi/3+5BxjaEgk/iJTz9OpeMSPJnzluieZpQN
 gu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAO678R3RtkgY9IPzmyb5UFyGCUGLlAwXrenaR2xREY=;
 b=QVEaXf3qWFkJVzjESSGBlC3Y3k/f0T2SA6u2tiCX+6M5WwEyDqneSTRoR/2sfxOrzF
 8Ccbl6mku06zB5MwynEzqtZF7Bxy1FHNowoPoyrNO77JSGMrNPixtryN94NtvoE53MiG
 WpOs0ypnVhRAmxURmaBitKu4HbAMX+II20DJGXaB8dLPa3NzmuJvwS8VZHxUy85NlMFl
 evZ4kpxmavpQkq+/tNXCdNtfwVdnEaJvVnmXyidg4UK6KxvQzMpDnMb9JV6dlJVZrfTR
 IPZ+L0l9lYmVYU9uNXYSwfVwWaTsZYRTMWgCC4RKOGrY8lprJexfhmL8pijiQuF6HAVl
 dBDQ==
X-Gm-Message-State: AOAM5324+GSZ5+J4XzOyNmfZ3yQPFougsaaM7Jj9kUQDfliD0vzQ3z1g
 yayIK64ECM47/K+yMa+wnB9CTQ==
X-Google-Smtp-Source: ABdhPJxHNyoXPfTlp5uRri1k1i0J2v1Wg0OxRoE+fajiSX23gEvASeYjGvrRnoPRxewhB2B/Gkmfkg==
X-Received: by 2002:a1c:7716:: with SMTP id t22mr950377wmi.126.1610525304555; 
 Wed, 13 Jan 2021 00:08:24 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 13 Jan 2021 08:07:45 +0000
Message-Id: <20210113080752.1003793-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 15:37:10 +0000
Subject: [Nouveau] [PATCH 23/30] drm/nouveau/nvkm/engine/gr/gf100: Demote
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
index 749f73fc45a84..33541b4c01114 100644
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
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
