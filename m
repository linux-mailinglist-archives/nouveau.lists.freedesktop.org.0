Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436192E71F7
	for <lists+nouveau@lfdr.de>; Tue, 29 Dec 2020 16:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BF5892FE;
	Tue, 29 Dec 2020 15:52:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E229D892FE
 for <nouveau@lists.freedesktop.org>; Tue, 29 Dec 2020 15:52:02 +0000 (UTC)
Received: from aaubervilliers-653-1-146-240.w86-218.abo.wanadoo.fr
 ([86.218.37.240]:44390 helo=sauron.svh.merlins.org)
 by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1kuHI0-0000jm-Un by authid <merlins.org> with srv_auth_plain;
 Tue, 29 Dec 2020 07:52:00 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1kuHHz-0005Ee-LP; Tue, 29 Dec 2020 07:51:59 -0800
Date: Tue, 29 Dec 2020 07:51:59 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20201229155159.GG23389@merlins.org>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 86.218.37.240
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
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
Cc: nouveau@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Dec 26, 2020 at 03:12:09AM -0800, Ilia Mirkin wrote:
> > after boot, when it gets the right trigger (not sure which ones), it
> > loops on this evern 2 seconds, mostly forever.
> 
> The gpu suspends with runtime pm. And then gets woken up for some
> reason (could be something quite silly, like lspci, or could be
> something explicitly checking connectors, etc). Repeat.

Ah, fair point.  Could it be powertop even?
How would I go towards tracing that?
Sounds like this would be a problem with all chips if userspace is able
to wake them up every second or two with a probe. Now I wonder what
broken userspace I have that could be doing this.
 
> Display offload usually requires acceleration -- the copies are done
> using the DMA engine. Please make sure that you have firmware
> available (and a new enough mesa). The errors suggest that you don't
> have firmware available at the time that nouveau loads. Depending on
> your setup, that might mean the firmware has to be built into the
> kernel, or available in initramfs. (Or just regular filesystem if you
> don't use a complicated boot sequence. But many people go with distro
> defaults, which do have this complexity.)

Hi Ilia, thanks for your answer.

Do you think that could be a reason why the boot would hang for 2 full minutes at every
boot ever since I upgraded to 5.5?

Also, without wanting to sound like a full newbie, where is that
firmware you're talking about? In my kernel source?

Here's what I do have:
sauron:/usr/local/bin# dpkggrep nouveau
libdrm-nouveau2:amd64				install
xserver-xorg-video-nouveau			install

no nouveau-firmware package in debian:
sauron:/usr/local/bin# apt-cache search nouveau
bumblebee - NVIDIA Optimus support for Linux
libdrm-nouveau2 - Userspace interface to nouveau-specific kernel DRM services -- runtime
xfonts-jmk - Jim Knoble's character-cell fonts for X
xserver-xorg-video-nouveau - X.Org X server -- Nouveau display driver

No firmware file on my disk:
sauron:/usr/local/bin# find /lib/modules/5.9.11-amd64-preempt-sysrq-20190817/ /lib/firmware/ |grep nouveau
/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau
/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau/nouveau.ko
sauron:/usr/local/bin# 

The kernel module is in my initrd:
sauron:/usr/local/bin# dd if=/boot/initrd.img-5.9.11-amd64-preempt-sysrq-20190817 bs=2966528  skip=1 | gunzip | cpio -tdv | grep nouveau
drwxr-xr-x   1 root     root            0 Nov 30 15:40 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau
-rw-r--r--   1 root     root      3691385 Nov 30 15:35 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau/nouveau.ko
17+1 records in
17+1 records out
52566778 bytes (53 MB, 50 MiB) copied, 1.69708 s, 31.0 MB/s

What am I supposed to do/check next?

Note that ultimately I only need nouveau not to hang my boot 2mn and do
PM so that the nvidia chip goes to sleep since I don't use it.

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
