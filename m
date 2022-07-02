Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2358A249
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E6112A987;
	Thu,  4 Aug 2022 20:38:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE8110EB34
 for <nouveau@lists.freedesktop.org>; Sat,  2 Jul 2022 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656776355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W8c1SlBUxYM10s99ei02CiGdLvmIh2XzeBEOuTV4Qx0=;
 b=Laa1GwSrast5OcHLAYJOJS1evT7zNqIyKg9N8EeWF70Oqug5dwzS2Mb0PHgwP0YS5/WX06
 oHUoLjrR8L6wnYYXFBTO0DFLbSD9QjtvRHZTyF7vFHR+MyF4eSZPkdgBpGhw5ZwGXjY63g
 qClw6yT/b206Z0PmknCCWHI4tNU/OBA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-VoiGt2UlO_iSOttPh4pMLA-1; Sat, 02 Jul 2022 11:39:14 -0400
X-MC-Unique: VoiGt2UlO_iSOttPh4pMLA-1
Received: by mail-qt1-f198.google.com with SMTP id
 ck12-20020a05622a230c00b00304ee787b02so1797223qtb.11
 for <nouveau@lists.freedesktop.org>; Sat, 02 Jul 2022 08:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W8c1SlBUxYM10s99ei02CiGdLvmIh2XzeBEOuTV4Qx0=;
 b=VYoIPWlTnLyS19GzhmBYRWQBVrRMqUMvB1I9odMEw3g7xGatUGbA+PqO7UudPJxwx5
 o1qp7jus9aT29lIKt6Tj6vR5B4/hyt+9ui4Ck2NU62rdFBybpdO25C7ctOHtl6E6qfpo
 9QDKEUTgZ3Skx2is2f7K6g9T7y7k8Z2XJ7bX1SXI7XoH5dhLtF/bvto3vmRQtaUMiJC6
 9jLEdIjI+l2v5UbYQg02a6sz/WNuQdLo5umEnYc8Ym1U/xdZ02uf73nRCsFwyZrDpJOY
 xglwXzUbOQs8wLyZ7iuJusdvNvuPrmhin0yOifoIQ81omJRihLhk81y8Dbqr+O6qIyUr
 nPjA==
X-Gm-Message-State: AJIora+j84OJTY/nDrtfGeRe5ArDx/3SV0vMZH4wrQuX2sLkAii2s7Um
 aRtXwhc7a/SddqWD/RdJs0Yzz6mgsmUyyVNs1Z19hjoQJZB49HMCyMvcHQa1/a+MLfCGuIySKMS
 r8u7SgW9AMydO86s7MNrWzHM2gA==
X-Received: by 2002:a37:4549:0:b0:69f:556c:4e38 with SMTP id
 s70-20020a374549000000b0069f556c4e38mr13936448qka.202.1656776353549; 
 Sat, 02 Jul 2022 08:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4kMDCJkO3l6rc/tzkcDONaBzbN/O5Ul2p3pH701RTsQYUDroNVnzGAdCYv5GPNqp46q1+Vw==
X-Received: by 2002:a37:4549:0:b0:69f:556c:4e38 with SMTP id
 s70-20020a374549000000b0069f556c4e38mr13936437qka.202.1656776353290; 
 Sat, 02 Jul 2022 08:39:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05620a448900b006a708baa069sm14569688qkp.101.2022.07.02.08.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 08:39:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Date: Sat,  2 Jul 2022 11:39:04 -0400
Message-Id: <20220702153904.1696595-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:35:22 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/bios: set info only when the return
 is not 0
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

clang static analysis reports
drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
        switch (!!data * *ver) {
                       ^ ~~~~
A switch statement with only a default should be reduced to an if.

If nvbios_pmuEp() returns 0, via the data variable, the output info parameter
is not used.  So set info only when data is not 0.

The struct nvbios_pmuE only has the type and data elements.  Since both of these
are explicitly set, memset is not needed.  So remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
index b4a308f3cf7b..49e2664a734c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
@@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver, u8 *hdr,
 	     struct nvbios_pmuE *info)
 {
 	u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
-	memset(info, 0x00, sizeof(*info));
-	switch (!!data * *ver) {
-	default:
+	if (data) {
 		info->type = nvbios_rd08(bios, data + 0x00);
 		info->data = nvbios_rd32(bios, data + 0x02);
-		break;
 	}
 	return data;
 }
-- 
2.27.0

