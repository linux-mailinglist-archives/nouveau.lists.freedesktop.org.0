Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74074CE3D
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC15810E1F5;
	Mon, 10 Jul 2023 07:23:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out-33.mta0.migadu.com (out-33.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884E010E44F
 for <nouveau@lists.freedesktop.org>; Fri, 30 Jun 2023 11:08:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1688122982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXx1laixqm+HHOVy97jy9G+BpchN57Ar9LF8bARYYqo=;
 b=VNPbKeIR8sRX3g4KLjhAPjWT3+Dw8qjLslsLKcRpLqxLclxnmEr8TBNpeNKU+lwlEQ3U5W
 jCvAY5ApFhtTlExL03ASYm9EzmGHszg0JqUuMe5XHKdU1ZPVrxOQnYhnyHMNIZ0hhxSM/l
 ghryq+a3ypMHsQdq3SPASDlwhB9FWJk=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 30 Jun 2023 19:02:41 +0800
Message-Id: <20230630110243.141671-3-sui.jingfeng@linux.dev>
In-Reply-To: <20230630110243.141671-1-sui.jingfeng@linux.dev>
References: <20230630110243.141671-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH v1 2/4] PCI/VGA: Improve the default VGA device
 selection
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Currently, the default VGA device selection is not perfect. Potential
problems are:

1) This function is a no-op on non-x86 architectures.
2) It does not take the PCI Bar may get relocated into consideration.
3) It is not effective for the PCI device without a dedicated VRAM Bar.
4) It is device-agnostic, thus it has to waste the effort to iterate all
   of the PCI Bar to find the VRAM aperture.
5) It has invented lots of methods to determine which one is the default
   boot device on a multiple video card coexistence system. But this is
   still a policy because it doesn't give the user a choice to override.

With the observation that device drivers or video aperture helpers may
have better knowledge about which PCI bar contains the firmware FB,

This patch tries to solve the above problems by introducing a function
callback to the vga_client_register() function interface. DRM device
drivers for the PCI device need to register the is_boot_device() function
callback during the driver loading time. Once the driver binds the device
successfully, VRAARB will call back to the driver. This gives the device
drivers a chance to provide accurate boot device identification. Which in
turn unlock the abitration service to non-x86 architectures. A device
driver can also pass a NULL pointer to the keep the original behavior.

This patch is to introduce the mechanism only, while the implementation
is left to the authors of various device driver. Also honor the comment:
"Clients have two callback mechanisms they can use"

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: Likun Gao <Likun.Gao@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
Cc: Abhishek Sahu <abhsahu@nvidia.com>
Cc: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com> # nouveau
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c   |  3 +--
 drivers/gpu/drm/nouveau/nouveau_vga.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c     |  2 +-
 drivers/pci/vgaarb.c                       | 21 ++++++++++++++++++++-
 drivers/vfio/pci/vfio_pci_core.c           |  2 +-
 include/linux/vgaarb.h                     |  8 +++++---
 7 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e25f085ee886..c5bdf6eff29e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4082,7 +4082,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
+		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode, NULL);
 
 	px = amdgpu_device_supports_px(ddev);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 286a0bdd28c6..98d7d4dffe9f 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -115,7 +115,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 
 int intel_vga_register(struct drm_i915_private *i915)
 {
-
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int ret;
 
@@ -127,7 +126,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 	 * then we do not take part in VGA arbitration and the
 	 * vga_client_register() fails with -ENODEV.
 	 */
-	ret = vga_client_register(pdev, intel_vga_set_decode);
+	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
 	if (ret && ret != -ENODEV)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index f8bf0ec26844..162b4f4676c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -92,7 +92,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 		return;
 	pdev = to_pci_dev(dev->dev);
 
-	vga_client_register(pdev, nouveau_vga_set_decode);
+	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
 
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
 	if (pci_is_thunderbolt_attached(pdev))
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..71f2ff39d6a1 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1425,7 +1425,7 @@ int radeon_device_init(struct radeon_device *rdev,
 	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
 	/* this will fail for cards that aren't VGA class devices, just
 	 * ignore it */
-	vga_client_register(rdev->pdev, radeon_vga_set_decode);
+	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 17bd1268c36a..99d6f1f9b789 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -53,6 +53,7 @@ struct vga_device {
 	bool bridge_has_one_vga;
 	bool is_firmware_default;	/* device selected by firmware */
 	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
+	bool (*is_boot_device)(struct pci_dev *pdev);
 };
 
 static LIST_HEAD(vga_list);
@@ -969,6 +970,10 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
+ * @is_boot_device: callback to the device driver, query if a client is the
+ * default boot device, as the device driver typically has better knowledge
+ * if specific device is the boot device. But this callback is optional.
+ *
  * Rationale: we cannot disable VGA decode resources unconditionally, some
  * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
  * to control things like backlights etc. Hopefully newer multi-GPU laptops do
@@ -984,7 +989,8 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * Returns: 0 on success, -1 on failure
  */
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode),
+		bool (*is_boot_device)(struct pci_dev *pdev))
 {
 	int ret = -ENODEV;
 	struct vga_device *vgadev;
@@ -996,6 +1002,7 @@ int vga_client_register(struct pci_dev *pdev,
 		goto bail;
 
 	vgadev->set_decode = set_decode;
+	vgadev->is_boot_device = is_boot_device;
 	ret = 0;
 
 bail:
@@ -1521,6 +1528,18 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 		notify = vga_arbiter_add_pci_device(pdev);
 	else if (action == BUS_NOTIFY_DEL_DEVICE)
 		notify = vga_arbiter_del_pci_device(pdev);
+	else if (action == BUS_NOTIFY_BOUND_DRIVER) {
+		struct vga_device *vgadev = vgadev_find(pdev);
+
+		if (vgadev && vgadev->is_boot_device) {
+			bool boot_dev = vgadev->is_boot_device(pdev);
+
+			if (boot_dev) {
+				vgaarb_info(dev, "Overriding as boot device\n");
+				vga_set_default_device(pdev);
+			}
+		}
+	}
 
 	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
 
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a5ab416cf476..2a8873a330ba 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2067,7 +2067,7 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
 	if (ret)
 		return ret;
 
-	ret = vga_client_register(pdev, vfio_pci_set_decode);
+	ret = vga_client_register(pdev, vfio_pci_set_decode, NULL);
 	if (ret)
 		return ret;
 	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 97129a1bbb7d..dfde5a6ba55a 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -33,7 +33,8 @@ struct pci_dev *vga_default_device(void);
 void vga_set_default_device(struct pci_dev *pdev);
 int vga_remove_vgacon(struct pci_dev *pdev);
 int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state));
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*is_boot_device)(struct pci_dev *pdev));
 #else /* CONFIG_VGA_ARB */
 static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
 		unsigned int decodes)
@@ -59,7 +60,8 @@ static inline int vga_remove_vgacon(struct pci_dev *pdev)
 	return 0;
 }
 static inline int vga_client_register(struct pci_dev *pdev,
-		unsigned int (*set_decode)(struct pci_dev *pdev, bool state))
+		unsigned int (*set_decode)(struct pci_dev *pdev, bool state),
+		bool (*is_boot_device)(struct pci_dev *pdev))
 {
 	return 0;
 }
@@ -97,7 +99,7 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 
 static inline void vga_client_unregister(struct pci_dev *pdev)
 {
-	vga_client_register(pdev, NULL);
+	vga_client_register(pdev, NULL, NULL);
 }
 
 #endif /* LINUX_VGA_H */
-- 
2.25.1

