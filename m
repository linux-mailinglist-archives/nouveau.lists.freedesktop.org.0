Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1F1C5E58
	for <lists+nouveau@lfdr.de>; Tue,  5 May 2020 19:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C1B6E7E6;
	Tue,  5 May 2020 17:06:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500CE6E7F1
 for <nouveau@lists.freedesktop.org>; Tue,  5 May 2020 17:06:44 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id m9so684629uaq.12
 for <nouveau@lists.freedesktop.org>; Tue, 05 May 2020 10:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZm72PBJuM81Xr74xOJYH5AUQAZmLQ9fUXabQljcKtU=;
 b=NEetz8uuEdHpm7LM+PHGEm2lia9VqbIr9QW1LXwKh7fXPIGjdTs+58BNk0G9gRys1r
 7lc/3YN9xHUNXuuzHGlPKzwQX2Y9KZUQfrP5ln1We1eGJGzfHItoIJiy6sCom90bThjU
 Qt6yqKKAX8FUw3zDS+/7NFdKlUta0qFzZMKiOhwvpw8VGSUjXrVi7Ch8lZWJHKRCVd50
 i7ITzemzboq8Nhj6llAMSTjLmRbKb8Xyu0+NinVqmvf93nVT5olMDwCxO2FvIMWFz6U4
 Y4aXYvmqyibZF2JssPdrciirrj/6covlikDe96IUmKJp9bUJY8gTn2TSXqrRZetz8L8m
 rCSA==
X-Gm-Message-State: AGi0PubAZFWBjsMvc3pSdsksaK0IGpH7+1mrHSlG8Xd44dpAbJd2GjzH
 tOVAzig6grByQTOTqMzMvE6JpYHlqxNj/hiMx0f1O/b7
X-Google-Smtp-Source: APiQypI/X4dy8GrX5Sb776qJRLQTBn1TuxzXwFiIwIDiNRj8L+EeZLLybyVLYnvL4EFoo2uRaGaZJTv6VVBAPAIu4aw=
X-Received: by 2002:ab0:5944:: with SMTP id o4mr3477973uad.98.1588698403269;
 Tue, 05 May 2020 10:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
 <CAKb7UvguvnBnauKhcc4CPoZE=vRzj46JWKQDND=MBJZ89p13vg@mail.gmail.com>
 <a6346e40-a4ed-0d59-47c9-3afea2dd7274@tripolho.com>
 <CAKb7Uvjt77zM0ATjwCNcCAh46+kj8HkOAinuN8vdUACKcPPGjg@mail.gmail.com>
 <ff90c308-a015-0dff-debc-40d618d9a579@tripolho.com>
In-Reply-To: <ff90c308-a015-0dff-debc-40d618d9a579@tripolho.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 5 May 2020 13:06:32 -0400
Message-ID: <CAKb7UvgxQichqLT2RmWUHJgO3DOm3ctxrNZx-GjchNiMvwxwfA@mail.gmail.com>
To: Alberto Sentieri <22t@tripolho.com>
Subject: Re: [Nouveau] problems with NVS310
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

Oh right. Wayland. Not sure how one gets the EDID out there...

On Tue, May 5, 2020 at 12:50 PM Alberto Sentieri <22t@tripolho.com> wrote:
>
> I guess the DVI adapter is passive.
>
> $ xrandr --props
> Screen 0: minimum 320 x 200, current 4480 x 1440, maximum 8192 x 8192
> XWAYLAND1 connected 1920x1080+0+0 (normal left inverted right x axis y
> axis) 510mm x 290mm
>      non-desktop: 0
>          supported: 0, 1
>     1920x1080     59.96*+
> XWAYLAND4 connected 2560x1440+1920+0 (normal left inverted right x axis
> y axis) 600mm x 340mm
>      non-desktop: 0
>          supported: 0, 1
>     2560x1440     59.91*+
>
> On 5/5/20 11:17 AM, Ilia Mirkin wrote:
> > On Tue, May 5, 2020 at 11:02 AM Alberto Sentieri <22t@tripolho.com> wrote:
> >> I have two monitors connected to the PC. One is an AOC 23" (1920 x 1080)
> >> and the other is a BenQ 27" (2560 x 1440). Nothing special about them.
> >> BenQ has a display port and the AOC uses some sort of DVI adapter.
> > Do you know if the DVI adapter is active or passive? (If you include
> > the EDID, that should become apparent. It should be visible in "xrandr
> > --props")
> >
> >> I have this event many times and I captured dmesg twice. At least at one
> >> time I captured dmesg my computer was under high load: it had about 15
> >> to 20 windows opened (spreadsheets, Thunderbird, Firefox, virtual
> >> machines under virtual box), there was a lot of disk activity and I was
> >> as trying to capture a screenshot from Firefox using the screenshot
> >> tool. I could not make everything fit into one screen, so I hit F11
> >> (while in Firefox), captured what I needed (now it fit), and when I
> >> pressed F11 again to make Firefox come back to a regular window, it
> >> locked: I could not move the mouse and caps lock led was frozen.
> > Hm, moving between full screen/not is at least a page-flip if wayland
> > is being used. I guess it's plausible.
> >
> >    -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
