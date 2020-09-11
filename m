Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290D2663A9
	for <lists+nouveau@lfdr.de>; Fri, 11 Sep 2020 18:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1F6EA9A;
	Fri, 11 Sep 2020 16:22:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE006EA9A
 for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2020 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599841322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TTt2g6qzppbIVu5OZGz2lV97qbqVgTeJVOiKCMY1NKo=;
 b=M3VLUIiHntatb9CnESsEVr4z3Sw2t3B61WzRjYE5FWJxYQTU4RBYpusp1NfMW2jD7oftfi
 gIhBMzEeDGqNCAdrWpdSEv8hNdU9TVEnR0S8nyhvWM0W6ILRbWEKK/qGItTWdTECNASCfu
 5MpzyPTdG0nZmxRMsj9+IIAsIc9BNDc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-V3x0sIoUMCeBfB6xPQjfiA-1; Fri, 11 Sep 2020 12:21:50 -0400
X-MC-Unique: V3x0sIoUMCeBfB6xPQjfiA-1
Received: by mail-qk1-f197.google.com with SMTP id 196so6227659qkn.6
 for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2020 09:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTt2g6qzppbIVu5OZGz2lV97qbqVgTeJVOiKCMY1NKo=;
 b=JoQgbEb5mAz+5eNz8WFrq8xUK5nJmkWDtcekRhAhxav1TBaSpJLrSQT2TB7b27kKrn
 k4519StFRigIYGUnFldEQehiTeGvwxTYrtqE7qb5wVi5d6BxV8kobQ2d8dYcHyqMJwxf
 qGDbxr8AXtJn+bbomAk6DD1iOZeb4+ucofdDtMCF6r++TKFKWs47mYtPtLNUuSvsXTAM
 JzQzWHBtYSEVRBtpWxjaK7uhlaxCH/CfgoIIXW6OxBreaRGJlo7pCoDu8l2E/FAjzATv
 whVWDlQ+yJMFSvVHzeItE3tH8F1NJeGqgaicuiQOOYQysjME66+v9qviiHHCY7Q+m7C7
 xArQ==
X-Gm-Message-State: AOAM530ERkw+W++eIDs7hJjozEL/oGhxjcRvV8jmvqReOIYCGkUIHqU6
 YXXjBIQ45OfSORpdw+wMbBngDxyYj4ehOjk/WPYQdlDwA+Nb1FblRrjFtHpj8LgaVZQr8WH/PdA
 /ykNlqxAWmYchvswefofr/DvrYg==
X-Received: by 2002:a0c:e649:: with SMTP id c9mr2571998qvn.16.1599841309964;
 Fri, 11 Sep 2020 09:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9/3cEYncQg9d2LS67X1NrTYinljotd64Zo5U8jnRNdSvigmVIjoMFDPgbV9mMYGz4aODzLw==
X-Received: by 2002:a0c:e649:: with SMTP id c9mr2571957qvn.16.1599841309445;
 Fri, 11 Sep 2020 09:21:49 -0700 (PDT)
Received: from dev.jcline.org.com ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id t140sm3391948qke.125.2020.09.11.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 09:21:48 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 11 Sep 2020 12:21:28 -0400
Message-Id: <20200911162128.405604-1-jcline@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC] Documentation: nouveau: Introduce some nouveau
 documentation
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Other gpu drivers have some driver-specific documentation, so it would
nice if nouveau did as well.

This adds a bare-bones ReStructured Text document with sections for
module parameter documentation, an overview of the driver architecture,
a section for internal API documentation, and a glossary for
nouveau-specific terms.

To make the document a little less bare, I've included docblocks for
module parameters in nouveau_drm.c, as well as a header (selected at
random) so reviewers can have a better idea of how this looks. The
module parameter documentation is based on the existing documentation on
nouveau.freedesktop.org/wiki/ along with my own research for the
currently undocumented options. The header documentation ranges from
wild speculation to placeholder text.

I'm interested in any and all feedback. Does the layout make sense, or
would folks prefer a multi-page document. How much of the documentation
I wrote is flat out wrong?

If you want to see the HTML output, but don't want to build the docs,
it's at https://www.jcline.org/docs/8fe0b0869644/gpu/nouveau.html.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 Documentation/gpu/drivers.rst                 |   1 +
 Documentation/gpu/nouveau.rst                 | 129 ++++++++++++++
 .../drm/nouveau/include/nvkm/engine/disp.h    |  35 ++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 157 ++++++++++++++++++
 4 files changed, 322 insertions(+)
 create mode 100644 Documentation/gpu/nouveau.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..783c749d12e0 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -9,6 +9,7 @@ GPU Driver Documentation
    i915
    mcde
    meson
+   nouveau
    pl111
    tegra
    tve200
diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
new file mode 100644
index 000000000000..7bbc2cd73e80
--- /dev/null
+++ b/Documentation/gpu/nouveau.rst
@@ -0,0 +1,129 @@
+=======
+Nouveau
+=======
+This document provides a general overview of the driver, contribution details,
+internal API documentation, and glossary. It is strictly for the nouveau kernel
+driver. The userspace side of nouveau is documented at the `nouveau freedesktop
+wiki <https://nouveau.freedesktop.org/wiki/>`_.
+
+If you'd like to improve this documentation, great! Refer to the :doc:`Sphinx
+introduction </doc-guide/sphinx>` and :doc:`/doc-guide/kernel-doc` documents
+for details on how to do so.
+
+Module Parameters
+=================
+A number of module parameters are supported. Each parameter requires a value.
+These can be passed via the kernel command line using the format
+"nouveau.<parameter-name>=<value>". Boolean values should use 1 for true and 0
+for false.
+
+.. kernel-doc:: drivers/gpu/drm/nouveau/nouveau_drm.c
+
+
+Driver Overview
+===============
+The driver is located in ``drivers/gpu/drm/nouveau/``.
+
+.. note:: The latest pending patches for nouveau are available as an
+   `out-of-tree driver <https://github.com/skeggsb/nouveau>`_.
+
+Within the driver, there are several distinct sections. The reason for this is
+that NVIDIA hardware is partitioned into "privileged" and "user" blocks.
+
+The general architecture is described in the diagram below.
+
+.. kernel-render:: DOT
+   :alt: Nouveau Architecture Diagram
+   :caption: Nouveau Architecture Diagram
+
+   digraph "Nouveau" {
+      node [shape=box]
+      "Userspace" -> "DRM APIs"
+      "Userspace" -> "NVIF APIs"
+      "DRM APIs" -> "NVIF APIs"
+      "NVIF APIs" -> "NVKM APIs"
+      "NVKM APIs" -> "Hardware-specific Interfaces"
+   }
+
+
+NVKM
+----
+The NVidia Kernel Module (NVKM) is responsible for the low-level resource
+management of the privileged portions of the hardware. Almost all direct
+register access is performed in this layer. The functionality of the underlying
+hardware is exposed by NVKM as objects of a particular class, and in general
+these are identified with the same class IDs that NVIDIA uses.
+
+Some classes, such as :term:`channels`, have a block of registers associated with
+them that are intended to be directly accessed by an unprivileged client. NVKM
+allows objects to be "mapped" by a client to support this.
+
+The NVKM layer sits closest to the hardware and services requests issued by
+clients.
+
+
+NVIF
+----
+Atop the NVKM sits the NVidia Interface (NVIF) library, which defines a client
+interface that can be used to interact with the NVKM server. NVIF is intended
+to be usable both in the kernel and in userspace. This is accomplished with
+drivers that implement the interface defined in struct nvif_driver. Clients
+within the kernel use with an NVIF client backed with
+struct nvif_driver_nvkm.
+
+This design allows userspace direct access to the registers of :term:`channels`
+it allocates and allows it to submit work to the GPU without going through the
+kernel.
+
+
+DRM
+---
+The DRM layer of nouveau uses the NVIF to implement the interfaces of a DRM
+driver, such as modesetting, command submission to :term:`channels`
+from userspace, synchronization between userspace clients, and so on.
+
+.. note:: All interaction with the NVKM layer inside the kernel should happen
+   through NVIF.  Historically this has not been the case, so there may still
+   be legacy code that bypasses NVIF and directly calls NVKM.
+
+Nouveau's DRM driver is defined in the aptly-named nouveau_drm.c file. The
+files in the driver directory's root provide all the functionality required for
+the DRM driver. Kernel mode-setting is implemented in the dispnv* directories
+and is abstracted in the ``nouveau_display.h`` interface.
+
+For details on what is required to implement these interfaces interfaces, refer
+to the :doc:`drm-internals`, :doc:`drm-kms`, and :doc:`drm-uapi` documents.
+
+
+API
+===
+This section includes the kernel-docs for nouveau APIs.
+
+
+NVKM
+----
+Privileged, low-level resource management interfaces.
+
+engine/disp.h
+~~~~~~~~~~~~~
+.. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+
+
+Glossary
+========
+There are a number of NVIDIA-specific terms in the code as well as the
+documentation.
+
+.. glossary::
+
+   EVO
+   NVD
+       In pre-Volta architectures, the Evolution (EVO) controller is used to
+       interact with display memory-mapped IO registers via a pushbuffer.  In
+       Volta architectures and newer, the NVDisplay controller takes the place
+       of the EVO controller, although it has slightly different semantics.
+
+   channels
+        Channels are hardware blocks that consumes methods from a
+        direct-memory-accessed command stream.
+
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index 5a96c942d912..76b90d7ddfc6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -1,22 +1,57 @@
 /* SPDX-License-Identifier: MIT */
+
+/**
+ * DOC: Overview
+ *
+ * Interfaces for working with the display engine.
+ */
+
 #ifndef __NVKM_DISP_H__
 #define __NVKM_DISP_H__
+
+/**
+ * nvkm_disp() - Get a &struct nvkm_disp from a &struct nvkm_engine.
+ *
+ * @p: A &struct nvkm_engine reference.
+ *
+ * Return: The &struct nvkm_disp that contains the given engine.
+ */
 #define nvkm_disp(p) container_of((p), struct nvkm_disp, engine)
 #include <core/engine.h>
 #include <core/event.h>
 
+/**
+ * struct nvkm_disp - Represents a display engine.
+ *
+ * This structure is for <some abstraction here>. It has <some assumptions
+ * about its usage here>.
+ */
 struct nvkm_disp {
+    /** @func: Chipset-specific vtable for manipulating the display. */
 	const struct nvkm_disp_func *func;
+
+    /** @engine: The engine for this display. */
 	struct nvkm_engine engine;
 
+    /** @head: list of heads attached to this display. */
 	struct list_head head;
+
+    /** @ior: List of IO resources for this display. */
 	struct list_head ior;
+
+    /** @outp: List of outputs for this display. */
 	struct list_head outp;
+
+    /** @conn: List of connectors for this display. */
 	struct list_head conn;
 
+    /** @hpd: An event that fires when something happens I guess. */
 	struct nvkm_event hpd;
+
+    /** @vblank: An event that fires and has some relation to the vblank. */
 	struct nvkm_event vblank;
 
+    /** @client: The oproxy (?) client for this display. */
 	struct nvkm_oproxy *client;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..c03c18eaee45 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,27 +68,184 @@
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 
+/**
+ * DOC: config (string)
+ *
+ * A configuration string used to adjust a variety of module behaviors. The
+ * value of this parameter should be a string of comma-separated key=value
+ * pairs.
+ *
+ * values marked as integers are parsed as hex when they include a leading 0x,
+ * octal when they include a leading 0, otherwise they are parsed as decimals.
+ *
+ * Supported key-value pairs include:
+ *
+ * * GP100MmuLayout (boolean): If false, the old pre-GP100 VMM backend is used;
+ *   defaults to true and is only valid on NV130-NV138 chips.
+ *
+ * * <engine-name> (boolean): disable the given engine; all engines are enabled
+ *   by default.
+ *
+ * * NvAcrWpr (integer): ; defaults to -1
+ * * NvAcrWprCompare (boolean): ; defaults to false.
+ * * NvAcrWprPrevAddr (integer): ; defaults to 0.
+ *
+ * * NvBar2Halve (boolean): Halve the BAR2 size; defaults to false.
+ *
+ * * NvFanPWM (boolean): Force PWM for the fan; default is to auto-detect.
+ *
+ * * NvForcePost (boolean): Force the device to perform a POST; defaults to false.
+ *
+ * * NvGrResetWar (boolean): Reset the GR for an extended period to work around
+ *   an issue where GR stops responding; defaults to true on certain Pascal
+ *   boards where it is a known problem.
+ *
+ * * NvGrUseFW (boolean): Load firmware for PGRAPH (valid on the NVC0, NVE0,
+ *   and NV110 families); defaults to false.
+ *
+ * * NvI2C (boolean): Use the nouveau-internal I2C bus driver rather than the
+ *   I2C bit-adapters; defaults to false.
+ *
+ * * NvMemExec (boolean): Perform memory reclocking; defaults to true.
+ *
+ * * NvMSI (boolean): Use MSI interrupts; defaults to true on chipsets that
+ *   support it..
+ *
+ * * NvMXMDCB (boolean): Sanitize DCB outputs from the VBIOS; defaults to true.
+ *
+ * * NvPCIE (boolean): Whether to use the PCI-E GART (valid on NV40 chips only);
+ *   defaults to true.
+ *
+ * * NvPmShowAll (boolean): Report all perfmon signals in queries; defaults to
+ *   false.
+ *
+ * * NvPmUnnamed (boolean): Use the raw signal number rather than the name in
+ *   perfmon queries; defaults to the value of NvPmShowAll.
+ *
+ * * NvPmEnableGating (boolean): Enable clockgating for chipsets that support
+ *   it; defaults to false.
+ *
+ * * War00C800_0 (boolean): Enables the PGOB work-around on all GK10[467]
+ *   boards; defaults to true.
+ *
+ * * MmuDebugBufferSize (integer): Size of the MUU debug buffers; defaults to
+ *   the framebuffer page size.
+ *
+ * * NvAGP (integer): Force a particular AGP mode (0 to disable).
+ *
+ * * NvChipset (integer): Override the detected chipset; useful for development.
+ *
+ * * NvFbBigPage (integer): Size of the framebuffer big page in bits
+ *   (e.g. 16 means 64KiB); default is chip-dependent.
+ *
+ * * NvBios (string): Specify the Video BIOS source; options include:
+ *
+ *   * "OpenFirmware"
+ *   * "PRAMIN"
+ *   * "PROM"
+ *   * "ACPI"
+ *   * "PCIROM"
+ *   * "PLATFORM"
+ *   * A file name passed on to request_firmware.
+ *
+ * * NvBoost (integer): Specify the Boost mode for Fermi and newer. Valid
+ *   options are:
+ *
+ *   * 0: base clocks (default)
+ *   * 1: boost clocks
+ *   * 2: max clocks
+ *
+ * * NvClkMode (string): Force a particular clock level on boot. This is
+ *   equivalent to passing both ``NvClkModeAC`` and ``NvClkModeDC``.
+ *
+ * * NvClkModeAC (string): Force a particular clock level when plugged in to a
+ *   power source.
+ *
+ * * NvClkModeDC (string): Force a particular clock level when running on
+ *   battery.
+ */
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
 
+/**
+ * DOC: debug (string)
+ *
+ * Like the "config" parameter, this is a string of comma-separated key=values.
+ * Valid keys include:
+ *
+ * * CLIENT
+ * * <subdevice>
+ *
+ * The list of current sub-device and engine names is in the %nvkm_subdev_name
+ * array and is enumerated in &enum nvkm_devidx.
+ *
+ * Valid values are log levels to use for messages from the given key:
+ *
+ * * fatal
+ * * error
+ * * warn
+ * * info
+ * * debug
+ * * trace
+ * * paranoia
+ * * spam
+ */
+
 MODULE_PARM_DESC(debug, "debug string to pass to driver core");
 static char *nouveau_debug;
 module_param_named(debug, nouveau_debug, charp, 0400);
 
+/**
+ * DOC: noaccel (boolean)
+ *
+ * Set to ``1`` to disable kernel/abi16 acceleration; defaults to ``0``
+ * (false).
+ */
 MODULE_PARM_DESC(noaccel, "disable kernel/abi16 acceleration");
 static int nouveau_noaccel = 0;
 module_param_named(noaccel, nouveau_noaccel, int, 0400);
 
+/**
+ * DOC: modeset (integer)
+ *
+ * Whether to enable the driver; defaults to automatically detecting whether it
+ * should be enabled. Valid values are:
+ *
+ * * ``0`` - The driver is disabled
+ * * ``1`` - The driver is enabled
+ * * ``2`` - The driver runs in headless mode.
+ */
 MODULE_PARM_DESC(modeset, "enable driver (default: auto, "
 		          "0 = disabled, 1 = enabled, 2 = headless)");
 int nouveau_modeset = -1;
 module_param_named(modeset, nouveau_modeset, int, 0400);
 
+/**
+ * DOC: atomic (boolean)
+ *
+ * Set to ``1`` to enable atomic modesetting support; defaults to ``0``
+ * (false).
+ */
 MODULE_PARM_DESC(atomic, "Expose atomic ioctl (default: disabled)");
 static int nouveau_atomic = 0;
 module_param_named(atomic, nouveau_atomic, int, 0400);
 
+/**
+ * DOC: runpm (integer)
+ *
+ * Control whether or not runtime power management is used. Valid values are:
+ *
+ * * ``0`` - Disables runtime power management
+ * * ``1`` - Forces runtime power management to be enabled
+ * * ``-1`` - Enables runtime power management for Optimus-enabled hardware
+ *   (default).
+ *
+ * .. warning:: Power management is a very experimental feature and is not
+ *	expected to work. If you decided to up-clock your GPU, please
+ *	be aware that your card may overheat. Check the temperature of your GPU
+ *	at all times!
+ */
 MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1)");
 static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
