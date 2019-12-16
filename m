Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790BD120FCC
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2019 17:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FA089664;
	Mon, 16 Dec 2019 16:42:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 16:42:39 UTC
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6789664
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2019 16:42:39 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 31852 invoked from network);
 16 Dec 2019 17:35:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1576514157; bh=dSNfHSE3qkEQbROHn1ox9GFaVG9pNyljTE6dwTK7xis=;
 h=From:Subject:To;
 b=cnVGmu9km5whjLBfLCrl+UqjGfayltju5zScn5gAH48YBJihmBifiE9nihNvcjUjx
 6Ep4h1TzffMdCOAHNn4cp2Jf1OfQfopVNDBoX06+iuOqUHJOuuWzhGj/NpursQ80sp
 G8OHpiEl86m7fnlc95eiWm/3ADSkzApBwj8OEw2U=
Received: from no-mans-land.m247.com (HELO me.smtp.wp.pl)
 (mszpak@wp.pl@[185.244.214.240]) (envelope-sender <mszpak@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <nouveau@lists.freedesktop.org>; 16 Dec 2019 17:35:57 +0100
From: =?UTF-8?Q?Marcin_Zaj=c4=85czkowski?= <mszpak@wp.pl>
To: nouveau@lists.freedesktop.org
Message-ID: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
Date: Mon, 16 Dec 2019 17:35:57 +0100
User-Agent: Thunderbird/60.0
MIME-Version: 1.0
Content-Language: en-US
X-WP-MailID: 809b4fe37c0c1e142c41f290ae22e902
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000002 [UdFB]                               
Subject: [Nouveau] Tracking down severe regression in 5.3-rc4/5.4 for TU116
 - assistance needed
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

Hi,

I've encountered a severe regression in TU116 (probably also TU117)
introduced in 5.3-rc4 (valid also for recent 5.4.2) [1]. The system
usually hangs on the subsequent graphic mode related operation (calling
xrandr after login is enough) with the following error:

> kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
...
> kernel: nouveau 0000:01:00.0: DRM: failed to idle channel 0 [DRM]
> kernel: nouveau 0000:01:00.0: i2c: aux 0007: begin idle timeout ffffffff
> kernel: nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
> kernel: ------------[ cut here ]------------
> kernel: nouveau 0000:01:00.0: timeout
> kernel: WARNING: CPU: 10 PID: 384 at drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/> 0xe0 [nouveau]

(detailed log in a corresponding issue - [1])

With earlier kernels there was no hardware acceleration for NVidia GTX
1660 Ti, but at least I could use nouveau to disable it (to save
battery, trees and lower temperature) or even have an external output
(with Wayland). Now, the system is unusable with nouveau :(.

I spent some time trying to narrow the scope using on the existing
kernel builds for Fedora. I was able to determine that the problem was
introduced between 5.3.0-0.rc3.git1.1 (commit 33920f1ec5bf - works fine)
and 5.3.0-0.rc4.git0.1 (tag v5.3-rc4 - fails with errors).

It's just a few days (7-11 Aug) and "only" around 250 commits. I went
through them, but (based on the commits name) I haven't seen any nouveau
related changes and in general no very suspected drm related changes.

> git log 33920f1ec5bf..v5.3-rc4 --stat


Maybe some of more nouveau/drm-experienced developers could take a look
at that to determine which commit could break it (to make it easier to
find out what should be fixed to prevent that regression)?


[1] -
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/516

Thanks in advance
Marcin
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
