Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CD1E9A00
	for <lists+nouveau@lfdr.de>; Sun, 31 May 2020 21:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE6B89AC6;
	Sun, 31 May 2020 19:05:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2032 seconds by postgrey-1.36 at gabe;
 Sun, 31 May 2020 19:05:09 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD1A89AC6
 for <nouveau@lists.freedesktop.org>; Sun, 31 May 2020 19:05:09 +0000 (UTC)
Received: from c-24-5-124-255.hsd1.ca.comcast.net ([24.5.124.255]:41138
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1jfSjr-0006rP-CH by authid <merlins.org> with srv_auth_plain;
 Sun, 31 May 2020 11:31:15 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1jfSjr-0006tr-0F; Sun, 31 May 2020 11:31:15 -0700
Date: Sun, 31 May 2020 11:31:15 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Karol Herbst <kherbst@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20200531183115.GA1128@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
 <CACO55tsvY0t_z986VVoYCvxuBASdZ+rQcDtZ_dAtQR60NLmQQw@mail.gmail.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 24.5.124.255
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] 5.5 kernel: using nouveau or something else just long
 enough to turn off Quadro RTX 4000 Mobile for hybrid graphics?
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, May 30, 2020 at 07:32:16PM +0200, Karol Herbst wrote:
> > 5.5.11. I can put 5.6 if needed.
> 
> please do. 5.5 is EOL and 5.4 and 5.6 got the runpm fixes in recent releases.

Done, just went to 5.6.15, thanks.

> no. It forces the audio device to be always on when on AC. there are
> some sound power settings.
> 
> SOUND_POWER_SAVE_CONTROLLER=Y
> SOUND_POWER_SAVE_ON_AC=1
> SOUND_POWER_SAVE_ON_BAT=1

Thank you Karol and Ilia for the kind help, this totally worked.
I filed a documentation bug on https://github.com/linrunner/TLP/issues/495
this will hopefully help other people.

In other great news, I was able to mirror my display on HDMI through
nouveau on the new kernel, thank you!

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x43 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 3 outputs: 1 associated providers: 0 name:modesetting
Provider 1: id: 0xf1 cap: 0x2, Sink Output crtcs: 4 outputs: 5 associated providers: 0 name:modesetting
xrandr --setprovideroutputsource 1 0

[42753.806113] nouveau 0000:01:00.0: DRM: allocated 2560x1600 fb: 0x200000, bo 00000000e75d7ede
[42753.806248] nouveau 0000:01:00.0: fb1: nouveaudrmfb frame buffer device

Thaks much,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
