Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3C442086
	for <lists+nouveau@lfdr.de>; Mon,  1 Nov 2021 20:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EA06E14F;
	Mon,  1 Nov 2021 19:09:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E36E176
 for <nouveau@lists.freedesktop.org>; Mon,  1 Nov 2021 19:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HukUEUCHpcgSi4l+3g0z+54KWpoB588PN8POrzaMgE8=;
 b=G+M85yBKYTPTv4h7xYDCeFOIjiJ/XkI6Lxc4FQ6fXQ6I0nCWG2rdEpPEMnlWap1ha/b4mI
 ZptaVgsv09/8yRA14O09hjILunQNpjuPPaKKRLIemVsSqpLgRzsV5avO25RQ02nOlTnpZn
 WYBMXach1zYscBSsteQ7r2axuzPR/j0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-sb5-zg56OjSZJpUMf8SZcw-1; Mon, 01 Nov 2021 15:09:14 -0400
X-MC-Unique: sb5-zg56OjSZJpUMf8SZcw-1
Received: by mail-lj1-f198.google.com with SMTP id
 e13-20020a2e9e0d000000b00216ace8e8e5so116667ljk.10
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 12:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HukUEUCHpcgSi4l+3g0z+54KWpoB588PN8POrzaMgE8=;
 b=vNE1/SWpCgOYtK6axcQGU89CWeU8Njl582egGz0Hz03+4Gf2TYA0ROHiVeq3+3vSqL
 Rgwta4xC/TnUd3+wuFQt8bCl1lSYdBPvMqK243Jb3Dw90UWa/lOadPgXidTd5rrVK77z
 KgmY2NvmhWM1jEee9O+tpWZt0fhiGmsE+LJGhrDSwMoS8hqYXGFoYQ5RT9M0j5lwnFpa
 LLkuDSUUgmJ23477yhx97ICwZi+5QyLs3G1Z+oOsy6zSHzA/c+vKO2ngSZuRIU+SEcx5
 cYWOqEwuU2IiGptIH+8geYvpJsI/PF2C+Qnxjot0KD/y4tISXdY4p7olT0bC3Z7WX+j1
 myXw==
X-Gm-Message-State: AOAM531R599W56hVVkNZZrOJjTy0VjkKpCS5qEEjQIfSjzQtcL5b2O+G
 vQ+u6bpHMy4DeZqSnmG4kwCF4mZwFUSCe+yW9JuwQ8X9jgGrfcjU7QIHsmNlc+ME9hhrr9A9bJw
 Fl1mwJ47N2jMmkIhCC6W78XfK7WmA1PbXCQE0TdEA/w==
X-Received: by 2002:a2e:5344:: with SMTP id t4mr32592550ljd.294.1635793752259; 
 Mon, 01 Nov 2021 12:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP70/Q6U8IQQGf0DSctxI6DkcnJbFw3wAvI3uNP5MAP0PcwCIIWQxZdxI8oTJFcSpkEwN5lgERHGH8ha3yxt8=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr32592529ljd.294.1635793752029; 
 Mon, 01 Nov 2021 12:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
 <CACO55tuZwYJKKBfHd5cgEv3_ry+B5fMO=4KCUGhvwyX8=Kq_hQ@mail.gmail.com>
In-Reply-To: <CACO55tuZwYJKKBfHd5cgEv3_ry+B5fMO=4KCUGhvwyX8=Kq_hQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 1 Nov 2021 20:09:00 +0100
Message-ID: <CACO55tv3DfrYObTfP7OqzOH6mESXx_KD5HRDtDaikUr0gH3hGg@mail.gmail.com>
To: riveravaldez <riveravaldezmail@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Various kernel error messages on updated Arch box
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Actually.. seems like somebody already filed a bug like this:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/91

Seems to be more widespread so I will check out if I hit this as well.

On Mon, Nov 1, 2021 at 8:05 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Mon, Nov 1, 2021 at 7:38 PM riveravaldez <riveravaldezmail@gmail.com> wrote:
> >
> > Hi, I'm having this error messages at boot:
> >
> > $ sudo journalctl -ex -p3 | grep nouveau
> > nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: ucode exceeds falcon limit(s)
> > nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: init failed, -22
>
> mhh, this shouldn't happen and the accesses below are probably related
> to this. Mind sharing your complete dmesg via a pastebin site or just
> go ahead and file a bug at
> https://gitlab.freedesktop.org/drm/nouveau/-/issues ?
>
> I assume you are on the newest kernel and everything? I will check if
> I can reproduce it on the fermi I've got here, but could be something
> specific to your GPU.
>
> > nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10312c [ PRIVRING ]
> > nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> > (...)
> > nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> > nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO write of 00000000 FAULT at 103048 [ PRIVRING ]
> > nov 01 14:54:22 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> > nov 01 14:54:54 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> > nov 01 14:55:06 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> > (..., many similar)
> >
> > In this hardware:
> >
> > $ lspci -k
> > 00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
> > Subsystem: Dell Device 04b6
> > 00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09)
> > Kernel driver in use: pcieport
> > 00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: i915
> > Kernel modules: i915
> > 00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: mei_me
> > Kernel modules: mei_me
> > 00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: ehci-pci
> > 00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: snd_hda_intel
> > Kernel modules: snd_hda_intel
> > 00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
> > Kernel driver in use: pcieport
> > 00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b5)
> > Kernel driver in use: pcieport
> > 00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b5)
> > Kernel driver in use: pcieport
> > 00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b5)
> > Kernel driver in use: pcieport
> > 00:1c.5 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 6 (rev b5)
> > Kernel driver in use: pcieport
> > 00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: ehci-pci
> > 00:1f.0 ISA bridge: Intel Corporation HM67 Express Chipset LPC Controller (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: lpc_ich
> > Kernel modules: lpc_ich
> > 00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Mobile SATA AHCI Controller (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: ahci
> > 00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: i801_smbus
> > Kernel modules: i2c_i801
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 525M] (rev a1)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: nouveau
> > Kernel modules: nouveau
> > 01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller (rev a1)
> > Kernel driver in use: snd_hda_intel
> > Kernel modules: snd_hda_intel
> > 03:00.0 Network controller: Intel Corporation Centrino Wireless-N 1030 [Rainbow Peak] (rev 34)
> > Subsystem: Intel Corporation Centrino Wireless-N 1030 BGN
> > Kernel driver in use: iwlwifi
> > Kernel modules: iwlwifi
> > 04:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 04)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: xhci_hcd
> > Kernel modules: xhci_pci
> > 06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
> > Subsystem: Dell Device 04b6
> > Kernel driver in use: r8169
> > Kernel modules: r8169
> >
> > Updated Arch system.
> >
> > $ uname -a
> > Linux arch 5.14.14-arch1-1 #1 SMP PREEMPT Wed, 20 Oct 2021 21:35:18 +0000 x86_64 GNU/Linux
> >
> > Something I should worry or do about?
> >
> > Thanks a lot in advance. Kind regards.

