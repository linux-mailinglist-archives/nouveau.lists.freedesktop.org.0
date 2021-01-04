Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF62E95C3
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 14:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66522890B6;
	Mon,  4 Jan 2021 13:21:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB39890B6
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vPrbs+ygK2nW6UXpFCX2PTOIhaEcotjknLDYayf1rbg=;
 b=XpuGHAl+hf++5izftZNm9Jvj68dr4XWKORkrET4DZxX//hngqn2bCp0puJjrCBYgel+scO
 RdLokMPy4KO5p/jChlUi0L4U8V2tOa4fMVuhudr5scyxyKvgyXPbCQYkSAscsOMoxu9/lX
 8FJelx+4AgvZKTr0t/GpQf66z4jkbYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-Z76T-xHvM3iD6cpChR5OqA-1; Mon, 04 Jan 2021 08:21:04 -0500
X-MC-Unique: Z76T-xHvM3iD6cpChR5OqA-1
Received: by mail-wm1-f71.google.com with SMTP id k67so10577298wmk.5
 for <nouveau@lists.freedesktop.org>; Mon, 04 Jan 2021 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPrbs+ygK2nW6UXpFCX2PTOIhaEcotjknLDYayf1rbg=;
 b=NPoqryK7W7nPXJRSxYkhSN81tOiQATS6o1TCnjhXyXEH7gh90liAcaWQyF+MrW0BKd
 xct7Ra2dEesA3abI7AFjqU6IV5Ocpq3Mp0S2L5CcJBdsL0z9Jf/IBRpev1Y/ZAH6i2/0
 YROA3r6eG1fBnRLAWKYx/UjlTrK/TopLabHppHlOE5MzbRMdqTrKqqas6yaAYJNj4J8C
 xlGr//W19ncG7cKyY0fegLhcTVaJV3EN3jqphoh/8/DEvSX5ZKLE43ydtv+iK7mO0Ill
 STZTm4K5agxuMbCg/YbYcnpTQh0emSnH2BgYFzx7p4AMhmOoUFSRzRzynenfCUXbRxQL
 AEog==
X-Gm-Message-State: AOAM533EVneu8IdT3ytmfs6Mr/51G6Nb8goqn7XpWv1FMs8Nm4ilsRmu
 naBvZMjD1LmugNUB+IIBaR6IW+Gew1bqCRCMyi3W5+XLX93wbf1KslGPbE1kQkvkKmxf5rGAYa/
 MknSQx5c2wzuPS+3YkELL57FiTVXIBsu5jnYFKNLvBQ==
X-Received: by 2002:adf:e452:: with SMTP id t18mr76929201wrm.177.1609766463247; 
 Mon, 04 Jan 2021 05:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyejyAsfaLxHqjg5lrewtBBFczMjR6pbLPXoTYYnr8a8cMlhhVl17ylXysIJXWiOsLQQV2XV28iok3dOsd31w=
X-Received: by 2002:adf:e452:: with SMTP id t18mr76929177wrm.177.1609766463058; 
 Mon, 04 Jan 2021 05:21:03 -0800 (PST)
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
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
In-Reply-To: <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Jan 2021 14:20:52 +0100
Message-ID: <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alan Stern <stern@rowland.harvard.edu>, Mike Rapoport <rppt@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 3:50 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Tue, Dec 22, 2020 at 1:56 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > [+Cc nouveau]
> > >
> > > On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > [snip]
> > > > > Quite possibly the system doesn't power up HDA controller when there's
> > > > > no external monitor.
> > > > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > > > Let me ask the user to confirm this.
> > > >
> > > > Yeah, it's the basic question whether the HD-audio is supposed to work
> > > > on this machine at all.  If yes, the current approach we take makes
> > > > less sense - instead we should rather make the HD-audio controller
> > > > working.
> > >
> > > Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
> > >
> > > > > > - The second problem is that pci_enable_device() ignores the error
> > > > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > > > >   problem.  So the driver believes as the PCI device gets enabled
> > > > > >   properly.
> > > > >
> > > > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > > > regression in pci_enable_device_bars") to fix UHCI controller.
> > > > >
> > > > > >
> > > > > > - The third problem is that HD-audio driver blindly believes the
> > > > > >   codec_mask read from the register even if it's a read failure as I
> > > > > >   already showed.
> > > > >
> > > > > This approach has least regression risk.
> > > >
> > > > Yes, but it assumes that HD-audio is really non-existent.
> > >
> > > I really don't know any good approach to address this.
> > > On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> > > driver will flag the magic bit to make HDA audio appear on the PCI
> > > bus.
> > > IIRC the current approach is to make nouveau and device link work.
> >
> > I don't have the full context of this discussion, but the kernel
> > force-enables the HDA subfunction nowadays, irrespective of nouveau or
> > nvidia or whatever:
>
> That's the problem.
>
> The nvidia HDA controller on the affected system only gets its power
> after HDMI cable plugged, so the probe on boot fails.
>

it might be that the code to enable the sub function is a bit broken
:/ but it should work. Maybe the quirk_nvidia_hda function needs to be
called on more occasions? No idea.

> Kai-Heng
>
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267
> >
> > Cheers,
> >
> >   -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
