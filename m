Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639629D118
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 17:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57186E52A;
	Wed, 28 Oct 2020 16:48:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EED36E52A
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 16:48:44 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j21so4780086ota.13
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5jQzvvvdPmdqjOkHSPEIyySBfjkABtctqToD4WlPds=;
 b=NSjA3mx3770CNXwIxYyfMJ0Ks7APtQWI95kOar03VF/mo/p2HnmzwtllZ3oO/KitIO
 1MSo7mzzd4TF6U0+8l0izfVR+COtYstZ1QaOdGaUDsPGVWJqR2Ai0eGeiev5FbOpONzf
 uH0vlwMW87Ez0144ChoCTqK6R+wYvMJGPIG6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5jQzvvvdPmdqjOkHSPEIyySBfjkABtctqToD4WlPds=;
 b=Yg0LCpXpmgK2lFkhEfZU8NCWGd+qzMnizcYVdIA4lgBUdgwSx0WHraUstNSzF6/CPO
 Y16XJLKcSqrmFz2bKdOC28IANqtzzfa0jMDvQGvFIvQ7tv4+irWO2ARwNhQoM5XhJZih
 7VJA31Jg7+u/iPKTYKiupgmDGyUC7cRC8H85NPKaoriA+QdOZMK72N+mS0R1MDcfP27P
 ljcE97oGl9whPIB9MfttBi3uzVAnrbpnOzXtuPxCt2JdkP2MT5sIsU+ftC+BlClUw9OE
 nZKeEUxeXU5HTDmrFc+mBCAIDX8IQiAV8h9mpsOiM7itYoxoSQ2D3OxoZ/wcg415nYH1
 3Kvw==
X-Gm-Message-State: AOAM5334Lo0sTbbdOjsh3FbG8rOzQEEuHXqlGjt2VApqThsVeyzCq6O4
 6jwdQpecd/YWIDq8zhLc8GeaG6H2kq2iPdBWm+i9SQ==
X-Google-Smtp-Source: ABdhPJwAFARXDtGaA0IuXNU3vgf8FJQ2VDsoMMBf965lhgzB5CiwU2XW10HkNFejBQ5trrA3kz5WVMzMU8SUYKDjArY=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr143257ote.188.1603903723608; 
 Wed, 28 Oct 2020 09:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
 <20201028164552.GA546379@ravnborg.org>
In-Reply-To: <20201028164552.GA546379@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Oct 2020 17:48:32 +0100
Message-ID: <CAKMK7uFDNKFeMfKiiToppYwx509qhYruoTfiCry9DVYSdWiG0A@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Nouveau] [PATCH] fbcon: Disable accelerated scrolling
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 5:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel et al.
>
> On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
> > So ever since syzbot discovered fbcon, we have solid proof that it's
> > full of bugs. And often the solution is to just delete code and remove
> > features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> >
> > Now the problem is that most modern-ish drivers really only treat
> > fbcon as an dumb kernel console until userspace takes over, and Oops
> > printer for some emergencies. Looking at drm drivers and the basic
> > vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> > acceleration:
> >
> > - nouveau, seems to be enabled by default
> > - omapdrm, when a DMM remapper exists using remapper rewriting for
> >   y/xpanning
> > - gma500, but that is getting deleted now for the GTT remapper trick,
> >   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
> >   flag, so unused (and could be deleted already I think).
> >
> > No other driver supportes accelerated fbcon. And fbcon is the only
> > user of this accel code (it's not exposed as uapi through ioctls),
> > which means we could garbage collect fairly enormous amounts of code
> > if we kill this.
> >
> > Plus because syzbot only runs on virtual hardware, and none of the
> > drivers for that have acceleration, we'd remove a huge gap in testing.
> > And there's no other even remotely comprehensive testing aside from
> > syzbot.
> >
> > This patch here just disables the acceleration code by always
> > redrawing when scrolling.
>
> So far I follow you - and agree.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> > The plan is that once this has been merged
> > for well over a year in released kernels, we can start to go around
> > and delete a lot of code.
>
> Why wait one year? We deleted the scrollback code without any prior
> warning - which was fine. And acceleration support has less users
> so there should be no reason to wait.
>
> So unless there are good arguments that I miss then we should just
> delete the acceleration code outright.

If you grep for FBINFO_HWACCEL and related stuff, we could delete like
half the driver code, plus a ton of the related support code in fbcon
and fbdev core. It's going to be a lot of work, and I don't want to do
that and then have to back it out again. Compared to this the
softscrollback removal was nothing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
