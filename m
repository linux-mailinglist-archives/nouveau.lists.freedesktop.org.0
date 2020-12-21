Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE22DFF11
	for <lists+nouveau@lfdr.de>; Mon, 21 Dec 2020 18:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1416E4AD;
	Mon, 21 Dec 2020 17:56:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405AD6E4AD
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 17:56:50 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id 73so3553115uac.8
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 09:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MrAF3XcfgmbCY17OqyOzfLrhkI98KCYJDR2DMtLfdY8=;
 b=ZMAwZZ+YW7SRb0uh3DJpMymyB8Te66vLe7iKFF9sAht7YsKq1vadHAyc3bP+ISXI8v
 i8qN5yM4sDL8FEfAjh0W+yqBjhNHw1EpHBgmkQwh4BcmisPKmiqVXjv6tF6bvl4/5l2m
 h4zFvKhQEPjQ2YYvE9+tVEzwOuMMo56rYt19RpyYtiMVIRQ2t7hz6F5vRN/qHZkPQQEu
 xwqbpszxFUbPL2j6yGSKeNt7EaxQb3cbon/TyxYc6LBkTxxcNYw5oBo3cczPKXTRaxAC
 igGRfhx2GYluobTdZzNJ6XgHmMSAUAj0HEDSwuYXlRpM6qzSR4pO5So01zN7YFZ6LkyK
 h4Uw==
X-Gm-Message-State: AOAM531md2em1JL9+prGfFSCiYsTooLU/XEvwTZ7drsudWGP47ltQ09L
 DbPoMk5T+oKC83NsQagIl1FKQZ9yypAEPNEHUF8=
X-Google-Smtp-Source: ABdhPJzVdL7B8bTZxy+rQMk6er8L4T5ie68H4w9L1UEygB7FM35lOkrdx7hEzcfKNr2eDQb6J0Pb9eQgDYeA07DY5rA=
X-Received: by 2002:ab0:1e4a:: with SMTP id n10mr13442742uak.98.1608573409390; 
 Mon, 21 Dec 2020 09:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
In-Reply-To: <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 21 Dec 2020 12:56:38 -0500
Message-ID: <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
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
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alan Stern <stern@rowland.harvard.edu>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> [+Cc nouveau]
>
> On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
> [snip]
> > > Quite possibly the system doesn't power up HDA controller when there's
> > > no external monitor.
> > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > Let me ask the user to confirm this.
> >
> > Yeah, it's the basic question whether the HD-audio is supposed to work
> > on this machine at all.  If yes, the current approach we take makes
> > less sense - instead we should rather make the HD-audio controller
> > working.
>
> Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
>
> > > > - The second problem is that pci_enable_device() ignores the error
> > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > >   problem.  So the driver believes as the PCI device gets enabled
> > > >   properly.
> > >
> > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > regression in pci_enable_device_bars") to fix UHCI controller.
> > >
> > > >
> > > > - The third problem is that HD-audio driver blindly believes the
> > > >   codec_mask read from the register even if it's a read failure as I
> > > >   already showed.
> > >
> > > This approach has least regression risk.
> >
> > Yes, but it assumes that HD-audio is really non-existent.
>
> I really don't know any good approach to address this.
> On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> driver will flag the magic bit to make HDA audio appear on the PCI
> bus.
> IIRC the current approach is to make nouveau and device link work.

I don't have the full context of this discussion, but the kernel
force-enables the HDA subfunction nowadays, irrespective of nouveau or
nvidia or whatever:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
