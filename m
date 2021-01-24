Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B12301967
	for <lists+nouveau@lfdr.de>; Sun, 24 Jan 2021 04:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C53389993;
	Sun, 24 Jan 2021 03:45:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8689993
 for <nouveau@lists.freedesktop.org>; Sun, 24 Jan 2021 03:45:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f1so3263508lfu.3
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 19:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3BuiHCuNnrDUkKJunWU+pSEa8/UTGOBpMwXDiXEiHw=;
 b=YrGM+bi3kdux1Xtv4VdGVjuwVZkmnxnQaOT8QIGo9k6FZMK5MkqBpFoXJOUlu6ozZM
 mhLNSVFAgaIx2pJ/I69new0ubJr2xL4CFYKtlDVhuscuLkww45hEzCM1pUhOYfqvzLZQ
 mYSt4qOKB0/bhxl/+SSh31oEDMGVWCsEIfQ01sGB0aglMzVbP5mEU1zQvqr9/D7Ekdy5
 53rPgWwwoyICxWFiCWyWJc+YhewD9FNfuTVyBnvb2zC1iEF6rqSRjDv5yBRLCuKOsoMO
 CC2jpTEYpCqGlrqseTNWZkKaFytNpfRvZO5eQbmyRD1ldBBorGK8zIagvkw4YlJnO3kH
 pmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3BuiHCuNnrDUkKJunWU+pSEa8/UTGOBpMwXDiXEiHw=;
 b=C40RbZTx1pErte6m3veok85buIREbD2Nwk/J5YzaWhnuXgO+a33CHUkqtTc22mGeiA
 Z7s2qBO+WY55DG3nMeYtbLR7GZbcNUlYWuWluf+uYb86DeYVTHbg7nDN/qwTfznblKkr
 ryt+GnYrue1z/dGIE2kxAF0CwKBulmh9wPOjrxHnfc6tW74HaVUMf866FrQ44fUIdcDZ
 qC5S7gfBCgwaYyyo5gQ3rnhMc3pbi/dmjFU6OxXoHBz7HnoUausjnJLR0IAx3kI/a4Bo
 HV9ppgsepdsJLPS3kMev1qOjqdwQ+HdbDS0oyh59vLmuQfmLDfXUF40xU/B3KHN0aspB
 r0lw==
X-Gm-Message-State: AOAM532zH/nXtseabFtjFEr/DYmm4hdnu+lybneeRA4dkgx1GoqgFBQJ
 lsXZgGGlSoD4NYfaN/FTVjWDOdUWJZHjrKmL2vADaf/R/6VneA==
X-Google-Smtp-Source: ABdhPJzFiB571GYbXLwm9igb7mG2724eDk6WmSbQ+HDmPqx3ISggqsqF+Ae7UBTwSKdOXa1Q7uRujYRY1o9nlyr3qEY=
X-Received: by 2002:a19:82c8:: with SMTP id e191mr719538lfd.294.1611459950546; 
 Sat, 23 Jan 2021 19:45:50 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
 <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
 <CAKb7UvhFtXT7Kt6UCAZ7tCm2=kssTfCLRqUm+ajXiPo0Vn1Ksw@mail.gmail.com>
 <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q@mail.gmail.com>
 <6746024b-ab68-4d6f-626f-224800832eb6@spliet.org>
In-Reply-To: <6746024b-ab68-4d6f-626f-224800832eb6@spliet.org>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Sat, 23 Jan 2021 21:45:14 -0600
Message-ID: <CAPpdf5-w2+4i---qgodB6-_gLnCBR=25=VOqCEoqqig2eym8ZA@mail.gmail.com>
To: Roy Spliet <nouveau@spliet.org>
Subject: Re: [Nouveau] Request for help in adding a HDMI output
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

On Sat, Jan 23, 2021 at 6:43 PM Roy Spliet <nouveau@spliet.org> wrote:
>
> Op 23-01-2021 om 23:18 schreef o1bigtenor:
> >>>>>>
> >>>>>> OK, so this is your 4k monitor. It is plugged into the *secondary*
> >>>>>> GPU, and does not report any 4k@60 modes in the EDID (well, it does
> >>>>>> report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
> >>>>>> this time). Whether that's because the monitor itself doesn't support
> >>>>>> HDMI 2.0, or you plugged it into your old GPU which does not support
> >>>>>> HDMI 2.0, I couldn't say from just this output. What I can say is that
> >>>>>> no amount of modelines will get you 4k@60 in this setup with nouveau.
> >>>>>
> [...]
> > If you would point out a suggestion that I haven't tried - - - please?
>
> A quick DuckDuckGo for "Hisense 4K 60Hz only reports 30Hz" gives this
> thread: https://www.coolcomputing.com/article.php?sid=4659 . No idea
> whether this also applies to your 2016 model. Have you scavenged through
> the TVs menu's to make sure HDMI 2.0 is explicitly enabled?

What is very interesting is that the article is talking about a 43" HiSens Roku
TV. At the beginning of my trouble shooting I called HiSense USA  - - - found
out that the software is different from that on the model sold by HiSense
Canada. About 2/3rds of what is mentioned in the article  - - - - well it just
ain't so. Might be worth plugging a ethernet cord into the thing and trying
to ssh into it to see what's hiding in the system - - - the software screen
does say opensource and mentions a number of common programs
including libc (and others).

Hmmmmmmmm - - - - have found a pile of documents where EDID is shown
to be a very error prone 'standard'. The model year listed is only one of those
the companies documents indicate that the model was sold starting in 2019 and
that there are 3 HDMI 2.0b inputs.

It gets far more interesting!
I have 2 graphics cards:
card0 is an Nvidia 1050 Ti, card 1 is an Nvidia 570
there is only one HDMI port between the two cards (on card0) yet it is the HDMI
interface on card 1 that has the EDID information and reads as the port is
enabled. (Absolutely cannot enable the HDMI port on card0!!)
In my Xorg.0.log files I find a modeline that reads like:
[    40.740] (II) modeset(G0): Supported detailed timing:
[    40.740] (II) modeset(G0): clock: 297.0 MHz   Image Size:  1872 x 1053 mm
[    40.740] (II) modeset(G0): h_active: 3840  h_sync: 4016
h_sync_end 4104 h_blank_end 4400 h_border: 0
[    40.740] (II) modeset(G0): v_active: 2160  v_sync: 2168
v_sync_end 2178 v_blanking: 2250 v_border: 0

which is somewhat similar to:

Preferred Video Timing if only Block 0 is parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Native Video Timing if only Block 0 is parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Preferred Video Timings if Block 0 and CTA-861 Blocks are parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P
  VIC  95:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

----------------

Native Video Timing if Block 0 and CTA-861 Blocks are parsed:
  DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
(1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback 296 Hpol P
                 Vfront    8 Vsync  10 Vback  72 Vpol P

which is was the hex dump written for HDMI-1-2 (listed as on the card that
has no HDMI ports) as the EDID.

I really don't understand how or why this are so garbled - - - but - - - -
they are. Would love to just have a usable monitor - - - - that  doesn't look
like its going to happen though.

Suggestions?

TIA
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
