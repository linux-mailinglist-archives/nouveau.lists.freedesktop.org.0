Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B8B1EE86F
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 18:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB1D6E4FE;
	Thu,  4 Jun 2020 16:19:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3E06E4FE
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 16:19:17 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y18so6992893iow.3
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f96YLfaQIgNcB1dmAhGYVDcba0Obue/K4JOqEtQDBU4=;
 b=gsIyS0ZTluu0FBxhg7W5iWnpdQ39EZrrGFq7C74g/gg+EzTkRY3vi2bK0aqLgRGJn/
 Hz1aCmwGlVjPKs+suMoyugHFPJg3BQO/OO9m71ufINiTZDjKyoAiSQ0/+i5sPUkOsmX2
 GNZi8s3MBbtcgd25+bxYRZ6Z9lZJWynGe5ujUGvZNBg7Z/r/MShNFtFnA5Wk9VMPqYho
 MmSudaf9QNX0+x48ScVxDQlyj1Av9K7cQr2BTBvP1y+ZqOGkApJ7/eFHmk+dVbIIJSWM
 XlxKO9V6ZFgrfmvxeHvehkyiNMWECQFx0H5RBDJkBqvvNn/6PkjFgqHcn4Xp3XFvc+gj
 wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f96YLfaQIgNcB1dmAhGYVDcba0Obue/K4JOqEtQDBU4=;
 b=jTLYqnkAgbZzDHBRHq5BtPVkQwgYGiX72kvEbC9PByzdZnSQRE0Bej945Cgli05WLc
 64HJQAVaVl+GT8ZZaDa3SYNnIslpWAd7WjwVBTwGD4beosb68hA+WbH4P9RfArZdIPWR
 N60dgpXUtLOHKv4NFvJ0SEV+8teDx9di8F0fojaJxXRGkRrJISGn9BGJzZNOTWR4Pk7s
 nCgcAub7+56yJN718+uTSrFohGrXaAT+QPtDmtgro9N1KlmPXYkGlaNcC2W2VGdgwwfI
 KtzWQ65Q0MLHgEGcbQJgy6v9Pgx5/TmX7emLn2HaR3iRjUcn/I3N22lqlPXcmHb8oTg3
 CHEA==
X-Gm-Message-State: AOAM533QB7Rq4L6y66t9wCrayX3agmwMrDBOKn9gc8GSdMibUtk1Fy3c
 FVoLsMSeGQeaQzpyu7vylp/SRarO5uBPYdVh2ymdpcGT
X-Google-Smtp-Source: ABdhPJyWIVaeHAPopsEZbD3b8JJ7uBWTPui/+QEUuXYIK1pF/FPttq/l5QVCSLWrdroARd/JILduLoJmFTiKZqebyrk=
X-Received: by 2002:a05:6602:15c8:: with SMTP id
 f8mr4680317iow.183.1591287556520; 
 Thu, 04 Jun 2020 09:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
 <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
 <CAOkhzLV+suVNAoyiaHKOkbwP-KKgTLEa7S8kp8+GSTLm_-wWFw@mail.gmail.com>
 <CAKb7UvgWMsLSHCayzdY7UYMVTjN3OHbH2WhKd-BP46K=r4Ra8A@mail.gmail.com>
 <CAOkhzLXZVNdpgwV=iiO0TEvLp3Hx28Zk8iYzwy5BvJ1pWi4QxQ@mail.gmail.com>
 <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
In-Reply-To: <CAKb7UviB22HxSJ6j4ts=fU=J24Hh69NCBw4uHC5vsi902Pp6bA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 18:19:05 +0200
Message-ID: <CAOkhzLVwQyN3RcUXH6YHMH+VmKtGNvzidfnqQ80t72gu+bm3oQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Dear Ilia

On Thu, Jun 4, 2020 at 6:13 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Not sure why you bother asking questions when you're just going to
> dump nouveau anyways. This is the second time I've answered your
> questions on this very topic, I think it'll be the last too.

I will try again with the next Kernel release. So far I spent a lot of
time and I did not manage to get it to work. And I need my graphical
Linux Desktop.

I am a Nouveau user since day one.

This may also be a Gentoo/Funtoo Issue. I will keep you posted, if I
have any success.

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
