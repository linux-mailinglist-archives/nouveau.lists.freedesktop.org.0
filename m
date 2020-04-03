Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD219DCA4
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 19:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550406EC35;
	Fri,  3 Apr 2020 17:23:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA766EC35
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 17:23:44 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b5so5470260vsb.1
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 10:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VaG0J6TcwrQRrhJdGp1aQjEpbn+t6z6Op/0x/M/OrqA=;
 b=iGWVkpz/hcnkMt7Bx0rmrtk0acGtAtonZFrBV62skAUAoZl66BGixnoM7oNhjI5jaP
 nLXaZbRqn405/n/eG+5os9zG48lxWeGkV3LqNX8wb5yVUWGIQfuGuBIsMiD5aNAL+S+J
 GAaKa0Ovs8xUSeAVrXfe2qFXsbvWIEMRZ5SwA3LOtRS0QDEUkCC20AOObdRAocOSiTNe
 wkiJINiq1Zby9Wb90NxngZEvOYR7mh5ROOaGU7sMANAy+twbXKDC+gxrYamryTnYfhQt
 4iW9cKUywHwOmsBezFe7v0wyqHhtGAQYJNy9euJMU8dGKUW1b7kwwofL/ZAtjIM5+ISM
 QnsQ==
X-Gm-Message-State: AGi0PuZ+S9bk6g1DSgMdNftY5kv/vY18/U6qAToIfsMF0iZgLys32+9c
 STJWcNsFA24mc/6Hvy7aVFyvQUuCxfrEHXAWprY=
X-Google-Smtp-Source: APiQypI9/APBBqT5TAeFzEsrAZKxbGJSqx02OnCkRE/9/KLWU5Y9hGOKTVl6IWDGfcFXW7oecrPRZ9rjxMg+lEqArIY=
X-Received: by 2002:a67:f754:: with SMTP id w20mr7082757vso.220.1585934623824; 
 Fri, 03 Apr 2020 10:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
In-Reply-To: <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 3 Apr 2020 13:23:32 -0400
Message-ID: <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
To: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: [Nouveau] acr: failed to load firmware with Kernel 5.6. Kernel
 5.5 works just fine.
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 1:21 PM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Ben -- probably the ACR changes in 5.6 don't fall back nicely anymore
> > when there's no firmware? The load shouldn't be failed, just GR
> > disabled...
> >
> > Zeno -- if you grab linux-firmware, it should be all better. Not sure
> > if you're missing it on purpose or by accident.
>
> Thank you, Ilia
>
> I will try that on my Gentoo/Funtoo machine now. So far linux-firmware
> was not needed with Kernel 5.5, so it was not installed on my machine.

It was needed on 5.5 as well. It's just that it fell back gracefully
without firmware, and you didn't get any acceleration features.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
