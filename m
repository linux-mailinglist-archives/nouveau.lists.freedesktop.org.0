Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3EE1E86FC
	for <lists+nouveau@lfdr.de>; Fri, 29 May 2020 20:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8066E959;
	Fri, 29 May 2020 18:54:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5106E959
 for <nouveau@lists.freedesktop.org>; Fri, 29 May 2020 18:54:03 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id r9so1168288ual.1
 for <nouveau@lists.freedesktop.org>; Fri, 29 May 2020 11:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sM3h/XpgUIICGLJTyI3Y7/EtfkuUUsFD89hKEfjPaM=;
 b=WDvk21X941bFfP3le0fkwq9VNsbyZM41GvlINjmUvwMaSdwTOop7Ho/rTWbFBuzDi8
 RWEJoWWbKbYqpY2gwS1G3c3PDKVhakn+YHZ+2dZPSX9TZXRgvPnTYJgNNQa5nfPy5JiM
 YpKcg6eENZSU/SJcFVMtzFmGF+4Jh4x7NmBDqRHY2RGHkYO0W91AnhM/kjvztUjMZQYd
 mLJvN4ieku2zCzufRraYHv2q+p+zG4tCcGNBbR+48bVGLt4vYYylQQjhnSrA1Ltcrq7g
 ok1Q1hGnrxa5wZ2V0/6gkHOv3J9okefUn6souk6s/V44CEDxKgaNZD8J4Tz3q9HkKRYs
 G3eg==
X-Gm-Message-State: AOAM53163gixNNTz6JPDyBalG8JVg2FENKKtWFl8mfTPpn9oQ4riyZOZ
 rO9pmsr9KTJO7pNIqv8cKQpYZy6exAtakXEF1KCspuba
X-Google-Smtp-Source: ABdhPJweHbnGe1BpD8zAZG+ARHKA5IwBCYEanFqnd5/vwy2eQCC2Q7rltnZUchx8CP7i52b45XYeKIZY7EfC6/uuDOM=
X-Received: by 2002:ab0:268b:: with SMTP id t11mr7168832uao.58.1590778442578; 
 Fri, 29 May 2020 11:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200529180315.GA18804@merlins.org>
In-Reply-To: <20200529180315.GA18804@merlins.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 29 May 2020 14:53:51 -0400
Message-ID: <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
Subject: Re: [Nouveau] 5.5 kernel: using nouveau or something else just long
 enough to turn off Quadro RTX 4000 Mobile for hybrid graphics?
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

On Fri, May 29, 2020 at 2:35 PM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> Howdy,
>
> So, I have a Thinkpad P70 with hybrid graphics.
> 01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M600M] (rev a2)
> that one works fine, I can use i915 for the main screen, and nouveau to
> display on the external ports (external ports are only wired to nvidia
> chip, so it's impossible to use them without turning the nvidia chip
> on).
>
> I now got a newer P73 also with the same hybrid graphics (setup as such
> in the bios). It runs fine with i915, and I don't need to use external
> display with nouveau for now (it almost works, but I only see the mouse
> cursor on the external screen, no window or anything else can get
> displayed, very weird).
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
>
> What I need for now is either nouveau, or bbswitch if it still works to
> turn the nvidia chip off every time I power on/reboot/plug/unplug
> external power.
> if I don't load the nouveau module, I get this in powertop:
> Bad           Runtime PM for PCI Device NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q]
> powertop cannot really turn it off and I get
> The battery reports a discharge rate of 63.0 W
>
> If I load the nouveau driver, the chip gets turned off (great), but it's
> unstable and hard crashes my laptop when I plug/unplug it from power
> after a few times.
> This is what I got in my logs after the last crash:
> intel-lpss 0000:00:15.0: power state changed by ACPI to D3cold
> intel-lpss 0000:00:15.1: power state changed by ACPI to D3cold
> snd_hda_intel 0000:00:1f.3: PME# enabled
> intel-lpss 0000:00:1e.0: power state changed by ACPI to D3cold
> snd_hda_intel 0000:00:1f.3: power state changed by ACPI to D3hot
> xhci_hcd 0000:01:00.2: PME# enabled
> nvidia-gpu 0000:01:00.3: PME# enabled
> pcieport 0000:05:00.0: PME# enabled
> xhci_hcd 0000:2c:00.0: PME# enabled
> pcieport 0000:05:02.0: PME# enabled
> pcieport 0000:04:00.0: PME# enabled
> pcieport 0000:00:1c.0: PME# enabled
> pcieport 0000:00:1c.0: power state changed by ACPI to D3cold
> nouveau 0000:01:00.0: power state changed by ACPI to D3cold
> pcieport 0000:00:01.0: PME# enabled
> pcieport 0000:00:01.0: power state changed by ACPI to D3cold
>
> I am using TLP to manage battery use, the driver might not like things getting turned off to save power
> (although when it works, I can get the laptop down to 10W)
>
> Any suggestions on my best way to just keep the nvidia chip off reliably?
> nouveau? bbswitch? other?
> (and before you ask, no, you cannot turn it off in the bios, it's hybrid or nvidia only)
>
>
> If that helps, here is what I got when I tried to use hybrid graphics to power an external
> monitor (just pasting for completeness, I don't need this to work for now)
>
> pci 0000:01:00.0: optimus capabilities: enabled, status dynamic power, hda bios codec supported
> VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP handle
> nouveau: detected PR support, will not use DSM
> nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
> nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
> nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
> nouveau 0000:01:00.0: enabling bus mastering
> nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
> vga_switcheroo: enabled
> [TTM] Zone  kernel: Available graphics memory: 32730618 KiB
> [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
> [TTM] Initializing pool allocator
> [TTM] Initializing DMA pool allocator
> nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
> nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> nouveau 0000:01:00.0: DRM: DCB version 4.1
> nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
> nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
> nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
> nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
> nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
> nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
> nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
> nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
> nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
> nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
> nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22
> nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> nouveau 0000:01:00.0: DRM: unknown connector type 48
> nouveau 0000:01:00.0: DRM: unknown connector type 48
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] Driver supports precise vblank timestamp query.
> memmap_init_zone_device initialised 2097152 pages in 16ms
> nouveau 0000:01:00.0: DRM: DMEM: registered 8192MB of device memory
> nouveau 0000:01:00.0: DRM: allocated 2560x1600 fb: 0x200000, bo 0000000018f13ee1
> nouveau 0000:01:00.0: fb1: nouveaudrmfb frame buffer device
>
> sauron:~$ xrandr --setprovideroutputsource 1 0
> sauron:~$ xrandr --listactivemonitors
> Monitors: 1
>  0: +*eDP-1 3840/382x2160/214+0+0  eDP-1
>
> sauron:~$ xrandr --auto
> sauron:~$ xrandr --listactivemonitors
> Monitors: 2
>  0: +*eDP-1 3840/382x2160/214+0+0  eDP-1
>  1: +HDMI-1-1 2560/641x1600/400+3840+0  HDMI-1-1
>
> moving to new window moves the mouse, but not windows get displayed.

Do you see anything in dmesg after this is set up? I'd expect some
errors about timeouts or something else.

Which kernel are you using? There have been some turing-specific fixes recently.

Also note that TLP has a problem where it forces the audio
sub-function to always-on which prevents the GPU from suspending.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
