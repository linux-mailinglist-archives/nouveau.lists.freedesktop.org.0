Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502922EE9FA
	for <lists+nouveau@lfdr.de>; Fri,  8 Jan 2021 00:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04596E5A0;
	Thu,  7 Jan 2021 23:52:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BF06E5A0
 for <nouveau@lists.freedesktop.org>; Thu,  7 Jan 2021 23:52:17 +0000 (UTC)
Received: from c-24-5-124-255.hsd1.ca.comcast.net ([24.5.124.255]:45860
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1kxf4g-00084L-6l by authid <merlins.org> with srv_auth_plain;
 Thu, 07 Jan 2021 15:52:14 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1kxTnD-0000Zl-R3; Thu, 07 Jan 2021 03:49:27 -0800
Date: Thu, 7 Jan 2021 03:49:27 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20210107114927.GS32533@merlins.org>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
 <20201229174750.GI23389@merlins.org>
 <20210104114955.GM32533@merlins.org>
 <CACO55tsdG37YKv7FV2er4hRnXk9vmwMbPuPptA+=ZtziWXC2+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tsdG37YKv7FV2er4hRnXk9vmwMbPuPptA+=ZtziWXC2+g@mail.gmail.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 24.5.124.255
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jan 04, 2021 at 02:28:37PM +0100, Karol Herbst wrote:
> mhh, that PCI config stuff should really not happen all the time, but
> it also doesn't appear to. The other thing I really don't know is, how
> well the runpm works with tools like TLP if there isn't only an audio
> device, but also the USB stuff and all the subdevices have to be
> turned off all the time in order for the GPU to stay powered down.
> 
> The firmware stuff is also just a functional problem, so you won't get
> display offloading, but it shouldn't drain your battery as long as
> nothing is connected. I'd check with "grep .
> /sys/bus/pci/devices/*/power/runtime_status" if all subdevices of the
> GPU are powered down, and check which one gets enabled regularly or
> something.

Well, all I can say is that without the firmware, my boot hung 2mn every
single time (I sent details in the logs upthread).

The battery draw issue was inconsistent. I haven't quite found what
triggers it yet.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
