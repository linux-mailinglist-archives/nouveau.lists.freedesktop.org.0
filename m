Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270AB42C7DD
	for <lists+nouveau@lfdr.de>; Wed, 13 Oct 2021 19:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68C6E0A5;
	Wed, 13 Oct 2021 17:44:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297BB6E0A5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 17:44:08 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j8so549381ila.11
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 10:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39gB+SG/Zru8hPxaIndg+HaHoxIBBlyM8n/xI13oUbs=;
 b=bIx7j8rLnUgzZwUeEiGmmBXF9krfPc/m1DOmDDeUKPUYm0Yr+shCxaObNTmP7Wgf4/
 mJpJ3X0/HOlUg49k4zLLFIkLXDJ07eErNx78Q9wUbI3faKUS8bY+zKLgCBKzB7uAmNU8
 DG2oBCQOIVdumUl9Lik2XVRXeia2rLutdv3ByfSeE8yeb1NElC5aqGs85odL3LzK8Pm7
 8dfpiymMJgtgZd3fNyhachcCoI2cDOseSK+ajBsfmWpeSmFzc0mNMqz+BC+mOMADny8s
 kHUkyzw0ssZ5gdIF8R5l4nL7t05EtDz2u9sEwp+Nt+6y4ChEJRljPV1Ap8peYlHGzPXx
 oE2Q==
X-Gm-Message-State: AOAM533HMxf+l2Gofp3HEzrudrW4Pk24eex+uyhxkwn4h1ZixSJBwyQE
 1EXTxiz3NqUY8I0OygpER1diSqA9h5k/p0altkc=
X-Google-Smtp-Source: ABdhPJx9PgwaAEEzLG4d9HUeXPBhoPheSalnf42ssDbB686ENO16uaZkNCN4nDckuYlfXzu9OU5GEreAkbjzkd7pVGo=
X-Received: by 2002:a05:6e02:15c9:: with SMTP id
 q9mr331377ilu.298.1634147047270; 
 Wed, 13 Oct 2021 10:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
In-Reply-To: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 13 Oct 2021 13:43:56 -0400
Message-ID: <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The most straightforward thing, if you can reproduce at will, would be
to do a bisect to figure out which change this happened with. Once we
know which change caused the problem, it will hopefully provide with
more ability to sort out where we're going wrong. You can also play
with things like KASAN, although it's not clear to me that they would
necessarily catch this problem.

Cheers,

  -ilia

On Wed, Oct 13, 2021 at 1:31 PM Computer Enthusiastic
<computer.enthusiastic@gmail.com> wrote:
>
> Hello,
>
> Greeting to all list members.
>
> I hope this mailing list is the right place to ask about it, otherwise
> I apologize in advance and, please, direct me to the right mailing
> list.
>
> I would like to receive advice on how to debug (or help to debug) the
> noveau kernel module suspend issue reported in [1][2][3]. The issue is
> constantly reproducible and it consists in a  screen corruption with
> system lockup on resume after suspend to ram or suspend to disk. It
> seems to affect NV50 nvidia graphic cards at least from kernel 5.10.0
> (probably from 5.2 or 5.3) up to 5.14.10 (I have not tested 5.15 in rc
> state, actually).
>
> Thanks in advance.
>
> [1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
