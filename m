Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40988203DD5
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 19:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93616E03C;
	Mon, 22 Jun 2020 17:27:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EE46E03C
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 17:27:15 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id e15so407362vsc.7
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 10:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NusTTh7NbeF2tt5sTeQwvBlftUwXbwW7HZH98hbsSNw=;
 b=tU3M5dvUGJgTcfA0pypg8KTPCDsN1jpJ16YSDMStsH9uBgavEvKn5jHZ9llFlPye+d
 EnL1LNOsORoDfybJ4PnrMdvDeu3U0wNev+7lcU9Yf0uIXlZX2cs4keXAEBkr4BXYUPTn
 xFIzIALkxdcrHZrNJHtMv2W1pNXFe6sgNaETm2KHN2DgD3YG9gK0WX6iiHmTU65srkXG
 rAPsDTEaH0bOW3f/poaDR9vWmOUG6wUqpwlCyQp+rVjcr5AcXh8Ozz2CR3v7Fl9HG1YA
 M8Tb5gxSdEspWhvpXbd7T7zdKK+rE/ZKgNFYqvvT7IRmht+CD+ZvxGrHbt7gMeQ5vCVn
 GwRA==
X-Gm-Message-State: AOAM5320GKkcE3OmyKIuu5Hgg0GvzNsdM8V5LLuJx10ByHW5ZPO9lAJ3
 MkkfMDUIe7CK0Sgqjngg+Zad6Yl9RMYzCAtcKhUsuMzW
X-Google-Smtp-Source: ABdhPJzUhvicBGUsYp8HgGMt9ZAT2Bx3tLJMS6jAUne91uxjIE1dvN+6R8XR+foXxedXco/90R5Wq9yofGGeJTF0Jig=
X-Received: by 2002:a67:3083:: with SMTP id
 w125mr17739651vsw.207.1592846834233; 
 Mon, 22 Jun 2020 10:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
 <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
 <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
In-Reply-To: <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 22 Jun 2020 13:27:03 -0400
Message-ID: <CAKb7UviLWdO6Tm2ya7XFSGVLex_3rduM6Mxj-DFx-CZ+mksnoQ@mail.gmail.com>
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

I suspect screen tearing (as it's usually defined) is to be expected.
Can you take a photo of what you're seeing, since I'm suspecting it's
more than regular screen tearing?

On Mon, Jun 22, 2020 at 12:08 PM Jeroen Diederen <jjhdiederen@zonnet.nl> wrote:
>
> Hi Ilia,
>
> I experience screen tearing for both 64k and 4k page size.
> My iMac G5 has an nVidia Geforce FX 5200 Ultra GPU.
>
> Regards,
> Jeroen
>
>   Ilia Mirkin schreef op 2020-06-22 17:25:
> > Which GPU do you have? The NV40 AGP board (GeForce 6800) works
> > particularly poorly. However as long as you go with 4k pages (and
> > there's no real benefit to 64k pages for most applications), basic
> > things should work. I wouldn't recommend using a GL-based compositor
> > though.
> >
> > Which distortion are you talking about?
> >
> > Cheers,
> >
> >   -ilia
> >
> > On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen
> > <jjhdiederen@zonnet.nl> wrote:
> >>
> >> Hi all,
> >>
> >> I have been trying to solve nouveau issues on my iMac G5 for ages. As
> >> far as I can understand it, there is a problem with nouveau and page
> >> size mapping. I tried both 64K and 4K page size kernels and the the
> >> result is always distorted video.
> >> There is an old To-Do list, which says "fix the page size mapping
> >> problem on G5/64 bit for exposing fifo regs" on
> >> https://nouveau.freedesktop.org/wiki/ToDo/.
> >>
> >> Is there any chance that this bug will be fixed ? I am not a
> >> programmer,
> >> so I can't be of any help.
> >>
> >> Jeroen Diederen
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
