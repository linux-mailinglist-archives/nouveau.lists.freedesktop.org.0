Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084A4CE29A
	for <lists+nouveau@lfdr.de>; Sat,  5 Mar 2022 05:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C2B10EC27;
	Sat,  5 Mar 2022 04:26:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8886A10EC27
 for <nouveau@lists.freedesktop.org>; Sat,  5 Mar 2022 04:26:55 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so9703378pjb.0
 for <nouveau@lists.freedesktop.org>; Fri, 04 Mar 2022 20:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Bz8DpP6NCHRslFA7ELRQyKbcaT96zofovGm/etrppg=;
 b=pJU8Wx+bJzh6U7En5kQGrYvK/xbz3Qgt18YCWssWmy4agVKPWieBidPF2dHjNWCtqb
 dLstPB4lZx/RwP8+zNyb50SiCHHBK/RIgoQBqi8Vpr5yR76q5CQxvBRhJxNSu7rk6/u6
 gn20bHhby4cpA1ba1jC+cw6PDUAbqi0HKdYpY8O+oIy3xtSG9TSw0Pg2glArYJgVL0so
 m9UZoqwbBj7KqGMWsBZb6tyJMalXEv3SSK9jkigXU6CFspjvwelJZisSYy05aS/cFkTX
 MtpMRbqwLjJjxnxphbytj392SP3+FegK7MgifS6QzYyuSLHSa384SZCtLsE/I5wAXvmM
 XaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Bz8DpP6NCHRslFA7ELRQyKbcaT96zofovGm/etrppg=;
 b=MsFTLIp+HDAXU6fKkiYglOF5iq5ZN4TPhljiLpyz8ETlGSJFDzf23aGkNFtidDGoFd
 y7fYjrm3in2bg7lnKd+tp/q2L6CkqoRLzohCupULwrqjCeZNBqnB+ihcBSK/0MOwKhDy
 MmfZdZWNaS7gxVf0o0u5id+Rd3UYIBxFNcrKtF1lMxSJ1w9wgXp87pyH7ekkFDXwWS9k
 x5U/Eci5i4l/VP3hKmilNNFG1GyppEVGOGM+ytjmbt5ZNLRqTZFYBZIiLoMkeOxleFR/
 eH8AfXBMIF91P1tbXW+VSvdFDcKudZrZLKq3eqqpsh7/mgTvSpVImcsgDFwk4fq4Ncd6
 NtPQ==
X-Gm-Message-State: AOAM533BTg/l41Hx0cb5xB49xK+Ns0UyCEo+rx7dbw/yBb3qagqlOWuH
 V0byKvVWdlB2A/G1i/TbbXl1KJvpILf2i/+kL0o=
X-Google-Smtp-Source: ABdhPJyGYx9eYgnAlFtSimp6VCPNJ88A4K4im1JXrhSzPAMSnMOfoUbl3pIpyaz9Jf2c+fGvVKoHAXZXDNyaJDVICoU=
X-Received: by 2002:a17:902:a60d:b0:14f:b781:ccd7 with SMTP id
 u13-20020a170902a60d00b0014fb781ccd7mr1982450plq.2.1646454414967; Fri, 04 Mar
 2022 20:26:54 -0800 (PST)
MIME-Version: 1.0
References: <CAMBDoMOXuowh-wrc32FR_O7oucOYBMhAP6hR-T7GjNd8DqUrsQ@mail.gmail.com>
 <CAKb7UvjntPUW_ZHsCq5jn4+L=qToh_13ML79em8yskgsqdFrXQ@mail.gmail.com>
 <CAMBDoMOS56r6XUNRsaB_1W_z+SWdDPKZJtWeV0CwfL2xXtm56w@mail.gmail.com>
In-Reply-To: <CAMBDoMOS56r6XUNRsaB_1W_z+SWdDPKZJtWeV0CwfL2xXtm56w@mail.gmail.com>
From: Andre Costa <andre.ocosta@gmail.com>
Date: Sat, 5 Mar 2022 01:26:43 -0300
Message-ID: <CAMBDoMM2o8SN7dD6M_UP+rSvP3uSGVeCe1Uoc50MWM_neQ1PAg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: multipart/alternative; boundary="0000000000008b081805d9710a37"
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

--0000000000008b081805d9710a37
Content-Type: text/plain; charset="UTF-8"

Created issue #162 <https://gitlab.freedesktop.org/drm/nouveau/-/issues/162>
.

On Fri, Mar 4, 2022 at 9:55 PM Andre Costa <andre.ocosta@gmail.com> wrote:

> Hi Ilia,
>
> Thanks for the quick response -- boy, that was fast =) I'll certainly do
> that, I just need to revert my current setup to use nouveau again, then
> I'll file the bug with the info you suggested. Fingers crossed ;-)
>
> Cheers,
> Andre
>
> On Fri, Mar 4, 2022 at 9:16 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
>> Hi Andre,
>>
>> You're going to be best off filing a bug at
>> gitlab.freedesktop.org/drm/nouveau with some details of your setup:
>>
>> 1. lspci -nn -d 10de:
>> 2. Your vbios (/sys/kernel/debug/dri/1/vbios.rom)
>> 3. Your monitor's EDID, esp as reported when plugged into nouveau
>> (/sys/class/drm/card1-HDMI-1/edid or the appropriate connector)
>> 4. dmesg after nouveau is loaded and monitor plugged in
>>
>> This should allow all the info to be well-contained and accessible to
>> everyone who needs to see it.
>>
>> There aren't any currently outstanding known issues that I can think
>> of that would cause your current situation. But plenty of unknown
>> ones!
>>
>> Cheers,
>>
>>   -ilia
>>
>> On Fri, Mar 4, 2022 at 7:12 PM Andre Costa <andre.ocosta@gmail.com>
>> wrote:
>> >
>> > Hi there,
>> >
>> > I just bought an Acer Nitro 5 (AN515-44) notebook with an AMD Renoir
>> iGPU and a GTX 1650 dGPU. I installed Fedora 35 and, for the most part,
>> it's working great. The only issue so far is that I cannot use Wayland +
>> external monitor with Nouveau -- it does recognize the external monitor,
>> but only renders the top half of the screen, the bottom half remains
>> (literally) blank.
>> >
>> > (BTW the HDMI port is wired to the GTX 1650)
>> >
>> > For the record, I can use the external monitor just fine with Nvidia's
>> proprietary driver on X11, but I'd rather use Nouveau if possible.
>> >
>> > I know support for the NV160 family is still coming up according to the
>> feature matrix, so I'll patiently wait. I just wanted to volunteer to do
>> some testing on this specific setup if this can help in any way. Just let
>> me know.
>> >
>> > Keep up the great work!
>> >
>> > Cheers,
>> > Andre
>>
>

--0000000000008b081805d9710a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Created <a href=3D"https://gitlab.freedesktop.org/drm/nouv=
eau/-/issues/162">issue #162</a>.<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 9:55 PM Andre C=
osta &lt;<a href=3D"mailto:andre.ocosta@gmail.com">andre.ocosta@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>Hi Ilia,</div><div><br></div><div>Thanks for the quick =
response -- boy, that was fast =3D) I&#39;ll certainly do that, I just need=
 to revert my current setup to use nouveau again, then I&#39;ll file the bu=
g with the info you suggested. Fingers crossed ;-)</div><div><br></div><div=
>Cheers,</div><div>Andre<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 9:16 PM Ilia Mirki=
n &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alu=
m.mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Andre,<br>
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
</blockquote></div>

--0000000000008b081805d9710a37--
