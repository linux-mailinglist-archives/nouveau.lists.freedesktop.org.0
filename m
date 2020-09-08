Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD42607D0
	for <lists+nouveau@lfdr.de>; Tue,  8 Sep 2020 02:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F476E0FE;
	Tue,  8 Sep 2020 00:51:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1334 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 00:51:51 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075D56E0FE
 for <nouveau@lists.freedesktop.org>; Tue,  8 Sep 2020 00:51:51 +0000 (UTC)
Received: from c-24-5-124-255.hsd1.ca.comcast.net ([24.5.124.255]:47962
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1kFRWS-00042o-U8 by authid <merlins.org> with srv_auth_plain
 for <nouveau@lists.freedesktop.org>; Mon, 07 Sep 2020 17:30:08 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <merlin@merlins.org>) id 1kFRWS-0001kP-NG
 for nouveau@lists.freedesktop.org; Mon, 07 Sep 2020 17:30:08 -0700
Resent-From: Marc MERLIN <marc@merlins.org>
Resent-Date: Mon, 7 Sep 2020 17:30:08 -0700
Resent-Message-ID: <20200908003008.GE20064@merlins.org>
Resent-To: nouveau@lists.freedesktop.org
Date: Mon, 7 Sep 2020 17:29:35 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20200908002935.GD20064@merlins.org>
References: <20191004123947.11087-1-mika.westerberg@linux.intel.com>
 <20191004123947.11087-2-mika.westerberg@linux.intel.com>
 <20200808202202.GA12007@merlins.org>
 <20200906181852.GC13955@merlins.org>
 <CACO55tsodfUGVUjFw9=smFOhp_oXP8zWY_9+vL+iiPZhKJdtyg@mail.gmail.com>
 <20200907205825.GB20064@merlins.org>
 <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 24.5.124.255
X-SA-Exim-Mail-From: marc@merlins.org
Subject: Re: [Nouveau] pcieport 0000:00:01.0: PME: Spurious native interrupt
 (nvidia with nouveau and thunderbolt on thinkpad P73)
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 01:51:19AM +0200, Karol Herbst wrote:
> oh, I somehow missed that "disp ctor failed" message. I think that
> might explain why things are a bit hanging. From the top of my head I
> am not sure if that's something known or something new. But just in
> case I CCed Lyude and Ben. And I think booting with
> nouveau.debug=disp=trace could already show something relevant.

Thanks.
I've added that to my boot for next time I reboot.

I'm moving some folks to Bcc now, and let's remove the lists other than
nouveau on followups (lkml and pci). I'm just putting a warning here
so that it shows up in other list archives and anyone finding this
later knows that they should look in the nouveau archives for further
updates/resolution.

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
