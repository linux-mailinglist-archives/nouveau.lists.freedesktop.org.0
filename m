Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69114053F
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2020 09:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A996F44A;
	Fri, 17 Jan 2020 08:21:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FA96E979;
 Wed, 15 Jan 2020 12:17:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B97EFAFC2;
 Wed, 15 Jan 2020 12:17:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Date: Wed, 15 Jan 2020 13:16:48 +0100
Message-Id: <20200115121652.7050-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:21:04 +0000
Subject: [Nouveau] [PATCH v2 17/21] drm/vc4: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert vc4
over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 +++++++-----
 drivers/gpu/drm/vc4/vc4_drv.c  |  1 -
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 ----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b00e20f5ce05..f1e7597ea17e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -84,13 +84,14 @@ static const struct debugfs_reg32 crtc_regs[] = {
 	VC4_REG32(PV_HACT_ACT),
 };
 
-bool vc4_crtc_get_scanoutpos(struct drm_device *dev, unsigned int crtc_id,
-			     bool in_vblank_irq, int *vpos, int *hpos,
-			     ktime_t *stime, ktime_t *etime,
-			     const struct drm_display_mode *mode)
+static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
+					  bool in_vblank_irq,
+					  int *vpos, int *hpos,
+					  ktime_t *stime, ktime_t *etime,
+					  const struct drm_display_mode *mode)
 {
+	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, crtc_id);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	u32 val;
 	int fifo_lines;
@@ -1039,6 +1040,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.atomic_flush = vc4_crtc_atomic_flush,
 	.atomic_enable = vc4_crtc_atomic_enable,
 	.atomic_disable = vc4_crtc_atomic_disable,
+	.get_scanout_position = vc4_crtc_get_scanout_position,
 };
 
 static const struct vc4_crtc_data pv0_data = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 5e6fb6c2307f..e6982a7b0c5e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -190,7 +190,6 @@ static struct drm_driver vc4_drm_driver = {
 	.irq_postinstall = vc4_irq_postinstall,
 	.irq_uninstall = vc4_irq_uninstall,
 
-	.get_scanout_position = vc4_crtc_get_scanoutpos,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6627b20c99e9..f90c0d08e740 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -743,10 +743,6 @@ void vc4_bo_remove_from_purgeable_pool(struct vc4_bo *bo);
 
 /* vc4_crtc.c */
 extern struct platform_driver vc4_crtc_driver;
-bool vc4_crtc_get_scanoutpos(struct drm_device *dev, unsigned int crtc_id,
-			     bool in_vblank_irq, int *vpos, int *hpos,
-			     ktime_t *stime, ktime_t *etime,
-			     const struct drm_display_mode *mode);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
 void vc4_crtc_txp_armed(struct drm_crtc_state *state);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
