Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF529D032
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 15:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF076E528;
	Wed, 28 Oct 2020 14:10:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F76E528
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 14:10:22 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id x11so1556950uav.1
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 07:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICo8JwpPRRsOkMKCeaMxl8uMjypuzLAaw4tFfWdjdp4=;
 b=SozcjHIVZ2CytyiMWTanFcLrrTJccr/CVhjnuDSIQFxKkzk3yjkIn1NaM+nkGM2czI
 AjD5tIuPbS55G2QoIgwNiKnPPOo04mRU+oFmeM5nZk5ZlVxnQIGmPRFgxZrPWMszTyYc
 jH8Y7J7si4TDhV7j0nT89jdK+dyf60zVNguOuzKK5XTWhDuEGNjly7QK0NZsFUs1q4n8
 pKpvRNGVYMs0JIzQuE5jS63dGC1xyHC4KnPLMAxZhs8e6rsAuXxPUPckxlJeglI0EFDY
 ZT9DfD/khVv27EzJ8pXcnRZTK1dA4rVgICkRYVk+h6cSanI8aGg716+ldVuyOBK4yfEC
 ROpQ==
X-Gm-Message-State: AOAM532U244aAmm+J+IhreeOJbPmXIQbEmqaQvEQA2UCwCqGunJEb2E6
 2WlhgrOtIivz1W2fD0S/F+01o0KAXXSiFmsJwAo=
X-Google-Smtp-Source: ABdhPJyepqylKk9Iv5X0wVPUDIev1GdqZ8z5eYFtPu52XpzNeIRuO7Ux0aqvF1mH83jymSOEAmP2Unf/rGs6Mrn8+RM=
X-Received: by 2002:ab0:124:: with SMTP id 33mr4489489uak.98.1603894221200;
 Wed, 28 Oct 2020 07:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
In-Reply-To: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 28 Oct 2020 10:10:08 -0400
Message-ID: <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [Nouveau] GT710 and Nouveau on ARM/ARM64
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
Content-Type: multipart/mixed; boundary="===============0586449361=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0586449361==
Content-Type: multipart/alternative; boundary="0000000000004fe47405b2bbb9ad"

--0000000000004fe47405b2bbb9ad
Content-Type: text/plain; charset="UTF-8"

The most common issue on arm is that the pci memory window is too narrow to
allocate all the BARs. Can you see if there are messages in the kernel to
that effect?

On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson <dave.stevenson@raspberrypi.com>
wrote:

> Hi
>
> Seeing as we (Raspberry Pi) have just launched the Compute Module 4
> with an exposed PCIe x1 lane, people are asking about adding graphics
> cards.
>
> Seeing as you are the people who have the knowledge with regard to
> NVidia and nouveau, what are your immediate thoughts of nouveau
> working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
> expert, although I can call on some expertise :-/
>
> I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
> in the memset of nvkm_instobj_new whilst initialising the BAR
> subdevice [2], having gone through the "No such luck" path in
> nvkm_mmu_ptc_get [3].
>
> Taking the naive approach of simply removing the memset, I get through
> initialising all the subdevices, but again die in a location I
> currently haven't pinpointed. The last logging messages are:
> [ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us
> [ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us
> [ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...
> [ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...
> [ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us
> [ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
> 00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
> 02 [PTE] on channel -1 [007fd38000 unknown]
> [ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32
> [ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
> type 01 object ffffff80ee8c2170 owner ff
> [ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8
> [ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass
> vers 0 count 0
> [ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48
> [ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
> type 01 object ffffff80ee8c2170 owner ff
> [ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24
> [ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass
> vers 0 count 2
> [ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48
>
> Any input very welcome, otherwise I'll continue blundering about
> slightly in the dark.
>
> Thanks
>   Dave
>
> [1]
> https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Monitor-Productivity/dp/B0897T6PYM/
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c#L114
> [3]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c#L201
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--0000000000004fe47405b2bbb9ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The most common issue on arm is that the pci memory windo=
w is too narrow to allocate all the BARs. Can you see if there are messages=
 in the kernel to that effect?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson =
&lt;<a href=3D"mailto:dave.stevenson@raspberrypi.com">dave.stevenson@raspbe=
rrypi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<br>
Seeing as we (Raspberry Pi) have just launched the Compute Module 4<br>
with an exposed PCIe x1 lane, people are asking about adding graphics<br>
cards.<br>
<br>
Seeing as you are the people who have the knowledge with regard to<br>
NVidia and nouveau, what are your immediate thoughts of nouveau<br>
working on ARM/ARM64? Is there a chance of this working? I&#39;m no PCIe<br=
>
expert, although I can call on some expertise :-/<br>
<br>
I&#39;ve tried it so far with a GT710 board [1] and ARM64. It&#39;s blowing=
 up<br>
in the memset of nvkm_instobj_new whilst initialising the BAR<br>
subdevice [2], having gone through the &quot;No such luck&quot; path in<br>
nvkm_mmu_ptc_get [3].<br>
<br>
Taking the naive approach of simply removing the memset, I get through<br>
initialising all the subdevices, but again die in a location I<br>
currently haven&#39;t pinpointed. The last logging messages are:<br>
[ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us=
<br>
[ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us<br>
[ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...<br>
[ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...<br>
[ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us=
<br>
[ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at<br>
00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason<br>
02 [PTE] on channel -1 [007fd38000 unknown]<br>
[ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32<br>
[ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0<br>
type 01 object ffffff80ee8c2170 owner ff<br>
[ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8<=
br>
[ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass<br>
vers 0 count 0<br>
[ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48<br>
[ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0<br>
type 01 object ffffff80ee8c2170 owner ff<br>
[ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24=
<br>
[ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass<br>
vers 0 count 2<br>
[ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48<br>
<br>
Any input very welcome, otherwise I&#39;ll continue blundering about<br>
slightly in the dark.<br>
<br>
Thanks<br>
=C2=A0 Dave<br>
<br>
[1] <a href=3D"https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi=
-Monitor-Productivity/dp/B0897T6PYM/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Mo=
nitor-Productivity/dp/B0897T6PYM/</a><br>
[2] <a href=3D"https://elixir.bootlin.com/linux/latest/source/drivers/gpu/d=
rm/nouveau/nvkm/subdev/instmem/base.c#L114" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://elixir.bootlin.com/linux/latest/source/drivers/gpu=
/drm/nouveau/nvkm/subdev/instmem/base.c#L114</a><br>
[3] <a href=3D"https://elixir.bootlin.com/linux/latest/source/drivers/gpu/d=
rm/nouveau/nvkm/subdev/mmu/base.c#L201" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm=
/nouveau/nvkm/subdev/mmu/base.c#L201</a><br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">Nouveau@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
</blockquote></div>

--0000000000004fe47405b2bbb9ad--

--===============0586449361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0586449361==--
