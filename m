Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713BA41F549
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69656EF2E;
	Fri,  1 Oct 2021 19:00:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C4B6EEC1
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:00:11 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id b16so9936915qtt.7
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/e+J6Fh4t7WeaOGZgEzOztqLztI/ZjW3gAAjPm/HkQ=;
 b=YmP2VULdSunC23N+CuDG8QKx0qRnAw801qatmmGUVO//kosQedkEsnoXQKeljrtul8
 0Yq3d9Mx1PXtXDr4vcsm+pKvvUAI0NMXKMXxbw9DbMzsZfe95Ih+B9A/POAwzLV2inzc
 t2Rtar3JJitN5wNwY9+CPnkLC8sOPgqHfo4/CfNbfODY/LsH2Cc+qn2F2/Fh+9JlAEx3
 MT8J46sb0L8j7Iyr5fycCvBAj5TctlxNruMoiUI45RlDPMVTMJYFzLOArRikWIAEPaFm
 vC8oryNM9sKx7njJWY7WK1AAUd2rerpuNABGyjXOfHIxGKl8CKyWJXLcv/8bEpl251VC
 DGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/e+J6Fh4t7WeaOGZgEzOztqLztI/ZjW3gAAjPm/HkQ=;
 b=UmbHU3+P7iRJ9PyschVQvEdjIMVXjbo0r3pwqkPo7qYw5U2F2RzugRLhGNtEHEuzp+
 eM79t1IVmrND0cexLJKWPKcFW5R25tk8zOzIUQd5Q5s/wAhYQH2FNNmTSU+vc60Pma0i
 bwmCw0TFl9FbecdXjRCWfoOq8B90hm9M6LLcH0wrtAfoFgbQWRy/XsCmcdvmwsmRHgfk
 pw6WLV2xIwxyJN8c0sH3wtr+4g2Nn8Hax3+UUsaVmDPg1qu9TLQqecQ8luEcW0PzOnuv
 Igvw5v3USRRx6YknNrPVyDUfZGg3wFD/QOc3lBnF60S6spyU9kv2UyREuTnV2009UPgZ
 ECrA==
X-Gm-Message-State: AOAM532gWtboioGbYHUnhpXdFmBIdsDrXaSCnPt6mOGkYBmFCIlgrQcz
 uQdxiOGFxwPxHIBHrKwTGK7DBwUY6aRrMWme3DI=
X-Google-Smtp-Source: ABdhPJzkhW81yNGjdgKB8cUOBBQ9zIBN2Eshx+gXujEOp4OK8zET/UlSL5ZA+lveiEPZAdlTv0lgqNsSTxPtaFXA9Qc=
X-Received: by 2002:ac8:56f9:: with SMTP id 25mr15086027qtu.374.1633114810186; 
 Fri, 01 Oct 2021 12:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
In-Reply-To: <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 14:59:58 -0400
Message-ID: <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000237cf205cd4f2c6a"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

--000000000000237cf205cd4f2c6a
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 2:44 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Oct 1, 2021 at 2:29 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> > Thanks perhaps this is part of the problem:
> >  ls -l /sys/kernel/debug/dri/
> > total 0
>
> This indicates that nouveau is not loaded. (Or loaded and failed
> part-way through the load.)
>
> Cheers,
>
>   -ilia
>

Thanks I have this:

 grep nouveau /var/log/syslog
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (==) Matched
nouveau as autoconfigured driver 0
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II)
LoadModule: "nouveau"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/nouveau_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Module
nouveau: vendor="X.Org Foundation"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (==) Matched
nouveau as autoconfigured driver 0
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II)
LoadModule: "nouveau"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/nouveau_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Module
nouveau: vendor="X.Org Foundation"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II)
UnloadModule: "nouveau"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II)
Unloading nouveau
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Failed
to load module "nouveau" (already loaded, 0)

grep Loading /var/log/syslog
Oct  1 09:47:47 mediaport57 kernel: [   12.300994] Loading compiled-in
X.509 certificates
Oct  1 09:47:47 mediaport57 kernel: [   12.772319] blacklist: Loading
compiled-in revocation X.509 certificates
Oct  1 09:47:47 mediaport57 kernel: [   37.869170] cfg80211: Loading
compiled-in X.509 certificates for regulatory database
Oct  1 09:47:57 mediaport57 lxd.activate[846]: ==> Loading snap
configuration
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/extensions/libglx.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/nouveau_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/modesetting_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/vesa_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/nouveau_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/modesetting_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/drivers/vesa_drv.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "vbe"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/libvbe.so
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "int10"
Oct  1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/libint10.so
Oct  1 09:48:42 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "ddc"
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "shadow"
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/libshadow.so
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "fb"
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/libfb.so
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
sub module "int10"
Oct  1 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/libint10.so
Oct  1 09:48:44 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading
/usr/lib/xorg/modules/input/libinput_drv.so

lsmod | grep nouveau

What dont I have ?

Jerry

--000000000000237cf205cd4f2c6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 2:44 PM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Oct 1, 2021 at 2:29 PM Jerry Geis &lt;<a href=3D"mailto:jerry.geis@gmail=
.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt; Thanks perhaps this is part of the problem:<br>
&gt;=C2=A0 ls -l /sys/kernel/debug/dri/<br>
&gt; total 0<br>
<br>
This indicates that nouveau is not loaded. (Or loaded and failed<br>
part-way through the load.)<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div><div>Thanks I have this:</div><=
div><br></div>=C2=A0grep nouveau /var/log/syslog<br>Oct =C2=A01 09:48:41 me=
diaport57 /usr/lib/gdm3/gdm-x-session[1423]: (=3D=3D) Matched nouveau as au=
toconfigured driver 0<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm=
-x-session[1423]: (II) LoadModule: &quot;nouveau&quot;<br>Oct =C2=A01 09:48=
:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xo=
rg/modules/drivers/nouveau_drv.so<br>Oct =C2=A01 09:48:41 mediaport57 /usr/=
lib/gdm3/gdm-x-session[1423]: (II) Module nouveau: vendor=3D&quot;X.Org Fou=
ndation&quot;<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-sessi=
on[1423]: (=3D=3D) Matched nouveau as autoconfigured driver 0<br>Oct =C2=A0=
1 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) LoadModule: =
&quot;nouveau&quot;<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x=
-session[1423]: (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so<b=
r>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) =
Module nouveau: vendor=3D&quot;X.Org Foundation&quot;<br>Oct =C2=A01 09:48:=
41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) UnloadModule: &quot;=
nouveau&quot;<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-sessi=
on[1423]: (II) Unloading nouveau<br>Oct =C2=A01 09:48:41 mediaport57 /usr/l=
ib/gdm3/gdm-x-session[1423]: (II) Failed to load module &quot;nouveau&quot;=
 (already loaded, 0)<br><div><br></div><div>grep Loading /var/log/syslog<br=
>Oct =C2=A01 09:47:47 mediaport57 kernel: [ =C2=A0 12.300994] Loading compi=
led-in X.509 certificates<br>Oct =C2=A01 09:47:47 mediaport57 kernel: [ =C2=
=A0 12.772319] blacklist: Loading compiled-in revocation X.509 certificates=
<br>Oct =C2=A01 09:47:47 mediaport57 kernel: [ =C2=A0 37.869170] cfg80211: =
Loading compiled-in X.509 certificates for regulatory database<br>Oct =C2=
=A01 09:47:57 mediaport57 lxd.activate[846]: =3D=3D&gt; Loading snap config=
uration<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[142=
3]: (II) Loading /usr/lib/xorg/modules/extensions/libglx.so<br>Oct =C2=A01 =
09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/l=
ib/xorg/modules/drivers/nouveau_drv.so<br>Oct =C2=A01 09:48:41 mediaport57 =
/usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/modules/drive=
rs/modesetting_drv.so<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm=
-x-session[1423]: (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so<br=
>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) L=
oading /usr/lib/xorg/modules/drivers/nouveau_drv.so<br>Oct =C2=A01 09:48:41=
 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/=
modules/drivers/modesetting_drv.so<br>Oct =C2=A01 09:48:41 mediaport57 /usr=
/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/modules/drivers/v=
esa_drv.so<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-session[=
1423]: (II) Loading sub module &quot;vbe&quot;<br>Oct =C2=A01 09:48:41 medi=
aport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/modul=
es/libvbe.so<br>Oct =C2=A01 09:48:41 mediaport57 /usr/lib/gdm3/gdm-x-sessio=
n[1423]: (II) Loading sub module &quot;int10&quot;<br>Oct =C2=A01 09:48:41 =
mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/m=
odules/libint10.so<br>Oct =C2=A01 09:48:42 mediaport57 /usr/lib/gdm3/gdm-x-=
session[1423]: (II) Loading sub module &quot;ddc&quot;<br>Oct =C2=A01 09:48=
:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading sub module =
&quot;shadow&quot;<br>Oct =C2=A01 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-=
session[1423]: (II) Loading /usr/lib/xorg/modules/libshadow.so<br>Oct =C2=
=A01 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading s=
ub module &quot;fb&quot;<br>Oct =C2=A01 09:48:43 mediaport57 /usr/lib/gdm3/=
gdm-x-session[1423]: (II) Loading /usr/lib/xorg/modules/libfb.so<br>Oct =C2=
=A01 09:48:43 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loading s=
ub module &quot;int10&quot;<br>Oct =C2=A01 09:48:43 mediaport57 /usr/lib/gd=
m3/gdm-x-session[1423]: (II) Loading /usr/lib/xorg/modules/libint10.so<br>O=
ct =C2=A01 09:48:44 mediaport57 /usr/lib/gdm3/gdm-x-session[1423]: (II) Loa=
ding /usr/lib/xorg/modules/input/libinput_drv.so<br></div><div><br></div><d=
iv>lsmod | grep nouveau<br></div><div><br></div><div>What dont=C2=A0I have =
?=C2=A0</div><div><br></div><div>Jerry=C2=A0</div></div></div>

--000000000000237cf205cd4f2c6a--
