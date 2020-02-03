Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C570150EFA
	for <lists+nouveau@lfdr.de>; Mon,  3 Feb 2020 18:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7076E40C;
	Mon,  3 Feb 2020 17:56:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2103.outbound.protection.outlook.com [40.92.90.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E426E40C
 for <nouveau@lists.freedesktop.org>; Mon,  3 Feb 2020 17:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7J65xEJa/12kw96axKUfvcQJ1KoiAgyhOpas0Jk9QLVnzLw8qAHunrmzm1x/rj4qnnQ0/k5Ij3F6PO5oTa6u1OmnBV3xLF0kAD6nKm3tBDqaWRx0dcUC0VWTCd3mTvpf3g7WewCCnWbAMCkzONXZLSaNldOQhHv0el342lI2ztYu1X46IXyZzkmeGLuogSW1r3IoQ/b0x2D6CrWWf3l+WEpJ8pb4nYn3+Bn23TT60Wtck354S7UcRi3UHu41TM5AWNSu0dqtrmyUmAss3gfEH4Lvj7QlDF1TwOkbZrAe4SK+qnF3+cIhPNCOKE/xTrBlcWemk90L3w0YozwrUD5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdbyqkvwxDMZMuJIYNUS6WN8zVPOuw5752FJ+agYqIA=;
 b=NckuK9PikKOaEWo1DLUJMNJJ4798YDO7VLyZwqZUkCTLarpoy/sRGFX6H8uHK7MGX02Adxl5BveUig9GdPXPgxQsGgv7HJ9Cjebn5r8LV/4qUek8mDaiR4YQrRjdYSt5rRJq2TnNkQNpH9p4DtetYC64aJcIEd3MuQ3NeRNvJqwhsLNaMjSNSs/0ZQY2WAhSZQ6SiElZzKyn+hNKZQ4a89rj00GjGEXvBoynUkMOWv76WUnvzGtTPkjjLuITD/dSIDPo1Jz5P6S2+nzkrKTtynrqHQww+TR6ahZ7Zx9iiDNdySCrxYbFmEmQUg49RrfmYyizZ9Y0AwQX3irgv3Qtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::37) by
 VI1EUR05HT195.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::477)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.25; Mon, 3 Feb
 2020 17:56:29 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com (10.233.242.51) by
 VI1EUR05FT025.mail.protection.outlook.com (10.233.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.25 via Frontend Transport; Mon, 3 Feb 2020 17:56:29 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::e0ce:9744:e15c:8656]) by PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::e0ce:9744:e15c:8656%4]) with mapi id 15.20.2707.018; Mon, 3 Feb 2020
 17:56:29 +0000
From: outlook user <Pingo-Power@hotmail.fr>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: GP107
Thread-Index: AQHVhmZxhGVOn/4a1Eybhh2wedbtZKdhzERrgKidZ40=
Date: Mon, 3 Feb 2020 17:56:29 +0000
Message-ID: <PR1PR07MB58665667D594FC9BE31E07A097000@PR1PR07MB5866.eurprd07.prod.outlook.com>
References: <PR1PR07MB5866B97AB18B70DCAAF5323F976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>,
 <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
In-Reply-To: <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E193A0053D64F0693AFAA011BC39DF196466AC47BA1A9AC7028A63A5CDDA219D;
 UpperCasedChecksum:06987466C83649B74805BFD7F3123D63DCEDE234E3DFAE2530F00D65BAD5F001;
 SizeAsReceived:7129; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Er23z/8j+3CqqvBhNMH1If+z6Qu4xNvoLIDYn5mNO8vKc9khF3OA/MLvXBL7TMN9]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: f5b2e5d8-b8f0-412f-6c9e-08d7a8d2658c
x-ms-traffictypediagnostic: VI1EUR05HT195:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RmXx33HP3ElKmimpva2Ix5GBEmN/uE7FVDqo5pq5fJPPFw5UUlTbqgHMlLGatYVRy54FbZCqJZVi4k1tmfoltAo65U4ByDzK+FkjK/1lq6wa3E1FhSX2D2dR81gvKhX3A2ga9WfKUd6GSMqV1IZujOPvVxKJWvFBEuGTxdDuprmTnSTXTpP3PtGApyqwHI3g
x-ms-exchange-antispam-messagedata: TlBPvZuwRmoad8hb8LuQYo/BJdzgRm/NhO6e3JaTxNJ5WXi3LbvD0ei1OAgsLrj8gs/HAwlOYIxNIP2zPHhU8FAOZ9/+/uyqCw5WhGw5txASMEQjCGIhFsPpi29oQRV+egJjtu+1MYEQuxWfWmYYvD3ixysvjzP+7cN4w8CWI2OLmQXDdRrKRGFFkDe9fQaWqsGoBycCmICOshFm+AgkOA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b2e5d8-b8f0-412f-6c9e-08d7a8d2658c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 17:56:29.5805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT195
Subject: Re: [Nouveau] GP107
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
Content-Type: multipart/mixed; boundary="===============0489222810=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0489222810==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_PR1PR07MB58665667D594FC9BE31E07A097000PR1PR07MB5866eurp_"

--_000_PR1PR07MB58665667D594FC9BE31E07A097000PR1PR07MB5866eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is someone reading me ?
________________________________
De : outlook user <Pingo-Power@hotmail.fr>
Envoy=E9 : samedi 19 octobre 2019 13:01
=C0 : nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>
Objet : GP107

Hi,

I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only b=
lack screen. But nVidia and nomodeset works well


--_000_PR1PR07MB58665667D594FC9BE31E07A097000PR1PR07MB5866eurp_
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
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Is someone reading me ?<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> outlook user &lt;Pingo=
-Power@hotmail.fr&gt;<br>
<b>Envoy=E9 :</b> samedi 19 octobre 2019 13:01<br>
<b>=C0 :</b> nouveau@lists.freedesktop.org &lt;nouveau@lists.freedesktop.or=
g&gt;<br>
<b>Objet :</b> GP107</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"color:rgb(33,33,33); background-color:rgb(255,255=
,255); text-align:left">
<span style=3D"font-size:1em">Hi,</span><br>
</div>
<div id=3D"x_id-a1c02250-9bcd-49d2-ad08-74fb18b32577" class=3D"x_ms-outlook=
-mobile-reference-message">
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"color:rgb(33,33,33); background-color:rgb(255,255=
,255); text-align:left">
<br>
</div>
<div dir=3D"ltr" style=3D"color:rgb(33,33,33); background-color:rgb(255,255=
,255); text-align:left">
I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only b=
lack screen. But nVidia and nomodeset works well</div>
</div>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_PR1PR07MB58665667D594FC9BE31E07A097000PR1PR07MB5866eurp_--

--===============0489222810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0489222810==--
