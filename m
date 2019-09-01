Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00EA4B18
	for <lists+nouveau@lfdr.de>; Sun,  1 Sep 2019 20:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70589A6D;
	Sun,  1 Sep 2019 18:22:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F7589A6D
 for <nouveau@lists.freedesktop.org>; Sun,  1 Sep 2019 18:22:58 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f12so7411281iog.12
 for <nouveau@lists.freedesktop.org>; Sun, 01 Sep 2019 11:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9Ap8+6O+FUUlUBhOYcKO+ag16pxHzWhVlXqbX/W98BU=;
 b=LRwKmrBBGnr1jm6/vvQZW33ykQl7XRJh5aoWUO4nhjOaDwTllnUKgVq6x/G3CBBKAE
 8LFSCgy5j/FMwK0RyTK4HJ8ChsdXvYpLvTcKNYGvAwDFmeLDsXbq9wGDTIzmNFTTuxkk
 O+8B54GW3jUienvtY0TG59YpXXRS8/V3NxPAv93ckVD1DvlEmoshAIYobeaupgtOiMVI
 3oRXyNOPSeb0/eBlQaPi5dUXK1u2okkKGLVGWY4bw/Crzun2HzdP5FjTHkbO0Ic5RJv0
 CZAqW/mijHVH47RRlw+yvbyQoyYNDafpsMPpEXrkqMMJtYaRCXbsC+Gf8C12VkeNor6H
 RbCw==
X-Gm-Message-State: APjAAAUwfGjb+oXSoZ84HqReZ8yDBg2P/InO4X+UeH+BO+s5QohWenvq
 EqQRV8v2CbRiX+8bVMan3i2fCrwkSJ7t2qNiqkIPuNlrxk2K+g==
X-Google-Smtp-Source: APXvYqyLOj9HvWijsDkPo6VfENiBNdYWt35KYuacxCgiZDry7uVhJy1UQ4jOUYFBjdpTgovzfcSPyyDNpMrqoGXnQOw=
X-Received: by 2002:a5d:9c0b:: with SMTP id 11mr10635207ioe.192.1567362176983; 
 Sun, 01 Sep 2019 11:22:56 -0700 (PDT)
MIME-Version: 1.0
From: Denis Fateyev <denis@fateyev.com>
Date: Mon, 2 Sep 2019 00:22:45 +0600
Message-ID: <CADsrgyYsLqC9-D6GjAjK5HAmoEY7QnAM5rXqjBetyTPzGEAd0A@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fateyev.com; s=mail;
 h=mime-version:from:date:message-id:subject:to;
 bh=9Ap8+6O+FUUlUBhOYcKO+ag16pxHzWhVlXqbX/W98BU=;
 b=erlytRpcUDugc9aevgJ9iePhVpB/dxJH1tq/sxHybQUq/f+i9aBnRyjHvLTY84+qHM
 PD5gaUhdfGXKYs4t3E3epBZ349lHY+xi009CSsQoohfMTDTRgrWSSRyC6Hmj4UoOS02M
 O5OmWVayljSth5tuEpVoa+zYaxDnfGy6ZM32w=
Subject: [Nouveau] nvkm_pmu_reset issue with Optimus card
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0936542221=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0936542221==
Content-Type: multipart/alternative; boundary="000000000000cb3e96059181f188"

--000000000000cb3e96059181f188
Content-Type: text/plain; charset="UTF-8"

Hello there,

I have got an Asus notebook with Optimus technology support on board:

$ lspci -vnn | grep '\''[030[02]\]'
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06) (prog-if 00 [VGA controller])
01:00.0 3D controller [0302]: NVIDIA Corporation GM107M [GeForce GTX 960M]
[10de:139b] (rev ff) (prog-if ff)

My system is a fully updated Fedora 30 with the kernel version 5.2.9.
The problem is that every time when "nouveau" is activated the system hangs
shortly with multiple dumps in dmesg.
I have already reported the issue to RHBZ [1], as I have understood this is
a known issue.

Practically, I can bring it up with Bumblebee + Intel + proprietary drivers
+ acpi_osi='Windows 2009', but instead I would like to get the Intel +
Nouveau solution working.
Are there any fixes or ideas on how I could achieve that?
I could help with more testing the issue if needed.

Thanks,

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1699677

-- 
wbr, Denis.

--000000000000cb3e96059181f188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello there,</div><div><br></div><div>I have got an A=
sus notebook with Optimus technology support on board:</div><div><br></div>=
<div>$ lspci -vnn | grep &#39;\&#39;&#39;[030[02]\]&#39;<br>00:02.0 VGA com=
patible controller [0300]: Intel Corporation HD Graphics 530 [8086:191b] (r=
ev 06) (prog-if 00 [VGA controller])<br>01:00.0 3D controller [0302]: NVIDI=
A Corporation GM107M [GeForce GTX 960M] [10de:139b] (rev ff) (prog-if ff)</=
div><div><br></div><div>My system is a fully updated Fedora 30 with the ker=
nel version 5.2.9.<br></div><div>The problem is that every time when &quot;=
nouveau&quot; is activated the system hangs shortly with multiple dumps in =
dmesg.</div><div>I have already reported the issue to RHBZ [1], as I have u=
nderstood this is a known issue.</div><div><br></div><div>Practically, I ca=
n bring it up with Bumblebee + Intel + proprietary drivers + acpi_osi=3D&#3=
9;Windows 2009&#39;, but instead I would like to get the Intel=C2=A0+ Nouve=
au solution working.</div><div>Are there any fixes or ideas on how I could =
achieve that?</div><div>I could help with more testing the issue if needed.=
</div><div><br></div><div>Thanks,<br></div><div></div><div><br></div><div>[=
1] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1699677">https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D1699677</a></div><div><br>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr">wbr, Denis.<font size=3D"2"><br></font></div></div></div>=
</div>

--000000000000cb3e96059181f188--

--===============0936542221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0936542221==--
