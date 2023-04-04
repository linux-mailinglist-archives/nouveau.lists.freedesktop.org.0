Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFCB6D55FE
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231F10E2EA;
	Tue,  4 Apr 2023 01:28:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0635010E2C8
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=teftSvf3j+oDEfh9blmwCCDYEJcHPfUL8pF7dJUM03o=;
 b=NqFZbJqifYaG7/Y9HcDCPiTkFjb9OkWhM9tDVMF1GfgHCF0tnw8+Q1nu1v4nNr8xHo3/fW
 HgdyU/9s3mbKX0nOG1RLcWDrRktvwr7RJO2GM9SMtOW4qpuqke2DWjXAndEFDY3ZLGH2oL
 gDo5gXAQuQAOs25HAZ/fYxZADt7QL4U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-10a0-xSXO2WxVobc2Yvwrw-1; Mon, 03 Apr 2023 21:28:39 -0400
X-MC-Unique: 10a0-xSXO2WxVobc2Yvwrw-1
Received: by mail-qt1-f197.google.com with SMTP id
 s23-20020a05622a1a9700b003e6578904c3so2504620qtc.17
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=teftSvf3j+oDEfh9blmwCCDYEJcHPfUL8pF7dJUM03o=;
 b=4V+Ys6jRx9na9rjOsq7/4UIvWaMbD9IcAUIVi6YPCgbXrfYK7WvEKRVIvg+pK42uWU
 cB+8tks+h8+NQy0uvE6TbuPZyb7BYL0uxoEuk6oahLeF63mR9GnxW+2afM0TCc9aL7wV
 QtwjFyByR9rVWNyRrWQtKkSNtSDYyjPD3odrLP9ULE4EDD5fjPvsq9SqdKWKfYV12dSI
 vUP/Orduk7l5mptYCrBO6L8/QQxc9mFIv9iP0K68QQT3kDOmNkE1n0qKRrO34aYlNDjT
 s5YIhHwqxy6zfsKVSZhF2FGqpZhx1ivqHPjFvtG6cB3bGuk/Tg+sGT92gIcw9KnL0Vi0
 Lp+A==
X-Gm-Message-State: AAQBX9ci3y6kOtztvDmWN3rWtaQwysEIvc12dL7xoU3bUEbrbao6zt3U
 mp/Rxl5l8nQcDMUCPlnsvPMfx+nfyNSOjhzqwodkY7WzsyIIMaZj27wWSXE3pb/4kFSmmyzWTmK
 EPx7u21VnlTuYQmDiccN8BAaKog==
X-Received: by 2002:a05:622a:198f:b0:3b9:b70c:9697 with SMTP id
 u15-20020a05622a198f00b003b9b70c9697mr1012260qtc.5.1680571718507; 
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbiryGVTITqdtIsbZB0xVNKw9hfnyjZ3IusPT9JnYkHi5X/4j9GN4kCg0GViAYb2/AR5XwFA==
X-Received: by 2002:a05:622a:198f:b0:3b9:b70c:9697 with SMTP id
 u15-20020a05622a198f00b003b9b70c9697mr1012244qtc.5.1680571718299; 
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 de27-20020a05620a371b00b007486d9fa1d7sm3185102qkb.95.2023.04.03.18.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:38 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com
Date: Mon,  3 Apr 2023 21:28:34 -0400
Message-Id: <20230404012834.1914225-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/disp: set varaiable
 gv100_disp_core_mthd_base storage-class-specifier to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c:610:1: warning: symbol
  'gv100_disp_core_mthd_base' was not declared. Should it be static?

This variable is only used in one file so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 115d0997fd62..4ebc030e40d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -606,7 +606,7 @@ gv100_disp_curs = {
 	.user = 73,
 };
 
-const struct nvkm_disp_mthd_list
+static const struct nvkm_disp_mthd_list
 gv100_disp_core_mthd_base = {
 	.mthd = 0x0000,
 	.addr = 0x000000,
-- 
2.27.0

