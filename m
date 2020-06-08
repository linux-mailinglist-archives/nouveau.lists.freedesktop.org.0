Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2421F13FA
	for <lists+nouveau@lfdr.de>; Mon,  8 Jun 2020 09:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6CB6E0EF;
	Mon,  8 Jun 2020 07:52:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA3D6E0EF
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2020 07:52:37 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h3so15789498ilh.13
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jun 2020 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WV7BGV6+mEZwraMDjdp2nR5SYEH9cq5Koj6bSPDzdFg=;
 b=iiDQkzO51Ud8doQx/Fvh2frErrXLmcQWVjwu4YrZ9CdsCem3uJBtlf0qS6ZgGxg6il
 hpclaZv49UZ7Pmh1g/QoVFpBj1RwKms62u9Jam9CCMfYI4Ioo4T1qjzFYaTzuVuR3Kq3
 2YQglGzdTR1gFim4n2GLGNuhF30EPKuTm7dD76Ner6RGMNYPfv0PaMhm6X0tN88Cn8RN
 O1E8Jts4ICVCMSq86MRU942h2PwipxwDNA6tAwGs5y0243Z6YfSpavFKT/jOmeerlrEZ
 DoxzTu25LqTY6rSjPuB66MA3GM5MdbaaMkK8xcUta4aBv89kNNnUgvugET8DbmzsImT0
 QHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WV7BGV6+mEZwraMDjdp2nR5SYEH9cq5Koj6bSPDzdFg=;
 b=J+iNl4jSUKvxnYKZXIfexLjt9miWkOG3s9nVQnt57rV8u4kCw8xb8EdrZ5KjuJ4YWz
 pz4H2hzqt22HvC9hIAqEZuoS9md7THwRKg20HyqUjW1JV7dA7z+U89StzYiL0g8KScSC
 MVetCEwGjCPE3cApA82aaZATjpWKz+wA5gY62REsHiYnNnWnUMpck4TitSOe0NVSbmam
 7586vKXXKCdOt4wNEFwvqbHY2ucoLwGJgbs31KtfIFI+wdCBRgEuvIwBjguKqzy6TG4A
 etDM8u0zYvBlfAfZJflKVLM3q56URIGgfT8nxKIJW9xU8HCGKTvxfxHfC5J8rNnQTkaI
 NsRA==
X-Gm-Message-State: AOAM5325DDleoQ+UkBa6YFqNxHrSMT+jrvQRmE0fEIdtq1gu7hDWc61H
 W8fyzZ70DhP225ItTBVE3TWR7boF9WqOTfya3OQ=
X-Google-Smtp-Source: ABdhPJz6HjW2AjMShnUHb5sUGouse+q5w4H3QF05k31/UU5NL88h0qkyrEVgMXxUvTa1t/7MDpYLI7cZU0Ra8tqVWrs=
X-Received: by 2002:a92:af44:: with SMTP id n65mr19226418ili.61.1591602757110; 
 Mon, 08 Jun 2020 00:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
 <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
In-Reply-To: <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Mon, 8 Jun 2020 09:52:25 +0200
Message-ID: <CAOkhzLUQXAB1-=2VasSeJC9-LDgsd0Sk-pJY2LBbHaLqpcBeLg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [Nouveau] xrandr: Failed to get size of gamma for output default
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Dear Ilia

On Thu, Jun 4, 2020 at 6:13 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Not sure why you bother asking questions when you're just going to
> dump nouveau anyways. This is the second time I've answered your
> questions on this very topic, I think it'll be the last too.

I tried again and removed the Nvidia-Drivers with

sudo emerge -C x11-drivers/nvidia-drivers

and installed

sudo emerge x11-drivers/xf86-video-nouveau

this works with Kernel 5.7.0!

~> inxi -G
Graphics:  Device-1: NVIDIA GP107 driver: N/A
           Display: server: X.Org 1.20.5 driver: nouveau,vesa
unloaded: modesetting resolution: 1680x1050~N/A
           OpenGL: renderer: Rasterizer v: 2.1 Mesa 19.1.4

but now xrandr no longer works.

~> xrandr -q

Screen 0: minimum 1680 x 1050, current 1680 x 1050, maximum 1680 x 1050
default connected 1680x1050+0+0 0mm x 0mm
   1680x1050      0.00*

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
