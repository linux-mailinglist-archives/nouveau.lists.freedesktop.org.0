Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7632B695
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 11:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54676E0A2;
	Wed,  3 Mar 2021 10:30:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC46E0A2
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ym+Txv+Bl/IPCRqGg2FvGPimUl3kJUZQk3rPkj1yCpc=;
 b=fyArrvw36s6y+WT0FYdMtpPA1Fth4WYGF2YPEw9Co84/JwCQG0gHO2DxG87pH7gCrPzVYY
 etizpEeNRSIFoONlf57mJfbFJoGisp1aDjXrQrMvDn5SD5XiavtS22A7NKzU4WLORz4q+4
 KEuxVSFX0eGUdPANllQJ8VwNHkr0o+4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-EULOdwzpPNWsp6XW5mtFYA-1; Wed, 03 Mar 2021 05:30:38 -0500
X-MC-Unique: EULOdwzpPNWsp6XW5mtFYA-1
Received: by mail-wm1-f71.google.com with SMTP id s192so2741945wme.6
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 02:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ym+Txv+Bl/IPCRqGg2FvGPimUl3kJUZQk3rPkj1yCpc=;
 b=VrxJUxHI5Z3csV6wwQJ7FMmjKH2b85K0rV7sxDHJaDD0oOST3VGdKZAVyKF9b23j94
 ROWwtj0cD+UMNBcNBwEaKhyO69U+tx/9WtgaPUKThqVlorqpaafiKbuOo9NJc5Ulu/Wu
 097Lt5Y5plq4nc7/gMWeymESLXpH163DiTF0JcMN9nup0sQrauv1Re2Dq4aMhl0BG+F1
 5LEL+VRz0tehhzs08J2oMcJuXayk2MpmlMfqyhope/rHlLnoPpS1mS+zRO5gx/JTDRue
 xbWbZo9Kz08wowQ2rcabwx5isba3zCe//5ij0RnA6uhfoF2ECbepTMMdovkCMh8wGUsI
 KOkw==
X-Gm-Message-State: AOAM532sS4UBumEb8u6c47CJJhKycRgMuCbaeX/Mqyic7W4aAe5k5SBw
 1yZBG7b+wxhksY6iuR76fwP5/uAAicFqf+ik203OB7qbvfDs6b6kEVgLIeyVZdB3qEbMG7/5MzJ
 EHJ9F8fp0obmq4bG35wFL6R+p1JiIkl28CXfDJcBKgg==
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr8459716wml.1.1614767436932; 
 Wed, 03 Mar 2021 02:30:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVh24hI67ERYtPDAUSoanvNdA9VjpNCktTsgDKczZ6mBxuiEvPSg5p3j9siSc74WoHVrQmV5XAlQDTEOkl8VY=
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr8459700wml.1.1614767436738; 
 Wed, 03 Mar 2021 02:30:36 -0800 (PST)
MIME-Version: 1.0
References: <69E2E06B-90B1-45A6-AC51-144F0DBE7D7E@hotmail.fr>
In-Reply-To: <69E2E06B-90B1-45A6-AC51-144F0DBE7D7E@hotmail.fr>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 3 Mar 2021 11:30:26 +0100
Message-ID: <CACO55tta_jVwHAr3zgE38yJbTUHjcMEmx4kY6cSiRqK8GLe9pQ@mail.gmail.com>
To: Tomek LECOCQ <tomek.lecocq@hotmail.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] How to reverse engineer a PCI-Express driver under
 Linux ?
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2052166769=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============2052166769==
Content-Type: multipart/alternative; boundary="00000000000076428d05bc9f57b8"

--00000000000076428d05bc9f57b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 11:07 AM Tomek LECOCQ <tomek.lecocq@hotmail.fr>
wrote:

> Hello,
>
> I=E2=80=99ve already asked this on the Kernel Newbies mail list, but as d=
eveloping
> nouveau seems to be kind of similar to what I want to achieve, I thought =
it
> would be a good idea to ask it here as well.
>
> I have a PCI-Express video capture card that has a proprietary driver for
> Linux.
> I have some experience with programming in C, and so I would like to star=
t
> a hobby project to develop a free/libre driver for this device for Linux.
> Of course I don=E2=80=99t have access to any documentation about how to
> communicate with this device (I=E2=80=99ve tried to contact the company m=
aking
> these, but my hopes are not high), so I think I will need to
> reverse-engineer the way the existing driver communicates with the
> hardware. How could I achieve this ?
>
>
Usually drivers map PCIe bars into the VM and read/write at certain offsets
to do.. stuff. In the linux kernel we have the mmiotrace tracer in order to
capture what a driver does with the hardware. You still need to interpret
the trace file, but at least this should give you the raw data on what's
going on. Hope that helps.


> Also, the long term goal of this project would be to have this driver
> merged into mainline, so what is allowed or not while doing this to avoid
> problematic legal ramifications ?
> Thank you for your help.
>
Best regards.
> Tomek Lecocq
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--00000000000076428d05bc9f57b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif"><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 3, 2021 at 11:07 AM Tomek =
LECOCQ &lt;<a href=3D"mailto:tomek.lecocq@hotmail.fr">tomek.lecocq@hotmail.=
fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello,<br>
<br>
I=E2=80=99ve already asked this on the Kernel Newbies mail list, but as dev=
eloping nouveau seems to be kind of similar to what I want to achieve, I th=
ought it would be a good idea to ask it here as well.<br>
<br>
I have a PCI-Express video capture card that has a proprietary driver for L=
inux.<br>
I have some experience with programming in C, and so I would like to start =
a hobby project to develop a free/libre driver for this device for Linux.<b=
r>
Of course I don=E2=80=99t have access to any documentation about how to com=
municate with this device (I=E2=80=99ve tried to contact the company making=
 these, but my hopes are not high), so I think I will need to reverse-engin=
eer the way the existing driver communicates with the hardware. How could I=
 achieve this ?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif">Usually drivers map PCIe bars into the VM and=
 read/write at certain offsets to do.. stuff. In the linux kernel we have t=
he mmiotrace tracer in order to capture what a driver does with the hardwar=
e. You still need to interpret the trace file, but at least this should giv=
e you the raw data on what&#39;s going on. Hope that helps.</div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also, the long term goal of this project would be to have this driver merge=
d into mainline, so what is allowed or not while doing this to avoid proble=
matic legal ramifications ?<br>
Thank you for your help.=C2=A0<br></blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Best regards.<br>
Tomek Lecocq<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div></div>

--00000000000076428d05bc9f57b8--


--===============2052166769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2052166769==--

