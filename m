Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B063534B9
	for <lists+nouveau@lfdr.de>; Sat,  3 Apr 2021 18:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3626E056;
	Sat,  3 Apr 2021 16:32:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CCD6E056
 for <nouveau@lists.freedesktop.org>; Sat,  3 Apr 2021 16:32:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id v15so11529621lfq.5
 for <nouveau@lists.freedesktop.org>; Sat, 03 Apr 2021 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7YO0STN2V/7GPTnUJg9DRy0W92AQmhGQAuHegHftzRA=;
 b=n6ZAxv/NG0Q0iGfj6/MMGnKseuFuEgsY2+sQ+R/oOs/hbsy1iA5MoKWdtdHA714c1E
 CZHRJOG3mijTOO0/oeHI41oSTgM0jCEpH3JplWeQbRs/1F+2mdNUvfUc9opwV7/8h00/
 AK4lMz3p6F8kmE25RWDlR/Vkcgfz63FGV5XDud2UNFT9NwZFPH5fYVkcRr6wSOZ5ao0g
 xwjA5vu1787zGLL8SDjyLHwOq62iphVX9y9Y6S8d6VNMbdS5kieAaeB16+7cF4jb77sv
 qe+Ra88WyHNtqmf4HBc0CF2FZu0mx7p5MhO54oMB+vAhco5Vhrx4gA0xNfOKWWft7CFY
 aeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7YO0STN2V/7GPTnUJg9DRy0W92AQmhGQAuHegHftzRA=;
 b=QCm+txHM6aGcNr6Kyu/L91UmpORwKzYQBBY8Ckn02ck0d/OOAzgKBm4ElQinQ1ke5l
 i5u2kZZDkLGrZv9lIRdF7d7WqgvGelDR/zWbV6IxE9LA7anLhBJE1pdhLI+odo1X5RO6
 qu+IAolExfTPTsDUNyBoTafwBrREIlNJxTZwC8y8FRczUJe8o/+K79TY6ZbU6smFM/jf
 I6U5nE/zliU79uOV2XCLnl+g5hsROA/FfE4c7eN378S+R3Gjg1VOhehwu0KJY4MGoHMt
 UCsICLSpxn0fo/sO850ZMLaKk05MLNc+oij0IQ7mpZXJYKIFv2Oj5owVQqKUPMhe/oRg
 1+nA==
X-Gm-Message-State: AOAM532q9ueY5nf6F+/LTOVVXkB6K48SmgQP2EkM9ZWecAsIv2L1+Av3
 GtuRPInnhI/VwXX8eHmxWi44CvP68Hw9z9jWvM96shAXHUhAQw==
X-Google-Smtp-Source: ABdhPJxJSgFSmOkFZKWlsCg8VOatDTKVVBEhaRavTjr8LKNtR3GypvU/st+7MsOpA0ua0bLCeTY7AFLRy48TQeOFgUM=
X-Received: by 2002:a05:6512:3b98:: with SMTP id
 g24mr11857289lfv.103.1617467526114; 
 Sat, 03 Apr 2021 09:32:06 -0700 (PDT)
MIME-Version: 1.0
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Sat, 3 Apr 2021 11:31:30 -0500
Message-ID: <CAPpdf58zoKivtjOdH+PrgAftMYrDc4bRMb_XoL1rVjkSWHV7GA@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Subject: [Nouveau] solved one issue to find another behind it
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

Greetings

Running debian testing (11) on a 2 gpu system, 1. nvidia 1050 Ti
(GP107 - NV137) and 2. nvidia 570 (GF110 NVC8), driving 5 monitors (1
- 4k and 4 - 1920x1080).

Managed to get some firmware extracted from a proprietary driver and
thought that the 1 to 2 times per day reboot schedule would be behind
me - - - no such luck.

If anything the graphics system not coming out of hibernation is even
more severe than in the past. Following is the error in dmesg:

[29122.652867] nouveau 0000:01:00.0: DRM: core notifier timeout
[29124.652856] nouveau 0000:01:00.0: DRM: base-0: timeout
[29124.654454] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT
at 690400 [ IBUS ]
[29124.656479] nouveau 0000:01:00.0: disp: intr24 80000000
[29126.656436] nouveau 0000:01:00.0: DRM: core notifier timeout
[29128.656420] nouveau 0000:01:00.0: DRM: base-1: timeout
[29130.656505] nouveau 0000:01:00.0: DRM: core notifier timeout
[29132.656488] nouveau 0000:01:00.0: DRM: base-2: timeout
[29134.697380] nouveau 0000:01:00.0: DRM: core notifier timeout


I can't really find anything that will tell me what the issue is nor
anything about how to fix.
Please??????  Ideas/suggestions - - - -

TIA

(am unable to set up an account over at gitlab - - - I don't seem to
be able to get the confirmation email)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
