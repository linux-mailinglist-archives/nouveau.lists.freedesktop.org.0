Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1217C224683
	for <lists+nouveau@lfdr.de>; Sat, 18 Jul 2020 00:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91396E11C;
	Fri, 17 Jul 2020 22:59:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2253D6E03C;
 Fri, 17 Jul 2020 22:59:11 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 807BA2070E;
 Fri, 17 Jul 2020 22:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595026750;
 bh=Si2p19g5Q2ejNUok1Tpdxy2XoGYOEq8JYIYD2SrPf2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Xa78DP6cTPQwIDB+zLOdMNLq6OUmpcDgXzo1DstH7/SEVTcIQwQCOAlIZy0/xo/s8
 WBsx7J7oBz8CAbGzB8qdJpOvBHGz/VNXFoeGmZq1s19GHQWZ3XrtSI2slMBi3OFVJy
 qEeUZaUUB6aFmqcwWeU3nuixS2elvzP7gtDjMtfA=
Date: Fri, 17 Jul 2020 17:59:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20200717225909.GA784064@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717144318.GP2722994@sasha-vm>
Subject: Re: [Nouveau] nouveau regression with 5.7 caused by "PCI/PM: Assume
 ports without DLL Link Active train links in 100 ms"
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
Cc: Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 stable@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 10:43:18AM -0400, Sasha Levin wrote:
> On Fri, Jul 17, 2020 at 02:43:52AM +0200, Karol Herbst wrote:
> > On Fri, Jul 17, 2020 at 1:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > > > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > Hi everybody,
> > > > >
> > > > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > > > GPU on one of my systems here. Even though the issue doesn't always
> > > > > happen I am quite confident this is the commit breaking it.
> > > > >
> > > > > I am still digging into the issue and trying to figure out what
> > > > > exactly breaks, but it shows up in different ways. Either we are not
> > > > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > > > Btw, this is also a system where our runtime power management issue
> > > > > shows up, so maybe there is indeed something funky with the bridge
> > > > > controller.
> > > > >
> > > > > Just pinging you in case you have an idea on how this could break Nouveau
> > > > >
> > > > > most of the times it shows up like this:
> > > > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > > >
> > > > > Sometimes it works at boot and fails at runtime resuming with random
> > > > > faults. So I will be investigating a bit more, but yeah... I am super
> > > > > sure the commit triggered this issue, no idea if it actually causes
> > > > > it.
> > > >
> > > > so yeah.. I reverted that locally and never ran into issues again.
> > > > Still valid on latest 5.7. So can we get this reverted or properly
> > > > fixed? This breaks runtime pm for us on at least some hardware.
> > > 
> > > Yeah, that stinks.  We had another similar report from Patrick:
> > > 
> > >   https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> > > 
> > > Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> > > DLL Link Active train links in 100 ms"), which Patrick found was
> > > backported to v5.4.49 as 828b192c57e8, and you found was backported to
> > > v5.7.6 as afaff825e3a4.
> > > 
> > > Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> > > still contains afaff825e3a4.
> > > 
> > > I guess in the absence of any other clues we'll have to revert it.
> > > I hate to do that because that means we'll have slow resume of
> > > Thunderbolt-connected devices again, but that's better than having
> > > GPUs completely broken.
> > > 
> > > Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> > > logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> > > original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> > > and to this thread?
> > > 
> > > There must be a way to fix the slow resume problem without breaking
> > > the GPUs.
> > > 
> > 
> > I wouldn't be surprised if this is related to the Intel bridge we
> > check against for Nouveau.. I still have to check on another laptop
> > with the same bridge our workaround was required as well but wouldn't
> > be surprised if it shows the same problem. Will get you the
> > information from both systems tomorrow then.
> 
> I take it that ec411e02b7a2 will be reverted upstream?

Yes, unless we have a better fix soon.  I applied the revert to my
for-linus branch, so it will appear in -next soon.  I think it's a
little late to get it in -rc5, so I'll probably ask Linus to pull it
next week for -rc6.

Bjorn
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
