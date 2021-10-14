Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1842E0CF
	for <lists+nouveau@lfdr.de>; Thu, 14 Oct 2021 20:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1846EB78;
	Thu, 14 Oct 2021 18:07:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064886EB78
 for <nouveau@lists.freedesktop.org>; Thu, 14 Oct 2021 18:07:45 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e144so4841535iof.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Oct 2021 11:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NV+JROt2m5aBwFI67Z3EAMzaYlfZTwc+ozWvdnSjMKE=;
 b=tx4lkkhu81AT3IPGO8eI3aBOevPL78DA1VdThZKJFSrZ69MfCHe7QFj9ovAB7FbGkC
 7SpjYjYkcdvNDgYZdidd57pL56Tg56WCrylBnUgkeSXGSsFfyA7SnMJ7ThDfUfln9Jon
 mRJ9A6hSlNyBfg7Em/W4rj967ENmF9fgXaicH+HGzaEwuBSKQJU6QaRGkL1MEP1EWNnN
 ebRp5T6AKTqbxK879sSXwFcSWoIA5XI4N5b7njzfmCXRZxXlVfhK1sqSS5rr6f+9c9wG
 ZeUUTLP74t34PApDh4F7FgtmfNCWrGbsmXqobJcju5eG+Wwa52U9iX2+EIzPRRkpHj40
 IHcw==
X-Gm-Message-State: AOAM531MNx07DwG7Llvj3WH3HFaH6Gu9UYjaxMIxegjwLQ3Ssl5czLlj
 lwGa6p9Md4DnzBJumSrJRHNBl/XBjpfWjvQiwLE=
X-Google-Smtp-Source: ABdhPJwPvbXCEesBZbatmp5rUv2tgd9QWEna5FfE2ZyUgHetP/ZJLZpWuCsr2ksKrnmtgubt+Gsfh9PJg38w+Gkk8+Q=
X-Received: by 2002:a02:1d02:: with SMTP id 2mr5292761jaj.15.1634234864058;
 Thu, 14 Oct 2021 11:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
In-Reply-To: <YWhgFZPqx3qKqr0C@debian.fritz.box>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 14 Oct 2021 14:07:33 -0400
Message-ID: <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
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

On Thu, Oct 14, 2021 at 12:51 PM Computer Enthusiastic
<computer.enthusiastic@gmail.com> wrote:
>
> Hello,
>
> Thanks for the answer.
>
> On Wed, Oct 13, 2021 at 01:43:56PM -0400, Ilia Mirkin wrote:
> > The most straightforward thing, if you can reproduce at will, would be
> > to do a bisect to figure out which change this happened with. Once we
> > know which change caused the problem, it will hopefully provide with
> > more ability to sort out where we're going wrong. You can also play
> > with things like KASAN, although it's not clear to me that they would
> > necessarily catch this problem.
>
> The patch is "mm: security: introduce init_on_alloc=1 and init_on_free=1
> boot options" (commit 6471384af2a6530696fc0203bafe4de41a23c9ef) [1].
>
> It was introduced in kernel version 5.2:
> $ git describe --tags 6471384af2a6530696fc0203bafe4de41a23c9ef
> v5.2-5754-g6471384af2a6

Uff... so you've verified that a kernel at that commit +
init_on_alloc=1 and init_on_free=1 (or the CONFIG_* equivalents) will
cause the problems?

That means the problem has "always been there" (or at least we have no
great way of knowing when it might have been introduced).

I think there's some sort of SLUB debug options that help find
use-after-frees and such. What if you disable the init_on_*, enable
SLUB, and boot with like "slub_debug=FZP"?

  -ilia
