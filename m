Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0F33FB53
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D486E057;
	Wed, 17 Mar 2021 22:38:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5F6E05C
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616020719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aUfr0Fbij+TMPvXhqxvDANI6muKqtMqtrTXDdYQAvOo=;
 b=i7lpHgZPY5h+5n0hF3SnwMOnX3tROVf8XV40/StBK+jQG2kTYl39iHW9Xt1oWk8QvAJLKE
 t0uDsEgqDzeU623/8wBaCc4w/iGpi+IJgkYrzBwKyt521mz+rcqQYXDfeLVF/4MfqDSXw4
 MhE6QuwBUOTj66hhEgaE7sVKUU5HU80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-BL8DT4-rMJO9d618TEW2xw-1; Wed, 17 Mar 2021 18:38:34 -0400
X-MC-Unique: BL8DT4-rMJO9d618TEW2xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9CD108BD0D;
 Wed, 17 Mar 2021 22:38:33 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2C5690F3;
 Wed, 17 Mar 2021 22:38:32 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:38:27 -0400
Message-Id: <20210317223827.446803-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t] lib: Introduce the igt_nouveau library
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

This introduces the igt_nouveau library, which enables support for tiling
formats on nouveau, along with accelerated clears for allocated bos in VRAM
using the dma-copy engine present on Nvidia hardware since Tesla. Typically
the latter would be handled by the kernel automatically, which is the
long-term plan for nouveau, but since the kernel doesn't yet support that
we implement this in igt in order to fulfill the expectation that most of
igt has in which newly allocated fbs are expected to be zero-filled by
default.

The dma-copy engine is capable of fast blitting, and is also able to
perform tiling/untiling at the same time. This is worth mentioning because
unlike many of the other drivers supported in igt, we go out of our way to
avoid using mmap() in order to perform CPU rendering wherever possible.
Instead of mmap()ing an fb that we want to draw to on the CPU (whether it
be for converting formats, or just normal rendering), we instead use
dma-copy to blit linear/tiled fbs over to linear system memory which we
mmap() instead. This is primarily because while mmap() is typically
painfully slow for vram, it's even slower on nouveau due to the current
lack of dynamic reclocking in our driver. Furthermore, using the dma-copy
engine for copying things over to system ram is also dramatically faster
than using igt's memcpy wc helpers even when no tiling is involved. Such
speed improvements are both quite nice, but also very necessary for certain
tests like kms_plane that are rather sensitive when it comes to slow
rendering with drivers.

This doesn't mean we won't want to provide a way of using mmap() for
rendering in the future however, as at least basic testing of mmap() is
certainly something we eventually want for nouveau. However, I think the
best way for us to do this in the future will be to adapt the igt_draw API
to work with nouveau so we can explicitly request using mmap() in tests
which need it.

Finally, this code also adds a hard dependency on libdrm support for
nouveau tests. The main reason for this is currently there are no real
applications that use nouveau's ioctls directly (mesa for instance, uses
libdrm as well) and also that nouveau's ioctls are currently a bit
complicated to use by hand. This will likely be temporary however, as Ben
Skeggs is planning on revamping a lot of nouveau's APIs to simplify them
and make libdrm support for nouveau obsolete in the future. Note that we
take care to make sure that users can still disable libdrm support for
nouveau if needed, with the only caveat being that any tests using
igt_nouveau will be disabled, along with any tiling support for
nvidia-specific tiling formats.

This should enable igt tests which test tiling formats to run on nouveau,
and fix some seemingly random test failures as a result of not having
zero-filled buffers in a few other tests like kms_cursor_crc.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 .gitlab-ci.yml                  |   7 +
 include/drm-uapi/drm_fourcc.h   |   2 +-
 lib/drmtest.c                   |   5 +
 lib/igt_fb.c                    |  98 +++++++--
 lib/igt_fb.h                    |   2 +
 lib/igt_nouveau.c               | 281 ++++++++++++++++++++++++++
 lib/igt_nouveau.h               |  65 ++++++
 lib/meson.build                 |   8 +
 lib/nouveau/cea0b5.c            | 252 +++++++++++++++++++++++
 lib/nouveau/nvhw/class/cl906f.h | 103 ++++++++++
 lib/nouveau/nvhw/class/cla0b5.h | 250 +++++++++++++++++++++++
 lib/nouveau/nvhw/drf.h          | 209 +++++++++++++++++++
 lib/nouveau/nvif/push.h         | 345 ++++++++++++++++++++++++++++++++
 lib/nouveau/nvif/push906f.h     |  70 +++++++
 lib/nouveau/priv.h              |  57 ++++++
 meson.build                     |   3 +
 tests/meson.build               |   2 +-
 17 files changed, 1745 insertions(+), 14 deletions(-)
 create mode 100644 lib/igt_nouveau.c
 create mode 100644 lib/igt_nouveau.h
 create mode 100644 lib/nouveau/cea0b5.c
 create mode 100644 lib/nouveau/nvhw/class/cl906f.h
 create mode 100644 lib/nouveau/nvhw/class/cla0b5.h
 create mode 100644 lib/nouveau/nvhw/drf.h
 create mode 100644 lib/nouveau/nvif/push.h
 create mode 100644 lib/nouveau/nvif/push906f.h
 create mode 100644 lib/nouveau/priv.h

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e226d9d7..8d275be7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,6 +89,13 @@ build:tests-fedora-oldest-meson:
     - ninja -C build || ninja -C build -j 1
     - ninja -C build igt-gpu-tools-doc
 
+# ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
+build:tests-fedora-no-libdrm-nouveau:
+  stage: build
+  script:
+    - meson -Dlibdrm_drivers= build
+    - ninja -C build || ninja -C build -j 1
+
 build:tests-fedora-clang:
   stage: build
   variables:
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index a7bc058c..87c87485 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -681,7 +681,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 }
 
 /*
- * 16Bx2 Block Linear layout, used by Tegra K1 and later
+ * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and later
  *
  * Pixels are arranged in 64x8 Groups Of Bytes (GOBs). GOBs are then stacked
  * vertically by a power of 2 (1 to 32 GOBs) to form a block.
diff --git a/lib/drmtest.c b/lib/drmtest.c
index 8527b56e..a8ba6e11 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -116,7 +116,12 @@ bool is_i915_device(int fd)
 
 bool is_nouveau_device(int fd)
 {
+	/* Currently all nouveau-specific codepaths require libdrm */
+#ifdef HAVE_LIBDRM_NOUVEAU
 	return __is_device(fd, "nouveau");
+#else
+	return false;
+#endif
 }
 
 bool is_vc4_device(int fd)
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f0fcd1a7..4ded7e78 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -44,6 +44,7 @@
 #include "igt_vc4.h"
 #include "igt_amd.h"
 #include "igt_x86.h"
+#include "igt_nouveau.h"
 #include "ioctl_wrappers.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
@@ -479,6 +480,48 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		*width_ret = 256;
 		*height_ret = vc4_modifier_param;
 		break;
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
+		modifier = drm_fourcc_canonicalize_nvidia_format_mod(modifier);
+		/* fallthrough */
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5):
+		igt_require_nouveau(fd);
+		*width_ret = 64;
+		*height_ret = igt_nouveau_get_block_height(modifier);
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -688,6 +731,16 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 	} else if (is_gen12_ccs_plane(fb, plane)) {
 		/* A main surface using a CCS AUX surface must be 4x4 tiles aligned. */
 		return ALIGN(min_stride, 64);
+	} else if (!fb->modifier && is_nouveau_device(fb->fd)) {
+		int align;
+
+		/* Volta supports 47-bit memory addresses, everything before only supports 40-bit */
+		if (igt_nouveau_get_chipset(fb->fd) >= IGT_NOUVEAU_CHIPSET_GV100)
+			align = 64;
+		else
+			align = 256;
+
+		return ALIGN(min_stride, align);
 	} else {
 		unsigned int tile_width, tile_height;
 
@@ -954,7 +1007,7 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 }
 
 /* helpers to create nice-looking framebuffers */
-static int create_bo_for_fb(struct igt_fb *fb)
+static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 {
 	const struct format_desc_struct *fmt = lookup_drm_format(fb->drm_format);
 	unsigned int bpp = 0;
@@ -972,7 +1025,8 @@ static int create_bo_for_fb(struct igt_fb *fb)
 	if (fb->modifier || fb->size || fb->strides[0] ||
 	    (is_i915_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
 	    (is_i915_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
-	    (is_amdgpu_device(fd) && igt_format_is_yuv(fb->drm_format)))
+	    (is_amdgpu_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
+	    is_nouveau_device(fd))
 		device_bo = true;
 
 	/* Sets offets and stride if necessary. */
@@ -1002,6 +1056,8 @@ static int create_bo_for_fb(struct igt_fb *fb)
 						   fb->modifier);
 		} else if (is_amdgpu_device(fd)) {
 			fb->gem_handle = igt_amd_create_bo(fd, fb->size);
+		} else if (is_nouveau_device(fd)) {
+			fb->gem_handle = igt_nouveau_create_bo(fd, prefer_sysmem, fb);
 		} else {
 			igt_assert(false);
 		}
@@ -1044,7 +1100,7 @@ void igt_create_bo_for_fb(int fd, int width, int height,
 {
 	igt_init_fb(fb, fd, width, height, format, modifier,
 		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
-	create_bo_for_fb(fb);
+	create_bo_for_fb(fb, false);
 }
 
 /**
@@ -1078,7 +1134,7 @@ int igt_create_bo_with_dimensions(int fd, int width, int height,
 	for (int i = 0; i < fb.num_planes; i++)
 		fb.strides[i] = stride;
 
-	create_bo_for_fb(&fb);
+	create_bo_for_fb(&fb, false);
 
 	if (size_ret)
 		*size_ret = fb.size;
@@ -1705,7 +1761,7 @@ igt_create_fb_with_bo_size(int fd, int width, int height,
 		  __func__, width, height, IGT_FORMAT_ARGS(format), modifier,
 		  bo_size);
 
-	create_bo_for_fb(fb);
+	create_bo_for_fb(fb, false);
 	igt_assert(fb->gem_handle > 0);
 
 	igt_debug("%s(handle=%d, pitch=%d)\n",
@@ -2382,6 +2438,9 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 		igt_amd_fb_convert_plane_to_tiled(fb, map, &linear->fb, linear->map);
 
 		munmap(map, fb->size);
+	} else if (is_nouveau_device(fd)) {
+		igt_nouveau_fb_blit(fb, &linear->fb);
+		igt_nouveau_delete_bo(&linear->fb);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
 		gem_set_domain(fd, linear->fb.gem_handle,
@@ -2434,7 +2493,7 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 		    fb->drm_format, LOCAL_DRM_FORMAT_MOD_NONE,
 		    fb->color_encoding, fb->color_range);
 
-	create_bo_for_fb(&linear->fb);
+	create_bo_for_fb(&linear->fb, true);
 
 	igt_assert(linear->fb.gem_handle > 0);
 
@@ -2452,6 +2511,13 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 		linear->map = igt_amd_mmap_bo(fd, linear->fb.gem_handle,
 					      linear->fb.size,
 					      PROT_READ | PROT_WRITE);
+	} else if (is_nouveau_device(fd)) {
+		/* Currently we also blit linear bos instead of mapping them as-is, as mmap() on
+		 * nouveau is quite slow right now
+		 */
+		igt_nouveau_fb_blit(&linear->fb, fb);
+
+		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
 	} else {
 		/* Copy fb content to linear BO */
 		gem_set_domain(fd, linear->fb.gem_handle,
@@ -2514,7 +2580,10 @@ int igt_dirty_fb(int fd, struct igt_fb *fb)
 
 static void unmap_bo(struct igt_fb *fb, void *ptr)
 {
-	gem_munmap(ptr, fb->size);
+	if (is_nouveau_device(fb->fd))
+		igt_nouveau_munmap_bo(fb);
+	else
+		gem_munmap(ptr, fb->size);
 
 	if (fb->is_dumb)
 		igt_dirty_fb(fb->fd, fb);
@@ -2553,6 +2622,8 @@ static void *map_bo(int fd, struct igt_fb *fb)
 	else if (is_amdgpu_device(fd))
 		ptr = igt_amd_mmap_bo(fd, fb->gem_handle, fb->size,
 				      PROT_READ | PROT_WRITE);
+	else if (is_nouveau_device(fd))
+		ptr = igt_nouveau_mmap_bo(fb, PROT_READ | PROT_WRITE);
 	else
 		igt_assert(false);
 
@@ -3569,13 +3640,13 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 							     &blit->shadow_fb);
 	igt_assert(blit->shadow_ptr);
 
-	if (use_enginecopy(fb) || use_blitter(fb) ||
-	    igt_vc4_is_tiled(fb->modifier)) {
+	/* Note for nouveau, it's currently faster to copy fbs to/from vram (even linear ones) */
+	if (use_enginecopy(fb) || use_blitter(fb) || igt_vc4_is_tiled(fb->modifier) ||
+	    is_nouveau_device(fd)) {
 		setup_linear_mapping(&blit->base);
 
 		/* speed things up by working from a copy in system memory */
-		cvt.src.slow_reads =
-			is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
+		cvt.src.slow_reads = is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
 	} else {
 		blit->base.linear.fb = *fb;
 		blit->base.linear.fb.gem_handle = 0;
@@ -3659,7 +3730,8 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
 			create_cairo_surface__convert(fd, fb);
 		else if (use_blitter(fb) || use_enginecopy(fb) ||
 			 igt_vc4_is_tiled(fb->modifier) ||
-			 igt_amd_is_tiled(fb->modifier))
+			 igt_amd_is_tiled(fb->modifier) ||
+			 is_nouveau_device(fb->fd))
 			create_cairo_surface__gpu(fd, fb);
 		else
 			create_cairo_surface__gtt(fd, fb);
@@ -3733,6 +3805,8 @@ void igt_remove_fb(int fd, struct igt_fb *fb)
 	do_or_die(drmModeRmFB(fd, fb->fb_id));
 	if (fb->is_dumb)
 		kmstest_dumb_destroy(fd, fb->gem_handle);
+	else if (is_nouveau_device(fd))
+		igt_nouveau_delete_bo(fb);
 	else
 		gem_close(fd, fb->gem_handle);
 	fb->fb_id = 0;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 0d64898a..2c2b8265 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -71,6 +71,7 @@ struct buf_ops;
  * @plane_bpp: The bpp for each plane.
  * @plane_width: The width for each plane.
  * @plane_height: The height for each plane.
+ * @driver_priv: Private driver-specific data, if any
  *
  * Tracking structure for KMS framebuffer objects.
  */
@@ -94,6 +95,7 @@ typedef struct igt_fb {
 	unsigned int plane_bpp[4];
 	unsigned int plane_width[4];
 	unsigned int plane_height[4];
+	void *driver_priv;
 } igt_fb_t;
 
 /**
diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
new file mode 100644
index 00000000..ae6104e3
--- /dev/null
+++ b/lib/igt_nouveau.c
@@ -0,0 +1,281 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <stdlib.h>
+#include <inttypes.h>
+
+#include <nouveau_drm.h>
+#include <nouveau/nouveau.h>
+#include <nouveau/nvif/class.h>
+
+#include "igt.h"
+#include "igt_list.h"
+#include "igt_nouveau.h"
+
+#include "nouveau/nvif/push.h"
+#include "nouveau/nvhw/class/cla0b5.h"
+#include "nouveau/priv.h"
+
+#define PASCAL_DMA_COPY_A                                                            (0x0000C0B5)
+#define PASCAL_DMA_COPY_B                                                            (0x0000C1B5)
+#define VOLTA_DMA_COPY_A                                                             (0x0000C3B5)
+#define TURING_DMA_COPY_A                                                            (0x0000C5B5)
+#define AMPERE_DMA_COPY_A                                                            (0x0000C6B5)
+
+struct igt_nouveau_fb_priv {
+	struct igt_nouveau_dev *dev;
+	struct nouveau_bo *bo;
+};
+
+static struct igt_nouveau_dev *get_nouveau_dev(int drm_fd)
+{
+	struct igt_nouveau_dev *dev;
+	struct nouveau_drm *drm;
+	static IGT_LIST_HEAD(devices);
+
+	igt_list_for_each_entry(dev, &devices, node) {
+		if (dev->drm->fd == drm_fd)
+			return dev;
+	}
+
+	igt_assert(dev = malloc(sizeof(*dev)));
+	memset(dev, 0, sizeof(*dev));
+
+	IGT_INIT_LIST_HEAD(&dev->node);
+
+	do_or_die(nouveau_drm_new(drm_fd, &dev->drm));
+	drm = dev->drm;
+
+	igt_skip_on_f(!drm->nvif, "Only the NVIF interface for nouveau is supported\n");
+
+	do_or_die(nouveau_device_new(&drm->client, NV_DEVICE,
+				     &(struct nv_device_v0) { .device = ~0ULL, },
+				     sizeof(struct nv_device_v0), &dev->dev));
+	do_or_die(nouveau_client_new(dev->dev, &dev->client));
+
+	igt_list_add(&dev->node, &devices);
+
+	return dev;
+}
+
+uint32_t igt_nouveau_get_chipset(int fd)
+{
+	return get_nouveau_dev(fd)->dev->chipset;
+}
+
+uint64_t igt_nouveau_get_block_height(uint64_t modifier)
+{
+	uint8_t gob_height;
+	uint8_t log_block_height_in_gobs = (modifier & 0xF);
+
+	switch ((modifier >> 20) & 0x3) {
+	case 0:
+	case 2:
+		gob_height = 8;
+		break;
+	case 1:
+		gob_height = 4;
+		break;
+	default:
+		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
+			      modifier);
+		break;
+	}
+
+	return gob_height * (1 << log_block_height_in_gobs);
+}
+
+static void
+decode_mod(uint16_t chipset, uint64_t modifier, uint32_t *tile_mode, uint32_t *kind)
+{
+	*tile_mode = modifier & 0xF;
+	*kind = (modifier >> 12) & 0xFF;
+
+	if (chipset >= 0xc0)
+		*tile_mode <<= 4;
+}
+
+int igt_nouveau_create_bo(int drm_fd, bool sysmem, igt_fb_t *fb)
+{
+	struct igt_nouveau_dev *dev = get_nouveau_dev(drm_fd);
+	struct nouveau_device *nvdev = dev->dev;
+	union nouveau_bo_config config = {0};
+	struct igt_nouveau_fb_priv *priv;
+	uint32_t flags = sysmem ? NOUVEAU_BO_GART : NOUVEAU_BO_VRAM;
+
+	if (fb->modifier)
+		decode_mod(nvdev->chipset, fb->modifier,
+			   &config.nvc0.tile_mode, &config.nvc0.memtype);
+
+	igt_assert(priv = malloc(sizeof(*priv)));
+	do_or_die(nouveau_bo_new(nvdev, flags | NOUVEAU_BO_RDWR, nvdev->chipset < 0x140 ? 256 : 64,
+				 fb->size, &config, &priv->bo));
+	priv->dev = dev;
+	fb->driver_priv = priv;
+
+	if (!sysmem)
+		igt_nouveau_fb_clear(fb);
+
+	return priv->bo->handle;
+}
+
+void *igt_nouveau_mmap_bo(igt_fb_t *fb, int prot)
+{
+	struct igt_nouveau_fb_priv *priv = fb->driver_priv;
+	struct igt_nouveau_dev *dev = priv->dev;
+	struct nouveau_client *client = dev->client;
+
+	do_or_die(nouveau_bo_map(priv->bo, prot, client));
+
+	return priv->bo->map;
+}
+
+void igt_nouveau_munmap_bo(igt_fb_t *fb)
+{
+	struct igt_nouveau_fb_priv *priv = fb->driver_priv;
+
+	munmap(priv->bo->map, priv->bo->size);
+	priv->bo->map = NULL;
+}
+
+void igt_nouveau_delete_bo(igt_fb_t *fb)
+{
+	struct igt_nouveau_fb_priv *priv = fb->driver_priv;
+
+	nouveau_bo_ref(NULL, &priv->bo);
+	free(priv);
+}
+
+bool igt_nouveau_is_tiled(uint64_t modifier)
+{
+	switch (modifier) {
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5):
+		return true;
+	default:
+		return false;
+	}
+}
+
+/* TODO: Implement CE on Fermi */
+static void init_ce(struct igt_nouveau_dev *dev)
+{
+	struct nouveau_device *nv_dev = dev->dev;
+	struct nouveau_client *client = dev->client;
+	struct nouveau_mclass mclass[] = {
+		{ AMPERE_DMA_COPY_A,  -1, NULL },
+		{ TURING_DMA_COPY_A,  -1, NULL },
+		{ VOLTA_DMA_COPY_A,   -1, NULL },
+		{ PASCAL_DMA_COPY_B,  -1, NULL },
+		{ PASCAL_DMA_COPY_A,  -1, NULL },
+		{ MAXWELL_DMA_COPY_A, -1, NULL },
+		{ KEPLER_DMA_COPY_A,  -1, NULL },
+		{ 0 }
+	};
+	int oclass_idx;
+	uint32_t oclass;
+
+	if (dev->ce)
+		return;
+
+	do_or_die(nouveau_object_new(&nv_dev->object, 0, NOUVEAU_FIFO_CHANNEL_CLASS,
+				     &(struct nve0_fifo) {
+					     .engine = NVE0_FIFO_ENGINE_CE0 | NVE0_FIFO_ENGINE_CE1,
+				     }, sizeof(struct nve0_fifo), &dev->ce_channel));
+
+	oclass_idx = nouveau_object_mclass(dev->ce_channel, mclass);
+	igt_assert_f(oclass_idx >= 0, "No supported dma-copy classes found\n");
+	oclass = mclass[oclass_idx].oclass;
+	igt_debug("Found dma-copy class %04x\n", oclass);
+
+	do_or_die(nouveau_pushbuf_new(client, dev->ce_channel, 4, 32 * 1024, 1, &dev->pushbuf));
+	do_or_die(nouveau_object_new(dev->ce_channel, oclass, oclass, NULL, 0, &dev->ce));
+}
+
+void igt_nouveau_fb_clear(struct igt_fb *fb)
+{
+	struct igt_nouveau_fb_priv *priv = fb->driver_priv;
+	struct igt_nouveau_dev *dev = priv->dev;
+
+	init_ce(dev);
+
+	igt_set_timeout(30, "Timed out while clearing bo with dma-copy");
+
+	for (unsigned int plane = 0; plane < fb->num_planes; plane++)
+		igt_nouveau_ce_zfilla0b5(dev, fb, priv->bo, plane);
+
+	do_or_die(nouveau_bo_wait(priv->bo, NOUVEAU_BO_RD, dev->client));
+
+	igt_reset_timeout();
+}
+
+void igt_nouveau_fb_blit(struct igt_fb *dst, struct igt_fb *src)
+{
+	struct igt_nouveau_fb_priv *dst_priv = dst->driver_priv, *src_priv = src->driver_priv;
+	struct igt_nouveau_dev *dev = dst_priv->dev;
+	struct nouveau_bo *dst_nvbo = dst_priv->bo, *src_nvbo = src_priv->bo;
+
+	init_ce(dev);
+
+	igt_set_timeout(30, "Timed out while blitting bo with dma-copy");
+
+	for (unsigned int plane = 0; plane < src->num_planes; plane++)
+		igt_nouveau_ce_copya0b5(dev, dst, dst_nvbo, src, src_nvbo, plane);
+
+	do_or_die(nouveau_bo_wait(dst_priv->bo, NOUVEAU_BO_RD, dev->client));
+
+	igt_reset_timeout();
+}
diff --git a/lib/igt_nouveau.h b/lib/igt_nouveau.h
new file mode 100644
index 00000000..ea44adb2
--- /dev/null
+++ b/lib/igt_nouveau.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef IGT_NOUVEAU_H
+#define IGT_NOUVEAU_H
+
+#include <stddef.h>
+#include <inttypes.h>
+
+#include <nouveau/nouveau.h>
+#include <nouveau/nvif/class.h>
+#include <nouveau/nvif/cl0080.h>
+
+#include "igt_core.h"
+
+#define IGT_NOUVEAU_CHIPSET_GV100 0x140
+
+typedef struct igt_fb igt_fb_t;
+
+#ifdef HAVE_LIBDRM_NOUVEAU
+#define DECL(d) d
+#else
+/* There shouldn't be any code that calls igt_nouveau_* functions without libdrm support enabled, as
+ * is_nouveau_device() always returns false with libdrm support disabled. We still need to provide
+ * function definitions though, since the alternative would be littering igt with ifdefs
+ */
+static inline __noreturn void __igt_nouveau_skip(void) {
+	igt_skip("Nouveau libdrm support disabled\n");
+}
+#define DECL(d) static inline __noreturn d { __igt_nouveau_skip(); }
+#endif
+
+DECL(uint32_t igt_nouveau_get_chipset(int fd));
+DECL(uint64_t igt_nouveau_get_block_height(uint64_t modifier));
+
+DECL(int igt_nouveau_create_bo(int drm_fd, bool sysmem, igt_fb_t *fb));
+DECL(void igt_nouveau_delete_bo(igt_fb_t *fb));
+DECL(void *igt_nouveau_mmap_bo(igt_fb_t *fb, int prot));
+DECL(void igt_nouveau_munmap_bo(igt_fb_t *fb));
+DECL(bool igt_nouveau_is_tiled(uint64_t modifier));
+
+DECL(void igt_nouveau_fb_clear(struct igt_fb *fb));
+DECL(void igt_nouveau_fb_blit(struct igt_fb *dst, struct igt_fb *src));
+
+#undef DECL
+#endif /* !IGT_NOUVEAU_H */
diff --git a/lib/meson.build b/lib/meson.build
index 672b4206..56d0e3b4 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -99,6 +99,14 @@ else
 	inc = [ inc, include_directories('stubs/drm') ]
 endif
 
+if libdrm_nouveau.found()
+	lib_deps += libdrm_nouveau
+	lib_sources += [
+		'igt_nouveau.c',
+		'nouveau/cea0b5.c'
+	]
+endif
+
 if libunwind.found()
 	lib_deps += libunwind
 else
diff --git a/lib/nouveau/cea0b5.c b/lib/nouveau/cea0b5.c
new file mode 100644
index 00000000..0986a3f8
--- /dev/null
+++ b/lib/nouveau/cea0b5.c
@@ -0,0 +1,252 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <inttypes.h>
+
+#include <nouveau_drm.h>
+
+#include "igt.h"
+#include "igt_nouveau.h"
+
+#include "nouveau/nvif/push906f.h"
+#include "nouveau/nvhw/class/cla0b5.h"
+
+#include "priv.h"
+
+void igt_nouveau_ce_zfilla0b5(struct igt_nouveau_dev *dev, struct igt_fb *fb, struct nouveau_bo *bo,
+			      unsigned int plane)
+{
+	struct nouveau_pushbuf *push = dev->pushbuf;
+	const int width = fb->strides[plane];
+	const int height = fb->plane_height[plane];
+	const int line_length = fb->plane_width[plane] * (fb->plane_bpp[plane] / 8);
+	uint32_t dma_args = NVDEF(NVA0B5, LAUNCH_DMA, DATA_TRANSFER_TYPE, NON_PIPELINED) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, FLUSH_ENABLE, TRUE) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, MULTI_LINE_ENABLE, TRUE) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, REMAP_ENABLE, TRUE);
+	int push_space = 15;
+
+	if (bo->config.nvc0.memtype) {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, SRC_MEMORY_LAYOUT, BLOCKLINEAR) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, DST_MEMORY_LAYOUT, BLOCKLINEAR);
+		push_space += 14;
+	} else {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, SRC_MEMORY_LAYOUT, PITCH) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, DST_MEMORY_LAYOUT, PITCH);
+	}
+
+	PUSH_SPACE(push, push_space);
+	PUSH_REFN(push, bo, NOUVEAU_BO_WR | (bo->flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM)));
+
+	PUSH_MTHD(push, NVA0B5, SET_REMAP_CONST_A, 0);
+
+	PUSH_MTHD(push, NVA0B5, SET_REMAP_COMPONENTS,
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, DST_X, CONST_A) |
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, DST_Y, NO_WRITE) |
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, DST_Z, NO_WRITE) |
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, DST_W, NO_WRITE) |
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, NUM_SRC_COMPONENTS, ONE) |
+		  NVDEF(NVA0B5, SET_REMAP_COMPONENTS, NUM_DST_COMPONENTS, ONE));
+
+	if (bo->config.nvc0.memtype) {
+		PUSH_MTHD(push, NVA0B5, SET_SRC_BLOCK_SIZE,
+			  NVDEF(NVA0B5, SET_SRC_BLOCK_SIZE, DEPTH, ONE_GOB) |
+			  NVDEF(NVA0B5, SET_SRC_BLOCK_SIZE, GOB_HEIGHT, GOB_HEIGHT_FERMI_8) |
+			  bo->config.nvc0.tile_mode,
+
+					SET_SRC_WIDTH,
+			  NVVAL(NVA0B5, SET_SRC_WIDTH, V, width),
+
+					SET_SRC_HEIGHT,
+			  NVVAL(NVA0B5, SET_SRC_HEIGHT, V, height),
+
+					SET_SRC_DEPTH,
+			  NVVAL(NVA0B5, SET_SRC_DEPTH, V, fb->num_planes),
+
+					SET_SRC_LAYER,
+			  NVVAL(NVA0B5, SET_SRC_LAYER, V, plane),
+
+					SET_SRC_ORIGIN,
+			  NVVAL(NVA0B5, SET_SRC_ORIGIN, X, 0) |
+			  NVVAL(NVA0B5, SET_SRC_ORIGIN, Y, 0));
+
+		PUSH_MTHD(push,	NVA0B5, SET_DST_BLOCK_SIZE,
+			  NVDEF(NVA0B5, SET_DST_BLOCK_SIZE, DEPTH, ONE_GOB) |
+			  NVDEF(NVA0B5, SET_DST_BLOCK_SIZE, GOB_HEIGHT, GOB_HEIGHT_FERMI_8) |
+			  bo->config.nvc0.tile_mode,
+
+					SET_DST_WIDTH,
+			  NVVAL(NVA0B5, SET_DST_WIDTH, V, width),
+
+					SET_DST_HEIGHT,
+			  NVVAL(NVA0B5, SET_DST_HEIGHT, V, height),
+
+					SET_DST_DEPTH,
+			  NVVAL(NVA0B5, SET_DST_DEPTH, V, fb->num_planes),
+
+					SET_DST_LAYER,
+			  NVVAL(NVA0B5, SET_DST_LAYER, V, plane),
+
+					SET_DST_ORIGIN,
+			  NVVAL(NVA0B5, SET_DST_ORIGIN, X, 0) |
+			  NVVAL(NVA0B5, SET_DST_ORIGIN, Y, 0));
+	}
+
+	PUSH_MTHD(push, NVA0B5, OFFSET_IN_UPPER,
+		  NVVAL(NVA0B5, OFFSET_IN_UPPER, UPPER, bo->offset >> 32),
+
+				OFFSET_IN_LOWER,
+		  NVVAL(NVA0B5, OFFSET_IN_LOWER, VALUE, bo->offset),
+
+				OFFSET_OUT_UPPER,
+		  NVVAL(NVA0B5, OFFSET_OUT_UPPER, UPPER, bo->offset >> 32),
+
+				OFFSET_OUT_LOWER,
+		  NVVAL(NVA0B5, OFFSET_OUT_LOWER, VALUE, bo->offset),
+
+				PITCH_IN,
+		  NVVAL(NVA0B5, PITCH_IN, VALUE, fb->strides[plane]),
+
+				PITCH_OUT,
+		  NVVAL(NVA0B5, PITCH_OUT, VALUE, fb->strides[plane]),
+
+				LINE_LENGTH_IN,
+		  NVVAL(NVA0B5, LINE_LENGTH_IN, VALUE, line_length),
+
+				LINE_COUNT,
+		  NVVAL(NVA0B5, LINE_COUNT, VALUE, height));
+
+	PUSH_MTHD(push, NVA0B5, LAUNCH_DMA, dma_args);
+
+	PUSH_KICK(push);
+}
+
+void igt_nouveau_ce_copya0b5(struct igt_nouveau_dev *dev,
+			     struct igt_fb *dst_fb, struct nouveau_bo *dst_bo,
+			     struct igt_fb *src_fb, struct nouveau_bo *src_bo,
+			     unsigned int plane)
+{
+	struct nouveau_pushbuf *push = dev->pushbuf;
+	const int src_width = src_fb->strides[plane];
+	const int src_height = src_fb->plane_height[plane];
+	const int dst_width = dst_fb->strides[plane];
+	const int dst_height = dst_fb->plane_height[plane];
+	const int line_length = src_fb->plane_width[plane] * (src_fb->plane_bpp[plane] / 8);
+	uint32_t dma_args = NVDEF(NVA0B5, LAUNCH_DMA, DATA_TRANSFER_TYPE, NON_PIPELINED) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, FLUSH_ENABLE, TRUE) |
+			    NVDEF(NVA0B5, LAUNCH_DMA, MULTI_LINE_ENABLE, TRUE);
+	int push_space = 11;
+
+	if (src_bo->config.nvc0.memtype) {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, SRC_MEMORY_LAYOUT, BLOCKLINEAR);
+		push_space += 7;
+	} else {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, SRC_MEMORY_LAYOUT, PITCH);
+	}
+
+	if (dst_bo->config.nvc0.memtype) {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, DST_MEMORY_LAYOUT, BLOCKLINEAR);
+		push_space += 7;
+	} else {
+		dma_args |= NVDEF(NVA0B5, LAUNCH_DMA, DST_MEMORY_LAYOUT, PITCH);
+	}
+
+	PUSH_SPACE(push, push_space);
+	PUSH_REFN(push, src_bo,
+		  NOUVEAU_BO_RD | (src_bo->flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM)));
+	PUSH_REFN(push, dst_bo,
+		  NOUVEAU_BO_WR | (dst_bo->flags & (NOUVEAU_BO_GART | NOUVEAU_BO_VRAM)));
+
+	if (src_bo->config.nvc0.memtype) {
+		PUSH_MTHD(push, NVA0B5, SET_SRC_BLOCK_SIZE,
+			  NVDEF(NVA0B5, SET_SRC_BLOCK_SIZE, DEPTH, ONE_GOB) |
+			  NVDEF(NVA0B5, SET_SRC_BLOCK_SIZE, GOB_HEIGHT, GOB_HEIGHT_FERMI_8) |
+			  src_bo->config.nvc0.tile_mode,
+
+					SET_SRC_WIDTH,
+			  NVVAL(NVA0B5, SET_SRC_WIDTH, V, src_width),
+
+					SET_SRC_HEIGHT,
+			  NVVAL(NVA0B5, SET_SRC_HEIGHT, V, src_height),
+
+					SET_SRC_DEPTH,
+			  NVVAL(NVA0B5, SET_SRC_DEPTH, V, src_fb->num_planes),
+
+					SET_SRC_LAYER,
+			  NVVAL(NVA0B5, SET_SRC_LAYER, V, plane),
+
+					SET_SRC_ORIGIN,
+			  NVVAL(NVA0B5, SET_SRC_ORIGIN, X, 0) |
+			  NVVAL(NVA0B5, SET_SRC_ORIGIN, Y, 0));
+	}
+
+	if (dst_bo->config.nvc0.memtype) {
+		PUSH_MTHD(push, NVA0B5, SET_DST_BLOCK_SIZE,
+			  NVDEF(NVA0B5, SET_DST_BLOCK_SIZE, DEPTH, ONE_GOB) |
+			  NVDEF(NVA0B5, SET_DST_BLOCK_SIZE, GOB_HEIGHT, GOB_HEIGHT_FERMI_8) |
+			  dst_bo->config.nvc0.tile_mode,
+
+					SET_DST_WIDTH,
+			  NVVAL(NVA0B5, SET_DST_WIDTH, V, dst_width),
+
+					SET_DST_HEIGHT,
+			  NVVAL(NVA0B5, SET_DST_HEIGHT, V, dst_height),
+
+					SET_DST_DEPTH,
+			  NVVAL(NVA0B5, SET_DST_DEPTH, V, dst_fb->num_planes),
+
+					SET_DST_LAYER,
+			  NVVAL(NVA0B5, SET_DST_LAYER, V, plane),
+
+					SET_DST_ORIGIN,
+			  NVVAL(NVA0B5, SET_DST_ORIGIN, X, 0) |
+			  NVVAL(NVA0B5, SET_DST_ORIGIN, Y, 0));
+	}
+
+	PUSH_MTHD(push, NVA0B5, OFFSET_IN_UPPER,
+		  NVVAL(NVA0B5, OFFSET_IN_UPPER, UPPER, src_bo->offset >> 32),
+
+				OFFSET_IN_LOWER,
+		  NVVAL(NVA0B5, OFFSET_IN_LOWER, VALUE, src_bo->offset),
+
+				OFFSET_OUT_UPPER,
+		  NVVAL(NVA0B5, OFFSET_OUT_UPPER, UPPER, dst_bo->offset >> 32),
+
+				OFFSET_OUT_LOWER,
+		  NVVAL(NVA0B5, OFFSET_OUT_LOWER, VALUE, dst_bo->offset),
+
+				PITCH_IN,
+		  NVVAL(NVA0B5, PITCH_IN, VALUE, src_fb->strides[plane]),
+
+				PITCH_OUT,
+		  NVVAL(NVA0B5, PITCH_OUT, VALUE, dst_fb->strides[plane]),
+
+				LINE_LENGTH_IN,
+		  NVVAL(NVA0B5, LINE_LENGTH_IN, VALUE, line_length),
+
+				LINE_COUNT,
+		  NVVAL(NVA0B5, LINE_COUNT, VALUE, src_height));
+
+	PUSH_MTHD(push, NVA0B5, LAUNCH_DMA, dma_args);
+
+	PUSH_KICK(push);
+};
diff --git a/lib/nouveau/nvhw/class/cl906f.h b/lib/nouveau/nvhw/class/cl906f.h
new file mode 100644
index 00000000..04ade763
--- /dev/null
+++ b/lib/nouveau/nvhw/class/cl906f.h
@@ -0,0 +1,103 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __NVHW_CL906F_H__
+#define __NVHW_CL906F_H__
+
+/* dma method formats */
+#define NV906F_DMA_METHOD_ADDRESS_OLD                              12:2
+#define NV906F_DMA_METHOD_ADDRESS                                  11:0
+#define NV906F_DMA_SUBDEVICE_MASK                                  15:4
+#define NV906F_DMA_METHOD_SUBCHANNEL                               15:13
+#define NV906F_DMA_TERT_OP                                         17:16
+#define NV906F_DMA_TERT_OP_GRP0_INC_METHOD                         (0x00000000)
+#define NV906F_DMA_TERT_OP_GRP0_SET_SUB_DEV_MASK                   (0x00000001)
+#define NV906F_DMA_TERT_OP_GRP0_STORE_SUB_DEV_MASK                 (0x00000002)
+#define NV906F_DMA_TERT_OP_GRP0_USE_SUB_DEV_MASK                   (0x00000003)
+#define NV906F_DMA_TERT_OP_GRP2_NON_INC_METHOD                     (0x00000000)
+#define NV906F_DMA_METHOD_COUNT_OLD                                28:18
+#define NV906F_DMA_METHOD_COUNT                                    28:16
+#define NV906F_DMA_IMMD_DATA                                       28:16
+#define NV906F_DMA_SEC_OP                                          31:29
+#define NV906F_DMA_SEC_OP_GRP0_USE_TERT                            (0x00000000)
+#define NV906F_DMA_SEC_OP_INC_METHOD                               (0x00000001)
+#define NV906F_DMA_SEC_OP_GRP2_USE_TERT                            (0x00000002)
+#define NV906F_DMA_SEC_OP_NON_INC_METHOD                           (0x00000003)
+#define NV906F_DMA_SEC_OP_IMMD_DATA_METHOD                         (0x00000004)
+#define NV906F_DMA_SEC_OP_ONE_INC                                  (0x00000005)
+#define NV906F_DMA_SEC_OP_RESERVED6                                (0x00000006)
+#define NV906F_DMA_SEC_OP_END_PB_SEGMENT                           (0x00000007)
+/* dma incrementing method format */
+#define NV906F_DMA_INCR_ADDRESS                                    11:0
+#define NV906F_DMA_INCR_SUBCHANNEL                                 15:13
+#define NV906F_DMA_INCR_COUNT                                      28:16
+#define NV906F_DMA_INCR_OPCODE                                     31:29
+#define NV906F_DMA_INCR_OPCODE_VALUE                               (0x00000001)
+#define NV906F_DMA_INCR_DATA                                       31:0
+/* dma non-incrementing method format */
+#define NV906F_DMA_NONINCR_ADDRESS                                 11:0
+#define NV906F_DMA_NONINCR_SUBCHANNEL                              15:13
+#define NV906F_DMA_NONINCR_COUNT                                   28:16
+#define NV906F_DMA_NONINCR_OPCODE                                  31:29
+#define NV906F_DMA_NONINCR_OPCODE_VALUE                            (0x00000003)
+#define NV906F_DMA_NONINCR_DATA                                    31:0
+/* dma increment-once method format */
+#define NV906F_DMA_ONEINCR_ADDRESS                                 11:0
+#define NV906F_DMA_ONEINCR_SUBCHANNEL                              15:13
+#define NV906F_DMA_ONEINCR_COUNT                                   28:16
+#define NV906F_DMA_ONEINCR_OPCODE                                  31:29
+#define NV906F_DMA_ONEINCR_OPCODE_VALUE                            (0x00000005)
+#define NV906F_DMA_ONEINCR_DATA                                    31:0
+/* dma no-operation format */
+#define NV906F_DMA_NOP                                             (0x00000000)
+/* dma immediate-data format */
+#define NV906F_DMA_IMMD_ADDRESS                                    11:0
+#define NV906F_DMA_IMMD_SUBCHANNEL                                 15:13
+#define NV906F_DMA_IMMD_DATA                                       28:16
+#define NV906F_DMA_IMMD_OPCODE                                     31:29
+#define NV906F_DMA_IMMD_OPCODE_VALUE                               (0x00000004)
+/* dma set sub-device mask format */
+#define NV906F_DMA_SET_SUBDEVICE_MASK_VALUE                        15:4
+#define NV906F_DMA_SET_SUBDEVICE_MASK_OPCODE                       31:16
+#define NV906F_DMA_SET_SUBDEVICE_MASK_OPCODE_VALUE                 (0x00000001)
+/* dma store sub-device mask format */
+#define NV906F_DMA_STORE_SUBDEVICE_MASK_VALUE                      15:4
+#define NV906F_DMA_STORE_SUBDEVICE_MASK_OPCODE                     31:16
+#define NV906F_DMA_STORE_SUBDEVICE_MASK_OPCODE_VALUE               (0x00000002)
+/* dma use sub-device mask format */
+#define NV906F_DMA_USE_SUBDEVICE_MASK_OPCODE                       31:16
+#define NV906F_DMA_USE_SUBDEVICE_MASK_OPCODE_VALUE                 (0x00000003)
+/* dma end-segment format */
+#define NV906F_DMA_ENDSEG_OPCODE                                   31:29
+#define NV906F_DMA_ENDSEG_OPCODE_VALUE                             (0x00000007)
+/* dma legacy incrementing/non-incrementing formats */
+#define NV906F_DMA_ADDRESS                                         12:2
+#define NV906F_DMA_SUBCH                                           15:13
+#define NV906F_DMA_OPCODE3                                         17:16
+#define NV906F_DMA_OPCODE3_NONE                                    (0x00000000)
+#define NV906F_DMA_COUNT                                           28:18
+#define NV906F_DMA_OPCODE                                          31:29
+#define NV906F_DMA_OPCODE_METHOD                                   (0x00000000)
+#define NV906F_DMA_OPCODE_NONINC_METHOD                            (0x00000002)
+#define NV906F_DMA_DATA                                            31:0
+
+#endif /* __NVHW_CL906F_H__ */
diff --git a/lib/nouveau/nvhw/class/cla0b5.h b/lib/nouveau/nvhw/class/cla0b5.h
new file mode 100644
index 00000000..6450c6c0
--- /dev/null
+++ b/lib/nouveau/nvhw/class/cla0b5.h
@@ -0,0 +1,250 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __NVHW_CLA0B5_H__
+#define __NVHW_CLA0B5_H__
+
+#define NVA0B5_NOP                                                              (0x00000100)
+#define NVA0B5_NOP_PARAMETER                                                    31:0
+#define NVA0B5_PM_TRIGGER                                                       (0x00000140)
+#define NVA0B5_PM_TRIGGER_V                                                     31:0
+#define NVA0B5_SET_SEMAPHORE_A                                                  (0x00000240)
+#define NVA0B5_SET_SEMAPHORE_A_UPPER                                            7:0
+#define NVA0B5_SET_SEMAPHORE_B                                                  (0x00000244)
+#define NVA0B5_SET_SEMAPHORE_B_LOWER                                            31:0
+#define NVA0B5_SET_SEMAPHORE_PAYLOAD                                            (0x00000248)
+#define NVA0B5_SET_SEMAPHORE_PAYLOAD_PAYLOAD                                    31:0
+#define NVA0B5_SET_RENDER_ENABLE_A                                              (0x00000254)
+#define NVA0B5_SET_RENDER_ENABLE_A_UPPER                                        7:0
+#define NVA0B5_SET_RENDER_ENABLE_B                                              (0x00000258)
+#define NVA0B5_SET_RENDER_ENABLE_B_LOWER                                        31:0
+#define NVA0B5_SET_RENDER_ENABLE_C                                              (0x0000025C)
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE                                         2:0
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE_FALSE                                   (0x00000000)
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE_TRUE                                    (0x00000001)
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE_CONDITIONAL                             (0x00000002)
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE_RENDER_IF_EQUAL                         (0x00000003)
+#define NVA0B5_SET_RENDER_ENABLE_C_MODE_RENDER_IF_NOT_EQUAL                     (0x00000004)
+#define NVA0B5_SET_SRC_PHYS_MODE                                                (0x00000260)
+#define NVA0B5_SET_SRC_PHYS_MODE_TARGET                                         1:0
+#define NVA0B5_SET_SRC_PHYS_MODE_TARGET_LOCAL_FB                                (0x00000000)
+#define NVA0B5_SET_SRC_PHYS_MODE_TARGET_COHERENT_SYSMEM                         (0x00000001)
+#define NVA0B5_SET_SRC_PHYS_MODE_TARGET_NONCOHERENT_SYSMEM                      (0x00000002)
+#define NVA0B5_SET_DST_PHYS_MODE                                                (0x00000264)
+#define NVA0B5_SET_DST_PHYS_MODE_TARGET                                         1:0
+#define NVA0B5_SET_DST_PHYS_MODE_TARGET_LOCAL_FB                                (0x00000000)
+#define NVA0B5_SET_DST_PHYS_MODE_TARGET_COHERENT_SYSMEM                         (0x00000001)
+#define NVA0B5_SET_DST_PHYS_MODE_TARGET_NONCOHERENT_SYSMEM                      (0x00000002)
+#define NVA0B5_LAUNCH_DMA                                                       (0x00000300)
+#define NVA0B5_LAUNCH_DMA_DATA_TRANSFER_TYPE                                    1:0
+#define NVA0B5_LAUNCH_DMA_DATA_TRANSFER_TYPE_NONE                               (0x00000000)
+#define NVA0B5_LAUNCH_DMA_DATA_TRANSFER_TYPE_PIPELINED                          (0x00000001)
+#define NVA0B5_LAUNCH_DMA_DATA_TRANSFER_TYPE_NON_PIPELINED                      (0x00000002)
+#define NVA0B5_LAUNCH_DMA_FLUSH_ENABLE                                          2:2
+#define NVA0B5_LAUNCH_DMA_FLUSH_ENABLE_FALSE                                    (0x00000000)
+#define NVA0B5_LAUNCH_DMA_FLUSH_ENABLE_TRUE                                     (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_TYPE                                        4:3
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_TYPE_NONE                                   (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_TYPE_RELEASE_ONE_WORD_SEMAPHORE             (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_TYPE_RELEASE_FOUR_WORD_SEMAPHORE            (0x00000002)
+#define NVA0B5_LAUNCH_DMA_INTERRUPT_TYPE                                        6:5
+#define NVA0B5_LAUNCH_DMA_INTERRUPT_TYPE_NONE                                   (0x00000000)
+#define NVA0B5_LAUNCH_DMA_INTERRUPT_TYPE_BLOCKING                               (0x00000001)
+#define NVA0B5_LAUNCH_DMA_INTERRUPT_TYPE_NON_BLOCKING                           (0x00000002)
+#define NVA0B5_LAUNCH_DMA_SRC_MEMORY_LAYOUT                                     7:7
+#define NVA0B5_LAUNCH_DMA_SRC_MEMORY_LAYOUT_BLOCKLINEAR                         (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SRC_MEMORY_LAYOUT_PITCH                               (0x00000001)
+#define NVA0B5_LAUNCH_DMA_DST_MEMORY_LAYOUT                                     8:8
+#define NVA0B5_LAUNCH_DMA_DST_MEMORY_LAYOUT_BLOCKLINEAR                         (0x00000000)
+#define NVA0B5_LAUNCH_DMA_DST_MEMORY_LAYOUT_PITCH                               (0x00000001)
+#define NVA0B5_LAUNCH_DMA_MULTI_LINE_ENABLE                                     9:9
+#define NVA0B5_LAUNCH_DMA_MULTI_LINE_ENABLE_FALSE                               (0x00000000)
+#define NVA0B5_LAUNCH_DMA_MULTI_LINE_ENABLE_TRUE                                (0x00000001)
+#define NVA0B5_LAUNCH_DMA_REMAP_ENABLE                                          10:10
+#define NVA0B5_LAUNCH_DMA_REMAP_ENABLE_FALSE                                    (0x00000000)
+#define NVA0B5_LAUNCH_DMA_REMAP_ENABLE_TRUE                                     (0x00000001)
+#define NVA0B5_LAUNCH_DMA_BYPASS_L2                                             11:11
+#define NVA0B5_LAUNCH_DMA_BYPASS_L2_USE_PTE_SETTING                             (0x00000000)
+#define NVA0B5_LAUNCH_DMA_BYPASS_L2_FORCE_VOLATILE                              (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SRC_TYPE                                              12:12
+#define NVA0B5_LAUNCH_DMA_SRC_TYPE_VIRTUAL                                      (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SRC_TYPE_PHYSICAL                                     (0x00000001)
+#define NVA0B5_LAUNCH_DMA_DST_TYPE                                              13:13
+#define NVA0B5_LAUNCH_DMA_DST_TYPE_VIRTUAL                                      (0x00000000)
+#define NVA0B5_LAUNCH_DMA_DST_TYPE_PHYSICAL                                     (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION                                   17:14
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IMIN                              (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IMAX                              (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IXOR                              (0x00000002)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IAND                              (0x00000003)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IOR                               (0x00000004)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IADD                              (0x00000005)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_INC                               (0x00000006)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_DEC                               (0x00000007)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_FADD                              (0x0000000A)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_FMIN                              (0x0000000B)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_FMAX                              (0x0000000C)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_FMUL                              (0x0000000D)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_IMUL                              (0x0000000E)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_SIGN                              18:18
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_SIGN_SIGNED                       (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_SIGN_UNSIGNED                     (0x00000001)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_ENABLE                            19:19
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_ENABLE_FALSE                      (0x00000000)
+#define NVA0B5_LAUNCH_DMA_SEMAPHORE_REDUCTION_ENABLE_TRUE                       (0x00000001)
+#define NVA0B5_OFFSET_IN_UPPER                                                  (0x00000400)
+#define NVA0B5_OFFSET_IN_UPPER_UPPER                                            7:0
+#define NVA0B5_OFFSET_IN_LOWER                                                  (0x00000404)
+#define NVA0B5_OFFSET_IN_LOWER_VALUE                                            31:0
+#define NVA0B5_OFFSET_OUT_UPPER                                                 (0x00000408)
+#define NVA0B5_OFFSET_OUT_UPPER_UPPER                                           7:0
+#define NVA0B5_OFFSET_OUT_LOWER                                                 (0x0000040C)
+#define NVA0B5_OFFSET_OUT_LOWER_VALUE                                           31:0
+#define NVA0B5_PITCH_IN                                                         (0x00000410)
+#define NVA0B5_PITCH_IN_VALUE                                                   31:0
+#define NVA0B5_PITCH_OUT                                                        (0x00000414)
+#define NVA0B5_PITCH_OUT_VALUE                                                  31:0
+#define NVA0B5_LINE_LENGTH_IN                                                   (0x00000418)
+#define NVA0B5_LINE_LENGTH_IN_VALUE                                             31:0
+#define NVA0B5_LINE_COUNT                                                       (0x0000041C)
+#define NVA0B5_LINE_COUNT_VALUE                                                 31:0
+#define NVA0B5_SET_REMAP_CONST_A                                                (0x00000700)
+#define NVA0B5_SET_REMAP_CONST_A_V                                              31:0
+#define NVA0B5_SET_REMAP_CONST_B                                                (0x00000704)
+#define NVA0B5_SET_REMAP_CONST_B_V                                              31:0
+#define NVA0B5_SET_REMAP_COMPONENTS                                             (0x00000708)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X                                       2:0
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_SRC_X                                 (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_SRC_Y                                 (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_SRC_Z                                 (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_SRC_W                                 (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_CONST_A                               (0x00000004)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_CONST_B                               (0x00000005)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_X_NO_WRITE                              (0x00000006)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y                                       6:4
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_SRC_X                                 (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_SRC_Y                                 (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_SRC_Z                                 (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_SRC_W                                 (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_CONST_A                               (0x00000004)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_CONST_B                               (0x00000005)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Y_NO_WRITE                              (0x00000006)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z                                       10:8
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_SRC_X                                 (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_SRC_Y                                 (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_SRC_Z                                 (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_SRC_W                                 (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_CONST_A                               (0x00000004)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_CONST_B                               (0x00000005)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_Z_NO_WRITE                              (0x00000006)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W                                       14:12
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_SRC_X                                 (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_SRC_Y                                 (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_SRC_Z                                 (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_SRC_W                                 (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_CONST_A                               (0x00000004)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_CONST_B                               (0x00000005)
+#define NVA0B5_SET_REMAP_COMPONENTS_DST_W_NO_WRITE                              (0x00000006)
+#define NVA0B5_SET_REMAP_COMPONENTS_COMPONENT_SIZE                              17:16
+#define NVA0B5_SET_REMAP_COMPONENTS_COMPONENT_SIZE_ONE                          (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_COMPONENT_SIZE_TWO                          (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_COMPONENT_SIZE_THREE                        (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_COMPONENT_SIZE_FOUR                         (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_SRC_COMPONENTS                          21:20
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_SRC_COMPONENTS_ONE                      (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_SRC_COMPONENTS_TWO                      (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_SRC_COMPONENTS_THREE                    (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_SRC_COMPONENTS_FOUR                     (0x00000003)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_DST_COMPONENTS                          25:24
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_DST_COMPONENTS_ONE                      (0x00000000)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_DST_COMPONENTS_TWO                      (0x00000001)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_DST_COMPONENTS_THREE                    (0x00000002)
+#define NVA0B5_SET_REMAP_COMPONENTS_NUM_DST_COMPONENTS_FOUR                     (0x00000003)
+#define NVA0B5_SET_DST_BLOCK_SIZE                                               (0x0000070C)
+#define NVA0B5_SET_DST_BLOCK_SIZE_WIDTH                                         3:0
+#define NVA0B5_SET_DST_BLOCK_SIZE_WIDTH_QUARTER_GOB                             (0x0000000E)
+#define NVA0B5_SET_DST_BLOCK_SIZE_WIDTH_ONE_GOB                                 (0x00000000)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT                                        7:4
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_ONE_GOB                                (0x00000000)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_TWO_GOBS                               (0x00000001)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_FOUR_GOBS                              (0x00000002)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_EIGHT_GOBS                             (0x00000003)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_SIXTEEN_GOBS                           (0x00000004)
+#define NVA0B5_SET_DST_BLOCK_SIZE_HEIGHT_THIRTYTWO_GOBS                         (0x00000005)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH                                         11:8
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_ONE_GOB                                 (0x00000000)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_TWO_GOBS                                (0x00000001)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_FOUR_GOBS                               (0x00000002)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_EIGHT_GOBS                              (0x00000003)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_SIXTEEN_GOBS                            (0x00000004)
+#define NVA0B5_SET_DST_BLOCK_SIZE_DEPTH_THIRTYTWO_GOBS                          (0x00000005)
+#define NVA0B5_SET_DST_BLOCK_SIZE_GOB_HEIGHT                                    15:12
+#define NVA0B5_SET_DST_BLOCK_SIZE_GOB_HEIGHT_GOB_HEIGHT_TESLA_4                 (0x00000000)
+#define NVA0B5_SET_DST_BLOCK_SIZE_GOB_HEIGHT_GOB_HEIGHT_FERMI_8                 (0x00000001)
+#define NVA0B5_SET_DST_WIDTH                                                    (0x00000710)
+#define NVA0B5_SET_DST_WIDTH_V                                                  31:0
+#define NVA0B5_SET_DST_HEIGHT                                                   (0x00000714)
+#define NVA0B5_SET_DST_HEIGHT_V                                                 31:0
+#define NVA0B5_SET_DST_DEPTH                                                    (0x00000718)
+#define NVA0B5_SET_DST_DEPTH_V                                                  31:0
+#define NVA0B5_SET_DST_LAYER                                                    (0x0000071C)
+#define NVA0B5_SET_DST_LAYER_V                                                  31:0
+#define NVA0B5_SET_DST_ORIGIN                                                   (0x00000720)
+#define NVA0B5_SET_DST_ORIGIN_X                                                 15:0
+#define NVA0B5_SET_DST_ORIGIN_Y                                                 31:16
+#define NVA0B5_SET_SRC_BLOCK_SIZE                                               (0x00000728)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_WIDTH                                         3:0
+#define NVA0B5_SET_SRC_BLOCK_SIZE_WIDTH_QUARTER_GOB                             (0x0000000E)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_WIDTH_ONE_GOB                                 (0x00000000)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT                                        7:4
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_ONE_GOB                                (0x00000000)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_TWO_GOBS                               (0x00000001)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_FOUR_GOBS                              (0x00000002)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_EIGHT_GOBS                             (0x00000003)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_SIXTEEN_GOBS                           (0x00000004)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_HEIGHT_THIRTYTWO_GOBS                         (0x00000005)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH                                         11:8
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_ONE_GOB                                 (0x00000000)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_TWO_GOBS                                (0x00000001)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_FOUR_GOBS                               (0x00000002)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_EIGHT_GOBS                              (0x00000003)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_SIXTEEN_GOBS                            (0x00000004)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_DEPTH_THIRTYTWO_GOBS                          (0x00000005)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_GOB_HEIGHT                                    15:12
+#define NVA0B5_SET_SRC_BLOCK_SIZE_GOB_HEIGHT_GOB_HEIGHT_TESLA_4                 (0x00000000)
+#define NVA0B5_SET_SRC_BLOCK_SIZE_GOB_HEIGHT_GOB_HEIGHT_FERMI_8                 (0x00000001)
+#define NVA0B5_SET_SRC_WIDTH                                                    (0x0000072C)
+#define NVA0B5_SET_SRC_WIDTH_V                                                  31:0
+#define NVA0B5_SET_SRC_HEIGHT                                                   (0x00000730)
+#define NVA0B5_SET_SRC_HEIGHT_V                                                 31:0
+#define NVA0B5_SET_SRC_DEPTH                                                    (0x00000734)
+#define NVA0B5_SET_SRC_DEPTH_V                                                  31:0
+#define NVA0B5_SET_SRC_LAYER                                                    (0x00000738)
+#define NVA0B5_SET_SRC_LAYER_V                                                  31:0
+#define NVA0B5_SET_SRC_ORIGIN                                                   (0x0000073C)
+#define NVA0B5_SET_SRC_ORIGIN_X                                                 15:0
+#define NVA0B5_SET_SRC_ORIGIN_Y                                                 31:16
+#define NVA0B5_PM_TRIGGER_END                                                   (0x00001114)
+#define NVA0B5_PM_TRIGGER_END_V                                                 31:0
+
+#endif // __NVHW_CLA0B5_H__
+
diff --git a/lib/nouveau/nvhw/drf.h b/lib/nouveau/nvhw/drf.h
new file mode 100644
index 00000000..7dfcd8a0
--- /dev/null
+++ b/lib/nouveau/nvhw/drf.h
@@ -0,0 +1,209 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __NVHW_DRF_H__
+#define __NVHW_DRF_H__
+
+/* Helpers common to all DRF accessors. */
+#define DRF_LO(drf)    (0 ? drf)
+#define DRF_HI(drf)    (1 ? drf)
+#define DRF_BITS(drf)  (DRF_HI(drf) - DRF_LO(drf) + 1)
+#define DRF_MASK(drf)  (~0ULL >> (64 - DRF_BITS(drf)))
+#define DRF_SMASK(drf) (DRF_MASK(drf) << DRF_LO(drf))
+
+/* Helpers for DRF-MW accessors. */
+#define DRF_MX_MW(drf)      drf
+#define DRF_MX(drf)         DRF_MX_##drf
+#define DRF_MW(drf)         DRF_MX(drf)
+#define DRF_MW_SPANS(o,drf) (DRF_LW_IDX((o),drf) != DRF_HW_IDX((o),drf))
+#define DRF_MW_SIZE(o)      (sizeof((o)[0]) * 8)
+
+#define DRF_LW_IDX(o,drf)   (DRF_LO(DRF_MW(drf)) / DRF_MW_SIZE(o))
+#define DRF_LW_LO(o,drf)    (DRF_LO(DRF_MW(drf)) % DRF_MW_SIZE(o))
+#define DRF_LW_HI(o,drf)    (DRF_MW_SPANS((o),drf) ? (DRF_MW_SIZE(o) - 1) : DRF_HW_HI((o),drf))
+#define DRF_LW_BITS(o,drf)  (DRF_LW_HI((o),drf) - DRF_LW_LO((o),drf) + 1)
+#define DRF_LW_MASK(o,drf)  (~0ULL >> (64 - DRF_LW_BITS((o),drf)))
+#define DRF_LW_SMASK(o,drf) (DRF_LW_MASK((o),drf) << DRF_LW_LO((o),drf))
+#define DRF_LW_GET(o,drf)   (((o)[DRF_LW_IDX((o),drf)] >> DRF_LW_LO((o),drf)) & DRF_LW_MASK((o),drf))
+#define DRF_LW_VAL(o,drf,v) (((v) & DRF_LW_MASK((o),drf)) << DRF_LW_LO((o),drf))
+#define DRF_LW_CLR(o,drf)   ((o)[DRF_LW_IDX((o),drf)] & ~DRF_LW_SMASK((o),drf))
+#define DRF_LW_SET(o,drf,v) (DRF_LW_CLR((o),drf) | DRF_LW_VAL((o),drf,(v)))
+
+#define DRF_HW_IDX(o,drf)   (DRF_HI(DRF_MW(drf)) / DRF_MW_SIZE(o))
+#define DRF_HW_LO(o,drf)    0
+#define DRF_HW_HI(o,drf)    (DRF_HI(DRF_MW(drf)) % DRF_MW_SIZE(o))
+#define DRF_HW_BITS(o,drf)  (DRF_HW_HI((o),drf) - DRF_HW_LO((o),drf) + 1)
+#define DRF_HW_MASK(o,drf)  (~0ULL >> (64 - DRF_HW_BITS((o),drf)))
+#define DRF_HW_SMASK(o,drf) (DRF_HW_MASK((o),drf) << DRF_HW_LO((o),drf))
+#define DRF_HW_GET(o,drf)   ((o)[DRF_HW_IDX(o,drf)] & DRF_HW_SMASK((o),drf))
+#define DRF_HW_VAL(o,drf,v) (((long long)(v) >> DRF_LW_BITS((o),drf)) & DRF_HW_SMASK((o),drf))
+#define DRF_HW_CLR(o,drf)   ((o)[DRF_HW_IDX((o),drf)] & ~DRF_HW_SMASK((o),drf))
+#define DRF_HW_SET(o,drf,v) (DRF_HW_CLR((o),drf) | DRF_HW_VAL((o),drf,(v)))
+
+/* DRF accessors. */
+#define NVVAL_X(drf,v) (((v) & DRF_MASK(drf)) << DRF_LO(drf))
+#define NVVAL_N(X,d,r,f,  v) NVVAL_X(d##_##r##_##f, (v))
+#define NVVAL_I(X,d,r,f,i,v) NVVAL_X(d##_##r##_##f(i), (v))
+#define NVVAL_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVVAL(A...) NVVAL_(X, ##A, NVVAL_I, NVVAL_N)(X, ##A)
+
+#define NVDEF_N(X,d,r,f,  v) NVVAL_X(d##_##r##_##f, d##_##r##_##f##_##v)
+#define NVDEF_I(X,d,r,f,i,v) NVVAL_X(d##_##r##_##f(i), d##_##r##_##f##_##v)
+#define NVDEF_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVDEF(A...) NVDEF_(X, ##A, NVDEF_I, NVDEF_N)(X, ##A)
+
+#define NVVAL_GET_X(o,drf) (((o) >> DRF_LO(drf)) & DRF_MASK(drf))
+#define NVVAL_GET_N(X,o,d,r,f  ) NVVAL_GET_X(o, d##_##r##_##f)
+#define NVVAL_GET_I(X,o,d,r,f,i) NVVAL_GET_X(o, d##_##r##_##f(i))
+#define NVVAL_GET_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVVAL_GET(A...) NVVAL_GET_(X, ##A, NVVAL_GET_I, NVVAL_GET_N)(X, ##A)
+
+#define NVVAL_TEST_X(o,drf,cmp,drfv) (NVVAL_GET_X((o), drf) cmp drfv)
+#define NVVAL_TEST_N(X,o,d,r,f,  cmp,v) NVVAL_TEST_X(o, d##_##r##_##f   , cmp, (v))
+#define NVVAL_TEST_I(X,o,d,r,f,i,cmp,v) NVVAL_TEST_X(o, d##_##r##_##f(i), cmp, (v))
+#define NVVAL_TEST_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define NVVAL_TEST(A...) NVVAL_TEST_(X, ##A, NVVAL_TEST_I, NVVAL_TEST_N)(X, ##A)
+
+#define NVDEF_TEST_N(X,o,d,r,f,  cmp,v) NVVAL_TEST_X(o, d##_##r##_##f   , cmp, d##_##r##_##f##_##v)
+#define NVDEF_TEST_I(X,o,d,r,f,i,cmp,v) NVVAL_TEST_X(o, d##_##r##_##f(i), cmp, d##_##r##_##f##_##v)
+#define NVDEF_TEST_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define NVDEF_TEST(A...) NVDEF_TEST_(X, ##A, NVDEF_TEST_I, NVDEF_TEST_N)(X, ##A)
+
+#define NVVAL_SET_X(o,drf,v) (((o) & ~DRF_SMASK(drf)) | NVVAL_X(drf, (v)))
+#define NVVAL_SET_N(X,o,d,r,f,  v) NVVAL_SET_X(o, d##_##r##_##f, (v))
+#define NVVAL_SET_I(X,o,d,r,f,i,v) NVVAL_SET_X(o, d##_##r##_##f(i), (v))
+#define NVVAL_SET_(X,_1,_2,_3,_4,_5,_6,IMPL,...) IMPL
+#define NVVAL_SET(A...) NVVAL_SET_(X, ##A, NVVAL_SET_I, NVVAL_SET_N)(X, ##A)
+
+#define NVDEF_SET_N(X,o,d,r,f,  v) NVVAL_SET_X(o, d##_##r##_##f,    d##_##r##_##f##_##v)
+#define NVDEF_SET_I(X,o,d,r,f,i,v) NVVAL_SET_X(o, d##_##r##_##f(i), d##_##r##_##f##_##v)
+#define NVDEF_SET_(X,_1,_2,_3,_4,_5,_6,IMPL,...) IMPL
+#define NVDEF_SET(A...) NVDEF_SET_(X, ##A, NVDEF_SET_I, NVDEF_SET_N)(X, ##A)
+
+/* DRF-MW accessors. */
+#define NVVAL_MW_GET_X(o,drf)                                                       \
+	((DRF_MW_SPANS((o),drf) ?                                                   \
+	  (DRF_HW_GET((o),drf) << DRF_LW_BITS((o),drf)) : 0) | DRF_LW_GET((o),drf))
+#define NVVAL_MW_GET_N(X,o,d,r,f  ) NVVAL_MW_GET_X((o), d##_##r##_##f)
+#define NVVAL_MW_GET_I(X,o,d,r,f,i) NVVAL_MW_GET_X((o), d##_##r##_##f(i))
+#define NVVAL_MW_GET_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVVAL_MW_GET(A...) NVVAL_MW_GET_(X, ##A, NVVAL_MW_GET_I, NVVAL_MW_GET_N)(X, ##A)
+
+#define NVVAL_MW_SET_X(o,drf,v) do {                                           \
+	(o)[DRF_LW_IDX((o),drf)] = DRF_LW_SET((o),drf,(v));                    \
+	if (DRF_MW_SPANS((o),drf))                                             \
+		(o)[DRF_HW_IDX((o),drf)] = DRF_HW_SET((o),drf,(v));            \
+} while(0)
+#define NVVAL_MW_SET_N(X,o,d,r,f,  v) NVVAL_MW_SET_X((o), d##_##r##_##f, (v))
+#define NVVAL_MW_SET_I(X,o,d,r,f,i,v) NVVAL_MW_SET_X((o), d##_##r##_##f(i), (v))
+#define NVVAL_MW_SET_(X,_1,_2,_3,_4,_5,_6,IMPL,...) IMPL
+#define NVVAL_MW_SET(A...) NVVAL_MW_SET_(X, ##A, NVVAL_MW_SET_I, NVVAL_MW_SET_N)(X, ##A)
+
+#define NVDEF_MW_SET_N(X,o,d,r,f,  v) NVVAL_MW_SET_X(o, d##_##r##_##f,    d##_##r##_##f##_##v)
+#define NVDEF_MW_SET_I(X,o,d,r,f,i,v) NVVAL_MW_SET_X(o, d##_##r##_##f(i), d##_##r##_##f##_##v)
+#define NVDEF_MW_SET_(X,_1,_2,_3,_4,_5,_6,IMPL,...) IMPL
+#define NVDEF_MW_SET(A...) NVDEF_MW_SET_(X, ##A, NVDEF_MW_SET_I, NVDEF_MW_SET_N)(X, ##A)
+
+/* Helper for reading an arbitrary object. */
+#define DRF_RD_X(e,p,o,dr) e((p), (o), dr)
+#define DRF_RD_N(X,e,p,o,d,r  ) DRF_RD_X(e, (p), (o), d##_##r)
+#define DRF_RD_I(X,e,p,o,d,r,i) DRF_RD_X(e, (p), (o), d##_##r(i))
+#define DRF_RD_(X,_1,_2,_3,_4,_5,_6,IMPL,...) IMPL
+#define DRF_RD(A...) DRF_RD_(X, ##A, DRF_RD_I, DRF_RD_N)(X, ##A)
+
+/* Helper for writing an arbitrary object. */
+#define DRF_WR_X(e,p,o,dr,v) e((p), (o), dr, (v))
+#define DRF_WR_N(X,e,p,o,d,r,  v) DRF_WR_X(e, (p), (o), d##_##r   , (v))
+#define DRF_WR_I(X,e,p,o,d,r,i,v) DRF_WR_X(e, (p), (o), d##_##r(i), (v))
+#define DRF_WR_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define DRF_WR(A...) DRF_WR_(X, ##A, DRF_WR_I, DRF_WR_N)(X, ##A)
+
+/* Helper for modifying an arbitrary object. */
+#define DRF_MR_X(er,ew,ty,p,o,dr,m,v) ({               \
+	ty _t = DRF_RD_X(er, (p), (o), dr);            \
+	DRF_WR_X(ew, (p), (o), dr, (_t & ~(m)) | (v)); \
+	_t;                                            \
+})
+#define DRF_MR_N(X,er,ew,ty,p,o,d,r  ,m,v) DRF_MR_X(er, ew, ty, (p), (o), d##_##r   , (m), (v))
+#define DRF_MR_I(X,er,ew,ty,p,o,d,r,i,m,v) DRF_MR_X(er, ew, ty, (p), (o), d##_##r(i), (m), (v))
+#define DRF_MR_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
+#define DRF_MR(A...) DRF_MR_(X, ##A, DRF_MR_I, DRF_MR_N)(X, ##A)
+
+/* Helper for extracting a field value from arbitrary object. */
+#define DRF_RV_X(e,p,o,dr,drf) NVVAL_GET_X(DRF_RD_X(e, (p), (o), dr), drf)
+#define DRF_RV_N(X,e,p,o,d,r,  f) DRF_RV_X(e, (p), (o), d##_##r   , d##_##r##_##f)
+#define DRF_RV_I(X,e,p,o,d,r,i,f) DRF_RV_X(e, (p), (o), d##_##r(i), d##_##r##_##f)
+#define DRF_RV_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define DRF_RV(A...) DRF_RV_(X, ##A, DRF_RV_I, DRF_RV_N)(X, ##A)
+
+/* Helper for writing field value to arbitrary object (all other bits cleared). */
+#define DRF_WV_N(X,e,p,o,d,r,  f,v)                                    \
+	DRF_WR_X(e, (p), (o), d##_##r   , NVVAL_X(d##_##r##_##f, (v)))
+#define DRF_WV_I(X,e,p,o,d,r,i,f,v)                                    \
+	DRF_WR_X(e, (p), (o), d##_##r(i), NVVAL_X(d##_##r##_##f, (v)))
+#define DRF_WV_(X,_1,_2,_3,_4,_5,_6,_7,_8,IMPL,...) IMPL
+#define DRF_WV(A...) DRF_WV_(X, ##A, DRF_WV_I, DRF_WV_N)(X, ##A)
+
+/* Helper for writing field definition to arbitrary object (all other bits cleared). */
+#define DRF_WD_N(X,e,p,o,d,r,  f,v)                                                    \
+	DRF_WR_X(e, (p), (o), d##_##r   , NVVAL_X(d##_##r##_##f, d##_##r##_##f##_##v))
+#define DRF_WD_I(X,e,p,o,d,r,i,f,v)                                                    \
+	DRF_WR_X(e, (p), (o), d##_##r(i), NVVAL_X(d##_##r##_##f, d##_##r##_##f##_##v))
+#define DRF_WD_(X,_1,_2,_3,_4,_5,_6,_7,_8,IMPL,...) IMPL
+#define DRF_WD(A...) DRF_WD_(X, ##A, DRF_WD_I, DRF_WD_N)(X, ##A)
+
+/* Helper for modifying field value in arbitrary object. */
+#define DRF_MV_N(X,er,ew,ty,p,o,d,r,  f,v)                                               \
+	NVVAL_GET_X(DRF_MR_X(er, ew, ty, (p), (o), d##_##r   , DRF_SMASK(d##_##r##_##f), \
+		    NVVAL_X(d##_##r##_##f, (v))), d##_##r##_##f)
+#define DRF_MV_I(X,er,ew,ty,p,o,d,r,i,f,v)                                               \
+	NVVAL_GET_X(DRF_MR_X(er, ew, ty, (p), (o), d##_##r(i), DRF_SMASK(d##_##r##_##f), \
+		    NVVAL_X(d##_##r##_##f, (v))), d##_##r##_##f)
+#define DRF_MV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
+#define DRF_MV(A...) DRF_MV_(X, ##A, DRF_MV_I, DRF_MV_N)(X, ##A)
+
+/* Helper for modifying field definition in arbitrary object. */
+#define DRF_MD_N(X,er,ew,ty,p,o,d,r,  f,v)                                               \
+	NVVAL_GET_X(DRF_MR_X(er, ew, ty, (p), (o), d##_##r   , DRF_SMASK(d##_##r##_##f), \
+		    NVVAL_X(d##_##r##_##f, d##_##r##_##f##_##v)), d##_##r##_##f)
+#define DRF_MD_I(X,er,ew,ty,p,o,d,r,i,f,v)                                               \
+	NVVAL_GET_X(DRF_MR_X(er, ew, ty, (p), (o), d##_##r(i), DRF_SMASK(d##_##r##_##f), \
+		    NVVAL_X(d##_##r##_##f, d##_##r##_##f##_##v)), d##_##r##_##f)
+#define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
+#define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
+
+/* Helper for testing against field value in aribtrary object */
+#define DRF_TV_N(X,e,p,o,d,r,  f,cmp,v)                                          \
+	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, (v))
+#define DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
+	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r(i)), d##_##r##_##f, cmp, (v))
+#define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
+#define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
+
+/* Helper for testing against field definition in aribtrary object */
+#define DRF_TD_N(X,e,p,o,d,r,  f,cmp,v)                                                          \
+	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, d##_##r##_##f##_##v)
+#define DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                                          \
+	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r(i)), d##_##r##_##f, cmp, d##_##r##_##f##_##v)
+#define DRF_TD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
+#define DRF_TD(A...) DRF_TD_(X, ##A, DRF_TD_I, DRF_TD_N)(X, ##A)
+#endif
diff --git a/lib/nouveau/nvif/push.h b/lib/nouveau/nvif/push.h
new file mode 100644
index 00000000..7826ffc8
--- /dev/null
+++ b/lib/nouveau/nvif/push.h
@@ -0,0 +1,345 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _IGT_NOUVEAU_PUSHBUF_H_
+#define _IGT_NOUVEAU_PUSHBUF_H_
+
+#include <string.h>
+#include <inttypes.h>
+
+#include <nouveau/nouveau.h>
+
+#include "igt_core.h"
+#include "igt_aux.h"
+#include "drmtest.h"
+
+#include "nouveau/nvhw/drf.h"
+
+/* Pushbuffer management functions copied from mesa */
+static inline uint32_t
+PUSH_AVAIL(struct nouveau_pushbuf *push)
+{
+	return push->end - push->cur;
+}
+
+static inline void
+PUSH_SPACE(struct nouveau_pushbuf *push, uint32_t size)
+{
+	/* Provide a buffer so that fences always have room to be emitted */
+	size += 2;
+
+	size *= 4;
+	if (PUSH_AVAIL(push) < size) {
+		do_or_die(nouveau_pushbuf_space(push, size, 0, 0));
+
+		/* Stash the beginning of the pushbuffer as the user_priv data, so we can keep track
+		 * of it to properly print the current offset of the pushbuffer
+		 */
+		push->user_priv = push->cur;
+	}
+}
+
+static inline void
+PUSH_KICK(struct nouveau_pushbuf *push)
+{
+	do_or_die(nouveau_pushbuf_kick(push, push->channel));
+}
+
+static inline void
+PUSH_REFN(struct nouveau_pushbuf *push, struct nouveau_bo *bo, uint32_t flags)
+{
+	struct nouveau_pushbuf_refn ref = { bo, flags };
+
+	do_or_die(nouveau_pushbuf_refn(push, &ref, 1));
+}
+
+#define PUSH_PRINTF(push, fmt, args...) do {       \
+	igt_debug("%08tx: "fmt"\n", (ptrdiff_t)((void*)push->cur - push->user_priv), ##args); \
+} while (0)
+
+#define PUSH_ASSERT_ON(a, b) igt_assert_f((a), "Pushbuffer assertion failed: %s (%s)\n", #a, b)
+#define PUSH_ASSERT(a, b) do {                                            \
+	static_assert(                                                    \
+		__builtin_choose_expr(__builtin_constant_p(a), (a), 1), b \
+	);                                                                \
+	PUSH_ASSERT_ON((a), b);                                           \
+} while (0)
+
+#define PUSH_DATA__(push, data, fmt, args...) do {                      \
+	struct nouveau_pushbuf *_push = (push);                         \
+	uint32_t _data = (data);                                        \
+                                                                        \
+	PUSH_ASSERT((_push->cur + 1) <= _push->end, "pushbuf overrun"); \
+	PUSH_PRINTF(_push, "%08x"fmt, _data, ##args);                   \
+	*_push->cur++ = _data;                                          \
+} while(0)
+
+#define PUSH_DATA_(X,p,m,i0,i1,d,s,f,a...) PUSH_DATA__((p), (d), "-> "#m f, ##a)
+#define PUSH_DATA(p,d) PUSH_DATA__((p), (d), " data - %s", __func__)
+
+#define PUSH_DATAp(X,p,m,i,o,d,s,f,a...) do {                                     \
+	struct nouveau_pushbuf *_pp = (p);                                        \
+	const uint32_t *_dd = (d);                                                \
+	uint32_t _s = (s), _i = (i?PUSH_##o##_INC);                               \
+	if (_s--) {                                                               \
+		PUSH_DATA_(X, _pp, X##m, i0, i1, *_dd++, 1, "+0x%x", 0);          \
+		while (_s--) {                                                    \
+			PUSH_DATA_(X, _pp, X##m, i0, i1, *_dd++, 1, "+0x%x", _i); \
+			_i += (0?PUSH_##o##_INC);                                 \
+		}                                                                 \
+	}                                                                         \
+} while(0)
+
+#define PUSH_1(X,f,ds,n,c,o,p,s,mA,dA) do {                            \
+	PUSH_##o##_HDR((p), s, mA, (c)+(n));                           \
+	PUSH_##f(X, (p), X##mA, 1, o, (dA), ds, "");                   \
+} while(0)
+#define PUSH_2(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (1?PUSH_##o##_INC), "mthd1");       \
+	PUSH_1(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_3(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd2");       \
+	PUSH_2(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_4(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd3");       \
+	PUSH_3(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_5(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd4");       \
+	PUSH_4(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_6(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd5");       \
+	PUSH_5(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_7(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd6");       \
+	PUSH_6(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_8(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd7");       \
+	PUSH_7(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_9(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                 \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd8");       \
+	PUSH_8(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+#define PUSH_10(X,f,ds,n,c,o,p,s,mB,dB,mA,dA,a...) do {                \
+	PUSH_ASSERT((mB) - (mA) == (0?PUSH_##o##_INC), "mthd9");       \
+	PUSH_9(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
+	PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                   \
+} while(0)
+
+#define PUSH_1D(X,o,p,s,mA,dA)                            \
+	PUSH_1(X, DATA_, 1, 1, 0, o, (p), s, X##mA, (dA))
+#define PUSH_2D(X,o,p,s,mA,dA,mB,dB)                      \
+	PUSH_2(X, DATA_, 1, 1, 0, o, (p), s, X##mB, (dB), \
+					     X##mA, (dA))
+#define PUSH_3D(X,o,p,s,mA,dA,mB,dB,mC,dC)                \
+	PUSH_3(X, DATA_, 1, 1, 0, o, (p), s, X##mC, (dC), \
+					     X##mB, (dB), \
+					     X##mA, (dA))
+#define PUSH_4D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD)          \
+	PUSH_4(X, DATA_, 1, 1, 0, o, (p), s, X##mD, (dD), \
+					     X##mC, (dC), \
+					     X##mB, (dB), \
+					     X##mA, (dA))
+#define PUSH_5D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE)    \
+	PUSH_5(X, DATA_, 1, 1, 0, o, (p), s, X##mE, (dE), \
+					     X##mD, (dD), \
+					     X##mC, (dC), \
+					     X##mB, (dB), \
+					     X##mA, (dA))
+#define PUSH_6D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF) \
+	PUSH_6(X, DATA_, 1, 1, 0, o, (p), s, X##mF, (dF),    \
+					     X##mE, (dE),    \
+					     X##mD, (dD),    \
+					     X##mC, (dC),    \
+					     X##mB, (dB),    \
+					     X##mA, (dA))
+#define PUSH_7D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG) \
+	PUSH_7(X, DATA_, 1, 1, 0, o, (p), s, X##mG, (dG),          \
+					     X##mF, (dF),          \
+					     X##mE, (dE),          \
+					     X##mD, (dD),          \
+					     X##mC, (dC),          \
+					     X##mB, (dB),          \
+					     X##mA, (dA))
+#define PUSH_8D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,dH) \
+	PUSH_8(X, DATA_, 1, 1, 0, o, (p), s, X##mH, (dH),                \
+					     X##mG, (dG),                \
+					     X##mF, (dF),                \
+					     X##mE, (dE),                \
+					     X##mD, (dD),                \
+					     X##mC, (dC),                \
+					     X##mB, (dB),                \
+					     X##mA, (dA))
+#define PUSH_9D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,dH,mI,dI) \
+	PUSH_9(X, DATA_, 1, 1, 0, o, (p), s, X##mI, (dI),                      \
+					     X##mH, (dH),                      \
+					     X##mG, (dG),                      \
+					     X##mF, (dF),                      \
+					     X##mE, (dE),                      \
+					     X##mD, (dD),                      \
+					     X##mC, (dC),                      \
+					     X##mB, (dB),                      \
+					     X##mA, (dA))
+#define PUSH_10D(X,o,p,s,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,dH,mI,dI,mJ,dJ) \
+	PUSH_10(X, DATA_, 1, 1, 0, o, (p), s, X##mJ, (dJ),                            \
+					      X##mI, (dI),                            \
+					      X##mH, (dH),                            \
+					      X##mG, (dG),                            \
+					      X##mF, (dF),                            \
+					      X##mE, (dE),                            \
+					      X##mD, (dD),                            \
+					      X##mC, (dC),                            \
+					      X##mB, (dB),                            \
+					      X##mA, (dA))
+
+#define PUSH_1P(X,o,p,s,mA,dp,ds)                           \
+	PUSH_1(X, DATAp, ds, ds, 0, o, (p), s, X##mA, (dp))
+#define PUSH_2P(X,o,p,s,mA,dA,mB,dp,ds)                     \
+	PUSH_2(X, DATAp, ds, ds, 0, o, (p), s, X##mB, (dp), \
+					       X##mA, (dA))
+#define PUSH_3P(X,o,p,s,mA,dA,mB,dB,mC,dp,ds)               \
+	PUSH_3(X, DATAp, ds, ds, 0, o, (p), s, X##mC, (dp), \
+					       X##mB, (dB), \
+					       X##mA, (dA))
+
+#define PUSH_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,...) IMPL
+#define PUSH(A...) PUSH_(A, PUSH_10P, PUSH_10D,          \
+			    PUSH_9P , PUSH_9D,           \
+			    PUSH_8P , PUSH_8D,           \
+			    PUSH_7P , PUSH_7D,           \
+			    PUSH_6P , PUSH_6D,           \
+			    PUSH_5P , PUSH_5D,           \
+			    PUSH_4P , PUSH_4D,           \
+			    PUSH_3P , PUSH_3D,           \
+			    PUSH_2P , PUSH_2D,           \
+			    PUSH_1P , PUSH_1D)(, ##A)
+
+#define PUSH_NVIM(p,c,m,d) do {             \
+	struct nouveau_pushbuf *__p = (p);        \
+	uint32_t __d = (d);                      \
+	PUSH_IMMD_HDR(__p, c, m, __d);      \
+	__p->cur--;                         \
+	PUSH_PRINTF(__p, "%08x-> "#m, __d); \
+	__p->cur++;                         \
+} while(0)
+#define PUSH_NVSQ(A...) PUSH(MTHD, ##A)
+#define PUSH_NV1I(A...) PUSH(1INC, ##A)
+#define PUSH_NVNI(A...) PUSH(NINC, ##A)
+
+#define PUSH_NV_1(X,o,p,c,mA,d...) \
+       PUSH_##o(p,c,c##_##mA,d)
+#define PUSH_NV_2(X,o,p,c,mA,dA,mB,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,         \
+		    c##_##mB,d)
+#define PUSH_NV_3(X,o,p,c,mA,dA,mB,dB,mC,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,               \
+		    c##_##mB,dB,               \
+		    c##_##mC,d)
+#define PUSH_NV_4(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                     \
+		    c##_##mB,dB,                     \
+		    c##_##mC,dC,                     \
+		    c##_##mD,d)
+#define PUSH_NV_5(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                           \
+		    c##_##mB,dB,                           \
+		    c##_##mC,dC,                           \
+		    c##_##mD,dD,                           \
+		    c##_##mE,d)
+#define PUSH_NV_6(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                                 \
+		    c##_##mB,dB,                                 \
+		    c##_##mC,dC,                                 \
+		    c##_##mD,dD,                                 \
+		    c##_##mE,dE,                                 \
+		    c##_##mF,d)
+#define PUSH_NV_7(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                                       \
+		    c##_##mB,dB,                                       \
+		    c##_##mC,dC,                                       \
+		    c##_##mD,dD,                                       \
+		    c##_##mE,dE,                                       \
+		    c##_##mF,dF,                                       \
+		    c##_##mG,d)
+#define PUSH_NV_8(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                                             \
+		    c##_##mB,dB,                                             \
+		    c##_##mC,dC,                                             \
+		    c##_##mD,dD,                                             \
+		    c##_##mE,dE,                                             \
+		    c##_##mF,dF,                                             \
+		    c##_##mG,dG,                                             \
+		    c##_##mH,d)
+#define PUSH_NV_9(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,dH,mI,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                                                   \
+		    c##_##mB,dB,                                                   \
+		    c##_##mC,dC,                                                   \
+		    c##_##mD,dD,                                                   \
+		    c##_##mE,dE,                                                   \
+		    c##_##mF,dF,                                                   \
+		    c##_##mG,dG,                                                   \
+		    c##_##mH,dH,                                                   \
+		    c##_##mI,d)
+#define PUSH_NV_10(X,o,p,c,mA,dA,mB,dB,mC,dC,mD,dD,mE,dE,mF,dF,mG,dG,mH,dH,mI,dI,mJ,d...) \
+       PUSH_##o(p,c,c##_##mA,dA,                                                          \
+		    c##_##mB,dB,                                                          \
+		    c##_##mC,dC,                                                          \
+		    c##_##mD,dD,                                                          \
+		    c##_##mE,dE,                                                          \
+		    c##_##mF,dF,                                                          \
+		    c##_##mG,dG,                                                          \
+		    c##_##mH,dH,                                                          \
+		    c##_##mI,dI,                                                          \
+		    c##_##mJ,d)
+
+#define PUSH_NV_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,...) IMPL
+#define PUSH_NV(A...) PUSH_NV_(A, PUSH_NV_10, PUSH_NV_10,       \
+				  PUSH_NV_9 , PUSH_NV_9,        \
+				  PUSH_NV_8 , PUSH_NV_8,        \
+				  PUSH_NV_7 , PUSH_NV_7,        \
+				  PUSH_NV_6 , PUSH_NV_6,        \
+				  PUSH_NV_5 , PUSH_NV_5,        \
+				  PUSH_NV_4 , PUSH_NV_4,        \
+				  PUSH_NV_3 , PUSH_NV_3,        \
+				  PUSH_NV_2 , PUSH_NV_2,        \
+				  PUSH_NV_1 , PUSH_NV_1)(, ##A)
+
+#define PUSH_IMMD(A...) PUSH_NV(NVIM, ##A)
+#define PUSH_MTHD(A...) PUSH_NV(NVSQ, ##A)
+#define PUSH_1INC(A...) PUSH_NV(NV1I, ##A)
+#define PUSH_NINC(A...) PUSH_NV(NVNI, ##A)
+
+#endif /* _IGT_NOUVEAU_PUSHBUF_H_ */
diff --git a/lib/nouveau/nvif/push906f.h b/lib/nouveau/nvif/push906f.h
new file mode 100644
index 00000000..bb024b98
--- /dev/null
+++ b/lib/nouveau/nvif/push906f.h
@@ -0,0 +1,70 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __NVIF_PUSH906F_H__
+#define __NVIF_PUSH906F_H__
+#include "nouveau/nvif/push.h"
+
+#include "nouveau/nvhw/class/cl906f.h"
+
+#ifndef PUSH906F_SUBC
+// Host methods
+#define PUSH906F_SUBC_NV906F	0
+
+// Twod
+#define PUSH906F_SUBC_NV902D	3
+
+// MemoryToMemoryFormat
+#define PUSH906F_SUBC_NV9039	4
+
+// DmaCopy
+#define PUSH906F_SUBC_NV90B5	4
+#define PUSH906F_SUBC_NVA0B5	4
+#endif
+
+#define PUSH_HDR(p,o,n,f,s,m,c) do {                                                \
+        PUSH_ASSERT(!((s) & ~DRF_MASK(NV906F_DMA_METHOD_SUBCHANNEL)), "subc");      \
+        PUSH_ASSERT(!((m) & ~(DRF_MASK(NV906F_DMA_METHOD_ADDRESS) << 2)), "mthd");   \
+        PUSH_ASSERT(!((c) & ~DRF_MASK(NV906F_DMA_METHOD_COUNT)), "count/immd");     \
+        PUSH_DATA__((p), NVVAL(NV906F, DMA, METHOD_ADDRESS, (m) >> 2) |             \
+			 NVVAL(NV906F, DMA, METHOD_SUBCHANNEL, (s)) |               \
+			 NVVAL(NV906F, DMA, METHOD_COUNT, (c)) |                    \
+			 NVDEF(NV906F, DMA, SEC_OP, o),                             \
+		    " "n" subc %d mthd 0x%04x "f" - %s",                            \
+		    (uint32_t)(s), (uint32_t)(m), (uint32_t)(c), __func__);                        \
+} while(0)
+
+#define PUSH_MTHD_INC 4:4
+#define PUSH_MTHD_HDR(p,c,m,n) \
+	PUSH_HDR(p, INC_METHOD, "incr", "size %d", PUSH906F_SUBC_##c, m, n)
+
+#define PUSH_NINC_INC 0:0
+#define PUSH_NINC_HDR(p,c,m,n) \
+	PUSH_HDR(p, NON_INC_METHOD, "ninc", "size %d", PUSH906F_SUBC_##c, m, n)
+
+#define PUSH_IMMD_HDR(p,c,m,n) \
+	PUSH_HDR(p, IMMD_DATA_METHOD, "immd", "data 0x%04x", PUSH906F_SUBC_##c, m, n)
+
+#define PUSH_1INC_INC 4:0
+#define PUSH_1INC_HDR(p,c,m,n) \
+	PUSH_HDR(p, ONE_INC, "oinc", "size %d", PUSH906F_SUBC_##c, m, n)
+#endif
diff --git a/lib/nouveau/priv.h b/lib/nouveau/priv.h
new file mode 100644
index 00000000..92331d1b
--- /dev/null
+++ b/lib/nouveau/priv.h
@@ -0,0 +1,57 @@
+/*
+ * Copyright 2021 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _IGT_NOUVEAU_PRIV_H_
+#define _IGT_NOUVEAU_PRIV_H_
+
+#include <inttypes.h>
+#include <pthread.h>
+
+#include <nouveau_drm.h>
+#include <nouveau/nouveau.h>
+#include <nouveau/nvif/class.h>
+#include <nouveau/nvif/cl0080.h>
+
+#include "igt_list.h"
+
+struct igt_fb;
+
+struct igt_nouveau_dev {
+	struct nouveau_drm *drm;
+	struct nouveau_device *dev;
+	struct nouveau_client *client;
+
+	struct nouveau_object *ce_channel;
+	struct nouveau_object *ce;
+	struct nouveau_pushbuf *pushbuf;
+
+	struct igt_list_head node;
+};
+
+void igt_nouveau_ce_zfilla0b5(struct igt_nouveau_dev *dev, struct igt_fb *fb, struct nouveau_bo *bo,
+			      unsigned int plane);
+void igt_nouveau_ce_copya0b5(struct igt_nouveau_dev *dev,
+			     struct igt_fb *dst_fb, struct nouveau_bo *dst_bo,
+			     struct igt_fb *src_fb, struct nouveau_bo *src_bo,
+			     unsigned int plane);
+
+#endif /* !_IGT_NOUVEAU_PRIV_H_ */
diff --git a/meson.build b/meson.build
index f4ee14f1..376fe80a 100644
--- a/meson.build
+++ b/meson.build
@@ -108,6 +108,9 @@ endif
 if with_libdrm.contains('auto') or with_libdrm.contains('nouveau')
 	libdrm_nouveau = dependency('libdrm_nouveau', version : libdrm_version, required : with_libdrm.contains('nouveau'))
 	libdrm_info += 'nouveau'
+	if libdrm_nouveau.found()
+		config.set('HAVE_LIBDRM_NOUVEAU', 1)
+	endif
 endif
 if with_libdrm.contains('auto') or with_libdrm.contains('amdgpu')
 	libdrm_amdgpu = dependency('libdrm_amdgpu', version : libdrm_version, required : with_libdrm.contains('amdgpu'))
diff --git a/tests/meson.build b/tests/meson.build
index 825e0183..8c57f366 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -78,7 +78,6 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
-	'nouveau_crc',
 	'panfrost_get_param',
 	'panfrost_gem_new',
 	'panfrost_prime',
@@ -250,6 +249,7 @@ if libdrm_nouveau.found()
 		'prime_nv_api',
 		'prime_nv_pcopy',
 		'prime_nv_test',
+		'nouveau_crc',
 	]
 	test_deps += libdrm_nouveau
 endif
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
