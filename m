Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FB619E35
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 18:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51D10E955;
	Fri,  4 Nov 2022 17:13:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA2910E954
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 17:13:28 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-13be3ef361dso6171262fac.12
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=svVdbij8yF0h49uHwRcVZt3Iih5mNTutb7BOnT2Bef8=;
 b=hworaYhFNWbXMBTKGX3EsH7m1SfGFIJ/qVVc2rfBfn1jzwqNzRhxFFtpQaU0JSKyru
 6An5e40IQ7DLgqDaaWzAqKbwFqinyC74mK269smh3erQg28JXsngwYxeca1gena4qN5t
 tqnlePzPA8lw1wmozTsiwesFdyjSGnb2MJAAVsgTTWrYKcA3fsA9YuvnhSEp5K42zH/5
 aAzhu85S5fKaW4r4JD2qBd4KGDQNb9P3LD3aKoxxUXjhqNW02O4yL1O++ZNft1RwEKK7
 3Qp8uEXPhrBExrRteHtC7npqJv8NK+2nj4FlYnezJSGA+Jg4X4T0OQlmGuYzMuijQj0U
 vKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=svVdbij8yF0h49uHwRcVZt3Iih5mNTutb7BOnT2Bef8=;
 b=O1Z32KfE/Jb7Z04g2DHQSRD8OE5tnQLbE16EWkX8OkORYOf6NKplou/jdSxKjUUwOe
 5VdzcvSJVc6uMlK6/oTaG75xOjXErz0R1M2BXGXUxJadCeKSMTCawmw6MyvG6T1Fj2rb
 QC/2a24f8sEg5Vy1BKZ1Fn3TUbKWrpCtaNQD+46eu3ROYg7uSvEg63uN5F0TECkvlM/d
 CXTdvkByGvvgYXwLB0ebChvr9lkKp0016H/EZNo8/sFfJPAqRO4e+5RbBtr+RLhCwPDB
 K7K2MNpW82b5BKG/G/v4gaqMNAWZf1jW2HL9j/bwFG2cUH9E843Hm2rJbeHxElThma+v
 DFow==
X-Gm-Message-State: ACrzQf1bLXT6okM8ymIHMCPo0XoCgEiM01Uc3T5HkyiCSfMVVTfA8zp7
 CQcHu/lFvSEryUaDdEC3ewyPIGLeF6P+WesDTXC9o0mgyXKcnw==
X-Google-Smtp-Source: AMsMyM6VSj6VVTvWKNXCfOb+MFpJsFpb17Sc+n1oc+zNhbjma7BLFT62BVD7TGUwcPu3S/BO7/vA/HImu2L5v6H1ydk=
X-Received: by 2002:a05:6870:5596:b0:13c:831a:f150 with SMTP id
 n22-20020a056870559600b0013c831af150mr22040500oao.234.1667582005491; Fri, 04
 Nov 2022 10:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
 <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
 <CAEFVmO+pbgKQua5oAV6wP19AwyQVgvXT1sV=6pb=ejnq2F9Oog@mail.gmail.com>
 <CAEFVmOKdfPZBuU2V=iGh4k9QtrSxC0y2NTnSChHaZVkb=DMLDQ@mail.gmail.com>
 <CAKb7UvipWtb=T0WaB+R2DvKGozXAtgCs8z=RSskbyLcMpSpRSQ@mail.gmail.com>
In-Reply-To: <CAKb7UvipWtb=T0WaB+R2DvKGozXAtgCs8z=RSskbyLcMpSpRSQ@mail.gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 18:13:14 +0100
Message-ID: <CAEFVmOL9t7g3Lk_CtnprExPtnTd2-MpZepuzTLnbiRjqwNY+Wg@mail.gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000123a5605eca831a6"
Subject: Re: [Nouveau] TV Out question
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

--000000000000123a5605eca831a6
Content-Type: text/plain; charset="UTF-8"

1) Some people here say: " Scrap everything already stated. The old Nvidia
cards with the mini DIN analog video out can ONLY do 480i output. 240p is
not an option."

Source:
https://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_output_240p/

But I guess that is due to using Windows and NVIDIA driver.

2) Here:
https://www.reddit.com/r/retrogaming/comments/40dv00/240p_signal_from_svideo_port_on_old_video_card/
someone says: "240p doesn't actually exist, it's really a trick that uses a
non-standard 480i signal to cause the alternating fields line up the
scanlines instead of offsetting them. "

So I guess it could be done by sending non-standard 480i signal.

On Fri, Nov 4, 2022 at 6:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin <luke.satin@gmail.com> wrote:
> >
> > Hello, sorry fo the typos. Wanted to catch you before the weekend, to
> get some hints for upcoming work.
> >
> > I'm back at PC.
> >
> > Does your driver support switching to 240p in NTSC and 288p in PAL on
> the go via xrandr, for example?
> >
> > If not, can I find some relevant part of code in your repository where
> to implement that?
>
>
> https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> + tvmodesnv17.c
>
> There's definitely a lot of hard-coding going on. A lot of the
> pre-nv50 display code is from This code is (likely) originally from
> https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src but I
> can't immediately find the TV code in there. But perhaps it's there
> anyways, I only spent about 30s looking for it.
>
> I don't remember by now, but there _might_ be a kms property (which
> should get piped through to xrandr properties) which allows you to
> change this live?
>
> > Some info I found regarding 240p and that it is a part of NTSC:
> https://en.wikipedia.org/wiki/Low-definition_television
> >
> > TV with S-Video mostly supports 480i and 240p as well. So the current
> issue is outputting that via TV out.
> >
> > My current configuration looks like this:
> > TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis)
> 0mm x 0mm
> >    720x480       59.94 +
> >    1024x768      59.94
> >    800x600       59.94
> >    720x576       59.94
> >    640x480       59.94
> >    400x300       59.94
> >    320x240       59.93
> >    320x200       59.94
> >    768x576       50.00
> >    360x200       60.00
> >    360x240       60.00
> >    640x240       60.00
> >    SR-1_240x224@60.10  60.10*
> >
> > I see I have created 240x224 (I need to fix that), but even 320x240 does
> not work. It always stays at 480i.
>
> Did you try 360x240? I have no idea though, sorry. I was just happy
> when the S-Video worked at all. It could require further modifications
> to how we configure those registers.
>

--000000000000123a5605eca831a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">1) Some people here say: &quot;

<span style=3D"color:rgb(28,28,28);font-family:&quot;Noto Sans&quot;,Arial,=
sans-serif;font-size:14px">Scrap everything already stated. The old Nvidia =
cards with the mini DIN analog video out can ONLY do 480i output. 240p is n=
ot an option.&quot;</span><div><br></div><div><div>Source: <a href=3D"https=
://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_output_240=
p/">https://www.reddit.com/r/crtgaming/comments/a9k85n/old_nvidia_geforce_o=
utput_240p/</a><br></div></div><div><br></div><div>But I guess that is due =
to using Windows and NVIDIA driver.</div><div><br></div><div>2) Here:=C2=A0=
<a href=3D"https://www.reddit.com/r/retrogaming/comments/40dv00/240p_signal=
_from_svideo_port_on_old_video_card/">https://www.reddit.com/r/retrogaming/=
comments/40dv00/240p_signal_from_svideo_port_on_old_video_card/</a></div><d=
iv>someone says: &quot;<span style=3D"color:rgb(28,28,28);font-family:&quot=
;Noto Sans&quot;,Arial,sans-serif;font-size:14px">240p doesn&#39;t actually=
 exist, it&#39;s really a trick that uses a non-standard 480i signal to cau=
se the alternating fields line up the scanlines instead of offsetting them.=
</span><span style=3D"color:rgb(28,28,28);font-family:&quot;Noto Sans&quot;=
,Arial,sans-serif;font-size:14px">=C2=A0&quot;</span></div><div><span style=
=3D"color:rgb(28,28,28);font-family:&quot;Noto Sans&quot;,Arial,sans-serif;=
font-size:14px"><br></span></div><div><span style=3D"color:rgb(28,28,28);fo=
nt-family:&quot;Noto Sans&quot;,Arial,sans-serif;font-size:14px">So I guess=
 it could be done by sending non-standard 480i signal.=C2=A0</span></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Nov 4, 2022 at 6:06 PM Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum=
.mit.edu">imirkin@alum.mit.edu</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Fri, Nov 4, 2022 at 12:56 PM Lukas Satin &=
lt;<a href=3D"mailto:luke.satin@gmail.com" target=3D"_blank">luke.satin@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello, sorry fo the typos. Wanted to catch you before the weekend, to =
get some hints for upcoming work.<br>
&gt;<br>
&gt; I&#39;m back at PC.<br>
&gt;<br>
&gt; Does your driver support switching to 240p in NTSC and 288p in PAL on =
the go via xrandr, for example?<br>
&gt;<br>
&gt; If not, can I find some relevant part of code in your repository where=
 to implement that?<br>
<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouvea=
u/dispnv04/tvnv17.c" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c</a><br>
+ tvmodesnv17.c<br>
<br>
There&#39;s definitely a lot of hard-coding going on. A lot of the<br>
pre-nv50 display code is from This code is (likely) originally from<br>
<a href=3D"https://cgit.freedesktop.org/xorg/driver/xf86-video-nv/tree/src"=
 rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/xorg/dri=
ver/xf86-video-nv/tree/src</a> but I<br>
can&#39;t immediately find the TV code in there. But perhaps it&#39;s there=
<br>
anyways, I only spent about 30s looking for it.<br>
<br>
I don&#39;t remember by now, but there _might_ be a kms property (which<br>
should get piped through to xrandr properties) which allows you to<br>
change this live?<br>
<br>
&gt; Some info I found regarding 240p and that it is a part of NTSC: <a hre=
f=3D"https://en.wikipedia.org/wiki/Low-definition_television" rel=3D"norefe=
rrer" target=3D"_blank">https://en.wikipedia.org/wiki/Low-definition_televi=
sion</a><br>
&gt;<br>
&gt; TV with S-Video mostly supports 480i and 240p as well. So the current =
issue is outputting that via TV out.<br>
&gt;<br>
&gt; My current configuration looks like this:<br>
&gt; TV-1 connected 240x224+0+0 (normal left inverted right x axis y axis) =
0mm x 0mm<br>
&gt;=C2=A0 =C2=A0 720x480=C2=A0 =C2=A0 =C2=A0 =C2=A059.94 +<br>
&gt;=C2=A0 =C2=A0 1024x768=C2=A0 =C2=A0 =C2=A0 59.94<br>
&gt;=C2=A0 =C2=A0 800x600=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 720x576=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 640x480=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 400x300=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 320x240=C2=A0 =C2=A0 =C2=A0 =C2=A059.93<br>
&gt;=C2=A0 =C2=A0 320x200=C2=A0 =C2=A0 =C2=A0 =C2=A059.94<br>
&gt;=C2=A0 =C2=A0 768x576=C2=A0 =C2=A0 =C2=A0 =C2=A050.00<br>
&gt;=C2=A0 =C2=A0 360x200=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 360x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 640x240=C2=A0 =C2=A0 =C2=A0 =C2=A060.00<br>
&gt;=C2=A0 =C2=A0 SR-1_240x224@60.10=C2=A0 60.10*<br>
&gt;<br>
&gt; I see I have created 240x224 (I need to fix that), but even 320x240 do=
es not work. It always stays at 480i.<br>
<br>
Did you try 360x240? I have no idea though, sorry. I was just happy<br>
when the S-Video worked at all. It could require further modifications<br>
to how we configure those registers.<br>
</blockquote></div>

--000000000000123a5605eca831a6--
