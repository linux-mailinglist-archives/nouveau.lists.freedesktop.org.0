Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A94B6458
	for <lists+nouveau@lfdr.de>; Tue, 15 Feb 2022 08:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E01310E3BB;
	Tue, 15 Feb 2022 07:29:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 81427 seconds by postgrey-1.36 at gabe;
 Tue, 15 Feb 2022 07:29:13 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E7210E3B2;
 Tue, 15 Feb 2022 07:29:13 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id E5202100D9410;
 Tue, 15 Feb 2022 08:29:11 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id C35C5254B5C; Tue, 15 Feb 2022 08:29:11 +0100 (CET)
Date: Tue, 15 Feb 2022 08:29:11 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Message-ID: <20220215072911.GA13892@wunner.de>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215000200.242799-1-mario.limonciello@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH v4 00/10] Overhaul `is_thunderbolt`
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
>  drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
>  drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
>  drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
>  drivers/pci/pci-acpi.c                  | 15 ++++-
>  drivers/pci/pci.c                       | 17 +++--
>  drivers/pci/probe.c                     | 52 ++++++++++++++-
>  drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
>  drivers/platform/x86/apple-gmux.c       |  2 +-
>  drivers/thunderbolt/nhi.h               |  2 -
>  include/linux/pci.h                     | 25 +-------
>  include/linux/pci_ids.h                 |  3 +
>  14 files changed, 173 insertions(+), 47 deletions(-)

That's an awful lot of additional LoC for what is primarily
a refactoring job with the intent to simplify things.

Honestly this looks like an attempt to fix something that
isn't broken.  Specifically, the is_thunderbolt bit apparently
can't be removed without adding new bits to struct pci_dev.
Not sure if that can be called progress.

Thanks,

Lukas
