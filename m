Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B514CE73
	for <lists+nouveau@lfdr.de>; Wed, 29 Jan 2020 17:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4284B6F5D6;
	Wed, 29 Jan 2020 16:34:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5A26F5D7
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2020 16:34:12 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id x123so122757vsc.2
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jan 2020 08:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFvD3+GPuXFYcXF8PT/ciavtP02Jzgp3kEo03sYVIn0=;
 b=mmEwTpENNTaH1QzK8rSFnz04ss3j/H5a3u0JRI5o/RK+hNdwY3hGvp9DGMv5arGcEc
 Kla21gEAbmny3mDAHh12W+oh8zk8BQDEU41Z5moN7wf1+69aQPP9ty5tHzm4IZszLXJI
 GN/W5p6yor4SFgYY5/HpxdY4tQQrCyNWyElzSBwVc2vSm1xEY9/ynsEZnjdr5fj2Fxnt
 ugYSBYkpbri4UIIcGAeiwEAovI2fP8si8KI9W3p6HL4lkqxR037bddhhCqG/1tMocuQS
 ZRJBic9z9pTGCyCZR/FKkXVHpUxL58pmnCYviKVnjqx6/0o9yyYboy/JDEBe3UVHWbC8
 LhfQ==
X-Gm-Message-State: APjAAAX9mu6MbdJN1fMZ01qI6kd2xNyGteqwo+3bQuBNM0DNx7/Q3rBO
 91d+/KW30Rj4DL6NQxy7tchDDz7K/5m9YCq220g=
X-Google-Smtp-Source: APXvYqyAMDKGZpQ12OU4/JbP9rXdV0w0rmeLlb8SHB8RKd8Ljp+b1oK5JO3+RWV2DyVcvip62p+z5JsA982OlqXlplY=
X-Received: by 2002:a05:6102:3024:: with SMTP id
 v4mr159637vsa.220.1580315651470; 
 Wed, 29 Jan 2020 08:34:11 -0800 (PST)
MIME-Version: 1.0
References: <CAD8U+g8AJD-Duxm4tkyiGSNCsnqU=xdpE1YAmd0_iU4uN7Ecqg@mail.gmail.com>
 <CAKb7Uviwt5O2b06iG0xC21dLmo+Qs0HUw40D6R1xFpvPowoLAg@mail.gmail.com>
 <CAD8U+g9CaGc=EN0UCgbCW0g6sgA_c=fBJXpiHgpyH8_Op33Fbg@mail.gmail.com>
 <CAD8U+g8gOabGeSKkGnQ0Ub0Zk8HaWdBB3Zwv4N=DXKDKh-eo1Q@mail.gmail.com>
 <CAKb7UvgZV7zk_vpMf9bCWrV8MpvqEnkcG4h55BgE+WLV_e13=g@mail.gmail.com>
 <CAD8U+g8GPb8J+3YC-ALYqRUXPQHvQse6Ff9HGRDPk2kfzkUhfg@mail.gmail.com>
In-Reply-To: <CAD8U+g8GPb8J+3YC-ALYqRUXPQHvQse6Ff9HGRDPk2kfzkUhfg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 29 Jan 2020 11:33:59 -0500
Message-ID: <CAKb7UvjJ-M4ZHckA=-3VfmPtHvkMtSjUL1QiX1Z8UBCFVtnDxQ@mail.gmail.com>
To: riveravaldez <riveravaldezmail@gmail.com>
Subject: Re: [Nouveau] System freeze: Debian Testing with C61 [GeForce 7025
 / nForce 630a]
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

On Wed, Jan 29, 2020 at 5:03 AM riveravaldez <riveravaldezmail@gmail.com> wrote:
>
> On 12/11/18, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > On Tue, Dec 11, 2018 at 11:16 AM riveravaldez
> > <riveravaldezmail@gmail.com> wrote:
> >
> >> The freezes appears randomly, in every situation, and not when I
> >> launch some 3D applications or anything similar.
> >
> > Try removing nouveau_dri.so -- that will ensure no 3d accel is used,
> > while keeping your 2d accel provided by the nouveau ddx.
>
> Sorry if it's wrong to continue this old thread, but after a good
> amount of testing (+1 year) I can confirm that both the problem and
> the solution where the mentioned ones.
>
> The problem (random full-system freezes) persists without change,
> identical. And removing nouveau_dri.so from
> /usr/lib/x86_64-linux-gnu/dri/ effectively fixes it completely
> (leaving aside any lost of performance and some warning messages in
> system upgrades and programs launching[1]).
>
> So, after a GREAT thank-you to Ilia, I consult:
>
> 1. Is this something that could be fixed? Can I do anything to help?
>
> 2. If the only possible/viable solution is the mentioned one (remove
> nouveau_dri.so), which would be the proper way to make it permanent?
>
> 2'. In many dist-upgrades the nouveau_dri.so file is re-created in the
> same folder, what would be a clean/neat way to handle this?
>
> Thanks A LOT again.
>
> [1] A lot of lines like these on some dist-upgrades:
>
> W: Possible missing firmware
> /lib/firmware/nvidia/gp100/gr/sw_method_init.bin for module nouveau
> W: Possible missing firmware
> /lib/firmware/nvidia/gp100/gr/sw_bundle_init.bin for module nouveau
> W: Possible missing firmware
> /lib/firmware/nvidia/gp100/gr/sw_nonctx.bin for module nouveau
> (...)

Sounds like your initramfs builder tries to include these but they're
not available on your filesystem. As long as you're not plugging a
Pascal GPU into your system, you're fine.

>
> And a lot of programs producing messages like these on start:
>
> libGL error: unable to load driver: nouveau_dri.so
> libGL error: driver pointer missing
> libGL error: failed to load driver: nouveau

Hmmmm annoying. I hadn't considered that. I could add an option to the
DDX which makes the default driver "swrast" or something. I also
wonder if just not loading the "glx" and "dri2" X modules would be
sufficient to get rid of these.

You can also stick LIBGL_ALWAYS_SOFTWARE=1 into your /etc/environment
(or whatever location causes that env var to appear everywhere) which
will force it to use swrast. (With the added benefit of being able to
unset it for the programs where you really do want 3d accel.)

As for a more permanent fix, one could invest developer attention to
the nv30 gallium driver, but that one would first have to be located.
I'd be happy to provide some limited mentoring in such a case.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
