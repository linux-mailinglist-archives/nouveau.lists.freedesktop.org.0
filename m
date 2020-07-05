Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A446214EF8
	for <lists+nouveau@lfdr.de>; Sun,  5 Jul 2020 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA756EC3B;
	Sun,  5 Jul 2020 19:45:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBA66EC3B
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jul 2020 19:45:12 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id q15so8786286vso.9
 for <nouveau@lists.freedesktop.org>; Sun, 05 Jul 2020 12:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xpd/jGwEcyJeFtI7rrIXziURPP+TGClDkRlTVXWUiKY=;
 b=jWGGvhSVRckYLkpbRYjPF62bItC5xG+Rmx2wqGx4dP6jizbIK7XLMAAsK9rfK59UV1
 YLU6LGhWWwhrpRQ7nRCgYjLlXX9m8HuLAYZ5bGUs8N8wmomdEQzXPU4L/3va8TlpClzW
 wHo+ogKbGXLQolVJYeYUMHVddpdTLTusVpzKKudGc0Vu50uLy3/z43HopyvH+6G0fcbO
 67R1YJqxKC51ix6ZbIPYnZi7qXyEuorF3JQZ2+kCS046qXwNT2biQVl6TK/dct/9DCZC
 O8+ayiGleKvlpdpSefGXu7gt5E93zIQ9FgmNOEoEAWEMIDWJYXKF4ynM+1V0qpZo4txp
 QaRA==
X-Gm-Message-State: AOAM532+TQ/elJJ/LmdFFgi71+cgZZxloy1HCRUgvjXDWB3LdO5sCCJ5
 uxZsFYAI50R5snSE0qkg8DEoSs6LmFXRmWYqaQw=
X-Google-Smtp-Source: ABdhPJzWf+ZfVP4Nifok+zzdUsvUKy4ge535E8yus3tFh96QbduUyusU0Cki1q+xRLzr5DWYYV1FIjU2DElbQuPBbkU=
X-Received: by 2002:a67:2f55:: with SMTP id v82mr34909749vsv.207.1593978311990; 
 Sun, 05 Jul 2020 12:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAKb7UvjHqAtH4+R70VbpE-dXe3y0=ZWdvRdWpQC1m-gK=NxoDw@mail.gmail.com>
 <f4f3a042-78a3-46d9-b452-bb1d251a7391@email.android.com>
In-Reply-To: <f4f3a042-78a3-46d9-b452-bb1d251a7391@email.android.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 5 Jul 2020 15:45:00 -0400
Message-ID: <CAKb7Uvi5=H3pNO4eKT37jsN8+KUS6a7dLKOpYsOwkc44pVc6Xg@mail.gmail.com>
To: "Michael T. Kloos" <michael@michaelkloos.com>
Subject: Re: [Nouveau] Framebuffer double buffering (via FBIOPAN_DISPLAY)
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

Try booting with drm_kms_helper.drm_fbdev_overalloc=200 and see if it
works with that. (There's also CONFIG_DRM_FBDEV_OVERALLOC which sets
the default.)

Cheers,

  -ilia

On Sun, Jul 5, 2020 at 3:41 PM <michael@michaelkloos.com> wrote:
>
> I am not familiar with that setting, but I have really struggled to find documentation on dealing with the framebuffer.  Referring to this guide, "http://betteros.org/tut/graphics1.php#doublebuffer", I attempted to set the mmap allocation size to double, but it caused the mmap to fail.  I no longer believe that it is a driver issue, though, because I just tried it again on a dell laptop with Intel HD Graphics 4400 to the same failure.
>
> On Jul 5, 2020 12:35, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Are you setting the overallocation to 200?
>
> On Sun, Jul 5, 2020 at 3:41 AM Michael T. Kloos
> <michael@michaelkloos.com> wrote:
> >
> > Does NOUVEAU support mmaping a double-sized Framebuffer?
> > When attempting to run, where fd refers to "/dev/fb0":
> >
> > mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> >
> > I get back an invalid argument error.  This doesn't happen if I only
> > request a single screensize.  Is this a limitation of the driver?
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
