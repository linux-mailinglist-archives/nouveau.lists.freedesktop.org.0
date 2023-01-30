Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFD680A60
	for <lists+nouveau@lfdr.de>; Mon, 30 Jan 2023 11:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56710E0C9;
	Mon, 30 Jan 2023 10:06:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E08A10E0C9
 for <nouveau@lists.freedesktop.org>; Mon, 30 Jan 2023 10:06:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96E2D60ED1;
 Mon, 30 Jan 2023 10:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFEAC433EF;
 Mon, 30 Jan 2023 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1675073159;
 bh=tezhIf+5X/dkXgEwDvVnOjeb58EHfZFDl/szooo/T0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWkPsELcM/+qBHI9gv7bubp51DtfAfjPqo2ZK8SalCeI/DNvj14Hov2rz5NHojcHw
 xmp/O+SZJhh1xTn9phKLFbu0JzcupuQej+pkafEbxNcxlCyIgIWhvakIEWfaU4tFT5
 u5LM9BecmLjlWcx31QKTyKE7pT9R6sF44piGRmUc=
Date: Mon, 30 Jan 2023 11:05:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Message-ID: <Y9eWhGj/ecjUcYO/@kroah.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
 <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
 <Y9VgjLneuqkl+Y87@kroah.com> <Y9V8UoUHm3rHcDkc@eldamar.lan>
 <51511ea3-431f-a45c-1328-5d1447e5169b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51511ea3-431f-a45c-1328-5d1447e5169b@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Jan 29, 2023 at 10:36:31PM +0100, Computer Enthusiastic wrote:
> Hello Greg,
> Hello Salvatore,
> 
> On 28/01/2023 20:49, Salvatore Bonaccorso wrote:
> > Hi Greg,
> > 
> > I'm not the reporter, so would like to confirm him explicitly, but I
> > believe I can give some context:
> > 
> > On Sat, Jan 28, 2023 at 06:51:08PM +0100, Greg KH wrote:
> > > On Sat, Jan 28, 2023 at 03:49:59PM +0100, Computer Enthusiastic wrote:
> > > > Hello,
> > > > 
> > > > The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fence in
> > > > nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it was merged
> > > > upstream.
> > > > 
> > > > The same patch [1] works with kernel 5.10.y, but it is not been merged
> > > > upstream so far.
> > > > 
> > > > According to Karol Herbst suggestion [2], I'm sending this message to ask
> > > > for merging it into 5.10 kernel.
> > > 
> > > We need to know the git commit id.  And have you tested it on 5.10.y?
> > > And why are you stuck on 5.10.y for this type of hardware?  Why not move
> > > to 5.15.y or 6.1.y?
> > 
> > This would be commit 6b04ce966a73 ("nouveau: explicitly wait on the
> > fence in nouveau_bo_move_m2mf") in mainline, applied in 6.0-rc3 and
> > backported to 5.19.6 and 5.15.64.
> > 
> > Computer Enthusiastic, tested it on 5.10.y:
> > https://lore.kernel.org/nouveau/CAHSpYy1mcTns0JS6eivjK82CZ9_ajSwH-H7gtDwCkNyfvihaAw@mail.gmail.com/
> > 
> > It was reported in Debian by the user originally as
> > https://bugs.debian.org/989705#69 after updating to the 5.10.y series in Debian
> > bullseye.
> > 
> > I guess the user could move to the next stable release Debian bookworm, once
> > it's released (it's currently in the last milestones to finalize, cf.
> > https://release.debian.org/ but we are not yet there). In the next release this
> > will be automatically be fixed indeed.
> > 
> > Computer Enthusiastic, can you confirm please to Greg in particular the first
> > questions, in particular to confirm the commit fixes the suspend issue?
> > 
> > Regards,
> > Salvatore
> 
> Thanks for replaying to my request: I really appreciate.
> 
> I apologize if my request was not formally correct.
> 
> The upstream kernel 5.10.y hangs on suspend or fails to resume if it is
> suspended to ram or suspended to disk (if nouveau kernel module is used with
> some nvidia graphic cards).
> 
> I confirm the commit ID 6b04ce966a73 (by Karol Herbst) fixes the
> aforementioned suspend to ram and suspend to disk issues with kernel 5.10.y
> . It tested it with my own computer.
> 
> The last kernel version I tested is 5.10.165, that I patched and installed
> in Debian Stable (11.6) that I'm currently running and that I tested again
> today.
> 
> It would be nice if the next point release of Debian Stable could ship a
> kernel that includes patch commit ID 6b04ce966a73 for the benefit of nouveau
> module users.

Ok, I've queued it up for 5.10.y now, thanks.

greg k-h
