Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEA16EAA3
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2020 16:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CE06E8EF;
	Tue, 25 Feb 2020 15:59:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1826E210;
 Tue, 25 Feb 2020 15:59:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFEE8B12D;
 Tue, 25 Feb 2020 15:59:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, emil.velikov@collabora.com,
 alexander.deucher@amd.com, sam@ravnborg.org
Date: Tue, 25 Feb 2020 16:58:59 +0100
Message-Id: <20200225155902.9751-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/3] Add separate non-KMS state;
 constify struct drm_driver
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This patchset moves legacy, non-KMS driver state from struct drm_driver
into struct drm_legacy_state. Only non-KMS drivers provide an instance
of the latter structure. One special case is nouveau, which supports
legacy interfaces. It also provides an instance of the legacy state if
the legacy interfaces have been enabled (i.e., defines the config option
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)

I reviewed all call sites of legacy state and functions to verify that
DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or that
DRIVER_MODESET is not set.

With the mutable KMS state removed, instances of struct drm_driver can
be declared as constant. The patchset modifies the DRM core accordingly.
Individual drivers can follow later on.

Thomas Zimmermann (3):
  drm: Add separate state structure for legacy, non-KMS drivers
  drm: Move non-kms driver state into struct drm_legacy_state
  drm: Constify struct drm_driver in DRM core

 drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
 drivers/gpu/drm/drm_context.c         |  9 +++++----
 drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
 drivers/gpu/drm/drm_file.c            |  4 ++--
 drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
 drivers/gpu/drm/drm_lock.c            |  7 ++++---
 drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
 drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
 drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
 drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
 drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
 drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
 drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
 drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
 drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
 drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
 include/drm/drm_device.h              |  2 +-
 include/drm/drm_drv.h                 | 21 +++++----------------
 include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++----
 include/drm/drm_pci.h                 |  4 ++--
 20 files changed, 138 insertions(+), 83 deletions(-)

--
2.25.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
