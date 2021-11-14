Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C922B44FCD3
	for <lists+nouveau@lfdr.de>; Mon, 15 Nov 2021 02:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EBE89BAF;
	Mon, 15 Nov 2021 01:51:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747DD89FEC
 for <nouveau@lists.freedesktop.org>; Sun, 14 Nov 2021 21:29:11 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id t11so31122372ljh.6
 for <nouveau@lists.freedesktop.org>; Sun, 14 Nov 2021 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7Ekd4txhZzPHGTw+v3fkoFFNw7YeesibMv0l+7p7JK0=;
 b=mSAQohKVEZrLBAWcKhvxkNlLjZPd8iK+0Kj9Qt0Vf9E+JmwJ1zrPKaNcr06UuHluK8
 9VQEz/MxZy1/prWHRqTIvluQ93tVGd0SAEJfNFSqflNdcTSzAb5joZ8h97ACHbTW67vG
 Xpfgy0dkQGNigwGav2iPCz2UZXmwkUlHAWCNHJlkWsq82ilxKovKzgNbDq0R8p4oG6h7
 8O9JjItlPLtvRGoA6QaoOs4AahadITlm2rDDcKyxa8pJD0XO7b9ZhZ0FTNBQUVaN8myO
 aES0JwtOzRB8gRitjBGT5Gqqt0T2aYxkbMt7M/PmzJylHsnBvqT+rEtJwq8hBbcriY1J
 RVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7Ekd4txhZzPHGTw+v3fkoFFNw7YeesibMv0l+7p7JK0=;
 b=0eKtfpFNn3Nc50FMioH8z3iM/SMiSHmrhmll2VvySNPQHdS4cuT7vALd5CSKx5nEGO
 uQC/Vw1Ixoi0TadX31qwIwmIlqYM00lYWndqqvDCL8THwR+wZnRi1F/OgX5nSg4UCvcL
 vCgmmiB6p4lNXKDUEdKPfi5cmOuvUo170REzvA7inviyR+2KsfK9c2ejuVT5boplJg2R
 Qdo6qv6pZ03jVWD35TGD+Sx9O9xqvJowPaOMkOYUWhiEqUCl8sO9Hxqpwlfu5VHPUAWE
 BWbbL7wqVZ1OwkFt0HXUuEZAoncZuNCIb8UYJSFQgEM8EmOjBHRx9BwDs4xx9t18UEIK
 EoCA==
X-Gm-Message-State: AOAM532wnl6NstBAvcbtu3E90SgijFAHAneiO9bWmonJ7xMH2MgVwRqs
 d4OUh24uNTYOyyer8djb+svgsxsyqrjCu7utXkg=
X-Google-Smtp-Source: ABdhPJySNH2bJGrlT2wg7i6f0QkVa3wUo+aS9hqpsFEnabBhVkZTn+acD0Nub2rA9EX+yIsOma1DtyFtBbC5U8a7yGQ=
X-Received: by 2002:a2e:3513:: with SMTP id z19mr33659856ljz.406.1636925349831; 
 Sun, 14 Nov 2021 13:29:09 -0800 (PST)
MIME-Version: 1.0
From: __- -__ <isapgswell@gmail.com>
Date: Sun, 14 Nov 2021 18:28:51 -0300
Message-ID: <CAN9WMdNtFitxZGADFB4Bp_TTwgzHuj5D6Jta_i7JyU1pACfFrQ@mail.gmail.com>
To: debian-boot@lists.debian.org, 
 Dell Tech Support <technical_support@dell.com>, 
 Dell Tech Support <technical_support@help.dell.com>,
 ubuntu-users@lists.ubuntu.com, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000000027c905d0c6628f"
X-Mailman-Approved-At: Mon, 15 Nov 2021 01:51:52 +0000
Subject: [Nouveau] nvidia-0 dGPU (igpu disabled on bios)
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

--0000000000000027c905d0c6628f
Content-Type: text/plain; charset="UTF-8"

hi,

i would like to share my dedicated proprietary nvidia driver conf files

/usr/share/X11/xorg.conf.d/nvidia-drm-outputclass.conf

Section "OutputClass"
   Identifier       "nvidia"
   MatchDriver  "nvidia-drm"
   Driver            "nvidia"
EndSection

Section "InputClass"
    Identifier          "nvidia"
    MatchDriver    "nvidia-modeset"
    Driver              "nvidia"
EndSection

running on debian 11 codename bullseye

aTI,

L. F

--0000000000000027c905d0c6628f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>hi,</div><div><br><=
/div><div>i would like to share my dedicated proprietary nvidia driver conf=
 files</div><div><br></div><div>/usr/share/X11/xorg.conf.d/nvidia-drm-outpu=
tclass.conf</div><div><br></div><div>Section &quot;OutputClass&quot;<br>=C2=
=A0 =C2=A0Identifier =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;nvidia&quot;<br>=
=C2=A0 =C2=A0MatchDriver=C2=A0 &quot;nvidia-drm&quot;<br>=C2=A0 =C2=A0Drive=
r =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;nvidia&quot;<br>=
EndSection</div><div><br></div>Section &quot;InputClass&quot;<br>=C2=A0 =C2=
=A0 Identifier =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;nvidia&quo=
t;<br>=C2=A0 =C2=A0 MatchDriver =C2=A0=C2=A0 &quot;nvidia-modeset&quot;<br>=
=C2=A0 =C2=A0 Driver =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;nvidia&quot;<br>EndSection</div><div dir=3D"ltr"><br></div><div>r=
unning on debian 11 codename bullseye</div><div><br></div><div>aTI,</div><d=
iv><br></div><div>L. F<br></div><div dir=3D"ltr"><div><br></div><div><br></=
div><div><br></div><div><br></div><div><br></div><div><br></div><div><br></=
div></div></div></div>

--0000000000000027c905d0c6628f--
