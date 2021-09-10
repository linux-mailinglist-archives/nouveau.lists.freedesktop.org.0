Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655E406888
	for <lists+nouveau@lfdr.de>; Fri, 10 Sep 2021 10:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C706E9A0;
	Fri, 10 Sep 2021 08:33:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2090.outbound.protection.outlook.com [40.92.89.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3796E9A0
 for <nouveau@lists.freedesktop.org>; Fri, 10 Sep 2021 08:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axhymAI0fTj3+abeF4643TmGyynlvNZcaJW1Q9ATs7NBRm+z8cXpAmmI77j/XUzrHuW55QEeU7NqBu9RRylOkBbFKK6x2GLpnqu+X3SCv7df0IR1V8mYWCOTQev+E67JtbjBgsOXJs1GLCp3CN/HqxelcawS9bGqHdLDyb8AgUegUyEmabLlrkbdj54aOUGlq1wOymD9QKfE85+U2dG8mEPRDEY0GkBRNkZDjSgO+N4rbKKQ8XwBt5KEZSzGpnSKd4q0g2aY1iAgAhIJ0EfQnYx/rcy0XMdhcA7fCn3HiQaRQGvaUokLyjyc6XMIzML6S6Ass07cDw1bQLXiD0ZNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=86B0i1mifUf5nImjyJo/9XEl4eohX0aP6JJJPXj8sJg=;
 b=TFcdaUizPjJQnXlyxcEhlK9yfKiMqaDIBqNtjZxYvrHYtvNFkBzo+0I7eFVpKcW0aqpTb7M1enLVPddRhljj+UP6/iEjx+q+NCM3bCi2iGl8nSVpdlABzLMVTMZ+I80WJqN7ccyCYwnnqq3R8CqLkUxizhkNvZbNTeDnuZEjV61HfnTNH0iZqW/eN8/nd4xT5KLtXJtKXUzcxyTjEwATH9bQiROnwdFaJBe79AcsebgWcczM21aLIpE/vvlC4Osv2AFBr7ixnHP7sn8uTfiRj2G5kltBtaFgI2GrEFm7c5v+2XDbOyfBS5Tl03fomv8e6zQsSV03YPMYRZOzb9Xaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86B0i1mifUf5nImjyJo/9XEl4eohX0aP6JJJPXj8sJg=;
 b=lDqgHQuMe29Bu8KeXLwi70F/21scoyU9PZKTZo599W70VhhIexAuvejyuk/jdq7rXzOMBAAwx939SCiMtn65pcp7nUuDFSnkqSqEoSuG5LBm3OxY8LuV0rfS0EGAwmYexKSvAhH2Foyh82IUGty0vnOnI7IwjIVhAFz5k1cj8nYCCOuXYuyowZvxzhQKsgbn3M+W1aLeucM52e7zSYpBbnUhOx//UAfxxPP4j9lYK7bUPGOWMdOuTRfNmSEQ/XxyEOP+1FBURYgbWM+jBvx+Cosgu/BUqju/0JyjcwFti6CELc1EAbTepjTiefWRZyZO+K31q4kGGU4+aTZ3p2GOrA==
Received: from AM7PR10MB3778.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:179::11)
 by AM7PR10MB3639.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 08:33:52 +0000
Received: from AM7PR10MB3778.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c84:c7f8:e98f:660b]) by AM7PR10MB3778.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5c84:c7f8:e98f:660b%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:33:52 +0000
From: Lam Bono <lambono80@outlook.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: Nouveau suspend issue (and possible bug detected)
Thread-Index: AQHXph3OfZdUSBOcskiRBqTUJ62Ggw==
Date: Fri, 10 Sep 2021 08:33:52 +0000
Message-ID: <AM7PR10MB37789B2F610F0D8DC06800A4B8D69@AM7PR10MB3778.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f2e034cc-05a1-64eb-3575-0779263dc285
x-tmn: [UEfUv1uIntZVG75cycRTTs21Zl4/QOPI]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f0e23f6-ef61-469d-59e1-08d97435b829
x-ms-traffictypediagnostic: AM7PR10MB3639:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVSm39k6yAivhvVKVqDEtEoyr/tfqlMDtTYyaR784edPjwGHWgo37pu+M3DLv4p7BQIzrOOeZMDQ7p0AEehlpokpzWf1w4opapNNblpVVI7uBoUHCZfUBwdmKJ2BJ3JCDdQu+e+rGD+QjNBV1BrGMVzNtOBPmCW+H1m0rzcgyv5GaoeW+qdLdds64g/aYElSirNXhWAPWSPR/eNvIJMMzXrnRsw4BZwJgI1ZLfBH32PLgpBzbybt+RuaAEpA1/KdOKRB0D3UIs952/irrMPgSNXc8VL+OgZZwQHzxKlmgWDBetRaDBf4pq4l+djSAiz7ldYxsoYeIH/WK85vxLdRCbdcg+4/rcfAkrZyVDcEHBtHyTq5wiTNL0EegVk0G81OhZQLj6jVERvyQMqn0lhQAlqmfpqtUlZooJeZ+lkOIc/wl7YtFkqROzqtwF09d6d9
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: UPSg4eP1Ems1xqx56u7imeCDbiVaX7sjCZ8/UiEvGLlzmtvoskcQIrenSwfv1Lu1PQ3lBYtiBJTFwCw7cwSC+fkaaDgX4lGYkRIBSWNSDOV2lkwzRcK+bP/fYbPaywONQ3BmjzjIy9Ksa3AzfTlb1w==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM7PR10MB37789B2F610F0D8DC06800A4B8D69AM7PR10MB3778EURP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3778.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0e23f6-ef61-469d-59e1-08d97435b829
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 08:33:52.0506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3639
Subject: [Nouveau] Nouveau suspend issue (and possible bug detected)
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

--_000_AM7PR10MB37789B2F610F0D8DC06800A4B8D69AM7PR10MB3778EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

please take a look at following issue reported at https://gitlab.freedeskto=
p.org/xorg/driver/xf86-video-nouveau/-/issues/547
[https://gitlab.freedesktop.org/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e=
36621930cd36ea87924c11ff65dbcb8ed50dca58.png]<https://gitlab.freedesktop.or=
g/xorg/driver/xf86-video-nouveau/-/issues/547>
Kernel 5.0 and above suspend issue (#547) =B7 Issues =B7 xorg / driver / xf=
86-video-nouveau<https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouv=
eau/-/issues/547>
From Linux 5.0 I can't use suspension on my notebook. I have a GeForce 9600=
M GT graphic card. It is equiped on my old but good HP Dv5-1199el...
gitlab.freedesktop.org

It looks like init_on_alloc=3D0 is workaround but it should not be like tha=
t, as this workaround diminish security.

--_000_AM7PR10MB37789B2F610F0D8DC06800A4B8D69AM7PR10MB3778EURP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
please take a look at following issue reported at <a href=3D"https://gitlab=
.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547" id=3D"LPlnk">
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547<=
/a><br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvZHJpd=
mVyL3hmODYtdmlkZW8tbm91dmVhdS8tL2lzc3Vlcy81NDc." class=3D"LPBorder166683" s=
tyle=3D"width: 100%; margin-top: 16px; margin-bottom: 16px; position: relat=
ive; max-width: 800px; min-width: 424px;">
<table id=3D"LPContainer166683" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr style=3D"border-spacing: 0px;" valign=3D"top">
<td>
<div id=3D"LPImageContainer166683" style=3D"position: relative; margin-righ=
t: 12px; height: 160px; overflow: hidden;">
<a target=3D"_blank" id=3D"LPImageAnchor166683" href=3D"https://gitlab.free=
desktop.org/xorg/driver/xf86-video-nouveau/-/issues/547"><img id=3D"LPThumb=
nailImageId166683" alt=3D"" style=3D"display: block;" width=3D"160" height=
=3D"160" src=3D"https://gitlab.freedesktop.org/assets/gitlab_logo-7ae504fe4=
f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle166683" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: &quot;wf_segoe-ui_light&quot;, &quot;Segoe UI Li=
ght&quot;, &quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP=
&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor166683" href=3D"https://gitlab.freede=
sktop.org/xorg/driver/xf86-video-nouveau/-/issues/547" style=3D"text-decora=
tion: none; color: var(--themePrimary);">Kernel 5.0 and above suspend issue=
 (#547) =B7 Issues =B7 xorg / driver / xf86-video-nouveau</a></div>
<div id=3D"LPDescription166683" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: &quot;wf_segoe-ui_normal&quot;, &=
quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margi=
n-bottom: 12px; margin-right: 8px; overflow: hidden;">
From Linux 5.0 I can't use suspension on my notebook. I have a GeForce 9600=
M GT graphic card. It is equiped on my old but good HP Dv5-1199el...</div>
<div id=3D"LPMetadata166683" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: &quot;wf_segoe-ui_normal&quot;, &quot=
;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
gitlab.freedesktop.org</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It looks like init_on_alloc=3D0 is workaround but it should not be like tha=
t, as this workaround diminish security.<br>
</div>
</body>
</html>

--_000_AM7PR10MB37789B2F610F0D8DC06800A4B8D69AM7PR10MB3778EURP_--
