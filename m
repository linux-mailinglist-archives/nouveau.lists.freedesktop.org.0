Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947BC2DFE15
	for <lists+nouveau@lfdr.de>; Mon, 21 Dec 2020 17:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901E36E4A5;
	Mon, 21 Dec 2020 16:33:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884B6E4A5
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 16:33:34 +0000 (UTC)
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1krO7o-0008S5-Ew
 for nouveau@lists.freedesktop.org; Mon, 21 Dec 2020 16:33:32 +0000
Received: by mail-lf1-f70.google.com with SMTP id m12so11297686lfa.2
 for <nouveau@lists.freedesktop.org>; Mon, 21 Dec 2020 08:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DJCzPnkhqRPedetC6f30gfeqZjj9GSnRoXOKXqtenM=;
 b=WBnL3vEd4I3myHW0bXCBKfJe9uJug6TIBGAGcGqUaoAqKmfnNmK6CcmECokNRu2ocj
 zHM3hqYhRW2HUSoX+Xk7pAdO6XKBrgTjMsX7+ic1Eiare6PKx8aRMUKC7tD/GA/1RBzD
 Ef0pfQA9kVmkd8852aF73rIf9DMrQgHL5o14LSWns+gpqEYTvfWaBymQH58XE811qgoA
 PdtEwD6yiPt6DTt8tpbTQ3YIV+79buqVUC5mNkQ9+pwclt2FsghnpOg8/zy9J4afm+d2
 NH9kXg8oNZIJja41eaYRx2ElGWO4w90fa0IgeGFyxqs67KSmpi1Nih0E5qq/511X6TnR
 b5uA==
X-Gm-Message-State: AOAM530+aEG2hFsRsAN3pIG947zamXmpnAHcL2s0s868GzOtn+o+q+e2
 y9ZDKFe3obT7YkCd0CpND9GMHpkGBmvrI/i6amvh2MFp2V4UzDPWCY6nWCXt0TI1Cc8IbfzIKBP
 TYDbkjSnoMSrxS46aC/CHQTDYLPj0wL+9wvsl4U1MN5pOHEY2KnM1iTJ89K8=
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr7354277lji.126.1608568411903; 
 Mon, 21 Dec 2020 08:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtnLVxc3tdNQMXpGXmxOqiYwSpbFnGFhsFaqolhzWgqF0GoirNF1t7rUczUrKsKTQYUeDw3QVY7adO187jKOU=
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr7354267lji.126.1608568411594; 
 Mon, 21 Dec 2020 08:33:31 -0800 (PST)
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
In-Reply-To: <s5h7dpfk06y.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 22 Dec 2020 00:33:20 +0800
Message-ID: <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
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
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jaroslav Kysela <perex@perex.cz>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

[+Cc nouveau]

On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
[snip]
> > Quite possibly the system doesn't power up HDA controller when there's
> > no external monitor.
> > So when it's connected to external monitor, it's still needed for HDMI audio.
> > Let me ask the user to confirm this.
>
> Yeah, it's the basic question whether the HD-audio is supposed to work
> on this machine at all.  If yes, the current approach we take makes
> less sense - instead we should rather make the HD-audio controller
> working.

Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.

> > > - The second problem is that pci_enable_device() ignores the error
> > >   returned from pci_set_power_state() if it's -EIO.  And the
> > >   inaccessible access error returns -EIO, although it's rather a fatal
> > >   problem.  So the driver believes as the PCI device gets enabled
> > >   properly.
> >
> > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > regression in pci_enable_device_bars") to fix UHCI controller.
> >
> > >
> > > - The third problem is that HD-audio driver blindly believes the
> > >   codec_mask read from the register even if it's a read failure as I
> > >   already showed.
> >
> > This approach has least regression risk.
>
> Yes, but it assumes that HD-audio is really non-existent.

I really don't know any good approach to address this.
On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
driver will flag the magic bit to make HDA audio appear on the PCI
bus.
IIRC the current approach is to make nouveau and device link work.

Kai-Heng

>
>
> thanks,
>
> Takashi
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
