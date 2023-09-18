Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C507A53E4
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE110E30C;
	Mon, 18 Sep 2023 20:22:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E410E313
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:20 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5789ffc8ae0so557520a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068539; x=1695673339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3kRGfmoumVW0sympVPKMiePrfDvSsV2+EPv31Q3g3s=;
 b=YGpELbKXgK+BpNZXoEQlQKMdle1PlxAOmrONEmdaKfy86S7vltSGzeQ7kD38N7wYC7
 9Gq1KMgFt3QUQ7pkjs3wfvtcQcV9+RdmfL9HiQWMP/LkUpIhLyXm/kwMNcW8wEtvATpL
 jvlGAn5Qy+091M8YbSP3aRr92FspM5/3BvGDWAzwii8lX7LY+6b2lYTX+Cvc3R/Flr33
 jiO/gtqmfN4xiEl2iDCS1qO7Y5FJoGcvgSWbDl6ITmzxlRBHRXiz0ryMg3q6NTrKcNbO
 iS8ErDlXRuuw8Zib+Qx2WEtFuSn6ki26exYtZe59bxMndlmAKuW4rHH9y2TbLORyGhjw
 6npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068539; x=1695673339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3kRGfmoumVW0sympVPKMiePrfDvSsV2+EPv31Q3g3s=;
 b=o2OVWZUz/l7uzCkp9FngIUg1MyQvtG2pEcmZ9bG7oUqBnJtBkBCSYx6aexNwrwONdT
 0VOKSvOJyzjiVjRvSkqOTW6G4W27S848L+KSypDNMW+EUEy7ykQoFv3wD4s4WZ4q1+4F
 7PRRc21NBABcQjPRHIXS80TeO1mC7U2Wf1DtSXdWvawMRgeYeoMoNERhzaxE+Wm1zfKy
 7Qn0u+k23aYnwWLlCQ83MEmbBgi71ZuYAWnkOM0/TYdWwdhKEZxpQkuOEKIxsZ1Tt/Qq
 PofmhKKIFKlT/VQXZa3WZiU7gRJOhhaoWkkoDaZx2AEa1Q8MtXmGmu68vas6uJOaFvQu
 uUhA==
X-Gm-Message-State: AOJu0YwosfpQErfXOOve8dFRtgVRvm9KWRMYVneb4qWJuqZ/3+nSn/E6
 74pzrSwnOspC/g5huDRdK7akUbOROLI=
X-Google-Smtp-Source: AGHT+IHoOiDcYcAAJExEyzr3DuEubZoh0NYSoRplr8FftHBxbYlBfN+SU0l1X4nOsgvh3+7zgv6kbg==
X-Received: by 2002:a05:6a20:4289:b0:13f:c40c:379 with SMTP id
 o9-20020a056a20428900b0013fc40c0379mr10582550pzj.13.1695068539289; 
 Mon, 18 Sep 2023 13:22:19 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:18 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:12 +1000
Message-ID: <20230918202149.4343-8-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 07/44] drm/nouveau/bus/tu102-: prepare for GSP-RM
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

- disable BUS completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
index 80b5aaceeaad..8e1e0b057a0b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
@@ -24,6 +24,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static void
 gf100_bus_intr(struct nvkm_bus *bus)
 {
@@ -72,5 +74,8 @@ int
 gf100_bus_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_bus **pbus)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_bus_new_(&gf100_bus, device, type, inst, pbus);
 }
-- 
2.41.0

