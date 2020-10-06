Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049B2853B9
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 23:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2C06E59B;
	Tue,  6 Oct 2020 21:13:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B56A6E59B
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602018822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jK1N+Ns8gHxjITX3lGFVc0lDqCzUWXPGCqDKwARJgz0=;
 b=QZuyel7RmDRNO83UDYJJw9+EoLySm2Mhzbz3mro2uANpltuYGthtT08cmvGIxfn3AJJNuQ
 qvYXuYC9fWYhGVQB27Co4HkVzxO3Ji66RrgGXAQmKS8pxs7GjudJl6N1H/H+Qd/ASDMl1Z
 cx8e7SXluCsFs2WKs9mBx5YI3NRSI4o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-eeZdT9-UMciF6ZcOaRcRjw-1; Tue, 06 Oct 2020 17:13:36 -0400
X-MC-Unique: eeZdT9-UMciF6ZcOaRcRjw-1
Received: by mail-qv1-f71.google.com with SMTP id de12so201198qvb.12
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jK1N+Ns8gHxjITX3lGFVc0lDqCzUWXPGCqDKwARJgz0=;
 b=FEYZ0EwiH3xCsQsQemVyo21l7HEyoJeqhBP5IDAuB2drz+Ur2c5eUHfGKHFIa2U/iT
 fAWWsSW6P69hbAwQp6qAEmvXSqdh3pCYtaI7pg696dJd4K97vXounDfIxewLrFAsKMlS
 RBWXYWScSWXj9HvLq3ffm9wUJN1yctT+seJquPYyux3mdMg3XsO87+HRikazHONohNC6
 g4qDjzvqMQgwUlydvSpz7L4LjGPl8sRhrLNp1YYeyNeZ5WOOukC233yzCUtWjaUeKtEm
 ZAOagzDbpPASy8AfE1lO7XlHjh5CIuqtAaHg8TdrSoq+BM3IXitzL+5J9E84pgYyapnY
 Iu0w==
X-Gm-Message-State: AOAM530+5190KDrLyO5We5OEtFp4DehStWxjONFjZWmKhfs2fid1nOXf
 zKKl1yb3gD+Wd8q78cz2pPZrZE/7ixxrPCjhoiyTbYg0io0mo49xSqs7vxydIo1BxAQ3PyZl76z
 wEyZS2PVqLkhZbGOpGI1+4y2kPw==
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr178211qtr.385.1602018815571; 
 Tue, 06 Oct 2020 14:13:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTB7Pxzmx1zjaB82aD7e+QPzkSkBeq/X49RcavcT7MEYTHPFAp9TW4AYj2C11QFeLl5dbk3Q==
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr178192qtr.385.1602018815225; 
 Tue, 06 Oct 2020 14:13:35 -0700 (PDT)
Received: from xps13.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id h68sm3714277qkf.30.2020.10.06.14.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:13:34 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  6 Oct 2020 17:13:13 -0400
Message-Id: <20201006211313.49177-4-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006211313.49177-1-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
 <20201006211313.49177-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC PATCH v2 3/3] Documentation: nouveau: Introduce some
 nouveau documentation
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Other gpu drivers have some driver-specific documentation, so it would
nice if nouveau did as well.

This adds a bare-bones ReStructured Text document with sections for
module parameter documentation, an overview of the driver architecture,
a section for internal and external API documentation, and a glossary
for nouveau-specific terms.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 Documentation/gpu/drivers.rst |   1 +
 Documentation/gpu/nouveau.rst | 173 ++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
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
index 000000000000..84c8d601adca
--- /dev/null
+++ b/Documentation/gpu/nouveau.rst
@@ -0,0 +1,173 @@
+=======
+Nouveau
+=======
+Nouveau is the free/libre driver for NVIDIA GPUs. This documentation is for the
+kernel mode-setting driver, and is meant to complement the general `nouveau`_
+documentation, which contains end user documentation and a general overview of
+the project, and `envytools`_, which covers reverse-engineering and the
+hardware architecture of the individual card families. Finally, there is
+some `NVIDIA-provided documentation`_.
+
+Issues with this driver are tracked on Nouveau's freedesktop.org `issue
+tracker`_.
+
+If you'd like to improve this documentation, great! Refer to the :doc:`Sphinx
+introduction </doc-guide/sphinx>` and :doc:`/doc-guide/kernel-doc` documents
+for details on how to do so.
+
+
+Module Parameters
+=================
+A number of module parameters are provided to tweak the behavior of the driver.
+These are provided to ease debugging issues and users that need to set a
+parameter to fix an issue they are experiencing should report this as a bug on
+the `issue tracker`_.
+
+Each parameter requires a value. These can be passed via the kernel command
+line using the format "nouveau.<parameter-name>=<value>". Boolean values should
+use 1 for true and 0 for false.
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
+that NVIDIA hardware is partitioned into "privileged" and "user" blocks. For
+more details on the particulars of NVIDIA's hardware, consult `envytools`_.
+
+The general module architecture from userspace to the hardware lay is described
+in the diagram below.
+
+.. kernel-render:: DOT
+   :alt: Nouveau Software Architecture Diagram
+   :caption: Nouveau Software Architecture Diagram
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
+Public APIs
+===========
+This section covers userspace interfaces provided by nouveau. Like other DRM
+drivers, much of the interface exposed to userspace is documented in
+:doc:`drm-uapi`, but there are a few nouveau-specific interfaces.
+
+
+debugfs
+-------
+Nouveau exposes the some :doc:`DebugFS </filesystems/debugfs>` files. All files
+referenced are relative to ``dri/<card-id>``.
+
+
+crtc-N/nv_crc/flip_threshold
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+.. kernel-doc:: drivers/gpu/drm/nouveau/dispnv50/crc.c
+   :doc: nv_crc/flip_threshold
+
+
+Internal APIs
+=============
+The following sections document the internal interfaces and is useful only to
+nouveau developers.
+
+
+DRM
+---
+Code related to implementing the standard DRM interfaces is documented in this
+section.
+
+
+dispnv50/crc.h
+~~~~~~~~~~~~~~
+.. kernel-doc:: drivers/gpu/drm/nouveau/dispnv50/crc.h
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
+   EVO/NVD
+       In pre-Volta architectures, the Evolution (EVO) controller is used to
+       interact with display memory-mapped IO registers via a pushbuffer.  In
+       Volta architectures and newer, the NVDisplay controller takes the place
+       of the EVO controller, although it has slightly different semantics.
+
+   channels
+        Channels are hardware blocks that consumes methods from a
+        direct-memory-accessed command stream.
+
+   CRC notifier context
+        A shared DMA region programmed through the core :term:`EVO/NVD`
+        channel used to report frame CRCs.
+
+
+.. _nouveau: https://nouveau.freedesktop.org/
+.. _envytools: https://envytools.readthedocs.io/
+.. _issue tracker: https://gitlab.freedesktop.org/drm/nouveau/-/issues
+.. _NVIDIA-provided documentation: https://github.com/NVIDIA/open-gpu-doc
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
