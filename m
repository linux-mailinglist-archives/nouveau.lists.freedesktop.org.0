Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC4A050FE
	for <lists+nouveau@lfdr.de>; Wed,  8 Jan 2025 03:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9810E879;
	Wed,  8 Jan 2025 02:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meddatainc.com header.i=agents@meddatainc.com header.b="S8bnrOBk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E274C10E879
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2025 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meddatainc.com;
 s=s1-ionos; t=1736304463; x=1736909263; i=agents@meddatainc.com;
 bh=SfrE6ecKGDTdMmorbjKZX6TK1yeYaunHbUwN8QEUC1U=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Subject:To:From:Message-ID:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=S8bnrOBk49+fTwFHa6VrGVurzlzZdm2sMoGeqpHvKVJntXLD4y6fQzDCt2sJnkNj
 hWnbz68Hha+M8hD73NjcF2SGQ8xY+EWW4+vWaXbF2TANi0Jf5ty1zW9NE2nFYEhqW
 LkaToHj8ZYzGNMJl3bTgpmzTNDRAAE2IL383ENOTUQkwWOBRLi61gFN7IKm5ysiZ3
 E3H2zol58NoDgQgSZcbbeSMceaIldelPze9DIQ3wf+VFWZdLRzgZOLFI5fQVgnyGe
 420JH/TYnFlyouWEoDdcvU09ri22vv/I6kJCn1Z4ylX3FnTm80Zy3OrMUUG6xtJxd
 8hiAgHKHcXzpSFHRKA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from android-8f7cdbbc6da3bf42 ([71.162.171.44]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MRnL4-1t3D763pqU-00Xab1 for <nouveau@lists.freedesktop.org>; Wed, 08 Jan
 2025 03:47:43 +0100
Date: Tue, 07 Jan 2025 21:47:08 -0500
User-Agent: K-9 Mail for Android
In-Reply-To: <FB715A66-7911-42DB-AC1D-6CB5002967FF@meddatainc.com>
References: <02ED58A8-2A5D-4FF3-AC3A-AC14077F5F7F@meddatainc.com>
 <FB715A66-7911-42DB-AC1D-6CB5002967FF@meddatainc.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Laptop, nouveau and external monitor
To: Nouveau Mailing List <nouveau@lists.freedesktop.org>
From: H <agents@meddatainc.com>
Message-ID: <78952F29-4D4A-424F-9493-4710EAB44A1E@meddatainc.com>
X-Provags-ID: V03:K1:dnxyryHRayT86PrWJqYF93ZldJkTR9SSKu+5u5zs9r6IiwjggAe
 4ZqumwI8wnHgY/thB1yEIT7tg7Q1gunE2ua5mPSIIYE2Tq5yFacGHr5xNlHe1lWLihCTKp7
 qZuAfNq9BFqM6xHaa1Tc2AGaHEt3hPdMTH8AZwlo8pLHfOaFXyWtYTRZtpZSQwZOfFW0B42
 UpdNyl4Y1nR7k9jiAl/dA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FJ5jluh+rX0=;Dh9h2aI1nRTMkJ0/33BgfAY4VB1
 BTe6aT/0T5O+OIbI/bG6iNnRojtQ/WDAfcM3u7tPfkX4MysnI5xhLIdR6TP5NezA4QQljfHNi
 ICFv77cDWQB+T54on9yha4tkhqwOgCU+NOSI4+tA/xU6m3SWEUW2+JY5rGiYxR+f0n9xXYBM8
 thnqVr4cPy4seOEQvFjE/NNigS+ahBxdJvXvswT+Z5DDwLpkVoiNHJpfbzGU/jqxILz04CjXQ
 h2G3CFfO0ENJ6WIoD1FP1okBwi6Fc8Df282sQrPKLyDILc4QhmZf3Iw0E7Ml8X0ZESTcw1+EZ
 WWtDsU2xuX+0xctMEGFnKHpu7qSytGN7UFMOTJS1aFXoz9U1QjiekvWXe8Xdu2fwp3y+G12Yf
 uUpsgaj/VvGOdMacfnGaz/bIwc82zgs5LmIDCv5u6ll1C1LALslhmSQor2UXD7TojOQLnjzNr
 mzZ+tiKdXusXNJJwZb6OvPtMUuYSoI8jyeI5ITdXE7DO2MOkihyia4jJD8t4G2xM7hA0xsHoN
 58CJTD9I3gV3aquzW+3sZLFCnfe9nbMi6OIrFkNkaL5wXpyznsZaeNjd6vBKj3MQtXVed8bBJ
 7nnElMrujXtCVOdhOiU1SAgfIqlhZzBf5I6LcHbrTHgtaU6IOHVdbbBGu6SkAKlEwMx2U4r8y
 hAgeux9MoffYYUYXjKJilN912iZJ/l7u7RQGEO7QzTn5U3dz2MkJPCGUgpgRjxkdKWS6CUSf4
 OD7NmCJZTPEjMEBv4sOOV3e07xqXwNsSyhDHqDRlXs92eI8ip0YxJzVRhS5bhMyfQqgaYxRMq
 pO7/wPugHPs7ObT/LF62jbPIcdqjcpypcpgY/ahKcY2GkKfowQywS0Qaig0H2QllMPgHYuudf
 XvT9SuRB0RGBOctM/wG+vI8IKYA+PQIsgt8mcdcq6Bih9uS9fjK0WikZTi36qkC9VoOa4GA0e
 2WK7e14mNzkPXFBxoFBlfcZusU5XzybCGKiKuNRYQWnxEdjHkTrWov7XxBcqRoUFvmzkQfTUg
 JGPdBfPljmn5HHz6nc/4U3msNE54MtaGedaaLpp
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On January 2, 2025 7:51:18 PM GMT-05:00, H <agents@meddatainc=2Ecom> wrote:
>On January 1, 2025 9:51:30 PM EST, H <agents@meddatainc=2Ecom> wrote:
>>Running the latest version of Rocky Linux 9 fully updated and Mate on
>a
>>Dell Inspiron 7570 laptop with a UHD display, i=2Ee=2E 3840 x 2160 pixel=
s=2E
>>I would like to attach two external monitors and initially
>experimented
>>with a Dell dock model 3100 and the latest version of the DisplayLink
>>and evdi drivers=2E However, although the Mate display applet shows the
>>correct resolution for the laptop display itself and for the external
>>monitor which is running at 1920 x 1080 pixels, the resolution on the
>>second, external display is more like 640 x 480 pixels=2E
>>
>>While I initially thought this was due to a bug in the
>DisplayLink/evdi
>>drivers, I see the same issue when I connect the monitor directly to
>>the HDMI output on the laptop itself, ie=2E DisplayLink/evdi are
>>presumably not involved although they are installed, nor is the dock
>of
>>course=2E
>>
>>I just discovered running xrandr --listmonitors that, while the
>>internal laptop monitor is labeled eDP-1, xrandr identifies the
>>external monitor as using DP-1 although it uses the laptop
>>HDMI-connector=2E Further, while mate hardware display monitor also
>>identifies it as using DP-1 - possibly based on xrandr output - the
>>monitor itself tells me it is connected using its HDMI1 connector=2E
>>xrandr does report the correct display resolution, though=2E
>>
>>Thus, it looks like xrandr/nouveau misreads the configuration feeding
>>it to mate=2E I just updated the laptop BIOS to the very latest version
>>and saw no difference=2E
>>
>>I am using an HDMI-HDMI cable with no adapters=2E I have tried both
>>booting with the external monitor already attached and
>>attaching/reattaching it later=2E The monitor is an Acer S230HL monitor=
=2E
>>
>>I am using the nouveau driver and inxi reports the presence of both
>>Intel UHD Graphics 620 and Nvidia GM108M (GeForce 940MX)=2E
>>
>>The kernel is:
>>Linux 5=2E14=2E0-503=2E15=2E1=2Eel9_5=2Ex86_64 #1 SMP PREEMPT_DYNAMIC Tu=
e Nov 26
>>17:24:29 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
>>
>>Could this be an nouveau bug (I am running X11 and not Wayland)? How
>>should I troubleshoot it?
>>
>>Appreciate ideas!
>
>The problem could lie with x or with the video driver, the latter
>reporting to X=2E According to X=2Eorg=2Elog I am running X Server 1=2E20=
=2E11=2E
>
>One of my concerns is why X reports that DP-1 connection is used with
>the external monitor whereas it in reality uses HDMI without any
>adapters=2E That suggests something is reported incorrectly which could
>conceivably lead to some other problem=2E
>
>I am attaching X=2Eorg=2Elog which to me seems to suggest that it is usin=
g
>the noveau driver=2E Note that I just tried to disconnect/reconnect the
>external monitor but could not find any log of that connection towards
>the end of the log

Any suggestions as to how I could find the cause of this bug?
