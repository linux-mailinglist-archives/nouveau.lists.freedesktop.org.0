Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6A4465AA
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 16:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596B06E857;
	Fri,  5 Nov 2021 15:25:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AEE6E857
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 15:25:49 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id w9so2366740qtk.13
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3nSFPzWX2bnFLYSqaf/wsVIjfFPRjPaRYR+oVy9/HBU=;
 b=GQODHuq7B6J0OY7vkZg786yoE9k6bxTXVztumjAb91RskWidLfQurG0h7OYbclbCuW
 dpok6uQSRk8XfYNLHzqrvVtxCYfLK7IRj9FtmdOjmND0+jwyHgk0KOm+GNb8HXsNhkO2
 8tcI6xWogv3nAIN848sycp1Lj6f1sjhoiAorGX0DMfCaUDFgZicNuCyL2N82498I352/
 /BsFkhBsAcsjL9Sma+Sg/kZ6YQKaC7H405ycL1h2V61K5bAgza1lRdIlHfIAFx9Qi4nC
 ubLc0qcReC1QtP6Nk2UCLB3wRBdVLASUjLgczS4JhJR0dIOGHzSyzqwxlPp9TWWofAmO
 QwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3nSFPzWX2bnFLYSqaf/wsVIjfFPRjPaRYR+oVy9/HBU=;
 b=lm2QC+nzU0qDi7SLlUa+i85QrCpKO+RCbLCFR+tJad6+/Jn4LWma9F5obzzyWar5te
 wCiuu6xzVNA2JihUpm5L9jerFuGVmUU8/suNq/6n6Jw4JeervYhsLzNsLSzaluFY5yEC
 M2i/QTRDCEUuoXKHxmLDmkGq8WxupPhp5J7LsXfSKRF8pfyYm9Mdg+eLb10V3MBIuRhV
 N+lmNVA08uyIGGkJ1tD0btl3kf/ixdlbEXdOCiw3dl4pXjUfPcUTXQUicOkjjyHB3BZL
 h4bnsCI0RLrIQgBEMqZNsoW+IBKYuUHZnO/xJk5xfuIf30CzCaA9MG5CPdubhq4U0wk1
 yaTA==
X-Gm-Message-State: AOAM532jS2B+Nk50b2NtxKi2I3mvzf6BnfQxQm3uLXmbCDmL9NkZmrff
 dSdv8k2OkuRyJ8Dm0FwPCl4f1IXceU4r824U6bQln624ONg=
X-Google-Smtp-Source: ABdhPJwlsGbnUxKFDN2nbQ8LtA7Max9lUshkNCUkECF17O1s2oI33ZyYhAAzw2xuku5Qc1xumq4P7JWFX75Sk6fdwk8=
X-Received: by 2002:a05:622a:15cb:: with SMTP id
 d11mr26285121qty.4.1636125948438; 
 Fri, 05 Nov 2021 08:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B7QAn9LV18d2HEWGqzvM3x4NcYj5rpvcXq=YsK-ozcoMQ@mail.gmail.com>
 <CAKb7Uvh63kpzmvKMQs7pnaWKkBVFGfO82_ZQdz-TKs0=hXuzWw@mail.gmail.com>
In-Reply-To: <CAKb7Uvh63kpzmvKMQs7pnaWKkBVFGfO82_ZQdz-TKs0=hXuzWw@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 5 Nov 2021 11:25:37 -0400
Message-ID: <CABr8-B5du61qNV1hqbMzFeqTegzhyvHTzKBj4k1gsgRE60FkhQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: multipart/alternative; boundary="000000000000f6ebc805d00c41e7"
Subject: Re: [Nouveau] Ubuntu 20.04 and vlc
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--000000000000f6ebc805d00c41e7
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 11:02 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Hey Jerry,
>
> I'd look in the kernel log to see what's up. Perhaps the GPU hangs?
>
> Cheers,
>
>   -ilia
>
> On Fri, Nov 5, 2021 at 10:42 AM Jerry Geis <jerry.geis@gmail.com> wrote:
> >
> > Hi All,
> >
> > I am using Ubuntu 20.04 with VLC... normally the box boots up runs an
> plays videos just fien with about 20% usage for VLC (celeron and or intel
> Atom hardware).
> > After some time - day or two of playing videos. Something happens.
> > The CPU usage jumps way up like 120% kind of usage.  Like the vdpau
> stuff is no longer working.
> >
> > Is this a know issue ?
> > What should I look for  ?
> > What can I provide to help ?
> >
> >  Intel(R) Atom(TM) CPU D525   @ 1.80GHz
> > 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev
> a2)
> >
> > Thanks
> >
> > Jerry
>

dmesg log
   37.212407] kernel: bpfilter: Loaded bpfilter_umh pid 794
[   37.214069] unknown: Started bpfilter
[   38.778000] kernel: RTL8211B Gigabit Ethernet r8169-0-458:00: attached
PHY driver (mii_bus:phy_addr=r8169-0-458:00, irq=MAC)
[   38.856101] kernel: r8169 0000:04:0b.0 enp4s11: Link is Down
[   41.275140] kernel: r8169 0000:04:0b.0 enp4s11: Link is Up - 1Gbps/Full
- flow control off
[   41.275192] kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp4s11: link becomes
ready


/var/log/syslog
Nov  5 11:11:50 mediaport44 smboot.sh[16157]: libva info: VA-API version
1.7.0
Nov  5 11:11:50 mediaport44 smboot.sh[16157]: libva info: Trying to open
/usr/lib/x86_64-linux-gnu/dri/nouveau_drv_video.so
Nov  5 11:11:50 mediaport44 smboot.sh[16157]: libva info: Found init
function __vaDriverInit_1_7
Nov  5 11:11:50 mediaport44 smboot.sh[16157]: libva info: va_openDriver()
returns 0

if I reboot the box - and look again at syslog it shows the same thing
above.

Not seeing any  errors or anything.

Thoughts?

 Jerry

--000000000000f6ebc805d00c41e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 11:02 AM Ilia =
Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hey =
Jerry,<br>
<br>
I&#39;d look in the kernel log to see what&#39;s up. Perhaps the GPU hangs?=
<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br>
<br>
On Fri, Nov 5, 2021 at 10:42 AM Jerry Geis &lt;<a href=3D"mailto:jerry.geis=
@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt; I am using Ubuntu 20.04 with VLC... normally the box boots up runs an =
plays videos just fien with about 20% usage for VLC (celeron and or intel A=
tom hardware).<br>
&gt; After some time - day or two of playing videos. Something happens.<br>
&gt; The CPU usage jumps way up like 120% kind of usage.=C2=A0 Like the vdp=
au stuff is no longer working.<br>
&gt;<br>
&gt; Is this a know issue ?<br>
&gt; What should I look for=C2=A0 ?<br>
&gt; What can I provide to help ?<br>
&gt;<br>
&gt;=C2=A0 Intel(R) Atom(TM) CPU D525=C2=A0 =C2=A0@ 1.80GHz<br>
&gt; 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev=
 a2)<br>
&gt;<br>
&gt; Thanks<br>
&gt;<br>
&gt; Jerry<br></blockquote><div><br></div><div>dmesg log=C2=A0</div>=C2=A0 =
=C2=A037.212407] kernel: bpfilter: Loaded bpfilter_umh pid 794<br>[ =C2=A0 =
37.214069] unknown: Started bpfilter<br>[ =C2=A0 38.778000] kernel: RTL8211=
B Gigabit Ethernet r8169-0-458:00: attached PHY driver (mii_bus:phy_addr=3D=
r8169-0-458:00, irq=3DMAC)<br>[ =C2=A0 38.856101] kernel: r8169 0000:04:0b.=
0 enp4s11: Link is Down<br>[ =C2=A0 41.275140] kernel: r8169 0000:04:0b.0 e=
np4s11: Link is Up - 1Gbps/Full - flow control off<br>[ =C2=A0 41.275192] k=
ernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp4s11: link becomes ready<br><div><=
br></div><div><br></div><div>/var/log/syslog</div><div>Nov =C2=A05 11:11:50=
 mediaport44 smboot.sh[16157]: libva info: VA-API version 1.7.0<br>Nov =C2=
=A05 11:11:50 mediaport44 smboot.sh[16157]: libva info: Trying to open /usr=
/lib/x86_64-linux-gnu/dri/nouveau_drv_video.so<br>Nov =C2=A05 11:11:50 medi=
aport44 smboot.sh[16157]: libva info: Found init function __vaDriverInit_1_=
7<br>Nov =C2=A05 11:11:50 mediaport44 smboot.sh[16157]: libva info: va_open=
Driver() returns 0<br></div><div><br></div><div>if I reboot the box - and l=
ook again at syslog it shows the same thing above.</div><div><br></div><div=
>Not seeing any=C2=A0 errors or anything.</div><div><br></div><div>Thoughts=
?=C2=A0</div><div><br></div><div>=C2=A0Jerry</div><div><br></div></div></di=
v>

--000000000000f6ebc805d00c41e7--
