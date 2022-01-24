Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C44499FBB
	for <lists+nouveau@lfdr.de>; Tue, 25 Jan 2022 00:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D410E62F;
	Mon, 24 Jan 2022 23:22:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jan 2022 17:05:42 UTC
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6546A10E36D
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 17:05:42 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4JjGRD4Qxfz9w2Cd
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDMf5iEWt-ad for <nouveau@lists.freedesktop.org>;
 Mon, 24 Jan 2022 10:59:04 -0600 (CST)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4JjGRD2Gl3z9w2Ch
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 10:59:04 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4JjGRD2Gl3z9w2Ch
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4JjGRD2Gl3z9w2Ch
Received: by mail-pg1-f197.google.com with SMTP id
 u133-20020a63798b000000b0034c0630b044so10243341pgc.3
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jan 2022 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBdR4mgm88fr12HVo/ewep9TPqR0vTSvkIZJUoqDnV8=;
 b=i9gwll8Lj0xIystAPGKZPE6qavOR9ipRhN3UOjJAZBL0zM3KdFOuYScCsxjIL5KW72
 mnmvOoi35XlwgkX90lC/GVK8Y5bsuSZXi65LxGsHvNcgieXe0Cnn0I9HugOK75K/Ap40
 +I3jYOQxsiMstiLOooqtHxjBlOXnOw9fzWuqctJCRUEyjHwCC6/nM2vn6wjoN1FuIqQO
 pFXTUxn6gXYd7rcEdP+irCKVGkHe78RM23O4Z9t6421BLl7GpcjJ9aofu/nNpRn5qdYF
 nQSbPgd/GcRvK/eWVUGTpW4vXI7zPkbqp3+BWwcEA2aGlBlOoKL4tX9E6RsEGIpdozLO
 jFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBdR4mgm88fr12HVo/ewep9TPqR0vTSvkIZJUoqDnV8=;
 b=B4DlFRVBI81YaHmzQK2hERcYw1s23pA7N63/E/OhS89pVXogG2KPR7sGzcxr0mkU0M
 TWi4zVecCueEGZ8t/eQyA3pOSKrJzl7/WVCBRVd2InU36HnUrB+mV3yNEUt7/nqUQlSG
 +T6snoXL6Zhye+ut3yLh8RojFONsdj22fo1aGdvbGjzaIrjMKKroPsq77uw4KnrF9MQP
 TyHJlTBValvrqXg0by7jOFV98n6FCzDPdRxrMYAfDm/e3f78c3rULnasMNyb8RcDlVzH
 k4mwHvO2/r25m2diJvyojzX0987Nnb2KGa7bN67KuSU5kehjEV8bQnU/12F+FYmoTVAI
 OnbA==
X-Gm-Message-State: AOAM5311itRNHoybQpCpkxVyYKUHaoLApclSA1lBfla12J+E7ZhG7Tu+
 dKlT6l8c85p9lJhazZd+LSMIIn5OLw/HRpSBVkLF13dxSwF2QXbslc0qRqGDtHZQ+z/2U0r5qI+
 HWAfPY/yTfUVUnbJN1ZXjgwc7QAx9bg==
X-Received: by 2002:a17:902:a502:b0:149:c5a5:5329 with SMTP id
 s2-20020a170902a50200b00149c5a55329mr15059192plq.164.1643043543449; 
 Mon, 24 Jan 2022 08:59:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx153Lwqmcm3ClgP1FVJyLtTuU1uOlM4S9H5l1vuihVakSp4Vk8HYPmRXyyQQ13l5bkmxsCkA==
X-Received: by 2002:a17:902:a502:b0:149:c5a5:5329 with SMTP id
 s2-20020a170902a50200b00149c5a55329mr15059179plq.164.1643043543198; 
 Mon, 24 Jan 2022 08:59:03 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
 by smtp.gmail.com with ESMTPSA id c17sm17289913pfc.171.2022.01.24.08.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:59:02 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Date: Tue, 25 Jan 2022 00:58:55 +0800
Message-Id: <20220124165856.57022-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Jan 2022 23:22:06 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
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
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
passed to memcpy(), which could lead to undefined behavior on failure
of kmalloc().

Fix this bug by using kmemdup() instead of kmalloc()+memcpy().

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
index 667fa016496e..a6ea89a5d51a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
@@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char *name, int ver,
 
 	hsfw->imem_size = desc->code_size;
 	hsfw->imem_tag = desc->start_tag;
-	hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
-	memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
-
+	hsfw->imem = kmemdup(data + desc->code_off, desc->code_size, GFP_KERNEL);
 	nvkm_firmware_put(fw);
-	return 0;
+	if (!hsfw->imem)
+		return -ENOMEM;
+	else
+		return 0;
 }
 
 int
-- 
2.25.1

