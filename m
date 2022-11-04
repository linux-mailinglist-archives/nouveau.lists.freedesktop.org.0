Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF22618E80
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 03:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82FC10E78F;
	Fri,  4 Nov 2022 02:56:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8930A10E78F
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 02:56:45 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 cn2-20020a056830658200b0066c74617e3dso2042588otb.2
 for <nouveau@lists.freedesktop.org>; Thu, 03 Nov 2022 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j8XLJBcgjNTIkVR2NzJVwfaf5k6oy9u8H2+Wy7zKPPE=;
 b=algUXXPVSCLjBYiGt83FkiT14Ke4pMWG727ATXgbURLW9yV//ii7pp0v3AL2vuISLz
 zmf2DIgYjgiN9W3crF3JzE9JR5LeG2Xlq+QrrxzeVuyGgdnlBDwfRpuy6KyUPRqPiqFH
 PUpz1zgQfMaQq2yU4rl8a11eXYPQiw5N4J22QGq053xlGm7iNnjAP57fT+vpmiCyJrZm
 t4Z6ut1hUpJsRWNGmv+ZTuYhYilTGfSRkRnebFpYbBD+W+vn7zSIBzYthDZoXt4x43ky
 2BddZz3JtUK6cYdoMWYzq+BdKNuyizZKMa/RyMv2qawrabKVj+h1K+IDF79QdmTkd3E3
 CTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j8XLJBcgjNTIkVR2NzJVwfaf5k6oy9u8H2+Wy7zKPPE=;
 b=mHZEUNr3S6n2Anlqc328NZxDM/NgY1X/NcWm5J+O99WnZugUtUCIcu2b2b+YWs1WQc
 JXwdBwsv6IlCE4yh2k1Ql2MBc9CWDkIC1bOoJGbWSenndEqb9geXEanzUTCdbxFK3a4G
 PAv3eTb9bawFSEsg7qskVi9/4+JbGSutE3pgr/9bflVwQfJDzWPQ41kK5h58CoV/7clM
 G7LEL41tTPhifjmdGtQvueI1fmpNsFWWVDVDCKvRtDajAl8NLZlml0l2ipKxtRgIi8tD
 3t6k7Gymwi1GQ9rk4k2+FYGieVW0nfPQH6mxxrtWDcMy/BHwJMb2jK7f9KFuoTkWzqop
 XIkw==
X-Gm-Message-State: ACrzQf3q5+9T44NDOlV4Cf7NkZWe7onfVxBI17GuBL4LKdj1kvz3GjEr
 ZbaO1z76RdlDImFJa8WTJ5pSnMXfG1Q7yJXwFyJLNqHFzrZVWg==
X-Google-Smtp-Source: AMsMyM4I6vu+DHk5tPSkOSwBJCLocjd0TQrsRRD9iFCMCc5wbrS28v0Eus6MANhSyoIEruqiv5Tx1KV/vvpBZ6gVmqQ=
X-Received: by 2002:a9d:20e3:0:b0:655:d819:244b with SMTP id
 x90-20020a9d20e3000000b00655d819244bmr16211594ota.232.1667530603932; Thu, 03
 Nov 2022 19:56:43 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Satin <luke.satin@gmail.com>
Date: Fri, 4 Nov 2022 03:56:32 +0100
Message-ID: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000004cafe205ec9c39b3"
Subject: [Nouveau] TV Out question
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

--0000000000004cafe205ec9c39b3
Content-Type: text/plain; charset="UTF-8"

Hi, I am currently testing Batocera Linux for retrogaming with 15KHz output
on CRT / TV.

The machine I discovered is a certified Windows Media Center / Intel ViiV
machine: Acer iDEA 510

It features:
RCA component output
S-Video CVBS output
S-Video DIN output
Scart IN / Scart OUT (two DVB-T tuners for realtime playback and recording)
DVI-I out
HDMI out

Laptop style components, MXM module Geforce 7 Go 7600 (NVIDIA Curie).

Now, BIOS default output via RCA component is 640x480 NTSC (480i, 60Hz). In
Windows I can switch between NTSC and PAL (480i or 576i).

As this is EU machine, after BIOS it often defaults to 576i PAL, unless set
otherwise.

Now your nouveau driver therefore defaults to 576i.

Xrandr looks like this:
TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
   720x576       50.00 +
   1024x768      50.00
   800x600       50.00
   720x480       50.00
   640x480       50.00*
   400x300       50.00
   320x240       50.00
   320x200       50.00
   768x576       50.00
   360x200       60.00
   360x240       60.00
   640x240       60.00

I tried to add some additional modelines. But look at 640x480. It forces
50Hz and I am unable to remove it, create new or change it to 60Hz.
Therefore the TV is always set to 576i and screen output is 640x480,
therefore it looks like GPU scaled. First I read your troubleshooting which
mentions scaling, so I tried to disable scaling. Did not help.

Now I read about this:
https://nvidia.custhelp.com/app/answers/detail/a_id/177/~/linux---configuring-tv-out

And this might be the solution and issue. It would correspond with what can
be observed in Windows 7.

Does your driver have some options for configuring TV Out and name
switching from PAL to NTSC or HD480i mode? It should be automatic based on
480i or 576i or 240p or 288p, but it is not.

Thanks,
Lukas

--0000000000004cafe205ec9c39b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I am currently testing Batocera Linux for retrogaming =
with 15KHz output on CRT / TV.<div><br></div><div>The machine I discovered =
is a certified Windows Media Center / Intel ViiV machine: Acer iDEA 510</di=
v><div><br></div><div>It features:</div><div>RCA component output</div><div=
>S-Video CVBS output</div><div>S-Video DIN output</div><div>Scart IN / Scar=
t OUT (two DVB-T tuners for realtime playback and recording)</div><div>DVI-=
I out</div><div>HDMI out</div><div><br></div><div>Laptop style components, =
MXM module Geforce 7 Go 7600 (NVIDIA Curie).</div><div><br></div><div>Now, =
BIOS default output via RCA component is 640x480 NTSC (480i, 60Hz). In Wind=
ows I can switch between NTSC and PAL (480i or 576i).</div><div><br></div><=
div>As this is EU machine, after BIOS it often defaults to 576i PAL, unless=
 set otherwise.</div><div><br></div><div>Now your nouveau driver therefore =
defaults to 576i.</div><div><br></div><div>Xrandr looks like this:</div><di=
v>TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) 0mm=
 x 0mm<br>=C2=A0 =C2=A0720x576 =C2=A0 =C2=A0 =C2=A0 50.00 +<br>=C2=A0 =C2=
=A01024x768 =C2=A0 =C2=A0 =C2=A050.00<br>=C2=A0 =C2=A0800x600 =C2=A0 =C2=A0=
 =C2=A0 50.00<br>=C2=A0 =C2=A0720x480 =C2=A0 =C2=A0 =C2=A0 50.00<br>=C2=A0 =
=C2=A0640x480 =C2=A0 =C2=A0 =C2=A0 50.00*<br>=C2=A0 =C2=A0400x300 =C2=A0 =
=C2=A0 =C2=A0 50.00<br>=C2=A0 =C2=A0320x240 =C2=A0 =C2=A0 =C2=A0 50.00<br>=
=C2=A0 =C2=A0320x200 =C2=A0 =C2=A0 =C2=A0 50.00<br>=C2=A0 =C2=A0768x576 =C2=
=A0 =C2=A0 =C2=A0 50.00<br>=C2=A0 =C2=A0360x200 =C2=A0 =C2=A0 =C2=A0 60.00<=
br>=C2=A0 =C2=A0360x240 =C2=A0 =C2=A0 =C2=A0 60.00<br>=C2=A0 =C2=A0640x240 =
=C2=A0 =C2=A0 =C2=A0 60.00<br></div><div><br></div><div>I tried to add some=
 additional modelines. But look at 640x480. It forces 50Hz and I am unable =
to remove it, create new or change it to 60Hz. Therefore the TV is always s=
et to 576i and screen output is 640x480, therefore it looks like GPU scaled=
. First I read your troubleshooting which mentions scaling, so I tried to d=
isable scaling. Did not help.</div><div><br></div><div>Now I read about thi=
s:</div><div><a href=3D"https://nvidia.custhelp.com/app/answers/detail/a_id=
/177/~/linux---configuring-tv-out">https://nvidia.custhelp.com/app/answers/=
detail/a_id/177/~/linux---configuring-tv-out</a><br></div><div><br></div><d=
iv>And this might be the solution and issue. It would correspond with what =
can be observed in Windows 7.</div><div><br></div><div>Does your driver hav=
e some options for configuring TV Out and name switching from PAL to NTSC o=
r HD480i mode? It should be automatic based on 480i or 576i or 240p or 288p=
, but it is not.</div><div><br></div><div>Thanks,</div><div>Lukas</div></di=
v>

--0000000000004cafe205ec9c39b3--
