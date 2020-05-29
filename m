Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EDA1F8557
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA266E48F;
	Sat, 13 Jun 2020 20:54:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBF66E965
 for <nouveau@lists.freedesktop.org>; Fri, 29 May 2020 19:46:06 +0000 (UTC)
Received: from merlin by mail1.merlins.org with local (Exim 4.92 #3)
 id 1jekxB-0007Du-8P by authid <merlin>; Fri, 29 May 2020 12:46:05 -0700
Date: Fri, 29 May 2020 12:46:05 -0700
From: Marc MERLIN <marc@merlins.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20200529194605.GB18804@merlins.org>
References: <20200529180315.GA18804@merlins.org>
 <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: marc@merlins.org
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
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

On Fri, May 29, 2020 at 02:53:51PM -0400, Ilia Mirkin wrote:
> > moving to new window moves the mouse, but not windows get displayed.
> 
> Do you see anything in dmesg after this is set up? I'd expect some
> errors about timeouts or something else.
 
Nothing other than what I pasted.

> Which kernel are you using? There have been some turing-specific fixes recently.

5.5.11. I can put 5.6 if needed.

> Also note that TLP has a problem where it forces the audio
> sub-function to always-on which prevents the GPU from suspending.

Ah, thanks for that.
I have
#RUNTIME_PM_DRIVER_BLACKLIST="amdgpu mei_me nouveau nvidia pcieport radeon"

sauron:~$ lspci |grep -i nvidia
01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)

So you're saying that I need to blacklist 01:00.1 and without that it hangs
when suspending the powered off nvidia chip, which is what I'm experiencing
as a hang when I unplug power?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/  
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
