Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459812B4EA
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A9895B2;
	Fri, 27 Dec 2019 13:45:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2081.outbound.protection.outlook.com [40.92.22.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7BE895B2
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frqqBqY8j8vZd0lZAcbTfRcaoFuNxvi0AhRX+/7wtV+jhWZ1Lvzn7jvear2YV/5Xpz1/y6Szkw2T9JknyM2QpJB0in/FYZA1x4gDgEtbiWZt1+nswD4opO5jGyOxa6ByHYwWg0MBfgAlHLtFCkY3HPYUnZtLtzwjED7PLgtUUNWs1jbjjybl0ata6lXTf1+JW4Pvbep9lhdm40U1/FuV9qk7vFXO8C+snHVmnDS2hPo2/Cb5PqJHfUtJV7x+pNbighUzYO6o2MuNCj27/O+z3Cpy2bbkYBNprc/k189XZGjHYG3Glg2crU+Gs6fEcLnpVfCoy5AIJdCmfdw28BAQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOksiBcXZsIdskU4djPgyNryfK5NcpSyT/LSbcYnOXY=;
 b=ZhnLRDnQFYrDYd/oN54+l0uL3LxyHGOUwU3UPC8bIHL9UzMNsAAl7lfI8QSzUnSS5QEMRcAcmB8/+PPRS4KA3SFX8A1/uQHDKXdL8QZlRUlowLO4kf4MSgXEPeM6Q8b2Vps5RJCHCdi+gdnlHyd2RTPb6Oi0fwjnOLam8DEDBUiwSDVFAClimEl+bCfG4m6DraYZ0eFitOr2v/QYhIzZlEV13GJuTdFPaOuc7PPdVa2wQJVkfd/BfUlra8uB6FgKRbl2kgo4h5O/sfHA6y0oq9lJOcz2kOzLsY3s4l0+t1z5LQdPXc81o9kW4Pec2VVeXxVW4cuIzJzvwgWPf3j77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOksiBcXZsIdskU4djPgyNryfK5NcpSyT/LSbcYnOXY=;
 b=c40CHR2C5ok48S6ZwYsJcqdBZr2+L7tRZvDbjXDpDXjb4x3tsM3VqcTQDBqzdWmZqoZpPxqAYCGk9dqtZrC9A2yYEEqH3Mps49l9q6gpN9eyeGVZo9g7vh16+7lFPdaITj4ABT1z+ZJ3NUQfCFoJ1y6vFryvozB3WDn0SaFXXehaNlIK7/OQw89elL4jDSd8JuL2OzIMnhWgMPJKLas1zUTxpo3FohCQ8f/VTSKFsrG/9IEqqLHdA+OHpwT1fm7SXLNRPHO/lRSENrxfJ+Yk4AKos0O8d3m6Dr47ACDcpO8zdDq/3VmGQH2a5MuMTio48Kz2OdCO8iMVeBLQbSvwCA==
Received: from BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
 (10.13.182.55) by BN8NAM12HT091.eop-nam12.prod.protection.outlook.com
 (10.13.183.136) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16; Fri, 27 Dec
 2019 13:45:19 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com (10.13.182.59) by
 BN8NAM12FT052.mail.protection.outlook.com (10.13.182.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Fri, 27 Dec 2019 13:45:19 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80]) by BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80%12]) with mapi id 15.20.2581.007; Fri, 27 Dec
 2019 13:45:19 +0000
From: Jairo Quintanilla <jairo_6875@hotmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Flickering Nvidia GeForce GT210
Thread-Index: AQHVtucczS/F78XIUkSshOyFWFCPkKfOBfcAgAAAmFmAAAH1AIAAAW6T
Date: Fri, 27 Dec 2019 13:45:19 +0000
Message-ID: <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>,
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
In-Reply-To: <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:981A1D61117FFEF4641270AD73CFC3E78052C398E940A2F047D7143B1E38E342;
 UpperCasedChecksum:FD9483DDE011DBA84AE67553E64A90D70C4057F7305D53619C5A5B4006DFAD79;
 SizeAsReceived:7296; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [fArfFdHeQrnEBvFe1rogLQh1HrO8m6si]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: f4ec7da7-5dda-447f-1513-08d78ad30331
x-ms-traffictypediagnostic: BN8NAM12HT091:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: adgKrGTf4i2jLWeYf4f5B+utG05wPqrRFAzBJM6lW1bPEqXKQfsJgEWPm9SFVzCrKhtJL2FlR5gHpdRmvkag4JsoO5c8v8LeeH5T/TgmnmBIlwuI6S+PGG8Bd5y+bbb7ny+TjP3grN7NLO4sP1pehnx8niE1XxU1PywTeB8JihTw0Mq/l/HX3JrUmSFv2JW50p/BL/vcUU/jJhZ1PKUCc2Ba8/vsVSw8bSstgXF82sE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ec7da7-5dda-447f-1513-08d78ad30331
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 13:45:19.1255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT091
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
Content-Type: multipart/mixed; boundary="===============1613140919=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1613140919==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_"

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The issue is like this.:

https://youtu.be/4YQSL3xWrJA

I have some tearing and sometimes flickering, just screen off and on sudden=
ly in shorts periods of time.

I have this problem with videos in YouTube using Firefox, and local videos =
using vlc and MPlayer for example.


Enviado desde mi Samsung Mobile de Claro



-------- Original message --------
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: 12/27/19 7:40 AM (GMT-06:00)
To: Jairo Quintanilla <jairo_6875@hotmail.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210

And when you say "flickering", do you really mean some kind of
decoding failure with blocks being off or whatever? Or maybe a frame
ordering issue (where old frames appear instead of new ones
sometimes)? Or just regular tearing?

Is your video player using GL output, VDPAU output (and vdpau
decoding), or Xv? (What video player are you using?)

On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> I'm using xorg and nouveau, not modesetting.
>
>
> Thanks for your response.
>
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin@alum.mit.edu>
> Date: 12/27/19 7:31 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875@hotmail.com>
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> using -- nouveau or modesetting?
>
> On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> <jairo_6875@hotmail.com> wrote:
> >
> > Hi mates,
> >
> > First to all thanks for your help.
> >
> > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlin=
ux, but I have some flickering issues when playing videos, only in the vide=
o windows.
> >
> > Sometimes I can see some flickering when scrolling.
> >
> > Please help. I don't know how to fix it.
> >
> >
> > Atte. Jairo Quintanilla
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_
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
<div dir=3D"auto">The issue is like this.:</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">https://youtu.be/4YQSL3xWrJA</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I have some tearing and sometimes flickering, just screen=
 off and on suddenly in shorts periods of time.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I have this problem with videos in YouTube using Firefox,=
 and local videos using vlc and MPlayer for example.&nbsp;</div>
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
<div>Date: 12/27/19 7:40 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt; </div>
<div>Cc: nouveau@lists.freedesktop.org </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">And when you say &quot;flickering&quot;, do you re=
ally mean some kind of<br>
decoding failure with blocks being off or whatever? Or maybe a frame<br>
ordering issue (where old frames appear instead of new ones<br>
sometimes)? Or just regular tearing?<br>
<br>
Is your video player using GL output, VDPAU output (and vdpau<br>
decoding), or Xv? (What video player are you using?)<br>
<br>
On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla<br>
&lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; I'm using xorg and nouveau, not modesetting.<br>
&gt;<br>
&gt;<br>
&gt; Thanks for your response.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -------- Original message --------<br>
&gt; From: Ilia Mirkin &lt;imirkin@alum.mit.edu&gt;<br>
&gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt;<br>
&gt; Cc: nouveau@lists.freedesktop.org<br>
&gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt;<br>
&gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you=
<br>
&gt; using -- nouveau or modesetting?<br>
&gt;<br>
&gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi mates,<br>
&gt; &gt;<br>
&gt; &gt; First to all thanks for your help.<br>
&gt; &gt;<br>
&gt; &gt; I've installed Nouveau driver for my Nvidia GeForce GT210 using A=
rchlinux, but I have some flickering issues when playing videos, only in th=
e video windows.<br>
&gt; &gt;<br>
&gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt;<br>
&gt; &gt; Please help. I don't know how to fix it.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Nouveau mailing list<br>
&gt; &gt; Nouveau@lists.freedesktop.org<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau=
">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0BN6PR01MB2337prod_--

--===============1613140919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1613140919==--
