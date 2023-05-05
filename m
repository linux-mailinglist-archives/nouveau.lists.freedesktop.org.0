Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEB6F7BC3
	for <lists+nouveau@lfdr.de>; Fri,  5 May 2023 06:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8242110E55B;
	Fri,  5 May 2023 04:11:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDC610E55B
 for <nouveau@lists.freedesktop.org>; Fri,  5 May 2023 04:11:12 +0000 (UTC)
Received: from merlin by mail1.merlins.org with local (Exim 4.94.2 #2)
 id 1pumml-0004uO-4s by authid <merlin>; Thu, 04 May 2023 21:11:11 -0700
Date: Thu, 4 May 2023 21:11:11 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Steven Kucharzyk <stvr_8888@comcast.net>
Message-ID: <20230505041111.GS13387@merlins.org>
References: <20230504233216.GJ1191678@merlins.org>
 <20230504224321.2b8b2f54@n2pa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504224321.2b8b2f54@n2pa>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: marc@merlins.org
Subject: Re: [Nouveau] 6.2 still cannot get hdmi display out on Thinkpad P73
 Quadro RTX 4000 Mobile/TU104
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 10:43:21PM -0500, Steven Kucharzyk wrote:
> On Thu, 4 May 2023 16:32:16 -0700
> Marc MERLIN <marc_nouveau@merlins.org> wrote:
> 
> > Hi again, I just saw a bunch of commits from all of you (thanks), but
> > still can't find info if my thinkpad P73 with Quadro RTX 4000
> > Mobile/TU104 is meant to be supported, or not, and if so, how I can
> > best report issues beyond what I've already sent.
> > 
> > The intel graphics works great thankfully, but I do need to use HDMI
> > out from time to time, which is only wired to the nvidia chip
> > unfortunately.
> > 
> > Guidance would be very appreciated.
> 
> I'm going to take a leap here ...
> 
> any UEFI ? TSM ?
 
Yes, I boot with UEFI.  Not sure what TSM means

> In the spec's that I looked at Lenovo's ThinkPad P73 FHD / 4K UHD
> personally I found it interesting that the "up to" Nvidia Quadro RTX
> 5000 was listed as "Discrete" vs. the UHD Graphics 620 (24 EUs) as
> "Integrated".  Are you 4K?

4K correct. As far as I understand, I have integrated intel graphics,
which is what I use every day, and that nvidia chip I never use and have
no real need for, except that external display ports are only connected
to that chip, so I have to use it in that case.
I had a P70 with the same config and was able to get nouveau working on
it and HDMI out, but P73 uses different chips and never fully got it
working (well, the monitor turns on and I see a mouse cursor, so
something works)
https://docs.google.com/document/d/1GnyBE1xc4qx3EF-IcUOwr7d9D8Npzy63Pwj-joOw86o/view#heading=h.tmm3ssfqplva
explains how I got it to work on P70

> HDMI ... I have had issues with Laps + HDMI when plugging the cable
> into an already turn-on monitor. I have taken DVI-I > DP cables just to
> see ... Next I didn't see any reference to Nvidia drivers is that your
> option ? (I know, I live with bane of a "tainted kernel" because of
> them and flop back and forth to see how Nouveau is progressing)
 
I do not have plans to use the nvidia binary drivers and do want my
nvidia chip to be turned off all the time except when I need video out
(for battery reasons)

If you wanted context/more info:
https://www.spinics.net/lists/nouveau/msg11393.html
https://www.spinics.net/lists/nouveau/msg11394.html

and older from 2020:
https://www.spinics.net/lists/nouveau/msg05361.html

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/  
