Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE05382080
	for <lists+nouveau@lfdr.de>; Sun, 16 May 2021 20:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0C6E84B;
	Sun, 16 May 2021 18:59:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B7D6E20E;
 Sun, 16 May 2021 18:59:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 368EFB176;
 Sun, 16 May 2021 18:59:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, bskeggs@redhat.com
Date: Sun, 16 May 2021 20:59:34 +0200
Message-Id: <20210516185937.5644-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/3] drm: Remove some includes of drm_legacy.h
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove include statements for DRM legacy headers. None of these
dependencies is required. Built-tested w/o CONFIG_DRM_LEGACY set.

These patches should probably go through drm-misc, like the rest
of the legacy cleanups.

Thomas Zimmermann (3):
  drm/i915: Don't include drm_legacy.h
  drm/nouveau: Don't include drm_legacy.h
  drm: Don't include drm_legacy.h in drm_lease.c

 drivers/gpu/drm/drm_lease.c              | 1 -
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 1 -
 drivers/gpu/drm/i915/i915_drv.h          | 1 -
 drivers/gpu/drm/nouveau/nouveau_ttm.c    | 2 --
 4 files changed, 5 deletions(-)


base-commit: 77fc6f68ed347b0a4c6969f6adac70026d5b1449
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: c59ca2ddb182af06006fa360ad3e90fe16b93d3a
prerequisite-patch-id: 8c45deec68d6ab65d66f551b51b12acf2e9ae0b4
prerequisite-patch-id: 742f08083f0d5776068a761b1e2432e8edc2bdf8
prerequisite-patch-id: 39cfaf5f337ec53d3237bf2a700e77c84f789039
--
2.31.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
