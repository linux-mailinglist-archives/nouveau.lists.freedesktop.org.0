Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2725459701
	for <lists+nouveau@lfdr.de>; Mon, 22 Nov 2021 22:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469AC89DA6;
	Mon, 22 Nov 2021 21:52:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx-lax3-3.ucr.edu (mx-lax3-3.ucr.edu [169.235.156.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515F6E095
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637046443; x=1668582443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VO2ps4lqNewVdq22Zvj/a2S0OmORg6rzuJt+A60klUs=;
 b=B0VNqevkNocfDyGmMU37x9YmU72cq1T0jT4NVBbE6gqQCV6ectHEv8hd
 e/rNFQ46s5L5KF1+ERuYGKCykyyhov7eSiOiyf2OkzJfntuGjzpz0Le4r
 JkyWEpk5dbjKyVDKS76d//QhCnPMGzAEt1CFTAErs4syiwsGMlqNAYteO
 trOVAqfs6DsSKiZebMKPRe5/ctWin2c6CXj9lLaLD5z1p6+riRDlHsO40
 uSBrorTZYfuogLH4IbcaifiS+ReaLT8dFL8o6xB8GX4VQVjgqYRUy3UCX
 USQrvMd9C5VhMFlPE5+KnUhx1aLdL5gv0ZRlQpihjOcovi4OVjL6XFLfP g==;
IronPort-SDR: UWmtEoJAHVHhk7h+uETNahDI3AHb/wHPOfNTaD1BvGvMfRd1VYdERe5YVlC5gvIBYLctqEQubN
 5Lz9YzvoDQA7GlxetGtYEAVWBa0zEYDb5QKvDJQB7H/V7sShPOGN54H6Z5nDAPcr/KFeYvT9E1
 Rb4uU7hGUCc/bxpFbZ+6wroBD0UETHXEa4klaRPZk6D/0CwAKWh12WCJhHhEbDwT+9O2frdzZt
 9o1rF5nrDMEHw594mM9JBJ/KnSR+g7T79hmoJPoMDCtD8i4QrjKqa7J61eNpa9ER1KlkUYZ8l7
 s9+tLhTcRSfyH09YY285NIRc
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="86393205"
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 23:07:22 -0800
Received: by mail-qk1-f197.google.com with SMTP id
 bq9-20020a05620a468900b004681cdb3483so7975820qkb.23
 for <nouveau@lists.freedesktop.org>; Mon, 15 Nov 2021 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=f261Bw5lz3VrnlrV1z2mQHVATuwQH6Nv2Sn8mpGgv9cJwWqwounaC+e3aDrcj3xAUr
 HajLMQLzUyo4LmusHEW65YiMETuOWE6W64PHera/XO2cNYPf41Gb8NvTLyO35Vu902XT
 5oBdWzzt/izYc7pK1lt9bBhvSdVg+ygGGP82g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=SgY6t4sHfGlAyUp8poFU7r7ENrhoane9S8Snk1SW/1oqb6iW8uMLrAWO3XpNxp/rLF
 s576BHmvsMxPtgyQPSK+YRt2JC8mB6Mjc565K0xnzLbrJJGICp7kkU/Ta8RYcHOhpzu3
 5al2rFuCOouhTw7OMpkYoeNK0Jp/M0sN+JZrlM42k398WPBRCkes+kS5BSuxWY/i4r+m
 yPnrmlMzHTYDCCxL2fVXEmevVZU4D96YJN1Bpd6ZNqCpT+xOF+0yoD6h8URsQqj9Mdv0
 FeSm3C9HzB6v5o/Sjg+SxhyqcECtCbph3uBBX+beLm0u8acqolmsjpez/rRCIX+82DwG
 eSJg==
X-Gm-Message-State: AOAM530oSv/QVTR4jkvK/U6/s+lcQUNGASZ05aqixsIsTFk7Y3M7bp1U
 /Ic4goP+hzjd5FpX5ommb6NqvX5ESqiRIjNT0A5HSyZBxpJWY5bMoAIeVO8zMeiOtRq0gQbK9B8
 z9WR/OoRFlMBEPUtC3oCSbanWBWg=
X-Received: by 2002:ac8:7dd5:: with SMTP id c21mr3298172qte.176.1637046440624; 
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhPC/C2kELtqxHwiDBXwIfNPToSUuU8wpj8qVqVxKjt5Ut7Tn0HkLJ7k8XQtQn5Vfh9zODaQ==
X-Received: by 2002:ac8:7dd5:: with SMTP id c21mr3298153qte.176.1637046440389; 
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id w10sm7205942qtj.37.2021.11.15.23.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 23:07:20 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Date: Mon, 15 Nov 2021 23:07:04 -0800
Message-Id: <20211116070708.429432-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 21:52:42 +0000
Subject: [Nouveau] [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
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
 Yizhuo Zhai <yzhai003@ucr.edu>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
be passed to map function")
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 735cb6816f10..4264d9d79783 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
 		ret = nvkm_object_map(object, data, size, &type,
 				      &args->v0.handle,
 				      &args->v0.length);
+		if (ret)
+			return ret;
 		if (type == NVKM_OBJECT_MAP_IO)
 			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
 		else
-- 
2.25.1

