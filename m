Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FE8CA149
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2024 19:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8289910E81F;
	Mon, 20 May 2024 17:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jRNqXBqC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D365910E68C
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82Vph+Q3j8BVvO/RuEAHK7JPrZ2ySneeAlIJaZohjIQ=;
 b=jRNqXBqCXJyMTD+v7DG85yJpYLQU03GQTyvTPOSsUy0RscEQG1Non7qqeAUJIfHffQQ4UO
 Yy8Nh5hTHHhX82wmpZNAy4R/oXumXQkUilajrTnVbdGGaaJ6VbQer+e+W0XFotFUCPz1mt
 caNF+uteH/o2cqJXeEwAhxbMu8puMO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-ADOPonnxNK6fBmqmhtsYjA-1; Mon, 20 May 2024 13:24:43 -0400
X-MC-Unique: ADOPonnxNK6fBmqmhtsYjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-354c964f74aso666670f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 10:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225882; x=1716830682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82Vph+Q3j8BVvO/RuEAHK7JPrZ2ySneeAlIJaZohjIQ=;
 b=FdhR/hQNE73e1CUY6IvtzvIRZqAUxLxWzYBX1ElmKcT109aZgiA8xI7PDLmGTUkyOG
 ANY0EpYNBaFa2+kmAHFNpc5TSlqggU433XmaQDvxJxYao28tiyK8dKkOYrEcTOjkXg1/
 xJPm4z7oFu8LJsRi7SpdWwV2ZVNfMl08CRf0WoWLWprtOJdEitjfJLEKDyJu1Z4xc4eD
 8ZqEeLadwJJ6p5c8GXd9PYzjfsCJ4tU1nhJgzCLfQEXw8aXuiZl883e6aWk18Rjo9G9f
 7VWg2BC7taMJLoEY78JZE4HP3Dxv81UXKSaOAOtAZG/gj7yTsXcT9jl90zRoDPOYN5QM
 rYjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKGMI41I86NDvo3EgY8NN07ZDEMnmaLI4iZCnn068CztYJRq3dNOpirW5nW3MyvzPR/mj7xv4pfMNRqgdQtLLhx/av7Gg2Nj+uvro4ww==
X-Gm-Message-State: AOJu0YyhzlBCKfxIefIuB4a5cQvcp/AcpV2D26aiyKXyxss2yYVn66Q5
 EfQ+27cKt6mtddKJEEe4mtieTeCmp09z68k7DEjqbmsamDoEMjgph9LSmIFVpLgX+LGzfvdRnGa
 w1GX28b/fET93xWmAB5q3jp2UsqwJGG7Jpm9yOzniEzjqL9BvGA0m/NhpZkfyhZo=
X-Received: by 2002:a5d:5450:0:b0:351:dd2d:f6ad with SMTP id
 ffacd0b85a97d-351dd2df934mr7531647f8f.67.1716225882025; 
 Mon, 20 May 2024 10:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2QQOtaLaHDV4phxxm8NaIVRPTBK2ykMJJupK+1ptCW1PGIZFTGlFFUO7k02cx8LGlySQeJQ==
X-Received: by 2002:a5d:5450:0:b0:351:dd2d:f6ad with SMTP id
 ffacd0b85a97d-351dd2df934mr7531624f8f.67.1716225881653; 
 Mon, 20 May 2024 10:24:41 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351d7861323sm12513280f8f.74.2024.05.20.10.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:24:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 8/8] nova: add initial driver stub
Date: Mon, 20 May 2024 19:24:20 +0200
Message-ID: <20240520172422.181763-5-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add the initial driver stub of Nova, a Rust-based GSP-only driver for
Nvidia GPUs. Nova, in the long term, is intended to serve as the
successor of Nouveau for GSP-firmware-based GPUs. [1]

As a stub driver Nova's focus is to make use of the most basic device /
driver infrastructure required to build a DRM driver on the PCI bus and
serve as demonstration example and justification for this
infrastructure.

In further consequence, the idea is to develop Nova continuously
upstream, using those increments to lift further Rust abstractions and
infrastructure upstream.

Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS                    |  10 ++
 drivers/gpu/drm/Kconfig        |   2 +
 drivers/gpu/drm/Makefile       |   1 +
 drivers/gpu/drm/nova/Kconfig   |  11 +++
 drivers/gpu/drm/nova/Makefile  |   3 +
 drivers/gpu/drm/nova/driver.rs | 110 +++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs   |  71 ++++++++++++++
 drivers/gpu/drm/nova/gem.rs    |  50 ++++++++++
 drivers/gpu/drm/nova/gpu.rs    | 172 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nova/nova.rs   |  20 ++++
 include/uapi/drm/nova_drm.h    | 101 +++++++++++++++++++
 rust/uapi/uapi_helper.h        |   1 +
 12 files changed, 552 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/gpu.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..1ca0ea445e3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6863,6 +6863,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
+DRM DRIVER (STUB) FOR NVIDIA GSP GPUS [RUST]
+M:	Danilo Krummrich <dakr@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+L:	nouveau@lists.freedesktop.org
+S:	Supported
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nova.git
+F:	drivers/gpu/drm/nova/
+F:	include/uapi/drm/nova_drm.h
+
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
 M:	Stefan Mavrodiev <stefan@olimex.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5a0c476361c3..0bb0442a252e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -274,6 +274,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/nova/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..de6dc006cb7f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -143,6 +143,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-$(CONFIG_DRM_NOVA_STUB) += nova/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
new file mode 100644
index 000000000000..1ae2d1322a92
--- /dev/null
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -0,0 +1,11 @@
+config DRM_NOVA_STUB
+	tristate "Nova GPU driver stub"
+	depends on DRM
+	depends on PCI
+	depends on RUST
+	default n
+	help
+	  Choose this if you want to build the Nova stub driver for Nvidia
+	  GSP-based GPUs.
+
+	  If M is selected, the module will be called nova.
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
new file mode 100644
index 000000000000..733ac5fb9f4f
--- /dev/null
+++ b/drivers/gpu/drm/nova/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_NOVA_STUB) += nova.o
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
new file mode 100644
index 000000000000..47eaa2eddf16
--- /dev/null
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use alloc::boxed::Box;
+use core::pin::Pin;
+use kernel::{
+    bindings, c_str, device, driver, drm,
+    drm::{drv, ioctl},
+    pci,
+    pci::define_pci_id_table,
+    prelude::*,
+    sync::Arc,
+};
+
+use crate::{file::File, gpu::Gpu};
+
+pub(crate) struct NovaDriver;
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type NovaDevice = drm::device::Device<NovaDriver>;
+
+#[allow(dead_code)]
+pub(crate) struct NovaData {
+    pub(crate) gpu: Arc<Gpu>,
+    pub(crate) pdev: pci::Device,
+}
+
+type DeviceData = device::Data<drm::drv::Registration<NovaDriver>, NovaData>;
+
+const INFO: drm::drv::DriverInfo = drm::drv::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("nova"),
+    desc: c_str!("Nvidia Graphics"),
+    date: c_str!("20240227"),
+};
+
+impl pci::Driver for NovaDriver {
+    type Data = Arc<DeviceData>;
+
+    define_pci_id_table! {
+        (),
+        [ (pci::DeviceId::new(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as u32), None) ]
+    }
+
+    fn probe(pdev: &mut pci::Device, _id_info: Option<&Self::IdInfo>) -> Result<Arc<DeviceData>> {
+        dev_dbg!(pdev.as_ref(), "Probe Nova GPU driver.\n");
+
+        let reg = drm::drv::Registration::<NovaDriver>::new(pdev.as_ref())?;
+
+        pdev.enable_device_mem()?;
+        pdev.set_master();
+
+        let bar = pdev.iomap_region(0, c_str!("nova"))?;
+
+        let gpu = Gpu::new(pdev, bar)?;
+
+        let data = kernel::new_device_data!(
+            reg,
+            NovaData {
+                gpu,
+                pdev: pdev.clone(),
+            },
+            "NovaData"
+        )?;
+        let data: Arc<DeviceData> = data.into();
+
+        kernel::drm_device_register!(
+            data.registrations().ok_or(ENXIO)?.as_pinned_mut(),
+            data.clone(),
+            0
+        )?;
+
+        Ok(data)
+    }
+
+    fn remove(data: &Self::Data) {
+        dev_dbg!(data.pdev.as_ref(), "Remove Nova GPU driver.\n");
+    }
+}
+
+#[vtable]
+impl drm::drv::Driver for NovaDriver {
+    type Data = Arc<DeviceData>;
+    type File = File;
+    type Object = crate::gem::Object;
+
+    const INFO: drm::drv::DriverInfo = INFO;
+    const FEATURES: u32 = drv::FEAT_GEM;
+
+    kernel::declare_drm_ioctls! {
+        (NOVA_GETPARAM, drm_nova_getparam, ioctl::RENDER_ALLOW, File::get_param),
+        (NOVA_GEM_CREATE, drm_nova_gem_create, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_create),
+        (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_info),
+    }
+}
+
+pub(crate) struct NovaModule {
+    _registration: Pin<Box<driver::Registration<pci::Adapter<NovaDriver>>>>,
+}
+
+impl kernel::Module for NovaModule {
+    fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
+        let registration = driver::Registration::new_pinned(c_str!("nova"), module)?;
+
+        Ok(Self {
+            _registration: registration,
+        })
+    }
+}
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
new file mode 100644
index 000000000000..d649fa3973b5
--- /dev/null
+++ b/drivers/gpu/drm/nova/file.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::{NovaDevice, NovaDriver};
+use crate::gem;
+use kernel::{
+    alloc::flags::*,
+    drm::{self, device::Device as DrmDevice, gem::BaseObject},
+    prelude::*,
+    uapi,
+};
+
+pub(crate) struct File();
+
+/// Convenience type alias for our DRM `File` type
+pub(crate) type DrmFile = drm::file::File<File>;
+
+impl drm::file::DriverFile for File {
+    type Driver = NovaDriver;
+
+    fn open(dev: &DrmDevice<Self::Driver>) -> Result<Pin<Box<Self>>> {
+        dev_dbg!(dev.as_ref(), "drm::device::Device::open\n");
+
+        Ok(Box::into_pin(Box::new(Self(), GFP_KERNEL)?))
+    }
+}
+
+impl File {
+    /// IOCTL: get_param: Query GPU / driver metadata.
+    pub(crate) fn get_param(
+        dev: &NovaDevice,
+        getparam: &mut uapi::drm_nova_getparam,
+        _file: &DrmFile,
+    ) -> Result<u32> {
+        let data = dev.data().ok_or(ENODEV)?;
+        let pdev = &data.pdev;
+
+        getparam.value = match getparam.param as u32 {
+            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_create: Create a new DRM GEM object.
+    pub(crate) fn gem_create(
+        dev: &NovaDevice,
+        req: &mut uapi::drm_nova_gem_create,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        let obj = gem::object_new(dev, req.size.try_into()?)?;
+
+        let handle = obj.create_handle(file)?;
+        req.handle = handle;
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_info: Query GEM metadata.
+    pub(crate) fn gem_info(
+        _dev: &NovaDevice,
+        req: &mut uapi::drm_nova_gem_info,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        let bo = gem::lookup_handle(file, req.handle)?;
+
+        req.size = bo.size().try_into()?;
+
+        Ok(0)
+    }
+}
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
new file mode 100644
index 000000000000..51bc30c226e2
--- /dev/null
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    drm::{
+        gem,
+        gem::{BaseObject, ObjectRef},
+    },
+    prelude::*,
+};
+
+use crate::{
+    driver::{NovaDevice, NovaDriver},
+    file::DrmFile,
+};
+
+/// GEM Object inner driver data
+#[pin_data]
+pub(crate) struct DriverObject {}
+
+/// Type alias for the GEM object tyoe for this driver.
+pub(crate) type Object = gem::Object<DriverObject>;
+
+impl gem::BaseDriverObject<Object> for DriverObject {
+    fn new(dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+        dev_dbg!(dev.as_ref(), "DriverObject::new\n");
+        DriverObject {}
+    }
+}
+
+impl gem::DriverObject for DriverObject {
+    type Driver = NovaDriver;
+}
+
+/// Create a new DRM GEM object.
+pub(crate) fn object_new(dev: &NovaDevice, size: usize) -> Result<ObjectRef<Object>> {
+    let aligned_size = size.next_multiple_of(1 << 12);
+
+    if size == 0 || size > aligned_size {
+        return Err(EINVAL);
+    }
+
+    let gem = Object::new(dev, aligned_size)?;
+
+    Ok(ObjectRef::from_pinned_unique(gem))
+}
+
+/// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
+pub(crate) fn lookup_handle(file: &DrmFile, handle: u32) -> Result<ObjectRef<Object>> {
+    Object::lookup_handle(file, handle)
+}
diff --git a/drivers/gpu/drm/nova/gpu.rs b/drivers/gpu/drm/nova/gpu.rs
new file mode 100644
index 000000000000..b35d055e5322
--- /dev/null
+++ b/drivers/gpu/drm/nova/gpu.rs
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString, sync::Arc,
+};
+
+use core::fmt::Debug;
+
+/// Enum representing the GPU chipset.
+#[derive(Debug)]
+pub(crate) enum Chipset {
+    TU102 = 0x162,
+    TU104 = 0x164,
+    TU106 = 0x166,
+    TU117 = 0x167,
+    TU116 = 0x168,
+    GA102 = 0x172,
+    GA103 = 0x173,
+    GA104 = 0x174,
+    GA106 = 0x176,
+    GA107 = 0x177,
+    AD102 = 0x192,
+    AD103 = 0x193,
+    AD104 = 0x194,
+    AD106 = 0x196,
+    AD107 = 0x197,
+}
+
+/// Enum representing the GPU generation.
+#[derive(Debug)]
+pub(crate) enum CardType {
+    /// Turing
+    TU100 = 0x160,
+    /// Ampere
+    GA100 = 0x170,
+    /// Ada Lovelace
+    AD100 = 0x190,
+}
+
+/// Structure holding the metadata of the GPU.
+#[allow(dead_code)]
+pub(crate) struct GpuSpec {
+    /// Contents of the boot0 register.
+    boot0: u64,
+    card_type: CardType,
+    chipset: Chipset,
+    /// The revision of the chipset.
+    chiprev: u8,
+}
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[allow(dead_code)]
+pub(crate) struct Firmware {
+    booter_load: firmware::Firmware,
+    booter_unload: firmware::Firmware,
+    gsp: firmware::Firmware,
+}
+
+/// Structure holding the resources required to operate the GPU.
+#[allow(dead_code)]
+#[pin_data]
+pub(crate) struct Gpu {
+    spec: GpuSpec,
+    /// MMIO mapping of PCI BAR 0
+    bar: Devres<pci::Bar>,
+    fw: Firmware,
+}
+
+// TODO replace with something like derive(FromPrimitive)
+impl Chipset {
+    fn from_u32(value: u32) -> Option<Chipset> {
+        match value {
+            0x162 => Some(Chipset::TU102),
+            0x164 => Some(Chipset::TU104),
+            0x166 => Some(Chipset::TU106),
+            0x167 => Some(Chipset::TU117),
+            0x168 => Some(Chipset::TU116),
+            0x172 => Some(Chipset::GA102),
+            0x173 => Some(Chipset::GA103),
+            0x174 => Some(Chipset::GA104),
+            0x176 => Some(Chipset::GA106),
+            0x177 => Some(Chipset::GA107),
+            0x192 => Some(Chipset::AD102),
+            0x193 => Some(Chipset::AD103),
+            0x194 => Some(Chipset::AD104),
+            0x196 => Some(Chipset::AD106),
+            0x197 => Some(Chipset::AD107),
+            _ => None,
+        }
+    }
+}
+
+// TODO replace with something like derive(FromPrimitive)
+impl CardType {
+    fn from_u32(value: u32) -> Option<CardType> {
+        match value {
+            0x160 => Some(CardType::TU100),
+            0x170 => Some(CardType::GA100),
+            0x190 => Some(CardType::AD100),
+            _ => None,
+        }
+    }
+}
+
+impl GpuSpec {
+    fn new(bar: &Devres<pci::Bar>) -> Result<GpuSpec> {
+        let bar = bar.try_access().ok_or(ENXIO)?;
+        let boot0 = u64::from_le(bar.readq(0)?);
+        let chip = ((boot0 & 0x1ff00000) >> 20) as u32;
+
+        if boot0 & 0x1f000000 == 0 {
+            return Err(ENODEV);
+        }
+
+        let chipset = match Chipset::from_u32(chip) {
+            Some(x) => x,
+            None => return Err(ENODEV),
+        };
+
+        let card_type = match CardType::from_u32(chip & 0x1f0) {
+            Some(x) => x,
+            None => return Err(ENODEV),
+        };
+
+        Ok(Self {
+            boot0,
+            card_type,
+            chipset,
+            chiprev: (boot0 & 0xff) as u8,
+        })
+    }
+}
+
+impl Firmware {
+    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let fw_booter_load_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver,))?;
+        let fw_booter_unload_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
+        let fw_gsp_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
+
+        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
+        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
+        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
+
+        Ok(Firmware {
+            booter_load,
+            booter_unload,
+            gsp,
+        })
+    }
+}
+
+impl Gpu {
+    pub(crate) fn new(pdev: &pci::Device, bar: Devres<pci::Bar>) -> Result<Arc<Gpu>> {
+        let spec = GpuSpec::new(&bar)?;
+        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+
+        dev_info!(
+            pdev.as_ref(),
+            "NVIDIA {:?} ({:#x})",
+            spec.chipset,
+            spec.boot0
+        );
+
+        Arc::pin_init(try_pin_init!(Self { spec, bar, fw }), GFP_KERNEL)
+    }
+}
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
new file mode 100644
index 000000000000..48420267bcc1
--- /dev/null
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova GPU Driver
+
+mod driver;
+mod file;
+mod gem;
+mod gpu;
+
+use kernel::prelude::module;
+
+use driver::NovaModule;
+
+module! {
+    type: NovaModule,
+    name: "Nova",
+    author: "Danilo Krummrich",
+    description: "Nova GPU driver",
+    license: "GPL v2",
+}
diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
new file mode 100644
index 000000000000..3ca90ed9d2bb
--- /dev/null
+++ b/include/uapi/drm/nova_drm.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOVA_DRM_H__
+#define __NOVA_DRM_H__
+
+#include "drm.h"
+
+/* DISCLAIMER: Do not use, this is not a stable uAPI.
+ *
+ * This uAPI serves only testing purposes as long as this driver is still in
+ * development. It is required to implement and test infrastructure which is
+ * upstreamed in the context of this driver. See also [1].
+ *
+ * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
+ */
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * NOVA_GETPARAM_VRAM_BAR_SIZE
+ *
+ * Query the VRAM BAR size in bytes.
+ */
+#define NOVA_GETPARAM_VRAM_BAR_SIZE	0x1
+
+/**
+ * struct drm_nova_getparam - query GPU and driver metadata
+ */
+struct drm_nova_getparam {
+	/**
+	 * @param: The identifier of the parameter to query.
+	 */
+	__u64 param;
+
+	/**
+	 * @value: The value for the specified parameter.
+	 */
+	__u64 value;
+};
+
+/**
+ * struct drm_nova_gem_create - create a new DRM GEM object
+ */
+struct drm_nova_gem_create {
+	/**
+	 * @handle: The handle of the new DRM GEM object.
+	 */
+	__u32 handle;
+
+	/**
+	 * @pad: 32 bit padding, should be 0.
+	 */
+	__u32 pad;
+
+	/**
+	 * @size: The size of the new DRM GEM object.
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_nova_gem_info - query DRM GEM object metadata
+ */
+struct drm_nova_gem_info {
+	/**
+	 * @handle: The handle of the DRM GEM object to query.
+	 */
+	__u32 handle;
+
+	/**
+	 * @pad: 32 bit padding, should be 0.
+	 */
+	__u32 pad;
+
+	/**
+	 * @size: The size of the DRM GEM obejct.
+	 */
+	__u64 size;
+};
+
+#define DRM_NOVA_GETPARAM		0x00
+#define DRM_NOVA_GEM_CREATE		0x01
+#define DRM_NOVA_GEM_INFO		0x02
+
+/* Note: this is an enum so that it can be resolved by Rust bindgen. */
+enum {
+	DRM_IOCTL_NOVA_GETPARAM		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GETPARAM,
+						   struct drm_nova_getparam),
+	DRM_IOCTL_NOVA_GEM_CREATE	= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_CREATE,
+						   struct drm_nova_gem_create),
+	DRM_IOCTL_NOVA_GEM_INFO		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_INFO,
+						   struct drm_nova_gem_info),
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __NOVA_DRM_H__ */
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index ed42a456da2e..b9ab3406b2ce 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -8,5 +8,6 @@
 
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
+#include <uapi/drm/nova_drm.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.45.1

