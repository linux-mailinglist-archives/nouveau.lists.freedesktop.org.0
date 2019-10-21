Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C224912B2D0
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564E46E104;
	Fri, 27 Dec 2019 08:13:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA816E176;
 Mon, 21 Oct 2019 21:14:59 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t5so13399834ilh.10;
 Mon, 21 Oct 2019 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LR3+seWWFASqTSZQrCeqQuAxv454H5+n1q+3KOFbBcs=;
 b=G1I6gh7o/OFhK2+ufBpndx46sR9cyY67N6CBxIyxkgWvcaRC5RoOzDnEuqkOFFZ9Xh
 G2lGR9XhD9UJd43XoN6GjpKobREtEatr0444g4HiQ0vIp6qcNtT9izy8dxqFp7CXKHce
 8ZBaD4kQTeheSROXlCqCHJqYicJ5iQ9VeVlwsT+l0LYnADQQy12XeEgxz24VbihIbmas
 EBjpvrrl1tTvDVxNOoo+e8t7++Ptu20ey5KWx8LMT5lgriVDB4E5qG+qhKZbKmv0K1nQ
 sj6wWW0LedhBb9aXveHWrW2drichJEGv+dQwI930GHMCZji2BtPwr2uJu7Pbcz+SohQR
 h8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LR3+seWWFASqTSZQrCeqQuAxv454H5+n1q+3KOFbBcs=;
 b=ALPryS71TneRlDMJ7owthI529LX9FUw+fUOgYwkvqalgaSp8m6VjYXXIfP9hSbEEt1
 RldPw5UMbex+PHr0EuQXzpdk+PDl4sUHdpop+XbcBo1goBQaKjywduaZMkDdDN/ycNVf
 oGf4a647iPZ2d/Th0feF6+Atc92EOqaAE1EeIFOkOx4m+IXq+HPHHeMV3+QTb0v8kpYu
 tEZlXydTOOwNBzBNgJ8yW9mKghsE5XuZmz3Bk+G6MbQKLLElVL+DtZQShEI2G7TOfXVg
 FHZdffmj9JxRNsvTqxrKehIocPTU26N5wLe0xKPIIzbDy80pm9mcQEoY0cxvJO9nxCKp
 ePJA==
X-Gm-Message-State: APjAAAWEH4Lh+bnhga52r1Y0a2NM55R3Wb5rebZMfzgqHavjZ5ntHu/1
 Dzkxy/AMALscAY/rEImoPwA=
X-Google-Smtp-Source: APXvYqyUmrw7izwsnnLUWNHlEPHYO40uOt6aOQoTUw2Mw/Tsn91K4k/anOyP4E2hJDIrHP3dqzyD8w==
X-Received: by 2002:a92:5b16:: with SMTP id p22mr29585825ilb.226.1571692498435; 
 Mon, 21 Oct 2019 14:14:58 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id m9sm6722618ilc.44.2019.10.21.14.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:14:57 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Mon, 21 Oct 2019 16:14:48 -0500
Message-Id: <20191021211449.9104-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
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
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emamd001@umn.edu, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In the implementation of nouveau_bo_alloc() if it fails to determine the
target page size via pi, then the allocated memory for nvbo should be
released.

Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..18857cf44068 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
 			break;
 	}
 
-	if (WARN_ON(pi < 0))
+	if (WARN_ON(pi < 0)) {
+		kfree(nvbo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	/* Disable compression if suitable settings couldn't be found. */
 	if (nvbo->comp && !vmm->page[pi].comp) {
-- 
2.17.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
