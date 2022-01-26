Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6F49D19F
	for <lists+nouveau@lfdr.de>; Wed, 26 Jan 2022 19:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3FC10E687;
	Wed, 26 Jan 2022 18:21:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A3310E7EA;
 Wed, 26 Jan 2022 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189973; x=1674725973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GYppmqUP4lbR+vsHIMjZKwAtlHKGNb6DyJc+gQD8j4Q=;
 b=Potx5F7RvaPE0IzFcTOStQKQyg7XceEpHKY8sQKkDbYRvs0ElxI4+h6B
 B16goB0mQc4biluD6UN6LBSlk9zO+SQf7NT4r9Gjp4gH3kXOIuA8ZyJuP
 EqAk1DaZ1nxIMO8QqFUh7l98CjZ0NO4HhalG+83jcMKOFd4ey7oBaUBT2
 bkl0slRrNL/RlqF5A3yItzEOyTL2UUCAHJ0hVAxb1+3P7WolUGCox+ydE
 fy3OEOM6XDuITWeqZ1S/dtmTxSSDXIKcsxotuUyZQNDaLgNwDt2GAm2jz
 Pud6F4KdsguR03+fcyp6fHMIMc6mfGIOKBOBjkXurUqqAYSmW6HQBxsuz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309830639"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="309830639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433106"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Wed, 26 Jan 2022 01:39:49 -0800
Message-Id: <20220126093951.1470898-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 18:21:14 +0000
Subject: [Nouveau] [PATCH v2 09/11] drm: Convert open-coded yes/no strings
 to yesno()
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

linux/string_helpers.h provides a helper to return "yes"/"no" strings.
Replace the open coded versions with str_yes_no(). The places were
identified with the following semantic patch:

	@@
	expression b;
	@@

	- b ? "yes" : "no"
	+ str_yes_no(b)

Then the includes were added, so we include-what-we-use, and parenthesis
adjusted in drivers/gpu/drm/v3d/v3d_debugfs.c. After the conversion we
still see the same binary sizes:

   text    data     bss     dec     hex filename
  51149    3295     212   54656    d580 virtio/virtio-gpu.ko.old
  51149    3295     212   54656    d580 virtio/virtio-gpu.ko
1441491   60340     800 1502631  16eda7 radeon/radeon.ko.old
1441491   60340     800 1502631  16eda7 radeon/radeon.ko
6125369  328538   34000 6487907  62ff63 amd/amdgpu/amdgpu.ko.old
6125369  328538   34000 6487907  62ff63 amd/amdgpu/amdgpu.ko
 411986   10490    6176  428652   68a6c drm.ko.old
 411986   10490    6176  428652   68a6c drm.ko
  98129    1636     264  100029   186bd dp/drm_dp_helper.ko.old
  98129    1636     264  100029   186bd dp/drm_dp_helper.ko
1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko.old
1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c             |  4 +++-
 drivers/gpu/drm/dp/drm_dp.c                   |  3 ++-
 drivers/gpu/drm/drm_client_modeset.c          |  3 ++-
 drivers/gpu/drm/drm_gem.c                     |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c |  5 ++++-
 drivers/gpu/drm/radeon/atom.c                 |  3 ++-
 drivers/gpu/drm/v3d/v3d_debugfs.c             | 11 ++++++-----
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |  4 +++-
 8 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 6fa2229b7229..1c5d9388ad0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -25,6 +25,8 @@
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
+
 #include <asm/unaligned.h>
 
 #include <drm/drm_util.h>
@@ -740,7 +742,7 @@ static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 		break;
 	}
 	if (arg != ATOM_COND_ALWAYS)
-		SDEBUG("   taken: %s\n", execute ? "yes" : "no");
+		SDEBUG("   taken: %s\n", str_yes_no(execute));
 	SDEBUG("   target: 0x%04X\n", target);
 	if (execute) {
 		if (ctx->last_jump == (ctx->start + target)) {
diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 6d43325acca5..c43577c8ac4d 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -28,6 +28,7 @@
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/string_helpers.h>
 
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -1239,7 +1240,7 @@ void drm_dp_downstream_debug(struct seq_file *m,
 	bool branch_device = drm_dp_is_branch(dpcd);
 
 	seq_printf(m, "\tDP branch device present: %s\n",
-		   branch_device ? "yes" : "no");
+		   str_yes_no(branch_device));
 
 	if (!branch_device)
 		return;
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..e6346a67cd98 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_client.h>
@@ -241,7 +242,7 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
 		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-			      connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
+			      connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
 
 		any_enabled |= enabled[i];
 	}
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 21631c22b374..3c888db59ea4 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -37,6 +37,7 @@
 #include <linux/pagevec.h>
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
@@ -1145,7 +1146,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			  drm_vma_node_start(&obj->vma_node));
 	drm_printf_indent(p, indent, "size=%zu\n", obj->size);
 	drm_printf_indent(p, indent, "imported=%s\n",
-			  obj->import_attach ? "yes" : "no");
+			  str_yes_no(obj->import_attach));
 
 	if (obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
index a11637b0f6cc..d063d0dc13c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
@@ -21,6 +21,9 @@
  *
  * Authors: Ben Skeggs
  */
+
+#include <linux/string_helpers.h>
+
 #include "aux.h"
 #include "pad.h"
 
@@ -94,7 +97,7 @@ void
 nvkm_i2c_aux_monitor(struct nvkm_i2c_aux *aux, bool monitor)
 {
 	struct nvkm_i2c_pad *pad = aux->pad;
-	AUX_TRACE(aux, "monitor: %s", monitor ? "yes" : "no");
+	AUX_TRACE(aux, "monitor: %s", str_yes_no(monitor));
 	if (monitor)
 		nvkm_i2c_pad_mode(pad, NVKM_I2C_PAD_AUX);
 	else
diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.c
index f15b20da5315..c1bbfbe28bda 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -25,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 
 #include <asm/unaligned.h>
 
@@ -722,7 +723,7 @@ static void atom_op_jump(atom_exec_context *ctx, int *ptr, int arg)
 		break;
 	}
 	if (arg != ATOM_COND_ALWAYS)
-		SDEBUG("   taken: %s\n", execute ? "yes" : "no");
+		SDEBUG("   taken: %s\n", str_yes_no(execute));
 	SDEBUG("   target: 0x%04X\n", target);
 	if (execute) {
 		if (ctx->last_jump == (ctx->start + target)) {
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index e76b24bb8828..29fd13109e43 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
+#include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
 
@@ -148,15 +149,15 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 		   V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV),
 		   V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPIDX));
 	seq_printf(m, "MMU:        %s\n",
-		   (ident2 & V3D_HUB_IDENT2_WITH_MMU) ? "yes" : "no");
+		   str_yes_no(ident2 & V3D_HUB_IDENT2_WITH_MMU));
 	seq_printf(m, "TFU:        %s\n",
-		   (ident1 & V3D_HUB_IDENT1_WITH_TFU) ? "yes" : "no");
+		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TFU));
 	seq_printf(m, "TSY:        %s\n",
-		   (ident1 & V3D_HUB_IDENT1_WITH_TSY) ? "yes" : "no");
+		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TSY));
 	seq_printf(m, "MSO:        %s\n",
-		   (ident1 & V3D_HUB_IDENT1_WITH_MSO) ? "yes" : "no");
+		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_MSO));
 	seq_printf(m, "L3C:        %s (%dkb)\n",
-		   (ident1 & V3D_HUB_IDENT1_WITH_L3C) ? "yes" : "no",
+		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_L3C),
 		   V3D_GET_FIELD(ident2, V3D_HUB_IDENT2_L3C_NKB));
 
 	for (core = 0; core < cores; core++) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index b6954e2f75e6..853dd9aa397e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -23,6 +23,8 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/string_helpers.h>
+
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 
@@ -31,7 +33,7 @@
 static void virtio_gpu_add_bool(struct seq_file *m, const char *name,
 				bool value)
 {
-	seq_printf(m, "%-16s : %s\n", name, value ? "yes" : "no");
+	seq_printf(m, "%-16s : %s\n", name, str_yes_no(value));
 }
 
 static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
-- 
2.34.1

