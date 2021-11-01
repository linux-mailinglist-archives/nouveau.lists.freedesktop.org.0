Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2A442078
	for <lists+nouveau@lfdr.de>; Mon,  1 Nov 2021 20:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E02989ECB;
	Mon,  1 Nov 2021 19:05:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB089ECB
 for <nouveau@lists.freedesktop.org>; Mon,  1 Nov 2021 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlFpIDMCc6wz40kbHr9lORwteOunxIK6tm6hqKEsIk4=;
 b=UO6eYSWYhPEnWQwPM16ge51/ohi61X0x6fIbffHA0yIbLYr5dHHCowO32010IAJ+2/W33c
 jPC4Cjo7NQNbCE5H+HVMhiv7F2b+GTSggVJ8LvGVqEzRRqIgq7Royt11RYolAwE9XSLcaM
 BXz6CRDZy3GXlbEzUkc1mEuQ/ANIcm8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-wz8QoLlqMLyE1uaGq7hXrg-1; Mon, 01 Nov 2021 15:05:33 -0400
X-MC-Unique: wz8QoLlqMLyE1uaGq7hXrg-1
Received: by mail-lj1-f199.google.com with SMTP id
 f17-20020a2e9751000000b00211a1367c68so6561012ljj.16
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NlFpIDMCc6wz40kbHr9lORwteOunxIK6tm6hqKEsIk4=;
 b=ymqTBXlqhA/oFCwjM6zSlodhMQfjK7eRMLnLCNGKEUu34U2JKoZJiVf0KylofI0sr5
 ZZKaQ3Nzt0gkF8wY+bgy2xiVTAzd9s9HUm/AqU/gHmqeyGOnPLvzNuxXBWnXAK39iaOG
 WVuRgYCHvD2rBGettGGKRdL0OhJb66nOs+nxRRb6rcBldhrpnPwducgIy9cynnmu7q0y
 o/7HiShvCt0WIlDzJ3sCB0S/DYPHhnYuEILZaNgN5s6lplX4c0hJOdu4lUjOM8Ay5/2Z
 Nd5dzHXBrkkF3heYJing7fRAVRtEXKwwztf+D4koySLBX7HdJgRTZ/4MI5DQuOic3pao
 cnjw==
X-Gm-Message-State: AOAM53024s8l0BX2VSjXCuNzSdj9/LeehPGoKZzT/XDkZjFjc0CWD95g
 9RVtdN9dgKUnFQ0ky2l0rzd604hvZLxZj3LWtYPCA1Ffaetbx7NdLBxjX0wG1GzH0ZhGXVL6gSP
 CZ49ZsjJePPm0+Xi9nG6i+WEq0az2eVdY4LdOQV23IA==
X-Received: by 2002:a05:651c:317:: with SMTP id
 a23mr23559314ljp.262.1635793531925; 
 Mon, 01 Nov 2021 12:05:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww8NwfPac+NZum/UplFCO73TJ8FgWB59K4hSH1hxr7u62RszlqtY4A3HmaEOMJBSqr+lBvAnchJji77SRjfQ4=
X-Received: by 2002:a05:651c:317:: with SMTP id
 a23mr23559273ljp.262.1635793531654; 
 Mon, 01 Nov 2021 12:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
In-Reply-To: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 1 Nov 2021 20:05:20 +0100
Message-ID: <CACO55tuZwYJKKBfHd5cgEv3_ry+B5fMO=4KCUGhvwyX8=Kq_hQ@mail.gmail.com>
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

On Mon, Nov 1, 2021 at 7:38 PM riveravaldez <riveravaldezmail@gmail.com> wrote:
>
> Hi, I'm having this error messages at boot:
>
> $ sudo journalctl -ex -p3 | grep nouveau
> nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: ucode exceeds falcon limit(s)
> nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: init failed, -22

mhh, this shouldn't happen and the accesses below are probably related
to this. Mind sharing your complete dmesg via a pastebin site or just
go ahead and file a bug at
https://gitlab.freedesktop.org/drm/nouveau/-/issues ?

I assume you are on the newest kernel and everything? I will check if
I can reproduce it on the fermi I've got here, but could be something
specific to your GPU.

> nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10312c [ PRIVRING ]
> nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> (...)
> nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO write of 00000000 FAULT at 103048 [ PRIVRING ]
> nov 01 14:54:22 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> nov 01 14:54:54 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> nov 01 14:55:06 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]
> (..., many similar)
>
> In this hardware:
>
> $ lspci -k
> 00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
> Subsystem: Dell Device 04b6
> 00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09)
> Kernel driver in use: pcieport
> 00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
> Subsystem: Dell Device 04b6
> Kernel driver in use: i915
> Kernel modules: i915
> 00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
> Subsystem: Dell Device 04b6
> Kernel driver in use: mei_me
> Kernel modules: mei_me
> 00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: ehci-pci
> 00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: snd_hda_intel
> Kernel modules: snd_hda_intel
> 00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
> Kernel driver in use: pcieport
> 00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b5)
> Kernel driver in use: pcieport
> 00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b5)
> Kernel driver in use: pcieport
> 00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b5)
> Kernel driver in use: pcieport
> 00:1c.5 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 6 (rev b5)
> Kernel driver in use: pcieport
> 00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: ehci-pci
> 00:1f.0 ISA bridge: Intel Corporation HM67 Express Chipset LPC Controller (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: lpc_ich
> Kernel modules: lpc_ich
> 00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Mobile SATA AHCI Controller (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: ahci
> 00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
> Subsystem: Dell Device 04b6
> Kernel driver in use: i801_smbus
> Kernel modules: i2c_i801
> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 525M] (rev a1)
> Subsystem: Dell Device 04b6
> Kernel driver in use: nouveau
> Kernel modules: nouveau
> 01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller (rev a1)
> Kernel driver in use: snd_hda_intel
> Kernel modules: snd_hda_intel
> 03:00.0 Network controller: Intel Corporation Centrino Wireless-N 1030 [Rainbow Peak] (rev 34)
> Subsystem: Intel Corporation Centrino Wireless-N 1030 BGN
> Kernel driver in use: iwlwifi
> Kernel modules: iwlwifi
> 04:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller (rev 04)
> Subsystem: Dell Device 04b6
> Kernel driver in use: xhci_hcd
> Kernel modules: xhci_pci
> 06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
> Subsystem: Dell Device 04b6
> Kernel driver in use: r8169
> Kernel modules: r8169
>
> Updated Arch system.
>
> $ uname -a
> Linux arch 5.14.14-arch1-1 #1 SMP PREEMPT Wed, 20 Oct 2021 21:35:18 +0000 x86_64 GNU/Linux
>
> Something I should worry or do about?
>
> Thanks a lot in advance. Kind regards.

