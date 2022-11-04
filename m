Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C16619E1D
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 18:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127310E0F6;
	Fri,  4 Nov 2022 17:06:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C810E0F6
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 17:06:46 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id z189so5059647vsb.4
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 10:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yf0iwDCgdBr4ItMDNMv4l3UX1YN4RyvBi1n/vASlq5o=;
 b=2y250IPegIGEzo1OVzUeISQR1ssZyHtYXMwrMLODC8o9cQpedbA63KPZa4L9qEj2I+
 BhBOibFa9o3iR6Ss6Q9bvXGjUJunulVFKDlmYG/EFyiBQXIKQhpyxI8YoZW2leQT2rLn
 3sTqHhFOs25+F0VfwrrpRNNUVmHQj/IWmKR4HZY9Z5H79Id1TvNNEnotjYZi7WC7nFIK
 iohlTdVC3Ch+y5fBVsOJRmPTJcFKsEkQBZ6w3DaMrmy8v87T1hoV757P+aRe7Gv066P7
 0Ut3BPLsvR3V+FZGrhyF6Yqwf+gY35B9Xbx2OMx05tEd524hTw/omlLy2IyNeqkOCSWW
 W26w==
X-Gm-Message-State: ACrzQf2PWAF41nogoAjU4ilptTKwdXna88Jnv+9/IPMw2HFDC+YowlCM
 2qi3z4F+eTSJogvNC5eJqcm0GpURPOmBjVKHpgM=
X-Google-Smtp-Source: AMsMyM4NoFrn2gM7upi/s9NMGWosNFzIXgnApbf4ri5Rnqu//2JZw+bK6JnzlQ1wWPL1/rdLrUBrNHiCUoG79K6HrWM=
X-Received: by 2002:a67:b308:0:b0:3ac:74ca:c8ce with SMTP id
 a8-20020a67b308000000b003ac74cac8cemr20105115vsm.18.1667581594095; Fri, 04
 Nov 2022 10:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
 <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
In-Reply-To: <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 4 Nov 2022 13:06:22 -0400
Message-ID: <CAKb7UvipWtb=T0WaB+R2DvKGozXAtgCs8z=RSskbyLcMpSpRSQ@mail.gmail.com>
To: Lukas Satin <luke.satin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] TV Out question
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin <luke.satin@gmail.com> wrote:
>
> Hello, sorry fo the typos. Wanted to catch you before the weekend, to get some hints for upcoming work.
>
> I'm back at PC.
>
> Does your driver support switching to 240p in NTSC and 288p in PAL on the go via xrandr, for example?
>
> If not, can I find some relevant part of code in your repository where to implement that?

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+ tvmodesnv17.c

There's definitely a lot of hard-coding going on. A lot of the
pre-nv50 display code is from This code is (likely) originally from
https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src but I
can't immediately find the TV code in there. But perhaps it's there
anyways, I only spent about 30s looking for it.

I don't remember by now, but there _might_ be a kms property (which
should get piped through to xrandr properties) which allows you to
change this live?

> Some info I found regarding 240p and that it is a part of NTSC: https://en.wikipedia.org/wiki/Low-definition_television
>
> TV with S-Video mostly supports 480i and 240p as well. So the current issue is outputting that via TV out.
>
> My current configuration looks like this:
> TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
>    720x480       59.94 +
>    1024x768      59.94
>    800x600       59.94
>    720x576       59.94
>    640x480       59.94
>    400x300       59.94
>    320x240       59.93
>    320x200       59.94
>    768x576       50.00
>    360x200       60.00
>    360x240       60.00
>    640x240       60.00
>    SR-1_240x224@60.10  60.10*
>
> I see I have created 240x224 (I need to fix that), but even 320x240 does not work. It always stays at 480i.

Did you try 360x240? I have no idea though, sorry. I was just happy
when the S-Video worked at all. It could require further modifications
to how we configure those registers.
