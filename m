Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37351F854B
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB1C6E480;
	Sat, 13 Jun 2020 20:54:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at gabe;
 Wed, 20 May 2020 01:59:20 UTC
Received: from mx-out2.startmail.com (mx-out2.startmail.com [145.131.90.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5E6E0DA
 for <nouveau@lists.freedesktop.org>; Wed, 20 May 2020 01:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
 s=2017-11; t=1589939467;
 bh=i042Eu2d31tsnAjIDnGJsHHmtDQL+U6raCpFF6kX6dc=;
 h=Subject:Date:From:To:From;
 b=rHwJ7pUTBjmXVZFOOW82/QXX70IbnaCGqYZ9HiU7iLbqf7JG+x3nrBoKXQkAvGZE4
 BzNmOgCCjvxGkYNyIwy1B0RXeQ6rL/jMF2uPJ1PljGxriDY0embUXci4BHqN1FslZw
 CL5BP0Kf2tlLydT8qDc+UwBYx6rvQX1QQPli14XxrbB5puLXNayjBAWKw16mCQIJuF
 6Mmwy+S7e3O0pn15aN4jkdmQeIXCjxpJVRr/01zOoxdjB7qXjzV+GpQPKEtLfcY9n7
 9MgqHV2NdvPdqfA2L/ytMegcM/6AfvGAVPeEiReeJNOr8VXxNzSPQ5d8ejkTpqd6Zp
 JjJKRvflaFWrw==
Message-ID: <158993946542.4232.12924043659080940202@startmail.com>
Date: Wed, 20 May 2020 01:51:06 -0000
From: Rosh <roshyxt@startmail.com>
To: nouveau@lists.freedesktop.org
MIME-Version: 1.0
Autocrypt: addr=roshyxt@startmail.com; keydata=
 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
 9+U8+r3E93lofC3bg8hTSeYs
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: [Nouveau] nouveau-for-ReactOS
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
Content-Type: multipart/mixed; boundary="===============0368936360=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0368936360==
Content-Type: multipart/alternative;
 boundary="===============6808337685398847336=="

--===============6808337685398847336==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To nouveau developers, =20

 =20

I am writting to know if you are interesting in developing a Windows XP=
/Server
2003 (for using in ReactOS), cause I only see that GNU/Linux as target =
and not
other OSS OSes like Haiku OS, ReactOS. =20

ReactOS is an effort to do a Windows like OS (for the moment NT 5.2 ker=
nel
like Windows XP and Server 2003) open, an OSS Windows. =20

 =20

Haiku OS is an independent OS. =20

 =20

Is it possible to you to port GNU/Linux edition to a native Win32 editi=
on? =20

 =20

 =20

I am a GNU/Linux user with an nvidia cards and nouveau is my favorite d=
river.
I don=C2=B4t use the propietary driver. =20

 =20

 =20

I hope to hear from you as soon as possible,} =20

Regards, Rosh =20

 =20

 =20

This email has been sent with a [free StartMail
account](https://www.startmail.com/en/)! =20

StartMail makes private and encrypted email easy. [Try it here for
free](https://www.startmail.com/en/)! =20

 =20


--===============6808337685398847336==
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: break-wor=
d; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92); font-f=
amily: arial, helvetica; font-size: medium;">To nouveau developers,<br =
/></p><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: bre=
ak-word; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92); =
font-family: arial, helvetica; font-size: medium;"><br /></p><p xmlns=
=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: break-word; overf=
low-wrap: break-word; margin: 0; color: rgb(59, 67, 92); font-family: a=
rial, helvetica; font-size: medium;">I am writting to know if you are i=
nteresting in developing a Windows XP/Server 2003 (for using in ReactOS=
), cause I only see that GNU/Linux as target and not other OSS OSes lik=
e Haiku OS, ReactOS.<br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml"=
 style=3D"word-wrap: break-word; overflow-wrap: break-word; margin: 0; =
color: rgb(59, 67, 92); font-family: arial, helvetica; font-size: mediu=
m;">ReactOS is an effort to do a Windows like OS (for the moment NT 5.2=
 kernel like Windows XP and Server 2003) open, an OSS Windows.<br /></p=
><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: break-wo=
rd; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92); font-=
family: arial, helvetica; font-size: medium;"><br /></p><p xmlns=3D"htt=
p://www.w3.org/1999/xhtml" style=3D"word-wrap: break-word; overflow-wra=
p: break-word; margin: 0; color: rgb(59, 67, 92); font-family: arial, h=
elvetica; font-size: medium;">Haiku OS is an independent OS.<br /></p><=
p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: break-word=
; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92); font-fa=
mily: arial, helvetica; font-size: medium;"><br /></p><p xmlns=3D"http:=
//www.w3.org/1999/xhtml" style=3D"word-wrap: break-word; overflow-wrap:=
 break-word; margin: 0; color: rgb(59, 67, 92); font-family: arial, hel=
vetica; font-size: medium;">Is it possible to you to port GNU/Linux edi=
tion to a native Win32 edition?<br /></p><p xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"word-wrap: break-word; overflow-wrap: break-word; =
margin: 0; color: rgb(59, 67, 92); font-family: arial, helvetica; font-=
size: medium;"><br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml" styl=
e=3D"word-wrap: break-word; overflow-wrap: break-word; margin: 0; color=
: rgb(59, 67, 92); font-family: arial, helvetica; font-size: medium;"><=
br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: =
break-word; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92=
); font-family: arial, helvetica; font-size: medium;">I am a GNU/Linux =
user with an nvidia cards and nouveau is my favorite driver. I don=C2=
=B4t use the propietary driver.<br /></p><p xmlns=3D"http://www.w3.org/=
1999/xhtml" style=3D"word-wrap: break-word; overflow-wrap: break-word; =
margin: 0; color: rgb(59, 67, 92); font-family: arial, helvetica; font-=
size: medium;"><br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml" styl=
e=3D"word-wrap: break-word; overflow-wrap: break-word; margin: 0; color=
: rgb(59, 67, 92); font-family: arial, helvetica; font-size: medium;"><=
br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"word-wrap: =
break-word; overflow-wrap: break-word; margin: 0; color: rgb(59, 67, 92=
); font-family: arial, helvetica; font-size: medium;">I hope to hear fr=
om you as soon as possible,}<br /></p><p xmlns=3D"http://www.w3.org/199=
9/xhtml" style=3D"word-wrap: break-word; overflow-wrap: break-word; mar=
gin: 0; color: rgb(59, 67, 92); font-family: arial, helvetica; font-siz=
e: medium;">Regards, Rosh<br /></p><p xmlns=3D"http://www.w3.org/1999/x=
html" style=3D"word-wrap: break-word; overflow-wrap: break-word; margin=
: 0; color: rgb(59, 67, 92); font-family: arial, helvetica; font-size: =
medium;"><br /></p><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"w=
ord-wrap: break-word; overflow-wrap: break-word; margin: 0; color: rgb(=
59, 67, 92); font-family: arial, helvetica; font-size: medium;"><br /><=
/p><p xmlns=3D"http://www.w3.org/1999/xhtml" style=3D"overflow-wrap: br=
eak-word; margin: 0px; color: rgb(59, 67, 92); font-family: arial, helv=
etica; font-size: medium;"></p><p xmlns=3D"http://www.w3.org/1999/xhtml=
" style=3D"word-wrap: break-word; overflow-wrap: break-word; margin: 0;=
 color: rgb(59, 67, 92); font-family: arial, helvetica; font-size: medi=
um;">This email has been sent with a <a href=3D"https://www.startmail.c=
om/en/">free StartMail account</a>!<br /></p><p xmlns=3D"http://www.w3.=
org/1999/xhtml" style=3D"word-wrap: break-word; overflow-wrap: break-wo=
rd; margin: 0; color: rgb(59, 67, 92); font-family: arial, helvetica; f=
ont-size: medium;">StartMail makes private and encrypted email easy. <a=
 href=3D"https://www.startmail.com/en/">Try it here for free</a>!<br />=
</p><p xmlns=3D"http://www.w3.org/1999/xhtml"></p><p xmlns=3D"http://ww=
w.w3.org/1999/xhtml" style=3D"word-wrap: break-word; overflow-wrap: bre=
ak-word; margin: 0; color: rgb(59, 67, 92); font-family: arial, helveti=
ca; font-size: medium;"><br /></p>

--===============6808337685398847336==--

--===============0368936360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0368936360==--
