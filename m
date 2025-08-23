Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA55CBACD6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4BB10EB95;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=proton.me header.i=@proton.me header.b="fKPtOMew";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AD210E1BE
 for <nouveau@lists.freedesktop.org>; Sat, 23 Aug 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=rl64zi2ngng6tgcaqnoh2i5lv4.protonmail; t=1755940905; x=1756200105;
 bh=ufk4SYaEWMAJDshKyM5H95NJ9GXGHLsx+dTIn2DQ8Sg=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fKPtOMewVGZ9IZfOPgEBQnYA/oU3stOD0SxyKOiQ3i9SbLC4TqGhn/GA6KRsPsqsS
 +0Ios3ldknkQzWYoQGEcmbbb5tWJ4qj9HVqrEXFVE/KXcvkRFp3MQWv7QHfW6ic3V+
 eLFHzGFk6SbCt9KFZhXR3e+KucUJhx2kep0sJGltARENoZpJdNO/P+rz1xaBMHnU0l
 qGFt7aLYE+ukCEjgwdrQLJW0WoxWKCDnjBx6rxPS5ziTbQ4m6XurvSo3ObbZWo/0v8
 hvwUaU9G0o5U7s9MKSzBqjVsF5bPV305g91EFkUYM9JSuqe+mxoTyh+drd5Eco3bcc
 iDiBltN2/vd1Q==
Date: Sat, 23 Aug 2025 09:21:37 +0000
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
From: phil995511 <phil995511@proton.me>
Subject: Nova driver and Steam launcher
Message-ID: <_trd5DnxfNxvHOp4yX2zUcOakg8tDJIRYS3arLD7MijSybPMqPyFIdKzr2U8Ii9LtMcBYQmpO_RDt7W9wIQnXCvuBRTzih-QXvk9OPf2iIA=@proton.me>
Feedback-ID: 128908939:user:proton
X-Pm-Message-ID: 50e2aab618e67218328de5493c4dcb453d686fde
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

Hello,

First of all, I wanted to thank you for your wonderful Nova driver.

I use a dual-GPU Intel and Nvidia laptop running Debian 13, Kernel 6.16, an=
d it runs wonderfully with Nova. It offers excellent performance and is ver=
y easy to use for switching GPUs.

It seems that Nvidia's proprietary driver consumes more power than Nova. An=
d I must say that under Debian, Nvidia's official solutions for switching G=
PUs have never given me satisfaction, nor has their proprietary driver. Unt=
il now, on this laptop, I only used the Intel GPU.

However, I have a small problem with the Steam launcher :

https://github.com/ValveSoftware/steam-for-linux/issues/12285

I reported a breakdown and they asked me to contact you...

Intuitively, I wonder if this isn't a 32-bit compatibility issue ?

Thank you again for your wonderful work and thank you by advance to support=
 us for resolving this small issue with Steam luncher and developers.

Best regards.

Philippe

PS I posted a message on Zulip Chat but no one is replying.




Envoy=C3=A9 avec un e-mail s=C3=A9curis=C3=A9 Proton Mail.
