Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C66AE554A
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 00:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD82E10E46C;
	Mon, 23 Jun 2025 22:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="MWEpLuoX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA9710E46C
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:46 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7d3e7503333so697777985a.3
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716585;
 x=1751321385; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6Itdrajtub6A7UvqXvcGrPAJtKcMtzT+DoBQUAOCEc=;
 b=MWEpLuoXSgHS3gdxacPjKkLqdk3TwnTfdrqGXAS5tr8kQgtvwijjK1xY52FBPEoCPU
 le+2FMWa8MrkNZxI0yJjauOkNF2d3s5QibJiHCIvRhc7FiwCZIENGYDCy2XZPKmWI0S6
 DfoEYj1tswZFqcjoTsb5Y1hjDNVYuzMl+cY3d651jkFYGAEUb0SGY0ntNN+UPym7+EJ1
 aoL9+JTF1B5N/KbH9aj4dmnyqWLvjX+IFeiFYj5WtPnw4gD2jCQSppVa0HENfqBXGMJA
 a8WeD0rzXr2ORvuluUGXd+6viKEm+rm42gZfq60BF184I6GE75wUXf3nqUh1g3ApTaas
 usUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716585; x=1751321385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6Itdrajtub6A7UvqXvcGrPAJtKcMtzT+DoBQUAOCEc=;
 b=ihgWYo2dQEi2QWbVzFU5Eal3L0xiXHQbuLqHyrVrYtXa3ouLPe3pqon9Z14xL9FcIr
 Sy7CJd+Eht61QxsNLFqVvyGk6FRK/tej4gWCzyaevYHIIQHIyzgogqw+YIlTVEp1vzfC
 7176eNwVtAEMGCfftklotlAaUBXpAtK/GQxyNAu7xoLUGkyK4m0BTv7NTgGCGgxuMiCY
 6wxir0tC1rA0nGeYiFRyCOQABlkcP7vnn+hpSITZxA0olXcpwO/IGxClPbLXlxfjqZVw
 Wa5GIMIsJ67m+A2kLQuavVfQPQ8nKVB1TwmcWft68ULac/vwjWymF2GEzPh4Oqjc2Zxu
 OLWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvb4KN0LuU1TTIi+l1s6Kb4g5ox45Odj/tn5RLJ/EZ0zLaeC28b2ob0dIvxq0me8Ei54dqPpoE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGfFgQR7+fkkixO2/7zMuwhuJrugxfiFT5KnAO7ajaQPnGdix2
 hqmqO6p5WVy9x0vy7t6N7+eJIAy1g4frUIXst8lbrbum18Tx9Vp1ciBpuN7rj8ntyv0=
X-Gm-Gg: ASbGnctFKOTmFoVxGnoIXtmrvV/2tzMpOktl5yTdEmjaGrXo9s01habMVTjpKOohGie
 8eRLuy0lfeTEJam61vGFGyoWpllHOPHyvR1Re/wf2m5UAMbPZbAgJs5tyVXTCXO3p26SKTvu/m+
 2rFMvVvc4VNA9BO1hHsgJlX0P1EbEKE+Gm2rhXqh6jBrMW4fM7j1ydz308PUm25VN1fTyNNYPui
 DuKxJhqoQq/YN8LdiGJwryN1p9VYZw0rboqGFt7kbygnEz+CAJMunN0p86u+nlmBWZYrA/BjBvh
 IhGgZJUt8krWmI5iCzu6in03iNwnte3lj0fsdwGOzt+9YgWbVKyO3krgq0eeHnkPHa2FaWzkRLe
 dMEcqS1KZ7zL2F9/otPzifH3204SlMN3JnTY+xIg+Z/RIn+3CE40=
X-Google-Smtp-Source: AGHT+IEDt6kybhGAY1jpZltfpu6uVp4P3y+iM+WcPgbCnfImQA0JN2So/u+8H6r/LrtI2lF8hDVc3g==
X-Received: by 2002:a05:620a:444a:b0:7d2:2780:c6e9 with SMTP id
 af79cd13be357-7d3f98c3b76mr1871441085a.2.1750716585138; 
 Mon, 23 Jun 2025 15:09:45 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:44 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 0/2] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 23 Jun 2025 18:04:00 -0400
Message-ID: <20250623220909.7591-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

Mel Henning (2):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 7 files changed, 6 insertions(+), 19 deletions(-)

-- 
2.50.0

