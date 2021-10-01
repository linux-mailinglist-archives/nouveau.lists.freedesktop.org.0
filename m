Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B009141F667
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 22:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008656F40A;
	Fri,  1 Oct 2021 20:41:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872D76F3F9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 20:41:55 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id r75so13108653iod.7
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 13:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UOxOdfFx0D6v58E0KtqCCRzTner+i+9eqJY7xy8l1mc=;
 b=rsiXJiMtg3vyC1dNcDYcRNDYtpsKSUjPyIh8lSs5f5KqJMciOv3kYdTgNMTlJLDGaL
 WSTbGdpzvbKDIj064o3I4/wEEiD+ZxTjc7kUid767uuVKLYFN6u7RiAQdojtDzYcqQqi
 E47od6VQwbDRoGUObKTy+NP0M2l788MYjH1GCWXBFhZJdpG+kOOe8Qcl4SV9dw5VIUGT
 BEccgcSjS4UaZQ4BCKUoezV1QTcFHkrnPtKuC+Eo0m4fZqKMb0jeb2PMOLbOQ6B+sZ9/
 qBDVjbL5IS7iKUlNKVbtmbQk5n6BJWhFZVQsh+3sbr7l2cKRdl1uAF1/Yt+byxFLFEWQ
 eb6w==
X-Gm-Message-State: AOAM530qsfZeY24LlSKklGvFQ6yyuczkXgw82SC4P5lA+5cyVcDFrrcy
 BDdxm7Z1z6wMOUlcjLOjClOKVLkW4ATr9O/Si5VBSdJb
X-Google-Smtp-Source: ABdhPJxxTwq1g3zyYu0sNX0VhUFWbiIVVm79FmurHTIvdgoyMHnIyYBFOyUKK49zcmI2tggiaNNEYeyJconuw80/LiM=
X-Received: by 2002:a05:6638:1696:: with SMTP id f22mr6034jat.15.1633120914905; 
 Fri, 01 Oct 2021 13:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
 <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
 <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
 <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
 <CABr8-B4zOQU1KYatZre7yZ9tkFOAffZj=DLKbvZe5om9uQ6ssA@mail.gmail.com>
 <CAKb7Uvi7V+cSOTWvRGyE6BhZpbShVDV+H1+nenJ0osTM-m+1Aw@mail.gmail.com>
 <CABr8-B4pDnBDM92WCWEbfjnyXaDsGr9hg8Z2ENcxDdskHP54PA@mail.gmail.com>
In-Reply-To: <CABr8-B4pDnBDM92WCWEbfjnyXaDsGr9hg8Z2ENcxDdskHP54PA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 16:41:44 -0400
Message-ID: <CAKb7UvgpM2o71wWfjOt8hobFd1ovC_4JX3_TgT87WBj7H40LTw@mail.gmail.com>
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

On Fri, Oct 1, 2021 at 4:29 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> yes very weird on the sound. Using analog speakers at the moment
> I got no test sound - and no video sound after getting nouveau to run correctly ????
> I was playing analog audio before ?
> Does nouveau only do HDMI audio ?

nouveau only does HDMI(/DP) audio. A different driver will handle a
built-in sound card (e.g. snd_hda_intel). You might want to reach out
to your distro's support channels to better diagnose what's going on.
Unlikely to have anything to do with nouveau. More likely that you had
added "acpi=off" to hack around this. Or perhaps pci=nomsi for a
broken audio adapter? Don't know. dmesg (not to mention google) will
have the answers.

  -ilia
