Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B8197583
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7E96E0F6;
	Mon, 30 Mar 2020 07:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 612 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2020 03:51:57 UTC
Received: from yyz.mikelr.com (unknown
 [IPv6:2602:ffb6:2:0:f816:3eff:fe0d:377b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A066E471
 for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2020 03:51:57 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id BD0943D089;
 Wed,  4 Mar 2020 22:41:44 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org
Date: Wed,  4 Mar 2020 22:41:26 -0500
Message-Id: <20200305034126.6989-3-mikel@mikelr.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20200305034126.6989-1-mikel@mikelr.com>
References: <20200305034126.6989-1-mikel@mikelr.com>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: [Nouveau] [PATCH v2 2/2] PCI: Use ioremap(),
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Matthew Garrett <matthewgarrett@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

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
     ? register_client+0x34/0xe0
     ? register_client+0xab/0xe0
     r520_init+0x26/0x240 [radeon]
     radeon_device_init+0x533/0xa50 [radeon]
     radeon_driver_load_kms+0x80/0x220 [radeon]
     drm_dev_register+0xa7/0x180 [drm]
     radeon_pci_probe+0x10f/0x1a0 [radeon]
     pci_device_probe+0xd4/0x140
     really_probe+0x13d/0x3b0
     driver_probe_device+0x56/0xd0
     device_driver_attach+0x49/0x50
     __driver_attach+0x79/0x130
     ? device_driver_attach+0x50/0x50
     bus_for_each_dev+0x5b/0xa0
     driver_attach+0x19/0x20
     ? device_driver_attach+0x50/0x50
     bus_add_driver+0x117/0x1d0
     ? pci_bus_num_vf+0x20/0x20
     driver_register+0x66/0xb0
     ? 0xf80f4000
     __pci_register_driver+0x3d/0x40
     radeon_init+0x82/0x1000 [radeon]
     do_one_initcall+0x42/0x200
     ? kvfree+0x25/0x30
     ? __vunmap+0x206/0x230
     ? kmem_cache_alloc_trace+0x16f/0x220
     ? do_init_module+0x21/0x220
     do_init_module+0x50/0x220
     load_module+0x1f26/0x2200
     sys_init_module+0x12d/0x160
     do_fast_syscall_32+0x82/0x250
     entry_SYSENTER_32+0xa5/0xf8

Fix the issue by using ioremap() instead of phys_to_virt() in
pci_platform_rom().

Now that pci_platform_rom() creates a new mapping to access the ROM
image, update all callers to remove this mapping after extracting the
BIOS.

Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c             |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 11 ++++++++++-
 drivers/gpu/drm/radeon/radeon_bios.c                 |  1 +
 drivers/pci/rom.c                                    |  9 ++++++---
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 50dff69a0f6e..ea6a1fa98ad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -207,6 +207,7 @@ static bool amdgpu_read_platform_bios(struct amdgpu_device *adev)
 		return false;
 
 	memcpy_fromio(adev->bios, bios, size);
+	iounmap(bios);
 
 	if (!check_atom_bios(adev->bios, size)) {
 		kfree(adev->bios);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da09dc5f..8a60a0db7b14 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -111,11 +111,20 @@ platform_init(struct nvkm_bios *bios, const char *name)
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
index c3ae4c92a115..712b88d88957 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -123,6 +123,7 @@ static bool radeon_read_platform_bios(struct radeon_device *rdev)
 		return false;
 
 	memcpy_fromio(rdev->bios, bios, size);
+	iounmap(bios);
 
 	if (size == 0 || rdev->bios[0] != 0x55 || rdev->bios[1] != 0xaa) {
 		kfree(rdev->bios);
diff --git a/drivers/pci/rom.c b/drivers/pci/rom.c
index 137bf0cee897..b38257d23e6e 100644
--- a/drivers/pci/rom.c
+++ b/drivers/pci/rom.c
@@ -197,16 +197,19 @@ void pci_unmap_rom(struct pci_dev *pdev, void __iomem *rom)
 EXPORT_SYMBOL(pci_unmap_rom);
 
 /**
- * pci_platform_rom - provides a pointer to any ROM image provided by the
- * platform
+ * pci_platform_rom - ioremap() the ROM image provided by the platform
  * @pdev: pointer to pci device struct
  * @size: pointer to receive size of pci window over ROM
+ *
+ * Return: kernel virtual pointer to image of ROM
+ *
+ * The caller is responsible for removing the mapping with iounmap()
  */
 void __iomem *pci_platform_rom(struct pci_dev *pdev, size_t *size)
 {
 	if (pdev->rom && pdev->romlen) {
 		*size = pdev->romlen;
-		return phys_to_virt((phys_addr_t)pdev->rom);
+		return ioremap(pdev->rom, pdev->romlen);
 	}
 
 	return NULL;
-- 
2.13.7

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
