Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95C41F4FB
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 20:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540F389BD5;
	Fri,  1 Oct 2021 18:29:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618089BD5
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 18:29:29 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id n6so6122495qvp.7
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of/na3hP6e/RLJntcHC5fr2B7mdQA1Aax8fZ4sZDYRE=;
 b=Wn7dj6hTu9BS2UVeTrk7sXBCxPixa7lWs8ZvmIJP+YgGBUFSzgulsQ9GwC+6SKfgC8
 3fdKVe10vuuVf+Z8LR34mmlz6YcLabXgDDErj5NXz9bCCunrW2xglRp1YWLoYpESgaWJ
 QOK7npB02PQOrYJ3wiYuuoIdciXAt6hW3594a4fvPdu2mDPfs4mAeuoQxJp/1yGPzRgX
 w51Cxc3fyuI+D8zov6+M1/HSi+hOU4AnufN6DsF95rvPpJTSRIu/dYjKgv2JLkAtp7jP
 2DdAQXQXfvNpPSEiwqFfmq2ZM2sNFq2wbYvGNgnlB1i4yssspJUYVNUN4DLAeTBpQg1s
 SwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of/na3hP6e/RLJntcHC5fr2B7mdQA1Aax8fZ4sZDYRE=;
 b=MJ36nyfzz35tCe57YG/lBz0jUcVnPz4j3KhyI8SaPeXy+u0aywOMm3emErZi3TorAE
 2Wwstiuzuxs5vXXFJi2v9/mmHreBAFKDTjPVRBPxrti1zdf1hxvS+xtVnNeWlPjZ0OIM
 0clqQ2vakHi3plpjXUGkLYyCF9qbLF5qTJVvySe40dzJMtrjSU68qWlRSHC5IL/UkTM9
 QM9vvW3D9E5q0tsGjNUymEo28qkLvEjdHZxUFjIGg8oPtrfOwwrFEkBrhb1n5VNEY6sg
 3QeN4/PqbmQvDlTRFPhgACWpUWH2+RhLHqmvbFqRkH3YdOrEwFgIhmLKpvhxWPURskkJ
 amWA==
X-Gm-Message-State: AOAM5319ueGpWJaFt+SJ8bfvdrY1nMxgkFH7IZVeII5etNU9S7ZBYXbr
 YtpRE/3QJlYWShL5hmLrPuL1PiUiaCrkL1EP9A/jPmBJ8qM=
X-Google-Smtp-Source: ABdhPJxRE/6tq2ZE4X7Q4C20ECXbop71+zTU6TCGyeKqkOyOfKIENBoeP+29OPv4PeCIE4KhiIi25xP39VsyNt3sxoo=
X-Received: by 2002:a0c:dd8e:: with SMTP id v14mr10354723qvk.51.1633112968180; 
 Fri, 01 Oct 2021 11:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
In-Reply-To: <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 14:29:09 -0400
Message-ID: <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000058b6e905cd4ebe53"
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

--00000000000058b6e905cd4ebe53
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 11:05 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> You can check the perf level your GPU is at, and potentially adjust it.
>
> cat /sys/kernel/debug/dri/0/pstate
>
> This should give a list of levels like "xx: stuff", with the "AC"
> level being the current settings. Echo'ing any one of the xx's into
> that file will attempt to switch to a different performance level.
> Sometimes it works, other times it kills the GPU until you reboot. Use
> with care.
>
> Cheers,
>
>   -ilia
>
> On Fri, Oct 1, 2021 at 11:01 AM Jerry Geis <jerry.geis@gmail.com> wrote:
> >
> > I am trying to get Nouveau running and also playing video.
> > lspci | grep VGA shows
> > 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev
> a2)
> >
> > syslog shows nouveau loaded
> >
> > But video performance is SLOW - dropping frames.
> >
> > have I missed something ?
> >
> > How do I get better video performance ?
> >
> > Thanks,
> >
> > Jerry
>


Thanks perhaps this is part of the problem:
 ls -l /sys/kernel/debug/dri/
total 0

Do I not have a package installed ?
apt list --installed | grep dri

WARNING: apt does not have a stable CLI interface. Use with caution in
scripts.

i965-va-driver/focal,now 2.4.0-0ubuntu1 amd64 [installed,automatic]
intel-media-va-driver/focal,now 20.1.1+dfsg1-1 amd64 [installed,automatic]
libgl1-mesa-dri/now 21.0.3-0ubuntu0.3~20.04.1 amd64 [installed,upgradable
to: 21.0.3-0ubuntu0.3~20.04.2]
libreoffice-base-drivers/focal-updates,now 1:6.4.7-0ubuntu0.20.04.1 amd64
[installed,automatic]
libxcb-dri2-0/focal,now 1.14-2 amd64 [installed,automatic]
libxcb-dri3-0/focal,now 1.14-2 amd64 [installed,automatic]
mesa-va-drivers/now 21.0.3-0ubuntu0.3~20.04.1 amd64 [installed,upgradable
to: 21.0.3-0ubuntu0.3~20.04.2]
mesa-vdpau-drivers/now 21.0.3-0ubuntu0.3~20.04.1 amd64
[installed,upgradable to: 21.0.3-0ubuntu0.3~20.04.2]
mesa-vulkan-drivers/now 21.0.3-0ubuntu0.3~20.04.1 amd64
[installed,upgradable to: 21.0.3-0ubuntu0.3~20.04.2]
printer-driver-pnm2ppa/focal,now 1.13+nondbs-0ubuntu6 amd64
[installed,automatic]
ubuntu-drivers-common/focal-updates,now 1:0.9.0~0.20.04.1 amd64
[installed,automatic]
va-driver-all/focal,now 2.7.0-2 amd64 [installed,automatic]
vdpau-driver-all/focal,now 1.3-1ubuntu2 amd64 [installed,automatic]
vdpau-va-driver/now 0.7.4-7 amd64 [installed,local]

Jerry

--00000000000058b6e905cd4ebe53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div dir=3D"ltr"></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 11:=
05 AM Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.=
mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">You can check the perf level your GPU is at, and potentially adjust =
it.<br>
<br>
cat /sys/kernel/debug/dri/0/pstate<br>
<br>
This should give a list of levels like &quot;xx: stuff&quot;, with the &quo=
t;AC&quot;<br>
level being the current settings. Echo&#39;ing any one of the xx&#39;s into=
<br>
that file will attempt to switch to a different performance level.<br>
Sometimes it works, other times it kills the GPU until you reboot. Use<br>
with care.<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br>
<br>
On Fri, Oct 1, 2021 at 11:01 AM Jerry Geis &lt;<a href=3D"mailto:jerry.geis=
@gmail.com" target=3D"_blank">jerry.geis@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I am trying to get Nouveau running and also playing video.<br>
&gt; lspci | grep VGA shows<br>
&gt; 03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev=
 a2)<br>
&gt;<br>
&gt; syslog shows nouveau loaded<br>
&gt;<br>
&gt; But video performance is SLOW - dropping frames.<br>
&gt;<br>
&gt; have I missed something ?<br>
&gt;<br>
&gt; How do I get better video performance ?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Jerry<br></blockquote><div><br></div><div><br></div><div>Thanks perhap=
s this is part of the problem:</div>=C2=A0ls -l /sys/kernel/debug/dri/<br>t=
otal 0<br><div><br></div><div>Do I not have a package installed ?</div><div=
>apt list --installed | grep dri<br><br>WARNING: apt does not have a stable=
 CLI interface. Use with caution in scripts.<br><br>i965-va-driver/focal,no=
w 2.4.0-0ubuntu1 amd64 [installed,automatic]<br>intel-media-va-driver/focal=
,now 20.1.1+dfsg1-1 amd64 [installed,automatic]<br>libgl1-mesa-dri/now 21.0=
.3-0ubuntu0.3~20.04.1 amd64 [installed,upgradable to: 21.0.3-0ubuntu0.3~20.=
04.2]<br>libreoffice-base-drivers/focal-updates,now 1:6.4.7-0ubuntu0.20.04.=
1 amd64 [installed,automatic]<br>libxcb-dri2-0/focal,now 1.14-2 amd64 [inst=
alled,automatic]<br>libxcb-dri3-0/focal,now 1.14-2 amd64 [installed,automat=
ic]<br>mesa-va-drivers/now 21.0.3-0ubuntu0.3~20.04.1 amd64 [installed,upgra=
dable to: 21.0.3-0ubuntu0.3~20.04.2]<br>mesa-vdpau-drivers/now 21.0.3-0ubun=
tu0.3~20.04.1 amd64 [installed,upgradable to: 21.0.3-0ubuntu0.3~20.04.2]<br=
>mesa-vulkan-drivers/now 21.0.3-0ubuntu0.3~20.04.1 amd64 [installed,upgrada=
ble to: 21.0.3-0ubuntu0.3~20.04.2]<br>printer-driver-pnm2ppa/focal,now 1.13=
+nondbs-0ubuntu6 amd64 [installed,automatic]<br>ubuntu-drivers-common/focal=
-updates,now 1:0.9.0~0.20.04.1 amd64 [installed,automatic]<br>va-driver-all=
/focal,now 2.7.0-2 amd64 [installed,automatic]<br>vdpau-driver-all/focal,no=
w 1.3-1ubuntu2 amd64 [installed,automatic]<br>vdpau-va-driver/now 0.7.4-7 a=
md64 [installed,local]<br></div><div><br></div><div>Jerry=C2=A0</div></div>=
</div>

--00000000000058b6e905cd4ebe53--
