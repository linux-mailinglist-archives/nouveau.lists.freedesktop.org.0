Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919526F6B41
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27DD10E3D0;
	Thu,  4 May 2023 12:31:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3633110EE69;
 Fri, 17 Mar 2023 08:23:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E14E5B824F5;
 Fri, 17 Mar 2023 08:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2C1C4339C;
 Fri, 17 Mar 2023 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041392;
 bh=db7R+qMmf7JQ1bscxQurohnbX82LESpL6MUvbSxqwsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A6G4VvXK53r2h5/CasP2WD7VPcKNHNImnMMs+vkMaZCYNpzsPBIib9pkv22Vw8a0j
 UWLh3BQDJi8bbKUtIdzENXEum5mIsdqNucPKDr0Ft5MVlLFihnY3psZt5ShTlIz6XO
 YwzHvigUDawhfZHpSaJomXaVwrAOemdogWLrJmKfQo0mX0QQri5XjJmbMkesxlyiw/
 VcLaopzRHmT6q4efR+0cauxNbC/RkbNTD5FbANe7eTjbMQp7dkffnuqPjNttv1UtEA
 +/mI8va2Vj6LuXZ3NZHQ2Ie6c+E2zg8JtlMrX/bTachQHjx2hkoW2DXwBRJ+pbFBP3
 as3GiHRa4jX7g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 17 Mar 2023 08:17:03 +0000
Message-Id: <20230317081718.2650744-23-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:31 +0000
Subject: [Nouveau] [PATCH 22/37] drm/nouveau/nvkm/engine/fifo/runl:
 Staticify local function nvkm_engn_cgrp_get()
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

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for ‘nvkm_engn_cgrp_get’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index b5836cbc29aa3..93d628d7d508b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -30,7 +30,7 @@
 #include <subdev/timer.h>
 #include <subdev/top.h>
 
-struct nvkm_cgrp *
+static struct nvkm_cgrp *
 nvkm_engn_cgrp_get(struct nvkm_engn *engn, unsigned long *pirqflags)
 {
 	struct nvkm_cgrp *cgrp = NULL;
-- 
2.40.0.rc1.284.g88254d51c5-goog

