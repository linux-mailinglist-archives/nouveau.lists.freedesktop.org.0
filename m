Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4F1EE85E
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 18:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD95D6E4F8;
	Thu,  4 Jun 2020 16:13:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891C36E4F8
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 16:13:47 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id g129so3865127vsc.4
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 09:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OP87Zw/IFo1icTUKy9gN1j2abZ8iJJoEohAgcxBcIRU=;
 b=jG/CofiQ5c0YHytZsVtLF2hLuc2TdGImjpdlUDHdzCgFBHcLNeZKnqiNEaj1/aP516
 KH0/+jrbaswE0JnXZl8My7lbrufCnDsU0V+1KWHluY/TWAJ27ihUJNzxZC9HyLHZeC1Q
 WMd7kCr5x1F3f7Nn0HafbV/oat8eGKfU4+1lJHTL+4Re1RU0xyTxqDLbJh34dpPSNTKv
 8Kn1f0dZzmIB0FXdCqoVsFsj5lLhssHCm2sGmK2gdh9Y+AYn/a92w9HJmYjsh1JpwqMj
 qHY5eRBuJUpjw1Ke2WoOEvA0mcGAELq9BAV3ikoVR38QQbVn9kYhT8KG+1vcPDlIZPew
 idHg==
X-Gm-Message-State: AOAM531c2+UKUqRV9IenTiw795LKADdTDgBX/9063KUB26UukLASndjj
 /9hL/mMgiF9JjRd7jXLg5xpqf6Jj0Vh5glLHdXetYO07
X-Google-Smtp-Source: ABdhPJyZmGGDLNY7IQLFjPubFoChqilyzfCrDlHMylGl4TFQjwe3hKLPiVqvAiFOFQvqjwK4eN42b6KxRFZUg2EOyi8=
X-Received: by 2002:a67:df8f:: with SMTP id x15mr4021008vsk.18.1591287226527; 
 Thu, 04 Jun 2020 09:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
In-Reply-To: <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 4 Jun 2020 12:13:35 -0400
Message-ID: <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
To: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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

On Thu, Jun 4, 2020 at 12:04 PM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> Thank you, Ilia
>
> On Thu, Jun 4, 2020 at 5:25 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> > There's a lot more firmware files than that ... everything in the
> > gp107 directory. Also this would only be necessary if nouveau is built
> > into the kernel. The files just have to be available whenever nouveau
> > is loaded -- if it's built in, that means the firmware has to be baked
> > into the kernel too. If it's loaded from initrd, that means the
> > firmware has to be in initrd. If it's loaded after boot, then the
> > firmware has to be available after boot.
>
> For the time being I got it working by removing all nouveau selections
> in "make menuconfig" and by emerging "x11-drivers/nvidia-drivers"
> Version 440.82.
>
> Back on the latest Linux Kernel. Feels great ;).
>
> Linux zenogentoo 5.7.0 #84 SMP Thu Jun 4 17:47:15 CEST 2020 x86_64
> Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

Not sure why you bother asking questions when you're just going to
dump nouveau anyways. This is the second time I've answered your
questions on this very topic, I think it'll be the last too.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
