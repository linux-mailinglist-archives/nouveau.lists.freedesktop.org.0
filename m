Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D431F6357
	for <lists+nouveau@lfdr.de>; Thu, 11 Jun 2020 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E926E8B2;
	Thu, 11 Jun 2020 08:12:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435C16E038
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2020 08:12:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id o5so5324670iow.8
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2020 01:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDfa4+jXZ9ulsLY5WKCYieKo7asoV0jE5raIUBCwu3E=;
 b=m5t8Bz4MRofIIRs+WrQSDZwHw0H8/wYC4xq3slGdkV36tKpMJRV8d4jBMWxYlu0xam
 Ew9Q/3I8xsNpANdA98LfZi8rRQT1T21dZHmNMrbMBq7w/1Jd6hRdkxZoFrREF58OZJWN
 mY6aaa+mGIOOAUaYvPu6RLE0blvu0gyvwBFcSMc4K1fAMgflbpTgSech0O7FrJTOwaLh
 InL3AZDhHRqH4a9xfaQbOffx4L+rG6/U7BHt24X7JyhfcJhCzlEj/QV1ei016lhUvhHb
 yC5DqTaAhmr1r+TKRVwsJErZDYG4FLItUX1dY9+vLcv3Bm/qsbB/N+Zul0tgE/yqQ/AI
 wI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDfa4+jXZ9ulsLY5WKCYieKo7asoV0jE5raIUBCwu3E=;
 b=HmcI8YcsvQA1xV2sviRASsELwbMjSDuGLyggf4Fcfz0/Kvgb2h5SYWwz7pLe4VkdKs
 bTIjV7EGIBDTDvuV1wgpXA+jU3OkBkoVWkmLHX4K5yujC4T720WF6BWB9MVV9es3I1hP
 6cyzE6qz2BMNu/RRzP1oskje3mZFUUTpeK5nFQ/qFapOt/Ammx9olaN1xIz07eiIj7aZ
 3AZ3PG2hphNmKxA4up/Zp09cagsCC2CV2t8WMzkpmb53a2AqD8IyqmEL4/yNXIBmDBRt
 YgethokbUtkyTq80hesi5lSqHW2PGlIlNHBtDBrNpOd/a0oYY+Y5HHkJ+AVfLjvzNAF/
 J9XA==
X-Gm-Message-State: AOAM533lWm6Is+0PFaaSM3Ewfonzc4/y56GG21hoMDdUuLQOrlhJlxPN
 c1MyLlj0OfRZRIfVlcMsOguptOyz/JGnYZifmpQvdjJGOUU=
X-Google-Smtp-Source: ABdhPJzAm3bBTmpi7aZrgpXDcEocIqrcqoYVsUlHQV9H2bX+oYHTvbEmauteQggXeMYqpnl5AOcXAfJyXfILIAFIuDQ=
X-Received: by 2002:a05:6602:15c8:: with SMTP id
 f8mr7249309iow.183.1591863143330; 
 Thu, 11 Jun 2020 01:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
 <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
 <CAOkhzLUQXAB1-=2VasSeJC9-LDgsd0Sk-pJY2LBbHaLqpcBeLg@mail.gmail.com>
In-Reply-To: <CAOkhzLUQXAB1-=2VasSeJC9-LDgsd0Sk-pJY2LBbHaLqpcBeLg@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 11 Jun 2020 10:12:12 +0200
Message-ID: <CAOkhzLUrm6bS1ejmBdCOmU4G7O=t0XU_0PqYPx4AssGm5z1uCw@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [Nouveau] Kernel 5.7.0, nouveau 1.0.15-r1, sudo lshw -C display,
 *-display UNCLAIMED
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi

With Kernel 5.7.0, nouveau drivers 1.0.15-r1

sudo `lshw -C display`

will show me:

 *-display UNCLAIMED

Also `xrandr -q` will not work:

xrandr: Failed to get size of gamma for output default
Screen 0: minimum 1680 x 1050, current 1680 x 1050, maximum 1680 x 1050
default connected primary 1680x1050+0+0 0mm x 0mm
   1680x1050      0.00*

So I can not start up my second monitor with this command:

xrandr --output DVI-D-1 --auto --output DP-1 --auto --left-of DVI-D-1

This used to work with Kernel 5.5.

It was "completely broken" in 5.6 and with 5.7 my first display is
back, but not my second.

I am on Gentoo Linux. Please CC for replies.

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
