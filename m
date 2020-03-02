Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66F175C77
	for <lists+nouveau@lfdr.de>; Mon,  2 Mar 2020 14:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714BE6E2A8;
	Mon,  2 Mar 2020 13:58:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn0828.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::828])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECBF6E2A8
 for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2020 13:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvSdtgrS8iYyv1jo01mC2sLDxKYXWCB1ZVo4BsdZa1lBT5sn6sgFi7QK2M8gqHNEaPBQ1Rn/rsC7U/I3Gp8YbQh3DhxcGUtd61mceI9zlUdH7/8SXILX9BEJRJQvredxtwPp+/XgYQJssKwH9aJoA037UflRl3xj7Er6hxBOAvVFRSKsTb1A1SjUMc6LgqgnNtphqRuAZan4qDp9NN28nrpmeXzOLykzTN1rxyC20SYwzYBc2nfzz41d3oOmxbSWTmUipsWqodhIonNqpz0AYoaQbcuMYdlNnLDl+F6wWmFeXjQBcf9QO4fjrDH6DEXIbg2hu1awMogb1Tm0GLJlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU3mbQv1x4oPJR10vU3EF1aaUiEbCXR7jXwxGt26Wi0=;
 b=V4dx8ptYKkpiHlyW5WcnZw8ny9PuWKX7NVbLGNt453l0WDbWmDSv3kzgf0jM+qSDUhQ69jOvWnCcGU/eEnmkaI+wZOOCZGqwQhQHrsBkH3WlhuGdUCXZVQija1igyewBD/TvBb68yb5Wcmm5gYSEmiipAE8bdHq3uBCH0aK1jh4VLOzmEH0xYVqwnPDJA1D96tyUsmTDWzkfVW8LMJx+dFkCTUCU8S7Qkj3FBTMiaMlvV8Kuk1+Ab6PjV7dIyS99F3vj5X7lbfzev7GJVriOZaiEqIHPTQuIqulpQVGa2D0pDW7BmExZ81p0GjX7pymM/Vx5L3DZImZS2X/VUxOeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU3mbQv1x4oPJR10vU3EF1aaUiEbCXR7jXwxGt26Wi0=;
 b=Sh2vZxg9wTixFi5KmV6OGU0jqi2j1aMMmH6JujF6QoSzXZW0kR++fb+ofOTWID46ze3vLhizNOVYgnh7NLnrJgDeKqRZTCfr0jgG2192ivqZIZM8tHj9vQwWU7fikmLODV6UdGCHspkdB9USzZtpMMl+C41cbgqK/+066ta2eJeOu9pYudprOwFGa0B8UnVRJH9FhDEraOgDhSUOe0RORJZP4+hZWLDnA60QmQkY7tPwswA3X+nwOYSBJAgwdXQW9YD3rUI0W1spLi1AxPVPRb1o5fW5jUO56lffYvYORw/faxYheiMmtzhTYKE8oxD2JgKk7256zeITbh/irg+y1g==
Received: from HE1EUR04FT055.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::38) by
 HE1EUR04HT179.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::391)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Mon, 2 Mar
 2020 13:58:05 +0000
Received: from AM6PR09MB3447.eurprd09.prod.outlook.com (10.152.26.57) by
 HE1EUR04FT055.mail.protection.outlook.com (10.152.27.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Mon, 2 Mar 2020 13:58:05 +0000
Received: from AM6PR09MB3447.eurprd09.prod.outlook.com
 ([fe80::3d05:4bdb:ba30:ff49]) by AM6PR09MB3447.eurprd09.prod.outlook.com
 ([fe80::3d05:4bdb:ba30:ff49%5]) with mapi id 15.20.2772.018; Mon, 2 Mar 2020
 13:58:05 +0000
From: Juan Manuel Alvarez <alvarez_juanma@hotmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Problems with nouveau driver in Ubuntu 18.04
Thread-Index: AQHV7VUVBS4hvAIvq0qYY/auqWko8agyof2AgAK4WcE=
Date: Mon, 2 Mar 2020 13:58:05 +0000
Message-ID: <AM6PR09MB34475CCDB0389669141C7803FBE70@AM6PR09MB3447.eurprd09.prod.outlook.com>
References: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0@AM6PR09MB3447.eurprd09.prod.outlook.com>,
 <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ@mail.gmail.com>
In-Reply-To: <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ@mail.gmail.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:83CFA471264F5CFF978B411F1DD932A67DA10F11A2EC7154DC8349D4499C24C4;
 UpperCasedChecksum:D2F354D14B16D64D420028FED0D37F75E5AC871685EB7E3B0971077D332FAABB;
 SizeAsReceived:7109; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [BlESwCYJtJhAAH9meQlUCqT/YqFY5LrB]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: bd88c96a-36b0-4cd2-bf4c-08d7beb1bb16
x-ms-traffictypediagnostic: HE1EUR04HT179:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 29uBzpSJtglRWeHWgHVS5vHTzmKb4j2pEr3QjQ4l7+nBtoxmy90FKOS3omTxG1tmAUdFrmMKyuxoE8yMX8ExqXxRHjKzO4OXfdouKPz9awmaPL3IqevGvPKHhmYF82nS2309SRVc56WMGEArDwX7azBVh1ynRKLEvJCmlxVhA8AJqwzBAy8u4ZNv0nlvULXfnh2Iz9R+52bI9TPBU6laAp+BO2seb5scJtxFOyMwLJU=
x-ms-exchange-antispam-messagedata: ENcg5q+js6Wd988wP30REYAVz2QTVgSi8zPvJZ3R6ZxcuKy59w88Of4gmKcMfOQHHxoOMtKU/NV2DatwZj8mFtzYRz4k/2rKFALwrF9vXpSsSz7zouZ7UbZeAKZ1jq33Xrw0QiMwDTjZBJVtVBBIUw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd88c96a-36b0-4cd2-bf4c-08d7beb1bb16
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 13:58:05.2354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT179
Subject: Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1277883636=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1277883636==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_"

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

It seems that it works! Thanks!

Regars!

________________________________
De: Ilia Mirkin <imirkin@alum.mit.edu>
Enviado: s=E1bado, 29 de febrero de 2020 20:25
Para: Juan Manuel Alvarez <alvarez_juanma@hotmail.com>
Cc: nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>
Asunto: Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04

Can you try to figure out what was updated in the latest updates? My
guess would be that it's actually the software used to display your
desktop/etc which changed.

You can disable all accel by booting with nouveau.noaccel=3D1.

Cheers,

  -ilia

On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez
<alvarez_juanma@hotmail.com> wrote:
>
> Hello,
>
>
> I use Ubuntu 18.04, since one of the last upgrades I have problems with n=
ouveau drivers.
>
> My screen look like the picture atteched.
>
>
>  [~]$ uname -a
> Linux  5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59 UTC 202=
0 x86_64 x86_64 x86_64 GNU/Linux
>
> [~]$ inxi -Gx
> Graphics:  Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0
>            Display Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution=
: 1920x1080@60.00hz, 1920x1080@60.00hz
>            OpenGL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render:=
 Yes
>
> I have tried to install Nvidia driver 304.137, but it seems is not suppor=
ted in Ubuntu 18.04 anymore.
>
>
> Are there any nouveau upgrade (that it is not on Canonical) that fixes th=
is problem?
>
> Or how I can downgrade nouveau driver to any previous one that works fine=
 in ubuntu 18.04 with my graphics card?
>
>
> Regards!
>
> Juanma
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi!</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
It seems that it works! Thanks!</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Regars!</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>De:</b> Ilia Mirkin &lt;imirkin=
@alum.mit.edu&gt;<br>
<b>Enviado:</b> s=E1bado, 29 de febrero de 2020 20:25<br>
<b>Para:</b> Juan Manuel Alvarez &lt;alvarez_juanma@hotmail.com&gt;<br>
<b>Cc:</b> nouveau@lists.freedesktop.org &lt;nouveau@lists.freedesktop.org&=
gt;<br>
<b>Asunto:</b> Re: [Nouveau] Problems with nouveau driver in Ubuntu 18.04</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Can you try to figure out what was updated in the =
latest updates? My<br>
guess would be that it's actually the software used to display your<br>
desktop/etc which changed.<br>
<br>
You can disable all accel by booting with nouveau.noaccel=3D1.<br>
<br>
Cheers,<br>
<br>
&nbsp; -ilia<br>
<br>
On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez<br>
&lt;alvarez_juanma@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt;<br>
&gt; I use Ubuntu 18.04, since one of the last upgrades I have problems wit=
h nouveau drivers.<br>
&gt;<br>
&gt; My screen look like the picture atteched.<br>
&gt;<br>
&gt;<br>
&gt;&nbsp; [~]$ uname -a<br>
&gt; Linux&nbsp; 5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59=
 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux<br>
&gt;<br>
&gt; [~]$ inxi -Gx<br>
&gt; Graphics:&nbsp; Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disp=
lay Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution: 1920x1080@60.00=
hz, 1920x1080@60.00hz<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Open=
GL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render: Yes<br>
&gt;<br>
&gt; I have tried to install Nvidia driver 304.137, but it seems is not sup=
ported in Ubuntu 18.04 anymore.<br>
&gt;<br>
&gt;<br>
&gt; Are there any nouveau upgrade (that it is not on Canonical) that fixes=
 this problem?<br>
&gt;<br>
&gt; Or how I can downgrade nouveau driver to any previous one that works f=
ine in ubuntu 18.04 with my graphics card?<br>
&gt;<br>
&gt;<br>
&gt; Regards!<br>
&gt;<br>
&gt; Juanma<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; Nouveau@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM6PR09MB34475CCDB0389669141C7803FBE70AM6PR09MB3447eurp_--

--===============1277883636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1277883636==--
