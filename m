Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1E12B297
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8115389A4E;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2073.outbound.protection.outlook.com [40.92.18.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8928C6E0AA
 for <nouveau@lists.freedesktop.org>; Fri, 20 Dec 2019 03:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX59W1FtdoqubogfUjuS42Xnhhp3jswRixRk5zJtzsyy2lIycTLydjJyobeuE9ai479dy00aJ+swjnbfFNsc4xwcKubqSx/uRahPvH41zAypnSijIJy960WTT5oI3Qg9eQqQK+wzZpKqlp7UD8N/pk7bVK4zpfUXrSmKP8LKNzfrsJXd00rOelNfT4QABJCumgh+qR0ar8EmAUxQkutxQfcvI0BbozbnBsLK2FUXpTZvLG5ew2mvKhLjrxPXNppEadqi8vAagp0UdJD5/AtNCFvHw/h7gpoOFnzmw+J3KmwARwt2AUw2w2VDi8vsOdqEUIop4ECmZ7Ut5lFbaR3Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XANPKutMIrz0eeOzPt8vRSmjGBSqWMs5/vnNQvEbWEU=;
 b=gpbLvVSgpue1amtHAmUEX2M8csiGN4mN33xMhBIiJt66ggmsZsQ+ZDPJbKOFc5vO9BrrfPLxmeQbGW+Mer/RjsIlYUDY8+tl7pyKvzw2XXLouCSKRn0qah0laniyfYPAs+ipukFZmzxJzRfhUVaVNCa2WwolGPqQJ6SzEv3nW2APoyqW/QtpfY0huSHpI/c6k6FR7kx6w0beh2fIqgueFlMXfrE7VW3vLKsXb+1Sl3zxy5WEykxQ6zUwAqYnwYJqRzYaRurAfE4oNVS+BHXAHbbm4CAjbyGBJsaQVPxbNgSf9HCcfJa4CrSfNyMYQIwbAF52TYm/tM44VjkTnP6UDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XANPKutMIrz0eeOzPt8vRSmjGBSqWMs5/vnNQvEbWEU=;
 b=LoQqo+52eBEH9NgqbrVpmJd/ppPg8EvVTNKNy8Ddu/inIh8S265eB2FhDJiu4/JQ9Oc7YxaRQxZPp73vgJX+H0UgVthCQXT23Ceh0eGku4jPv3d9GFD3JHFX137hGzX82qDpSj6SjYqWO1pF7WOF5cYSxazsziFsMlV9CgJ/QkBiTAokQL+6GelZBUZC/BOIvq+2bThxCeTG8SYzywIJ2E1c7017b7j5NMmvLzevtxD35GAgw94kFUaBtvypvN7q8/PgY1k7mEM4Q32f8Bo4Zns5vwqphaUvFVPMTK2WfdqctnsgWlZcKzaRu2mkC00EU2/SXG2+87oKlqSpA2JAKQ==
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (10.13.172.56) by DM6NAM11HT024.eop-nam11.prod.protection.outlook.com
 (10.13.173.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14; Fri, 20 Dec
 2019 03:44:06 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com (10.13.172.51) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15 via Frontend Transport; Fri, 20 Dec 2019 03:44:06 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80]) by BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80%12]) with mapi id 15.20.2559.015; Fri, 20 Dec
 2019 03:44:06 +0000
From: Jairo Quintanilla <jairo_6875@hotmail.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: Flickering Nvidia GeForce GT210
Thread-Index: AQHVtucczS/F78XIUkSshOyFWFCPkA==
Date: Fri, 20 Dec 2019 03:44:06 +0000
Message-ID: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:9D3997645AF2F2F917E73DD1F0BF365FB6C27FEC18744782B8AF7F76C51DEDCA;
 UpperCasedChecksum:6275BC7DB4F2BAED07C227C731D567C94F4D085AEE7C6FC64F4C28848BE9359F;
 SizeAsReceived:6687; Count:42
x-tmn: [yY9u188hDdktoKrR9lojJMe/U+nb/GJ0]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: fc6cd97d-eafc-4bbd-c774-08d784fedd4e
x-ms-traffictypediagnostic: DM6NAM11HT024:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /qz9yMJDZ/+hSG2zLNfvdiYpGYrwPPlEbSnZIuwnIcr4OJcOCaQTFOWNWLqdswyJDxXG4U+LHpOkoP+t2uD9whCVlzIYjmSF6RmclDNdEaah7t3c+ir9MdV3QeylaDuOc+Pxtcog/0MmjzNJSVtOxJ7QZv2VqyRtEWys2mUCDfZXW/aC3AWX/jQs5/IFgL5M
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6cd97d-eafc-4bbd-c774-08d784fedd4e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 03:44:06.1253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT024
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] Flickering Nvidia GeForce GT210
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
Content-Type: multipart/mixed; boundary="===============0323425899=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0323425899==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB233713E4E456F3C33AF3CAB9E32D0BN6PR01MB2337prod_"

--_000_BN6PR01MB233713E4E456F3C33AF3CAB9E32D0BN6PR01MB2337prod_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi mates,

First to all thanks for your help.

I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, =
but I have some flickering issues when playing videos, only in the video wi=
ndows.

Sometimes I can see some flickering when scrolling.

Please help. I don't know how to fix it.


Atte. Jairo Quintanilla

--_000_BN6PR01MB233713E4E456F3C33AF3CAB9E32D0BN6PR01MB2337prod_
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
Hi mates,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
First to all thanks for your help.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, =
but I have some flickering issues when playing videos, only in the video wi=
ndows.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Sometimes I can see some flickering when scrolling.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Please help. I don't know how to fix it.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">Atte. Jairo Quintanilla<br>
</div>
</body>
</html>

--_000_BN6PR01MB233713E4E456F3C33AF3CAB9E32D0BN6PR01MB2337prod_--

--===============0323425899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0323425899==--
