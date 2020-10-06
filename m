Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA902853B7
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 23:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6296E595;
	Tue,  6 Oct 2020 21:13:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A406E06D
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 21:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602018816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiXnFN0sDB+DK1lfjfH0ccnZIGKSpIKgOlbB/HcoFeE=;
 b=MXc1zjCRz91fEvNvA+XQdDtoJdAHmw1HoVT31xMpmDGrFQBUXXWCySxZP85wT7kKTMEXr8
 uj8MtPHSz8f49Nxqujk9t/yFs091C61e+KzOdrt5CtushFDPMK9iXYjRpIUs7E+2rxaNx/
 nbAfTfPYbM5kyhqA/DJ0t6YwkgsgsEQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-WBwUqZubPXqKTC-5VqX9bg-1; Tue, 06 Oct 2020 17:13:35 -0400
X-MC-Unique: WBwUqZubPXqKTC-5VqX9bg-1
Received: by mail-qt1-f198.google.com with SMTP id v33so4987780qtd.3
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 14:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiXnFN0sDB+DK1lfjfH0ccnZIGKSpIKgOlbB/HcoFeE=;
 b=ckpPGNhXa3IbQWCqsaKSScHqZ2OPPQKAX9BZ6Igwx7qQl2UFXJibK//lnpNgwAuLAh
 zoAygphMDqQQY/cHVLBR0rNrWc9KBy57bz6DWqjfLSCKk6cw0uJBy/NirJzb2LlqNRzp
 gRdwa1vzZDAJyeRulvjqJ8HglN6sVItdaIfOO4Yh5jHFYNkJR1x00YC6OOZaemSoNZ5f
 ahhGlDil2gW3EcYquzz/cRX7+UGpZBaIDYourTga2XtNiU4RkYMdBe/cg4dx9YicDI4z
 y7EGcmDIPdCjU8c33OGX/CBB5bfqGrZMJrDzVicNZcdeDNmRrNxbxBQgbMepY7x7twFF
 PKkg==
X-Gm-Message-State: AOAM532tW0Pweu65jLIegHKsoHO4exwviBBXDNRiNpHbM/Unhn4zn5er
 tlTFuKuySTqjXd+iCfWzyzMAElA/P+i/n6yyFH5XuT7Dw931WLaqG83wExmH+hPrQ813Tf3ocPa
 NzqQdDadNSMUPdVMyoiqahiUutg==
X-Received: by 2002:ac8:24b9:: with SMTP id s54mr241396qts.138.1602018814440; 
 Tue, 06 Oct 2020 14:13:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2v6PQQY3j7duhFWO6S0w04Va0ifWn+CncoHnMd4N9nWOR+Z+F3ba1EANXdkOb9d4D84vV7A==
X-Received: by 2002:ac8:24b9:: with SMTP id s54mr241365qts.138.1602018814075; 
 Tue, 06 Oct 2020 14:13:34 -0700 (PDT)
Received: from xps13.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id h68sm3714277qkf.30.2020.10.06.14.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:13:33 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  6 Oct 2020 17:13:12 -0400
Message-Id: <20201006211313.49177-3-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006211313.49177-1-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
 <20201006211313.49177-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC PATCH v2 2/3] nouveau: Add kernel-docs for module
 parameters
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

In preparation for the nouveau kernel documentation page, add some
documentation for the supported module parameters. It would be ideal if
the value given to MODULE_PARM_DESC could be referenced in Sphinx to
auto-document these parameters for both readers of the kernel's Sphinx
project and users of modinfo, but that appears to require a bit of work
so for now this approach will do.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 162 ++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..8d5f17326910 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,27 +68,189 @@
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
+ * * NvAcrWpr (integer): This configuration option is for debugging signed
+ *   firmware blobs and is not for end users; defaults to -1
+ *
+ * * NvAcrWprCompare (boolean): This configuration option is for debugging
+ *   signed firmware blobs and is not for end users; defaults to false.
+ *
+ * * NvAcrWprPrevAddr (integer): This configuration option is for debugging signed
+ *   firmware blobs and is not for end users; defaults to 0.
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
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
