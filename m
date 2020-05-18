Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB81D7B66
	for <lists+nouveau@lfdr.de>; Mon, 18 May 2020 16:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0E36E175;
	Mon, 18 May 2020 14:39:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5AA6E175
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 14:38:59 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id u2so1930709vsi.13
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 07:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PHsyiX2wIA52iUNWvF3mV6BDx7AaZSZlrn7Yo7PpJw=;
 b=mGDm4kdWYikB+L+xjzgpP3bZbTvblbsmVrsiN68hQe196iNB4Z/r7UQMJP4bfvDavh
 tmQqqyZwKiuOJAJ0Fy4luyYB8rD/yfnrzMOMkl8uVkPhqDC4OI857dJpSPB3y7NbMNqr
 5yHYixDg4vRAMyTz3qjpf2XC8lIdpwTn6n2GQqXgVU62y4VbGbwWgc0ELpVKBflp47t7
 UdMxGlRmpHeR8asB89RGm6flz89L0EWmmdD6Xs0b4VdbBR0IbFZqxH3ibKVPn+YSsJ9Z
 9gVLHeIFtw4+u18vhCXBDvgLt7TmcARfGO6pTYfLs37TYrXGfSHUB3A2Z5z8cjrR76Jg
 hEPw==
X-Gm-Message-State: AOAM531x02j9seb00OkVnbnTAWHTbNBwj5uaMTXAwmISa4bXG351vHBr
 H09cSKQBQEEqUdFL35KUQWkBgAsDr/3dFl+A5X/LN0Hp+8E=
X-Google-Smtp-Source: ABdhPJy4nH4kCJ+eh0MoeiAEyGUYtPMHoJPykeg9bdCYF5poJDC3DAPeE+y7kmEbcDDbqg93FgKPbZNwASctuE0fjLM=
X-Received: by 2002:a67:df02:: with SMTP id s2mr3462486vsk.210.1589812738720; 
 Mon, 18 May 2020 07:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au> <87v9ktpd4v.fsf@igel.home>
In-Reply-To: <87v9ktpd4v.fsf@igel.home>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 18 May 2020 10:38:47 -0400
Message-ID: <CAKb7UvgBhvE-dEfva+n5SUTJ4CZT2KKkno=SVb9Jx5KBbZWR+A@mail.gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [Nouveau] [PATCH v2 2/2] powerpc/configs: replace deprecated
 riva/nvidia with nouveau
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
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Andreas,

On Mon, May 18, 2020 at 9:56 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Mai 18 2020, Michael Ellerman wrote:
>
> > The old drivers may be crufty but they presumably have been tested by
> > people and at least somewhat work.
>
> I can confirm that the nvidia fbdev driver is working perfectly fine.
>
> > I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
> > errors in it (see below). I can't actually tell if the display is
> > working because the machine is remote, and I can't go and check it at
> > the moment because the office is closed.
>
> The nouveau driver is completely borked.
>
> [    2.299204] nouveau 0000:f0:10.0: NVIDIA NV34 (034100a2)
> [    2.363100] nouveau 0000:f0:10.0: bios: version 04.34.20.19.00
> [    2.363273] nouveau 0000:f0:10.0: bios: OOB 1 00000962 00000962
> [    2.363323] nouveau 0000:f0:10.0: bios: OOB 1 00000966 00000966
> [    2.363332] nouveau 0000:f0:10.0: bios: OOB 1 00000963 00000963
> [    2.363341] nouveau 0000:f0:10.0: bios: OOB 1 00000964 00000964
> [    2.363387] nouveau 0000:f0:10.0: bios: OOB 1 0000096a 0000096a
> [    2.363396] nouveau 0000:f0:10.0: bios: OOB 1 00000967 00000967
> [    2.363405] nouveau 0000:f0:10.0: bios: OOB 1 00000968 00000968
> [    2.363453] nouveau 0000:f0:10.0: bios: OOB 1 0000096e 0000096e
> [    2.363462] nouveau 0000:f0:10.0: bios: OOB 1 0000096b 0000096b
> [    2.363471] nouveau 0000:f0:10.0: bios: OOB 1 0000096c 0000096c
> [    2.363516] nouveau 0000:f0:10.0: bios: OOB 1 00000972 00000972
> [    2.363526] nouveau 0000:f0:10.0: bios: OOB 1 0000096f 0000096f
> [    2.363534] nouveau 0000:f0:10.0: bios: OOB 1 00000970 00000970
> [    2.363580] nouveau 0000:f0:10.0: bios: OOB 1 00000976 00000976
> [    2.363589] nouveau 0000:f0:10.0: bios: OOB 1 00000973 00000973
> [    2.363597] nouveau 0000:f0:10.0: bios: OOB 1 00000974 00000974
> [    2.363643] nouveau 0000:f0:10.0: bios: OOB 1 0000097a 0000097a
> [    2.363652] nouveau 0000:f0:10.0: bios: OOB 1 00000977 00000977
> [    2.363661] nouveau 0000:f0:10.0: bios: OOB 1 00000978 00000978
> [    2.363709] nouveau 0000:f0:10.0: bios: OOB 1 0000097e 0000097e
> [    2.363718] nouveau 0000:f0:10.0: bios: OOB 1 0000097b 0000097b
> [    2.363727] nouveau 0000:f0:10.0: bios: OOB 1 0000097c 0000097c
> [    2.363772] nouveau 0000:f0:10.0: bios: OOB 1 00000982 00000982
> [    2.363781] nouveau 0000:f0:10.0: bios: OOB 1 0000097f 0000097f
> [    2.363790] nouveau 0000:f0:10.0: bios: OOB 1 00000980 00000980
> [    2.363836] nouveau 0000:f0:10.0: bios: OOB 1 00000986 00000986
> [    2.363845] nouveau 0000:f0:10.0: bios: OOB 1 00000983 00000983
> [    2.363854] nouveau 0000:f0:10.0: bios: OOB 1 00000984 00000984
> [    2.363900] nouveau 0000:f0:10.0: bios: OOB 1 0000098a 0000098a
> [    2.363909] nouveau 0000:f0:10.0: bios: OOB 1 00000987 00000987
> [    2.363918] nouveau 0000:f0:10.0: bios: OOB 1 00000988 00000988
> [    2.363965] nouveau 0000:f0:10.0: bios: OOB 1 0000098e 0000098e
> [    2.363974] nouveau 0000:f0:10.0: bios: OOB 1 0000098b 0000098b
> [    2.363983] nouveau 0000:f0:10.0: bios: OOB 1 0000098c 0000098c
> [    2.364029] nouveau 0000:f0:10.0: bios: OOB 1 00000992 00000992
> [    2.364038] nouveau 0000:f0:10.0: bios: OOB 1 0000098f 0000098f
> [    2.364047] nouveau 0000:f0:10.0: bios: OOB 1 00000990 00000990
> [    2.364383] nouveau 0000:f0:10.0: gpio: GPU is missing power, check its power cables.  Boot with nouveau.config=NvPowerChecks=0 to disable.
> [    2.364402] nouveau 0000:f0:10.0: gpio: init failed, -22
> [    2.364431] nouveau 0000:f0:10.0: init failed with -22
> [    2.364438] nouveau: DRM-master:00000000:00000080: init failed with -22
> [    2.364450] nouveau 0000:f0:10.0: DRM-master: Device allocation failed: -22
> [    2.365268] nouveau: probe of 0000:f0:10.0 failed with error -22

If you're interested in providing some further info, could you attach
your VBIOS? I did, at one point, a long time ago, get a NV34 G5
PowerMac7,3 working fine with nouveau. I'm curious if something in
your VBIOS is different, or if the logic has regressed. (It would have
been working in 4.4 or so.)

You can find the VBIOS in of, it's called "NVDA,BMP", should be
accessible in procfs or sysfs somewhere, but not 100% sure where.
(From an old guide,
/proc/device-tree/pci@f0000000/NVDA,Parent@10/NVDA,BMP seems to be it,
possibly with some local adjustments.)

Thanks,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
