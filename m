Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5D197585
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9A56E180;
	Mon, 30 Mar 2020 07:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from yyz.mikelr.com (unknown
 [IPv6:2602:ffb6:2:0:f816:3eff:fe0d:377b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4894E6E4F4
 for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2020 03:51:57 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 439B43D085;
 Wed,  4 Mar 2020 22:41:44 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org
Date: Wed,  4 Mar 2020 22:41:24 -0500
Message-Id: <20200305034126.6989-1-mikel@mikelr.com>
X-Mailer: git-send-email 2.13.7
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: [Nouveau] [PATCH v2 0/2] Fix loading of platform ROM from 32-bit EFI
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

This patch series fixes an oops when loading the radeon driver on old Macs
with a 32-bit EFI implementation.

Tested on a MacPro 1,1 with a Radeon X1900 XT card and 32-bit kernel.

Mikel Rychliski (2):
  drm/radeon: Stop directly referencing iomem
  PCI: Use ioremap(), not phys_to_virt() for platform ROM

 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c             |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 11 ++++++++++-
 drivers/gpu/drm/radeon/radeon_bios.c                 | 12 ++++++++----
 drivers/pci/rom.c                                    |  9 ++++++---
 4 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.13.7

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
