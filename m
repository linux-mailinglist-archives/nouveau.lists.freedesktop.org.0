Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C6341F9A
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377486EA36;
	Fri, 19 Mar 2021 14:36:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72E46E9A2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b9so8285209ejc.11
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=OnTiL+kaW2zPMVdE6HXbsGxQ56nJJiDEZgsDJm5nTCAM4F/hYTuXOK2NTbkdhYGdNn
 UZMIHFqal4fYkP7086YR1KXfPAi/0CN+sG8/46L+IAM8dNP1vslB5d59gCck8HYzsxBX
 8OThjxGNbudGNQnMUlKQnrHaV4SeVJNDrOTuMKO2LAtp6PnZ9U75IsnFx32iuV4wLwfR
 XWhNw0uh22NIzQJ2aYGDTtCC5F6jAkh2TdHE5uwhbYDJrmsIshJDfYDky345zQdyg1hr
 76QZn0QUO3HPNj3coc1puorPSUkz0ygttAur5sEkxr6gt0JwQXwqn3E7UHaUJ0x2BUI0
 zBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=K2Vwsl959U4cHITBSj0EepkppJf1yriPbIyNyTDAxkXbDuKAo3Wewac5Uh81zfGUd4
 w48dls2f7dN33/p4EMyvTst3M/PBmfIcFTkpzIQfRUTD/5cc6wpEdiclGxwI/DuDCZWh
 iqMpQfEqQFiFvs18fuRUCI1hPpU08cRXm7cGGyfSkiwvQqzOhOWaqjkq3kfn21zqVsTk
 v9yonCNIwA+NsLZNyvtm5afWN/GLSIrm6RjzSAbhbNV6MJAW9E/tW1UVMsZeq9K9PKKT
 aQF1Me/8GxiTFzt8vKA2VQQXE3ao03Ed73xdRLF9YUnFGb0x9TMJbW1NrxOjAAenruMJ
 prvw==
X-Gm-Message-State: AOAM531NU3UI66KM77vhYysaC1F2FLZXy6grI69Ym1QeQcMM/PYr8NNx
 vG5J6o4etbu5aZyb0wbJIhoE9w==
X-Google-Smtp-Source: ABdhPJzRvstPWZ77izvKn3KAab+DmdytKTVll16/lNiRi658rs93jLltp05EkycgqyLl7Df3JOnGwA==
X-Received: by 2002:a17:907:2112:: with SMTP id
 qn18mr2967233ejb.220.1616142281401; 
 Fri, 19 Mar 2021 01:24:41 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:18 +0000
Message-Id: <20210319082428.3294591-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 09/19] drm/nouveau/nvkm/engine/gr/gf100: Demote
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
