Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD4F12B4DF
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3566E446;
	Fri, 27 Dec 2019 13:33:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2058.outbound.protection.outlook.com [40.92.40.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6896E446
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGjZlkzxXGYEcAjXqJOh5X6I08T+AXRluVQy8QHbDRFIu5TJ7hjoIYjmnqQf1z745xNRq/TMQ9RNNGUDUG/DkyPWBMWbCmjKKxcX2g1dRiCpSNMNi6LrNm6eXLm+6a1qQcBXFhXWIqv6QFh02+Z5+9xhoYpCxKgg8UvGms+tkfdje7h+MUj/5tih0sqgtM8nnc2CNAP47aRZ6kJn8kH/lAOyXyj/ew4TWOMJCDk1x8avvXhsUlylRVVfUUfuMRietSZC9XsgVYwS6wVWoo8CA4JPUHMB6OLal4YivQaQSSkf3gz9UrYDqN1XnbpA4Uy5QhBpIrfGE8sioQAR7uuCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHSXsjqsPEE4giBY1zT7sPdEnAUYogO0g1mR42ar82s=;
 b=OqpN7F/Ek175yaxh45w+QGfoy9eQaiyRswvyY58Zl6rYiPJfp9WgbJx3uriAa8NWah/HZKb5gM/q339PrY2M4hLSoVtOLaZu3Fsoq7mu3ZuZA74V3dXwwcBc27NnEs6OIfWN5vEUOkPldm9Vs87hjsP8z7d+EcYmgSkZfo5hU7aqYtjbTCBqkN4CAfY/URVn9PEycC7c2slcOYEZ9+umseJFBk3VE4oy6X4Pmly5hgiOA4AoqpTABnnLCysKElUIen+l0og+hieDGWUsbST3o/DDVEfFDBkTkiw8QmaoqMKJsCAcUO5b11fvhVPDeG1QJxb4t3zeV3oJ7SNd8NyeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHSXsjqsPEE4giBY1zT7sPdEnAUYogO0g1mR42ar82s=;
 b=nvrWd6loONA0Fc/W0ddlw701XzfInGc1zPpTcIG9wOtdCTaoVCe3yrtKJCpX+t0S7NYblZwC12mD611GO1xoch797Y3uhoDe8T6K3Y0coBz5awwrPD3A1EcnH/Smizz0+2J/F54NkOou1EU+YrOYdECzD26G2HBAPnvZonR4QddBfANZ8JA/9VetdDeIwrIJb68OXT782MGfpN4iI0B0qWaLl3j8b4yrQw4S2mgFpUapuZ3TvgJz6oozwSJEqGR5T8X40KYV+WuI/JI8nh9bxqVkzGquslXuNOiDcQn/ck7KAAL4Mq4iAh5phgmNZVvt/PPFdxifd30tixOL9gJ8Kw==
Received: from MW2NAM10FT006.eop-nam10.prod.protection.outlook.com
 (10.13.154.51) by MW2NAM10HT132.eop-nam10.prod.protection.outlook.com
 (10.13.154.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Fri, 27 Dec
 2019 13:33:13 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com (10.13.154.56) by
 MW2NAM10FT006.mail.protection.outlook.com (10.13.154.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 13:33:12 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80]) by BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80%12]) with mapi id 15.20.2581.007; Fri, 27 Dec
 2019 13:33:12 +0000
From: Jairo Quintanilla <jairo_6875@hotmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Flickering Nvidia GeForce GT210
Thread-Index: AQHVtucczS/F78XIUkSshOyFWFCPkKfOBfcAgAAAmFk=
Date: Fri, 27 Dec 2019 13:33:12 +0000
Message-ID: <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>,
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
In-Reply-To: <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:84051AC550C4F41AB8EE3C839EDE708A2F9F50D6849C3DCF456E522DFDD20DA2;
 UpperCasedChecksum:ED389CBE00D2C85F2026B72F0898E7666697892A1DEF2523425DC8E8A7D7F490;
 SizeAsReceived:7039; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [pR5ck1GUL4DZBzCcmchRmmjDhMwOBL0k]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 84b5aa35-4bec-4db5-347b-08d78ad151ef
x-ms-traffictypediagnostic: MW2NAM10HT132:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BgGPQI1ByX63l2KJBVZ7UpNnkkgf5h4FklseByVIq4xlcXuiA+r53/Yx4Dpero3hLa2hlTYWDRekF6Zo8R44ThrOSvYUAOYvTOaVB1MLD4s3hq8FciErDK7dYirCxlBAq+eJBsmuuhCAvT0TZxNAxv7AU5VMa5nOG/VuOFzGhwgG3wLiaTc6faiENwEpVrUTxWElQbt4diqYc8Tf+4G8xAGPq5xPUqI/Ntk7XD2msr8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b5aa35-4bec-4db5-347b-08d78ad151ef
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 13:33:12.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM10HT132
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
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
Content-Type: multipart/mixed; boundary="===============1342348681=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1342348681==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0BN6PR01MB2337prod_"

--_000_BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0BN6PR01MB2337prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm using xorg and nouveau, not modesetting.


Thanks for your response.



Enviado desde mi Samsung Mobile de Claro



-------- Original message --------
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: 12/27/19 7:31 AM (GMT-06:00)
To: Jairo Quintanilla <jairo_6875@hotmail.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210

Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
using -- nouveau or modesetting?

On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> Hi mates,
>
> First to all thanks for your help.
>
> I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux=
, but I have some flickering issues when playing videos, only in the video =
windows.
>
> Sometimes I can see some flickering when scrolling.
>
> Please help. I don't know how to fix it.
>
>
> Atte. Jairo Quintanilla
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0BN6PR01MB2337prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div dir=3D"auto">
<div dir=3D"auto">I'm using xorg and nouveau, not modesetting.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks for your response.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"x_composer_signature" dir=3D"auto">
<div dir=3D"auto" style=3D"font-size:85%; color:#575757">Enviado desde mi S=
amsung Mobile de Claro</div>
</div>
<div dir=3D"auto"><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>-------- Original message --------</div>
<div>From: Ilia Mirkin &lt;imirkin@alum.mit.edu&gt; </div>
<div>Date: 12/27/19 7:31 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt; </div>
<div>Cc: nouveau@lists.freedesktop.org </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Are you on Xorg or wayland of some sort? If on Xor=
g, which DDX are you<br>
using -- nouveau or modesetting?<br>
<br>
On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; Hi mates,<br>
&gt;<br>
&gt; First to all thanks for your help.<br>
&gt;<br>
&gt; I've installed Nouveau driver for my Nvidia GeForce GT210 using Archli=
nux, but I have some flickering issues when playing videos, only in the vid=
eo windows.<br>
&gt;<br>
&gt; Sometimes I can see some flickering when scrolling.<br>
&gt;<br>
&gt; Please help. I don't know how to fix it.<br>
&gt;<br>
&gt;<br>
&gt; Atte. Jairo Quintanilla<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; Nouveau@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau">htt=
ps://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0BN6PR01MB2337prod_--

--===============1342348681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1342348681==--
