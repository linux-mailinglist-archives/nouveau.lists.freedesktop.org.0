Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6B82FDA0
	for <lists+nouveau@lfdr.de>; Wed, 17 Jan 2024 00:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594B10E0FB;
	Tue, 16 Jan 2024 23:02:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AA510E0FB
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jan 2024 23:02:53 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4b87d79a7d8so1866446e0c.3
 for <nouveau@lists.freedesktop.org>; Tue, 16 Jan 2024 15:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705446172; x=1706050972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Chw2MjmCM9DNMms1H5rXEOzOdPLa4Eh+HzzkU0ryAts=;
 b=HdtWoKc3kJjL31bX38cmQAX/B2QFSZjolhPomvcK/tqfhelnjog3e2ZRH588VTek52
 p7buuN4wwuiKX3medNV+5JpdwqN+HwkUiRHuh4l4YxwJ8xNa2NajmUkdmw+BbE86uZyg
 KEZA3FHCa+bcvIrJ2pgHbIt47Kmqv/M54dO4jP2Nhcr+MEnhfqeWx4gyf/tW8PjdjYpi
 1Koxn4+mfWMwLQKzNf5pbjKCIIbzuIbYclD9qJbsnikTpeaNUbcMmNaDpAttY10J4JQJ
 i0lPHo78tmDejoawT3IbR9rYb0YkA1GEdnd6YmA7uZ3b14EbdX7oU4XUHjxdQV7PJ+kk
 YvAw==
X-Gm-Message-State: AOJu0YzMP5cZPLVH/ZZ6ACtQqy8IErCVM0vkXXAgeMHY5LKh+X+Io+PM
 MO5MiPA5ZMaRuwtk+9d9g9C9W3RAho278sa/05Q=
X-Google-Smtp-Source: AGHT+IHNhpagL8Dif5Lrt7SNHwNdgOOmrkyMd4CRgaDboDr4dvdy9BVfNO0WE0qNF60asa5AyhQ3q3KkmthFNzCohPg=
X-Received: by 2002:a05:6122:1145:b0:4b7:4cfb:4217 with SMTP id
 p5-20020a056122114500b004b74cfb4217mr2964956vko.22.1705446172048; Tue, 16 Jan
 2024 15:02:52 -0800 (PST)
MIME-Version: 1.0
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
In-Reply-To: <ZWsuiq7zrYS-pDli@archie.me>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 16 Jan 2024 18:02:40 -0500
Message-ID: <CAKb7UvgS8H4WgFXMckga-LM5QS5YDyeS1PmuvOc7iRCM_WGfMA@mail.gmail.com>
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Nouveau <nouveau@lists.freedesktop.org>,
 Gert Vanhaerents <gert.vanhaerents@hotmail.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Dec 2, 2023 at 8:18=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Thu, Nov 30, 2023 at 11:48:24AM +0100, Gert Vanhaerents wrote:
> > Hi Kernel list,
> > I'm the IT person of a school, earlier we used multiseatcomputers for t=
he
> > school, i have maded with a XGL implementation and it works fine but no=
t so
> > fantastic. The school wants that i build new computers but the XGL proj=
ect
> > is too outdated so i can't use it anymore.
> >
> > How can i make a multiseatcomputer with more then one user on one card =
with
> > systemd? I have asked already to the makers of systemd but they said it=
's a
> > kernel problem.
> >
> > With Systemd loginctl and the nouveau drivers you have this:
> >
> > =E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
> >           =E2=94=82 [MASTER] drm:card0
> >           =E2=94=82
> > =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm=
/card0/card0-DVI-D-1
> >           =E2=94=82 =E2=94=82 [MASTER] drm:card0-DVI-D-1
> >           =E2=94=82
> > =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm=
/card0/card0-HDMI-A-1
> >           =E2=94=82 =E2=94=82 [MASTER] drm:card0-HDMI-A-1
> >           =E2=94=82
> > =E2=94=94=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm=
/card0/card0-VGA-1
> >           =E2=94=82   [MASTER] drm:card0-VGA-1
> > =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm=
/renderD128
> >           =E2=94=82 drm:renderD128
> > =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/gra=
phics/fb0
> >           =E2=94=82 graphics:fb0 "nouveaudrmfb"
> >
> > So it will be:
> >
> > loginctl attach seat1 /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0=
/drm/card0/card0-VGA-1
> >
> > For the seat1 (the VGA d-sub output for seat1 and the other HDMI output=
 for
> > seat0) and of course the mouse and keyboard.
> >
> > When you do this, all the graphics outputs are on the second seat (seat=
1)
> > and not anymore on the first seat. So i need to move only the VGA outpu=
t to
> > seat1 and not all the outputs.

(Note: I know nothing about multiseat, but I know something about nouveau.)

What GPU is this? The fact that VGA is listed makes me think it's an
older one. Pre-Kepler GPUs only support 2 CRTC's, which means you can
only have 2 outputs enabled at a time -- this is a hardware
limitation. So if this is a GFxxx or GTxxx in "lspci" (or even older,
Gxx or NVxx), then this will never work with 3 outputs / seats.

Also, I notice that you have a "fb" driver going, whose sole task is
to display the same thing on all outputs. I don't know how this
interacts with multiseat, but basically you have to ensure that you're
in "graphics" mode, which I think makes it effectively disabled. But
I've never used systemd, so I'm not completely sure how that
interaction is brokered.

Cheers,

  -ilia
