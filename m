Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53750983FBC
	for <lists+nouveau@lfdr.de>; Tue, 24 Sep 2024 09:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4810E05E;
	Tue, 24 Sep 2024 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QngMXu/B";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85410E05E
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 07:55:54 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so54106331fa.1
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 00:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727164552; x=1727769352; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7LWuNp4tPN/61PYkZQgVlDgDRvqzLxB1KbK4udLtvCw=;
 b=QngMXu/BSO5lMumbEoowtfA47lLcXp5O9FRlomocu6joDoTP23zrEdxJFVM+po4fCc
 4nlVYiwlrFk5OSejVFG6bCrsXaJ9Ur3awsKGmf1nWgvVD+3uBusRiTgNLpbxdzl5yQL1
 AjWwBthTEEKRhlqfsohgUKTPD/IFtTFPtDlxLYvTsZvR4NF0smaxU0iMbxRiZDx70nmT
 bRuZcCKChmcyTR7B6aQlLciQ53U96M8kz/4xDzy4ywvpBEbmCBeEouanynQTTo7g7mSW
 tLwVjIFKjzFCcjmEu5AI6s3nZy+YnP2PY3UjyYv2VDXZj05Eq9VClKDykNb1h3e5POP5
 6XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727164552; x=1727769352;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7LWuNp4tPN/61PYkZQgVlDgDRvqzLxB1KbK4udLtvCw=;
 b=JT8aLLw3HwXyGULSM/Q9ql5+sxcU23YDQjvl/nas/w/+Gev2ZPrUIxtUg2zpfQu7i9
 OMi3Y7x1B4hVLni/nsNrng+7vCaA8iIU11h/y4utnC6O0ZIG+BrvCn1c1Zy9wdEEG/r0
 qt4Y3gqagw3Yt1POCZwW1rKDanQ94iH+SOH0V1eRJTCr6qvNAdion6KXspBvGBxjb3Y2
 zoEwEvvVFf2jKWoFc7raKrMY3MkieM17OwU9RuFumOLS4kvLDFZia97w1DKa9o3eS6jq
 ZJifXBynXPVl6WiY/JtTHHGcOP3PDhCP1aoCr8wz8Gyyxc8YAYEmJssDfsWAp46JFmvb
 oX7A==
X-Gm-Message-State: AOJu0YyCFxYqNc0kPguR78sJoKKZyglF+4ER70Fm7H6/k9uQHSl4W7/s
 uD/RGVpVopwf/A2cp54d2YqWpFMgQ3Xm6w4c8nLJFpBIseYDNsQ9xAa+KH3UwsqzTM1gSDR/yVX
 GyBep6aV0UMKgbz/uVfodJwCKTc9v2Q==
X-Google-Smtp-Source: AGHT+IG/vlD7w9bkESVVDkMA0PmXzbKYRkQdu3upIgRV+TWIoMTVJWHR4X+CDCdM6l3XKzaMKWa1hCPdPsZ9tTiVGDk=
X-Received: by 2002:a05:651c:2211:b0:2f7:8d3f:11fc with SMTP id
 38308e7fff4ca-2f7cb360354mr77500231fa.31.1727164552024; Tue, 24 Sep 2024
 00:55:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:c184:0:b0:29b:9970:cf97 with HTTP; Tue, 24 Sep 2024
 00:55:51 -0700 (PDT)
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Tue, 24 Sep 2024 04:55:51 -0300
Message-ID: <CAD8U+g-kywnHzW1SRRkUmgfTv8Vey9KdCDwnan2N9aRTU_jHgw@mail.gmail.com>
Subject: Some program windows only show "rain"...
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000979a770622d8d5d1"
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

--000000000000979a770622d8d5d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I guess somewhat around a year I started to have this problem (I'm on
an updated Arch GNU+Linux laptop, Dell XPS 15) which disappeared with some
system updates but reappeared with others and it has stayed through various
updates for a while now...

Programs seem to run normally but their windows only show "rain", nothing
understandable.

It only happens with this programs, AFAICT:
$ chromium (avoidable with --disable-gpu )
$ epiphany
$ flatpak run chat.delta.desktop
$ jami (seems to get fixed with: $ LIBGL_ALWAYS_SOFTWARE=3D1 jami )
$ mscore (aka, musescore)

Despite variations on each program, the 'nouveau' part I got in terminal
output is always one of these (e.g.):

$ epiphany
(...)
nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido
nouveau: ch8: krec 0 pushes 1 bufs 13 relocs 0
nouveau: ch8: buf 00000000 00000011 00000004 00000004 00000000
0x73f5ac047000 0xd00000 0x80000
nouveau: ch8: buf 00000001 00000007 00000002 00000002 00000000 (nil)
0x260000 0x80000
nouveau: ch8: buf 00000002 0000002e 00000002 00000002 00000000 (nil)
0x1ba7000 0x1000
nouveau: ch8: buf 00000003 0000002f 00000002 00000000 00000002 (nil)
0x1ba8000 0x1000
nouveau: ch8: buf 00000004 00000008 00000002 00000002 00000000 (nil)
0x2e0000 0xe0000
nouveau: ch8: buf 00000005 0000000b 00000002 00000002 00000000 (nil)
0xae0000 0x20000
nouveau: ch8: buf 00000006 0000000a 00000002 00000002 00000002 (nil)
0x9e0000 0x100000
nouveau: ch8: buf 00000007 00000006 00000004 00000000 00000004
0x73f5b9299000 0x215000 0x1000
nouveau: ch8: buf 00000008 00000030 00000002 00000002 00000000 (nil)
0x1ba9000 0x1000
nouveau: ch8: buf 00000009 00000048 00000002 00000002 00000000 (nil)
0x1f4e000 0x1000
nouveau: ch8: buf 0000000a 00000017 00000004 00000004 00000000
0x73f5a7e35000 0x1320000 0x80000
nouveau: ch8: buf 0000000b 00000016 00000002 00000000 00000002 (nil)
0xf00000 0x420000
nouveau: ch8: buf 0000000c 00000031 00000004 00000004 00000004 (nil)
0x1f5a000 0x1000
nouveau: ch8: psh 00000000 0000005374 0000005410
[0x00000000] HDR 200203fd subch 0 NINC
mthd 0ff4 NV9097_SET_SURFACE_CLIP_HORIZONTAL
.X =3D (0x0)
.WIDTH =3D (0x556)
mthd 0ff8 NV9097_SET_SURFACE_CLIP_VERTICAL
.Y =3D (0x0)
.HEIGHT =3D (0x2e7)

[0x00000003] HDR 20090200 subch 0 NINC
mthd 0800 NV9097_SET_COLOR_TARGET_A(0)
.OFFSET_UPPER =3D (0x0)
mthd 0804 NV9097_SET_COLOR_TARGET_B(0)
.OFFSET_LOWER =3D (0xf00000)
mthd 0808 NV9097_SET_COLOR_TARGET_WIDTH(0)
.V =3D (0x556)
mthd 080c NV9097_SET_COLOR_TARGET_HEIGHT(0)
.V =3D (0x2e7)
mthd 0810 NV9097_SET_COLOR_TARGET_FORMAT(0)
.V =3D A8R8G8B8
mthd 0814 NV9097_SET_COLOR_TARGET_MEMORY(0)
.BLOCK_WIDTH =3D ONE_GOB
.BLOCK_HEIGHT =3D SIXTEEN_GOBS
.BLOCK_DEPTH =3D ONE_GOB
.LAYOUT =3D BLOCKLINEAR
.THIRD_DIMENSION_CONTROL =3D THIRD_DIMENSION_DEFINES_ARRAY_SIZE
mthd 0818 NV9097_SET_COLOR_TARGET_THIRD_DIMENSION(0)
.V =3D (0x1)
mthd 081c NV9097_SET_COLOR_TARGET_ARRAY_PITCH(0)
.V =3D (0x0)
mthd 0820 NV9097_SET_COLOR_TARGET_LAYER(0)
.OFFSET =3D (0x0)

[0x0000000d] HDR 2001054e subch 0 NINC
mthd 1538 NV9097_SET_ZT_SELECT
.TARGET_COUNT =3D (0x0)

[0x0000000f] HDR 20010487 subch 0 NINC
mthd 121c NV9097_SET_CT_SELECT
.TARGET_COUNT =3D (0x1)
.TARGET0 =3D (0x0)
.TARGET1 =3D (0x1)
.TARGET2 =3D (0x2)
.TARGET3 =3D (0x3)
.TARGET4 =3D (0x4)
.TARGET5 =3D (0x5)
.TARGET6 =3D (0x6)
.TARGET7 =3D (0x7)

[0x00000011] HDR 80000574 subch 0 IMMD
mthd 15d0 NV9097_SET_ANTI_ALIAS
.SAMPLES =3D MODE_1X1

[0x00000012] HDR 800101d5 subch 0 IMMD
mthd 0754 NV9097_SET_HYBRID_ANTI_ALIAS_CONTROL
.PASSES =3D (0x1)
.CENTROID =3D PER_FRAGMENT

[0x00000013] HDR 200308e0 subch 0 NINC
mthd 2380 NV9097_SET_CONSTANT_BUFFER_SELECTOR_A
.SIZE =3D (0x10000)
mthd 2384 NV9097_SET_CONSTANT_BUFFER_SELECTOR_B
.ADDRESS_UPPER =3D (0x0)
mthd 2388 NV9097_SET_CONSTANT_BUFFER_SELECTOR_C
.ADDRESS_LOWER =3D (0x380000)

[0x00000017] HDR a00308e3 subch 0 1INC
mthd 238c NV9097_LOAD_CONSTANT_BUFFER_OFFSET
.V =3D (0x1a0)
mthd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)
.V =3D (0x3f000000)
mthd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)
.V =3D (0x3f000000)

[0x0000001b] HDR 20040360 subch 0 NINC
mthd 0d80 NV9097_SET_COLOR_CLEAR_VALUE(0)
.V =3D (0x0)
mthd 0d84 NV9097_SET_COLOR_CLEAR_VALUE(1)
.V =3D (0x0)
mthd 0d88 NV9097_SET_COLOR_CLEAR_VALUE(2)
.V =3D (0x0)
mthd 0d8c NV9097_SET_COLOR_CLEAR_VALUE(3)
.V =3D (0x0)

[0x00000020] HDR 20010674 subch 0 NINC
mthd 19d0 NV9097_CLEAR_SURFACE
.Z_ENABLE =3D FALSE
.STENCIL_ENABLE =3D FALSE
.R_ENABLE =3D TRUE
.G_ENABLE =3D TRUE
.B_ENABLE =3D TRUE
.A_ENABLE =3D TRUE
.MRT_SELECT =3D (0x0)
.RT_ARRAY_INDEX =3D (0x0)

[0x00000022] HDR 200406c0 subch 0 NINC
mthd 1b00 NV9097_SET_REPORT_SEMAPHORE_A
.OFFSET_UPPER =3D (0x0)
mthd 1b04 NV9097_SET_REPORT_SEMAPHORE_B
.OFFSET_LOWER =3D (0x215000)
mthd 1b08 NV9097_SET_REPORT_SEMAPHORE_C
.PAYLOAD =3D (0xc)
mthd 1b0c NV9097_SET_REPORT_SEMAPHORE_D
.OPERATION =3D RELEASE
.RELEASE =3D AFTER_ALL_PRECEEDING_WRITES_COMPLETE
.ACQUIRE =3D BEFORE_ANY_FOLLOWING_WRITES_START
.PIPELINE_LOCATION =3D ALL
.COMPARISON =3D EQ
.AWAKEN_ENABLE =3D FALSE
.REPORT =3D NONE
.STRUCTURE_SIZE =3D ONE_WORD
.SUB_REPORT =3D (0x0)
.REPORT_DWORD_NUMBER =3D (0x0)
.FLUSH_DISABLE =3D FALSE

nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido
nouveau: ch8: krec 0 pushes 1 bufs 11 relocs 0
nouveau: ch8: buf 00000000 00000011 00000004 00000004 00000000
0x73f5ac047000 0xd00000 0x80000
nouveau: ch8: buf 00000001 00000016 00000002 00000000 00000002 (nil)
0xf00000 0x420000
nouveau: ch8: buf 00000002 0000002e 00000002 00000002 00000000 (nil)
0x1ba7000 0x1000
nouveau: ch8: buf 00000003 00000008 00000002 00000002 00000000 (nil)
0x2e0000 0xe0000
nouveau: ch8: buf 00000004 0000000b 00000002 00000002 00000000 (nil)
0xae0000 0x20000
nouveau: ch8: buf 00000005 0000000a 00000002 00000002 00000002 (nil)
0x9e0000 0x100000
nouveau: ch8: buf 00000006 00000006 00000004 00000000 00000004
0x73f5b9299000 0x215000 0x1000
nouveau: ch8: buf 00000007 00000030 00000002 00000002 00000002 (nil)
0x1ba9000 0x1000
nouveau: ch8: buf 00000008 00000048 00000002 00000002 00000000 (nil)
0x1f4e000 0x1000
nouveau: ch8: buf 00000009 00000017 00000004 00000004 00000000
0x73f5a7e35000 0x1320000 0x80000
nouveau: ch8: buf 0000000a 00000015 00000004 00000004 00000004 (nil)
0x1f5b000 0x1000
nouveau: ch8: psh 00000000 0000005410 00000054d0
[0x00000000] HDR 200308e0 subch 0 NINC
mthd 2380 NV9097_SET_CONSTANT_BUFFER_SELECTOR_A
.SIZE =3D (0x100)
mthd 2384 NV9097_SET_CONSTANT_BUFFER_SELECTOR_B
.ADDRESS_UPPER =3D (0x0)
mthd 2388 NV9097_SET_CONSTANT_BUFFER_SELECTOR_C
.ADDRESS_LOWER =3D (0x1ba9000)

[0x00000004] HDR a01f08e3 subch 0 1INC
mthd 238c NV9097_LOAD_CONSTANT_BUFFER_OFFSET
.V =3D (0x0)
mthd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)
.V =3D (0x3abfe803)
mthd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)
.V =3D (0x0)
(etc.)


$ flatpak run chat.delta.desktop
(...)
nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido
nouveau: ch8: krec 0 pushes 1 bufs 7 relocs 0
nouveau: ch8: buf 00000000 0000000c 00000004 00000004 00000000
0x7fe3e1580000 0xb00000 0x80000
nouveau: ch8: buf 00000001 00000006 00000004 00000000 00000004
0x7fe3e3c97000 0x215000 0x1000
nouveau: ch8: buf 00000002 00000008 00000002 00000002 00000000 (nil)
0x2e0000 0xe0000
nouveau: ch8: buf 00000003 0000000b 00000002 00000002 00000000 (nil)
0xae0000 0x20000
nouveau: ch8: buf 00000004 0000000a 00000002 00000002 00000002 (nil)
0x9e0000 0x100000
nouveau: ch8: buf 00000005 00000015 00000002 00000000 00000002 (nil)
0xf20000 0x2a0000
nouveau: ch8: buf 00000006 00000016 00000002 00000000 00000002 (nil)
0x11c0000 0x2a0000
nouveau: ch8: psh 00000000 0000000200 00000002b8
nouveau: 0x200203fd
nouveau: 0x03620000
nouveau: 0x02a30000
nouveau: 0x20090200
nouveau: 0x00000000
nouveau: 0x00f20000
nouveau: 0x00000362
nouveau: 0x000002a3
nouveau: 0x000000cf
nouveau: 0x00000040
nouveau: 0x00000001
nouveau: 0x00000000
nouveau: 0x00000000
nouveau: 0x200503f8
nouveau: 0x00000000
nouveau: 0x011c0000
nouveau: 0x00000016
nouveau: 0x00000040
nouveau: 0x00000000
nouveau: 0x2001054e
nouveau: 0x00000001
nouveau: 0x2003048a
nouveau: 0x00000362
nouveau: 0x000002a3
nouveau: 0x00010001
nouveau: 0x200105e7
nouveau: 0x00000000
nouveau: 0x20010487
nouveau: 0x0fac6881
nouveau: 0x80000574
nouveau: 0x800101d5
nouveau: 0x200308e0
nouveau: 0x00010000
nouveau: 0x00000000
nouveau: 0x00380000
nouveau: 0xa00308e3
nouveau: 0x000001a0
nouveau: 0x3f000000
nouveau: 0x3f000000
nouveau: 0x20040360
nouveau: 0x3f800000
nouveau: 0x3f800000
nouveau: 0x3f800000
nouveau: 0x3f800000
nouveau: 0x20010674
nouveau: 0x0000003c
nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido
nouveau: ch8: krec 0 pushes 1 bufs 9 relocs 0
nouveau: ch8: buf 00000000 0000000c 00000004 00000004 00000000
0x7fe3e1580000 0xb00000 0x80000
nouveau: ch8: buf 00000001 00000008 00000002 00000002 00000000 (nil)
0x2e0000 0xe0000
nouveau: ch8: buf 00000002 0000000b 00000002 00000002 00000000 (nil)
0xae0000 0x20000
nouveau: ch8: buf 00000003 0000000a 00000002 00000002 00000002 (nil)
0x9e0000 0x100000
nouveau: ch8: buf 00000004 00000006 00000004 00000000 00000004
0x7fe3e3c97000 0x215000 0x1000
nouveau: ch8: buf 00000005 00000015 00000002 00000000 00000002 (nil)
0xf20000 0x2a0000
nouveau: ch8: buf 00000006 00000016 00000002 00000000 00000002 (nil)
0x11c0000 0x2a0000
nouveau: ch8: buf 00000007 00000017 00000004 00000000 00000004
0x7fe3e264e000 0x254000 0x1000
nouveau: ch8: buf 00000008 00000010 00000004 00000004 00000004 (nil)
0x251000 0x1000
nouveau: ch8: psh 00000000 00000002b8 00000002e0
nouveau: 0x200406c0
nouveau: 0x00000000
nouveau: 0x00254000
nouveau: 0x00000001
nouveau: 0x00005002
nouveau: 0x200406c0
nouveau: 0x00000000
nouveau: 0x00215000
nouveau: 0x00000001
nouveau: 0x1000f010
init: 29.016s
nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido
nouveau: ch8: krec 0 pushes 1 bufs 9 relocs 0
nouveau: ch8: buf 00000000 0000000c 00000004 00000004 00000000
0x7fe3e1580000 0xb00000 0x80000
nouveau: ch8: buf 00000001 00000008 00000002 00000002 00000000 (nil)
0x2e0000 0xe0000
nouveau: ch8: buf 00000002 0000000b 00000002 00000002 00000000 (nil)
0xae0000 0x20000
nouveau: ch8: buf 00000003 0000000a 00000002 00000002 00000002 (nil)
0x9e0000 0x100000
nouveau: ch8: buf 00000004 00000006 00000004 00000000 00000004
0x7fe3e3c97000 0x215000 0x1000
nouveau: ch8: buf 00000005 00000015 00000002 00000000 00000002 (nil)
0xf20000 0x2a0000
nouveau: ch8: buf 00000006 00000016 00000002 00000000 00000002 (nil)
0x11c0000 0x2a0000
nouveau: ch8: buf 00000007 0000001a 00000002 00000000 00000002 (nil)
0x1540000 0x40000
nouveau: ch8: buf 00000008 0000001b 00000004 00000004 00000000
0x7fe3df080000 0x1580000 0x40000
nouveau: ch8: psh 00000000 00000002e0 0000000374
nouveau: 0x20056080
nouveau: 0x000000d5
nouveau: 0x00000000
(etc.)


Any help would be very welcome...

Some questions:
0. Should I add a complete terminal output in some way?
1. Is there anything I could do to help fix this issue?
2. What can I do to keep working with those programs until the issue gets
fixed?

Thanks a lot in advance, kind regards.

--000000000000979a770622d8d5d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I guess somewhat around a year I started to have this problem (I&#39;m =
on an updated Arch GNU+Linux laptop, Dell XPS 15) which disappeared with so=
me system updates but reappeared with others and it has stayed through vari=
ous updates for a while now...<br><br>Programs seem to run normally but the=
ir windows only show &quot;rain&quot;, nothing understandable.<br><br>It on=
ly happens with this programs, AFAICT:<br>$ chromium (avoidable with --disa=
ble-gpu )<br>$ epiphany<br>$ flatpak run chat.delta.desktop<br>$ jami (seem=
s to get fixed with: $ LIBGL_ALWAYS_SOFTWARE=3D1 jami )<br>$ mscore (aka, m=
usescore)<br><br>Despite variations on each program, the &#39;nouveau&#39; =
part I got in terminal output is always one of these (e.g.):<br><br>$ epiph=
any<br>(...)<br>nouveau: kernel rejected pushbuf: Argumento inv=C3=A1lido<b=
r>nouveau: ch8: krec 0 pushes 1 bufs 13 relocs 0<br>nouveau: ch8: buf 00000=
000 00000011 00000004 00000004 00000000 0x73f5ac047000 0xd00000 0x80000<br>=
nouveau: ch8: buf 00000001 00000007 00000002 00000002 00000000 (nil) 0x2600=
00 0x80000<br>nouveau: ch8: buf 00000002 0000002e 00000002 00000002 0000000=
0 (nil) 0x1ba7000 0x1000<br>nouveau: ch8: buf 00000003 0000002f 00000002 00=
000000 00000002 (nil) 0x1ba8000 0x1000<br>nouveau: ch8: buf 00000004 000000=
08 00000002 00000002 00000000 (nil) 0x2e0000 0xe0000<br>nouveau: ch8: buf 0=
0000005 0000000b 00000002 00000002 00000000 (nil) 0xae0000 0x20000<br>nouve=
au: ch8: buf 00000006 0000000a 00000002 00000002 00000002 (nil) 0x9e0000 0x=
100000<br>nouveau: ch8: buf 00000007 00000006 00000004 00000000 00000004 0x=
73f5b9299000 0x215000 0x1000<br>nouveau: ch8: buf 00000008 00000030 0000000=
2 00000002 00000000 (nil) 0x1ba9000 0x1000<br>nouveau: ch8: buf 00000009 00=
000048 00000002 00000002 00000000 (nil) 0x1f4e000 0x1000<br>nouveau: ch8: b=
uf 0000000a 00000017 00000004 00000004 00000000 0x73f5a7e35000 0x1320000 0x=
80000<br>nouveau: ch8: buf 0000000b 00000016 00000002 00000000 00000002 (ni=
l) 0xf00000 0x420000<br>nouveau: ch8: buf 0000000c 00000031 00000004 000000=
04 00000004 (nil) 0x1f5a000 0x1000<br>nouveau: ch8: psh 00000000 0000005374=
 0000005410<br>[0x00000000] HDR 200203fd subch 0 NINC<br>	mthd 0ff4 NV9097_=
SET_SURFACE_CLIP_HORIZONTAL<br>		.X =3D (0x0)<br>		.WIDTH =3D (0x556)<br>	m=
thd 0ff8 NV9097_SET_SURFACE_CLIP_VERTICAL<br>		.Y =3D (0x0)<br>		.HEIGHT =
=3D (0x2e7)<br><br>[0x00000003] HDR 20090200 subch 0 NINC<br>	mthd 0800 NV9=
097_SET_COLOR_TARGET_A(0)<br>		.OFFSET_UPPER =3D (0x0)<br>	mthd 0804 NV9097=
_SET_COLOR_TARGET_B(0)<br>		.OFFSET_LOWER =3D (0xf00000)<br>	mthd 0808 NV90=
97_SET_COLOR_TARGET_WIDTH(0)<br>		.V =3D (0x556)<br>	mthd 080c NV9097_SET_C=
OLOR_TARGET_HEIGHT(0)<br>		.V =3D (0x2e7)<br>	mthd 0810 NV9097_SET_COLOR_TA=
RGET_FORMAT(0)<br>		.V =3D A8R8G8B8<br>	mthd 0814 NV9097_SET_COLOR_TARGET_M=
EMORY(0)<br>		.BLOCK_WIDTH =3D ONE_GOB<br>		.BLOCK_HEIGHT =3D SIXTEEN_GOBS<=
br>		.BLOCK_DEPTH =3D ONE_GOB<br>		.LAYOUT =3D BLOCKLINEAR<br>		.THIRD_DIME=
NSION_CONTROL =3D THIRD_DIMENSION_DEFINES_ARRAY_SIZE<br>	mthd 0818 NV9097_S=
ET_COLOR_TARGET_THIRD_DIMENSION(0)<br>		.V =3D (0x1)<br>	mthd 081c NV9097_S=
ET_COLOR_TARGET_ARRAY_PITCH(0)<br>		.V =3D (0x0)<br>	mthd 0820 NV9097_SET_C=
OLOR_TARGET_LAYER(0)<br>		.OFFSET =3D (0x0)<br><br>[0x0000000d] HDR 2001054=
e subch 0 NINC<br>	mthd 1538 NV9097_SET_ZT_SELECT<br>		.TARGET_COUNT =3D (0=
x0)<br><br>[0x0000000f] HDR 20010487 subch 0 NINC<br>	mthd 121c NV9097_SET_=
CT_SELECT<br>		.TARGET_COUNT =3D (0x1)<br>		.TARGET0 =3D (0x0)<br>		.TARGET=
1 =3D (0x1)<br>		.TARGET2 =3D (0x2)<br>		.TARGET3 =3D (0x3)<br>		.TARGET4 =
=3D (0x4)<br>		.TARGET5 =3D (0x5)<br>		.TARGET6 =3D (0x6)<br>		.TARGET7 =3D=
 (0x7)<br><br>[0x00000011] HDR 80000574 subch 0 IMMD<br>	mthd 15d0 NV9097_S=
ET_ANTI_ALIAS<br>		.SAMPLES =3D MODE_1X1<br><br>[0x00000012] HDR 800101d5 s=
ubch 0 IMMD<br>	mthd 0754 NV9097_SET_HYBRID_ANTI_ALIAS_CONTROL<br>		.PASSES=
 =3D (0x1)<br>		.CENTROID =3D PER_FRAGMENT<br><br>[0x00000013] HDR 200308e0=
 subch 0 NINC<br>	mthd 2380 NV9097_SET_CONSTANT_BUFFER_SELECTOR_A<br>		.SIZ=
E =3D (0x10000)<br>	mthd 2384 NV9097_SET_CONSTANT_BUFFER_SELECTOR_B<br>		.A=
DDRESS_UPPER =3D (0x0)<br>	mthd 2388 NV9097_SET_CONSTANT_BUFFER_SELECTOR_C<=
br>		.ADDRESS_LOWER =3D (0x380000)<br><br>[0x00000017] HDR a00308e3 subch 0=
 1INC<br>	mthd 238c NV9097_LOAD_CONSTANT_BUFFER_OFFSET<br>		.V =3D (0x1a0)<=
br>	mthd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)<br>		.V =3D (0x3f000000)<br>	m=
thd 2390 NV9097_LOAD_CONSTANT_BUFFER(0)<br>		.V =3D (0x3f000000)<br><br>[0x=
0000001b] HDR 20040360 subch 0 NINC<br>	mthd 0d80 NV9097_SET_COLOR_CLEAR_VA=
LUE(0)<br>		.V =3D (0x0)<br>	mthd 0d84 NV9097_SET_COLOR_CLEAR_VALUE(1)<br>	=
	.V =3D (0x0)<br>	mthd 0d88 NV9097_SET_COLOR_CLEAR_VALUE(2)<br>		.V =3D (0x=
0)<br>	mthd 0d8c NV9097_SET_COLOR_CLEAR_VALUE(3)<br>		.V =3D (0x0)<br><br>[=
0x00000020] HDR 20010674 subch 0 NINC<br>	mthd 19d0 NV9097_CLEAR_SURFACE<br=
>		.Z_ENABLE =3D FALSE<br>		.STENCIL_ENABLE =3D FALSE<br>		.R_ENABLE =3D TR=
UE<br>		.G_ENABLE =3D TRUE<br>		.B_ENABLE =3D TRUE<br>		.A_ENABLE =3D TRUE<=
br>		.MRT_SELECT =3D (0x0)<br>		.RT_ARRAY_INDEX =3D (0x0)<br><br>[0x0000002=
2] HDR 200406c0 subch 0 NINC<br>	mthd 1b00 NV9097_SET_REPORT_SEMAPHORE_A<br=
>		.OFFSET_UPPER =3D (0x0)<br>	mthd 1b04 NV9097_SET_REPORT_SEMAPHORE_B<br>	=
	.OFFSET_LOWER =3D (0x215000)<br>	mthd 1b08 NV9097_SET_REPORT_SEMAPHORE_C<b=
r>		.PAYLOAD =3D (0xc)<br>	mthd 1b0c NV9097_SET_REPORT_SEMAPHORE_D<br>		.OP=
ERATION =3D RELEASE<br>		.RELEASE =3D AFTER_ALL_PRECEEDING_WRITES_COMPLETE<=
br>		.ACQUIRE =3D BEFORE_ANY_FOLLOWING_WRITES_START<br>		.PIPELINE_LOCATION=
 =3D ALL<br>		.COMPARISON =3D EQ<br>		.AWAKEN_ENABLE =3D FALSE<br>		.REPORT=
 =3D NONE<br>		.STRUCTURE_SIZE =3D ONE_WORD<br>		.SUB_REPORT =3D (0x0)<br>	=
	.REPORT_DWORD_NUMBER =3D (0x0)<br>		.FLUSH_DISABLE =3D FALSE<br><br>nouvea=
u: kernel rejected pushbuf: Argumento inv=C3=A1lido<br>nouveau: ch8: krec 0=
 pushes 1 bufs 11 relocs 0<br>nouveau: ch8: buf 00000000 00000011 00000004 =
00000004 00000000 0x73f5ac047000 0xd00000 0x80000<br>nouveau: ch8: buf 0000=
0001 00000016 00000002 00000000 00000002 (nil) 0xf00000 0x420000<br>nouveau=
: ch8: buf 00000002 0000002e 00000002 00000002 00000000 (nil) 0x1ba7000 0x1=
000<br>nouveau: ch8: buf 00000003 00000008 00000002 00000002 00000000 (nil)=
 0x2e0000 0xe0000<br>nouveau: ch8: buf 00000004 0000000b 00000002 00000002 =
00000000 (nil) 0xae0000 0x20000<br>nouveau: ch8: buf 00000005 0000000a 0000=
0002 00000002 00000002 (nil) 0x9e0000 0x100000<br>nouveau: ch8: buf 0000000=
6 00000006 00000004 00000000 00000004 0x73f5b9299000 0x215000 0x1000<br>nou=
veau: ch8: buf 00000007 00000030 00000002 00000002 00000002 (nil) 0x1ba9000=
 0x1000<br>nouveau: ch8: buf 00000008 00000048 00000002 00000002 00000000 (=
nil) 0x1f4e000 0x1000<br>nouveau: ch8: buf 00000009 00000017 00000004 00000=
004 00000000 0x73f5a7e35000 0x1320000 0x80000<br>nouveau: ch8: buf 0000000a=
 00000015 00000004 00000004 00000004 (nil) 0x1f5b000 0x1000<br>nouveau: ch8=
: psh 00000000 0000005410 00000054d0<br>[0x00000000] HDR 200308e0 subch 0 N=
INC<br>	mthd 2380 NV9097_SET_CONSTANT_BUFFER_SELECTOR_A<br>		.SIZE =3D (0x1=
00)<br>	mthd 2384 NV9097_SET_CONSTANT_BUFFER_SELECTOR_B<br>		.ADDRESS_UPPER=
 =3D (0x0)<br>	mthd 2388 NV9097_SET_CONSTANT_BUFFER_SELECTOR_C<br>		.ADDRES=
S_LOWER =3D (0x1ba9000)<br><br>[0x00000004] HDR a01f08e3 subch 0 1INC<br>	m=
thd 238c NV9097_LOAD_CONSTANT_BUFFER_OFFSET<br>		.V =3D (0x0)<br>	mthd 2390=
 NV9097_LOAD_CONSTANT_BUFFER(0)<br>		.V =3D (0x3abfe803)<br>	mthd 2390 NV90=
97_LOAD_CONSTANT_BUFFER(0)<br>		.V =3D (0x0)<br>(etc.)<br><br><br>$ flatpak=
 run chat.delta.desktop<br>(...)<br>nouveau: kernel rejected pushbuf: Argum=
ento inv=C3=A1lido<br>nouveau: ch8: krec 0 pushes 1 bufs 7 relocs 0<br>nouv=
eau: ch8: buf 00000000 0000000c 00000004 00000004 00000000 0x7fe3e1580000 0=
xb00000 0x80000<br>nouveau: ch8: buf 00000001 00000006 00000004 00000000 00=
000004 0x7fe3e3c97000 0x215000 0x1000<br>nouveau: ch8: buf 00000002 0000000=
8 00000002 00000002 00000000 (nil) 0x2e0000 0xe0000<br>nouveau: ch8: buf 00=
000003 0000000b 00000002 00000002 00000000 (nil) 0xae0000 0x20000<br>nouvea=
u: ch8: buf 00000004 0000000a 00000002 00000002 00000002 (nil) 0x9e0000 0x1=
00000<br>nouveau: ch8: buf 00000005 00000015 00000002 00000000 00000002 (ni=
l) 0xf20000 0x2a0000<br>nouveau: ch8: buf 00000006 00000016 00000002 000000=
00 00000002 (nil) 0x11c0000 0x2a0000<br>nouveau: ch8: psh 00000000 00000002=
00 00000002b8<br>nouveau: 	0x200203fd<br>nouveau: 	0x03620000<br>nouveau: 	=
0x02a30000<br>nouveau: 	0x20090200<br>nouveau: 	0x00000000<br>nouveau: 	0x0=
0f20000<br>nouveau: 	0x00000362<br>nouveau: 	0x000002a3<br>nouveau: 	0x0000=
00cf<br>nouveau: 	0x00000040<br>nouveau: 	0x00000001<br>nouveau: 	0x0000000=
0<br>nouveau: 	0x00000000<br>nouveau: 	0x200503f8<br>nouveau: 	0x00000000<b=
r>nouveau: 	0x011c0000<br>nouveau: 	0x00000016<br>nouveau: 	0x00000040<br>n=
ouveau: 	0x00000000<br>nouveau: 	0x2001054e<br>nouveau: 	0x00000001<br>nouv=
eau: 	0x2003048a<br>nouveau: 	0x00000362<br>nouveau: 	0x000002a3<br>nouveau=
: 	0x00010001<br>nouveau: 	0x200105e7<br>nouveau: 	0x00000000<br>nouveau: 	=
0x20010487<br>nouveau: 	0x0fac6881<br>nouveau: 	0x80000574<br>nouveau: 	0x8=
00101d5<br>nouveau: 	0x200308e0<br>nouveau: 	0x00010000<br>nouveau: 	0x0000=
0000<br>nouveau: 	0x00380000<br>nouveau: 	0xa00308e3<br>nouveau: 	0x000001a=
0<br>nouveau: 	0x3f000000<br>nouveau: 	0x3f000000<br>nouveau: 	0x20040360<b=
r>nouveau: 	0x3f800000<br>nouveau: 	0x3f800000<br>nouveau: 	0x3f800000<br>n=
ouveau: 	0x3f800000<br>nouveau: 	0x20010674<br>nouveau: 	0x0000003c<br>nouv=
eau: kernel rejected pushbuf: Argumento inv=C3=A1lido<br>nouveau: ch8: krec=
 0 pushes 1 bufs 9 relocs 0<br>nouveau: ch8: buf 00000000 0000000c 00000004=
 00000004 00000000 0x7fe3e1580000 0xb00000 0x80000<br>nouveau: ch8: buf 000=
00001 00000008 00000002 00000002 00000000 (nil) 0x2e0000 0xe0000<br>nouveau=
: ch8: buf 00000002 0000000b 00000002 00000002 00000000 (nil) 0xae0000 0x20=
000<br>nouveau: ch8: buf 00000003 0000000a 00000002 00000002 00000002 (nil)=
 0x9e0000 0x100000<br>nouveau: ch8: buf 00000004 00000006 00000004 00000000=
 00000004 0x7fe3e3c97000 0x215000 0x1000<br>nouveau: ch8: buf 00000005 0000=
0015 00000002 00000000 00000002 (nil) 0xf20000 0x2a0000<br>nouveau: ch8: bu=
f 00000006 00000016 00000002 00000000 00000002 (nil) 0x11c0000 0x2a0000<br>=
nouveau: ch8: buf 00000007 00000017 00000004 00000000 00000004 0x7fe3e264e0=
00 0x254000 0x1000<br>nouveau: ch8: buf 00000008 00000010 00000004 00000004=
 00000004 (nil) 0x251000 0x1000<br>nouveau: ch8: psh 00000000 00000002b8 00=
000002e0<br>nouveau: 	0x200406c0<br>nouveau: 	0x00000000<br>nouveau: 	0x002=
54000<br>nouveau: 	0x00000001<br>nouveau: 	0x00005002<br>nouveau: 	0x200406=
c0<br>nouveau: 	0x00000000<br>nouveau: 	0x00215000<br>nouveau: 	0x00000001<=
br>nouveau: 	0x1000f010<br>init: 29.016s<br>nouveau: kernel rejected pushbu=
f: Argumento inv=C3=A1lido<br>nouveau: ch8: krec 0 pushes 1 bufs 9 relocs 0=
<br>nouveau: ch8: buf 00000000 0000000c 00000004 00000004 00000000 0x7fe3e1=
580000 0xb00000 0x80000<br>nouveau: ch8: buf 00000001 00000008 00000002 000=
00002 00000000 (nil) 0x2e0000 0xe0000<br>nouveau: ch8: buf 00000002 0000000=
b 00000002 00000002 00000000 (nil) 0xae0000 0x20000<br>nouveau: ch8: buf 00=
000003 0000000a 00000002 00000002 00000002 (nil) 0x9e0000 0x100000<br>nouve=
au: ch8: buf 00000004 00000006 00000004 00000000 00000004 0x7fe3e3c97000 0x=
215000 0x1000<br>nouveau: ch8: buf 00000005 00000015 00000002 00000000 0000=
0002 (nil) 0xf20000 0x2a0000<br>nouveau: ch8: buf 00000006 00000016 0000000=
2 00000000 00000002 (nil) 0x11c0000 0x2a0000<br>nouveau: ch8: buf 00000007 =
0000001a 00000002 00000000 00000002 (nil) 0x1540000 0x40000<br>nouveau: ch8=
: buf 00000008 0000001b 00000004 00000004 00000000 0x7fe3df080000 0x1580000=
 0x40000<br>nouveau: ch8: psh 00000000 00000002e0 0000000374<br>nouveau: 	0=
x20056080<br>nouveau: 	0x000000d5<br>nouveau: 	0x00000000<br>(etc.)<br><br>=
<br>Any help would be very welcome...<br><br>Some questions:<br>0. Should I=
 add a complete terminal output in some way?<br>1. Is there anything I coul=
d do to help fix this issue?<br>2. What can I do to keep working with those=
 programs until the issue gets fixed?<br><br>Thanks a lot in advance, kind =
regards.

--000000000000979a770622d8d5d1--
