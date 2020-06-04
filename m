Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C31EE6BE
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 16:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C7F6E065;
	Thu,  4 Jun 2020 14:36:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2274C6E065
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 14:36:38 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id a68so3646616vsd.8
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 07:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4Hx3BwEHJH2So5kTa/MIItyAdGgUGAgTi4KywxGBGc=;
 b=HaOT1Eqa0U8bvZtHFcv/QqL25FIeX+GrIKau0aSQ5bWvn2ME6vwriuU1/5E0ICbOk9
 YyPV5qwcuJ2CkLXKm8ZH1OH7u/LGagkbXbgUfPRBdS7NgIj9nkCUCw8SyY2j1yKn84o1
 VIwQrpJLE8Wgv7KR8hiMjjRYIG2rzvNQp4FIeZ1njxgDqJCW7yBwc05NP+iEhyKXl+26
 f1jgm2cC+9IphLPNLPmQd3Hi8AUmvkZBSxfuxUnMI7Q2lzH8Ih13fwLlkF18qVsaid0H
 VPNVhVxZPkjUFaVW4/0yth7YiZFb/4J3XB38faOLDfbIVynrTEPHYbnA5SMDLYmkl6jQ
 ulbg==
X-Gm-Message-State: AOAM532MAkFeeyMf7eZwYN4EZFVEz6iiVnOho/Ju/1ijXnnVb9LaOPlH
 h1wdCEh4GHWzhpSTA6j9u77OTwtg2DDF67UCt3I=
X-Google-Smtp-Source: ABdhPJwhCxXt1KLLCABr033pxl0Bt2L46aMad4CJ0ByJy9dVIIbK4v2b84tVyvNLADHeUE9fta3uCAKWrbD9/4nn5GM=
X-Received: by 2002:a67:3083:: with SMTP id w125mr3719385vsw.207.1591281397221; 
 Thu, 04 Jun 2020 07:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
In-Reply-To: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 4 Jun 2020 10:36:26 -0400
Message-ID: <CAKb7Uvg0W_1qUjf3G4JrCb2oJgkwz4G5T6PwkyeL-rZEp4UnTw@mail.gmail.com>
To: Zeno Davatz <zdavatz@gmail.com>
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

Starting with kernel 5.6, loading nouveau without firmware (for GPUs
where it is required, such as yours) got broken.

You are loading nouveau without firmware, so it fails.

The firmware needs to be available to the kernel at the time of nouveau loading.

Cheers,

  -ilia

On Thu, Jun 4, 2020 at 10:24 AM Zeno Davatz <zdavatz@gmail.com> wrote:
>
> Hi
>
> With Kernel 5.7 I am still getting this, while booting:
>
> ~> uname -a
> Linux zenogentoo 5.7.0 #80 SMP Thu Jun 4 16:10:03 CEST 2020 x86_64
> Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux
> ~> dmesg |grep nouveau
> [    0.762872] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
> [    0.875311] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
> [    0.875681] nouveau 0000:05:00.0: acr: failed to load firmware
> [    0.875780] nouveau 0000:05:00.0: acr: failed to load firmware
> [    0.875881] nouveau 0000:05:00.0: acr ctor failed, -2
> [    0.875980] nouveau: probe of 0000:05:00.0 failed with error -2
>
> Old thread is here: https://lkml.org/lkml/2020/4/3/775
>
> My Linxu-Firmware is: linux-firmware-20200421
>
> This used to work fine with Kernel 5.5.
>
> Please CC me for replies.
>
> best
> Zeno
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
