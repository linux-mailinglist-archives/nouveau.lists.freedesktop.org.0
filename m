Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A323214DFE
	for <lists+nouveau@lfdr.de>; Sun,  5 Jul 2020 18:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2160D89861;
	Sun,  5 Jul 2020 16:35:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84F589861
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jul 2020 16:35:30 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id s20so12021467vsq.5
 for <nouveau@lists.freedesktop.org>; Sun, 05 Jul 2020 09:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0/BjR2NeZY54eG5HClH3zjfWNDKpB15ekPPvr9Ks5g=;
 b=TSsFO9hXNL0ssJClkSEDOXxniArHvee/B4b56C7xHYnXZ5HVMPgE/wjRJxnEFSdEXO
 UnaBEpmNMq1Etp9m0T16m9e5s+yaDUri+uctyNzuttsNvL6iYCWAeKUIOQUn77bYSVMc
 38zTHUxZQQ77j8pmDI3zQTCdJv383DzbXUbXZqNdYrMMkCQrZXvmXzGseeQrn0O4JQ7J
 0AzagGouPFWZ04NcR8aX6gF0+/UM8IdVADcgBQfJB5RulPUfK2Q6nlAG4oU7dheuP3jy
 1uySo+tai19W6Bz0eYuln5QsW/vW7IC/Q9d1T2FjCPKIecgItPjzgm1OKfPtrh//E5pu
 VYvA==
X-Gm-Message-State: AOAM5327LxsbhQaedr/vZmLSh0oG/rGjzzKNrT4tnZDCM22nrSU7VA1f
 lq/Q0Geb44GhXOrnmmyQkaIsQ/Ff0GMj578BWQVh3TmZ
X-Google-Smtp-Source: ABdhPJx4edvz6WTwOE4OYXOBiDbyy7Usf1kY6jfctXLKJ1M+TA2w0h05U5MYs0MX3ixL3EHYukAiAJaWJiCkbwFzNA8=
X-Received: by 2002:a05:6102:99:: with SMTP id
 t25mr12892377vsp.210.1593966929650; 
 Sun, 05 Jul 2020 09:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <8e6b4c97-41fa-ffaa-3580-1eee8d7d54f3@michaelkloos.com>
In-Reply-To: <8e6b4c97-41fa-ffaa-3580-1eee8d7d54f3@michaelkloos.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 5 Jul 2020 12:35:18 -0400
Message-ID: <CAKb7UvjHqAtH4+R70VbpE-dXe3y0=ZWdvRdWpQC1m-gK=NxoDw@mail.gmail.com>
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

Are you setting the overallocation to 200?

On Sun, Jul 5, 2020 at 3:41 AM Michael T. Kloos
<michael@michaelkloos.com> wrote:
>
> Does NOUVEAU support mmaping a double-sized Framebuffer?
> When attempting to run, where fd refers to "/dev/fb0":
>
> mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>
> I get back an invalid argument error.  This doesn't happen if I only
> request a single screensize.  Is this a limitation of the driver?
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
