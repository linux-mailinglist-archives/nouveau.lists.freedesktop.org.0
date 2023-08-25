Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F63787FFD
	for <lists+nouveau@lfdr.de>; Fri, 25 Aug 2023 08:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D5810E610;
	Fri, 25 Aug 2023 06:36:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Fri, 25 Aug 2023 06:36:32 UTC
Received: from out-59.mta1.migadu.com (out-59.mta1.migadu.com
 [IPv6:2001:41d0:203:375::3b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1014E10E60D
 for <nouveau@lists.freedesktop.org>; Fri, 25 Aug 2023 06:36:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692944857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8g1PhZtieFXqvl5KlmXpfelaKvpJdAuWlFNqp32lxU=;
 b=azk9oKl/yWYIN5PPkoo3zBSOa5qD4a5Ttwotj7deRwg4VxJLVd1VH9ZPjzSxR8PPOtGk7H
 2eXNsnzhwSuxKFP68ub1/EATKxmpRZkXRApbQsGsMiJuZEaOOoibeOK2+BNWPK3PdLGpfw
 qaDtANXtL8laXrkLljPHNF5ob99FzAU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Fri, 25 Aug 2023 14:27:13 +0800
Message-Id: <20230825062714.6325-5-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Subject: [Nouveau] [PATCH 4/5] drm/amdgpu: Use pci_get_base_class() to
 reduce duplicated code
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
Cc: alsa-devel@alsa-project.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change.

Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 ++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 +++++---------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index a5a2b06c6588..4f18af877105 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1389,14 +1389,11 @@ void amdgpu_acpi_detect(void)
 	struct pci_dev *pdev = NULL;
 	int ret;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
-		if (!atif->handle)
-			amdgpu_atif_pci_probe_handle(pdev);
-		if (!atcs->handle)
-			amdgpu_atcs_pci_probe_handle(pdev);
-	}
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
+			continue;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
 		if (!atif->handle)
 			amdgpu_atif_pci_probe_handle(pdev);
 		if (!atcs->handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 38ccec913f00..5bbb23e102ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -287,7 +287,11 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 	if (adev->flags & AMD_IS_APU)
 		return false;
 
-	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
+			continue;
+
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (!dhandle)
 			continue;
@@ -299,20 +303,6 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 		}
 	}
 
-	if (!found) {
-		while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
-			dhandle = ACPI_HANDLE(&pdev->dev);
-			if (!dhandle)
-				continue;
-
-			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-			if (ACPI_SUCCESS(status)) {
-				found = true;
-				break;
-			}
-		}
-	}
-
 	if (!found)
 		return false;
 	pci_dev_put(pdev);
-- 
2.34.1

