Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D512C7BC6
	for <lists+nouveau@lfdr.de>; Mon, 30 Nov 2020 00:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300C26E222;
	Sun, 29 Nov 2020 23:02:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Tue, 24 Nov 2020 19:11:43 UTC
Received: from smtp120.ord1c.emailsrvr.com (smtp120.ord1c.emailsrvr.com
 [108.166.43.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1F289F61
 for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2020 19:11:43 +0000 (UTC)
X-Auth-ID: markh@compro.net
Received: by smtp16.relay.ord1c.emailsrvr.com (Authenticated sender:
 markh-AT-compro.net) with ESMTPSA id 420EEC01E2; 
 Tue, 24 Nov 2020 14:05:52 -0500 (EST)
To: nouveau@lists.freedesktop.org
From: Mark Hounschell <markh@compro.net>
Organization: Compro Computer Svcs.
Message-ID: <e2fffedf-c6d6-4597-8ee2-860933b4fb6e@compro.net>
Date: Tue, 24 Nov 2020 14:05:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Classification-ID: 6b330c2b-6752-4bec-9c68-e7206aece57e-1-1
X-Mailman-Approved-At: Sun, 29 Nov 2020 23:02:04 +0000
Subject: [Nouveau] Problem with kernel 5.10-rc5
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
Reply-To: markh@compro.net
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I am not subscribed to this mailing list so please CC me directly for 
any response.

I'm running an older "NVIDIA Corporation G70 [GeForce 7800 GT] (rev a1)" 
card in a newer BIOSTAR B550GTA MB. Kernel 5.10-rc5 does not work. I get 
no virtual consoles or X screen.

I have not tried any other RC versions. Only rc5. Kernel 5.9.10 works 
fine. I am running a SuSE Leap-15.2 system.

I have another machine with an NVIDIA Corporation GT218 [GeForce 210] 
(rev a2) that works just fine with 5.10-rc5.


On the broken machine the screen goes blank, the leds on the front turn 
orange as if the PC was turned off.

My dmesg seems to show the cause:

[    5.825702] fb0: switching to nouveaufb from VESA VGA
[    6.242991] nouveau 0000:14:00.0: vgaarb: deactivate vga console
[    6.243066] nouveau 0000:14:00.0: NVIDIA G70 (047200a1)
[    6.443671] nouveau 0000:14:00.0: bios: version 05.70.02.13.7b
[    6.443948] nouveau 0000:14:00.0: fb: 256 MiB GDDR3
[    6.498039] nouveau 0000:14:00.0: DRM: VRAM: 250 MiB
[    6.498041] nouveau 0000:14:00.0: DRM: GART: 512 MiB
[    6.498044] nouveau 0000:14:00.0: DRM: TMDS table version 1.1
[    6.498046] nouveau 0000:14:00.0: DRM: DCB version 3.0
[    6.498049] nouveau 0000:14:00.0: DRM: DCB outp 00: 01000300 00000028
[    6.498051] nouveau 0000:14:00.0: DRM: DCB outp 01: 03000302 00000000
[    6.498053] nouveau 0000:14:00.0: DRM: DCB outp 02: 04011310 00000028
[    6.498055] nouveau 0000:14:00.0: DRM: DCB outp 03: 04011312 00000000
[    6.498057] nouveau 0000:14:00.0: DRM: DCB outp 04: 020223f1 0040c080
[    6.498060] nouveau 0000:14:00.0: DRM: DCB conn 00: 1030
[    6.498062] nouveau 0000:14:00.0: DRM: DCB conn 01: 2130
[    6.498064] nouveau 0000:14:00.0: DRM: DCB conn 02: 0210
[    6.498065] nouveau 0000:14:00.0: DRM: DCB conn 03: 0211
[    6.498067] nouveau 0000:14:00.0: DRM: DCB conn 04: 0213
[    6.502949] nouveau 0000:14:00.0: DRM: Setting dpms mode 3 on TV 
encoder (output 4)
[    6.585845] nouveau 0000:14:00.0: DRM: failed to map fb: -28
[    6.585949] [drm] Initialized nouveau 1.3.1 20120801 for 0000:14:00.0 
on minor 0

If I can do anything else please let me know.

Regards
Mark

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
