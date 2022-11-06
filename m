Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701461E33F
	for <lists+nouveau@lfdr.de>; Sun,  6 Nov 2022 16:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F18510E1A0;
	Sun,  6 Nov 2022 15:51:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ED210E1A0
 for <nouveau@lists.freedesktop.org>; Sun,  6 Nov 2022 15:51:18 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so5276291oti.5
 for <nouveau@lists.freedesktop.org>; Sun, 06 Nov 2022 07:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xVoz2e54rwC2Q7L+gsFcV8dQaC/2mzb/YKHqLHnB+XM=;
 b=ep9PVZNRH8zCj6+zytdhMd5jZcOdmw6f3vFe26ulMFZxjl7EbZ1TNZ8QpP2WHvbYVQ
 73yqu0acoy9/vqBvJ+VzyoLZgNCW5o5wWQjIGztBAy6099xZURyoiP4CrnkJpExLbbHd
 E3mqp72csrgM/hvlEg/0mjQvBx0f1tFCqdB+aziDVK5808tuYe50Nt2D7m11zBXp8Lgi
 M1lsHd7e2Gu9dZKKLx1mBGQMqjO3YzrIeCLLxD27vU742LzlgjlUqWu7VVgI2TfZIZeN
 HvqX4AQh3rLUExvqX7WBv4RlUcQSPPZJdvF0ScQNvoGDq50C1HfSvUn/0P4vualppNGz
 azzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVoz2e54rwC2Q7L+gsFcV8dQaC/2mzb/YKHqLHnB+XM=;
 b=OMJW1NZWvUOzejkD2rnjQbqS//mkyR673SxjqHTPcOXkc1TybudbqxAfSXe8HBbSGx
 wtN34KWDI16d4LNGAsxUCoUuo/XeD0GAHHUk3PzLDNhmpYRR23j94lX6Y0PuRjdrHk0f
 l0Yi7Y4zoAvBUKiPCKjAzShItrMo7+G4im7V2KDptq30zzaTpcQB40x2OaUgqUN5z/oA
 WwElfJL7vP66JenMm6OwxQppGzFsiQzGzXwtbx/jUEaV1oJOuKlig6tGeYL5LMUHDdys
 jqSHk9OKn1bghJixqPeMhsqR0bvMcyR96GnOR3Pj+uXUBUaZ8d9TXX9niMEpukbX8PD6
 2lUw==
X-Gm-Message-State: ACrzQf234XJ4T+lWJC+PiNlWGS8PgQscQJ9QceNE2EA5LEXPzhNhNMYi
 pubs+RUx9rItfa1quWVPOXMlwK7R14hM3II3vcJryEg0Jaj19g==
X-Google-Smtp-Source: AMsMyM6sK6023gnKwr+yHwjfQ0rUEZcgNl3dvlu1K6hs/weWUJ6qtNeRBKVFQikgaaRzi74z1jpdCJz0I/8MfwdQfW4=
X-Received: by 2002:a9d:20e3:0:b0:655:d819:244b with SMTP id
 x90-20020a9d20e3000000b00655d819244bmr22201266ota.232.1667749877564; Sun, 06
 Nov 2022 07:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-13-e7792734108f@cerno.tech>
 <0d04cc78-148c-4f72-dcbc-3e2344d4f26a@tronnes.org>
In-Reply-To: <0d04cc78-148c-4f72-dcbc-3e2344d4f26a@tronnes.org>
From: Lukas Satin <luke.satin@gmail.com>
Date: Sun, 6 Nov 2022 16:51:06 +0100
Message-ID: <CAEFVmO+-9h6T7wqMVrNUbe6z6MzreAD3f0825E3dc3gbaDA9Pw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000006cadb05eccf47aa"
Subject: Re: [Nouveau] [PATCH v6 13/23] drm/modes: Introduce the tv_mode
 property as a command-line option
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

--00000000000006cadb05eccf47aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1) Can we have access to TV chip registers (as nvtv) in order so set
horizontal / vertical properties in order to set 240p resolution in NTSC or
288p in PAL?

2) Why the reply to email list is like that and not just
nouveau@lists.freedesktop.org ? I see a couple of individuals plus four
mailing lists

Lukas

On Sun, Nov 6, 2022 at 2:11 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wro=
te:

>
>
> Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> > Our new tv mode option allows to specify the TV mode from a property.
> > However, it can still be useful, for example to avoid any boot time
> > artifact, to set that property directly from the kernel command line.
> >
> > Let's add some code to allow it, and some unit tests to exercise that
> code.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
>
> I would have just squashed the named mode part of this patch together
> with the 2 other named mode patches and keep just the video=3D option par=
t
> here, but up to you:
>
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>

--00000000000006cadb05eccf47aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">1) Can we have access to TV chip registers (as nvtv) in or=
der so set horizontal / vertical properties in order to set 240p resolution=
 in NTSC or 288p in PAL?<div><br></div><div>2) Why the reply to email list =
is like that and not just=C2=A0<span style=3D"font-family:&quot;Google Sans=
&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:14px"><a hre=
f=3D"mailto:nouveau@lists.freedesktop.org">nouveau@lists.freedesktop.org</a=
> ? I see a couple of individuals plus four mailing lists</span></div><div>=
<span style=3D"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helve=
tica,Arial,sans-serif;font-size:14px"><br></span></div><div><span style=3D"=
font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans=
-serif;font-size:14px">Lukas</span></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 6, 2022 at 2:11 PM Nor=
alf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes.org">noralf@tronnes.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
Den 26.10.2022 17.33, skrev maxime@cerno.tech:<br>
&gt; Our new tv mode option allows to specify the TV mode from a property.<=
br>
&gt; However, it can still be useful, for example to avoid any boot time<br=
>
&gt; artifact, to set that property directly from the kernel command line.<=
br>
&gt; <br>
&gt; Let&#39;s add some code to allow it, and some unit tests to exercise t=
hat code.<br>
&gt; <br>
&gt; Signed-off-by: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
&gt; <br>
&gt; ---<br>
<br>
I would have just squashed the named mode part of this patch together<br>
with the 2 other named mode patches and keep just the video=3D option part<=
br>
here, but up to you:<br>
<br>
Reviewed-by: Noralf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes.org" =
target=3D"_blank">noralf@tronnes.org</a>&gt;<br>
</blockquote></div>

--00000000000006cadb05eccf47aa--
