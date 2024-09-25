Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B598574B
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 12:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE5910E06E;
	Wed, 25 Sep 2024 10:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NxIN002u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBD110E06E
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 10:44:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so6800199e87.3
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727261082; x=1727865882; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:references:in-reply-to:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5tt+uixxRqyQQJuCOCrisCOg4+aMLT5vzvaHSSVwSzw=;
 b=NxIN002uII4ABT7lb1LMFEo3tmdgoGfLeLxT/TJ8FfYutdYp/HjQTGdMFhmK8tChs4
 +Vh2xRkAsX0YwtmrblCp/g+ADOqgkRemwOPB9qQVf7XDOqt5qqujulaKxKRMF9kQCd9y
 phQ3KBWD/goQhgPnRrAMF39GCGd1yoZM5pc9kgoYOnrwDJGzmMPHvvZ9XW6QHcD0XrUM
 sNkZ55I/8T5fYZp7VeIlXNRmhRn1I7dd4+5m4u6FaLKO25Kpa+ggppmXtA0CR+PK20o/
 mLYIVYD1C9v38oxh5ImYlluJauBOkaa2DpYMCJtuIv0CrLADx7Fo+1LQQAHCroVSCtkR
 aRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727261082; x=1727865882;
 h=to:subject:message-id:date:from:references:in-reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5tt+uixxRqyQQJuCOCrisCOg4+aMLT5vzvaHSSVwSzw=;
 b=wFtgKybv8sS+7QkrPTtL3wwIGddUgH3XqSf2C3mmTDUtiD3D0Y/j6kHBMwmw9W4pvQ
 AR9nXd7UZMYwHZiMd6hprvZBHfa9pcNhqYhtSxvU0s6Cnjkbh8jE7ptL7UzwbcarKr+n
 Z5e9iSLzwMCbED8YygguIbTFxiPph948/lKLhYYLMsXTc91e1Mh4RhRLUWV56iZLlH7r
 MbWOfrv2iwvR4udbnVW3gpncECoMmo7fabhenukNXn4dLCZCn5fmBq0LA1LD9ttgkLbE
 ti+jPk867RoIda01IaudI5yZYicZtopuR+QIyJHq8LXTPU/qO8d32JuDibLrOllwXMfL
 TKsg==
X-Gm-Message-State: AOJu0YyY8UikO/z/aonfoopOqArnJWIx+u//m6nZ22B4VgX8Brfqkq5L
 7VJjoYP0CZPvy3ylKXYZV6+T4hUTp5fLjedI2TykMvbiBJPTCy7Yc/A7mijVqSH18NEPHoRRUYp
 URJwsG/GltWyG/1N8wDEE6OS0x+eyDQ==
X-Google-Smtp-Source: AGHT+IG6DKWqBDSu7Wlpa+f+anHaPuI8ijwR5mQPxWzrZw1vFG/Ytfa8VBnoABhfj35qdpEInvcVexKon9hAHqHQmjo=
X-Received: by 2002:a05:6512:1194:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-53877538d2amr1356922e87.35.1727261081706; Wed, 25 Sep 2024
 03:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:d087:0:b0:29b:9970:cf97 with HTTP; Wed, 25 Sep 2024
 03:44:40 -0700 (PDT)
In-Reply-To: <CAD8U+g-kywnHzW1SRRkUmgfTv8Vey9KdCDwnan2N9aRTU_jHgw@mail.gmail.com>
References: <CAD8U+g-kywnHzW1SRRkUmgfTv8Vey9KdCDwnan2N9aRTU_jHgw@mail.gmail.com>
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Wed, 25 Sep 2024 07:44:40 -0300
Message-ID: <CAD8U+g_9QtPzLwTOcA-uA73FWjv_tJsn247_VOez9HHf1jrwZA@mail.gmail.com>
Subject: Re: Some program windows only show "rain"...
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000035a9680622ef4f48"
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

--00000000000035a9680622ef4f48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El martes, 24 de septiembre de 2024, riveravaldez<riveravaldezmail@gmail.co=
m>
escribi=C3=B3:
> Hi, I guess somewhat around a year I started to have this problem (I'm on
an updated Arch GNU+Linux laptop, Dell XPS 15) which disappeared with some
system updates but reappeared with others and it has stayed through various
updates for a while now...
>
> Programs seem to run normally but their windows only show "rain", nothing
understandable.
>
> It only happens with this programs, AFAICT:
> $ chromium (avoidable with --disable-gpu )
> $ epiphany
> $ flatpak run chat.delta.desktop
> $ jami (seems to get fixed with: $ LIBGL_ALWAYS_SOFTWARE=3D1 jami )
> $ mscore (aka, musescore)
>
> Despite variations on each program, the 'nouveau' part I got in terminal
output is always one of these (e.g.):
>
> $ epiphany
> (...)
> (etc.)
>
> $ flatpak run chat.delta.desktop
> (...)
> (etc.)
>
>
> Any help would be very welcome...
>
> Some questions:
> 0. Should I add a complete terminal output in some way?
> 1. Is there anything I could do to help fix this issue?
> 2. What can I do to keep working with those programs until the issue gets
fixed?
>
> Thanks a lot in advance, kind regards.

Hi, everybody, in case is relevant: rebooting and editing the 'linux' line
in GRUB with:

module_blacklist=3Dnouveau

, makes everything work apparently fine.

Any ideas?

Thanks a lot in advance.
Kind regards.

--00000000000035a9680622ef4f48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El martes, 24 de septiembre de 2024, riveravaldez&lt;<a href=3D"mailto:rive=
ravaldezmail@gmail.com">riveravaldezmail@gmail.com</a>&gt; escribi=C3=B3:<b=
r>&gt; Hi, I guess somewhat around a year I started to have this problem (I=
&#39;m on an updated Arch GNU+Linux laptop, Dell XPS 15) which disappeared =
with some system updates but reappeared with others and it has stayed throu=
gh various updates for a while now...<br>&gt;<br>&gt; Programs seem to run =
normally but their windows only show &quot;rain&quot;, nothing understandab=
le.<br>&gt;<br>&gt; It only happens with this programs, AFAICT:<br>&gt; $ c=
hromium (avoidable with --disable-gpu )<br>&gt; $ epiphany<br>&gt; $ flatpa=
k run chat.delta.desktop<br>&gt; $ jami (seems to get fixed with: $ LIBGL_A=
LWAYS_SOFTWARE=3D1 jami )<br>&gt; $ mscore (aka, musescore)<br>&gt;<br>&gt;=
 Despite variations on each program, the &#39;nouveau&#39; part I got in te=
rminal output is always one of these (e.g.):<br>&gt;<br>&gt; $ epiphany<br>=
&gt; (...)<br>&gt; (etc.)<br>&gt;<br>&gt; $ flatpak run chat.delta.desktop<=
br>&gt; (...)<br>&gt; (etc.)<br>&gt;<br>&gt;<br>&gt; Any help would be very=
 welcome...<br>&gt;<br>&gt; Some questions:<br>&gt; 0. Should I add a compl=
ete terminal output in some way?<br>&gt; 1. Is there anything I could do to=
 help fix this issue?<br>&gt; 2. What can I do to keep working with those p=
rograms until the issue gets fixed?<br>&gt;<br>&gt; Thanks a lot in advance=
, kind regards.<br><br>Hi, everybody, in case is relevant: rebooting and ed=
iting the &#39;linux&#39; line in GRUB with:<br><br>module_blacklist=3Dnouv=
eau<br><br>, makes everything work apparently fine.<br><br>Any ideas?<br><b=
r>Thanks a lot in advance.<br>Kind regards.

--00000000000035a9680622ef4f48--
