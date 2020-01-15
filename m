Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D732140558
	for <lists+nouveau@lfdr.de>; Fri, 17 Jan 2020 09:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07F6F46F;
	Fri, 17 Jan 2020 08:21:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542166E93B;
 Wed, 15 Jan 2020 12:17:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABBD7AFC4;
 Wed, 15 Jan 2020 12:17:01 +0000 (UTC)
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
Date: Wed, 15 Jan 2020 13:16:35 +0100
Message-Id: <20200115121652.7050-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:21:04 +0000
Subject: [Nouveau] [PATCH v2 04/21] drm/amdgpu: Convert to struct
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
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
amdgpu over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 -----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  5 +++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c          |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
 9 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 4e699071d144..a1e769d4417d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -914,3 +914,15 @@ int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc)
 		return AMDGPU_CRTC_IRQ_NONE;
 	}
 }
+
+bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+			bool in_vblank_irq, int *vpos,
+			int *hpos, ktime_t *stime, ktime_t *etime,
+			const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
+						  stime, etime, mode);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 26f318a867fe..18c0aa4779e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1367,16 +1367,6 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	return 0;
 }
 
-static bool
-amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
-				 bool in_vblank_irq, int *vpos, int *hpos,
-				 ktime_t *stime, ktime_t *etime,
-				 const struct drm_display_mode *mode)
-{
-	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
-						  stime, etime, mode);
-}
-
 static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_ATOMIC |
@@ -1392,7 +1382,6 @@ static struct drm_driver kms_driver = {
 	.enable_vblank = amdgpu_enable_vblank_kms,
 	.disable_vblank = amdgpu_disable_vblank_kms,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-	.get_scanout_position = amdgpu_get_crtc_scanout_position,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
 	.gem_free_object_unlocked = amdgpu_gem_object_free,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index eb9975f4decb..37ba07e2feb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -612,6 +612,11 @@ void amdgpu_panel_mode_fixup(struct drm_encoder *encoder,
 			     struct drm_display_mode *adjusted_mode);
 int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, int crtc);
 
+bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+			bool in_vblank_irq, int *vpos,
+			int *hpos, ktime_t *stime, ktime_t *etime,
+			const struct drm_display_mode *mode);
+
 /* fbdev layer */
 int amdgpu_fbdev_init(struct amdgpu_device *adev);
 void amdgpu_fbdev_fini(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 40d2ac723dd6..bdc1e0f036d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2685,6 +2685,7 @@ static const struct drm_crtc_helper_funcs dce_v10_0_crtc_helper_funcs = {
 	.prepare = dce_v10_0_crtc_prepare,
 	.commit = dce_v10_0_crtc_commit,
 	.disable = dce_v10_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 898ef72d423c..0319da5f7bf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2793,6 +2793,7 @@ static const struct drm_crtc_helper_funcs dce_v11_0_crtc_helper_funcs = {
 	.prepare = dce_v11_0_crtc_prepare,
 	.commit = dce_v11_0_crtc_commit,
 	.disable = dce_v11_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index db15a112becc..78642c3b14fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2575,6 +2575,7 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
 	.prepare = dce_v6_0_crtc_prepare,
 	.commit = dce_v6_0_crtc_commit,
 	.disable = dce_v6_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index f06c9022c1fd..1e8d4975435a 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2593,6 +2593,7 @@ static const struct drm_crtc_helper_funcs dce_v8_0_crtc_helper_funcs = {
 	.prepare = dce_v8_0_crtc_prepare,
 	.commit = dce_v8_0_crtc_commit,
 	.disable = dce_v8_0_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index e4f94863332c..4b2f915aba47 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -218,6 +218,7 @@ static const struct drm_crtc_helper_funcs dce_virtual_crtc_helper_funcs = {
 	.prepare = dce_virtual_crtc_prepare,
 	.commit = dce_virtual_crtc_commit,
 	.disable = dce_virtual_crtc_disable,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static int dce_virtual_crtc_init(struct amdgpu_device *adev, int index)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d6543ef68210..3d52c933a519 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4822,7 +4822,8 @@ static bool dm_crtc_helper_mode_fixup(struct drm_crtc *crtc,
 static const struct drm_crtc_helper_funcs amdgpu_dm_crtc_helper_funcs = {
 	.disable = dm_crtc_helper_disable,
 	.atomic_check = dm_crtc_helper_atomic_check,
-	.mode_fixup = dm_crtc_helper_mode_fixup
+	.mode_fixup = dm_crtc_helper_mode_fixup,
+	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
 static void dm_encoder_helper_disable(struct drm_encoder *encoder)
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
