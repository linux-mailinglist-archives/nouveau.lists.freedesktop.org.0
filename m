Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BB7101FB
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC3F10E0F6;
	Thu, 25 May 2023 00:31:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7907E10E0F6
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:20 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2553b0938a9so651847a91.0
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974678; x=1687566678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c1qprDOV0v6S06922TLasojwqki/GzTJtRzwrMvkZ7I=;
 b=lrazc8KsnhDCXBfsSbbie2UMlo1fdmFoqJhQgIBh4p+QS652tMx50l0ARQCe8Lwp5w
 HxSrklCsID+jLd4+3Fz9OS9t8U60xQ+BFSULoMszzJa4zx2Y+gQ9ik3wqS7DNKPfx3UX
 bKftzNCHGHdsLrSISXux5ufaP0LJFQXgfyn2y2r9ObHBC7aDqyX5VsbCs4YrV5pcqWwF
 GsjKyR0pCU6FO/tMoO03PcuZZNhz7YYCn9s0DWIQAIVzXQiPsNuEWCadjbQBYYnUNDVZ
 /dednI1RsFS6rGmRlZavXjknsLEMnD87Hr9YS7WVlzy39nQ/xSjoktDEIuUtTux9YixU
 DAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974678; x=1687566678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c1qprDOV0v6S06922TLasojwqki/GzTJtRzwrMvkZ7I=;
 b=AnsqtpJ9RemF3drxjNiSyM2ygft0t6i86cPHnhzdOmIfEJNpV/I75ZezgulZxOFc9v
 Q3RZbN8RsPrPCJLYChgenXGFljMpXJoZUiTX2U6xRGeESYgPOkU+VgRP7gY2tMkjJaPR
 qS6eBme8WJB9kVvk8SPVvVpYEM+anGfe4OF9uCz/SsSHzi4Sm/3aJByBHEisGnLt3H1j
 aGH2Gc72hVLTRVg2Bi/xbpxA68lZPRXje4uXaPz+VZWcZIVKSioegHodsHnimkgHKYhY
 tr0msc9RG88N54BCOaDqpfxK7hrndeZndwi31mn9ziFHzyGexLPaT9WGsduSJSn8oP57
 fwkA==
X-Gm-Message-State: AC+VfDwkOxTSyZqnMn9bGI+hW9oqOuTVbeHhMBw3n1p9Z1bgjhi8U/1D
 L1t6Mey6il/yCeoouWr9WegyjVJc1hE=
X-Google-Smtp-Source: ACHHUZ7SoG88g3ZhncS/iaSlBLwBbp1vQX3ae+zKw6xUTfb/016Uur8vJJ54u3fJlH8p+UOI596pgw==
X-Received: by 2002:a17:90b:1050:b0:252:f7b1:943f with SMTP id
 gq16-20020a17090b105000b00252f7b1943fmr17724598pjb.24.1684974678531; 
 Wed, 24 May 2023 17:31:18 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:18 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:30:57 +1000
Message-Id: <20230525003106.3853741-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 01/10] drm/nouveau/nvkm: fini object children in
 reverse order
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Turns out, we're currently tearing down the disp core channel *before*
the satellite channels (wndw, etc) during suspend.

This makes RM return NV_ERR_NOT_SUPPORTED on attempting to reallocate
the core channel on resume for some reason, but we probably shouldn't
be doing it on HW either.

Tear down children in the reverse of allocation order instead.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 301a5e5b5f7f..7c554c14e884 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -185,7 +185,7 @@ nvkm_object_fini(struct nvkm_object *object, bool suspend)
 
 	nvif_debug(object, "%s children...\n", action);
 	time = ktime_to_us(ktime_get());
-	list_for_each_entry(child, &object->tree, head) {
+	list_for_each_entry_reverse(child, &object->tree, head) {
 		ret = nvkm_object_fini(child, suspend);
 		if (ret && suspend)
 			goto fail_child;
-- 
2.40.1

