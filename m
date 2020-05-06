Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80611C7231
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 15:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6516E880;
	Wed,  6 May 2020 13:53:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E06B6E880
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 13:53:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id k22so1974553eds.6
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RRRprd47NXuTMwbDTaoNV6BVlO9LcOxIortX2tBbYmI=;
 b=tSuI85LqDY1i4pNiAFLgiyXworUzqdLB+dkNZ94dLTP8JINASI+lK2IcDAUSbN6/5n
 h7EJBZxzrqxwvoy9wECTgC9v8aDhvcXq4Ob+dZ6BoG3vGRKZBpzwwVTMSm26os8ttt0y
 3TfqOZwBPVGsZdRi9AKCcN1DcNOF0fR/yTdBoghvJkz+xJcX0fWi3SJdKSxyZCu8rqhV
 RJ2UPgMMjcRD8ItyRdRR0xZn5sUGXEGh/FlVJYu8UD4g4gFC5BF5jbXCR2BPSfQpB32Q
 R9kCk+qLpW5TQtMBf1nKOOpyQ/EDYE5hdV5GmvTMg3XdWq44HdSrzzgvSlbZ028VMzNd
 1ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RRRprd47NXuTMwbDTaoNV6BVlO9LcOxIortX2tBbYmI=;
 b=OcL2+sj5BgDp/qnYV2IUZiXgdxxpPGxTPQoBSg+uAlyQTGjdvmaBTAZv+xOCHqJfSU
 ACB/Lr+p+qElGXvelng1lWYQbG+pTDm94KvfZBhrLmEvNZZvrGJdCyQgmqMJWmcG866Y
 XrtmrlCXHfpBPXVyuJYzlgX9TCCsDJ1W8g0KpOFzOXJZAbzJIK1fQ8vPBxjv7hqJmEs/
 oy5qyzpPyf0uQsBlgLuXs6iPX9XGMmiCpzxkbELECzLEtfY4XHgbe7nlNGL8gsbnc2FK
 R7qiqmVA7tj5293fcRUIkTg3eDcpRA1+3yDHwq1Ghfe3A0UAuoFb4aJ9ghHmC5TCBouf
 UXYA==
X-Gm-Message-State: AGi0PuaWo3Y+a/8uLujke6ck6vZGs5mS3cdVhKU77c4Pri9WWjdlwLA2
 QZN7WiiUv4jfguoYQzk/DEPmsc94MUt7t0eIoXiXLHMTqHI=
X-Google-Smtp-Source: APiQypK5HJonIeCEkTIl4EgI4FK3nb1gaKXk9DK+2PMtAyflsIxq3Kpm8T+6RE6+zT26mdq5AFAD/+mNPI1XksVMhbI=
X-Received: by 2002:a05:6402:752:: with SMTP id
 p18mr7211916edy.261.1588773232573; 
 Wed, 06 May 2020 06:53:52 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date: Wed, 6 May 2020 15:53:26 +0200
Message-ID: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
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
Content-Type: multipart/mixed; boundary="===============1848318347=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1848318347==
Content-Type: multipart/alternative; boundary="0000000000002802dd05a4fb1899"

--0000000000002802dd05a4fb1899
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi to all.
I'm experimenting with running a
https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-710-1gb-pci=
e-x-1
card on an Nvidia Jetson TX2 arm64 device.
Possible?
Linux kernel aarch64 5.6.10.
Because Nvidia did not list drivers for this architecture, I'm
experimenting with a nouveau driver.
The Jetson TX2 has a default driver for the host1x framebuffer for output
from the board via HDMI.
I changed the video kernel parameter to nouveau. Booting the system OK only
there is no output on the monitor.
The device can only be controlled via the serial console.
Can anyone advise me where to start setting up - (if something needs to be
set up)

Greeting

Milan Bu=C5=A1ka

--=20

Remember, no question is too stupid and no problem too small
       -- We've all been beginners

--0000000000002802dd05a4fb1899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi to all.<br>I&#39;m experimenting with running a <a href=
=3D"https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-710-1gb=
-pcie-x-1">https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-=
710-1gb-pcie-x-1</a> card on an Nvidia Jetson TX2 arm64 device.<br>Possible=
?<br>Linux kernel aarch64 5.6.10.<br>Because Nvidia did not list drivers fo=
r this architecture, I&#39;m experimenting with a nouveau driver.<br>The Je=
tson TX2 has a default driver for the host1x framebuffer for output from th=
e board via HDMI.<br>I changed the video kernel parameter to nouveau. Booti=
ng the system OK only there is no output on the monitor.<br>The device can =
only be controlled via the serial console.<br>Can anyone advise me where to=
 start setting up - (if something needs to be set up)<br><br>Greeting<br><b=
r>Milan Bu=C5=A1ka<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 =C2=A0 =
=C2=A0<br>Remember, no question is too stupid and no problem too small<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0-- We&#39;ve all been beginners</div></div>

--0000000000002802dd05a4fb1899--

--===============1848318347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1848318347==--
