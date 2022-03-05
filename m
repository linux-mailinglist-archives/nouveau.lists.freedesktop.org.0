Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A034CE1C1
	for <lists+nouveau@lfdr.de>; Sat,  5 Mar 2022 01:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552C10E206;
	Sat,  5 Mar 2022 00:55:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036F010E206
 for <nouveau@lists.freedesktop.org>; Sat,  5 Mar 2022 00:55:37 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id c1so8815484pgk.11
 for <nouveau@lists.freedesktop.org>; Fri, 04 Mar 2022 16:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5isqwyE6piPzZF4t4Dvgj7kfqSi2jeyJoy4qPZfuaA=;
 b=Iil/0xG/EyQk4EM7beXs94AdC265bmYa3gapLbXJqlosPHIRyJ5k8/xIXh6o6WQSEW
 W7r2O8wS/QR8f4bq19BClEtgDBrAI/WR0/0VsrsKVWu7NqoVU5PSbEdWIacDjupYdYt+
 UgqghEbWM/PLgNZRcxh1v3cfBH5Aa5RANfoyMvSbm/1JWy/maRVC5urEyLuid/qvAWhX
 t9c4RrWodd2p86GppeW0Dl9zjDTObcf2sNjMvnawYtsFRYxMawhZTMflBygpkU6rf5Xj
 8UwG8mtWAwaCjj8bxMBlAnI40m+t7xvyFZj3Yf9uAt9o4pbT/hvZZrenImZMw/3Agnxe
 MqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5isqwyE6piPzZF4t4Dvgj7kfqSi2jeyJoy4qPZfuaA=;
 b=lrDxCBQ5mgR1u2Tj7z0y2whbmZEWckop273oSzFocalyVgxG/KYaTafZyzwj3wQecn
 dFGck0CjtSmXH9G5PwR0uzfYooMHYCfbRKlvXXVpETMnwZydH26bvoFE74P/QcGDn6eq
 Y/keybUbZi+w7UcFB8xx3iMzKzXb2cw8a/3RglZCYR/6jiVQNLEI0i7FVpwKqgRKn5xo
 +ZRSKb3mZgmMdTyHy5WZugmxUby5nQDEXpt0JCGf54kQjQv0z0RgMlrLfsLAbnXHCZhj
 uiWBXNQmAtSJ+RhTUhbfD2Z5eTMjRe5hxj4qFlZPgPHJ2FDKah+R33TrYEBCKVr6Yq4c
 xYeQ==
X-Gm-Message-State: AOAM532DyJdcDYqVOS0asdN3KLou706Qp3SMdMRBdkqEBvra2EKShsbM
 VF3pmdtaVIBob6Ah+QUm6ysY7KfJeMH25sGWGZXo5miP
X-Google-Smtp-Source: ABdhPJwyGnqX4uiTZQFVwkVJI02YQu4NKFpLYuh2nJBv7iYXHp9mWXENgmoFD0VsHs3T2g0Ua2dC/1uO5pxI50ZSZLs=
X-Received: by 2002:a63:4665:0:b0:374:7305:dab4 with SMTP id
 v37-20020a634665000000b003747305dab4mr856903pgk.256.1646441737361; Fri, 04
 Mar 2022 16:55:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMBDoMOXuowh-wrc32FR_O7oucOYBMhAP6hR-T7GjNd8DqUrsQ@mail.gmail.com>
 <CAKb7UvjntPUW_ZHsCq5jn4+L=qToh_13ML79em8yskgsqdFrXQ@mail.gmail.com>
In-Reply-To: <CAKb7UvjntPUW_ZHsCq5jn4+L=qToh_13ML79em8yskgsqdFrXQ@mail.gmail.com>
From: Andre Costa <andre.ocosta@gmail.com>
Date: Fri, 4 Mar 2022 21:55:26 -0300
Message-ID: <CAMBDoMOS56r6XUNRsaB_1W_z+SWdDPKZJtWeV0CwfL2xXtm56w@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: multipart/alternative; boundary="000000000000e61c9c05d96e1633"
Subject: Re: [Nouveau] External monitor support for GTX 1650 (NV167/TU117)
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

--000000000000e61c9c05d96e1633
Content-Type: text/plain; charset="UTF-8"

Hi Ilia,

Thanks for the quick response -- boy, that was fast =) I'll certainly do
that, I just need to revert my current setup to use nouveau again, then
I'll file the bug with the info you suggested. Fingers crossed ;-)

Cheers,
Andre

On Fri, Mar 4, 2022 at 9:16 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Hi Andre,
>
> You're going to be best off filing a bug at
> gitlab.freedesktop.org/drm/nouveau with some details of your setup:
>
> 1. lspci -nn -d 10de:
> 2. Your vbios (/sys/kernel/debug/dri/1/vbios.rom)
> 3. Your monitor's EDID, esp as reported when plugged into nouveau
> (/sys/class/drm/card1-HDMI-1/edid or the appropriate connector)
> 4. dmesg after nouveau is loaded and monitor plugged in
>
> This should allow all the info to be well-contained and accessible to
> everyone who needs to see it.
>
> There aren't any currently outstanding known issues that I can think
> of that would cause your current situation. But plenty of unknown
> ones!
>
> Cheers,
>
>   -ilia
>
> On Fri, Mar 4, 2022 at 7:12 PM Andre Costa <andre.ocosta@gmail.com> wrote:
> >
> > Hi there,
> >
> > I just bought an Acer Nitro 5 (AN515-44) notebook with an AMD Renoir
> iGPU and a GTX 1650 dGPU. I installed Fedora 35 and, for the most part,
> it's working great. The only issue so far is that I cannot use Wayland +
> external monitor with Nouveau -- it does recognize the external monitor,
> but only renders the top half of the screen, the bottom half remains
> (literally) blank.
> >
> > (BTW the HDMI port is wired to the GTX 1650)
> >
> > For the record, I can use the external monitor just fine with Nvidia's
> proprietary driver on X11, but I'd rather use Nouveau if possible.
> >
> > I know support for the NV160 family is still coming up according to the
> feature matrix, so I'll patiently wait. I just wanted to volunteer to do
> some testing on this specific setup if this can help in any way. Just let
> me know.
> >
> > Keep up the great work!
> >
> > Cheers,
> > Andre
>

--000000000000e61c9c05d96e1633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ilia,</div><div><br></div><div>Thanks for the quic=
k response -- boy, that was fast =3D) I&#39;ll certainly do that, I just ne=
ed to revert my current setup to use nouveau again, then I&#39;ll file the =
bug with the info you suggested. Fingers crossed ;-)</div><div><br></div><d=
iv>Cheers,</div><div>Andre<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 9:16 PM Ilia Mir=
kin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Andr=
e,<br>
<br>
You&#39;re going to be best off filing a bug at<br>
<a href=3D"http://gitlab.freedesktop.org/drm/nouveau" rel=3D"noreferrer" ta=
rget=3D"_blank">gitlab.freedesktop.org/drm/nouveau</a> with some details of=
 your setup:<br>
<br>
1. lspci -nn -d 10de:<br>
2. Your vbios (/sys/kernel/debug/dri/1/vbios.rom)<br>
3. Your monitor&#39;s EDID, esp as reported when plugged into nouveau<br>
(/sys/class/drm/card1-HDMI-1/edid or the appropriate connector)<br>
4. dmesg after nouveau is loaded and monitor plugged in<br>
<br>
This should allow all the info to be well-contained and accessible to<br>
everyone who needs to see it.<br>
<br>
There aren&#39;t any currently outstanding known issues that I can think<br=
>
of that would cause your current situation. But plenty of unknown<br>
ones!<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br>
<br>
On Fri, Mar 4, 2022 at 7:12 PM Andre Costa &lt;<a href=3D"mailto:andre.ocos=
ta@gmail.com" target=3D"_blank">andre.ocosta@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi there,<br>
&gt;<br>
&gt; I just bought an Acer Nitro 5 (AN515-44) notebook with an AMD Renoir i=
GPU and a GTX 1650 dGPU. I installed Fedora 35 and, for the most part, it&#=
39;s working great. The only issue so far is that I cannot use Wayland + ex=
ternal monitor with Nouveau -- it does recognize the external monitor, but =
only renders the top half of the screen, the bottom half remains (literally=
) blank.<br>
&gt;<br>
&gt; (BTW the HDMI port is wired to the GTX 1650)<br>
&gt;<br>
&gt; For the record, I can use the external monitor just fine with Nvidia&#=
39;s proprietary driver on X11, but I&#39;d rather use Nouveau if possible.=
<br>
&gt;<br>
&gt; I know support for the NV160 family is still coming up according to th=
e feature matrix, so I&#39;ll patiently wait. I just wanted to volunteer to=
 do some testing on this specific setup if this can help in any way. Just l=
et me know.<br>
&gt;<br>
&gt; Keep up the great work!<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Andre<br>
</blockquote></div>

--000000000000e61c9c05d96e1633--
