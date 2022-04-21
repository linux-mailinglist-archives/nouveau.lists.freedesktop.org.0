Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC650C6D9
	for <lists+nouveau@lfdr.de>; Sat, 23 Apr 2022 05:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6CB10ECBD;
	Sat, 23 Apr 2022 03:18:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C252710E3FA
 for <nouveau@lists.freedesktop.org>; Thu, 21 Apr 2022 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650547835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kiIHIoB66u3RP+01+bNiod8V2ewZbyshShw0I7c9tlo=;
 b=DZVHUEXQnfTmQ/6SChZG7SagJ+q2IyxBTkah8l6COhOYjwinSt2hp+PDA4YQ/xbqgy0q8P
 L3vtksTRh8amuIgKPksj/+eDV01VWtHpva8QkborOO/6negFJkth/1Ibcwu/zcZnK1Ve2j
 p20ONMJ2xaX+Bd1nUQh6RhB3yVoHRIc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-tgn3Fhl1MbGsbQP7MDR_Yw-1; Thu, 21 Apr 2022 09:30:34 -0400
X-MC-Unique: tgn3Fhl1MbGsbQP7MDR_Yw-1
Received: by mail-qv1-f70.google.com with SMTP id
 z12-20020a0ce60c000000b0044632eb79b3so3906518qvm.7
 for <nouveau@lists.freedesktop.org>; Thu, 21 Apr 2022 06:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kiIHIoB66u3RP+01+bNiod8V2ewZbyshShw0I7c9tlo=;
 b=DZQD/o2aojSB5135Oh8pGWlALNn79vb1SpEHvhdF+5RTHRGGWTcyLqP24iF+mpQUc+
 QHxhv1HUISVEf6zdoBNU5MiSpyYLl/nD8q0qtHTBmEdwgbGOuKTNldDCrzSbRQB8Cv4u
 v1yu0CVRBjPX+CoN+MeU6f161E+MOqLWAfxx94GxL3+nrL2+Hv/Vs/uhyucXy4b5M6y4
 5J5zlIeh3Idg2yEeWRNNz+xzWUoz5lDwJW28Ax533mkNb25TDtxN11u6rhYgwk5F2g3K
 cx3BYnANKIab5FmXysYPiypMLvNwYbXywOV4HLBCbn287Y+DejbijpMXySkAWvbeAXdo
 OGRg==
X-Gm-Message-State: AOAM532unYh5yPtu1b0UXVp6Gd7FoyYd0zhVK4ejJtwAE9Y+81euwG82
 27b2GCZ9pyVIR+I7DqKPcUabCyrTZqSYUhT3RFAQcdLiiyQfzpiKDvvcAN403PaLKvgdFADu2t/
 gRx3gu2ED4bko2qgYRI7qAJOZkg==
X-Received: by 2002:ac8:58ce:0:b0:2f3:5057:569 with SMTP id
 u14-20020ac858ce000000b002f350570569mr1048211qta.367.1650547834134; 
 Thu, 21 Apr 2022 06:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpPugCA4lCUt4oXKL9cMiCNteKlh+teO35BdZL1at8SyJW/uWnkJiuXZUWX83fHO6di9S8CA==
X-Received: by 2002:ac8:58ce:0:b0:2f3:5057:569 with SMTP id
 u14-20020ac858ce000000b002f350570569mr1048197qta.367.1650547833945; 
 Thu, 21 Apr 2022 06:30:33 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a0e8400b0067b1bcd081csm2706827qkm.66.2022.04.21.06.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:30:33 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Thu, 21 Apr 2022 09:30:28 -0400
Message-Id: <20220421133028.724954-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sat, 23 Apr 2022 03:18:46 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/gsp: change gv100_gsp from global to
 static
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

Smatch reports this issue
gv100.c:46:1: warning: symbol 'gv100_gsp' was not declared. Should it be static?

gv100_gsp is only used in gv100.c so change its
storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
index 2ac7fc934c09..6c4ef62a746a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
@@ -42,7 +42,7 @@ gv100_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 	return 0;
 }
 
-struct nvkm_gsp_fwif
+static struct nvkm_gsp_fwif
 gv100_gsp[] = {
 	{ -1, gv100_gsp_nofw, &gv100_gsp_flcn },
 	{}
-- 
2.27.0

