Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19D599E21
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 17:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A856A10F0C1;
	Fri, 19 Aug 2022 15:30:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 19 Aug 2022 15:30:06 UTC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC8C10F0C1
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 15:30:06 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1oP3rq-0008mc-3g
 for nouveau@lists.freedesktop.org; Fri, 19 Aug 2022 17:25:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Fri, 19 Aug 2022 18:24:08 +0300
Message-ID: <tdo9up$t3e$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
Subject: [Nouveau] Quadro GPU shows as UNCLAIMED
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello

I have a Quadro T2000 Mobile that shows up as TU117GLM in lspci and as 
UNCLAIMED in lshw.

I can get display output, but for the primary display only (laptop LVDS 
display).

Is this expected, is this card unsupported please ? Is there something I 
can do ?

I have nothing about nouveau or NVIDIA in my dmesg output, except for 
audio HDA NVIDIA. Xorg log shows it is loading nouveau, but says "Failed 
to open drm device". nouveau lists no support for NV160 / TUxxx chips in 
Xorg startup log file (nothing above GPxxx).

nouveau shows up in the output of lsmod, with a count of 0.

Thank you,
Timothy Madden


Fedora release 36, kernel 5.18.17
xorg-x11-drv-nouveau 1.0.17 (3.fc36), Mesa 22.1.6

[timothy@fedora ~]$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation TU117GLM [Quadro 
T2000 Mobile / Max-Q] (rev a1)


[timothy@fedora ~]$ sudo lshw -c video
[sudo] password for timothy:
   *-display UNCLAIMED
        description: VGA compatible controller
        product: TU117GLM [Quadro T2000 Mobile / Max-Q]
        vendor: NVIDIA Corporation
        physical id: 0
        bus info: pci@0000:01:00.0
        version: a1
        width: 64 bits
        clock: 33MHz
        capabilities: pm msi pciexpress vga_controller bus_master cap_list
        configuration: latency=0
        resources: memory:b3000000-b3ffffff memory:70000000-7fffffff 
memory:80000000-81ffffff ioport:3000(size=128) memory:c0000-dffff


[timothy@fedora ~]$ lsmod | grep -i nouveau
nouveau              2416640  0
drm_ttm_helper         16384  1 nouveau
ttm                    86016  2 drm_ttm_helper,nouveau
mxm_wmi                16384  1 nouveau
drm_dp_helper         159744  1 nouveau
video                  57344  3 dell_wmi,dell_laptop,nouveau
wmi                    32768  8 
dell_wmi_sysman,intel_wmi_thunderbolt,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor,mxm_wmi,nouveau


[timothy@fedora ~]$ uname -a
Linux fedora 5.18.17-200.fc36.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Aug 11 
14:36:06 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
[

Xorg.0.log:
...
[    26.673] (==) Matched nouveau as autoconfigured driver 0
[    26.673] (==) Matched nv as autoconfigured driver 1
[    26.673] (==) Matched modesetting as autoconfigured driver 2
[    26.673] (==) Matched fbdev as autoconfigured driver 3
[    26.673] (==) Matched vesa as autoconfigured driver 4
[    26.673] (==) Assigned the driver to the xf86ConfigLayout
[    26.673] (II) LoadModule: "nouveau"
[    26.673] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    26.681] (II) Module nouveau: vendor="X.Org Foundation"
[    26.681] 	compiled for 1.20.14, module version = 1.0.17
[    26.681] 	Module class: X.Org Video Driver
[    26.681] 	ABI class: X.Org Video Driver, version 24.1
[    26.681] (II) LoadModule: "nv"
[    26.681] (WW) Warning, couldn't open module nv
[    26.681] (EE) Failed to load module "nv" (module does not exist, 0)
...
[    26.682] (II) NOUVEAU driver
[    26.682] (II) NOUVEAU driver for NVIDIA chipset families :
[    26.682] 	RIVA TNT            (NV04)
[    26.682] 	RIVA TNT2           (NV05)
[    26.682] 	GeForce 256         (NV10)
[    26.682] 	GeForce 2           (NV11, NV15)
[    26.682] 	GeForce 4MX         (NV17, NV18)
[    26.682] 	GeForce 3           (NV20)
[    26.682] 	GeForce 4Ti         (NV25, NV28)
[    26.682] 	GeForce FX          (NV3x)
[    26.682] 	GeForce 6           (NV4x)
[    26.682] 	GeForce 7           (G7x)
[    26.682] 	GeForce 8           (G8x)
[    26.682] 	GeForce 9           (G9x)
[    26.682] 	GeForce GTX 2xx/3xx (GT2xx)
[    26.682] 	GeForce GTX 4xx/5xx (GFxxx)
[    26.682] 	GeForce GTX 6xx/7xx (GKxxx)
[    26.682] 	GeForce GTX 9xx     (GMxxx)
[    26.682] 	GeForce GTX 10xx    (GPxxx)
[    26.682] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    26.682] (II) FBDEV: driver for framebuffer: fbdev
[    26.682] (II) VESA: driver for VESA chipsets: vesa
[    26.685] (EE) [drm] Failed to open DRM device for (null): -22
[    26.798] (EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -19
[    26.801] (II) modeset(0): using drv /dev/dri/card0
...

