Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BC30800D
	for <lists+nouveau@lfdr.de>; Thu, 28 Jan 2021 21:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786016E218;
	Thu, 28 Jan 2021 20:59:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281B66E0F7
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jan 2021 20:59:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6875F64DDE;
 Thu, 28 Jan 2021 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611867587;
 bh=I/Eo/ckFo/UmLLq/4F+ksUbGqF3NvUqqpdVR1dzGu2Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lFzgJrI60IS7FZ9jt4yG9eaeDFmWJXV9IQ3UGRKicN9QWr0GKbOkcsiXIGtxXZ2J5
 bMv/PHYsZtmIe6aHHQBZC2v38jGMwjuDl1Ph55nA56rDVbvRh4caNRwpWKxls0VMp6
 FRGr1hIxzD+4PTuY37qCJqcL6EXQXN4CEZuR1Ed2rikDm/oH8ISVusYXGRXI9Ag0YB
 57WOrCp0TYgUSWD7pDazBiDIPhrqLHvx4ojGClOhWPfe6Dxw6txQLfCwYafuvVSq5U
 zFSd/Rp3PpQUCOqa9VAsK0tr/63WOcrDzxUcxWkUn8cvhqPUMmtZTiLW3H7V6jzEG0
 A3RqGbV2JErmQ==
Date: Thu, 28 Jan 2021 14:59:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc MERLIN <marc_nouveau@merlins.org>
Message-ID: <20210128205946.GA27855@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127213300.GA3046575@bjorn-Precision-5520>
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
Cc: nouveau@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 03:33:02PM -0600, Bjorn Helgaas wrote:
> On Sat, Dec 26, 2020 at 03:12:09AM -0800, Marc MERLIN wrote:
> > This started with 5.5 and hasn't gotten better since then, despite
> > some reports I tried to send.
> > 
> > As per my previous message:
> > I have a Thinkpad P70 with hybrid graphics.
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M600M] (rev a2)
> > that one works fine, I can use i915 for the main screen, and nouveau to
> > display on the external ports (external ports are only wired to nvidia
> > chip, so it's impossible to use them without turning the nvidia chip
> > on).
> >  
> > I now got a newer P73 also with the same hybrid graphics (setup as such
> > in the bios). It runs fine with i915, and I don't need to use external
> > display with nouveau for now (it almost works, but I only see the mouse
> > cursor on the external screen, no window or anything else can get
> > displayed, very weird).
> > 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
> >  
> > 
> > after boot, when it gets the right trigger (not sure which ones), it
> > loops on this evern 2 seconds, mostly forever.
> > 
> > I'm not sure if it's nouveau's fault or the kernel's PCI PME's fault, or something else.
> 
> IIUC there are basically two problems:
> 
>   1) A 2 minute delay during boot
>   2) Some sort of event every 2 seconds that kills your battery life
> 
> Your machine doesn't sound unusual, and I haven't seen a flood of
> similar reports, so maybe there's something unusual about your config.
> But I really don't have any guesses for either one.
> 
> It sounds like v5.5 worked fine and you first noticed the slow boot
> problem in v5.8.  We *could* try to bisect it, but I know that's a lot
> of work on your part.
> 
> Grasping for any ideas for the boot delay; could you boot with
> "initcall_debug" and collect your "lsmod" output?  I notice async_tx
> in some of your logs, but I have no idea what it is.  It's from
> crypto, so possibly somewhat unusual?

Another random thought: is there any chance the boot delay could be
related to crypto waiting for entropy?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
