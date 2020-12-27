Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43B2E3268
	for <lists+nouveau@lfdr.de>; Sun, 27 Dec 2020 19:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABDA8973E;
	Sun, 27 Dec 2020 18:28:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529178973E
 for <nouveau@lists.freedesktop.org>; Sun, 27 Dec 2020 18:28:14 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id k47so2743454uad.1
 for <nouveau@lists.freedesktop.org>; Sun, 27 Dec 2020 10:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHXagY3A/DK4pEpN7boYvTeZV4qY/yf7WrSua4i2PV8=;
 b=hT2e4LNxO65Tf2NY5GFqO6kQqmvOlfJPcl64ALH8Vs4ICWIONB1dIm/7OBjPjlAin9
 MwPdABDNlc24gl4l/STm3yrA526I1BvMAa6SFQu0g8HKYFeHHFCMLglDh4dhVz3oRpWz
 y06J4eH/I3CpA0orCxRh5rLXbHlbMTmyPzsPTL11jDpVia5QczTs0njbUGjvFf61hF+S
 rMQLU3i1TIBrBC9mXvgWkT/WgDFZRYRHIyv0ci81y44DF96I2WB1raFemOdETGUc0Cx8
 Vkt4q8cXZvZ/sc8Vd1El6BOdNnkm357s/Oe//Rm8sxW4UX5SnQwtG0jSKTAd/lUy6y8g
 OhHQ==
X-Gm-Message-State: AOAM531qdxAzorUWvzU6MVwcOOddj+pO4Cq7K/Aq/+Nx0AGxNXv3bxTm
 uU74Vu8BALQXMMFZs7/DfmtGlkBdeKue11QIToo=
X-Google-Smtp-Source: ABdhPJz1BQy9K3ilducip6gKHDgDVrGXFEjWVw2n3lxHJwDA/WOsfUGMlfTMwsAOI7/ZySlBlBJisayfcDG/BcJU0UI=
X-Received: by 2002:ab0:3806:: with SMTP id x6mr26004284uav.58.1609093693309; 
 Sun, 27 Dec 2020 10:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201226111209.GA2498@merlins.org>
In-Reply-To: <20201226111209.GA2498@merlins.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 27 Dec 2020 13:28:02 -0500
Message-ID: <CAKb7UvhuWdPBgqV+Nf+KJ_Eb9SOJrbTxfBwiA-7HtdurVd+LiA@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
Subject: Re: [Nouveau] 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Dec 27, 2020 at 12:03 PM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> This started with 5.5 and hasn't gotten better since then, despite some reports
> I tried to send.
>
> As per my previous message:
> I have a Thinkpad P70 with hybrid graphics.
> 01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M600M] (rev a2)
> that one works fine, I can use i915 for the main screen, and nouveau to
> display on the external ports (external ports are only wired to nvidia
> chip, so it's impossible to use them without turning the nvidia chip
> on).
>
> I now got a newer P73 also with the same hybrid graphics (setup as such
> in the bios). It runs fine with i915, and I don't need to use external
> display with nouveau for now (it almost works, but I only see the mouse
> cursor on the external screen, no window or anything else can get
> displayed, very weird).
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)

Display offload usually requires acceleration -- the copies are done
using the DMA engine. Please make sure that you have firmware
available (and a new enough mesa). The errors suggest that you don't
have firmware available at the time that nouveau loads. Depending on
your setup, that might mean the firmware has to be built into the
kernel, or available in initramfs. (Or just regular filesystem if you
don't use a complicated boot sequence. But many people go with distro
defaults, which do have this complexity.)

>
>
> after boot, when it gets the right trigger (not sure which ones), it
> loops on this evern 2 seconds, mostly forever.

The gpu suspends with runtime pm. And then gets woken up for some
reason (could be something quite silly, like lspci, or could be
something explicitly checking connectors, etc). Repeat.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
