Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2427A55B3
	for <lists+nouveau@lfdr.de>; Tue, 19 Sep 2023 00:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7001610E0FB;
	Mon, 18 Sep 2023 22:22:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44A710E0FB
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 22:22:45 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-578af21ff50so272326a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695075765; x=1695680565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eHXzHVlPhPsqU4LGpmEYwiP2/oyieF/yUcwsVeTWH14=;
 b=NtiubCpEvtDeq1E6P5v0t/9gykLPCb3L07rdvA5wrx03r3kGt6dDb3t7PgA3Qz5U8u
 UAH9H4zeB8Qc5eSjdMxmarpjsFXFWO2Ff4vfTmaTASmFnxC8nu+seIQPw64sSXc9v9GH
 UKE4+nFkz246GdP2cPwp+twTRivE7B+zCdfgWbGB78kX9PKFLe2zVi2amISFGMPFlK0v
 o2SdvuJUvji9Kxc57N3E3SbJjwrmy/vKeNcjsgJ+foaM2yKO6tra3cZdWvtlw2fYfSA1
 eoJp8AeDigH759PoQDuW8swEX9eMo/YE/saHTe0Z9oJuz95LDlPVAA+fPSMYfh8RK3kT
 b9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695075765; x=1695680565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHXzHVlPhPsqU4LGpmEYwiP2/oyieF/yUcwsVeTWH14=;
 b=GNctuIuzSTBWsKdg/rgqswcDnkJWgFmrBLPf103fr28bgITRUEto+CDfQfBpCYObws
 FqNDPEvk/9XwiSN9k50yfLR2oBYXbqtsWdutzn+cvHunuGg2L1TB4zQZ0rWy3GuWKtc/
 Oad3Vj7B8Cd+vXVt0iAvaAFxv7mTUkkD6oaIwctqJzca0uyXXtKJg5vBPfh8GgqFLWS9
 GT1tU+0OFpTs7Or+xeSkBlbrmq0aDksmU6JmKDAH37sgw/pU6RxQo30yVUDmvQz00bRC
 124Hg3bcm1ir1ASDciJyibONtEzZZ5/AXnhVdyyVEuBN8IH6ajdJKHyscN6k4gfLuBOb
 W88w==
X-Gm-Message-State: AOJu0YzKttN1aPt6wDTmGIyK2SEJNlDoajmI74snGUumZbhGO+NHr2EB
 7QvXSu8QhmEiiUxzI2GUefZZU9Unx4o=
X-Google-Smtp-Source: AGHT+IGJhqrPygpKUNHQKyEbKZx90wbGtQ+liVxqubuzAASDb5WEcjt6ADBcDdwNz0SJ7V1itWhBzQ==
X-Received: by 2002:a17:90b:4a4a:b0:26d:287f:a545 with SMTP id
 lb10-20020a17090b4a4a00b0026d287fa545mr7135472pjb.29.1695075764683; 
 Mon, 18 Sep 2023 15:22:44 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b001bf095dfb79sm8686629plx.235.2023.09.18.15.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:22:44 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 08:22:25 +1000
Message-ID: <20230918222225.8629-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] MAINTAINERS: remove myself as nouveau maintainer
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

I have resigned, and will no longer be taking as active a role in
nouveau development.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..2494455c0801 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6646,7 +6646,6 @@ F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
-M:	Ben Skeggs <bskeggs@redhat.com>
 M:	Karol Herbst <kherbst@redhat.com>
 M:	Lyude Paul <lyude@redhat.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.41.0

