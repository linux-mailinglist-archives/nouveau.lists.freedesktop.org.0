Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C597DF4E
	for <lists+nouveau@lfdr.de>; Sun, 22 Sep 2024 00:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5A10E2D7;
	Sat, 21 Sep 2024 22:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dt81y5xy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC6610E2D7
 for <nouveau@lists.freedesktop.org>; Sat, 21 Sep 2024 22:02:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20570b42f24so34997615ad.1
 for <nouveau@lists.freedesktop.org>; Sat, 21 Sep 2024 15:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726956177; x=1727560977; darn=lists.freedesktop.org;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=JgL9JCjIo0JfbQVLi8+Xl++G0B3p5lOATn1IrJKEss0=;
 b=Dt81y5xyLj04xA/TPw9zaKfLXXp5UjYRFf6xJ5t8o7Q0rGtcOHFJzTJsZkEXrrI0pJ
 3+8VRy6fRin7HcligIl3o38yf0vFVCztT4KR0XGeGIZeFnzjfpbuhvtjnf4DIxeB/b0d
 WP6wwW6rnoKkkwjELMlIfkuh4tU0dCfoJRMCMoexfMmj8AWl+JddcUZ7GV6PiAoU/v6f
 ToA+xctW3QoBoB5e6//ADeXuZDqrzXkyrw/ScjtMOHnCO8GBRkMq8r6SWxY9/5SuEwYL
 40WU7iGpTw04aP99LeQFTaml4gmEITZYwr7BeevjGKrRS5/CM4K06FLqdUPL3alxql1P
 tGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726956177; x=1727560977;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JgL9JCjIo0JfbQVLi8+Xl++G0B3p5lOATn1IrJKEss0=;
 b=p9H7ysht5ic+zDaFa4vqEO81YKkMwJYJKdUL2W8CFms5Z5lsV7w5nlA5KtrRPHujcD
 ZH8s5+byq79PPpz6OJzvLAmjzvX9nfOOMBf92Lwd4JEaDBXLFAw8kvuF1TRisUF8a1iZ
 jtuznMUvc/V1wUw4Xr2bPvPot3i/q99feEeL0H1A5MEvVzL9Z2z8mvgJ6jSLKpNYCtZ4
 Q/uPt4LAW4TDl+VVch8TYeS2Qln6ZbH/DVRun4uBaLIshT58sNA3XXiH0cySgJef1Wp+
 eEPCKycNJY2Htwuou7x7ExbYNKBQPyLKQEDe5B0qM+vw+a0KVTXLY5Ov/VFwrjv67wiX
 W/0Q==
X-Gm-Message-State: AOJu0YwobPD5hHo2pjY0SwfPmAv+s8DdZVSGQDkAAJ19R9+TeeUNXgtj
 un+PjJmxv2DKEn7iou7GlxPWdPVfo0WIhcfCDphCd+aea6qxKIi5+neI5w==
X-Google-Smtp-Source: AGHT+IGWC+SIKwZxCz50mXKN0XqHW2fmOirv7uaJMDtBUj/aFVBx4TWl9vi7zYq5hGzh9G8q/G3Eug==
X-Received: by 2002:a17:903:41c6:b0:205:410c:f3c2 with SMTP id
 d9443c01a7336-208d83f056bmr103039695ad.41.1726956177333; 
 Sat, 21 Sep 2024 15:02:57 -0700 (PDT)
Received: from smtpclient.apple ([2001:8004:27e1:71c9:ad62:88cd:e23b:cbe4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946d64dfsm112622545ad.134.2024.09.21.15.02.56
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2024 15:02:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-AD033388-D027-472F-BD3F-D5A52C70E772
Content-Transfer-Encoding: 7bit
From: Jack Harrington <jackharro282@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Options for xorg.conf supported by driver
Message-Id: <CAA32EA3-A8A4-4243-AC1E-DCCFE71C4E27@gmail.com>
Date: Sun, 22 Sep 2024 08:02:54 +1000
To: Nouveau Mailing List <nouveau@lists.freedesktop.org>
X-Mailer: iPhone Mail (20H19)
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


--Apple-Mail-AD033388-D027-472F-BD3F-D5A52C70E772
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



G'day,

Thanks for that Ilia! I'll have a look at these options.

By the way, I forgot to mention that I'm running Wayland in GNOME, so I'm no=
t sure if there's anything to be careful about there?

Cheers,
 Jack Harrington.=

--Apple-Mail-AD033388-D027-472F-BD3F-D5A52C70E772
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><meta http-e=
quiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr=
"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><=
br><br><div dir=3D"ltr"><p style=3D"margin: 0px 0px 7.5px; font-style: norma=
l; font-variant-caps: normal; font-stretch: normal; font-size: 14px; line-he=
ight: normal; font-family: Verdana; font-size-adjust: none; font-kerning: au=
to; font-variant-alternates: normal; font-variant-ligatures: normal; font-va=
riant-numeric: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; font-feature-settings: normal; font-optical-sizing: auto; font-va=
riation-settings: normal;">G'day,</p><p style=3D"margin: 0px 0px 24px; font-=
style: normal; font-variant-caps: normal; font-stretch: normal; font-size: 1=
4px; line-height: normal; font-family: Verdana; font-size-adjust: none; font=
-kerning: auto; font-variant-alternates: normal; font-variant-ligatures: nor=
mal; font-variant-numeric: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; font-feature-settings: normal; font-optical-sizing: a=
uto; font-variation-settings: normal;">Thanks for that Ilia! I'll have a loo=
k at these options.</p><p style=3D"margin: 0px 0px 24px; font-style: normal;=
 font-variant-caps: normal; font-stretch: normal; font-size: 14px; line-heig=
ht: normal; font-family: Verdana; font-size-adjust: none; font-kerning: auto=
; font-variant-alternates: normal; font-variant-ligatures: normal; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; font-feature-settings: normal; font-optical-sizing: auto; font-vari=
ation-settings: normal;">By the way, I forgot to mention that I'm running Wa=
yland in GNOME, so I'm not sure if there's anything to be careful about ther=
e?</p><p style=3D"margin: 0px; font-style: normal; font-variant-caps: normal=
; font-stretch: normal; font-size: 19px; line-height: normal; font-family: G=
eorgia; font-size-adjust: none; font-kerning: auto; font-variant-alternates:=
 normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-=
variant-east-asian: normal; font-variant-position: normal; font-feature-sett=
ings: normal; font-optical-sizing: auto; font-variation-settings: normal;"><=
span style=3D"font-style: italic;">Cheers,</span></p><p style=3D"margin: 0px=
 0px 36px; font-style: normal; font-variant-caps: normal; font-stretch: norm=
al; font-size: 24px; line-height: normal; font-family: Georgia; font-size-ad=
just: none; font-kerning: auto; font-variant-alternates: normal; font-varian=
t-ligatures: normal; font-variant-numeric: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; font-feature-settings: normal; font-op=
tical-sizing: auto; font-variation-settings: normal;"><span style=3D"font-st=
yle: italic;">&nbsp;Jack Harrington.</span></p></div></div></div></div></bod=
y></html>=

--Apple-Mail-AD033388-D027-472F-BD3F-D5A52C70E772--
