Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F1258E37
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 14:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA966E425;
	Tue,  1 Sep 2020 12:31:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96C6E425
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 12:31:35 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g11so363570ual.2
 for <nouveau@lists.freedesktop.org>; Tue, 01 Sep 2020 05:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZQTHCri9vqEfnr8UmtyT7WkaY6SAMqxaD0w7hErg/s=;
 b=UG/qAKTCw6r69CsIjdIy3Mtj6ffKItbngQ8vkdN7NvIlNdBCYQk14RjnzwwPLvVfib
 OYg9ikr3u38PUtfp15T4ekWNC84mR8P8b2NH2hxW5YqaqDjOnR7FWRiIC4ugY5rckG4e
 WfE685DofFrGXPZq19EL8p6kFRDyFZXl35gEuzIfBr3G8vKb3NBqPFEuGJubBuShfsLS
 q7MucExyx1thINGRTt/llZK1oso9/XHH3aNVpfk86V6BvAOJ85maB16yN7+jf/ED6GnV
 oMgPmeoSKTVx6V82gVdy15n7dkwCJb7ed03JCob8UR+6WBs5SvWfv581cAcI6Hfio1dl
 dwHA==
X-Gm-Message-State: AOAM5329acWrmTFqp8Zx0rN/VvB/TSxQ69nXQZgEiiT+PR8jZtpX0i3Z
 Gwl/5kOnd74K1ozPWwLrUx1QHj/Q+OMGAA9xdr0=
X-Google-Smtp-Source: ABdhPJw5F1hhNXhNHldtZO02YcmIxozY8z9wtbR2ALFw53bT88qwnkNsQ9zB70lE4hzx+da5yxRDiF3QEyqk1VTSvlc=
X-Received: by 2002:ab0:7448:: with SMTP id p8mr854429uaq.58.1598963494225;
 Tue, 01 Sep 2020 05:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
In-Reply-To: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 1 Sep 2020 08:31:23 -0400
Message-ID: <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
To: Analabha Roy <hariseldon99@gmail.com>
Subject: Re: [Nouveau] VAAPI on GeForce GT 620M
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

On Tue, Sep 1, 2020 at 3:31 AM Analabha Roy <hariseldon99@gmail.com> wrote:
>
> Hi,
>
> If I am reading the featurematrix right, VAAPI is supported for nouveau on the GeForce650M (my card).
>
> Here is the output of inxi -F
>
> System:    Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64 Console: tty 1 Distro: Ubuntu 18.04.5 LTS
> Machine:   Device: laptop System: SAMSUNG product: 300E4C/300E5C/300E7C v: 0.1 serial: N/A
>            Mobo: SAMSUNG model: NP300E5X-U01IN v: FAB1 serial: N/A
>            UEFI [Legacy]: Phoenix v: P06RAC date: 10/25/2012
> Battery    BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5 Wh (100%)
> CPU:       Dual core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB
>            clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz 3: 905 MHz 4: 927 MHz
> Graphics:  Card-1: Intel 2nd Generation Core Processor Family Integrated Graphics Controller
>            Card-2: NVIDIA GF108M [GeForce GT 620M]
>            Display Server: X.org 1.20.8 driver: i915 tty size: 171x45 Advanced Data: N/A out of X
>
>
> I have installed nouveau, and extracted the firmware from the prop nvidia drivers separately as per instructions on https://nouveau.freedesktop.org/wiki/VideoAcceleration/
> See installed firmware @ https://pastebin.com/Gaqxb88g
>
> But running vainfo yields error: https://pastebin.com/NyULBhXt
>
> Does the error mean that VAAPI is unsupported, or does it indicate a config problem?

As Karol suggests, using the onboard CPU's decoding capabilities will
yield better results. However if there's some specific reason you
want/need to use the NVIDIA card, it should still work. I note that
you don't have an X server running - is that on purpose? I believe
that va-api needs some sort of winsys to be available, but I guess I'm
not entirely sure.

Do you see any errors in dmesg after running vainfo?

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
