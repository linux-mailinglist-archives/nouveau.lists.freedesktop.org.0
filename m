Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C969C32B7F1
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 14:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1336E32A;
	Wed,  3 Mar 2021 13:13:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88E6E32A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:12:59 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u8so25550060ior.13
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nmZ0/AJi1S/eK1Pk8QZIndvzYmzY+NvDPQI9cy6fGI=;
 b=MkoSdnVkzVQMImb4goAeJB1wEBT9h8Hb3vWzXRIcTcwgDK8uuLI2HaSJaEzkIGRP4b
 WoWQW4myYhI6uXJDAAAq0TfS6pTk1fdOBv7Z8HcBBsaCkzHpAMImrFGla5uxYHDBPVSt
 OBQjI18IM0dMyYGyquVjeQWpoVaaGQfpkKEtYxAMC3Mhh8GvO9rph6dHd6pVfrLlu7Tq
 Ze32fiS32lq+Qw4gBLRyb/TcAE30+dACKRVzc+7W6oJxt3oU+7zJhnD5qtioc+Q+/bML
 fpezqbiyRqRYHeWwsolwOnrHh+Ry9PMQ4RkX2Op5/Mcr/xiQdL5QTr9YwVJGClSNV+IX
 6nGw==
X-Gm-Message-State: AOAM530zyEcu96baXjHtZbfbLb4C9juBxK48IkrfzNPaOUKoM5jDnw7k
 NxSHe++iuCtik86rsM8wQ7gK55IapyXIluilwFs=
X-Google-Smtp-Source: ABdhPJzltkOEKYLbXs2Z8eu4sBvsI/9x+51tB+d+8ywLuieSUR07oZMUKFNKibww6Z/PGSu5+hhFbVINIzF/01qEf+w=
X-Received: by 2002:a5e:aa04:: with SMTP id s4mr2584848ioe.30.1614777179101;
 Wed, 03 Mar 2021 05:12:59 -0800 (PST)
MIME-Version: 1.0
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
In-Reply-To: <YD+D/zhUwC4zaO8v@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 3 Mar 2021 08:12:48 -0500
Message-ID: <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
To: Alex Riesen <alexander.riesen@cetitec.com>
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 3, 2021 at 7:41 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
>
> Ilia Mirkin, Sat, Feb 27, 2021 22:26:57 +0100:
> > Can you try Alex's patch to modetest and confirm that you see issues
> > with modetest? If so, can you (and maybe Alex as well) try an older
> > kernel (I'm on 5.6) and see if modetest behaves well there. [The patch
> > in question was to expose 256x256 as the 'preferred' size, but support
> > for the larger cursors has been around for a while.] Alex - if you
> > have time, same question to you.
>
> Sorry that it took so long. I retestet with the same kernel as Uwe did
> (5.4.101) and my results are the same: modetest with 64 and 128 cursors looks
> good, 256 broken. Didn't test with X this time (this being my main office
> machine), but can do later if required.

Thanks for confirming! No need to test X - that will work fine, since
we were reporting the smaller cursors on that kernel.

So I think we have definitive evidence that at least all Kepler
doesn't do 256x256 (and it's not just some bug in the display macro
rework that got introduced). And unless I'm blind and don't see the
corruption, Pascal seems fine. Question remains for Maxwell1/2 GPUs.
Unless someone has immediate plans to test on those, I'd recommend
bumping the minimum for 256x256 being reported to Pascal, and doing
128x128 for Kepler / Maxwell.

Simon, Lyude -- thoughts?

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
