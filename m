Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BD1EE692
	for <lists+nouveau@lfdr.de>; Thu,  4 Jun 2020 16:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ADF6E079;
	Thu,  4 Jun 2020 14:24:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809116E3CE
 for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2020 14:24:43 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id g3so6195427ilq.10
 for <nouveau@lists.freedesktop.org>; Thu, 04 Jun 2020 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JS6HyeVvkiCeDemuhmHzEunRqmqArfkWc2lfz975jaM=;
 b=GJkFARNUDltUhSI4g77UUJqkqXhQ4Sljzq2oabPOKKvdlLn4cSjYcrMZuZKO3+v7zE
 WTcbBBgnGlQZM2ulOQ3wCDrzSBbmw3LJHI8H0Z1YRdz+NuVAmV44585FkTS09ufVMBY1
 d7mSwWz5dgftw+kaQ8nMYAzNCFkWDrxuyh8vVYWBHB8XOOzyiY4vJe7RyHNYjSI2l59Q
 Kn/PWbO2lW69j0Z5xlAuyNtERmkI1p7YEzbSJRYoDFGmjvSTMQwPFfLvuRpd4z8DeFUX
 xfavYTMO9JGZTGIIotzJN1ZDGGWObzYhzudTQryVJSt2Bkf8PFoEoMX8icC1siFGWkFw
 MG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JS6HyeVvkiCeDemuhmHzEunRqmqArfkWc2lfz975jaM=;
 b=thaqnplLDuhXjWS2klJ6Tr5k+l5USgIU6rxonD/NRP+dUmDn/4AEdYSjPhJ2jZIKJG
 6nGoXEkmydzT40itKXsR0CgYjugEw/S8cGuV9+2kHZS9pdbELus5k1mcIuPlJ4AzJyiI
 gZ6rTa4jtABwkE63hNKqdiVWvMVE0UVVmG4/YqA0K475bblzp09ETuR6Cj5lSx4X/pME
 LgqlfwJ1qDqGA/4l0NYE+AF47WIE9MoOQhvLpXc4uhqrzS7UxUwYY5Qxnmg1qg4bfNna
 380HMqlQ0NMvaRzha79iJb5dnfJ5ML+LScDTaAESd3wFQDftsebmpNhySjZXkwt7+POH
 gp2g==
X-Gm-Message-State: AOAM531281eZWk1uR007Wwb9rNcHvRNap5WkcADsMyiO7inOpndbV33d
 Aqc6teBLLNitLeSIkrkPP4g8UArVL/UXea3Ul4dhpWlnjUg=
X-Google-Smtp-Source: ABdhPJy2fM6Chl0A3+CRZB14CZUFCbwsNW4wh+kid99szc1vK1MLRFrJmJpID9X9N+BTR0IjCtDl1Xzila4UI6GHaOs=
X-Received: by 2002:a92:af44:: with SMTP id n65mr3944790ili.61.1591280682508; 
 Thu, 04 Jun 2020 07:24:42 -0700 (PDT)
MIME-Version: 1.0
From: Zeno Davatz <zdavatz@gmail.com>
Date: Thu, 4 Jun 2020 16:24:31 +0200
Message-ID: <CAOkhzLUrNYk6JKTbTQuFkfuGKxGvW9XVq6+p9igsBgX1-e9Cxg@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [Nouveau] NVIDIA GP107 (137000a1) - acr: failed to load firmware
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi

With Kernel 5.7 I am still getting this, while booting:

~> uname -a
Linux zenogentoo 5.7.0 #80 SMP Thu Jun 4 16:10:03 CEST 2020 x86_64
Intel(R) Core(TM) i7 CPU 960 @ 3.20GHz GenuineIntel GNU/Linux
~> dmesg |grep nouveau
[    0.762872] nouveau 0000:05:00.0: NVIDIA GP107 (137000a1)
[    0.875311] nouveau 0000:05:00.0: bios: version 86.07.42.00.4a
[    0.875681] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875780] nouveau 0000:05:00.0: acr: failed to load firmware
[    0.875881] nouveau 0000:05:00.0: acr ctor failed, -2
[    0.875980] nouveau: probe of 0000:05:00.0 failed with error -2

Old thread is here: https://lkml.org/lkml/2020/4/3/775

My Linxu-Firmware is: linux-firmware-20200421

This used to work fine with Kernel 5.5.

Please CC me for replies.

best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
