Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3213C4E7
	for <lists+nouveau@lfdr.de>; Wed, 15 Jan 2020 15:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BF96EAAA;
	Wed, 15 Jan 2020 14:06:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6676EA23
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2020 14:06:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u2so17981913wmc.3
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2020 06:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpaCDCp3aHifqmtaxF5hEcnltst6bnP9UNBwuYjhTyg=;
 b=uz/uXYTiOFJ44/TLVCgYExcwylBymtVJe4kPo2u+zUTksrUbJEjCNopJhDVEY/Q61R
 lR0K006XswSwr2UQOvP+hzZjbnOqBjfvhca9tli84HO5XhXaj4WfhBRMjIQojONKUJ1E
 2UKDuf6krQSqCF+owAeOW5d/+uz1/c4YK55AKxyArSJ11lcyT8sdlDA+5iFaGOFMm6LI
 LGsVtBOW18mOV/TZXItj7BQ4JY620F9QavAGgPs9XrgrgyJ/Zrnu9pMHNPrHvHtThyEu
 Il86FkvQIQ1K1uM9oPZB8xCy4HK6CcX1hc7bShhnkHB0ZNOId25hYkGKCa/XbJvmadt5
 BKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpaCDCp3aHifqmtaxF5hEcnltst6bnP9UNBwuYjhTyg=;
 b=lqlK6CzYJ+Lp21EpzNCUJi138qFt0whw6387plHxwToOQEXVx5bi6tiMiXYMy7CS7n
 tiwIvmrPlxEzlPPqpJ95t+4VC5joWbNbX8vb3IYxoYRCK/Vuml8Vs+tSvqHyehhK5pjT
 BbkPwr8vSdVknDEtq9r7SHT6NoZZ4YAibV4+jGUJWrGz23nWRZNdM045Eoi8V3YMr/kQ
 r+AFflqDLon4tGr3CNqwM5kJNjdsbnbbAOhmxciV7XQ75goGU1owuRaxipe1KGG9lrkF
 oUmR+OuIO9pNNGtSOR1gYF1U3Zubu5VhYiC2/vJi07zXbW3lkx0iAJGEcrKQYuOZzhUl
 JBpg==
X-Gm-Message-State: APjAAAXoFWYUCTagseJYnPAXwyCG3b+xq7Qg9+v2PgGZeW0z+jPVXK9f
 XpE4bvOswoIz1UxvDQXZzNA=
X-Google-Smtp-Source: APXvYqzgxb+l/AQl2zK9ehpckCGpp5lcjCBS+W4pziqCj97U6Z5Zrr80a44bIrdJwLbHr6vaOxEcwg==
X-Received: by 2002:a1c:9dd7:: with SMTP id g206mr33806939wme.61.1579097182214; 
 Wed, 15 Jan 2020 06:06:22 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id u7sm23337154wmj.3.2020.01.15.06.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:06:21 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 15 Jan 2020 15:06:13 +0100
Message-Id: <20200115140613.70268-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau: gm20b,
 gp10b: Fix Falcon bootstrapping
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The low-level Falcon bootstrapping callbacks are expected to return 0 on
success or a negative error code on failure. However, the implementation
on Tegra returns the ID or mask of the Falcons that were bootstrapped on
success, thus breaking the calling code, which treats this as failure.

Fix this by making sure we only return 0 or a negative error code, just
like the code for discrete GPUs does.

Fixes: 86ce2a71539c ("drm/nouveau/flcn/cmdq: move command generation to subdevs")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that this is against Ben's tree, which should only hit linux-next
tomorrow, so most people should not be hitting this yet.

 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c | 9 +++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
index 6d5a13e4a857..82571032a07d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -52,8 +52,13 @@ gm20b_pmu_acr_bootstrap_falcon(struct nvkm_falcon *falcon,
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gm20b_pmu_acr_bootstrap_falcon_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_id)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_id)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index 39c86bc56310..5b81c7320479 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -52,8 +52,13 @@ gp10b_pmu_acr_bootstrap_multiple_falcons(struct nvkm_falcon *falcon, u32 mask)
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gp10b_pmu_acr_bootstrap_multiple_falcons_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_mask)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_mask)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
