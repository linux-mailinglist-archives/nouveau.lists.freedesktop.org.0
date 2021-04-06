Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4A354E9F
	for <lists+nouveau@lfdr.de>; Tue,  6 Apr 2021 10:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733A6E0A0;
	Tue,  6 Apr 2021 08:29:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2A889F2D;
 Tue,  6 Apr 2021 08:29:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6199FB089;
 Tue,  6 Apr 2021 08:29:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Date: Tue,  6 Apr 2021 10:29:38 +0200
Message-Id: <20210406082942.24049-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/4] drm: Generic dumb_map_offset for TTM-based
 drivers
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
Cc: nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The implementation of drm_driver.dumb_map_offset is the same for several
TTM-based drivers. Provide a common function in GEM-TTM helpers.

Thomas Zimmermann (4):
  drm/gem-ttm-helper: Provide helper for struct
    drm_driver.dumb_map_offset
  drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
  drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
  drm/qxl: Use drm_gem_ttm_dumb_map_offset()

 drivers/gpu/drm/drm_gem_ttm_helper.c      | 33 ++++++++++++++++
 drivers/gpu/drm/drm_gem_vram_helper.c     | 48 -----------------------
 drivers/gpu/drm/nouveau/nouveau_display.c | 18 ---------
 drivers/gpu/drm/nouveau/nouveau_display.h |  2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.c             |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.h             |  3 --
 drivers/gpu/drm/qxl/qxl_dumb.c            | 17 --------
 drivers/gpu/drm/qxl/qxl_ioctl.c           |  4 +-
 drivers/gpu/drm/qxl/qxl_object.h          |  5 ---
 include/drm/drm_gem_ttm_helper.h          |  5 ++-
 include/drm/drm_gem_vram_helper.h         |  7 +---
 12 files changed, 45 insertions(+), 103 deletions(-)

--
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
