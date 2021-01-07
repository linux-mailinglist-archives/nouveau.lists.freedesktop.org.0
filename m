Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1152ECBA5
	for <lists+nouveau@lfdr.de>; Thu,  7 Jan 2021 09:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2439989B67;
	Thu,  7 Jan 2021 08:13:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFA089B67
 for <nouveau@lists.freedesktop.org>; Thu,  7 Jan 2021 08:13:22 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id l200so6512644oig.9
 for <nouveau@lists.freedesktop.org>; Thu, 07 Jan 2021 00:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2sNU56Ph9zOh5AccBeHHxNWeCtZj6RXCAKwJxVBMKmE=;
 b=tz9Ruy2rStLnm0iF8YEu6r2LDq0IRPDuo2uG7wwjrvfaL36mzSWbe353IOICiqHOAD
 HQDNk3YaNb1GCcT7lTGNT0nv/025iGGWePiE5HNGlgkrtQ+rJIS8iyD8+n3JDNgxz69B
 Hs0g3WdON+uApIJxcgX1o/tBk6IL2KnsMUUEScyz1psKxcle72UF6pS/ltU0wAjuXU7D
 gFttlsD1lUf2YNT9S/c2q6MgG7M+wB90R1o6nbNzK2L8sSjZQ1uwGagQnaxh8fK0hymJ
 HLOkL57TGrK80c40wtz2OCASOifG8gK9yPABNuBBTX1SLuLcbFXl9AMrUP7shHejHXDn
 IkZA==
X-Gm-Message-State: AOAM531zL0G0FGuPyVgiyfq276T/EPpm5wTwUYZSufeUniP0Ud1PiYHS
 SatD8gbrHQ+QQIm89JRk2a80l09fxJNBFHsBIFk=
X-Google-Smtp-Source: ABdhPJwrnQjPXBYzM2SyYW1CfGTO1vgkI2yKYDdyKTlIhuNFDs8Idq4cEQdtVae6Q4iQGMePy4f/z4WxW1zGTn3wWGI=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr684519oia.54.1610007201402; 
 Thu, 07 Jan 2021 00:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20210104155708.800470590@linuxfoundation.org>
 <20210104155710.187945647@linuxfoundation.org>
In-Reply-To: <20210104155710.187945647@linuxfoundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jan 2021 09:13:10 +0100
Message-ID: <CAMuHMdXRgam2zahPEGcw8+76Xm-0AO-Ci9-YmVa5JpTKVHphRw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Nouveau] [PATCH 5.10 28/63] fbcon: Disable accelerated
 scrolling
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
Cc: George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jan 4, 2021 at 5:58 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> commit 39aead8373b3c20bb5965c024dfb51a94e526151 upstream.
>
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
>
> Now the problem is that most modern-ish drivers really only treat
> fbcon as an dumb kernel console until userspace takes over, and Oops
> printer for some emergencies. Looking at drm drivers and the basic
> vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> acceleration:
>
> - nouveau, seems to be enabled by default
> - omapdrm, when a DMM remapper exists using remapper rewriting for
>   y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>   flag, so unused (and could be deleted already I think).
>
> No other driver supportes accelerated fbcon. And fbcon is the only

Note that there are 32 more drivers using acceleration under
drivers/video/fbdev/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
