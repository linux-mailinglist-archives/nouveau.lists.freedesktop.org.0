Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95B959EFC
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 15:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A35010E574;
	Wed, 21 Aug 2024 13:44:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4089110E574
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 13:44:36 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-498cd1112c3so411999137.0
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724247875; x=1724852675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3UeCnrBFxZ3E9SFjE+OPHN3Y07IqNnUIZhks/jfsxGg=;
 b=Jvq40Xn4hUBWkYs43q+PCoqM0pA3a91CTqh2U/YyJLaOvi5jrZ+JZ3hVpdQGRx46kW
 I8Z8bZ0ZO0p7zkWLN+/YJJN25aF3I5Yi9mPUtD7ZvyEMnyN7a9SawOixudb6RBgtNWmz
 oUIyzowJzM1MzczOS0RywvqFK42aogh0YWhNWhUGcnzYS+nwTuECwycekzmeOTEOJ2Nm
 MmhTY0VWL/2VbuCUicJwfNZ5H/31uDD2q8UyTgw1v65ImEI8OHNWQVXdKLzgOVg/vwF3
 5Voy6PzFbuDgKH4CRy8we52RIf8N1/LLHd+Yd+wna2MyjuGB9V6e5FJRXaaVxfiZqXgL
 ufYg==
X-Gm-Message-State: AOJu0YwWLDWQ4jhBbIdduaAxh3H4IXKo/5WnDuLocxiOwVPLufP/2HIy
 k3SFn+mHQwIXPU8ZCvW6acTQMnlLyo8FW9l4eR+l1CO0T8SXgS+s26JiCIWY29KjFaPQIX9+us1
 2d2CWhp8B5LsZhhoo1bTfVNiSZjY=
X-Google-Smtp-Source: AGHT+IEsRWwT9L75y8TTg3gti0s2rLoym6h2EPj1ecBSZfQ1RWZl9S6telKIOmM3ddz8Lpm1D3GbzwBEk5B5DgJ93xM=
X-Received: by 2002:a05:6102:54ac:b0:48f:db1b:1965 with SMTP id
 ada2fe7eead31-498d2e761f6mr3002358137.5.1724247874884; Wed, 21 Aug 2024
 06:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
In-Reply-To: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 21 Aug 2024 09:44:22 -0400
Message-ID: <CAKb7UviSxCAA1weVK5kvVWDiroLStgmtPZH2wheYiD1Za8mJ4w@mail.gmail.com>
Subject: Re: Possible nouveau driver problem?
To: H <agents@meddatainc.com>
Cc: Nouveau Mailing List <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000166123062031bebd"
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

--000000000000166123062031bebd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 8:29=E2=80=AFPM H <agents@meddatainc.com> wrote:

> I am running Rocky Linux latest version with the Mate Desktop 1.26.2 (the
> latest version in the EPEL repository) on a Dell Inspiron laptop with a
> 3840 x 2160 display and an external 1920 x 1080 Acer
> monitor connected via HDMI, see output below:
>
> $ inxi --graphics
> Graphics:
>   Device-1: Intel UHD Graphics 620 driver: i915 v: kernel
>   Device-2: NVIDIA GM108M [GeForce 940MX] driver: nouveau v: kernel
>   Device-3: DisplayLink Dell D3100 Docking Station driver: usbfs type: US=
B
>   Device-4: Realtek Integrated_Webcam_HD driver: uvcvideo type: USB
>   Display: x11 server: X.Org v: 1.20.11 driver: X: loaded: modesetting
>     dri: iris gpu: i915 resolution: 1: 1920x1080~60Hz 2: 3840x2160~60Hz
>   API: OpenGL v: 4.6 vendor: intel mesa v: 23.3.3 renderer: Mesa Intel UH=
D
>     Graphics 620 (KBL GT2)
>
> The problem is that the external display has some issues, whether they ar=
e
> related to the nouveau driver, the Mate Desktop or something else I canno=
t
> determine. What happens is that although the
> external monitor is indeed using the 1920 x 1080 resolution and dragging =
a
> window from the laptop screen to the external screen works, ie., it
> maintains the "correct" size, then maximizing it makes it
> 1/4 of the size of the external monitor display. Likewise, the Mate
> Desktop background repeats partly 4-fold on this monitor, partly 16-fold.=
..
>
> I also have a Dell docking station, model D3100 and have downloaded the
> latest DisplayLink driver from github with the hope that I could attach t=
wo
> external Acer monitors to use with the laptop, I
> unable to use xrandr to correctly set the external monitor (I have only
> tried with one so far) to the desired 1920 x 1080 resolution while
> maintaining the 3840 x 2160 resolution on the laptop screen.
>
> Googling suggests that there might be some issues with xrandr and scaling
>
> Given my description above, could there possibly be a bug in the nouveau
> driver I am using?
>

What makes you say that nouveau (or the NVIDIA GPU) is in any way involved
in your issue?

GM108 is, per my recollection, an accelerator-only GPU. It seems like both
of your outputs are being driven by the integrated Intel GPU, as is your
acceleration.

Confirming which device is driving what will go a long way to helping
understand your issues.

Cheers,

  -ilia

--000000000000166123062031bebd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 15, 2024 at 8:29=E2=80=AFPM H=
 &lt;<a href=3D"mailto:agents@meddatainc.com">agents@meddatainc.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">I am running Rocky Linux latest version with the Mate De=
sktop 1.26.2 (the latest version in the EPEL repository) on a Dell Inspiron=
 laptop with a 3840 x 2160 display and an external 1920 x 1080 Acer<br>
monitor connected via HDMI, see output below:<br>
<br>
$ inxi --graphics<br>
Graphics:<br>
=C2=A0 Device-1: Intel UHD Graphics 620 driver: i915 v: kernel<br>
=C2=A0 Device-2: NVIDIA GM108M [GeForce 940MX] driver: nouveau v: kernel<br=
>
=C2=A0 Device-3: DisplayLink Dell D3100 Docking Station driver: usbfs type:=
 USB<br>
=C2=A0 Device-4: Realtek Integrated_Webcam_HD driver: uvcvideo type: USB<br=
>
=C2=A0 Display: x11 server: X.Org v: 1.20.11 driver: X: loaded: modesetting=
<br>
=C2=A0 =C2=A0 dri: iris gpu: i915 resolution: 1: 1920x1080~60Hz 2: 3840x216=
0~60Hz<br>
=C2=A0 API: OpenGL v: 4.6 vendor: intel mesa v: 23.3.3 renderer: Mesa Intel=
 UHD<br>
=C2=A0 =C2=A0 Graphics 620 (KBL GT2)<br>
<br>
The problem is that the external display has some issues, whether they are =
related to the nouveau driver, the Mate Desktop or something else I cannot =
determine. What happens is that although the<br>
external monitor is indeed using the 1920 x 1080 resolution and dragging a =
window from the laptop screen to the external screen works, ie., it maintai=
ns the &quot;correct&quot; size, then maximizing it makes it<br>
1/4 of the size of the external monitor display. Likewise, the Mate Desktop=
 background repeats partly 4-fold on this monitor, partly 16-fold...<br>
<br>
I also have a Dell docking station, model D3100 and have downloaded the lat=
est DisplayLink driver from github with the hope that I could attach two ex=
ternal Acer monitors to use with the laptop, I<br>
unable to use xrandr to correctly set the external monitor (I have only tri=
ed with one so far) to the desired 1920 x 1080 resolution while maintaining=
 the 3840 x 2160 resolution on the laptop screen.<br>
<br>
Googling suggests that there might be some issues with xrandr and scaling<b=
r>
<br>
Given my description above, could there possibly be a bug in the nouveau dr=
iver I am using?<br></blockquote><div><br></div><div>What makes you say tha=
t nouveau (or the NVIDIA GPU) is in any way involved in your issue?</div><d=
iv><br></div><div>GM108 is, per my recollection, an accelerator-only GPU. I=
t seems like both of your outputs are being driven by the integrated Intel =
GPU, as is your acceleration.</div><div><br></div><div>Confirming which dev=
ice is driving what will go a long way to helping understand your issues.</=
div><div><br></div><div>Cheers,</div><div><br></div><div>=C2=A0 -ilia</div>=
</div></div>

--000000000000166123062031bebd--
