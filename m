Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5D2A05C6
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 13:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34E16E9A7;
	Fri, 30 Oct 2020 12:49:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBAB6E9A7
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604062190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c28J8GiAKGJt9NaiwqUHlyeiwP/a/n9+cd0tvzPiH7g=;
 b=U8sIdr7f8EjkO7lCcAV0gtPO7R4G8C2ni0JI/GM6WDEx2D8pyzeV9lHUjVfovcc85xA8oZ
 cjHDC+BnGvXoNUKyDF0T73dGElSL5H+kO7kWi/UEovpsjT5eeGSSCl556uSKBVYg7zspzN
 GiiXM3n2iKnikCtCvBpmVGcnZtpEmCw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-rn_x2yFwMPuX8VFEkWBnVQ-1; Fri, 30 Oct 2020 08:49:45 -0400
X-MC-Unique: rn_x2yFwMPuX8VFEkWBnVQ-1
Received: by mail-qk1-f199.google.com with SMTP id h23so3353268qka.8
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 05:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c28J8GiAKGJt9NaiwqUHlyeiwP/a/n9+cd0tvzPiH7g=;
 b=L6IQzoD+oZlmGmbVPsgRU17SsZUo27jafa8ZJAE0Fh7/jObY98r6bojRn5gOp08y4y
 jGEoinnYXK1AB5b/deUo2irCaYAfnzlWctyCQXamo9xPehvC6E1D6rvA7aNtIt3tLRHp
 sxemKheMqjvCx9OZKtf6BYce/nqk+VI5npPLvGN/X2VAnnIu1eX0DmUOFNtRjlitgR80
 dfLqMEnJUhXuJipV69aYU1IVIZM/u/GsZSEdWmBcALQKaCgYas8Z9YvO3saB+RBPauxZ
 jR8c61ifMAdCYdTYIHT03gKSg+7we2fBEhQ8kHr9KuFxvdgWpQcIG1+/PIILn6v8gq+e
 6+Gw==
X-Gm-Message-State: AOAM530E2X0Ibqm+DDv//CwLwPaEN4dqOELSDhMjYvSHe93prbY2GpsY
 P5y0XF5nBTJlDuReoUJ0eYKzqmPM4eDrR/Nb9sU6TE2joy5E4uWhG08R4A6gw6dhEz5EvE1mHVj
 Kes7epyb2rrXZ/ABLijAIfMPT7urRYadDjM0Szt4ueQ==
X-Received: by 2002:a05:620a:1108:: with SMTP id
 o8mr1929024qkk.157.1604062185216; 
 Fri, 30 Oct 2020 05:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzklb/GxvxeH0j0lsFcxJLJJQJxkAZGJ+n1M6om43hw7DzvJS/zXUa3/RWXMZ1VOQBQaz6L30P/l27dczkAfog=
X-Received: by 2002:a05:620a:1108:: with SMTP id
 o8mr1929009qkk.157.1604062184964; 
 Fri, 30 Oct 2020 05:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201030023645.10114-1-apopple@nvidia.com>
In-Reply-To: <20201030023645.10114-1-apopple@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 30 Oct 2020 13:49:34 +0100
Message-ID: <CACO55tsm+i4bwQzDBEzf7JdGUYqDEyTa66hCCXJxGYTvTbxYwQ@mail.gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 0/5] Improve Robust Channel (RC) recovery for
 Turing
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 3:37 AM Alistair Popple <apopple@nvidia.com> wrote:
>
> This is an initial series of patches to improve channel recovery on Turing GPUs
> with the goal of improving reliability enough to eventually enable SVM for
> Turing. It's likely follow up patches will be required to fully address problems
> with less trivial workloads than what I have been able to test thus far.
>
> This series primarily addresses a number of hardware changes to interrupt layout
> and channel recovery for Turing and for simple cases improves handling and
> reliability of recovery.
>
> I have been testing trivial OpenCL workloads and with this series have been able
> to recover from while(1) style GPU loops and bad pointer dereferences on a
> Turing GPU. However if there are less trivial tests available that have been
> known to cause problems with channel recovery in the past let me know and I'll
> start testing those as well.
>

Thanks for working on this! I occasionally hit fatal errors when
working on OpenCL with the official CTS, but that's on Pascal. I could
give your patches a go once I move my main development machine over to
Turing and report if I still trigger problems nouveau isn't able to
recover from.

But yeah, generally the CTS is able to cause bigger issues for me at least.

> Alistair Popple (5):
>   drm/nouveau: Fix MMU fault interrupts on Turing
>   drm/nouveau: Remove Turing interrupt hack
>   drm/nouveau: Move Turing specific FIFO functions
>   drm/nouveau: FIFO interrupt fixes for Turing
>   drm/nouveau: Turing channel preemption fix
>
>  .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  46 +--
>  .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.h  |  32 ++
>  .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 364 +++++++++++++++++-
>  .../gpu/drm/nouveau/nvkm/subdev/fault/tu102.c |  21 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c |   3 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h |   1 -
>  .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    | 113 +++++-
>  7 files changed, 529 insertions(+), 51 deletions(-)
>
> --
> 2.20.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
