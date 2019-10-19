Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAFDD843
	for <lists+nouveau@lfdr.de>; Sat, 19 Oct 2019 13:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC5789C83;
	Sat, 19 Oct 2019 11:01:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092072085.outbound.protection.outlook.com [40.92.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F5C89C83
 for <nouveau@lists.freedesktop.org>; Sat, 19 Oct 2019 11:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDSusroRfeSaQ/HaFU7iuIahge98jNpVk8asaSKgZsb4PfQXclZ9ynNyd2paY5A4VX7KYnyutZygA5Y7L+BMNeRTH2+g4KoqpyJ7U3/4X5smYepOwAkX+ym83crseOvlLx0bAZYeOAWEFFI42a/qjkefalq06TpwWf63+EJr3FAiqRzI3yK+urPmf0cQ/JzPNy56JaUCVt1hezlFMFt0FZKl6GWn0AkpajBJHttD0hEOtWl0DFx1Xwj7sCpEPlhz1bDHhWOZFIAIQsr0fJClQIT3S6Hs1qECrXDrp4x06PXsrZiSDgxuDk9FXuhdlbhzWeBQHiVBFEt9CXkM1z+6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQN45vlmjIAVHc6STGNzOZp5z0UoqHzKBPvez5gafhI=;
 b=e/XKYi6KzpTAXD5UbIPjqXN0crt8E7Vb0lM2PxQyWb5LyIL98Rbqgq/4Vjft0O+erq4fVp/1Af5QYEkZRwSTosASl6qhEaAICOneP5kOchAfFNQK0b2OQHzblfnq8gDRrNhqR1bOUK/TUfdOsUV/C/QrAhNa7PbRJ/FqhKgi18cMuqTqtUAW1OtXQS6azuFr0EkONQ+hRb1w+jzeDaf5uPevytnq6reY6HFgaStwn5tGS7Nsp6INpTqDm9PW94K8rWiOiDHA9XOQcFzRuSKjaWgLPfuGRyO9iGOTn5FWvywo942+Ikf0rJ4SvNGX7+OGUsf8dG3SnSoYmOqBlGRj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (10.152.18.58) by VE1EUR03HT133.eop-EUR03.prod.protection.outlook.com
 (10.152.19.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Sat, 19 Oct
 2019 11:01:39 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com (10.152.18.51) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sat, 19 Oct 2019 11:01:39 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::4153:f8c8:efef:703c]) by PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::4153:f8c8:efef:703c%5]) with mapi id 15.20.2367.016; Sat, 19 Oct 2019
 11:01:38 +0000
From: outlook user <Pingo-Power@hotmail.fr>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: GP107
Thread-Index: AQHVhmZxhGVOn/4a1Eybhh2wedbtZKdhzERr
Date: Sat, 19 Oct 2019 11:01:38 +0000
Message-ID: <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
References: <PR1PR07MB5866B97AB18B70DCAAF5323F976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
In-Reply-To: <PR1PR07MB5866B97AB18B70DCAAF5323F976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B5B1FABF3E1932CFCB0E9982EE616CB60C029390E9C7884CD285686B138B936C;
 UpperCasedChecksum:7FBED229C89850FB64B4CECA0E74928AE1B30CA7FCDECAA761A95DCBCBC57C4A;
 SizeAsReceived:6814; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [hRthYzpj9viL/GFtVdVx8uELCrrWOCIG]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR03HT133:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+EebzFZuqvgKCatzqxok65BmOmCNZlXVySmboG+jS5g/VvT1Xwso/u4VoUQnueN3alrBfuaBZktjbzYu06538JJDArrUIaQWU3M09Q3C9hWjM8GQh9FYDhxnswgBoGyrDy8z86k2Ky/DmO/IjIjaX8Zu3FjyCN+RQG2+xh0H6T1G+H3PGM4nJ51XQkGyCQ6
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce4133-494d-4cc2-5064-08d75483b742
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2019 11:01:38.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT133
Subject: [Nouveau] GP107
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1330289303=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1330289303==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_PR1PR07MB5866535FDEDFA0AE91CEF044976F0PR1PR07MB5866eurp_"

--_000_PR1PR07MB5866535FDEDFA0AE91CEF044976F0PR1PR07MB5866eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only b=
lack screen. But nVidia and nomodeset works well


--_000_PR1PR07MB5866535FDEDFA0AE91CEF044976F0PR1PR07MB5866eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" text-align=3D"left">
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<span style=3D"font-size: 1em;">Hi,</span><br>
</div>
<div id=3D"id-a1c02250-9bcd-49d2-ad08-74fb18b32577" class=3D"ms-outlook-mob=
ile-reference-message">
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"color: rgb(33, 33, 33); background-color: rgb(255=
, 255, 255); text-align: left;">
<br>
</div>
<div dir=3D"ltr" style=3D"color: rgb(33, 33, 33); background-color: rgb(255=
, 255, 255); text-align: left;">
I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only b=
lack screen. But nVidia and nomodeset works well</div>
</div>
<br>
</div>
</div>
</body>
</html>

--_000_PR1PR07MB5866535FDEDFA0AE91CEF044976F0PR1PR07MB5866eurp_--

--===============1330289303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1330289303==--
