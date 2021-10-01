Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6D41F5A8
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF5988CBF;
	Fri,  1 Oct 2021 19:17:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F3788CBF
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:17:03 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id x12so10182960qkf.9
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/D5HG+2h1tf6lUPmG2WR3kQ7sdXcn8vGviMjf1xC9s=;
 b=RzeE8hL5hfFfQkSMl4awFFFdCF8nYVYjDzOjp/9axBKAYJ725DEV16qqg3q0RBOrsc
 nn3J0Su+KCimRuJjkQIL8V41WYZ71yqRVh0vh5MD7nCNl5kag8klFeZZ0mQnkJivpqr9
 HYXBv3+++BlntgDuyksHVJMhQb6yd+DwKBY0v/DoTV3xQoa7ejNjF1hhgBenGW2QWB6j
 Y12COnHcN3Ah1UUQ7KbCCjJvStnnbA52hL/DCGCFUHAXJmuveBxpcHbSwZeVbKePKDTp
 MYDkbhv2uVBFvbR2vTMZhoOxJz/vTn9Ej3etX1N6ayDIS9jzUJVbeNggQ2SXIwCRtAwP
 EKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/D5HG+2h1tf6lUPmG2WR3kQ7sdXcn8vGviMjf1xC9s=;
 b=Va0nlEpcJdVnWRRsgAwvw+USc39P2rpMjQog7j0MTVfQHPxkR7KW8GqImyo/pihodr
 zBZeLe6VyVu9zVNFJ2MH0ZPxbuOsqDwAzSwKu8yLQzJB+kb9tcWNCZO2rHFB7GaKfCgT
 C4mhSdurF2K40y+Olmdn7QURXB4BkL1EmimvbAWlvL5/R2BYwZl4csJgSi5HnfRa2pPj
 k2OXMc+F6Qor1NGSNWhSBvcEgHDHGE3eq3Th4171VbmvCbSNL5Dfj7W6RmONcZT6Gh+R
 68dRQ0Qmp+T4eM6VN2yOl7UH9qKQVDh07Da076xndhxilP4Jh/FHefUYM6Q0AzRFIvOq
 uVFA==
X-Gm-Message-State: AOAM5330VpJKSs2jcd5S8WVQhFHbBsD8uJR8FS3SMoR+uA7bfhrl/yAd
 lDL1CT9Ml+N3OCrGTcL7qtVyg2PZDd0IkJddR2Y=
X-Google-Smtp-Source: ABdhPJzzlkDGjk1K+hYk0MeFnhrt5yl6lCrtBAmRVhcVHTGsOeMRjrrOu5o2cOlFGE8iZ19vXnGDm8VdWqVT+jXRfsc=
X-Received: by 2002:a37:8ac6:: with SMTP id m189mr11197338qkd.66.1633115822318; 
 Fri, 01 Oct 2021 12:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
In-Reply-To: <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 15:16:51 -0400
Message-ID: <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000007766da05cd4f685d"
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

--0000000000007766da05cd4f685d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> > lsmod | grep nouveau
> >
> > What dont I have ?
>
> nouveau :)
>
> Other than that, you got everything...
>
> Check dmesg for errors.
>
> Cheers,
>
>   -ilia
>

I see this:
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched
nouveau as autoconfigured driver 0
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched
modesetting as autoconfigured driver 1
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched
fbdev as autoconfigured driver 2
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched
vesa as autoconfigured driver 3
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==)
Assigned the driver to the xf86ConfigLayout
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
LoadModule: "nouveau"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Loading
/usr/lib/xorg/modules/drivers/nouveau_drv.so
Oct  1 15:11:21 mediaport57 systemd[1484]: Stopped Tracker file system data
miner.
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Module
nouveau: vendor="X.Org Foundation"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011compiled
for 1.20.3, module version = 1.0.16
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011Module
class: X.Org Video Driver
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011ABI
class: X.Org Video Driver, version 24.0
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
LoadModule: "modesetting"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Loading
/usr/lib/xorg/modules/drivers/modesetting_drv.so
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Module
modesetting: vendor="X.Org Foundation"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011compiled
for 1.20.11, module version = 1.20.11
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011Module
class: X.Org Video Driver
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011ABI
class: X.Org Video Driver, version 24.1
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
LoadModule: "fbdev"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (WW)
Warning, couldn't open module fbdev
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (EE) Failed
to load module "fbdev" (module does not exist, 0)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
LoadModule: "vesa"
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Loading
/usr/lib/xorg/modules/drivers/vesa_drv.so


Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) NOUVEAU
driver Date:   Mon Jan 28 23:25:58 2019 -0500
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) NOUVEAU
driver for NVIDIA chipset families :
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011RIVA TNT
           (NV04)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011RIVA
TNT2           (NV05)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
256         (NV10)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
2           (NV11, NV15)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
4MX         (NV17, NV18)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
3           (NV20)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
4Ti         (NV25, NV28)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
FX          (NV3x)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
6           (NV4x)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
7           (G7x)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
8           (G8x)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
9           (G9x)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
GTX 2xx/3xx (GT2xx)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
GTX 4xx/5xx (GFxxx)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
GTX 6xx/7xx (GKxxx)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
GTX 9xx     (GMxxx)
Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce
GTX 10xx    (GPxxx)

Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using default hsync range of 31.50-48.00 kHz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using default vrefresh range of 50.00-70.00 Hz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using default maximum pixel clock of 65.00 MHz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1920x1080" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1600x1200" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1440x900" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1368x768" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1360x768" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1366x768" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "1024x768" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "800x600" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "640x480" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "1280x1024" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "1280x800" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "640x400" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "320x400" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "320x240" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using built-in mode "320x200" (no mode of this name)
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (WW)
VESA(0): No valid modes left. Trying less strict filter...
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using hsync range of 31.50-48.00 kHz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using vrefresh range of 50.00-70.00 Hz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): <default monitor>: Using maximum pixel clock of 65.00 MHz
Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II)
VESA(0): Not using mode "1920x1080" (no mode of this name)

Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (**)
VESA(0): Using "Shadow Framebuffer"

So it seems like its loading .... but perhaps its not happy ????

What do I do  ?

Jerry

--0000000000007766da05cd4f685d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 3:06 PM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Oct 1, 2021 at 3:00 PM Jerry Geis &lt;<a href=3D"mailto:jerry.geis@gmail=
.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt; lsmod | grep nouveau<br>
&gt;<br>
&gt; What dont I have ?<br>
<br>
nouveau :)<br>
<br>
Other than that, you got everything...<br>
<br>
Check dmesg for errors.<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div><div>I see this:</div>Oct =C2=
=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (=3D=3D) Match=
ed nouveau as autoconfigured driver 0<br>Oct =C2=A01 15:11:21 mediaport57 /=
usr/lib/gdm3/gdm-x-session[1546]: (=3D=3D) Matched modesetting as autoconfi=
gured driver 1<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-sess=
ion[1546]: (=3D=3D) Matched fbdev as autoconfigured driver 2<br>Oct =C2=A01=
 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (=3D=3D) Matched v=
esa as autoconfigured driver 3<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib=
/gdm3/gdm-x-session[1546]: (=3D=3D) Assigned the driver to the xf86ConfigLa=
yout<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]:=
 (II) LoadModule: &quot;nouveau&quot;<br>Oct =C2=A01 15:11:21 mediaport57 /=
usr/lib/gdm3/gdm-x-session[1546]: (II) Loading /usr/lib/xorg/modules/driver=
s/nouveau_drv.so<br>Oct =C2=A01 15:11:21 mediaport57 systemd[1484]: Stopped=
 Tracker file system data miner.<br>Oct =C2=A01 15:11:21 mediaport57 /usr/l=
ib/gdm3/gdm-x-session[1546]: (II) Module nouveau: vendor=3D&quot;X.Org Foun=
dation&quot;<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-sessio=
n[1546]: #011compiled for 1.20.3, module version =3D 1.0.16<br>Oct =C2=A01 =
15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011Module class: X=
.Org Video Driver<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-s=
ession[1546]: #011ABI class: X.Org Video Driver, version 24.0<br>Oct =C2=A0=
1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) LoadModule: =
&quot;modesetting&quot;<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/g=
dm-x-session[1546]: (II) Loading /usr/lib/xorg/modules/drivers/modesetting_=
drv.so<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546=
]: (II) Module modesetting: vendor=3D&quot;X.Org Foundation&quot;<br>Oct =
=C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011compile=
d for 1.20.11, module version =3D 1.20.11<br>Oct =C2=A01 15:11:21 mediaport=
57 /usr/lib/gdm3/gdm-x-session[1546]: #011Module class: X.Org Video Driver<=
br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011=
ABI class: X.Org Video Driver, version 24.1<br>Oct =C2=A01 15:11:21 mediapo=
rt57 /usr/lib/gdm3/gdm-x-session[1546]: (II) LoadModule: &quot;fbdev&quot;<=
br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (WW)=
 Warning, couldn&#39;t open module fbdev<br>Oct =C2=A01 15:11:21 mediaport5=
7 /usr/lib/gdm3/gdm-x-session[1546]: (EE) Failed to load module &quot;fbdev=
&quot; (module does not exist, 0)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/=
lib/gdm3/gdm-x-session[1546]: (II) LoadModule: &quot;vesa&quot;<br>Oct =C2=
=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) Loading /=
usr/lib/xorg/modules/drivers/vesa_drv.so<br><div><br></div><div><br></div>O=
ct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) NOU=
VEAU driver Date: =C2=A0 Mon Jan 28 23:25:58 2019 -0500<br>Oct =C2=A01 15:1=
1:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II) NOUVEAU driver for=
 NVIDIA chipset families :<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm=
3/gdm-x-session[1546]: #011RIVA TNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(NV04)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1=
546]: #011RIVA TNT2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NV05)<br>Oct =C2=A0=
1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce 256 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (NV10)<br>Oct =C2=A01 15:11:21 mediaport57 /usr=
/lib/gdm3/gdm-x-session[1546]: #011GeForce 2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (NV11, NV15)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x=
-session[1546]: #011GeForce 4MX =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NV17, NV18)<br=
>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011Ge=
Force 3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NV20)<br>Oct =C2=A01 15:11:21 m=
ediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce 4Ti =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (NV25, NV28)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gd=
m3/gdm-x-session[1546]: #011GeForce FX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(N=
V3x)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]:=
 #011GeForce 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NV4x)<br>Oct =C2=A01 15:=
11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce 7 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (G7x)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/=
lib/gdm3/gdm-x-session[1546]: #011GeForce 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (G8x)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1=
546]: #011GeForce 9 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (G9x)<br>Oct =C2=A01=
 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce GTX 2x=
x/3xx (GT2xx)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-sessi=
on[1546]: #011GeForce GTX 4xx/5xx (GFxxx)<br>Oct =C2=A01 15:11:21 mediaport=
57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeForce GTX 6xx/7xx (GKxxx)<br>Oc=
t =C2=A01 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: #011GeFor=
ce GTX 9xx =C2=A0 =C2=A0 (GMxxx)<br>Oct =C2=A01 15:11:21 mediaport57 /usr/l=
ib/gdm3/gdm-x-session[1546]: #011GeForce GTX 10xx =C2=A0 =C2=A0(GPxxx)<br><=
div><br></div><div>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-ses=
sion[1546]: (II) VESA(0): &lt;default monitor&gt;: Using default hsync rang=
e of 31.50-48.00 kHz<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-=
x-session[1546]: (II) VESA(0): &lt;default monitor&gt;: Using default vrefr=
esh range of 50.00-70.00 Hz<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gd=
m3/gdm-x-session[1546]: (II) VESA(0): &lt;default monitor&gt;: Using defaul=
t maximum pixel clock of 65.00 MHz<br>Oct =C2=A01 15:11:23 mediaport57 /usr=
/lib/gdm3/gdm-x-session[1546]: (II) VESA(0): Not using mode &quot;1920x1080=
&quot; (no mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/=
gdm3/gdm-x-session[1546]: (II) VESA(0): Not using mode &quot;1600x1200&quot=
; (no mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/=
gdm-x-session[1546]: (II) VESA(0): Not using mode &quot;1440x900&quot; (no =
mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-=
session[1546]: (II) VESA(0): Not using mode &quot;1368x768&quot; (no mode o=
f this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-sessio=
n[1546]: (II) VESA(0): Not using mode &quot;1360x768&quot; (no mode of this=
 name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546=
]: (II) VESA(0): Not using mode &quot;1366x768&quot; (no mode of this name)=
<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (II=
) VESA(0): Not using built-in mode &quot;1024x768&quot; (no mode of this na=
me)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: =
(II) VESA(0): Not using built-in mode &quot;800x600&quot; (no mode of this =
name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]=
: (II) VESA(0): Not using built-in mode &quot;640x480&quot; (no mode of thi=
s name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[154=
6]: (II) VESA(0): Not using built-in mode &quot;1280x1024&quot; (no mode of=
 this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session=
[1546]: (II) VESA(0): Not using built-in mode &quot;1280x800&quot; (no mode=
 of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-sess=
ion[1546]: (II) VESA(0): Not using built-in mode &quot;640x400&quot; (no mo=
de of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-se=
ssion[1546]: (II) VESA(0): Not using built-in mode &quot;320x400&quot; (no =
mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-=
session[1546]: (II) VESA(0): Not using built-in mode &quot;320x240&quot; (n=
o mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-=
x-session[1546]: (II) VESA(0): Not using built-in mode &quot;320x200&quot; =
(no mode of this name)<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gd=
m-x-session[1546]: (WW) VESA(0): No valid modes left. Trying less strict fi=
lter...<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[154=
6]: (II) VESA(0): &lt;default monitor&gt;: Using hsync range of 31.50-48.00=
 kHz<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]:=
 (II) VESA(0): &lt;default monitor&gt;: Using vrefresh range of 50.00-70.00=
 Hz<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: =
(II) VESA(0): &lt;default monitor&gt;: Using maximum pixel clock of 65.00 M=
Hz<br>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (=
II) VESA(0): Not using mode &quot;1920x1080&quot; (no mode of this name)<br=
></div><div><br></div><div>Oct =C2=A01 15:11:23 mediaport57 /usr/lib/gdm3/g=
dm-x-session[1546]: (**) VESA(0): Using &quot;Shadow Framebuffer&quot;<br><=
/div><div><br></div><div>So it seems like its loading .... but perhaps its =
not happy ????=C2=A0</div><div><br></div><div>What do I do=C2=A0 ?</div><di=
v><br></div><div>Jerry=C2=A0</div></div></div>

--0000000000007766da05cd4f685d--
