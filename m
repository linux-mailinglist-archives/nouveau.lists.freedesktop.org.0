Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FC12B5AB
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD7A6E452;
	Fri, 27 Dec 2019 15:36:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2091.outbound.protection.outlook.com [40.92.19.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501BC6E452
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 15:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGT2Tw8fzAIuVQrGmbwpwh4ZhwsiXssqIk5O0x/ReolQWktXQeRex6AxuTGbHIEyXOEaAUy0tkyu5HakTTwJBE/+4L7TmR328eG23M0MF04h0apP3CyVW8Y1IU5a0rZQbRnvqhFTZG8RHr3AlIr+EpjTAcxH9vKDGBNCV+ELYXvP+XS0iJrC2XOQb247YRjjJVv0DPjrGgnOzHDX+u6Tl3YsIbtNmrh3Wq4mO+GplFJZnkwP5nEj6P5Zcr+SzTd53BVRslP47j15TEq0hvWY4ccrc5tNa2CM5QZIufN4WROuY6TXpjjM6Q6YHtUs5WvYS9+phJ4M1cvsGAqiIWQOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqB+XknKRYyGOi4Ot7aXz2WDnHOYxtBupfKQ7GDAcW4=;
 b=An6tNvJtlewK1/aXezwJe7h41t5km2wkpjC82mdQ/MWj/CNJa6ESLZdlNqxic5FwD+2NHrtvIK1LoAAdmbHWxFhuru2KCsQar2VrB0FJJn6Zxti43HpKOlSFRunH3Uz88ONA6PeaZ0jOTr0RLpXktZAg9yhL6E/11yq3iS4ESNZ/PY8J08Tz2a8nm4QF3lFxPq5OP/kIocCip6P8KSfdcNGWQXVjziGw3MlI6lBTsdvJbcSdUp4I0us99Z86WhoYjy86qSGpXzwqikJOIBdz5odRIwMDGmMnaiRS0XS4/ldim0O7cMdwMR0zsrm6unpbehnC1LxTQYYJYs7/5GK0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqB+XknKRYyGOi4Ot7aXz2WDnHOYxtBupfKQ7GDAcW4=;
 b=iSxE4bmP0egup63p0s2V1G/oIUzydmG9QQnq5Gb8ri+4Mk4I3r6kGOgYVdwopWXZA/VDVgMEIVa541ueXS8xSA5eoDCx9vaI+gOTfqk9sfAqq/PnAnHFb+Xs1qTbpEjMI7SlN3A1RO5h2d96EM2UBbv+xQm+80CnT06FMu4rnfxxul0qdBppKYfJtnkYt8N3hB9SoucAiu/zbyORjC5+GIcyD1gurGqZqdpXuKHLJjwNWC6PF75yJBFMSYT/fjhQegXBMcXiFDrpp0PoA9y0CEDbPcNZxh5dK0jKEBbRWaGFKqCeQeV/rkH5bu7IRP16nrPVWEmmibAuCBthYdAQiA==
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (10.13.172.51) by DM6NAM11HT252.eop-nam11.prod.protection.outlook.com
 (10.13.172.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Fri, 27 Dec
 2019 15:36:30 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com (10.13.172.52) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 15:36:30 +0000
Received: from BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80]) by BN6PR01MB2337.prod.exchangelabs.com
 ([fe80::b8d1:8541:ccc4:ae80%12]) with mapi id 15.20.2581.007; Fri, 27 Dec
 2019 15:36:30 +0000
From: Jairo Quintanilla <jairo_6875@hotmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Flickering Nvidia GeForce GT210
Thread-Index: AQHVtucczS/F78XIUkSshOyFWFCPkKfOBfcAgAAAmFmAAAH1AIAAAW6TgAABeYCAAB2YuA==
Date: Fri, 27 Dec 2019 15:36:30 +0000
Message-ID: <BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0@BN6PR01MB2337.prod.exchangelabs.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
 <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>,
 <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw@mail.gmail.com>
In-Reply-To: <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:67A06F17A1D40423695FD793BFB6960C0A66B93B81A87E99D70F73CB25F72128;
 UpperCasedChecksum:9304834E38934E4C04D6834B5A80030D261DF527EB0E6E5322B3CF70BC1BC582;
 SizeAsReceived:7371; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [uFh8L/+Z87eMh8xHUIaGjh5A8O/xFaWh]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 380a0d67-36b1-4554-8be9-08d78ae28b63
x-ms-traffictypediagnostic: DM6NAM11HT252:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RHpzQsnmG/lKjVSI6976iyVB9Cf+DLFC7i41QvIPW5rJoKc2NsXgYuywlNNyA/msQp1WH6Vy01YpxwBNCcQGfnEBUmj1mAVRkBhVGqoAk6Uzf2OhMJICUybK2nhxySGmrG0z0PUgg4SxIH1+t0/CScWaNJsdjRMZGz6Qzu2T5Xk2dMWqEu5QC99TCtprxql8eCHS5eiuCmLhTeNkANB77QLwIes31pHbRlU/sG2I8uY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 380a0d67-36b1-4554-8be9-08d78ae28b63
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 15:36:30.1393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT252
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
Content-Type: multipart/mixed; boundary="===============1432913032=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1432913032==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_"

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll see this file and test some things, and I'll give a feedback later.

Thanks again for your help. I really appreciate it.



Enviado desde mi Samsung Mobile de Claro



-------- Original message --------
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: 12/27/19 7:50 AM (GMT-06:00)
To: Jairo Quintanilla <jairo_6875@hotmail.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210

Hm, this kind of "incomplete fill" flicker could be due to something
just not being able to keep up. But you may be in luck - nouveau may
support reclocking on your GPU -- check the contents
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
"0f" or "22" or whatever the desired level is listed as back into that
file (note - AC =3D "current", not an actual level).

On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
<jairo_6875@hotmail.com> wrote:
>
> The issue is like this.:
>
> https://youtu.be/4YQSL3xWrJA
>
> I have some tearing and sometimes flickering, just screen off and on sudd=
enly in shorts periods of time.
>
> I have this problem with videos in YouTube using Firefox, and local video=
s using vlc and MPlayer for example.
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin@alum.mit.edu>
> Date: 12/27/19 7:40 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875@hotmail.com>
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> And when you say "flickering", do you really mean some kind of
> decoding failure with blocks being off or whatever? Or maybe a frame
> ordering issue (where old frames appear instead of new ones
> sometimes)? Or just regular tearing?
>
> Is your video player using GL output, VDPAU output (and vdpau
> decoding), or Xv? (What video player are you using?)
>
> On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> <jairo_6875@hotmail.com> wrote:
> >
> > I'm using xorg and nouveau, not modesetting.
> >
> >
> > Thanks for your response.
> >
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin@alum.mit.edu>
> > Date: 12/27/19 7:31 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875@hotmail.com>
> > Cc: nouveau@lists.freedesktop.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> > using -- nouveau or modesetting?
> >
> > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > <jairo_6875@hotmail.com> wrote:
> > >
> > > Hi mates,
> > >
> > > First to all thanks for your help.
> > >
> > > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archl=
inux, but I have some flickering issues when playing videos, only in the vi=
deo windows.
> > >
> > > Sometimes I can see some flickering when scrolling.
> > >
> > > Please help. I don't know how to fix it.
> > >
> > >
> > > Atte. Jairo Quintanilla
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_
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
<div dir=3D"auto">I'll see this file and test some things, and I'll give a =
feedback later.&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks again for your help. I really appreciate it.&nbsp;=
</div>
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
<div>Date: 12/27/19 7:50 AM (GMT-06:00) </div>
<div>To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt; </div>
<div>Cc: nouveau@lists.freedesktop.org </div>
<div>Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210 </div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hm, this kind of &quot;incomplete fill&quot; flick=
er could be due to something<br>
just not being able to keep up. But you may be in luck - nouveau may<br>
support reclocking on your GPU -- check the contents<br>
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.<br>
&quot;0f&quot; or &quot;22&quot; or whatever the desired level is listed as=
 back into that<br>
file (note - AC =3D &quot;current&quot;, not an actual level).<br>
<br>
On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla<br>
&lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; The issue is like this.:<br>
&gt;<br>
&gt; <a href=3D"https://youtu.be/4YQSL3xWrJA">https://youtu.be/4YQSL3xWrJA<=
/a><br>
&gt;<br>
&gt; I have some tearing and sometimes flickering, just screen off and on s=
uddenly in shorts periods of time.<br>
&gt;<br>
&gt; I have this problem with videos in YouTube using Firefox, and local vi=
deos using vlc and MPlayer for example.<br>
&gt;<br>
&gt;<br>
&gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -------- Original message --------<br>
&gt; From: Ilia Mirkin &lt;imirkin@alum.mit.edu&gt;<br>
&gt; Date: 12/27/19 7:40 AM (GMT-06:00)<br>
&gt; To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt;<br>
&gt; Cc: nouveau@lists.freedesktop.org<br>
&gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt;<br>
&gt; And when you say &quot;flickering&quot;, do you really mean some kind =
of<br>
&gt; decoding failure with blocks being off or whatever? Or maybe a frame<b=
r>
&gt; ordering issue (where old frames appear instead of new ones<br>
&gt; sometimes)? Or just regular tearing?<br>
&gt;<br>
&gt; Is your video player using GL output, VDPAU output (and vdpau<br>
&gt; decoding), or Xv? (What video player are you using?)<br>
&gt;<br>
&gt; On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla<br>
&gt; &lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I'm using xorg and nouveau, not modesetting.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks for your response.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Enviado desde mi Samsung Mobile de Claro<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -------- Original message --------<br>
&gt; &gt; From: Ilia Mirkin &lt;imirkin@alum.mit.edu&gt;<br>
&gt; &gt; Date: 12/27/19 7:31 AM (GMT-06:00)<br>
&gt; &gt; To: Jairo Quintanilla &lt;jairo_6875@hotmail.com&gt;<br>
&gt; &gt; Cc: nouveau@lists.freedesktop.org<br>
&gt; &gt; Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210<br>
&gt; &gt;<br>
&gt; &gt; Are you on Xorg or wayland of some sort? If on Xorg, which DDX ar=
e you<br>
&gt; &gt; using -- nouveau or modesetting?<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla<br>
&gt; &gt; &lt;jairo_6875@hotmail.com&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi mates,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; First to all thanks for your help.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I've installed Nouveau driver for my Nvidia GeForce GT210 us=
ing Archlinux, but I have some flickering issues when playing videos, only =
in the video windows.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sometimes I can see some flickering when scrolling.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please help. I don't know how to fix it.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Atte. Jairo Quintanilla<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Nouveau mailing list<br>
&gt; &gt; &gt; Nouveau@lists.freedesktop.org<br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR01MB2337DB2C1304D5D2D9BDD409E32A0BN6PR01MB2337prod_--

--===============1432913032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1432913032==--
