Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386F19DD25
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 19:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC1D6EC51;
	Fri,  3 Apr 2020 17:50:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964806EC51
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 17:50:35 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id n13so8127931ilm.5
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmbhyIXmrz+eNo1jIqzI2XdU/nrTp4OGNmpl1Xh9tlE=;
 b=lm5/aTooU44NMBlr4XRbWZlbS90lcTyzPtJs3e5G9WlcH4qFPFb5U4V79JlJC7zpy2
 lyrtFy5OH0aEDUc5ex72Pda5HrQr3cTwgr87ENFQD51Nz2aINFcg/PhHV9DXvCZkK+Ut
 6Zwu2LhZ0Sd3/42DaffSxvg4C5ob4Ds5w/A4lEZH0bNSiJshH8znQcbnPhdtdAWxbvgk
 UqVhMiu7mQCjEP7tbjSih2juMFe9yJ1nL0113WbzkaQjo6qtlm9tBEAEweTX5R8OXk8W
 LNUebeKogogKCyTq6xi1XCg+D8BLAxLgf1sV++4auatsVXM9Veb5K2nHR2Si4vzlSGzU
 e3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmbhyIXmrz+eNo1jIqzI2XdU/nrTp4OGNmpl1Xh9tlE=;
 b=Z0ppw+ngf2y9awDxODxV6mLKxtBTOctIrBmI+DwQMKG0yY53c7iW9dx8+Us5GcBRYN
 IpcH0itMGQ10DjcHRmDoAI+9YjYLXmjncyhRay5mWrjB6JGB12KAebjHH1GTEpdW7dDr
 mZ9c3KNbdSDibJApdbT7b7LdliFento3X8C34BuuPqcxalih16yUCvJE1nHF61zGFd7V
 G/pF6VLt2RLIweaLXzJhPCDN19t1zQI52xJADASghKJSR7Yt/jr4vGvTah9p92dmTONo
 cL+08NvJ1CTSq8Ha9NFn7F2D+JZlZffnN9OTkTg17IVRN5ePh2f3O7cWXC2i0OX7bbJl
 ssSQ==
X-Gm-Message-State: AGi0PubC/+rRbscgUeCAuuwjV4wmk3VL1dLa/tY6VsDfD8Jk2+8fVJuX
 nBEWH3ezQKSrFnxZa4NjAE2Yq/c8BjlxnDmBmJA=
X-Google-Smtp-Source: APiQypJUI/cNcfEfFINez/lK2NJEElF5lQsf2V1rbSAdEODWz872zQxP1xvg9cmBBo5EnsX29e+foBCKOP2nOJZSx5Q=
X-Received: by 2002:a92:8d0e:: with SMTP id s14mr9593675ild.117.1585936234915; 
 Fri, 03 Apr 2020 10:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
 <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
In-Reply-To: <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 3 Apr 2020 19:50:23 +0200
Message-ID: <CAOkhzLUE62zCKt1wCQjOVz=7keSHVFHDfqZhN54_-0LtC7BoAw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
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

On Fri, Apr 3, 2020 at 7:23 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Fri, Apr 3, 2020 at 1:21 PM Zeno Davatz <zdavatz@gmail.com> wrote:
> >
> > On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Ben -- probably the ACR changes in 5.6 don't fall back nicely anymore
> > > when there's no firmware? The load shouldn't be failed, just GR
> > > disabled...
> > >
> > > Zeno -- if you grab linux-firmware, it should be all better. Not sure
> > > if you're missing it on purpose or by accident.
> >
> > Thank you, Ilia
> >
> > I will try that on my Gentoo/Funtoo machine now. So far linux-firmware
> > was not needed with Kernel 5.5, so it was not installed on my machine.
>
> It was needed on 5.5 as well. It's just that it fell back gracefully
> without firmware, and you didn't get any acceleration features.

Thank you, Ilia

Installing linux-firmware-20200122 on Gentoo/Funtoo Linux with Kernel
5.6 did not really help.

I still get the same message.

~> dmesg | grep nouveau
[    0.762819] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
[    0.875252] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
[    0.875552] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875651] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875751] nouveau 0000:05:00.0: acr ctor failed, -2
[    0.875850] nouveau: probe of 0000:05:00.0 failed with error -2
~> uname -a
Linux zenogentoo 5.6.0 #74 SMP Fri Apr 3 19:44:55 CEST 2020 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux

is there any other Kernel setting I need for 5.6?

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
