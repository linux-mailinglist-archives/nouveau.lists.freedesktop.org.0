Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366E6D9751
	for <lists+nouveau@lfdr.de>; Thu,  6 Apr 2023 14:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AD110E245;
	Thu,  6 Apr 2023 12:51:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965C810E245
 for <nouveau@lists.freedesktop.org>; Thu,  6 Apr 2023 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680785468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a8vJf32VjBTqhSXC4UaNWwEC2++PydY9gb3nY7Y6vs4=;
 b=DFYhq67WrTL6ArlpuJXmIQhXglpf4BpBAaDFHWP6f3I9CaG7GXVEQTsYWM7LweQUNMZRvh
 /mBT8wrcmblt27MPPdZrZWEHsS5EkF/gjfeIt9ntKdEeVDaS2JZ9KNeEtswd2xI5a0qAV0
 q8zaLQDSkxFjUIYNpxem4YxBwj4cuxQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-aINpmoYrOAO_jlTA6vxsOA-1; Thu, 06 Apr 2023 08:51:07 -0400
X-MC-Unique: aINpmoYrOAO_jlTA6vxsOA-1
Received: by mail-qk1-f200.google.com with SMTP id
 198-20020a370bcf000000b007468cffa4e2so17670545qkl.10
 for <nouveau@lists.freedesktop.org>; Thu, 06 Apr 2023 05:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680785467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a8vJf32VjBTqhSXC4UaNWwEC2++PydY9gb3nY7Y6vs4=;
 b=gfvwhXqxN+kmnDxdgTBH/oo1QvEgKHP/2bOd2M2E66DOcXRT7GhcBRtgZ7aPx7aoFc
 J9UbaFPDnMM7jBFUuusbaXc+FLDR1GIBiJXxbRNf8IFiyDMvVDtmmnLBP4mGOS7LnBh4
 96XyRDX3HzD8eSc9U/I0KasUZY7j5v0h4jZ8cgy+SCh0k1pVgWNJFwh8mWdAgDltt4AD
 O+LJNnuumS0jBqlsxpZAGqbMAr1K6EOp+4culYgtVw7WhsjqxUkEW2m0E0j0QGK8b2XL
 sajMpsuaclcGDg8QPa/DOcWB5H3srQ5a+m0Ms4rehFrr7eewm9H5cr3U2zpfWQLD5VSW
 T3qA==
X-Gm-Message-State: AAQBX9eKhn9Z2j/31RAgwk5dV4XvZ4WCIEdFKM2ldzlEqCvmvP0geiUM
 809sbFqMjRdBoIUeka3z/Ki7ImHTcQsWFn+J81f7gBjbz21yyROnAt3zLQtzdoH6Oc1c3ckDWs2
 0WOlPgmkhR9zlQTmaQGuTGeTTEg==
X-Received: by 2002:ad4:5ca6:0:b0:5df:450b:8002 with SMTP id
 q6-20020ad45ca6000000b005df450b8002mr4830659qvh.31.1680785467004; 
 Thu, 06 Apr 2023 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSPMv3nhVaAKMIwGcpzI1WXbVj1KNben3bHvDLvNgWUG5IbK0u6ODiRzBeHNfaFX4xk75FiA==
X-Received: by 2002:ad4:5ca6:0:b0:5df:450b:8002 with SMTP id
 q6-20020ad45ca6000000b005df450b8002mr4830628qvh.31.1680785466773; 
 Thu, 06 Apr 2023 05:51:06 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 de11-20020ad4584b000000b005dd8b93457csm489252qvb.20.2023.04.06.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 05:51:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Date: Thu,  6 Apr 2023 08:51:02 -0400
Message-Id: <20230406125102.1952202-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/gr/tu102: remove unused tu102_gr_load
 function
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
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: symbol
  'tu102_gr_load' was not declared. Should it be static?

This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a242..a7775aa18541 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
-tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
-{
-	int ret;
-
-	ret = gm200_gr_load(gr, ver, fwif);
-	if (ret)
-		return ret;
-
-	return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102_gr_av_to_init_veid,
-				 &gr->bundle_veid);
-}
-
 static const struct gf100_gr_fwif
 tu102_gr_fwif[] = {
 	{  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpccs_acr },
-- 
2.27.0

