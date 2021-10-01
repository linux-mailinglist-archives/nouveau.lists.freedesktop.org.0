Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F213141F650
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 22:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE406E544;
	Fri,  1 Oct 2021 20:29:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F56E544
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 20:29:15 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id c7so10417502qka.2
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ6F62Ru7LkkMvxOOEsdBgdCqe03WRKbLyEzMwnZLHc=;
 b=TVR5zL/bqVKU5KOKe7PK8lKfIDjYCRf8AKzNz0IL7rKCqKdzP/JTjVNBqKWX3GkDP4
 bd42b84ZffC/GYFUdszH+LQxKctbgbzIfWdUuVDpLA8tNix6ZaFYZKWNtUc+7lxYppXJ
 KMqBf5cxuL4fZ+mLvBwHo7+rKgmJxTXRZQOxl1mjw4XwtLohcuo+p3ZdtuKWxf+QQk+K
 ECxYtu6DgfbTFr00YLnQ66dzghscBHcjyhm+BlFIbzqtPREC2+fIspC5ifNa0SSyETym
 5FAGL1BMOfUEDf6Vw8DYLzaA32h21i1/pV1koL1DO0PMS8ptPRH5xlClB0yRcKdvmTQa
 pbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ6F62Ru7LkkMvxOOEsdBgdCqe03WRKbLyEzMwnZLHc=;
 b=4G1RHkYFNLb8oYfDaxO0HDCYHq5VydFdrUtoYyykiNpEkPc2cz/SKxliTeCTTyDPUf
 YIWyXRilV8uIf5Kn91z3771DfW0X69h9IZLXj3n1WHMBXet6wMrpJnOMF2SkHxH7KsJY
 UTET6zEgdgtOUDjCRtN4MAl30kTK2tpOety5dEI5bneKmse6/m9wtE5znTySTKVChhAI
 RToZeuPoGWUy/VvewtkCB/rJnet9I1G9Pfn/KzO9ZMYP53jAF4XPoko8QBPXxlSPaCeV
 tWyrU/18JIMDmo+8uXQcrUIOq5ORX5n4zj8fiYRfDscRmHUVfOrcwDjLOHENQb4SP4Dt
 XCtw==
X-Gm-Message-State: AOAM532CRV9i34zzbbVN9ByYcPjN+N2pPh//EdxRz4UoxGPYxkSewvNx
 vHmlp26Ac8Y6C4NmoRdj1I7JIoNd60QRhHapQJ8=
X-Google-Smtp-Source: ABdhPJy1ya3AA5WCkD8E0IIswY+k5f15qeKrPiwgMLNhf8++nXa25I0eV7DdQhx2eOBcbChVRVhMm2rvZtQObh51OLs=
X-Received: by 2002:a37:6553:: with SMTP id z80mr61216qkb.42.1633120154562;
 Fri, 01 Oct 2021 13:29:14 -0700 (PDT)
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
 <CABr8-B4zOQU1KYatZre7yZ9tkFOAffZj=DLKbvZe5om9uQ6ssA@mail.gmail.com>
 <CAKb7Uvi7V+cSOTWvRGyE6BhZpbShVDV+H1+nenJ0osTM-m+1Aw@mail.gmail.com>
In-Reply-To: <CAKb7Uvi7V+cSOTWvRGyE6BhZpbShVDV+H1+nenJ0osTM-m+1Aw@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 16:29:03 -0400
Message-ID: <CABr8-B4pDnBDM92WCWEbfjnyXaDsGr9hg8Z2ENcxDdskHP54PA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000b0334505cd506a9a"
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

--000000000000b0334505cd506a9a
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 4:15 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Oct 1, 2021 at 3:58 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> >
> >
> >
> > On Fri, Oct 1, 2021 at 3:40 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >>
> >> On Fri, Oct 1, 2021 at 3:36 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> >> >
> >> >
> >> >
> >> > On Fri, Oct 1, 2021 at 3:27 PM Jerry Geis <jerry.geis@gmail.com>
> wrote:
> >> >>
> >> >>
> >> >>
> >> >> On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin <imirkin@alum.mit.edu>
> wrote:
> >> >>>
> >> >>> On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis <jerry.geis@gmail.com>
> wrote:
> >> >>> > On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu>
> wrote:
> >> >>> >>
> >> >>> >> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com>
> wrote:
> >> >>> >> > lsmod | grep nouveau
> >> >>> >> >
> >> >>> >> > What dont I have ?
> >> >>> >>
> >> >>> >> nouveau :)
> >> >>> >>
> >> >>> >> Other than that, you got everything...
> >> >>> >>
> >> >>> >> Check dmesg for errors.
> >> >>> >>
> >> >>> >> Cheers,
> >> >>> >>
> >> >>> >>   -ilia
> >> >>> >
> >> >>> >
> >> >>> > I see this:
> >> >>> > Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]:
> (==) Matched nouveau as autoconfigured driver 0
> >> >>>
> >> >>> This is not dmesg. This is some log file. Please look in dmesg.
> >> >>>
> >> >>> > Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]:
> (**) VESA(0): Using "Shadow Framebuffer"
> >> >>>
> >> >>> X is using the VESA driver because nouveau (nor any other DRM
> driver) is loaded.
> >> >>>
> >> >>> >
> >> >>> > So it seems like its loading .... but perhaps its not happy ????
> >> >>> >
> >> >>> > What do I do  ?
> >> >>>
> >> >>> Check dmesg for why nouveau didn't load.
> >> >>>
> >> >>>   -ilia
> >> >>
> >> >>
> >> >>  grep -i nouveau /var/log/dmesg
> >> >> [   19.934733] kernel: fb0: switching to nouveaufb from VESA VGA
> >> >> [   20.013197] kernel: nouveau 0000:03:00.0: vgaarb: deactivate vga
> console
> >> >> [   20.013415] kernel: nouveau 0000:03:00.0: NVIDIA GT218 (0a8200b1)
> >> >> [   20.159472] kernel: nouveau 0000:03:00.0: bios: version
> 70.18.45.00.00
> >> >> [   20.162603] kernel: nouveau 0000:03:00.0: fb: 512 MiB DDR3
> >> >> [   21.552858] kernel: nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> >> >> [   21.552873] kernel: nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> >> >> [   21.552888] kernel: nouveau 0000:03:00.0: DRM: TMDS table version
> 2.0
> >> >> [   21.552900] kernel: nouveau 0000:03:00.0: DRM: DCB version 4.0
> >> >> [   21.552911] kernel: nouveau 0000:03:00.0: DRM: DCB outp 00:
> 01000302 00000030
> >> >> [   21.552924] kernel: nouveau 0000:03:00.0: DRM: DCB outp 01:
> 02000300 00000000
> >> >> [   21.552937] kernel: nouveau 0000:03:00.0: DRM: DCB outp 02:
> 02011362 00020010
> >> >> [   21.552950] kernel: nouveau 0000:03:00.0: DRM: DCB conn 00:
> 00001030
> >> >> [   21.552961] kernel: nouveau 0000:03:00.0: DRM: DCB conn 01:
> 00002161
> >> >> [   21.568834] kernel: nouveau 0000:03:00.0: DRM: MM: using COPY for
> buffer copies
> >> >> [   21.645206] kernel: nouveau 0000:03:00.0: DRM: allocated
> 1920x1080 fb: 0x70000, bo (____ptrval____)
> >> >> [   21.648681] kernel: fbcon: nouveaudrmfb (fb0) is primary device
> >> >> [   21.837701] kernel: nouveau 0000:03:00.0: [drm] fb0: nouveaudrmfb
> frame buffer device
> >> >> [   21.873290] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
> 0000:03:00.0 on minor 0
> >>
> >> I was looking for you to just run "dmesg", BTW, not read a log file.
> >>
> >> >>
> >> >> lsmod | grep nouveau
> >> >> nouveau              1986560  30
> >> >> mxm_wmi                16384  1 nouveau
> >> >> i2c_algo_bit           16384  1 nouveau
> >> >> drm_ttm_helper         16384  1 nouveau
> >> >> ttm                    73728  2 drm_ttm_helper,nouveau
> >> >> drm_kms_helper        237568  1 nouveau
> >> >> drm                   548864  25
> drm_kms_helper,drm_ttm_helper,ttm,nouveau
> >> >> video                  53248  1 nouveau
> >> >> wmi                    32768  2 mxm_wmi,nouveau
> >> >>
> >> >> I took off ALL extra kernel command paramters - nothing specific to
> nouveau - and I got better results. however - video is still dropping
> frames.
> >>
> >> Perhaps you had a "nomodeset" in there? That would prevent nouveau
> >> from doing anything useful, although I think it'd still load in that
> >> case.
> >>
> >> >>
> >> >> So progress. but still no good.
> >>
> >> Check xorg log to make sure you see NOUVEAU lines, not modeset lines.
> >> If you see modeset lines, make sure you force the nouveau DDX driver
> >> to load. (Some distros think it's funny to prevent it from loading by
> >> default...)
> >>
> >> >>
> >> >> Jerry
> >> >
> >> >
> >> > I see this error:
> >> > nouveau 0000:03:00.0: Direct firmware load for nouveau/nva8_fuc084
> failed
> >> >
> >> > I did apt-file search nva8_fuc084
> >> > and it did not return anything.
> >>
> >> This is for video decoding acceleration (vdpau / va-api). You can set
> >> this up by following the instructions at
> >> https://nouveau.freedesktop.org/VideoAcceleration.html . Note that
> >> it's hardly perfect.
> >>
> >> Cheers,
> >>
> >>   -ilia
> >
> >
> > These were the kernel command line items I removed.
> > acpi=off pci=nomsi
>
> Oh dear. Esp acpi=off is very bad for any post-2010 machine. (The
> cut-off is probably earlier, but def by 2010, ACPI is basically
> required for things to function.) pci=nomsi won't affect things too
> much either way, but I'm not aware of needing to turn off MSI except
> for very odd situations.
>
> >
> > The machine seems happier - now - althought I no longer have sound for
> some reason - but after installing the firmware - CPU % is way down.
>
> Nouveau will have registered a second sound adapter (whose sound would
> get piped out through HDMI / DP ports, if available). Make sure you're
> still using the "right" audio hardware in your settings.
>
> You can also check that pstate file I was talking about earlier to
> adjust the power levels of the GPU (either more power / more heat /
> less battery or less power / less heat / more battery...)
>
> Good luck,
>
>   -ilia
>

yes very weird on the sound. Using analog speakers at the moment
I got no test sound - and no video sound after getting nouveau to run
correctly ????
I was playing analog audio before ?
Does nouveau only do HDMI audio ?

jerry

--000000000000b0334505cd506a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 4:15 PM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Oct 1, 2021 at 3:58 PM Jerry Geis &lt;<a href=3D"mailto:jerry.geis@gmail=
.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Oct 1, 2021 at 3:40 PM Ilia Mirkin &lt;<a href=3D"mailto:imirk=
in@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 1, 2021 at 3:36 PM Jerry Geis &lt;<a href=3D"mailto:je=
rry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Oct 1, 2021 at 3:27 PM Jerry Geis &lt;<a href=3D"mail=
to:jerry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Oct 1, 2021 at 3:20 PM Ilia Mirkin &lt;<a href=3D=
"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.edu</a>&gt=
; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis &lt;<a href=
=3D"mailto:jerry.geis@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt; On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin &lt;<=
a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.mit.e=
du</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis &l=
t;<a href=3D"mailto:jerry.geis@gmail.com" target=3D"_blank">jerry.geis@gmai=
l.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; lsmod | grep nouveau<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; &gt; What dont I have ?<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; nouveau :)<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; Other than that, you got everything...<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; Check dmesg for errors.<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; I see this:<br>
&gt;&gt; &gt;&gt;&gt; &gt; Oct=C2=A0 1 15:11:21 mediaport57 /usr/lib/gdm3/g=
dm-x-session[1546]: (=3D=3D) Matched nouveau as autoconfigured driver 0<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; This is not dmesg. This is some log file. Please look=
 in dmesg.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; Oct=C2=A0 1 15:11:23 mediaport57 /usr/lib/gdm3/g=
dm-x-session[1546]: (**) VESA(0): Using &quot;Shadow Framebuffer&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; X is using the VESA driver because nouveau (nor any o=
ther DRM driver) is loaded.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; So it seems like its loading .... but perhaps it=
s not happy ????<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; What do I do=C2=A0 ?<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Check dmesg for why nouveau didn&#39;t load.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 grep -i nouveau /var/log/dmesg<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A019.934733] kernel: fb0: switching to nouvea=
ufb from VESA VGA<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A020.013197] kernel: nouveau 0000:03:00.0: vg=
aarb: deactivate vga console<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A020.013415] kernel: nouveau 0000:03:00.0: NV=
IDIA GT218 (0a8200b1)<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A020.159472] kernel: nouveau 0000:03:00.0: bi=
os: version 70.18.45.00.00<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A020.162603] kernel: nouveau 0000:03:00.0: fb=
: 512 MiB DDR3<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552858] kernel: nouveau 0000:03:00.0: DR=
M: VRAM: 512 MiB<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552873] kernel: nouveau 0000:03:00.0: DR=
M: GART: 1048576 MiB<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552888] kernel: nouveau 0000:03:00.0: DR=
M: TMDS table version 2.0<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552900] kernel: nouveau 0000:03:00.0: DR=
M: DCB version 4.0<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552911] kernel: nouveau 0000:03:00.0: DR=
M: DCB outp 00: 01000302 00000030<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552924] kernel: nouveau 0000:03:00.0: DR=
M: DCB outp 01: 02000300 00000000<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552937] kernel: nouveau 0000:03:00.0: DR=
M: DCB outp 02: 02011362 00020010<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552950] kernel: nouveau 0000:03:00.0: DR=
M: DCB conn 00: 00001030<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.552961] kernel: nouveau 0000:03:00.0: DR=
M: DCB conn 01: 00002161<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.568834] kernel: nouveau 0000:03:00.0: DR=
M: MM: using COPY for buffer copies<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.645206] kernel: nouveau 0000:03:00.0: DR=
M: allocated 1920x1080 fb: 0x70000, bo (____ptrval____)<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.648681] kernel: fbcon: nouveaudrmfb (fb0=
) is primary device<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.837701] kernel: nouveau 0000:03:00.0: [d=
rm] fb0: nouveaudrmfb frame buffer device<br>
&gt;&gt; &gt;&gt; [=C2=A0 =C2=A021.873290] kernel: [drm] Initialized nouvea=
u 1.3.1 20120801 for 0000:03:00.0 on minor 0<br>
&gt;&gt;<br>
&gt;&gt; I was looking for you to just run &quot;dmesg&quot;, BTW, not read=
 a log file.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; lsmod | grep nouveau<br>
&gt;&gt; &gt;&gt; nouveau=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
986560=C2=A0 30<br>
&gt;&gt; &gt;&gt; mxm_wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 16384=C2=A0 1 nouveau<br>
&gt;&gt; &gt;&gt; i2c_algo_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01638=
4=C2=A0 1 nouveau<br>
&gt;&gt; &gt;&gt; drm_ttm_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384=C2=
=A0 1 nouveau<br>
&gt;&gt; &gt;&gt; ttm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 73728=C2=A0 2 drm_ttm_helper,nouveau<br>
&gt;&gt; &gt;&gt; drm_kms_helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 237568=C2=A0 1 =
nouveau<br>
&gt;&gt; &gt;&gt; drm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0548864=C2=A0 25 drm_kms_helper,drm_ttm_helper,ttm,nouveau<=
br>
&gt;&gt; &gt;&gt; video=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 53248=C2=A0 1 nouveau<br>
&gt;&gt; &gt;&gt; wmi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 32768=C2=A0 2 mxm_wmi,nouveau<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I took off ALL extra kernel command paramters - nothing s=
pecific to nouveau - and I got better results. however - video is still dro=
pping frames.<br>
&gt;&gt;<br>
&gt;&gt; Perhaps you had a &quot;nomodeset&quot; in there? That would preve=
nt nouveau<br>
&gt;&gt; from doing anything useful, although I think it&#39;d still load i=
n that<br>
&gt;&gt; case.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; So progress. but still no good.<br>
&gt;&gt;<br>
&gt;&gt; Check xorg log to make sure you see NOUVEAU lines, not modeset lin=
es.<br>
&gt;&gt; If you see modeset lines, make sure you force the nouveau DDX driv=
er<br>
&gt;&gt; to load. (Some distros think it&#39;s funny to prevent it from loa=
ding by<br>
&gt;&gt; default...)<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Jerry<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I see this error:<br>
&gt;&gt; &gt; nouveau 0000:03:00.0: Direct firmware load for nouveau/nva8_f=
uc084 failed<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I did apt-file search nva8_fuc084<br>
&gt;&gt; &gt; and it did not return anything.<br>
&gt;&gt;<br>
&gt;&gt; This is for video decoding acceleration (vdpau / va-api). You can =
set<br>
&gt;&gt; this up by following the instructions at<br>
&gt;&gt; <a href=3D"https://nouveau.freedesktop.org/VideoAcceleration.html"=
 rel=3D"noreferrer" target=3D"_blank">https://nouveau.freedesktop.org/Video=
Acceleration.html</a> . Note that<br>
&gt;&gt; it&#39;s hardly perfect.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0-ilia<br>
&gt;<br>
&gt;<br>
&gt; These were the kernel command line items I removed.<br>
&gt; acpi=3Doff pci=3Dnomsi<br>
<br>
Oh dear. Esp acpi=3Doff is very bad for any post-2010 machine. (The<br>
cut-off is probably earlier, but def by 2010, ACPI is basically<br>
required for things to function.) pci=3Dnomsi won&#39;t affect things too<b=
r>
much either way, but I&#39;m not aware of needing to turn off MSI except<br=
>
for very odd situations.<br>
<br>
&gt;<br>
&gt; The machine seems happier - now - althought I no longer have sound for=
 some reason - but after installing the firmware - CPU % is way down.<br>
<br>
Nouveau will have registered a second sound adapter (whose sound would<br>
get piped out through HDMI / DP ports, if available). Make sure you&#39;re<=
br>
still using the &quot;right&quot; audio hardware in your settings.<br>
<br>
You can also check that pstate file I was talking about earlier to<br>
adjust the power levels of the GPU (either more power / more heat /<br>
less battery or less power / less heat / more battery...)<br>
<br>
Good luck,<br>
<br>
=C2=A0 -ilia<br></blockquote><div><br></div><div>yes very weird on the soun=
d. Using analog speakers at the moment=C2=A0</div><div>I got no test sound =
- and no video sound after getting nouveau to run correctly ????</div><div>=
I was playing analog audio before ?</div><div>Does nouveau only do HDMI aud=
io ?</div><div><br></div><div>jerry=C2=A0</div></div></div>

--000000000000b0334505cd506a9a--
