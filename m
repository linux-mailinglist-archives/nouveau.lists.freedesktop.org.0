Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7F41F5BA
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82CD6E53C;
	Fri,  1 Oct 2021 19:27:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BDD6E53C
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:27:44 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id e16so10026551qts.4
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqdasWiPo0PhaxfiUKY174w1Jy0ZxPW7JQtwF7r5oK0=;
 b=DZ/F+kELPaKglO15xhqarEMOEIC6s5LJ1WJ+D7uGz1Jp4bhUnD9iwXWroSpWkj9i2z
 fEtHKKjixu5tDw/Qn4vq9ceLUfja6gB0p5hLtwSpauKrKvYPXcpFBQWaTHMYEJBOcl4d
 neVDGATFO6WDPz8jY34seO6Qtm+lD7OAD0TwjKGCQ9M/VVXirepUuwlfK7oUiayoichS
 HoAvIbudjNV6RnISpRGLxR5z/iskz3c/jcyvHbv3lJWhEC3TYGaMyLPbn1zwfLuugOpp
 yR6/gQYShrS01/LPucL6iJypL6KqP/omUP1j9wyK0im7mO3lTLSGA/AExLEgKON7V/ii
 ZnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqdasWiPo0PhaxfiUKY174w1Jy0ZxPW7JQtwF7r5oK0=;
 b=7cXqALcpnBkI8ORugQnqAEWn6ItxdkLbB/GgvvINNSpI+a7FMfxoApq0SP7Y6NLnQk
 NxpIxSq22HvId1ariJyOM/4Txdp1QtVDIk4s2OEOm4xTTybW+Y0jNxHvyvhD5+nkWKKM
 OHlc9rbn0EqdzfzD+3BjkrVCAJ1yLAv6jrmNpikh77td4iz8K+iXNENA7l46g1zaAQJa
 5bMmSn2lKvu7T/tmj61P5/emM+MwetnnkG911axYsQ/3xfXNRer8Dy+BC8OF+U/QZE3j
 4E6jfpdCBQDcSkPuMcP7dNowY6jQ28tYMaF7b7rhKqVGTFmSG+e2wRVUwxSYxixevdym
 CtHw==
X-Gm-Message-State: AOAM530iuITkw5Sx3+0WR6t4tHtQekJ1D0bz7sGQB2j0dwDGEUcC5X2I
 4JXlyCXM+FQcpgz8m0G/ACE8YAXD8v+x9C7nCig=
X-Google-Smtp-Source: ABdhPJxNWIVEcMCAZuelwocIm9U1kAmbJ6rsYTSmYN3ChIx17xDJ8ZDitou4ap5lufBmUnUkAATTBtkH4JvVvMmL80Q=
X-Received: by 2002:a05:622a:1047:: with SMTP id
 f7mr501750qte.97.1633116463664; 
 Fri, 01 Oct 2021 12:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
In-Reply-To: <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 15:27:32 -0400
Message-ID: <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000b1905d05cd4f8edb"
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

--000000000000b1905d05cd4f8edb
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> > On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >>
> >> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> >> > lsmod | grep nouveau
> >> >
> >> > What dont I have ?
> >>
> >> nouveau :)
> >>
> >> Other than that, you got everything...
> >>
> >> Check dmesg for errors.
> >>
> >> Cheers,
> >>
> >>   -ilia
> >
> >
> > I see this:
> > Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==)
> Matched nouveau as autoconfigured driver 0
>
> This is not dmesg. This is some log file. Please look in dmesg.
>
> > Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (**)
> VESA(0): Using "Shadow Framebuffer"
>
> X is using the VESA driver because nouveau (nor any other DRM driver) is
> loaded.
>
> >
> > So it seems like its loading .... but perhaps its not happy ????
> >
> > What do I do  ?
>
> Check dmesg for why nouveau didn't load.
>
>   -ilia
>

 grep -i nouveau /var/log/dmesg
[   19.934733] kernel: fb0: switching to nouveaufb from VESA VGA
[   20.013197] kernel: nouveau 0000:03:00.0: vgaarb: deactivate vga console
[   20.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT218 (0a8200b1)
[   20.159472] kernel: nouveau 0000:03:00.0: bios: version 70.18.45.00.00
[   20.162603] kernel: nouveau 0000:03:00.0: fb: 512 MiB DDR3
[   21.552858] kernel: nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[   21.552873] kernel: nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[   21.552888] kernel: nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[   21.552900] kernel: nouveau 0000:03:00.0: DRM: DCB version 4.0
[   21.552911] kernel: nouveau 0000:03:00.0: DRM: DCB outp 00: 01000302
00000030
[   21.552924] kernel: nouveau 0000:03:00.0: DRM: DCB outp 01: 02000300
00000000
[   21.552937] kernel: nouveau 0000:03:00.0: DRM: DCB outp 02: 02011362
00020010
[   21.552950] kernel: nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
[   21.552961] kernel: nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
[   21.568834] kernel: nouveau 0000:03:00.0: DRM: MM: using COPY for buffer
copies
[   21.645206] kernel: nouveau 0000:03:00.0: DRM: allocated 1920x1080 fb:
0x70000, bo (____ptrval____)
[   21.648681] kernel: fbcon: nouveaudrmfb (fb0) is primary device
[   21.837701] kernel: nouveau 0000:03:00.0: [drm] fb0: nouveaudrmfb frame
buffer device
[   21.873290] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:03:00.0 on minor 0

lsmod | grep nouveau
nouveau              1986560  30
mxm_wmi                16384  1 nouveau
i2c_algo_bit           16384  1 nouveau
drm_ttm_helper         16384  1 nouveau
ttm                    73728  2 drm_ttm_helper,nouveau
drm_kms_helper        237568  1 nouveau
drm                   548864  25 drm_kms_helper,drm_ttm_helper,ttm,nouveau
video                  53248  1 nouveau
wmi                    32768  2 mxm_wmi,nouveau

I took off ALL extra kernel command paramters - nothing specific to nouveau
- and I got better results. however - video is still dropping frames.

So progress. but still no good.

Jerry

--000000000000b1905d05cd4f8edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 3:20 PM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Oct 1, 2021 at 3:17 PM Jerry Geis &lt;<a href=3D"mailto:jerry.geis@gmail=
.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin &lt;<a href=3D"mailto:imirk=
in@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis &lt;<a href=3D"mailto:je=
rry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt; lsmod | grep nouveau<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What dont I have ?<br>
&gt;&gt;<br>
&gt;&gt; nouveau :)<br>
&gt;&gt;<br>
&gt;&gt; Other than that, you got everything...<br>
&gt;&gt;<br>
&gt;&gt; Check dmesg for errors.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;<br>
&gt;<br>
&gt; I see this:<br>
&gt; Oct=C2=A0 1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (=
=3D=3D) Matched nouveau as autoconfigured driver 0<br>
<br>
This is not dmesg. This is some log file. Please look in dmesg.<br>
<br>
&gt; Oct=C2=A0 1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (*=
*) VESA(0): Using &quot;Shadow Framebuffer&quot;<br>
<br>
X is using the VESA driver because nouveau (nor any other DRM driver) is lo=
aded.<br>
<br>
&gt;<br>
&gt; So it seems like its loading .... but perhaps its not happy ????<br>
&gt;<br>
&gt; What do I do=C2=A0 ?<br>
<br>
Check dmesg for why nouveau didn&#39;t load.<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div>=C2=A0grep -i nouveau /var/log/=
dmesg<br>[ =C2=A0 19.934733] kernel: fb0: switching to nouveaufb from VESA =
VGA<br>[ =C2=A0 20.013197] kernel: nouveau 0000:03:00.0: vgaarb: deactivate=
 vga console<br>[ =C2=A0 20.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT=
218 (0a8200b1)<br>[ =C2=A0 20.159472] kernel: nouveau 0000:03:00.0: bios: v=
ersion 70.18.45.00.00<br>[ =C2=A0 20.162603] kernel: nouveau 0000:03:00.0: =
fb: 512 MiB DDR3<br>[ =C2=A0 21.552858] kernel: nouveau 0000:03:00.0: DRM: =
VRAM: 512 MiB<br>[ =C2=A0 21.552873] kernel: nouveau 0000:03:00.0: DRM: GAR=
T: 1048576 MiB<br>[ =C2=A0 21.552888] kernel: nouveau 0000:03:00.0: DRM: TM=
DS table version 2.0<br>[ =C2=A0 21.552900] kernel: nouveau 0000:03:00.0: D=
RM: DCB version 4.0<br>[ =C2=A0 21.552911] kernel: nouveau 0000:03:00.0: DR=
M: DCB outp 00: 01000302 00000030<br>[ =C2=A0 21.552924] kernel: nouveau 00=
00:03:00.0: DRM: DCB outp 01: 02000300 00000000<br>[ =C2=A0 21.552937] kern=
el: nouveau 0000:03:00.0: DRM: DCB outp 02: 02011362 00020010<br>[ =C2=A0 2=
1.552950] kernel: nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030<br>[ =C2=
=A0 21.552961] kernel: nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161<br>=
[ =C2=A0 21.568834] kernel: nouveau 0000:03:00.0: DRM: MM: using COPY for b=
uffer copies<br>[ =C2=A0 21.645206] kernel: nouveau 0000:03:00.0: DRM: allo=
cated 1920x1080 fb: 0x70000, bo (____ptrval____)<br>[ =C2=A0 21.648681] ker=
nel: fbcon: nouveaudrmfb (fb0) is primary device<br>[ =C2=A0 21.837701] ker=
nel: nouveau 0000:03:00.0: [drm] fb0: nouveaudrmfb frame buffer device<br>[=
 =C2=A0 21.873290] kernel: [drm] Initialized nouveau 1.3.1 20120801 for 000=
0:03:00.0 on minor 0<br><div><br></div><div>lsmod | grep nouveau<br>nouveau=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01986560 =C2=A030<br>mxm_wm=
i =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384 =C2=A01 nouv=
eau<br>i2c_algo_bit =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =C2=A01 nouvea=
u<br>drm_ttm_helper =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =C2=A01 nouveau<br>tt=
m =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07372=
8 =C2=A02 drm_ttm_helper,nouveau<br>drm_kms_helper =C2=A0 =C2=A0 =C2=A0 =C2=
=A0237568 =C2=A01 nouveau<br>drm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 548864 =C2=A025 drm_kms_helper,drm_ttm_helper,ttm,nouv=
eau<br>video =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
53248 =C2=A01 nouveau<br>wmi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A032768 =C2=A02 mxm_wmi,nouveau<br></div><div><br></d=
iv><div>I took off ALL extra kernel command paramters=C2=A0- nothing specif=
ic to nouveau - and I got better results. however - video is still dropping=
 frames.</div><div><br></div><div>So progress. but still no good.</div><div=
><br></div><div>Jerry=C2=A0</div></div></div>

--000000000000b1905d05cd4f8edb--
