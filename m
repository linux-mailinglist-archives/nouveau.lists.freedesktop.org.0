Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763C90858E
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2024 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAAD10EC97;
	Fri, 14 Jun 2024 08:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hxN/hnDB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047410EC8C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2024 08:00:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70413de08c7so1418373b3a.0
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2024 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718352052; x=1718956852; darn=lists.freedesktop.org;
 h=mime-version:msip_labels:content-language:accept-language
 :in-reply-to:references:message-id:date:thread-index:thread-topic
 :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2UvYDQ9ox1p/e43xrmDVIgA7OrF2Iru+vCryn+Jonk=;
 b=hxN/hnDBSU+u6T85eMQxCJoCaM6Chxz1woKTsXEfo6LlIb8MYa2sM/EccxrBsiCmNZ
 NuGJUHqhH1REqBJHac7aZU71WKITHzREuvkJy6pdZz8W77ZFBl3oTZCNbjz4PoBHHS58
 g62k3tlcHB62HYv7c6FI/7CpTN9lAYAZT+cuSP4RGGTzkx95B6i17d3w/UXNnKyms93N
 ohcL7nQc0deZKel1wuRbS+/c3Ahg0lFUb63mdF77oBOZ8fM/osDAIqBlTxwGgIXK0gda
 RS4W22+qAG071X1ZE5j6JjRZoWN3zWcMgSFzgS9XqlUNXL+ewl/Xox8e7oIOIJi3hrvo
 +VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352052; x=1718956852;
 h=mime-version:msip_labels:content-language:accept-language
 :in-reply-to:references:message-id:date:thread-index:thread-topic
 :subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2UvYDQ9ox1p/e43xrmDVIgA7OrF2Iru+vCryn+Jonk=;
 b=rgWWJVJ6c8V4A9jRxgaTPY/cy67WPX3RcgPxTusDrEglwuiI3JTJL/Y8K3jW1MKK38
 Z7g6HEuaHwsxHse58gOVHDvzYq3GJj983saVpTLkAH63ND5CaXy1HGPEx7pcQGcrbvGU
 azumeKjs6QsoydMYOXA/KxQUu9Sc1W12Ykm6gdeF0m+FLWdcVk7HfLs8X8NjQMAGYBUZ
 NkrOqUJjJt3olS/X22ZhJf53QEqIKEZS8uKNqBFxfmtk4rGYYpiaJsfVM210df7OSgOm
 NLwVJRWZ70oz+5xqlZU8JMTuNpzSeHG2RpbOgwfSN4/iKRYPibXxl691aLy7PaYGJGLL
 Xb9g==
X-Gm-Message-State: AOJu0Yxt7swbQq+JV7vZiqN63MAJGJGZKuv3fVxRxLabt8cQGx/Jk14I
 IX0QjwUACsEnhwF/xcWPKiDZiA09X04YFkeLTTEdNeL9CEiEo/T6w8wT4w==
X-Google-Smtp-Source: AGHT+IG9dmitTBLIxV3X6AqTPn1f7sBcLdo+252p/110FiLgUskejk+xj0EF6p47Er1Q0Z5a/+iyzw==
X-Received: by 2002:aa7:8b8d:0:b0:705:c029:c9a7 with SMTP id
 d2e1a72fcca58-705d715fd67mr1775301b3a.15.1718352051806; 
 Fri, 14 Jun 2024 01:00:51 -0700 (PDT)
Received: from SI2PR01MB4155.apcprd01.prod.exchangelabs.com
 ([2603:1046:c01:24a6::5]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96868dsm2499969b3a.65.2024.06.14.01.00.50
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:00:51 -0700 (PDT)
From: Flavio Bagnato <flaviobagnato@gmail.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: nouveau freezing desktop - Ubuntu 24.04 - NVIDIA GeForce GT 330M
Thread-Topic: nouveau freezing desktop - Ubuntu 24.04 - NVIDIA GeForce GT 330M
Thread-Index: AVE0MFNqvrEJlzOpYUCsrhKe4r20DJMUASSy
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 14 Jun 2024 08:00:44 +0000
Message-ID: <SI2PR01MB41551BAFD4DB5C7A422D955CA9C22@SI2PR01MB4155.apcprd01.prod.exchangelabs.com>
References: <CAA2vdr7qdj=N-SLXQn8SjMbRtvOLg0w61kvUF2W46vO9O5gpdQ@mail.gmail.com>
In-Reply-To: <CAA2vdr7qdj=N-SLXQn8SjMbRtvOLg0w61kvUF2W46vO9O5gpdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: multipart/alternative;
 boundary="_000_SI2PR01MB41551BAFD4DB5C7A422D955CA9C22SI2PR01MB4155apcp_"
MIME-Version: 1.0
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

--_000_SI2PR01MB41551BAFD4DB5C7A422D955CA9C22SI2PR01MB4155apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since setting the grub setting to GRUB_CMDLINE_LINUX_DEFAULT=3D"nomodeset" =
to fix the problem I experimented with the nouveau parameters and found ano=
ther workaround which is a better solution as it still leaves the original =
video drivers loaded (where as the setting nomodeset replaces the original =
video drivers with the standard VGA driver).
Setting the grub setting to GRUB_CMDLINE_LINUX_DEFAULT=3D"nouveau.NvMXMDCB=
=3D0" fixes the freezing.
This does not fix the 2 messages that are repeated regularly but avoids the=
 freezing.
The 2 messages that are a problem are:
nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]] s=
ubc 3 class 8597 mthd 1304 data 1d1c1b1a
nouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]

________________________________
From: Flavio Bagnato <flaviobagnato@gmail.com>
Sent: 12 June 2024 16:51
To: nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>
Subject: nouveau freezing desktop - Ubuntu 24.04 - NVIDIA GeForce GT 330M

Hello,

I recently installed Ubuntu 24.04 on a MacBook Pro (Mid-2010) running a NVI=
DIA GeForce GT 330M adapter.

Unfortunately the computer is constantly freezing.

If I pass "nomodeset" to grub, the nouveau driver is not used and the compu=
ter does not freeze so it seems to be related to the nouveau driver.

I am wanting to know if there are any parameters I can pass to nouveau to r=
esolve the freezing.

I have tried temporarily replacing nomodeset with nouveau.noaccel=3D1 then =
with nouveau.nofbaccel=3D1 but both caused the booting to freeze.

I have also tried temporarily replacing nomodeset with nouveau.modeset=3D0 =
to disable nouveau but got a blank screen whilst booting (I've seen this bl=
ank screen reported by others on the web).

I should be reporting a bug I assume but when the computer freezes I have t=
o turn the computer off and therefore dmesg is not an option to provide log=
s.

I have noticed in dmesg however 2 messages that read:

nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]] s=
ubc 3 class 8597 mthd 1304 data 1d1c1b1a

followed by......

nouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]

These 2 messages are repeated regularly.

Is there anything I can do (like pass any parameters) that may resolve the =
computer freezing?

Regards,

Flavio

--_000_SI2PR01MB41551BAFD4DB5C7A422D955CA9C22SI2PR01MB4155apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin: 0px; min-height: 68px;">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: nowrap; margin: 2px 0px 0px 48px; display: block; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Since setting the grub setting to GRUB_CMDLINE_LINUX_DEFAULT=3D&quot;nomode=
set&quot; to fix the problem I experimented with the nouveau parameters and=
 found another workaround which is a better solution as it still leaves the=
 original video drivers loaded (where as the
 setting nomodeset replaces the original video drivers with the standard VG=
A driver).<br>
Setting the grub setting to GRUB_CMDLINE_LINUX_DEFAULT=3D&quot;nouveau.NvMX=
MDCB=3D0&quot; fixes the freezing.</div>
</div>
<div style=3D"margin: 12px 16px 0px 52px; padding-bottom: 2px;">
<div class=3D"elementToProof" style=3D"direction: ltr; margin: 0px; font-fa=
mily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This does not fix the 2 messages that are repeated regularly but avoids the=
 freezing.</div>
<div style=3D"direction: ltr; margin: 1em 0px; font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
The 2 messages that are a problem are:</div>
<div style=3D"direction: ltr; margin: 1em 0px; font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]] s=
ubc 3 class 8597 mthd 1304 data 1d1c1b1a</div>
<div style=3D"direction: ltr; margin: 1em 0px; font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
nouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]</div>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Flavio Bagnato &lt;fl=
aviobagnato@gmail.com&gt;<br>
<b>Sent:</b> 12 June 2024 16:51<br>
<b>To:</b> nouveau@lists.freedesktop.org &lt;nouveau@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> nouveau freezing desktop - Ubuntu 24.04 - NVIDIA GeForce GT=
 330M</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Hello,</div>
<div><br>
</div>
<div>I recently installed Ubuntu 24.04 on a MacBook Pro (Mid-2010) running =
a NVIDIA GeForce GT 330M adapter.</div>
<div><br>
</div>
<div>Unfortunately the computer is constantly freezing.</div>
<div><br>
</div>
<div>If I pass &quot;nomodeset&quot; to grub, the nouveau driver is not use=
d and the computer does not freeze so it seems to be related to the nouveau=
 driver.</div>
<div><br>
</div>
<div>I am wanting to know if there are any parameters I can pass to nouveau=
 to resolve the freezing.</div>
<div><br>
</div>
<div>I have tried temporarily replacing nomodeset with nouveau.noaccel=3D1 =
then with nouveau.nofbaccel=3D1 but both caused the booting to freeze.
<br>
</div>
<div><br>
</div>
<div>I have also tried temporarily replacing nomodeset with nouveau.modeset=
=3D0 to disable nouveau but got a blank screen whilst booting (I've seen th=
is blank screen reported by others on the web).
<br>
</div>
<div><br>
</div>
<div>I should be reporting a bug I assume but when the computer freezes I h=
ave to turn the computer off and therefore dmesg is not an option to provid=
e logs.</div>
<div><br>
</div>
<div>I have noticed in dmesg however 2 messages that read:</div>
<div></div>
<div>
<p>nouveau 0000:01:00.0: gr: 00100000 [] ch 3 [001fa70000 gnome-shell[1509]=
] subc 3 class 8597 mthd 1304 data 1d1c1b1a</p>
<p>followed by......</p>
<p>nouveau 0000:01:00.0: gr: DATA_ERROR 00000012 [RT_LINEAR_WITH_ZETA]</p>
<p>These 2 messages are repeated regularly.</p>
<p>Is there anything I can do (like pass any parameters) that may resolve t=
he computer freezing?</p>
<p>Regards,</p>
<p>Flavio<br>
</p>
</div>
</div>
</div>
</body>
</html>

--_000_SI2PR01MB41551BAFD4DB5C7A422D955CA9C22SI2PR01MB4155apcp_--
