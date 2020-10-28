Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7F29D021
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 14:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AB76E50B;
	Wed, 28 Oct 2020 13:46:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7CD6E50B
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 13:46:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id d3so4840693wma.4
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=r62DDCeBDaA+jaZzr4j8psdBb6D+eb/wvvTBZGihaak=;
 b=LaHRTxVTNlFdYvYLEHFgU+Ir0Lv8tZStkVB60Ny8xoTOIEoX7d8F4oTzuEcMslN54F
 zuBNll7qHUbsLUMK9y6+XmyYcO3x+VQdxC6J0mCH3xq+M2amWUxedovc0/goy78Hf4Go
 twhjJVRwWD77oOiZCr8fPVp8537fwuzK9lNqtmYmuGJseG/587nbXPa7NUDkCWTDP3+V
 ILybbu284mc2z5fklzGD5ZO2Yw14WEXpThw+AcM5tFOEUFIS6j1xDcnBXFYiauYEYNLP
 ufzb7zFZ5TmH4FnSDJ6i66iyJKkM3TzhZpsTsFrKU33Un5vRMXAVof58Upe7qBzRhaD1
 7v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r62DDCeBDaA+jaZzr4j8psdBb6D+eb/wvvTBZGihaak=;
 b=uO/peRGERA08JCt6HgBu3EJurj9JBBKE78PB+Kk+3qnPLHItS/T94USosFrs50tG8Z
 kl3CqBZp6MqfxUde928KXO4UMuXtxcSyB6YBY18/EXtuAzbnigQW1CcVTBbvSt+8m2Pq
 4yYvYO8XjwC+s8jFDnexy121MDkn0HgqYqqMw4vQtuzrDlaGl9y+Iz4gcsvQvwOjv57t
 2si8YI8WN1TMHWbBAikD11doactxRauT8kcsoscTJkPSFiOkDBsb8jKeqZ2C+2vZ2JA5
 xV1+h/gwuMlDJXe5lrhsRrzUsq1DS9ePx8zfno7kMV6/izNfxVdpeRof8lOP1APYUtOU
 qGxA==
X-Gm-Message-State: AOAM5308ykTLf0jDpqNaZfzO/XhWRmobCBYyQs8aqzm+hL6eKcUM5LBB
 hU+75JldB9QixT18ZY+OrC+/X2eIoTev+o5Gf2dMq5fQUbk0IhRG
X-Google-Smtp-Source: ABdhPJy5AHX46v1fyEIzi/gx38THF/KS+vNcSAjK8htcHLwEMZIUdBUt9dj8HtpPYge9idGR9aFhMEIwlHqORyqPqo8=
X-Received: by 2002:a7b:c081:: with SMTP id r1mr8267324wmh.158.1603892813468; 
 Wed, 28 Oct 2020 06:46:53 -0700 (PDT)
MIME-Version: 1.0
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2020 13:46:36 +0000
Message-ID: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] GT710 and Nouveau on ARM/ARM64
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

Seeing as we (Raspberry Pi) have just launched the Compute Module 4
with an exposed PCIe x1 lane, people are asking about adding graphics
cards.

Seeing as you are the people who have the knowledge with regard to
NVidia and nouveau, what are your immediate thoughts of nouveau
working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
expert, although I can call on some expertise :-/

I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
in the memset of nvkm_instobj_new whilst initialising the BAR
subdevice [2], having gone through the "No such luck" path in
nvkm_mmu_ptc_get [3].

Taking the naive approach of simply removing the memset, I get through
initialising all the subdevices, but again die in a location I
currently haven't pinpointed. The last logging messages are:
[ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us
[ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us
[ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...
[ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...
[ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us
[ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
02 [PTE] on channel -1 [007fd38000 unknown]
[ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32
[ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
type 01 object ffffff80ee8c2170 owner ff
[ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8
[ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass
vers 0 count 0
[ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48
[ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
type 01 object ffffff80ee8c2170 owner ff
[ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24
[ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass
vers 0 count 2
[ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48

Any input very welcome, otherwise I'll continue blundering about
slightly in the dark.

Thanks
  Dave

[1] https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Monitor-Productivity/dp/B0897T6PYM/
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c#L114
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c#L201
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
