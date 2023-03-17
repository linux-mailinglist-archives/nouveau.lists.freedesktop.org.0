Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740966F6B33
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BB210E390;
	Thu,  4 May 2023 12:31:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8810EE7C;
 Fri, 17 Mar 2023 08:23:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D6E8B824FF;
 Fri, 17 Mar 2023 08:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3EEC433A0;
 Fri, 17 Mar 2023 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041397;
 bh=fLtbhWgCsGsjs2LsMlU/YO3L1k01VNDjn64lqWtvZXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UGVuQp1GOkBI9jvFetIsa9u3o1htjU2WAgXauzbmjb6UD4o4gDEi8FHkf/0SKUMJs
 oPik83Qk3lI6Hbrh8Z4oXmG33xJyLeCF5JYhuxrqE9NS8vAzntafM65E/Cs2iCce5L
 d/bC0nXKuqPcFFXhAkVt6SfjB2Gz+Q0v34UkqLiejTTqQMmsx6slTcoSc5Mb39zpkb
 J/YXKultGej0ddqO40xSNH5QBxLfKCetHnn3pfgnrt+NM+4lFcb3HnOkBZ6MZmy86/
 luRWVJLCal1S9CqH1MqwprMDyv3Rpa7jHpIriBcA0nfB3gcLAv9ns7TsxNG0rAPw+X
 y2nyphzHbUpDw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 17 Mar 2023 08:17:05 +0000
Message-Id: <20230317081718.2650744-25-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:31 +0000
Subject: [Nouveau] [PATCH 24/37] drm/nouveau/nvkm/engine/gr/gf100: Demote
 kerneldoc abuse
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
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1044: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660f..7d4c2264d3c05 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -1040,7 +1040,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
 	}
 }
 
-/**
+/*
  * Wait until GR goes idle. GR is considered idle if it is disabled by the
  * MC (0x200) register, or GR is not busy and a context switch is not in
  * progress.
-- 
2.40.0.rc1.284.g88254d51c5-goog

