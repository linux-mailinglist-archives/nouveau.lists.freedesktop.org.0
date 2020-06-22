Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BD203F01
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 20:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB586E853;
	Mon, 22 Jun 2020 18:18:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8808E6E853
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 18:18:33 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id d5so4177637vkb.12
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 11:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0FX+WVP+yLe4sLYw9Y0g4l4lYRXJ3c7eIKP+pmxQeQM=;
 b=AsJzn9k5vbe3GnR8t7fIk4MP7wXmrM5PrOqSrkyQSsX5iNzMhdBLLmCoyoGB+J1Npn
 fkQE/bRBPt23tNL22hclOrxmPCoSeWrbK06c0MSEOsxNn340/sPvF19WCmrSbqPXcPYR
 XmLQDqlHk8kAJ2tE84HE0l2s2Q9p3/fHH5bFZRl7j5nl1q7xISAQ+7x+FI1Sbiru95uY
 sStl5DTK7GbhhCjvPSngJfq7BCa8JnHh6MSYbrghIW7lnEf5q/nN+DTX1SLsdpnrTZMP
 RKRd7L4YYXGzGHw5svrnykmu6kxx2v2VFtMXPEK76lUUSR0WKyGes/OO5Z4JVYSKh9TK
 W1GA==
X-Gm-Message-State: AOAM531r++StXmzbCuoSxznuC0tvo2zHkvcjyQVkcc5GPHQXUhQIj79H
 hJOYgtgf6U9uTReKrSpxKsQ1LlASqMegfIyXVH8VAuCb
X-Google-Smtp-Source: ABdhPJwoKrmy5Z8kVQRNRYgNhZ8FtvIZ3SZj/2aU8PfXd8hwMmVbfvVLlBeBi0QMRlS5P2/IcNeGZAEYeEGN5/4iTsQ=
X-Received: by 2002:a1f:d986:: with SMTP id q128mr7345941vkg.56.1592849912539; 
 Mon, 22 Jun 2020 11:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
 <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
 <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
 <CAKb7UviLWdO6Tm2ya7XFSGVLex_3rduM6Mxj-DFx-CZ+mksnoQ@mail.gmail.com>
 <6791f595dde33af22ef22165bcc643da@zonnet.nl>
In-Reply-To: <6791f595dde33af22ef22165bcc643da@zonnet.nl>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 22 Jun 2020 14:18:21 -0400
Message-ID: <CAKb7Uvjh6eRpGTEuTcOHrESe9b3Zf-qMoyZBBQMcQVhwmVCQXg@mail.gmail.com>
To: Jeroen Diederen <jjhdiederen@zonnet.nl>
Subject: Re: [Nouveau] nouveau on G5 Macs
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

OK. That's not tearing. That's like a bad pitch on an image.
(Presumably you only find the second image, IMG_1968.jpg,
problematic?)

I'm guessing you're using a GL-based compositor, which I fully expect
to work poorly. Please try a non-compositing or XRender-based
compositing environment.

Cheers,

  -ilia

On Mon, Jun 22, 2020 at 2:15 PM Jeroen Diederen <jjhdiederen@zonnet.nl> wrote:
>
> This is with 64k page size.
>
>
>
> Ilia Mirkin schreef op 2020-06-22 19:27:
> > I suspect screen tearing (as it's usually defined) is to be expected.
> > Can you take a photo of what you're seeing, since I'm suspecting it's
> > more than regular screen tearing?
> >
> > On Mon, Jun 22, 2020 at 12:08 PM Jeroen Diederen
> > <jjhdiederen@zonnet.nl> wrote:
> >>
> >> Hi Ilia,
> >>
> >> I experience screen tearing for both 64k and 4k page size.
> >> My iMac G5 has an nVidia Geforce FX 5200 Ultra GPU.
> >>
> >> Regards,
> >> Jeroen
> >>
> >>   Ilia Mirkin schreef op 2020-06-22 17:25:
> >> > Which GPU do you have? The NV40 AGP board (GeForce 6800) works
> >> > particularly poorly. However as long as you go with 4k pages (and
> >> > there's no real benefit to 64k pages for most applications), basic
> >> > things should work. I wouldn't recommend using a GL-based compositor
> >> > though.
> >> >
> >> > Which distortion are you talking about?
> >> >
> >> > Cheers,
> >> >
> >> >   -ilia
> >> >
> >> > On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen
> >> > <jjhdiederen@zonnet.nl> wrote:
> >> >>
> >> >> Hi all,
> >> >>
> >> >> I have been trying to solve nouveau issues on my iMac G5 for ages. As
> >> >> far as I can understand it, there is a problem with nouveau and page
> >> >> size mapping. I tried both 64K and 4K page size kernels and the the
> >> >> result is always distorted video.
> >> >> There is an old To-Do list, which says "fix the page size mapping
> >> >> problem on G5/64 bit for exposing fifo regs" on
> >> >> https://nouveau.freedesktop.org/wiki/ToDo/.
> >> >>
> >> >> Is there any chance that this bug will be fixed ? I am not a
> >> >> programmer,
> >> >> so I can't be of any help.
> >> >>
> >> >> Jeroen Diederen
> >> >> _______________________________________________
> >> >> Nouveau mailing list
> >> >> Nouveau@lists.freedesktop.org
> >> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
