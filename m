Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411C1A55D5
	for <lists+nouveau@lfdr.de>; Sun, 12 Apr 2020 01:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAAE6E3D8;
	Sat, 11 Apr 2020 23:13:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1626E3A0;
 Sat, 11 Apr 2020 23:13:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FC6B20757;
 Sat, 11 Apr 2020 23:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646804;
 bh=VN1tik0rdM6XxLfL2lSm6cGNyAaPvCAp/XAjCQ4mijk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+5wiaO0OTpNWNtUz7GLnv274Xk9Jz06UUs4iVlun9geuvOTFBhd3IzJz7mxftmc1
 Fcr7OzqNSSoC1eE18nPEPOTNwDnpzXr0cBkCZgh9PWhdo8Zf5OlBwXY4esljdXBlWK
 gsPhH8q8xD9l/UO1YMXPbgTYYCg8CDZN7hjxIuxI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 11 Apr 2020 19:12:03 -0400
Message-Id: <20200411231203.25933-66-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231203.25933-1-sashal@kernel.org>
References: <20200411231203.25933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 4.19 66/66] PCI: Use ioremap(),
 not phys_to_virt() for platform ROM
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Mikel Rychliski <mikel@mikelr.com>

[ Upstream commit 72e0ef0e5f067fd991f702f0b2635d911d0cf208 ]

On some EFI systems, the video BIOS is provided by the EFI firmware.  The
boot stub code stores the physical address of the ROM image in pdev->rom.
Currently we attempt to access this pointer using phys_to_virt(), which
doesn't work with CONFIG_HIGHMEM.

On these systems, attempting to load the radeon module on a x86_32 kernel
can result in the following:

  BUG: unable to handle page fault for address: 3e8ed03c
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  *pde = 00000000
  Oops: 0000 [#1] PREEMPT SMP
  CPU: 0 PID: 317 Comm: systemd-udevd Not tainted 5.6.0-rc3-next-20200228 #2
  Hardware name: Apple Computer, Inc. MacPro1,1/Mac-F4208DC8, BIOS     MP11.88Z.005C.B08.0707021221 07/02/07
  EIP: radeon_get_bios+0x5ed/0xe50 [radeon]
  Code: 00 00 84 c0 0f 85 12 fd ff ff c7 87 64 01 00 00 00 00 00 00 8b 47 08 8b 55 b0 e8 1e 83 e1 d6 85 c0 74 1a 8b 55 c0 85 d2 74 13 <80> 38 55 75 0e 80 78 01 aa 0f 84 a4 03 00 00 8d 74 26 00 68 dc 06
  EAX: 3e8ed03c EBX: 00000000 ECX: 3e8ed03c EDX: 00010000
  ESI: 00040000 EDI: eec04000 EBP: eef3fc60 ESP: eef3fbe0
  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010206
  CR0: 80050033 CR2: 3e8ed03c CR3: 2ec77000 CR4: 000006d0
  Call Trace:
   r520_init+0x26/0x240 [radeon]
   radeon_device_init+0x533/0xa50 [radeon]
   radeon_driver_load_kms+0x80/0x220 [radeon]
   drm_dev_register+0xa7/0x180 [drm]
   radeon_pci_probe+0x10f/0x1a0 [radeon]
   pci_device_probe+0xd4/0x140

Fix the issue by updating all drivers which can access a platform provided
ROM. Instead of calling the helper function pci_platform_rom() which uses
phys_to_virt(), call ioremap() directly on the pdev->rom.

radeon_read_platform_bios() previously directly accessed an __iomem
pointer. Avoid this by calling memcpy_fromio() instead of kmemdup().

pci_platform_rom() now has no remaining callers, so remove it.

Link: https://lore.kernel.org/r/20200319021623.5426-1-mikel@mikelr.com
Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c      | 31 +++++++++++--------
 .../drm/nouveau/nvkm/subdev/bios/shadowpci.c  | 17 ++++++++--
 drivers/gpu/drm/radeon/radeon_bios.c          | 30 +++++++++++-------
 drivers/pci/rom.c                             | 17 ----------
 include/linux/pci.h                           |  1 -
 5 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index a5df80d50d447..6cf3dd5edffda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -191,30 +191,35 @@ static bool amdgpu_read_bios_from_rom(struct amdgpu_device *adev)
 
 static bool amdgpu_read_platform_bios(struct amdgpu_device *adev)
 {
-	uint8_t __iomem *bios;
-	size_t size;
+	phys_addr_t rom = adev->pdev->rom;
+	size_t romlen = adev->pdev->romlen;
+	void __iomem *bios;
 
 	adev->bios = NULL;
 
-	bios = pci_platform_rom(adev->pdev, &size);
-	if (!bios) {
+	if (!rom || romlen == 0)
 		return false;
-	}
 
-	adev->bios = kzalloc(size, GFP_KERNEL);
-	if (adev->bios == NULL)
+	adev->bios = kzalloc(romlen, GFP_KERNEL);
+	if (!adev->bios)
 		return false;
 
-	memcpy_fromio(adev->bios, bios, size);
+	bios = ioremap(rom, romlen);
+	if (!bios)
+		goto free_bios;
 
-	if (!check_atom_bios(adev->bios, size)) {
-		kfree(adev->bios);
-		return false;
-	}
+	memcpy_fromio(adev->bios, bios, romlen);
+	iounmap(bios);
 
-	adev->bios_size = size;
+	if (!check_atom_bios(adev->bios, romlen))
+		goto free_bios;
+
+	adev->bios_size = romlen;
 
 	return true;
+free_bios:
+	kfree(adev->bios);
+	return false;
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da09dc5f8..8d9812a51ef63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -101,9 +101,13 @@ platform_init(struct nvkm_bios *bios, const char *name)
 	else
 		return ERR_PTR(-ENODEV);
 
+	if (!pdev->rom || pdev->romlen == 0)
+		return ERR_PTR(-ENODEV);
+
 	if ((priv = kmalloc(sizeof(*priv), GFP_KERNEL))) {
+		priv->size = pdev->romlen;
 		if (ret = -ENODEV,
-		    (priv->rom = pci_platform_rom(pdev, &priv->size)))
+		    (priv->rom = ioremap(pdev->rom, pdev->romlen)))
 			return priv;
 		kfree(priv);
 	}
@@ -111,11 +115,20 @@ platform_init(struct nvkm_bios *bios, const char *name)
 	return ERR_PTR(ret);
 }
 
+static void
+platform_fini(void *data)
+{
+	struct priv *priv = data;
+
+	iounmap(priv->rom);
+	kfree(priv);
+}
+
 const struct nvbios_source
 nvbios_platform = {
 	.name = "PLATFORM",
 	.init = platform_init,
-	.fini = (void(*)(void *))kfree,
+	.fini = platform_fini,
 	.read = pcirom_read,
 	.rw = true,
 };
diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index 04c0ed41374f1..dd0528cf98183 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -104,25 +104,33 @@ static bool radeon_read_bios(struct radeon_device *rdev)
 
 static bool radeon_read_platform_bios(struct radeon_device *rdev)
 {
-	uint8_t __iomem *bios;
-	size_t size;
+	phys_addr_t rom = rdev->pdev->rom;
+	size_t romlen = rdev->pdev->romlen;
+	void __iomem *bios;
 
 	rdev->bios = NULL;
 
-	bios = pci_platform_rom(rdev->pdev, &size);
-	if (!bios) {
+	if (!rom || romlen == 0)
 		return false;
-	}
 
-	if (size == 0 || bios[0] != 0x55 || bios[1] != 0xaa) {
+	rdev->bios = kzalloc(romlen, GFP_KERNEL);
+	if (!rdev->bios)
 		return false;
-	}
-	rdev->bios = kmemdup(bios, size, GFP_KERNEL);
-	if (rdev->bios == NULL) {
-		return false;
-	}
+
+	bios = ioremap(rom, romlen);
+	if (!bios)
+		goto free_bios;
+
+	memcpy_fromio(rdev->bios, bios, romlen);
+	iounmap(bios);
+
+	if (rdev->bios[0] != 0x55 || rdev->bios[1] != 0xaa)
+		goto free_bios;
 
 	return true;
+free_bios:
+	kfree(rdev->bios);
+	return false;
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/pci/rom.c b/drivers/pci/rom.c
index 137bf0cee897c..8fc9a4e911e3a 100644
--- a/drivers/pci/rom.c
+++ b/drivers/pci/rom.c
@@ -195,20 +195,3 @@ void pci_unmap_rom(struct pci_dev *pdev, void __iomem *rom)
 		pci_disable_rom(pdev);
 }
 EXPORT_SYMBOL(pci_unmap_rom);
-
-/**
- * pci_platform_rom - provides a pointer to any ROM image provided by the
- * platform
- * @pdev: pointer to pci device struct
- * @size: pointer to receive size of pci window over ROM
- */
-void __iomem *pci_platform_rom(struct pci_dev *pdev, size_t *size)
-{
-	if (pdev->rom && pdev->romlen) {
-		*size = pdev->romlen;
-		return phys_to_virt((phys_addr_t)pdev->rom);
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL(pci_platform_rom);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index b1f297f4b7b0b..993051f60a009 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1141,7 +1141,6 @@ int pci_enable_rom(struct pci_dev *pdev);
 void pci_disable_rom(struct pci_dev *pdev);
 void __iomem __must_check *pci_map_rom(struct pci_dev *pdev, size_t *size);
 void pci_unmap_rom(struct pci_dev *pdev, void __iomem *rom);
-void __iomem __must_check *pci_platform_rom(struct pci_dev *pdev, size_t *size);
 
 /* Power management related routines */
 int pci_save_state(struct pci_dev *dev);
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
