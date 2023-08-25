Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BC787FFA
	for <lists+nouveau@lfdr.de>; Fri, 25 Aug 2023 08:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE710E611;
	Fri, 25 Aug 2023 06:36:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out-11.mta1.migadu.com (out-11.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490E910E60F
 for <nouveau@lists.freedesktop.org>; Fri, 25 Aug 2023 06:36:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692944846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z6lCf1m2RyO5hkgphNEZhqasAxN18arSPKN7RCy/gyY=;
 b=sioG6nFDTUAy8CFxpG2MThcPbp+5KyEr17L9Uls/hwtb2QPUXiazjl+Brl/nDImrMd+Hpl
 fDCVMataoUSDuIWTtNcfkr1kXbnEtIKwI7qjJqfvu4pQwod98SEZV7YZHEqi36V1RaNbfM
 u1kUllzdxvMc3XelSI1oDxUiV4dxKQM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Fri, 25 Aug 2023 14:27:09 +0800
Message-Id: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Subject: [Nouveau] [PATCH 0/5] Add the pci_get_base_class() helper and use it
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
 linux-pci@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is no function that can be used to get all PCI(e) devices in a
system by matching against its the PCI base class code only, while keep
the sub-class code and the programming interface ignored. Therefore, add
the pci_get_base_class() function to suit the need.

For example, if an application want to process all PCI(e) display devices
in a system, it can achieve such goal by writing the code as following:

    pdev = NULL;
    do {
        pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
        if (!pdev)
            break;

        do_something_for_pci_display_device(pdev);
    } while (1);

Sui Jingfeng (5):
  PCI: Add the pci_get_base_class() helper
  ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
  drm/nouveau: Use pci_get_base_class() to reduce duplicated code
  drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
  drm/radeon: Use pci_get_base_class() to reduce duplicated code

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 ++++-----------
 drivers/gpu/drm/nouveau/nouveau_acpi.c   | 11 +++------
 drivers/gpu/drm/radeon/radeon_bios.c     | 20 ++++-----------
 drivers/pci/search.c                     | 31 ++++++++++++++++++++++++
 include/linux/pci.h                      |  5 ++++
 sound/pci/hda/hda_intel.c                | 16 ++++--------
 7 files changed, 59 insertions(+), 55 deletions(-)

-- 
2.34.1

