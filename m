Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9B34E9D4
	for <lists+nouveau@lfdr.de>; Tue, 30 Mar 2021 16:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2150E6E903;
	Tue, 30 Mar 2021 14:05:07 +0000 (UTC)
X-Original-To: Nouveau@lists.freedesktop.org
Delivered-To: Nouveau@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911516E903
 for <Nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 14:05:05 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id y17so14249384ila.6
 for <Nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 07:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZJTERZpInHvfX1WgVDfK/+91Wtfi/tX2sp94j2mcXS0=;
 b=qyouzxt2or6wak0ocOygma+nbg7NINT5eg21phwTaqpaFgGhHtygf1Z47Zep6PdMwW
 9tOtBKGmstqfFOUf2OyuK3JOhqmywtq6NtSu6OIwXjxcq3UPGJd3gU0y8doXbVumy/nl
 hACqrrNUr8jVxBNzQLbdrEXjJSSNmwYbeWm3Hi4Gdd8o7NCIRxZnHVHloUZUfzDC5nEa
 Lc+EH5stUib1Vgolv65q4upAdgAqW7fygK4Zqx9tJGQQsIbrVQUReQX+9IVEzbCUe9Dj
 5QYW9Kl3GtfKNGTG4ljY7XETa6XSOc224MBHUaSuY9Gm+EeUz5PC5eumGo7jVF/lkN85
 xWFA==
X-Gm-Message-State: AOAM532kuiDl1UCNOasVvj46o0/orEovZqjC7ScR7MpJYSG8d7qx0YG8
 dUUDXYlnGWG1yutdeQOpzuwYFQeR+gUHNcZMoz0=
X-Google-Smtp-Source: ABdhPJzEg7ZDkx7GRgEMJSAjvQMymRI2j/hvoygjOL/Yh5U7Rt6WpwURhCGN0oXR/womUMMe0SzTsAAyT0BW32Bbrb4=
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr25691677ilc.117.1617113104852; 
 Tue, 30 Mar 2021 07:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <AM5PR0201MB23868ACFBFA07B794174E1DCB57D9@AM5PR0201MB2386.eurprd02.prod.outlook.com>
 <CACO55ttjWMnSgF9gEtCFH9NU+X=-62gbmmYbawtJeUjGDunBCw@mail.gmail.com>
In-Reply-To: <CACO55ttjWMnSgF9gEtCFH9NU+X=-62gbmmYbawtJeUjGDunBCw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 30 Mar 2021 10:04:53 -0400
Message-ID: <CAKb7Uvh8UDP3VbayNxx4Zygm31Gq66KHS+rnz5+C6v1U2PqvjA@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] SLI support for nv44
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
Cc: nouveau <Nouveau@lists.freedesktop.org>, georges1897@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 4:25 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Tue, Mar 30, 2021 at 8:28 AM <georges1897@outlook.com> wrote:
> >
> > Hi,
> > I am currently the happy owner of a nforce 4 - SLI with two 7100gs graphics cards setup.
> > Since I've read on your features matrix that such a setup is rather uncommon among developers, I would like to help you implementing SLI for old GeForce cards as much as I can. The lack of support for newer kernels from Nvidia has indeed made my system obsolete (I do encounter graphical glitches with many DEs).
> > I can run tests with my hardware, try new drivers, and know the basics of C programming if necessary.
> >
> > If you think that I could be helpful in any way, don't hesitate to contact me back.
> >
>
> well, SLI is really low priority, so unless somebody is willing to
> reverse engineer the nvidia driver and implement the code in nouveau,
> I highly doubt there will be any progress on SLI in the near or far
> future. So if you want to help out, you'd do the full thing as there
> is nobody working on SLI. Some bits might already be reverse
> engineered though.

The tricky bit with SLI is how to split up the work. The original
Voodoo2 SLI was great -- the renderer would build up the scene, and
both boards would do the render, but alternate scanlines of what they
actually computed, effectively doing half the work. The specific
method of splitting doesn't matter, but the important part is that the
splitting is done. However with more modern software, you might have
an intermediate render, e.g. first you render a texture, then you use
that texture for the final render, then you have to recombine the two
render "halves" on both GPUs in order for them to have access to it
for the final render. This reduces SLI's effectiveness, and makes it
much trickier to manage.

If you wanted to improve the situation with that generation of
hardware, I'd definitely focus more on making it conform to GL 2.1.
This is a problem on which you can make measurable progress on. There
are a number of shortcomings there, and I think fixing them will help
resolve some of the issues you see with DEs. This is not an extremely
easy task -- if it were, it'd be done already. If you're interested in
diving in, join #nouveau on irc.freenode.net and we can talk further
about your abilities, goals, and next steps.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
