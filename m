Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A343C42DFAE
	for <lists+nouveau@lfdr.de>; Thu, 14 Oct 2021 18:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C9E6E1B7;
	Thu, 14 Oct 2021 16:51:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C196E1B7
 for <nouveau@lists.freedesktop.org>; Thu, 14 Oct 2021 16:51:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d3so26699952edp.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Oct 2021 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hJy1YVsQwW7E55T4e1e6o2t86K9KhM7PL0exMLlH4FY=;
 b=MT2mDLZjnTcsfs5f0fCUzvZOHgcYi70Po17UYOq+db5eAAUfXxr3nBGnn6vWPUB9kl
 mYJ/pSCW8xE+RNu4OapM/bvR0nPEI3EUmPALkAUbC/0aR4W5z7jtebpf0PKlTLzA46tk
 k9Nb2akmBkWpCOV2DlBLzxWPH6WK9EeHPTbBGQWWiz6qAjAdt/9fJloXcNEzgg9KCi97
 28st6IXXdQu6HhgcIi+QZHdAmpSiw4ZrhGNDU4YnBFC6whj6w5M4gbxJFQpBDXiSHiS3
 5E6w4ZCrjOSvpMlKE1LRZNjvgCCMkb76WBh5Jq9ZZqeP1p09i5Y1z896BFZt8rnFez4c
 oJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hJy1YVsQwW7E55T4e1e6o2t86K9KhM7PL0exMLlH4FY=;
 b=fOmk5+0DRvZBCy54Ui46bZ46JLCZOdOFbjuTRxL1QTy9ovU5l1huOYqsrIaTAJe/V1
 ejjPUTg8QEBUoj1qQYhOxfaBVvcZ3K0ekZ4HguxhER67fsA5lauwAYOc/5NZMugeXpU3
 6uvpBTS05uH8yyLVKEsy7J7a+5RFKXESJ3mPlvbLHMaOBPa/jtR4oIWUBvDnm1PFIPID
 I5aXMvQV0VzEcrCVtC1CCFSBSShzX+Q1dEBPkLvBP1c2V3lQ4OFSymb8LZBFdCHZSK6j
 QREJMKHf/+DbSzbu9oQPc3+kzaiF0VJ4hl65XYoJ7yBsQpRNPcd3L6re1vl6m98C6GVm
 TuPQ==
X-Gm-Message-State: AOAM531F5EbcESvrBouJk1PpBy/CYf3ikbiL3nnLfDotyRKXRy29DTXx
 l/gi+GnwO/CK4kgZ5LDE8Z9wXemcYL8=
X-Google-Smtp-Source: ABdhPJxS1Fpx1C+tvTpab138Ea3mZIijFGweDMqHsOtH3boVl24R7oiZixKe51EtnGt5zFgeAyk0cw==
X-Received: by 2002:a17:906:11db:: with SMTP id
 o27mr61310eja.540.1634230296496; 
 Thu, 14 Oct 2021 09:51:36 -0700 (PDT)
Received: from debian (host-87-4-51-80.retail.telecomitalia.it. [87.4.51.80])
 by smtp.gmail.com with ESMTPSA id
 w6sm2763578edt.12.2021.10.14.09.51.34
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:51:36 -0700 (PDT)
Received: by debian (sSMTP sendmail emulation); Thu, 14 Oct 2021 18:51:33 +0200
Date: Thu, 14 Oct 2021 18:51:33 +0200
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
To: nouveau@lists.freedesktop.org
Message-ID: <YWhgFZPqx3qKqr0C@debian.fritz.box>
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
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

Hello,

Thanks for the answer.

On Wed, Oct 13, 2021 at 01:43:56PM -0400, Ilia Mirkin wrote:
> The most straightforward thing, if you can reproduce at will, would be
> to do a bisect to figure out which change this happened with. Once we
> know which change caused the problem, it will hopefully provide with
> more ability to sort out where we're going wrong. You can also play
> with things like KASAN, although it's not clear to me that they would
> necessarily catch this problem.

The patch is "mm: security: introduce init_on_alloc=1 and init_on_free=1 
boot options" (commit 6471384af2a6530696fc0203bafe4de41a23c9ef) [1]. 

It was introduced in kernel version 5.2:
$ git describe --tags 6471384af2a6530696fc0203bafe4de41a23c9ef
v5.2-5754-g6471384af2a6

This patch does not specifically change the source code of the nouveau 
module. I suppose it interacts with the memory management of nouveau 
kernel module during kernel suspend to ram and resume from ram (logs 
recorded during malfunction are available in [2]).

I activated the kasan support in the kernel (recompiling it, for example 
with kernel version 5.14.10), but I wasn't able to collect a kasan 
report/dump triggered by the issue.

A hypotesis could be that the issue is caused by an extra latency in 
buffer eviction during suspend to ram (due to memory init), that causes 
the nouveau kernel not responding to suspend, causing a "forced" suspend 
that leaves the nouveau module in an inconsistent state when the system 
is resumed. I'm not a kernel expert, therefore I don't know how to test 
this hypotesis.

Many other patches has been written over time about init_on_alloc and 
init_on_free kernel features, but the issue with nouveau driver is still 
there, up to now.

For the previous reasons, it don't know how to investigate it.

Thanks for any suggestions.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.14.12&id=6471384af2a6530696fc0203bafe4de41a23c9ef
[2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/uploads/4294703a356e4c00814f581a42988999/suspend-errors-5.14.9.log.zip

> On Wed, Oct 13, 2021 at 1:31 PM Computer Enthusiastic
> <computer.enthusiastic@gmail.com> wrote:
> >
> > Hello,
> >
> > Greeting to all list members.
> >
> > I hope this mailing list is the right place to ask about it, otherwise
> > I apologize in advance and, please, direct me to the right mailing
> > list.
> >
> > I would like to receive advice on how to debug (or help to debug) the
> > noveau kernel module suspend issue reported in [1][2][3]. The issue is
> > constantly reproducible and it consists in a  screen corruption with
> > system lockup on resume after suspend to ram or suspend to disk. It
> > seems to affect NV50 nvidia graphic cards at least from kernel 5.10.0
> > (probably from 5.2 or 5.3) up to 5.14.10 (I have not tested 5.15 in rc
> > state, actually).
> >
> > Thanks in advance.
> >
> > [1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
> > [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705
> > [3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
