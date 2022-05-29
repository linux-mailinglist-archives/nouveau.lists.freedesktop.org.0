Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B25372F1
	for <lists+nouveau@lfdr.de>; Mon, 30 May 2022 01:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F132112A52;
	Sun, 29 May 2022 23:26:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C117112A51
 for <nouveau@lists.freedesktop.org>; Sun, 29 May 2022 23:26:30 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id f4so9883309iov.2
 for <nouveau@lists.freedesktop.org>; Sun, 29 May 2022 16:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9W/4z6MATRMfyTmgbKT7UdUMYkTUDvLkUnfjl/5jzQ=;
 b=zsed1ktNtSBxHLv7061+pNnb1Hftso4P9VjTtovsIn+ES4vP7O2ayTiGkwU4Kj1Lpm
 nq59EhQEbxobl6GWySRieiMQ6LVTIJG9drIy8EYbZ0PnFPWU85lZvSLXufWeJ8uPe9oi
 njeD9h96r918eCMAd/7qDLA5dO+rpH3jEo6qhChPqrpkZG5LqZRAlW1bpJdcNnZ1/iIU
 KQR+GMoPCzIwqvAaWSQ+UCiniHpCNg4EAjUlrruh7MebznoEmL8OqXJ7yoMtc+wFPNd0
 oiYpQAHzQt5wSPXEWJ1Wx0dxpmoyYCAgEHd3BMH4RLp+jC4mHUWYje2fRclPcOTWwOWj
 77Yg==
X-Gm-Message-State: AOAM531VUMUe34C4kegcK2b8v1LMT2OjpZUtlhFZdbLNUC3qYZ7UVPh0
 XnjALh5SiSKyVHCsI9EHT+8BuHt+NTO/ysAqpGo=
X-Google-Smtp-Source: ABdhPJy4nLrfeSmbhXc0p5RsSCHgORRCO160QWJgqbQbV/MHBLe2AU8DyfTvDyXSMsqhrfZlJWWZPtK2HRIoT/XSF18=
X-Received: by 2002:a05:6638:339e:b0:32e:dbff:7c3f with SMTP id
 h30-20020a056638339e00b0032edbff7c3fmr15622635jav.73.1653866789755; Sun, 29
 May 2022 16:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPmk3hBMuFo9ebX3=rwPqp9tQnPrF9J67LOdxn7QxGry-XVC-Q@mail.gmail.com>
In-Reply-To: <CAPmk3hBMuFo9ebX3=rwPqp9tQnPrF9J67LOdxn7QxGry-XVC-Q@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 29 May 2022 19:26:18 -0400
Message-ID: <CAKb7Uvi-bXQh5Xb7qvOMrQj4VJTB_+PLgXZ69AY5OA0+RkX=xA@mail.gmail.com>
To: Joe <joe.on.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Hardware decoding in video playback with Nvidia GT
 218 (NVA8)
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Joe,

On Sun, May 29, 2022 at 6:58 PM Joe <joe.on.list@gmail.com> wrote:
>
> Hi all, I'm trying to make running hardware acceleration decoding on
> my old GeForce 210 (AKA GT-218, or NVA8 / NV-50 Tesla family).
> ----------------------------------
> 02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218
> [GeForce 210] [10de:0a65] (rev a2)
> ----------------------------------
> [ ... ]
>
> But when I touch something, for instance "f" to enlarge to fullscreen,
> or "q" to quit MPV...
> Surprise!
>
> My system freeze, nothing work again, just the mouse cursor can still
> be moved around.
>
> [ ... ]
>
> I'd like to use open drivers, but I'd like to take advantage of
> hardware decoding too, so that my CPU rests as quiet and fresh as
> possible. Is there some other suggest to configure some other aspect
> and try to achieve my scope?
> Or my tests are all I can do?
> So for hwdec is better to switch back to closed source nvidia driver
> legacy 340.108 ?

Proprietary driver will definitely work better for hwdec than nouveau.
Forgetting about any stability/performance issues, there are some
reference frame ordering issues in H.264 decoding that were never
addressed. This leads to occasional corruption in some videos.

FWIW I've mostly tested with mplayer, and I didn't run into problems
there. There should be instructions on using mplayer at
https://nouveau.freedesktop.org/VideoAcceleration.html. The thing you
esp want to avoid is using VDPAU + GL in the same process -- so things
like "-vo vdpau" are much more likely to work than "-vo gpu" or "-vo
gl". You can try enabling DRI3 -- perhaps something broke in the DRI2
paths. You can add

Option "DRI" "3"

into the Driver section of the xorg.conf to expose it. It's not on by
default because there are some annoying corner cases that some window
managers run into with it (KDE as I recall).

I'm also not sure why VA-API is corrupted for you, it has worked in
the past. But it gets a lot of changes only reviewed by AMD
developers, so it can get broken pretty easily with AMD-specific
assumptions which don't hold on NVIDIA. I suspect it should be easy to
fix by someone who is interested in investigating -- probably a bisect
to sort out what broke it, and then revert or get the person who wrote
it to fix it.

Cheers,

  -ilia
