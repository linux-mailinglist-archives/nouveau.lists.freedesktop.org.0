Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DED15160F
	for <lists+nouveau@lfdr.de>; Tue,  4 Feb 2020 07:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0661889ACC;
	Tue,  4 Feb 2020 06:44:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2046.outbound.protection.outlook.com [40.92.89.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D426E415
 for <nouveau@lists.freedesktop.org>; Mon,  3 Feb 2020 17:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgNhtMeUrbT/JXdD0TOR6rX+cZecLztQVPwp7EZr+z0omCcmFBqki4OkHFW8CqKjdK3vYH7+Ok0+4SQhoC/z3wOPlTqz9HQqaCTrMNkIJSpWQlwI5jE9YpW7YJIpgniCi5g73wF99CuXsyo/3saCX/Df78CsCFS/KWw9ri1YQMSXUoAtMb+O+6PdifpHmjEZXdj9t1K1p78Fxn9yWk26gOyVg3mZ51UKa/eN0BjrJRbu7laNVTtpqsXXyemGPpupep5aGmPmbN2MHPQpWBIccTnaOvlvyMlVdcqdsP643xazaKqX06o2je3U1G0OLBUKTbVQEfp1PYRZAd/h4wKw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRMa7nGHbvzltV4Zq/s0LZWHudfDkTCZLZFY9c+sGTU=;
 b=GYgz14fymzCNCiGkhZ1DrqDqTmydFe/hquIsu94oO5DtyoDvpTssQ7dYwRcQj9CdlF8Is5m8373kY34K1N3XMz+gaZzsSRO7H27Bma7yCFrsLbZa3dWv1X2M62vqvt7GOjomyxucbE9LqHHlbNO+y/+j6jc0ck34X6SZJsRIZHqNUdHwEMOlcw1lQ2m2hs3q4Fi6iuKcNpUGF1tGeo1p27RPOV/6CS2QOxvG5AJc1ZOreqXh5NoD9KxW+ACA41BuxlMGxT/5lp9R3ur38vygvLRZuCYUvxR5o/mj9euZjaaHijKqhg5AbzmmlspjAucreoInIxl8ql6DI0InqBv+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::3c) by
 DB8EUR05HT160.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::168)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.25; Mon, 3 Feb
 2020 17:53:00 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com (10.233.238.54) by
 DB8EUR05FT060.mail.protection.outlook.com (10.233.238.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.25 via Frontend Transport; Mon, 3 Feb 2020 17:53:00 +0000
Received: from PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::e0ce:9744:e15c:8656]) by PR1PR07MB5866.eurprd07.prod.outlook.com
 ([fe80::e0ce:9744:e15c:8656%4]) with mapi id 15.20.2707.018; Mon, 3 Feb 2020
 17:53:00 +0000
From: outlook user <Merouane.halhoul@hotmail.fr>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: GP107
Thread-Index: AQHVhmZxhGVOn/4a1Eybhh2wedbtZKdhzERrgKicTMw=
Date: Mon, 3 Feb 2020 17:53:00 +0000
Message-ID: <PR1PR07MB58667FA8CB328471D305AD5C97000@PR1PR07MB5866.eurprd07.prod.outlook.com>
References: <PR1PR07MB5866B97AB18B70DCAAF5323F976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>,
 <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
In-Reply-To: <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A0CA175458AF36C14D87576DB54780D568C067B211349E8D3207B1DEE5F6D621;
 UpperCasedChecksum:366131344FA35E9522DB4C692D384CF0C8D78BE5010E7C3EA3325F085AD80450;
 SizeAsReceived:7135; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1J9tVHaPGznkJNYnlrfQJUQcJylxUYq2oJmiMKaMyVEwmSh6JXSoy9+YnAQ+TqjJ]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 76cb4e51-1cab-4804-dfa0-08d7a8d1e8b1
x-ms-traffictypediagnostic: DB8EUR05HT160:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KC5tCLnm03ba2C1NJA8l4FVA0rBGl3pQ/np2KZzTKYZ49+HJ1ALbzGLy8VvKh2O2uygbo/VFsHDELy/XS++sqQSi002rMTdcEab+G2O+J/lifYLOHQ1rOGHw073WAvlk7ZAjMw9vpYphsrK+xGGzp7lVlY36o4iy+1ZCKFHZbDye3gC0UBWOU6BbIVPpstgO
x-ms-exchange-antispam-messagedata: 4yuLvN6m2wGm5fTpZ/5bAJrjMf5FDkkwtFitDmnDAEWNgxhoSHtKi8R/ZH/YERwQAjfWLmwW4wxgLSTMYbS7YslbuuNrzy0aCNrmcy8v0ffcL09rMy0AjCe4LUBu3QyaHGHCPfZr/pV1fmgHlJx/3WMxduB70pjwN68jijLMb9RspDojajZ1DDkTkUWpV7LMB9iTka3zaJyozdDJFi9axw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cb4e51-1cab-4804-dfa0-08d7a8d1e8b1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 17:53:00.0807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT160
X-Mailman-Approved-At: Tue, 04 Feb 2020 06:44:50 +0000
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
Content-Type: multipart/mixed; boundary="===============0836210928=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0836210928==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_PR1PR07MB58667FA8CB328471D305AD5C97000PR1PR07MB5866eurp_"

--_000_PR1PR07MB58667FA8CB328471D305AD5C97000PR1PR07MB5866eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is someone reads me ?
________________________________
De : outlook user <Pingo-Power@hotmail.fr>
Envoy=E9 : samedi 19 octobre 2019 13:01
=C0 : nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>
Objet : GP107

Hi,

I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only b=
lack screen. But nVidia and nomodeset works well


--_000_PR1PR07MB58667FA8CB328471D305AD5C97000PR1PR07MB5866eurp_
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
Is someone reads me ?<br>
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

--_000_PR1PR07MB58667FA8CB328471D305AD5C97000PR1PR07MB5866eurp_--

--===============0836210928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0836210928==--
