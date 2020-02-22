Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F831691A3
	for <lists+nouveau@lfdr.de>; Sat, 22 Feb 2020 20:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F476E972;
	Sat, 22 Feb 2020 19:49:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88786E972
 for <nouveau@lists.freedesktop.org>; Sat, 22 Feb 2020 19:49:22 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id y23so1906428ual.2
 for <nouveau@lists.freedesktop.org>; Sat, 22 Feb 2020 11:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CZQXElSnFZthnBqqwrB4A1gh4eeiTHXQ3SNMasWMD8=;
 b=ASC0kwIr7EvLX09l5TiiKHWrOitBOqvD75O4n9xb4A2Bzp15mOppVrsgI4+kMtta76
 +ni1CNXfzd6wwPvCTOBtsvRNlD1iwi5GM6r0ewLV814kIQNpfpVVLXSb24ib4KecYCtd
 uRLyD4w0oUNg+1dcpgO2wb36S16xpPNlXAAyNWH2WTQHATJUlbJwmtiU9s98szrQYx+N
 xHUaKkeenPC8JvNlDMF9UKOWFv0yrJQWTATtP2TsQFEcdtzEyc6Yjw+E0QNfa5AGnurb
 KyrDUwOnE12GB/TMW9yvWgNUMUKpXHNKkFMODfcfWGA8yS9qwb0qjMCy55blksWPNyvz
 IEoA==
X-Gm-Message-State: APjAAAXWVMZ9pcmC5FQxAdSmPNL25XTQpFr0vDKGGdGe6cbW+mcwqdB/
 EYR1sBtpMct8Fglw182GZW+W5XZvfKgtvKLz8/o=
X-Google-Smtp-Source: APXvYqxUtm8NfHfnoAB+sOnFZj21qSeWsDsUQ6wzBZx0g6c1sjdZWNyRwGaLYd1mX9cKbNzPPhi7l1Vu2ArMNoCofNQ=
X-Received: by 2002:a9f:3046:: with SMTP id i6mr22139945uab.15.1582400961987; 
 Sat, 22 Feb 2020 11:49:21 -0800 (PST)
MIME-Version: 1.0
References: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
In-Reply-To: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 22 Feb 2020 14:49:10 -0500
Message-ID: <CAKb7UvgiCak9L62d66uEtvBRuazfde3OFQdHmmu7AKUR9w-n_w@mail.gmail.com>
To: Lukas Schubert <lukas.schubert@gmx.de>
Subject: Re: [Nouveau] NV40 under Debian
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

On Sat, Feb 22, 2020 at 1:02 PM Lukas Schubert <lukas.schubert@gmx.de> wrote:
>
> Hi list,
>
> my media center PC is freshly installed with Debian 10.2 "Buster". It doesn't support Geforce 6800 GT (NV40) boards through the nvidia nor the nvidia-legacy drivers any longer. The legacy drivers worked up until Debian 9 "Stretch", but no longer.
>
> I know that the hardware works because I can boot SystemRescueCD from CD and get a flawless desktop presentation on the attached full HD TV.
>
> But in Debian 10, the colours are distorted. Have a look at "Nouveau.jpg" here: https://jumpshare.com/b/Se5d7xMu5tBSsR2Zcz8p
> I can get the colours to work by starting the kernel with "nomodeset". Look at the same link, "NoModeSet.jpg".
>
> SystemRescueCD (working nouveau version) uses an older kernel:
> root@sysresccd /root % uname -a
> Linux sysresccd 3.2.28-std300-amd64 #2 SMP Tue Aug 21 18:35:38 UTC 2012 x86_64 Intel(R) Core(TM)2 CPU 6420 @ 2.13GHz GenuineIntel GNU/Linux
>
> Debian 10.2 (distorted colours) uses this kernel:
> luker@michael:~$ uname -a
> Linux michael 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 GNU/Linux
>
> Is there a configuration setting in nouveau that causes those weird colours?
> Bit order/byte order maybe?

As you might suspect, there have been a few changes here and there
between v3.2, released in 2012, and v4.19, released in 2018. Could you
perhaps try a couple of Ubuntu (or pick-your-favorite-distro) LiveUSB
releases to see if you can narrow it down at all? You don't have to
install them, just booting them should reveal the issues, most likely.

This looks like either a messed up LUT, or a disagreement in color
layout in the framebuffer, e.g. RGB565 vs XRGB1555. The underlying
picture still has the correct shape, so it's not a 4- vs 2-byte
confusion. XRGB8888 vs XBGR8888 would look differently wrong, so it's
not the byte order (which the scanout engine does support flipping,
but we don't expose that in nouveau right now).

Does the vt console look OK? i.e. light-gray text on black background?
If you have colors in your shell, do they seem OK too?

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
