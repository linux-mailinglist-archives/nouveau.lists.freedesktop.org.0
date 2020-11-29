Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014A2C7BC3
	for <lists+nouveau@lfdr.de>; Mon, 30 Nov 2020 00:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0126E15E;
	Sun, 29 Nov 2020 23:00:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFAE6E15E
 for <nouveau@lists.freedesktop.org>; Sun, 29 Nov 2020 23:00:13 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id q5so2888611vsg.0
 for <nouveau@lists.freedesktop.org>; Sun, 29 Nov 2020 15:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2q7TH//VMqnMlsZd+bBTyEmaTMMyyUl7Wc7ArqK4iU=;
 b=OZeLhSxDvfvhRhwv/4Kh9+HyiIRAbKzdhExzcNjCsHjoTsYL2Yr7sBI4j0icZ/Ipuz
 1lbu/U3VVHAzn8OVcnuCOUhIi/CTsxE32qqaQKvUEED0/ML54xJjhccyvJ2ggjyVUptr
 fGNlHQJXxiBjE2IZOxI410PCDIyx9SAC169vkXGf0qXg7a/kvtRS5dAgTYugCNakvZdb
 e1uKiRxEiptn8eahcRbSnM6i2V3LXTvbpmD1zbe/SCbiYh5jlVsbCjIWa8T+Un6iByPI
 Z63C4KLJGngoaMNxbN3eux9g/6He4b4CAVTNJXjzSBd5Z4mDXAaPmgkmm+v4Qtgbpv+9
 FEQw==
X-Gm-Message-State: AOAM532V8XX0aoj7oevQLHNL3DULoSaSbdrEZ2Ao6wo5yl2pl49uqZ5U
 Cgf8pBJNusU39pg1uJuCdxJJ6iGeDIw3NieyVf8=
X-Google-Smtp-Source: ABdhPJwA2Ug4CDLC2bAHk7Q8q+PUVOrJfSZHc2wQG7Wa9yW/RGEPY96yG72WRAaIHJcuxuKkq3gQjwjeGUhR2IvQc2k=
X-Received: by 2002:a67:b34b:: with SMTP id b11mr13690412vsm.0.1606690812916; 
 Sun, 29 Nov 2020 15:00:12 -0800 (PST)
MIME-Version: 1.0
References: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>
In-Reply-To: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 29 Nov 2020 18:00:01 -0500
Message-ID: <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>
To: Klaus Ebbe Grue <grue@di.ku.dk>
Subject: Re: [Nouveau] Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When in doubt, blame nouveau.

I believe there has been some recent work around adjusting the logic
which checks that modes have enough bandwidth. Adding Lyude, who
worked on these changes. Not sure when they landed.

Klaus -- please supply a full Xorg log.

Cheers,

  -ilia

On Sun, Nov 29, 2020 at 4:28 PM Klaus Ebbe Grue <grue@di.ku.dk> wrote:
>
> Hi nouveau@lists.freedesktop.org
>
> My X-server gives a blank screen on Fedora kernel 5.9.9.
>
> I am in doubt whether or not I should blame Nouveau for that.
>
> I know the nvidea drivers have problems with Fedora kernel 5.9.9.
>
> I can file a bug against Nouveau and provide logs if you think there is a remote chance that Nouveau could be the cause.
>
> Here are some details:
>
> Fedora 5.8.18 / X-server works fine.
>
> I can boot into Fedora 5.9.9 runlevel 3 (no X-server).
>
> If I boot into Fedora 5.9.9 runlevel 5 (with X-server), the screen powers off instead of giving a login prompt, but apart from that, Fedora 5.9.9 works fine and produces log files.
>
> If I then power off and boot into Fedora 5.8.18 and read Xorg.0.log.old I can see that the X-server under Fedora 5.9.9 did not get the screen resolutions right.
>
> Here is what monitor-edid says under both Fedora 5.9.9 and 5.8.18:
>
> > monitor-edid
> Name: PHL BDM4350
> EISA ID: PHL08fa
> EDID version: 1.4
> EDID extension blocks: 1
> Screen size: 95.3 cm x 54.3 cm (43.18 inches, aspect ratio 16/9 = 1.76)
> Gamma: 2.2
> Digital signal
> Max video bandwidth: 600 MHz
>         HorizSync 30-160
>         VertRefresh 23-80
>         # Monitor preferred modeline (60.0 Hz vsync, 133.3 kHz hsync, ratio 16/9, 102 dpi) (bad ratio)
>         ModeLine "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 -hsync +vsync
> ...
>
> But under Fedora 5.9.9, the X-server is unaware of the 3840x2160 resolution according to Xorg.0.log.old. It also gets the screen physical size wrong.
>
> My first cry of help is here:
> https://ask.fedoraproject.org/t/no-login-screen-after-upgrade/10618
> That is where I leaned that the nvidea drivers have problems with Fedora 5.9.9
>
> Cheers,
> Klaus
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
