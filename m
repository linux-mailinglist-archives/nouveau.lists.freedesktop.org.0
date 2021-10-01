Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1F41F520
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 20:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BF16EEBB;
	Fri,  1 Oct 2021 18:44:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B386EEBB
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 18:44:12 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id h129so12815196iof.1
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 11:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1IqxVeKvvMgvcCUyAjz+3mR1sZTr5NyE9WQjFNnrcM=;
 b=RlDLzp07rMxnHqQ812FE8aiDxz9kBGCsq3lgtUnAIJaxwp5Qv1PIIxHAIoJgXfbGWL
 adC9kX4S4fZIPz06/AU9/l+/oe7hnMwa0WYSJ3/Db68O3G4kG7WkwyMoWQ3tMu1wIPW4
 BDDcTUfVGK4wm2Gi/9W/sSDx3vmdZ+b73wkfAhMM6/ieXauAPAWudaJmys3R1c3zvQk5
 rlSXiwSQFlAuPw1eqI1qWXGGd+4s8OFYqZJSFSZfqKhaDYvpjWZYuWZZnNlBm3gSESdU
 C9zCaapVrBUBDCW66h93HWya/pfihpbguMOo4wRtfsUcM2PGLxzWYakfFWnJ8ZgDlCya
 TvRw==
X-Gm-Message-State: AOAM533XjFAe4PoDGLE73QmZL0db0f0unBycbhFRDzXtEU5JOIGL2NhN
 U9G7DSUEqzZ4ms2GV/0ZVxqVphodQjX6lC5rapE=
X-Google-Smtp-Source: ABdhPJyIxVjD96Mw+ZZAuKlfMCFEIIUvPE4V6i/gLk035+MfvqqchA9EbvzCglAxIDAdqEi+xeQzC9rOi3aJ4sa6FIs=
X-Received: by 2002:a05:6638:134f:: with SMTP id
 u15mr11345819jad.82.1633113851414; 
 Fri, 01 Oct 2021 11:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
In-Reply-To: <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 14:44:00 -0400
Message-ID: <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

On Fri, Oct 1, 2021 at 2:29 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> Thanks perhaps this is part of the problem:
>  ls -l /sys/kernel/debug/dri/
> total 0

This indicates that nouveau is not loaded. (Or loaded and failed
part-way through the load.)

Cheers,

  -ilia
