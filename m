Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFE15032D
	for <lists+nouveau@lfdr.de>; Mon,  3 Feb 2020 10:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239C26EB6D;
	Mon,  3 Feb 2020 09:18:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 62086 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2020 09:18:08 UTC
Received: from elasmtp-kukur.atl.sa.earthlink.net
 (elasmtp-kukur.atl.sa.earthlink.net [209.86.89.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981926EB6D
 for <nouveau@lists.freedesktop.org>; Mon,  3 Feb 2020 09:18:08 +0000 (UTC)
Received: from [24.144.102.41] (helo=[192.168.0.11])
 by elasmtp-kukur.atl.sa.earthlink.net with esmtpa (Exim 4)
 (envelope-from <mrmazda@earthlink.net>)
 id 1iyHiR-0006dt-V9; Sun, 02 Feb 2020 11:03:20 -0500
To: Dave <davidh1960@verizon.net>, nouveau@lists.freedesktop.org
References: <9e338d4b-cfc8-bb7b-06e5-09768b09daba.ref@verizon.net>
 <9e338d4b-cfc8-bb7b-06e5-09768b09daba@verizon.net>
From: Felix Miata <mrmazda@earthlink.net>
Organization: less than infinite
Message-ID: <cab3dcc8-e9bf-4a9d-a7c8-afcc842c497a@earthlink.net>
Date: Sun, 2 Feb 2020 11:03:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <9e338d4b-cfc8-bb7b-06e5-09768b09daba@verizon.net>
X-ELNK-Trace: 7235c9a3853724b974bf435c0eb9d4786b5145e7d43802eba502b9cc6ea76a912bab596ec98a168a350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.144.102.41
Subject: Re: [Nouveau] desktop hanging
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Dave composed on 2020-01-28 11:06 (UTC-0500):

> My driver and graphics card information is below. This configuration has 
> been working great (much better than the nvidia proprietary driver) 
> until I upgraded from kernel 5.0 to 5.3. The desktop keeps hanging every 
> few minutes (the mouse usually keeps working but windows, desktop, task 
> bar doesn't). Is this a known issue? Is there a fix coming for this?
 
> Thanks and let me know if you need any additional information. I have 
> currently backed out that kernel update but can reinstall if you need 
> additional details.

You could try the default DDX, which Mint's driver manager doesn't bother
offering. It's not a separate package to be installed. You already have it.
Simply remove nvidia-340 and xserver-xorg-video-nouveau and X should run it
automagically. I have probably the exact same card using it.

# inxi -V | head -n1
inxi 3.0.37-00 (2019-11-19)
big41:~ # inxi -GxxS
System:    Host: big41 Kernel: 5.3.18-lp152.1-default x86_64 bits: 64 compiler: gcc v: 7.5.0 Desktop: KDE 3 wm: kwin
           dm: N/A Distro: openSUSE Leap 15.2 Alpha
Graphics:  Device-1: NVIDIA G84 [GeForce 8600 GT] vendor: XFX Pine driver: nouveau v: kernel bus ID: 01:00.0
           chip ID: 10de:0402
           Display: server: X.Org 1.20.3 driver: modesetting unloaded: fbdev,vesa alternate: nouveau,nv,nvidia
           resolution: 1920x1200~60Hz
           OpenGL: renderer: llvmpipe (LLVM 7.0 128 bits) v: 3.3 Mesa 18.3.2 compat-v: 3.1 direct render: Yes
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
