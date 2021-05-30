Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5F3953E7
	for <lists+nouveau@lfdr.de>; Mon, 31 May 2021 04:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886036E860;
	Mon, 31 May 2021 02:30:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2DF6E147
 for <nouveau@lists.freedesktop.org>; Sun, 30 May 2021 00:23:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qq22so2654115ejb.9
 for <nouveau@lists.freedesktop.org>; Sat, 29 May 2021 17:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=giM3qu4eAM6QEU9ioJTeH0qaOJDxHpjPhqJSauGoQ0Q=;
 b=Ex4V38sT8hzRKidrNR1XyFC4m1OK/4bB+4jV21Kl2xln4tGHlA+bsJ3vLm0ZiLCni9
 hntSZ2mybiEV8JrX/WfyvAAppW6d9iHo6glOL2IoccdwNkQ8Mdf5BAZxNdYcLB/RiABj
 onxQ44T+a0YBfjgO/AAglEfCpvZISfO0UFKa0+Som5qIQTdLXkWg/bPLmdF0EOcAC0ce
 XUjNbakxuLwDkBSWLOqpJtVfbKUU4ElMzzs1I5RL/J26juwdMRSXiPzmpw4I61TJ6xrb
 zeS49SlzikRaXxCMsxa4J0Zn1sVMVIDDvZItRd2HoLQh3498o+KqCZl66unSB3f/zNSO
 S3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=giM3qu4eAM6QEU9ioJTeH0qaOJDxHpjPhqJSauGoQ0Q=;
 b=rwRqBfWopplmmjc2eyYhYoC3896g3SPLpJK31A/zlZoMytEyGnHFbI4DhrBQGtj2+B
 buBNrLgMxcVzD7QVI1BpgHVgANf2PlZMvzIb9aYQaUeHMy99ZZ8BlvHoBEeDggKH1za+
 f2K1oav2/WN950iJjhLrZ4BzenJuDvNqEx+pY1NR24f/+cCMlknfznggUJcACJcp3EgW
 UI04DJ66DoX6+t79sENYndHZa8TogqE3Zq/1wJ9l2Revc+zBdRLbfvaGG+3q3pwLi6eX
 4gkiGCKz7+7UGKbLkdfLQl1ZhUecE9YUi04ajAR4lPqClziLlaRDYWEQtE0W7o1f8K7d
 ER8w==
X-Gm-Message-State: AOAM533OtozUalo1shMpvkcJe42rGGYETWeS7NGUJVCSCELUNhOuSdum
 cc63gIiJyQ8rIVVWXNLVM8qKho98Z+YLmlTcFqlvBtT6
X-Google-Smtp-Source: ABdhPJx/MzoEd9uUXFl++Ob2O7yvk/YG0o65PMcMOqfUvGk2V7xwH4wjQtM19bWi85i8uGx5ZmHPPyTMQUZquRDJBV4=
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr15644890ejm.282.1622334214740; 
 Sat, 29 May 2021 17:23:34 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Kraemer <jkremer952@gmail.com>
Date: Sat, 29 May 2021 20:23:23 -0400
Message-ID: <CABdSSFcwzXCE9pJTRxtfuJAH542GrpGvPeOSMQ-92pD=vBgpNQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 31 May 2021 02:30:49 +0000
Subject: [Nouveau] Building a Free as in Freedom PC
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
Content-Type: multipart/mixed; boundary="===============1067245757=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1067245757==
Content-Type: multipart/alternative; boundary="000000000000939c6605c3811e64"

--000000000000939c6605c3811e64
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm sorry if this is the wrong place to ask this question. I didn't see an
answer under the FAQ, so I figured I'd send an email.

I want to build a PC that is free as in freedom. I know one can build a
tower without a hitch that meets the respects your freedom certification,
but I'm wondering if a Nvidia graphics card can be added to it with the
nouveau driver. If I use the nouveau driver, is it a totally free system?
Or does the card itself have proprietary firmware running on it? Can some
cards be free and others not, similar to how Libreboot only supports
certain hardware? If it does vary based on the card, how can I tell what
cards would be free?

Thanks in advance!

Regards,
Joseph

--000000000000939c6605c3811e64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div><br></div><div>I&#39;m sorry if=
 this is the wrong place to ask this question. I didn&#39;t see an answer u=
nder the FAQ, so I figured I&#39;d send an email. <br></div><div><br></div>=
<div>I want to build a PC that is free as in freedom. I know one can build =
a tower without a hitch that meets the respects your freedom certification,=
 but I&#39;m wondering if a Nvidia graphics card can be added to it with th=
e nouveau driver. If I use the nouveau driver, is it a totally free system?=
 Or does the card itself have proprietary firmware running on it? Can some =
cards be free and others not, similar to how Libreboot only supports certai=
n hardware? If it does vary based on the card, how can I tell what cards wo=
uld be free? <br></div><div><br></div><div>Thanks in advance! <br></div><di=
v><br></div><div>Regards,</div><div>Joseph<br></div></div>

--000000000000939c6605c3811e64--

--===============1067245757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1067245757==--
