Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1A169121
	for <lists+nouveau@lfdr.de>; Sat, 22 Feb 2020 19:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDD789332;
	Sat, 22 Feb 2020 18:02:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sat, 22 Feb 2020 18:02:11 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2688989332
 for <nouveau@lists.freedesktop.org>; Sat, 22 Feb 2020 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582394529;
 bh=uNwhePpCebimwAHiBacDLpAX3OiNLOObqiRMpSys7NQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=E/djaBTed/XxBcG9MporUibTI3caLec+k/vgRxQaOaYxo5uBDTe9XtdfeVwdlC1/X
 V8HoAbNsF6w0gsmXRCFIXZL02/48YS7gYQKvvG7oMeFkFvQwzXhRhpsKDAFl7cqq+C
 1eYQUUFByhnHljga8fT6uZiv5+R3qKZM0ZU9igqU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [79.203.240.238] ([79.203.240.238]) by web-mail.gmx.net
 (3c-app-gmx-bs13.server.lan [172.19.170.65]) (via HTTP); Sat, 22 Feb 2020
 18:57:04 +0100
MIME-Version: 1.0
Message-ID: <trinity-c5570114-8f17-4b15-bb54-f6a39340ef19-1582394224520@3c-app-gmx-bs13>
From: "Lukas Schubert" <lukas.schubert@gmx.de>
To: nouveau@lists.freedesktop.org
Date: Sat, 22 Feb 2020 18:57:04 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:r0wuBjzMblpgYWF6ULYuMEw3SF341iSF9uVB2vrxHFylmrX8mpvhFfi2rifqUd/sjTBt/
 KywJaMlO11Bw+yep5bQFR0y5DYhzI2l6VFUmzWcRFKf1lZdgZsiTuy0CM0+Y/17ekaJlFUlLhwMN
 Un5CvoulUpDsKMoyI9058GGiPoN9q56GKpsHni35+bEo9rjVS0CMxo7V+nPyi0pL7VXpfb6gy4m6
 /kyx/Aolg42vegB8g9CGgM4z4nAKjoq+wuolknIY+EbZ6yHu96qD1h1Se8G+wrI/MSZB3rvrr0Ey
 vQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pyGZvcKvQjw=:HbCaW14dHHll8Y9O6Vqcsd
 TdGeDj7bVz/vtBC922BoCi9LTZ5XkMsij1MdaQsjtXvGOmqy55btobyg8VvevH47UVRS6+BVr
 2Nd2yz893KOEWThudXSj4OnYIYUS2hUDHTf4mtk7ue3oxIVh5xwi/F6gyzVuSfoXfYt6lUhCl
 2H6vehGjapZF9RzyQxa8HruMk+t5y2gmLzywx9eWccKIKNbYxoOuB7fHKyKWg6N9vyoNyllmU
 nCPG68/Y7UQsvCxMLKjsTyo7agx9RM7ecosgc8Ksmz40rZwXdevBQnvQntRdvQ31Rwm1kZ0+1
 LgTWu+x2mGQ8B9znczObiPy8eqeoOG+7ZR7fnu4kAxxe1djW2QTe6NhIcGq6tFUd2A+my2+5y
 YEA55+jY3garWq9ieOeFUte4QYxu+Dk583sNJUBahFC8uIyZ5EJAInC+MNo+fWum/o2nm3vuI
 JONVMxgXwWwx4AA/pGg/qgirUNehpb7SP4qKvRvogJgv+FNlZEopM00DVaJP2MhMOEJrNVQL4
 dC+qptDsorPGvHdptamab+X8Tq08dBHPWDWhww5bWb8T0J+FAlEMRHt6BC+akC1R9PV9NHy/R
 PPpWiBOvq+NjbDQs1c0dCQvPYrEV+ZQZYTp8O1HQ+3dzX2iJpCP5pUX2NE2wOazxhs5iCC9uO
 TfWEEupi30tB22kd5uK/ploNuxnORbHVteTZHWItl1JOBDTZagT/KToPIHnxPs79i0kk=
Subject: [Nouveau] NV40 under Debian
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

Hi list,

my media center PC is freshly installed with Debian 10.2 "Buster". It doesn't support Geforce 6800 GT (NV40) boards through the nvidia nor the nvidia-legacy drivers any longer. The legacy drivers worked up until Debian 9 "Stretch", but no longer.

I know that the hardware works because I can boot SystemRescueCD from CD and get a flawless desktop presentation on the attached full HD TV.

But in Debian 10, the colours are distorted. Have a look at "Nouveau.jpg" here: https://jumpshare.com/b/Se5d7xMu5tBSsR2Zcz8p
I can get the colours to work by starting the kernel with "nomodeset". Look at the same link, "NoModeSet.jpg".

SystemRescueCD (working nouveau version) uses an older kernel:
root@sysresccd /root % uname -a
Linux sysresccd 3.2.28-std300-amd64 #2 SMP Tue Aug 21 18:35:38 UTC 2012 x86_64 Intel(R) Core(TM)2 CPU 6420 @ 2.13GHz GenuineIntel GNU/Linux

Debian 10.2 (distorted colours) uses this kernel:
luker@michael:~$ uname -a
Linux michael 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 GNU/Linux

Is there a configuration setting in nouveau that causes those weird colours?
Bit order/byte order maybe?

Thanks
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
