Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8C6A8294
	for <lists+nouveau@lfdr.de>; Thu,  2 Mar 2023 13:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19E610E4DE;
	Thu,  2 Mar 2023 12:48:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ABB10E168
 for <nouveau@lists.freedesktop.org>; Thu,  2 Mar 2023 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677761313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qWubdolcTPcYZMWRbItbBs4vyBxRKmavcU+qlGC7gI4=;
 b=eUvQLSgB4lvqePnLEFQZ2ozTi8sM5Y2G5USsHBAQ7dfRi+atOurZ6D6G7OIkfTTDqMzWul
 benvq65FrMeJwjFAu+2QCxN0SEBU5r5OJMCrjl9IlF8Tsg0TQHmd0G+ittgq7xudrx2RHj
 ZS0lQmo69ccVfdWUIyVyTS/4KhIXVNY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-tmjmsmWMMOOx0tJvrcSIZw-1; Thu, 02 Mar 2023 07:48:31 -0500
X-MC-Unique: tmjmsmWMMOOx0tJvrcSIZw-1
Received: by mail-qv1-f71.google.com with SMTP id
 m1-20020a05621402a100b004bb706b3a27so8770315qvv.20
 for <nouveau@lists.freedesktop.org>; Thu, 02 Mar 2023 04:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677761311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWubdolcTPcYZMWRbItbBs4vyBxRKmavcU+qlGC7gI4=;
 b=fNtAL397pk8EgStv4pbEVk8yqcE1ollVe/+jM1Fwi+1awNn6gF6+kPOeHd/XxRQOWa
 Ks3IiwvlMBgnvWCEVkfWyBn1AZ/E/XpseIV1VBxETSjcRfmJs4+joGfwf224TTB5NGR/
 NRLu3y9VoAl8UGbOQYC5oJ+r3JGgYkFPepg9G95xpsN2SeoPztXCYyV3gwo8wlkKURF+
 G5lAMCrsXppnI64b+wzNs5yU+DV1wyCM7u69OD6KpWrLcGTe6RTgmCCtP8uK1fBwGQgp
 UKNqw3rwcFo+WzxL4QNUCIrQ+691xt64oxMQNv8l1orgImh+1kg5NhDrhdVJOuyA0zzj
 j8LQ==
X-Gm-Message-State: AO0yUKVVysUu3f0HdOYShc7mV/1vK457C5sx97/aJeMCFpsxi+vhq+3i
 Z3+g2AZEhuA5voRtS6NTxrmkv6Y4x7mSgwdf0pVMpPeMAGGASSDU41qz2bWJL+6DhdQJhKoEjy5
 kgL5Mh4hJ+6+8Xi9V4mldvjVWnA==
X-Received: by 2002:a05:622a:5cf:b0:3bf:db54:b622 with SMTP id
 d15-20020a05622a05cf00b003bfdb54b622mr17085762qtb.30.1677761311192; 
 Thu, 02 Mar 2023 04:48:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9I+TSl84uLi9L/hA047N42TNQ2RbkOPTsi+FcB8UwVS5/djJiPNP8Zc/AXLoClAtyGqLq6XA==
X-Received: by 2002:a05:622a:5cf:b0:3bf:db54:b622 with SMTP id
 d15-20020a05622a05cf00b003bfdb54b622mr17085737qtb.30.1677761310938; 
 Thu, 02 Mar 2023 04:48:30 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac801c9000000b003bfd8e2ab40sm7585267qtg.16.2023.03.02.04.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:48:30 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Date: Thu,  2 Mar 2023 07:48:19 -0500
Message-Id: <20230302124819.686469-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] drm/nouveau/nvfw/acr: set wpr_generic_header_dump
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

gcc with W=1 reports
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: error: no previous
  prototype for ‘wpr_generic_header_dump’ [-Werror=missing-prototypes]
   49 | wpr_generic_header_dump(struct nvkm_subdev *subdev,
      | ^~~~~~~~~~~~~~~~~~~~~~~

wpr_generic_header_dump is only used in acr.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
index 83a9c48bc58c..7ac90c495737 100644
--- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
@@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
 	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
 }
 
-void
+static void
 wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
 {
 	nvkm_debug(subdev, "wprGenericHeader\n");
-- 
2.27.0

