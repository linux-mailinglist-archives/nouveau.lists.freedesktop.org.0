Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201D4B3A20
	for <lists+nouveau@lfdr.de>; Sun, 13 Feb 2022 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D8410E238;
	Sun, 13 Feb 2022 08:29:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Sun, 13 Feb 2022 08:29:27 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA24A10E238;
 Sun, 13 Feb 2022 08:29:27 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5BEDA300002A0;
 Sun, 13 Feb 2022 09:20:56 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 496B22E6C05; Sun, 13 Feb 2022 09:20:56 +0100 (CET)
Date: Sun, 13 Feb 2022 09:20:56 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Message-ID: <20220213082056.GA23572@wunner.de>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
 <20220211193250.1904843-5-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-5-mario.limonciello@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH v3 04/12] PCI: Drop the `is_thunderbolt`
 attribute from PCI core
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

On Fri, Feb 11, 2022 at 01:32:42PM -0600, Mario Limonciello wrote:
> The `is_thunderbolt` attribute is currently a dumping ground for a
> variety of things.

It's not as arbitrary as it may seem.  Quite a bit of thought went into
the current design.


> Instead use the driver core removable attribute to indicate the
> detail a device is attached to a thunderbolt or USB4 chain.

You're missing the point that "is_thunderbolt" is set on the *controller*
(i.e. its upstream and downstream ports).

The controller itself is *not* removable if it's the host controller.

However a device can be assumed to be removable if it has an ancestor
which has the "is_thunderbolt" flag set.


>  static void pci_set_removable(struct pci_dev *dev)
>  {
>  	struct pci_dev *parent = pci_upstream_bridge(dev);
> +	u16 vsec;
> +
> +	/* Is the device a Thunderbolt controller? */
> +	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);

This doesn't make any sense because the host controller is not
removable.


> @@ -1860,7 +1855,6 @@ int pci_setup_device(struct pci_dev *dev)
>  	dev->cfg_size = pci_cfg_space_size(dev);
>  
>  	/* Need to have dev->cfg_size ready */
> -	set_pcie_thunderbolt(dev);
>  
>  	set_pcie_untrusted(dev);

Either drop the blank line or drop the code comment if set_pcie_untrusted()
doesn't need dev->cfg_size.


> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 57553f9b4d1d..04232fbc7d56 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return to_pci_dev(dev)->is_thunderbolt;
> +	return pci_is_thunderbolt_attached(to_pci_dev(dev));
>  }

No, the gmux driver changes its behavior if a Thunderbolt host
controller is present.  Not if there's a Thunderbolt-attached
device present.

Thanks,

Lukas
