Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B0D41F5FD
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 21:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF99F6F3DD;
	Fri,  1 Oct 2021 19:58:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9486F3D0
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:58:29 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id t2so10080366qtx.8
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=97MlNknqPZAvRX0pOTHlvT+SMQcFfj5RhA1iIUNuoTw=;
 b=QwC6gFOLUHG2NiA6x9d8ZqFlsWGFDCWgMjqpcvnPHAd/8q+40INSUE0XS439VLYGsB
 r0/ReGvLOMYrGlrWWSrEkuF+NLhUqc/zQnBx9xzGc8xQQtPeR0AxAJauU+Jihhm2+Cls
 tQiXa10jpIBgEhXix6N5PQh1q+cxcHq989UzIQ1uoHdABtki89WhKfJDjSPIsRoaYyFo
 TXXkAXuYgllBbhGg+mBvnlAZN35OBy8AcTGw/kT0rRocJXnW3lEGl3UB/XqE2kB8hW8d
 oRKrGt6GYOGX8ubs3avLe2jUdDZ5+U7SeYxcJBqtG97tCySLnxTYpJ6GheguuhrvZX6g
 UjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97MlNknqPZAvRX0pOTHlvT+SMQcFfj5RhA1iIUNuoTw=;
 b=JFtjcrWM5Tl78poEiCH1EZMX4IaRehfpXGnZC93BG3n1F74tR6BJscx870kDHaY2wg
 Y41sLDUnMbLcHW4ASbF3gYcSrbfe0LHu6PdXZbXxAGxSZRnE4yTSTNgUt3hYJGLlJRuJ
 q5fXum70c5qxJvON6fvjg9HYtZmIaf8F7K8abzEUdlfaS9UFbCGE6GXTW4A/yjAtisUJ
 XzFZgl/0USHUp26Jbck2WZlDKyWzppD1fdtEkH/ChdcRuUGASjzq8yN4lbCCDf7RpjqM
 gd9upP285dY2MWjJ2QX93zKkQyOjJbdhyvjOp1wlrEeArTy0Gue1JdrQX3TPd3RJ21L+
 /FlQ==
X-Gm-Message-State: AOAM532u0B3QR3wvo/R7xB3byEB9Xuh2hx+ZO0Um5IubM2XNxLjRHPQt
 M6rzZuyxrnrYjB5Qr2suUfuaF35bKwTAP1NpR6tC7efrHeU=
X-Google-Smtp-Source: ABdhPJxl5aI5MINk27K8VA5OQIPRD1FxqFPb+bllU4LPxTrD+BqKD4yF5Ubw4WZSSG7MotsrmDQHnC2dWbRIfN/PyAY=
X-Received: by 2002:ac8:5b8a:: with SMTP id a10mr15496189qta.290.1633118308235; 
 Fri, 01 Oct 2021 12:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
 <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
 <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
 <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
In-Reply-To: <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 15:58:17 -0400
Message-ID: <CABr8-B4zOQU1KYatZre7yZ9tkFOAffZj=DLKbvZe5om9uQ6ssA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000a37ca205cd4ffcef"
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

--000000000000a37ca205cd4ffcef
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 3:40 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Oct 1, 2021 at 3:36 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> >
> >
> >
> > On Fri, Oct 1, 2021 at 3:27 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> >>
> >>
> >>
> >> On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin <imirkin@alum.mit.edu>
> wrote:
> >>>
> >>> On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis <jerry.geis@gmail.com>
> wrote:
> >>> > On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu>
> wrote:
> >>> >>
> >>> >> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com>
> wrote:
> >>> >> > lsmod | grep nouveau
> >>> >> >
> >>> >> > What dont I have ?
> >>> >>
> >>> >> nouveau :)
> >>> >>
> >>> >> Other than that, you got everything...
> >>> >>
> >>> >> Check dmesg for errors.
> >>> >>
> >>> >> Cheers,
> >>> >>
> >>> >>   -ilia
> >>> >
> >>> >
> >>> > I see this:
> >>> > Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==)
> Matched nouveau as autoconfigured driver 0
> >>>
> >>> This is not dmesg. This is some log file. Please look in dmesg.
> >>>
> >>> > Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (**)
> VESA(0): Using "Shadow Framebuffer"
> >>>
> >>> X is using the VESA driver because nouveau (nor any other DRM driver)
> is loaded.
> >>>
> >>> >
> >>> > So it seems like its loading .... but perhaps its not happy ????
> >>> >
> >>> > What do I do  ?
> >>>
> >>> Check dmesg for why nouveau didn't load.
> >>>
> >>>   -ilia
> >>
> >>
> >>  grep -i nouveau /var/log/dmesg
> >> [   19.934733] kernel: fb0: switching to nouveaufb from VESA VGA
> >> [   20.013197] kernel: nouveau 0000:03:00.0: vgaarb: deactivate vga
> console
> >> [   20.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT218 (0a8200b1)
> >> [   20.159472] kernel: nouveau 0000:03:00.0: bios: version
> 70.18.45.00.00
> >> [   20.162603] kernel: nouveau 0000:03:00.0: fb: 512 MiB DDR3
> >> [   21.552858] kernel: nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> >> [   21.552873] kernel: nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> >> [   21.552888] kernel: nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> >> [   21.552900] kernel: nouveau 0000:03:00.0: DRM: DCB version 4.0
> >> [   21.552911] kernel: nouveau 0000:03:00.0: DRM: DCB outp 00: 01000302
> 00000030
> >> [   21.552924] kernel: nouveau 0000:03:00.0: DRM: DCB outp 01: 02000300
> 00000000
> >> [   21.552937] kernel: nouveau 0000:03:00.0: DRM: DCB outp 02: 02011362
> 00020010
> >> [   21.552950] kernel: nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
> >> [   21.552961] kernel: nouveau 0000:03:00.0: DRM: DCB conn 01: 00002161
> >> [   21.568834] kernel: nouveau 0000:03:00.0: DRM: MM: using COPY for
> buffer copies
> >> [   21.645206] kernel: nouveau 0000:03:00.0: DRM: allocated 1920x1080
> fb: 0x70000, bo (____ptrval____)
> >> [   21.648681] kernel: fbcon: nouveaudrmfb (fb0) is primary device
> >> [   21.837701] kernel: nouveau 0000:03:00.0: [drm] fb0: nouveaudrmfb
> frame buffer device
> >> [   21.873290] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
> 0000:03:00.0 on minor 0
>
> I was looking for you to just run "dmesg", BTW, not read a log file.
>
> >>
> >> lsmod | grep nouveau
> >> nouveau              1986560  30
> >> mxm_wmi                16384  1 nouveau
> >> i2c_algo_bit           16384  1 nouveau
> >> drm_ttm_helper         16384  1 nouveau
> >> ttm                    73728  2 drm_ttm_helper,nouveau
> >> drm_kms_helper        237568  1 nouveau
> >> drm                   548864  25
> drm_kms_helper,drm_ttm_helper,ttm,nouveau
> >> video                  53248  1 nouveau
> >> wmi                    32768  2 mxm_wmi,nouveau
> >>
> >> I took off ALL extra kernel command paramters - nothing specific to
> nouveau - and I got better results. however - video is still dropping
> frames.
>
> Perhaps you had a "nomodeset" in there? That would prevent nouveau
> from doing anything useful, although I think it'd still load in that
> case.
>
> >>
> >> So progress. but still no good.
>
> Check xorg log to make sure you see NOUVEAU lines, not modeset lines.
> If you see modeset lines, make sure you force the nouveau DDX driver
> to load. (Some distros think it's funny to prevent it from loading by
> default...)
>
> >>
> >> Jerry
> >
> >
> > I see this error:
> > nouveau 0000:03:00.0: Direct firmware load for nouveau/nva8_fuc084 failed
> >
> > I did apt-file search nva8_fuc084
> > and it did not return anything.
>
> This is for video decoding acceleration (vdpau / va-api). You can set
> this up by following the instructions at
> https://nouveau.freedesktop.org/VideoAcceleration.html . Note that
> it's hardly perfect.
>
> Cheers,
>
>   -ilia
>

These were the kernel command line items I removed.
acpi=off pci=nomsi

The machine seems happier - now - althought I no longer have sound for some
reason - but after installing the firmware - CPU % is way down.
Thanks

Jerry

--000000000000a37ca205cd4ffcef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 3:40 PM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Oct 1, 2021 at 3:36 PM Jerry Geis &lt;<a href=3D"mailto:jerry.geis@gmail=
.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Oct 1, 2021 at 3:27 PM Jerry Geis &lt;<a href=3D"mailto:jerry.=
geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin &lt;<a href=3D"mailto:i=
mirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis &lt;<a href=3D"mailt=
o:jerry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt; &gt; On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin &lt;<a href=3D=
"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt=
; wrote:<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis &lt;<a href=
=3D"mailto:jerry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt; &gt; lsmod | grep nouveau<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; What dont I have ?<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; nouveau :)<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Other than that, you got everything...<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Check dmesg for errors.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I see this:<br>
&gt;&gt;&gt; &gt; Oct=C2=A0 1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-sess=
ion[1546]: (=3D=3D) Matched nouveau as autoconfigured driver 0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This is not dmesg. This is some log file. Please look in dmesg=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; Oct=C2=A0 1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-sess=
ion[1546]: (**) VESA(0): Using &quot;Shadow Framebuffer&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; X is using the VESA driver because nouveau (nor any other DRM =
driver) is loaded.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; So it seems like its loading .... but perhaps its not hap=
py ????<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; What do I do=C2=A0 ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Check dmesg for why nouveau didn&#39;t load.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 grep -i nouveau /var/log/dmesg<br>
&gt;&gt; [=C2=A0 =C2=A019.934733] kernel: fb0: switching to nouveaufb from =
VESA VGA<br>
&gt;&gt; [=C2=A0 =C2=A020.013197] kernel: nouveau 0000:03:00.0: vgaarb: dea=
ctivate vga console<br>
&gt;&gt; [=C2=A0 =C2=A020.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT21=
8 (0a8200b1)<br>
&gt;&gt; [=C2=A0 =C2=A020.159472] kernel: nouveau 0000:03:00.0: bios: versi=
on 70.18.45.00.00<br>
&gt;&gt; [=C2=A0 =C2=A020.162603] kernel: nouveau 0000:03:00.0: fb: 512 MiB=
 DDR3<br>
&gt;&gt; [=C2=A0 =C2=A021.552858] kernel: nouveau 0000:03:00.0: DRM: VRAM: =
512 MiB<br>
&gt;&gt; [=C2=A0 =C2=A021.552873] kernel: nouveau 0000:03:00.0: DRM: GART: =
1048576 MiB<br>
&gt;&gt; [=C2=A0 =C2=A021.552888] kernel: nouveau 0000:03:00.0: DRM: TMDS t=
able version 2.0<br>
&gt;&gt; [=C2=A0 =C2=A021.552900] kernel: nouveau 0000:03:00.0: DRM: DCB ve=
rsion 4.0<br>
&gt;&gt; [=C2=A0 =C2=A021.552911] kernel: nouveau 0000:03:00.0: DRM: DCB ou=
tp 00: 01000302 00000030<br>
&gt;&gt; [=C2=A0 =C2=A021.552924] kernel: nouveau 0000:03:00.0: DRM: DCB ou=
tp 01: 02000300 00000000<br>
&gt;&gt; [=C2=A0 =C2=A021.552937] kernel: nouveau 0000:03:00.0: DRM: DCB ou=
tp 02: 02011362 00020010<br>
&gt;&gt; [=C2=A0 =C2=A021.552950] kernel: nouveau 0000:03:00.0: DRM: DCB co=
nn 00: 00001030<br>
&gt;&gt; [=C2=A0 =C2=A021.552961] kernel: nouveau 0000:03:00.0: DRM: DCB co=
nn 01: 00002161<br>
&gt;&gt; [=C2=A0 =C2=A021.568834] kernel: nouveau 0000:03:00.0: DRM: MM: us=
ing COPY for buffer copies<br>
&gt;&gt; [=C2=A0 =C2=A021.645206] kernel: nouveau 0000:03:00.0: DRM: alloca=
ted 1920x1080 fb: 0x70000, bo (____ptrval____)<br>
&gt;&gt; [=C2=A0 =C2=A021.648681] kernel: fbcon: nouveaudrmfb (fb0) is prim=
ary device<br>
&gt;&gt; [=C2=A0 =C2=A021.837701] kernel: nouveau 0000:03:00.0: [drm] fb0: =
nouveaudrmfb frame buffer device<br>
&gt;&gt; [=C2=A0 =C2=A021.873290] kernel: [drm] Initialized nouveau 1.3.1 2=
0120801 for 0000:03:00.0 on minor 0<br>
<br>
I was looking for you to just run &quot;dmesg&quot;, BTW, not read a log fi=
le.<br>
<br>
&gt;&gt;<br>
&gt;&gt; lsmod | grep nouveau<br>
&gt;&gt; nouveau=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1986560=C2=
=A0 30<br>
&gt;&gt; mxm_wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 163=
84=C2=A0 1 nouveau<br>
&gt;&gt; i2c_algo_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1=
 nouveau<br>
&gt;&gt; drm_ttm_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=A0 1 nouv=
eau<br>
&gt;&gt; ttm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 73728=C2=A0 2 drm_ttm_helper,nouveau<br>
&gt;&gt; drm_kms_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 237568=C2=A0 1 nouveau<b=
r>
&gt;&gt; drm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0548864=C2=A0 25 drm_kms_helper,drm_ttm_helper,ttm,nouveau<br>
&gt;&gt; video=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 53248=C2=A0 1 nouveau<br>
&gt;&gt; wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 32768=C2=A0 2 mxm_wmi,nouveau<br>
&gt;&gt;<br>
&gt;&gt; I took off ALL extra kernel command paramters - nothing specific t=
o nouveau - and I got better results. however - video is still dropping fra=
mes.<br>
<br>
Perhaps you had a &quot;nomodeset&quot; in there? That would prevent nouvea=
u<br>
from doing anything useful, although I think it&#39;d still load in that<br=
>
case.<br>
<br>
&gt;&gt;<br>
&gt;&gt; So progress. but still no good.<br>
<br>
Check xorg log to make sure you see NOUVEAU lines, not modeset lines.<br>
If you see modeset lines, make sure you force the nouveau DDX driver<br>
to load. (Some distros think it&#39;s funny to prevent it from loading by<b=
r>
default...)<br>
<br>
&gt;&gt;<br>
&gt;&gt; Jerry<br>
&gt;<br>
&gt;<br>
&gt; I see this error:<br>
&gt; nouveau 0000:03:00.0: Direct firmware load for nouveau/nva8_fuc084 fai=
led<br>
&gt;<br>
&gt; I did apt-file search nva8_fuc084<br>
&gt; and it did not return anything.<br>
<br>
This is for video decoding acceleration (vdpau / va-api). You can set<br>
this up by following the instructions at<br>
<a href=3D"https://nouveau.freedesktop.org/VideoAcceleration.html" rel=3D"n=
oreferrer" target=3D"_blank">https://nouveau.freedesktop.org/VideoAccelerat=
ion.html</a> . Note that<br>
it&#39;s hardly perfect.<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div><div>These were the kernel comm=
and line items I removed.</div><div>acpi=3Doff pci=3Dnomsi=C2=A0</div><div>=
<br></div><div>The machine seems happier - now - althought=C2=A0I no longer=
 have sound for some reason - but after installing the firmware - CPU % is =
way down.</div><div>Thanks</div><div><br></div><div>Jerry=C2=A0</div></div>=
</div>

--000000000000a37ca205cd4ffcef--
