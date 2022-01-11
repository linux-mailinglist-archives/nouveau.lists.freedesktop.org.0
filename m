Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29A48AB32
	for <lists+nouveau@lfdr.de>; Tue, 11 Jan 2022 11:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603D6113035;
	Tue, 11 Jan 2022 10:14:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B739F113035
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641896084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w4UFv2C7NbASGLbjZLWWBlH7/M35wDrD8QLQPaEHRl8=;
 b=WgaHs5be5vvos3CbTQ8P7sXtRkctg+DuC+yIK8P5TWmWv0EUXCBstjAxZegIbKpWWkpfNa
 1f4t4Pp2DqHXqUBGwTpe/6QklPHISErMtc9cVMpknujwHM9QyeEU4vzcQvXGg9pfHxZMGh
 Jlj+KVZshgTAaSkkDqsRQ2jBvRndB2U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-SDcVQc4-PlSluJAtSkrddw-1; Tue, 11 Jan 2022 05:14:32 -0500
X-MC-Unique: SDcVQc4-PlSluJAtSkrddw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so4739923wrh.23
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 02:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4UFv2C7NbASGLbjZLWWBlH7/M35wDrD8QLQPaEHRl8=;
 b=O3Fmj60NN7THyzt+KSNw0VRYMfwlIhP6fmekQyPEh9A5NresfNH4ZIcbBDnw1LsmBm
 KDpjq3KrRThKCoFqqRrIP+q0FFYvHC7BGBeGEqfctYYI09ALfieXxRoZLXkebPdHjOaM
 Flo4dSMYvarF7ReI7FKkhvvTP4343DTyLDchraErxuOEn9VO6qC/RAT6ZltEMl8ievsL
 JglSRyPEKz+Qb7xcrz1ivgV08C83mzxQ63mFOA9Z/SThaeCdPKbi6/zNcowo3yzuM6s9
 PBvqd+zNcxIwn6lcBHKZIM4wbszsNMG9x3arBpZHpX5GPBAgnV32EtZvCPsyxgsIYsUA
 NC4A==
X-Gm-Message-State: AOAM532ALHi69x2SXI6eapVIoNDcND5gLuMVsV/PLhVhfAFry+mSFIix
 dpQvk6PUQfB254eTtZU8G9oDZQfkDnAcwepSqTRjMqdQyL1VQkbiExi6XUieXudqeQYX/lnBhAN
 3W1YiOhj95R/HKfuetRPUDGYd/mKnhheculX9kWUckg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr1807237wmj.74.1641896070767; 
 Tue, 11 Jan 2022 02:14:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGFmntQReFhyepmbZsKbViOCRNzWWxS+UHw0oCGOJrka3xSDyYs2Pvhv6C5zPsV9yEERAWG2eY80r0GXfMRaM=
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr1807217wmj.74.1641896070434; 
 Tue, 11 Jan 2022 02:14:30 -0800 (PST)
MIME-Version: 1.0
References: <712f2647-3df4-87da-3f92-bfe15426553d@gmail.com>
In-Reply-To: <712f2647-3df4-87da-3f92-bfe15426553d@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 11 Jan 2022 11:14:19 +0100
Message-ID: <CACO55tvKFy7B1j1rgTRnVrNUvqe6dxM5h9NMnf44NeinZ1LY2Q@mail.gmail.com>
To: Ilario Gelmetti <iochesonome@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Piglit results for NV46 and glitches using GeForce
 7500LE
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

I've fixed a really really really old bug in mesa which impacted
gnome: https://gitlab.freedesktop.org/mesa/mesa/-/commit/1387d1d41103b3120d40f93f66a7cfe00304bfd7

this one is part of 21.3 and should have made it into 21.1 and 21.2
stable releases.

We also have two pending merge requests which should fix other issues
related to gnome and random other stuff:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests?scope=all&state=opened&label_name[]=nv30

I'd suggest if you want to start digging into issues you do so with a
fixed mesa and those merge requests applied.

On Mon, Jan 10, 2022 at 4:05 PM Ilario Gelmetti <iochesonome@gmail.com> wrote:
>
> Dear all,
> thanks for your work on Nouveau!!!
> I have been a user, but I never touched the Nouveau code or testing
> suite before.
>
> I am building a desktop PC with some rather old hardware and a nVidia
> GeForce 7500LE 64MB TC V/D/VO PN 88-1N01-0C-PB (NV46, G72) graphic card
> (see lshw output here [1]).
>
> I observed frequent glitches with some common user experiences:
> * Ubuntu 21.10
> * Ubuntu 18.04
> * Debian 11 stable with GDM3+Gnome
> * Debian 10 oldstable with GDM3+Gnome with errors in dmesg like this [2]
> and glitches like these [3]
> * Debian 10 oldstable with GDM3+XFCE with usually no errors in dmesg [4]
> and glitches like these [5]. But sometimes runs smoothly
>
> The situation improved replacing GDM3 by LightDM (why??), so now I have
> these two setups where under normal operation I see no glitches (but
> glitches appear after running piglit):
> * Arch without DM and with XFCE
> * Debian oldstable with LightDM and Gnome
>
> So I run piglit with various combinations of software versions and
> distros, and X crashed with some of these (the only responsive thing was
> the moving-but-not-shapeshifting mouse arrow, like this [6]).
>
> Here I detail the piglit tests and the results:
>
> * Debian 10 oldstable (kernel 4.19) + LightDM + Gnome + piglit compiled
> from source + libdrm2 (2.4.97) + libdrm-nouveau (2.4.97) +
> xserver-xorg-core 1.20.4 + xserver-xorg-video-nouveau (1.0.16)
>
> no glitches observed during normal operation
> both piglit from Debian oldstable repository and piglit compiled from
> source run to completion but at the end there are some glitches
> at the screen, like this [7], or sometimes just a black screen or all
> the windows as black rectangles.
> Here you can find the result of the tests in these conditions: [8]
>
> * Arch Linux + kernel (tested both 5.15.12 and 5.16.0-rc8 from linux-git
> package) + nouveau (tested both 1.0.17 and 1.0.17.r2 from
> xf86-video-nouveau-git package) + libdrm (tested both 2.4.109 and
> 2.4.109.r7 from libdrm-git package) + mesa (tested both 21.3.3 and
> 22.0.0_devel from mesa-git package) + XFCE
>
> no glitches observed during normal operation
> piglit-git (r11511.6c4da153b) makes X crash (or something similar, the
> kernel seems not panicked as magic-sysrq work). This happens
> reproducibly always after the getteximage-depth test (which itself
> succeeds but the next one, any next one, gets stuck in the "running"
> status) and very often also when the other "*getteximage*" or "*vertex*"
> or "generatemipmap-base-change" or "arb_get_texture_sub_image" or
> "texture with glblitframebuffer" or "fbo-finish-deleted" or
> "ext_image_dma_buf_import_sample_argb8888" or
> "depthstencil-render-mpilevels" or "readpixels-24_8" (I noticed that
> when it does not make X crash it just results in dmesg-fail output,
> maybe this happens also to the others, I didn't check) or "texsubimage"
> or "draw-pixels".
> The glitches caused by running piglit look like these [9].
> When I manage to get out of the crashed X (using Alt+SysRq+R,E) I can
> get some error messages from dmesg, like these [10].
> And here are also some coredumps obtained via "coredumpctl dump" command
> [11].
> After many reboots and adding many exclusions to the tests list I gave
> up trying to reach the end of the tests list, so here you have a couple
> of incomplete lists with the results that got to actually run: [12]
>
> Let me know if I can help.
> Thanks for your help and for your precious work! :)
> Ilario Gelmetti
>
> [1]: https://uz.sns.it/~ilario/nouveau-nv46/lshw
>
> [2]:
> https://uz.sns.it/~ilario/nouveau-nv46/debian/dmesg/20220107-nouveau-gdm3-gnome
>
> [3]:
> https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_002132.jpg
> https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_002140.jpg
>
> [4]:
> https://uz.sns.it/~ilario/nouveau-nv46/debian/dmesg/20220107-nouveau-gdm3-xfce
>
> [5]:
> https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_001511.jpg
>
> [6]:
> https://uz.sns.it/~ilario/nouveau-nv46/arch/glitches/IMG_20220104_130045.jpg
>
> [7]:
> https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220104_231136.jpg
>
> [8]:
> https://uz.sns.it/~ilario/nouveau-nv46/nv46-2022-01-05_1020-ilario.json.bz2
>
> [9]: https://uz.sns.it/~ilario/nouveau-nv46/arch/glitches/
>
> [10]: https://uz.sns.it/~ilario/nouveau-nv46/arch/dmesg/
>
> [11]: https://uz.sns.it/~ilario/nouveau-nv46/arch/coredumps/
>
> [12]:
> https://uz.sns.it/~ilario/nouveau-nv46/arch/nv46-2022-01-06_1321-ilario-incomplete.tar.xz
> https://uz.sns.it/~ilario/nouveau-nv46/arch/nv46-2022-01-07_2210-ilario-incomplete.tar.xz
>
>
>
> --
> Ilario
> iochesonome@gmail.com
> ilario@sindominio.net
>
>

