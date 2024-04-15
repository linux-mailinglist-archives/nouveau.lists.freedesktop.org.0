Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C848A4C00
	for <lists+nouveau@lfdr.de>; Mon, 15 Apr 2024 11:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A8110EC39;
	Mon, 15 Apr 2024 09:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CMuWnzLQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C91112415
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713174837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MTLrUg07ow5Ck/K3yim82eoap2P3OjY+HLnepVqu0oc=;
 b=CMuWnzLQLSFl/Q4vaSAxWE5Duqp4AbC8QyBP8uPue3plP79pIH+Zx0Hp2zC5slpeZhB+kY
 r+udWCabAYHajRByMG0bBPU3oeYbxdKP7XdefL8rzws/Qpk7GrZRLpQax908LklPX27MyT
 IRO5d+5ohOrcum38VX0vj5sTFU56aDc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-7KJwaYGUPM-bBZjQX6p0dQ-1; Mon, 15 Apr 2024 05:53:56 -0400
X-MC-Unique: 7KJwaYGUPM-bBZjQX6p0dQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d84af71cddso21873981fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 02:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713174834; x=1713779634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTLrUg07ow5Ck/K3yim82eoap2P3OjY+HLnepVqu0oc=;
 b=DZc5X38US8r7qjiIJV1Fyi7nDYDz9rer+K9Jk9sdScUIJe7bbSwAO9XzbgSqCo2FSe
 zvY0mGZOyKqPEcottUTrkubN2c7aDjcogcFN9JObAqsXd26dPEIleu/XERCplWr86W/K
 1jANrQTcj5SDDUYJVsupsTeujW2wG/6gQQSHzGsKt69XVzdYcAsqpGJP91K7/22QhQbQ
 3F6g2vHEHz+7XFpKdZBwULwlBiPYfzuy+TmhLm8NQX2Udau10MRIBpcwblU/GB9vs74P
 YOIVs3iCjmFwPziNqvio4/FI+OpW2jANAGtjG0o22CZGfP/F3MgK11IEOry5AVxFUx6A
 lkUw==
X-Gm-Message-State: AOJu0YxMJnxrgnqIo0r4HBrKK/Tojunk5nJ/SwqnMJ5q3t2AYAuz2zsp
 kukxiKOVkAt/KsT8Dvvs1Eyq8+Ujn0Tnw/RQf8O526F6eP7yWJ5F9v+d8Ssyw7d+LnwXhg06EUg
 9dshMZ46a7TpO4MD1GQfsh/EiGaUpDS6rDSJj/SJuK870AV6o4u2c7zjAm/Kh+wbi5RbyX4JIcS
 rYBm1NEdDlqJBdfoHsFKcV24nUw0vJ9S1aBj7WEm0QGg==
X-Received: by 2002:a05:651c:208:b0:2da:8f63:edff with SMTP id
 y8-20020a05651c020800b002da8f63edffmr674077ljn.24.1713174834547; 
 Mon, 15 Apr 2024 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeAsDSgFIN3nIWyP9pX2W4sJPAAR18UI4c/eRiW8zjEwkep/MwHMMCNd3bEgrNSW5QQ3YVsg==
X-Received: by 2002:a05:651c:208:b0:2da:8f63:edff with SMTP id
 y8-20020a05651c020800b002da8f63edffmr674061ljn.24.1713174834091; 
 Mon, 15 Apr 2024 02:53:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b00416e2c8b290sm18632522wmo.1.2024.04.15.02.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 02:53:53 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/nouveau: fix duplicate pointer to struct drm_device
Date: Mon, 15 Apr 2024 11:53:49 +0200
Message-ID: <20240415095351.119072-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_uvmm_ioctl_vm_init() already has a pointer to struct drm_device,
no need to derive another one from struct drm_file.

Fixes: 266f7618e761 ("drm/nouveau: separately allocate struct nouveau_uvmm")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 0a0a11dc9ec0..929afd5bc773 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1812,13 +1812,12 @@ static const struct drm_gpuvm_ops gpuvm_ops = {
 };
 
 int
-nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+nouveau_uvmm_ioctl_vm_init(struct drm_device *drm,
 			   void *data,
 			   struct drm_file *file_priv)
 {
 	struct nouveau_uvmm *uvmm;
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
-	struct drm_device *drm = cli->drm->dev;
 	struct drm_gem_object *r_obj;
 	struct drm_nouveau_vm_init *init = data;
 	u64 kernel_managed_end;

base-commit: a57e191ebbaa0363dbf352cc37447c2230573e29
prerequisite-patch-id: 2d453c82161ab6a188caae12e558e8c8d6c1a450
-- 
2.44.0

