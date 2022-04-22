Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84650C6DA
	for <lists+nouveau@lfdr.de>; Sat, 23 Apr 2022 05:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5CC10EEC2;
	Sat, 23 Apr 2022 03:18:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BE510E259
 for <nouveau@lists.freedesktop.org>; Fri, 22 Apr 2022 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hxCPWA8afO+/nG6bVigx+oLOlYxnjtDB8EbEFgDn4q4=;
 b=XGxq8l3V+fIMdxiyq6a2LmH2y4NTT4DwGJMV9QSNLNA9Lb22FphxIHWf7zGdByPK5oVCmI
 qmvE2ifSLEuUlC/1xLBXMmtRth9tr2KbPXgegGsueUTl3SXZ9Fo0vmYOzBbxZV1FMVmbG0
 +sWyZD1Dy4Va4tUFiq2+V/0xCsIKC7w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-3ptpsilxMY2szUlaXkYNog-1; Fri, 22 Apr 2022 14:51:39 -0400
X-MC-Unique: 3ptpsilxMY2szUlaXkYNog-1
Received: by mail-qt1-f198.google.com with SMTP id
 a24-20020ac81098000000b002e1e06a72aeso5549017qtj.6
 for <nouveau@lists.freedesktop.org>; Fri, 22 Apr 2022 11:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxCPWA8afO+/nG6bVigx+oLOlYxnjtDB8EbEFgDn4q4=;
 b=grFJ3IJ8QhtSgQakXyGyyNA8Un/peuaPOkf0azfM/xKVH53dfA4FFTuypN0/eBzNRv
 d8VxxVsIgmwFe0Libhezn5cg/O5Lvu4aU3I2VR8cr4Ngf/tBZuoc0lHz0hf6ptgc3bl1
 phOMkln6NfwVaXgsqBWH6yItDjIzy/2xpMpANu0DZNJOou4w6g7NZTKztangHwK5og8t
 oRkgZVWSZDKKDA2S9e5YsWzrfgPfyehZRhogJ/RVtkmTx9t7jF8Kg09wVx0B78TmVPhe
 fQphHy3MMPtvVpczt9eQwr4+Yq8mr1iF0tH6BcjvBaADtERmwqjWgMT4NRVGOcVgGSuo
 HBlQ==
X-Gm-Message-State: AOAM533bW4JOF2oLGrAhtzqHkBTr9BHOdGH1dTbaxI6T74Q8drPJ62UN
 gk8w1gIDh8HmyQU7aeILGX/DdiBoXYi3N1VQ+vGghfFcO9Q5GrbLJK7JcN8zynwPMwcIBuUnIIg
 Aru/ervtGVXS9/hLd8plOfSjUrQ==
X-Received: by 2002:ac8:594c:0:b0:2f3:3fd2:3ccf with SMTP id
 12-20020ac8594c000000b002f33fd23ccfmr4348322qtz.610.1650653499044; 
 Fri, 22 Apr 2022 11:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoT4/XMYJdxpa4GMbbGlHtzbN4fpVF+tFJqN9scdq+SUM9VTkRJ4SJtkWZHXMzlvMYxYQFqg==
X-Received: by 2002:ac8:594c:0:b0:2f3:3fd2:3ccf with SMTP id
 12-20020ac8594c000000b002f33fd23ccfmr4348312qtz.610.1650653498849; 
 Fri, 22 Apr 2022 11:51:38 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 z8-20020ac87f88000000b002e1cecad0e4sm1693729qtj.33.2022.04.22.11.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:51:38 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Fri, 22 Apr 2022 14:51:32 -0400
Message-Id: <20220422185132.3163248-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sat, 23 Apr 2022 03:18:46 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/kms/gv100: use static for
 gv100_disp_core_mthd_[base|sor]
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

Sparse reports these issues
coregv100.c:27:1: warning: symbol 'gv100_disp_core_mthd_base' was not declared. Should it be static?
coregv100.c:43:1: warning: symbol 'gv100_disp_core_mthd_sor' was not declared. Should it be static?

These variables are only used in coregv100.c.  Single file use
variables should be static, so add static to their storage-class specifier.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
index 448a515057c7..1d333c484a49 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
@@ -23,7 +23,7 @@
 
 #include <subdev/timer.h>
 
-const struct nv50_disp_mthd_list
+static const struct nv50_disp_mthd_list
 gv100_disp_core_mthd_base = {
 	.mthd = 0x0000,
 	.addr = 0x000000,
@@ -39,7 +39,7 @@ gv100_disp_core_mthd_base = {
 	}
 };
 
-const struct nv50_disp_mthd_list
+static const struct nv50_disp_mthd_list
 gv100_disp_core_mthd_sor = {
 	.mthd = 0x0020,
 	.addr = 0x000020,
-- 
2.27.0

