Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F041741BA
	for <lists+nouveau@lfdr.de>; Fri, 28 Feb 2020 22:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B296F50D;
	Fri, 28 Feb 2020 21:59:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Fri, 28 Feb 2020 21:58:59 UTC
Received: from know-smtprelay-omc-11.server.virginmedia.net
 (know-smtprelay-omc-11.server.virginmedia.net [80.0.253.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E95B6F50D
 for <nouveau@lists.freedesktop.org>; Fri, 28 Feb 2020 21:58:59 +0000 (UTC)
Received: from [192.168.10.214] ([82.47.85.138]) by cmsmtp with ESMTPA
 id 7nZPjNr2H6cf47nZPjUKxo; Fri, 28 Feb 2020 21:53:20 +0000
X-Originating-IP: [82.47.85.138]
X-Authenticated-User: sboyce@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=OaYs8SbY c=1 sm=1 tr=0 a=mctQX8G8JfdR+oUIdXtpKQ==:117
 a=mctQX8G8JfdR+oUIdXtpKQ==:17 a=N659UExz7-8A:10 a=x7bEGLp0ZPQA:10
 a=VwQbUJbxAAAA:8 a=AC4NO0dKrlcA4nJGS5EA:9 a=pILNOxqGKmIA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blueyonder.co.uk;
 s=meg.feb2017; t=1582926800;
 bh=jPSFTNrs8kUGDMM2BN78qAdyl9phXjcGadNd5+jpIZg=;
 h=From:Subject:Reply-To:To:Date;
 b=pokfq7r9uaZaSsaQVRi26OY5K1vkXiy8YyUhmhgwGOQqguOL7VD9oJsdvxbkuzNNA
 3JkT8vTOWIiC0ClXMuaCfwmpZKakry37ev8jw/sAyf4scpzAgXq6Cd8a2FULoKHt+/
 eomCODvhihSjhmBkfWRTyWfoEiNwy3wxqC0nVUgZlWN6FBPDx6S25SoEEVoCZOM2e6
 YWRNgu9L4zm3SkNixT0TbY2lDeUTHW3witXyuVXOvLK/12EM7HPyP5xhBmH5OBuSsf
 L+iy7ahzXPiOzZ3DNyU4egM9oMcY/oAZgyPOU6PRGGMJt1JuVzyObKkJS+YyVGzv1v
 lrdS1HTKik5ow==
From: Sid Boyce <sboyce@blueyonder.co.uk>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Organization: blueyonder.co.uk
Message-ID: <f69d1012-b502-da2a-6a80-21981d661108@blueyonder.co.uk>
Date: Fri, 28 Feb 2020 21:53:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-GB
X-CMAE-Envelope: MS4wfNNrb/sysEEKHhxLLpYwCePXMTOtfn0aGjEm9/iim6+PkDStWnqOaUcQub+cR9T+s+4rhwRtlnsp60ESHGxE25V5nktEORmFr8XINVupMPI9kAYBZ0d0
 iCZujgHmgOQ4iey3iR0+rJHiYrqtJJufO543ZYcatdGBprKH7Py5kXZrtnYeZAWVmzr6xGlA+aIZTA==
Subject: [Nouveau] 5.6-rc3 nouveau failure, 5.6-rc2 OK
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
Reply-To: sboyce@blueyonder.co.uk
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

[94.455712] [T411] nouveau 0000:07:00.0 disp ctor failed, -12

Welcome to openSUSE Tumbleweed 20200224 - Kernel 5.6.0-rc3 (tty1)

ens3s0: 192.168.10.214 .......

login:


I can login here but X does not start -- lspci

07:00.0 VGA compatible controller: NVIDIA Corporation TU117 [GeForce GTX 
1650] (rev a1)

from dmesg:-

[Wed Feb 26 22:42:39 2020] nouveau 0000:07:00.0: NVIDIA TU117 (167000a1)
[Wed Feb 26 22:42:39 2020] nouveau 0000:07:00.0: bios: version 
90.17.2a.00.39
[Wed Feb 26 22:44:12 2020] nouveau 0000:07:00.0: disp ctor failed, -12
[Wed Feb 26 22:44:12 2020] nouveau: probe of 0000:07:00.0 failed with 
error -12


Another box with VGA compatible controller: NVIDIA Corporation GP107 
[GeForce GTX 1050 Ti] (rev a1) boots to graphical environment with 5.6-rc3.

tindog:~ # dmesg -T|grep nouveau
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: NVIDIA GF106 (0c3100a1)
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: bios: version 
70.26.37.00.01
[Mon Feb 24 12:50:16 2020] nouveau 0000:07:00.0: fb: 4096 MiB GDDR5
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: VRAM: 4096 MiB
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: GART: 1048576 MiB
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: TMDS table version 2.0
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB version 4.0
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 00: 
02000300 00000000
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 01: 
01000302 00020030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 02: 
04011380 00000000
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 03: 
08011382 00020030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB outp 04: 
02022362 00020010
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 00: 00001030
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 01: 00000100
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: DCB conn 02: 00002261
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: MM: using COPY0 
for buffer copies
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: DRM: allocated 
1920x1080 fb: 0x60000, bo 000000008db05e25
[Mon Feb 24 12:50:17 2020] fbcon: nouveaudrmfb (fb0) is primary device
[Mon Feb 24 12:50:17 2020] nouveau 0000:07:00.0: fb0: nouveaudrmfb frame 
buffer device

[Mon Feb 24 12:50:17 2020] [drm] Initialized nouveau 1.3.1 20120801 for 
0000:07:00.0 on minor 0

I have tried the new firmware, result is the same.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=2277987a593d54c1e922a9f25445802071015f42


Regards

Sid.

-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
