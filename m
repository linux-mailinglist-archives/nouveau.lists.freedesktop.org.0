Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29AA12B291
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7598982A;
	Fri, 27 Dec 2019 08:12:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29796E1F7
 for <nouveau@lists.freedesktop.org>; Mon, 11 Nov 2019 13:18:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id v8so9803637lfa.12
 for <nouveau@lists.freedesktop.org>; Mon, 11 Nov 2019 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8q/CIo3NGCDogRfvK6uagV7vVPGXIqDLYmN4j1MM0nc=;
 b=Qt15PDq3Q+dUt1Zt9DfOI2h7GTh/5oqzrOX+mY2eSTCyVb2gXzlb6F/8HICc3xM0Q+
 ZNaBYCWozZzcSGE4nOY0gjXWtCbsluGEDXYnzQVedMG2xDI+kx/3s0BC95v3wzMlSLyP
 5WIjHM6OhxDczMymwlJH4mKVhY5fuTEBXuDVHC1hFWscmWr6mrWb9EEyHWxJrVLnQJGX
 UpC/Lv6fK8IB2pWQOBCmJXyFyoP7GrAyAx16mOjWEGONR22srqFXzCYuoCUNU2kqa+39
 jM1dXrh+iSHoQ1BCKuixt1TirYHsuoCf+9EjZiC5AeeZsxKLdYqQsXCNWywEWUyEBDm0
 0Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8q/CIo3NGCDogRfvK6uagV7vVPGXIqDLYmN4j1MM0nc=;
 b=lMShqkjTi1oh+m4zcn0WjUMFDlf+Gz2KhLFc101ZwSPsNMP2S4kfyvbuZr3AwhEkbn
 Llwkw5uwolNKbwvL6fVtPdNvCcPPXzXsqWoptRvTR6pq86KcotlopjwcEHyDSJ0zAHOp
 dGtwdHq500D5N443mpy1Hy/nX+HNO0OmSxZRvJGefpCPg2VfhTNniaZ5bPZIuwgtZD+c
 E7FQrKpByl1uPCDJYhKCTD/kvgnZZuLB1VG9IdxK+9FWOnVoMWUy+SA5MWQpdqKlBVkH
 bQKWIkD4ZnC4UZ/Dtr6vhZNW1D5opQQmef4pILz8qwLCEE+Odh7a41XSV9p2wddeUWbG
 hdOQ==
X-Gm-Message-State: APjAAAUCaBfJ/6PMyC1eLYhHaU4Y6m6C3PQ3dkaAAWWbafLqKXtRxO1z
 s3UjAof6fZ6iNkudwrRjPFaiTZYicJiOAmLfY2f4Fw==
X-Google-Smtp-Source: APXvYqyOzYoRrNZ8Hzy+Rle2Ish6gvHKpofk0ANnbHWndUXkWgs38dS2JT6MT3ZlMcsPZ/JeTA+fZ7eGvL+G6PEhxLM=
X-Received: by 2002:a19:500d:: with SMTP id e13mr15300882lfb.85.1573478327163; 
 Mon, 11 Nov 2019 05:18:47 -0800 (PST)
MIME-Version: 1.0
From: Jerry Sanders <dragonspark30@gmail.com>
Date: Mon, 11 Nov 2019 15:18:35 +0200
Message-ID: <CAPm7QYwHte2HzRWGS--BLGvh8aT8EFnc=145KgChFOVuKR5DOg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:12:58 +0000
Subject: [Nouveau] Support for older GPU
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
Content-Type: multipart/mixed; boundary="===============0726125670=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0726125670==
Content-Type: multipart/alternative; boundary="000000000000c09d2b059711f8db"

--000000000000c09d2b059711f8db
Content-Type: text/plain; charset="UTF-8"

Hello, Name's Jerry. I have GeForce 8500 GT on my computer and I found out
that Nvidia does not support my GPU anymore for linux. I wanted to ask you
several questions.
1. Will your team support  drivers for old GPUs  on new Linux distros?
2. How can I make a driver work on a kernel that is not meant to work on?
3. Can I somehow solve this problem without updating my card, which i can't
do due to lack or cash.

--000000000000c09d2b059711f8db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello, Name&#39;s Jerry. I have GeForce 850=
0 GT on my computer and I found out that Nvidia does not support my GPU any=
more for linux. I wanted to ask you several questions.<br></div>1. Will you=
r team support=C2=A0 drivers for old GPUs=C2=A0 on new Linux distros?<br></=
div>2. How can I make a driver work on a kernel that is not meant to work o=
n?<br></div>3. Can I somehow solve this problem without updating my card, w=
hich i can&#39;t do due to lack or cash.<br><br></div>

--000000000000c09d2b059711f8db--

--===============0726125670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0726125670==--
