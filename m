Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1733598AD8
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 20:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1910EACE;
	Thu, 18 Aug 2022 18:03:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A610E7F2
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1660845774; bh=D8Hh20Zw+PiObqilhH14cQE/y8S0smmKWiR//h9tOhI=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To;
 b=ObhwMzI96QCRaKhowAPXehLp2ao7rXyrUi5u1/ViR23TFhOUNwwf4NIB3qGDDkXispTAz+3l8e9LIJBJzzEL5hTRAB+Sr9vi2l2CYrlF9vKmC/wOvKBXlDyHyYHsKMht79p0niexpSos/e35UkvCVxiogwd53X8Lb4x/+3wk73CRVkJsLS2RsxOZSn1wEAcDzek6o0wuRDsL33sNgceLUnEQu3md/h4JXtXu9fWlXgVRi2Q/W6ZtnHPmOdeZK6DhyK3o+8dlOQ+TN0iX39/mJcUnrjbMS+jvkAhV+ZpP0oRJAXJy1y4i98onsLeuWFH2UZ6BFusji7NMY/eXNCkQjQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1660845774; bh=OQtpdrX7vAcc6Lj9wMMQqKeLuAzmVMxZZdHGoV60mLT=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=baSCgN2tW4MJhlylMYcsaUbMMtFYYrSwwHmBKuoGqzuKEp7bfkOYnuXjXENsJE7nmJ+6wnL64u7M+3SDBu3DjDKykN88X2bdSimSScP+dE87k8exxNQ8+y1dIv0VzpNF3NMfsxdo5yARAQn4F/J3otjbhieiU3vGo6MHig8s1vtsui2r2YE5KO0I2Zd8J0F7AxlP5+dqKSxWBP4bxGj83gS79IeuLWLsUxQjZQsHMPM3GWpX9ScWW0a1cuO3Yo02mIugNel5uRcCUt8zir7NLyploqieK0GEMmF3t1y/8webnfQEadf8OjOkncwUWBhRSkC+4hsjNTsurNAey06t8Q==
X-YMail-OSG: pzBER84VM1mC_s8S9w9FiTjRdGkiIBEgkGLl.lYMl_0feywt0EdrD1mmIFKlu7d
 KO4lyc8QQ5TBlNTdV_SQggdcBn.weQULjhtWHBHTcD5QbSQSOjc8FtrnWxLOGuQSVCVgFk9eA6pN
 5jAMC_DfY92l.ZLkGh..gan6Hcc3u1ahQzREkQRm3g4PDpvQt6X2dgXiPofu5Tar9Uobx28o8fRH
 9fOGWSX8px.P9J8cCUGHSeGAboUlSj2T5cgS6i.RS.ltLM3CvFnQ5vXPE.L8GgoZt.iyN9qcb8SP
 GNhCO4_kVNr35GJ9ysLczEmq4jk4JGkfqRcpyszIY_lJB68_N_Ib4SNlq4FkuNgyJE2muTm__8zI
 .RMf1K0TWImb377ADDDgdyGgqCalzRynXewTkyYbCixCdWXSvFYjqmX_oUTs_oVUS9P9h7a83zj7
 lgzLJElg4zVNXt8L2eF2Sfazp_e2rJjdVk1vxyfewGxgyMvmKRRf51iSR517snq9YyktQvLAOYzS
 6xYrurKwD6ZLpavpuCRyoA3bDd9nnbrZ51pwA8uUE6XQk5v2K9YPw.6j4_NnBn1BbdMjb8AUW_Rn
 aLSXPppYkN.qaTkwipwlDf5bD6J3hxjjLoWb7_Tv7REUaduboc_k5uycv_W1cjXkWpZShUKyagmO
 KKdhWuMfux.2jQcOJyx9DrfGd6DDSB3GjJKDWETdTVhXcsIqYR2N2NL1phFkEv1wxO2G.LBdRHx4
 GQFAuJZ4.6Zp3nRTo57OkIzbItM0LHGSMA_2vfP0MIzXrpU7RXucWsW0w1t.4N1imQDAKMuc99Nj
 LalmbOpZpnxPJtfLASMYdk7VcD.ufXIoH8WfS0YouJkZA6v8OJTrpbKwnFbnkbqAZkOg00jIRGgW
 yipNbyqy.EOep6.q8KZndJajXV8bWZ4oHIDB_zyl542eiEgV4kxtMQTicQ0HCnkscZ.6pePyU8bG
 0areEG24.p499hjnQ4hS8b3HVfoX.FWeiTkjVdxY.ptXs0VTEkA7B3b.UEk86rYhqum4l3_W6Py1
 tEf6Dl.AyBw4rKWX7GybCAYhxrYtagGYu3KEp5Pt.a9Z65yGBgCZfHGexIXhS5KAd4JKpTOfEY5b
 2xvrS0S9Wf6veoklTEhoBInKVHd0.m5Rg4Uh0rtJJX8ddR8HOoG9nYhUSqH7u8vmCOAc6aYdafdb
 gaw9lGRUmMyz7Sm44Vo0.MTTeaEFTLcaKnp6ZH.TpVDXG_czBZaofyCZUyD0Fp6cZhcWEouaHUGb
 Iw1Ce6YUd7BYEBYLm5uq7TCH4.jxbzUxTTL9wfQgHCv2LK1190N.FgAgiIv.LpJni3TGV5FnoemB
 a1HcRpz0aY2DMGs1vXTfYPqtVQ96BTWNLmm5guA2l6EIdm2PLWEUw4pXjo2iD3FtSdZSYJObI__l
 gvv6N3LfREBk0jWGOxc3qyp8OG51FH7On1epTGFuBUBHWAsVYjCEQNan9YRUYdRA.qBkVYvBiMmC
 hSohcs.wciOogWLDf8yFb0O40qilhDp0VQ3bw6WnILC7pxi4_oQ84udVJpe.fMltW5qEX_7hCvXU
 9r7fHhebH7MrIkbXq1CXzZOsJai0gdkhw_7N5dYXUcpXh9ZGlL3tmmf8Hq6txD.08V5xycvVfl_Q
 .JJzGz3J1flDPWrcWmDPtDKV.owXeXfngp7kfg1f_SqVhvSB0EVsDdh5lP23ajCEigJcCpuB37ea
 mKhEN.f2_rfFKq266WPx1ynHs80g_P3h58aTJpw73n3._UqDGjXqLtcXfxuwPjYMcoWKZUJGJfng
 SN3vsTqEOuCksKca8mq6XWrJM3QgXrcI536LyopptYv3zSHW_05dERXwNsCYWQa08u8aVHMDJVlc
 U8._VlbMrRIMhQSHfOErPR8yMkdbbdtIbqv5fZaZqGEWf9ZHO77jIORRywzg5ysqFIV7nhRHVGT3
 cgdC0_pLEiMTAaul5a2zmbZ7_NhagKVqi6jVOlCyXgc1tbAIws6X2H0fN8YAFPzPBpi.i1o7BlBx
 hccKulK.FYvmGEAlhAZTxKH6ESpiqeCj2bgTt2uwqVMxPMOeovE3eBK0NIDvz.yEQcndqU4LwEhf
 hhrCFpEINEvIq0yFlm.2gGrOig.UNJG0jDxRKrStTlSW1yfTNmI4.MShw3MeswAyYqmml3J55oSU
 W5XG8USaUdOVOiTmC_u1aaxAy2sxnb440k2qBhJ7EzsE2kI_bTrwgyCWQ_crTOUGFaBJUVfCennq
 fX0BJYTEtXzmlv7_Vdg--
X-Sonic-MF: <dgpickett@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Thu, 18 Aug 2022 18:02:54 +0000
Date: Thu, 18 Aug 2022 18:02:50 +0000 (UTC)
From: "David G. Pickett" <dgpickett@aol.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Message-ID: <459852889.305460.1660845770242@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_305459_1770749147.1660845770241"
References: <459852889.305460.1660845770242.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20531 aolwebmail
Subject: [Nouveau] Ubuntu 22.04 LTS system freezes 5 minutes then unlocks on
 nouveau, was stable on 20.04 w/nvidia
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
Reply-To: "David G. Pickett" <dgpickett@aol.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

------=_Part_305459_1770749147.1660845770241
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When I chose to upgrade from Ubuntu 20.04 LTS to Ubuntu 22.04 LTS (Long Ter=
m Stable now seems a bit unrealistic), for some reason they removed my nvid=
ia drivers and installed nouveau.=C2=A0 My system freezes intermittently fo=
r about 5 minutes when graphically active apps like Firefox, Chrome, GNUCas=
h are running.=C2=A0 I am limping along with Chrome set to not use hardware=
 acceleration, a setting both sad and amazingly odd!=C2=A0 I recall having =
a similar problem in 20.04 until I switched to nvidia proprietary drivers.=
=C2=A0 I might do that again, but the controls to do that successfully seem=
 to be harder to find, and maybe 22.04 thinks that they are incompatible.=
=C2=A0 I destroyed my bootability trying to install using the nvidia 340 ru=
n file when it failed to make a kernel, and had to reload the whole OS.=C2=
=A0 My GPU is an nVidia GT218 [GeForce 210], NVA8, rather old, now nominall=
y supported by the nvidia 340 series libraries.=C2=A0 My system is an=C2=A0=
Hewlett-Packard p6803w, AMD=C2=AE Athlon(tm) ii x2 220 processor =C3=97 2, =
with SSD and 16 GB RAM.=C2=A0 Ubuntu 22.04.1, Gnome 42.2, Wayland, with all=
 current updates.

How can I help you find the bug?=C2=A0 Being both a 20 year hardware and 25=
 year software computer veteran, I can follow requests pretty well.

BTW, nouveau does not allow BOINC apps to run on the GPU, which nvidia supp=
orted under 20.04.

I'd hate to have to remove my GPU (the motherboard has a primitive one), or=
 replace the GPU if any compatible ones are still available, or replace my =
computer to get a stable system.

------=_Part_305459_1770749147.1660845770241
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


<div style=3D"color:black;font: 12pt Verdana, Arial, Helvetica, sans-serif;=
">When I chose to upgrade from Ubuntu 20.04 LTS to Ubuntu 22.04 LTS (Long T=
erm Stable now seems a bit unrealistic), for some reason they removed my nv=
idia drivers and installed nouveau.&nbsp; My system freezes intermittently =
for about 5 minutes when graphically active apps like Firefox, Chrome, GNUC=
ash are running.&nbsp; I am limping along with Chrome set to not use hardwa=
re acceleration, a setting both sad and amazingly odd!&nbsp; I recall havin=
g a similar problem in 20.04 until I switched to nvidia proprietary drivers=
.&nbsp; I might do that again, but the controls to do that successfully see=
m to be harder to find, and maybe 22.04 thinks that they are incompatible.&=
nbsp; I destroyed my bootability trying to install using the nvidia 340 run=
 file when it failed to make a kernel, and had to reload the whole OS.&nbsp=
; My GPU is an nVidia GT218 [GeForce 210], NVA8, rather old, now nominally =
supported by the nvidia 340 series libraries.&nbsp; My system is an&nbsp;He=
wlett-Packard p6803w, AMD=C2=AE Athlon(tm) ii x2 220 processor =C3=97 2, wi=
th SSD and 16 GB RAM.&nbsp; Ubuntu 22.04.1, Gnome 42.2, Wayland, with all c=
urrent updates.<br>
<br>
How can I help you find the bug?&nbsp; Being both a 20 year hardware and 25=
 year software computer veteran, I can follow requests pretty well.<br>
<br>
BTW, nouveau does not allow BOINC apps to run on the GPU, which nvidia supp=
orted under 20.04.<br>
<br>
I'd hate to have to remove my GPU (the motherboard has a primitive one), or=
 replace the GPU if any compatible ones are still available, or replace my =
computer to get a stable system.<br>
</div>

------=_Part_305459_1770749147.1660845770241--
