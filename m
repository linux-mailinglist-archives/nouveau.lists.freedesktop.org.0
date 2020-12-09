Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA92D420A
	for <lists+nouveau@lfdr.de>; Wed,  9 Dec 2020 13:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B6C6E157;
	Wed,  9 Dec 2020 12:21:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55A6E157
 for <nouveau@lists.freedesktop.org>; Wed,  9 Dec 2020 12:21:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h19so2776363lfc.12
 for <nouveau@lists.freedesktop.org>; Wed, 09 Dec 2020 04:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3dCCvSgxmOGa82J7wWr4YFZYRmNswVFwDvqF8QokjoY=;
 b=LBu4DuG3twRTiRz4jaWmdSq88BdB6aVJVuB6L+691MR1GJ7IKY3rWXRevneHv1pAls
 GiZyNuXtHxeWhVFg1FeFwgj/nzp9bdGJGl0aQL9YJeFH9jIntP1JoE0jqtkoDqeMk++n
 luewQYzty1MA/ERbA1PchLaIPHdF6oP2G18y+RXxVyKHyJn9OJyvwLDI8z7qullZGSEC
 RCKVOaJJfKr/tnlMHQVVnhEeti3LUqbHUHKpWps8d6Gp+fs7BWKKzh+SzanTHk0fAikO
 S3vQ7LF06dyLpm0TH9Kc82d/+SGSTdqTencFteGRLldPyehnc8LD59osOdBJwEsf1LRp
 ncCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3dCCvSgxmOGa82J7wWr4YFZYRmNswVFwDvqF8QokjoY=;
 b=UmBqyEHYF0NjDdZZeFzmYv8MX3eiTRED3Qlpb7lxtSrCS8wRh5UEq03z9DVGtjMwCm
 kghRxoDyjTcXDdICjy79meBQ1W46QWFK7xF+jMBF8L6R9IQlWpZFePhZWFTWVHW+rX0j
 jWzi5VAgbMg6tEQA/hNzLzR3lFYL3X3m7vfqjjL8Uf/CC/u9LzwmS+LEYami59AZUmEu
 T3YV4gZQ2J1yjXKnffQvLU5JNOJqJMsU1C2+vYgb2mcS8YUeqasBMMLxTFncvXxvK7dn
 vNSb8g/VWgsKWJst41eii8QRqBpZYFcuZ6WrxUiNJP5x9Mp+YhK0WdosbIdq1x5IdLL8
 IvVg==
X-Gm-Message-State: AOAM531J1hPDioYX81Ml3QxFnCE8smda4xUg2gg8/vpCXx7a7Qly2HRc
 0mZLl7mEbPnwAQlvzRbLIP+epWezVggDYQo8plxG4RsxbNgBBXM3
X-Google-Smtp-Source: ABdhPJwDC+N99EuDueYUwhpoJDgSMqFXNbGl98sVUWvWbnV6pvZKUR4rHRNeSGws0Fx+uz8dCUs2/j5R/6P4k9sLjgg=
X-Received: by 2002:a19:814c:: with SMTP id c73mr359830lfd.638.1607516464417; 
 Wed, 09 Dec 2020 04:21:04 -0800 (PST)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 9 Dec 2020 13:20:26 +0100
Message-ID: <CA+1FSihnkp5XFvYd+8jANfKor=nPXTq2n9fqsGF_1aRnxf81iw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] [ 0.772389] nouveau 0000:1b:00.0: fifo: fault 01
 [VIRT_WRITE] at 00000000000bd000 engine c0 [BAR2] client 08
 [HUB/HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1 [02bfedf000
 unknown]
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
Content-Type: multipart/mixed; boundary="===============1264185503=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1264185503==
Content-Type: multipart/alternative; boundary="000000000000d510d105b607176f"

--000000000000d510d105b607176f
Content-Type: text/plain; charset="UTF-8"

 Hello.

I'm trying to enable the nouveau driver in the linux os virtualized with
esxi 7,but I see a BUG like this :

BUG: unable to handle page fault for address:

ffffba5000d00000 when it tries to do:

[    0.772389] nouveau 0000:1b:00.0: fifo: fault 01 [VIRT_WRITE] at
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
0d [REGION_VIOLATION] on channel -1 [02bfedf000 unknown]

how to fix it ? thanks.

NB : my graphic card is the nvidia 2080 ti. I have passed it through to the
ARCH linux os

-- 
Mario.

--000000000000d510d105b607176f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">
<div><div>Hello.</div><div><br></div><div>I&#39;m trying to enable the nouv=
eau driver in the linux os virtualized with esxi 7,but I see a BUG like thi=
s :<br></div><div><br></div><div>BUG: unable to handle page fault for addre=
ss:</div><div><br>
</div><div>ffffba5000d00000 when it tries to do:</div><div><br>
</div><div>[=C2=A0 =C2=A0 0.772389] nouveau 0000:1b:00.0: fifo: fault 01 [V=
IRT_WRITE] at<span></span></div><div><span></span></div><span>
00000000000bd000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason<br>
0d [REGION_VIOLATION] on channel -1 [02bfedf000 unknown]<br>
</span>

<br clear=3D"all"></div><div>how to fix it ? thanks.</div><div><br></div><d=
iv>NB : my graphic card is the nvidia 2080 ti. I have passed it through to =
the ARCH linux os<font color=3D"#888888"><br></font></div>

<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></div></div=
></div>

--000000000000d510d105b607176f--

--===============1264185503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1264185503==--
