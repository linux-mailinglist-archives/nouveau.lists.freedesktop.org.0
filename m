Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18D7069DA
	for <lists+nouveau@lfdr.de>; Wed, 17 May 2023 15:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C5410E414;
	Wed, 17 May 2023 13:31:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8910E420
 for <nouveau@lists.freedesktop.org>; Wed, 17 May 2023 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684330278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qLttclHj7hHhcC/wb0vN9cazD/0VuMDK2HeUMirb6Q8=;
 b=VeLNIEGF/3i8WwXiyvLAH73xkL4rSZqtEx6mnFaICbh02euPDKFtvMZJ/prZrN0usiP5UN
 G8HqFdSzJMyfu4pLiLlRfXklgpsFyjsIvToWCs7gGp/syt97iJE3eBVsuxkKGoSWqYdKfV
 8f2IGKeAHwBMYpKhzNJWSL4shRB6JS4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-M3leW48YOditVRLLDsnBeQ-1; Wed, 17 May 2023 09:31:16 -0400
X-MC-Unique: M3leW48YOditVRLLDsnBeQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6238a4e544bso2656026d6.0
 for <nouveau@lists.freedesktop.org>; Wed, 17 May 2023 06:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684330276; x=1686922276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLttclHj7hHhcC/wb0vN9cazD/0VuMDK2HeUMirb6Q8=;
 b=jwNiHOWwh17Xl40vhjDiPw1wUBG2d7gPJCIayRzu8dwKicq5Z+gRh1xoEfOpMDQNUn
 aq/s0RT++EHM0d5NTOTlIMSv6Dz8KI57kS5x1sFiZab5eqsNL0VTGJGgVMR2pSPRLAwF
 o0t3IbNT9ZsbfFOcTNm9/fNWnMrngWUfDN6FsYJhI/e0ILU4a9OBQzF10/X8uS73awSu
 qKbmfLSg2Osl1EOUuNs7VK5/k9Yc4gUBYAoe3rgV6kvWl1xCVNqP5BVg4Maiql7UoTal
 WaunarDZ/yB/XOJuSaM1YVUVs30rPJd/xszw/VEge06M0LGxa9vfm3ryXksJwa9erGMe
 EINA==
X-Gm-Message-State: AC+VfDynHvcXtrpiY5L7Jtp56O91In2nUxtRADdUnMCFddbndWQt3fwB
 MhpjOXfi89PCP4sa2YoOsP7FOr+KXd4Sp2pg6Wuy+G0gVk/uuyRpnjLH8L4spNY4bUXoBkkMoMP
 zRXQ9DO+mjGS4y+CwhM7TZRrj4g==
X-Received: by 2002:ad4:5cce:0:b0:5ef:8c35:296c with SMTP id
 iu14-20020ad45cce000000b005ef8c35296cmr59457576qvb.44.1684330276111; 
 Wed, 17 May 2023 06:31:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pTwMVj9jWn4rorpVRcw8fHanBa08ioE8BoJ41Rc+agDBnPWOfYwP+DUBx0MafDcOonzskyw==
X-Received: by 2002:ad4:5cce:0:b0:5ef:8c35:296c with SMTP id
 iu14-20020ad45cce000000b005ef8c35296cmr59457545qvb.44.1684330275723; 
 Wed, 17 May 2023 06:31:15 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a0cdd8d000000b006215e9d0503sm4691777qvk.21.2023.05.17.06.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:31:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Date: Wed, 17 May 2023 09:31:12 -0400
Message-Id: <20230517133112.873856-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/acr/ga102: set variable ga102_gsps
 storage-class-specifier to static
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
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: warning: symbol
  'ga102_gsps' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 525267412c3e..a3996ceca995 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -45,7 +45,7 @@ ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 	return 0;
 }
 
-struct nvkm_gsp_fwif
+static struct nvkm_gsp_fwif
 ga102_gsps[] = {
 	{ -1, ga102_gsp_nofw, &ga102_gsp },
 	{}
-- 
2.27.0

