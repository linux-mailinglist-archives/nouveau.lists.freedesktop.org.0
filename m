Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2958F3B9
	for <lists+nouveau@lfdr.de>; Wed, 10 Aug 2022 23:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98B14A216;
	Wed, 10 Aug 2022 21:08:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00102.outbound.protection.outlook.com [40.107.0.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6DC8FA10
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 21:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTXizp/BJO8TYdQeo+a0fBIDgOPC4pAUtZbaqwMXXIgBvNViRcV1GDVrwJnKQIdAwYn4R1R2yMJtNyYlULM5zx1hR34RZVgftyn5sjf77VUmACYAN9Vu1/xAiMiKV38xluSqkzS9UkryuMbKtmA8eVhgkRMH9HxhyIY+JDRnAlfurASA5LleQgdR4tYp+Q1F++iNdA0yR5XcTM3P112zVk40mylu8rHYX8fInafQ3vAfVzUc0R/ZF0L/E+TJlLA5NGMbPryNTsPwm466uLaCGorgYq+9r1LDKU4czYiLt8XUDCiYLOqzKsETd0Gfo/3CdMFQ0IscrhWn7c9r/b+uxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTEllMxYC3pw+2KtAs8Y2w5SBFcRh79za5P8mD5kp+Q=;
 b=WVwrZe9iwN7vPRm1pG30b6Q3CMJ21SZQ1lpDmT7jzIjfeLh/OZd6hyByo3dtCyhC6HBNomzf6RFtWC7O4KyDPsU1YS3F+ecNBAyd3D2ubNjNjEAIgbyLUjDPkCTIi/BLTmbIm4+BikrqT3fdlmXgmX5rrMGtsDL7zvKyfNvQWqi37ezGp0diXToF3TKJ4xcDNDCPfclZvRoq7AMgJ7pAwN3M10QNHgK20UqniDJoS3BO+iuNdWWdHFkRIjjBRJ62rwZCGsJaCalXLcKPsbQOwFBOpiPM9jC0YiavLEYKpRoBX6EHzmgMwkr6cNjGhzEsKxIW8bOWTISYP4Nb5P8Xag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.38.125.140) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=di.ku.dk; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=di.ku.dk; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTEllMxYC3pw+2KtAs8Y2w5SBFcRh79za5P8mD5kp+Q=;
 b=oJYdLwJUZaHw4isLuVK/ISSljbTrdY1ia0rlxDi5zDRQlw2HBK4GSFd3+Xqc8yiuyq/m3k6bmYbJ9qOT9Qu1uE5o/EFAYsnPklY1XHoJEI1RTsfRy25RQ6DQw453cN/4joW7qEXuBsjf6TZkoaBf7gz/o6sh0MsSFo9EVa4+J9U=
Received: from AM6PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:20b:2e::17)
 by DB7PR04MB4281.eurprd04.prod.outlook.com (2603:10a6:5:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Wed, 10 Aug
 2022 21:08:11 +0000
Received: from VE1EUR02FT075.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::5b) by AM6PR05CA0004.outlook.office365.com
 (2603:10a6:20b:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10 via Frontend
 Transport; Wed, 10 Aug 2022 21:08:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.38.125.140)
 smtp.mailfrom=di.ku.dk; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=di.ku.dk;
Received-SPF: Pass (protection.outlook.com: domain of di.ku.dk designates
 192.38.125.140 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.38.125.140; helo=mailedg02pw.ku.dk; pr=C
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 VE1EUR02FT075.mail.protection.outlook.com (10.152.13.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 21:08:10 +0000
Received: from mailsepo01.ku.dk (10.78.10.24) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2507.12; Wed, 10 Aug 2022
 23:08:10 +0200
Received: from 10.78.10.21 ([10.78.10.21])
 by mailsepo01.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 859
 for <nouveau@lists.freedesktop.org>;
 Wed, 10 Aug 2022 23:08:08 +0200 (CEST)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX16PW.unicph.domain (10.77.128.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 10 Aug 2022 23:08:08 +0200
Received: from MAILMBX06PW.unicph.domain ([fe80::3084:b730:74d:d55f]) by
 MAILMBX06PW.unicph.domain ([fe80::3084:b730:74d:d55f%6]) with mapi id
 15.01.2507.012; Wed, 10 Aug 2022 23:08:08 +0200
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: [Nouveau] Blank screen after upgrade Fedora 34/XFCE -> Fedora
 36/XFCE
Thread-Index: AQHYrMFgIZYFo0ADCked/RHKYtfsV62oaCuAgAAyzxY=
Date: Wed, 10 Aug 2022 21:08:08 +0000
Message-ID: <6958563693124d4aa07c6db66783a54a@di.ku.dk>
References: <908f64116d46466da1aef164ec30f939@di.ku.dk>,
 <CACO55tuSGMUP7Bpr+=i78CnHPR7sxZKTAUewADsUhiR5qBhg2w@mail.gmail.com>
In-Reply-To: <CACO55tuSGMUP7Bpr+=i78CnHPR7sxZKTAUewADsUhiR5qBhg2w@mail.gmail.com>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.10.24]
Content-Type: multipart/alternative;
 boundary="_000_6958563693124d4aa07c6db66783a54adikudk_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d73511c-0f6d-4b80-21be-08da7b146e6e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4281:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjemnPQ730EsoH9qsHlQGAPNt234M0E9TjOf14nM5jodtHXPn3pktjfIV61b9SK1pQBqwrLO/cvVRPCO++LtQYBVM4FGK3BMNUajohBXzoWeCFcIaJB9M1Xh2mtXZHp/rehAGg58nzL4NO5GLuzROsgiWDY7IQRp06CwZOz+Ynhe57wn5Ra0inqeiMzqkNAvLy58jJzgTmHay2C3bS5zXr1lZOFnVl6AsUDsCM4EVLnBxoAYj+1grpGWdoALrdy8qJy9g9qU1yMogjm/wL3DEPQNpUmFONUCRSzBEowC6CraLlwVPyT+Odwbqff0K1ES3K2W3uGbNjgZGx9MwadagBBCzCskp84fELppoPBSDwqXzhXWsRmiCbi40giDEEjbdLzNM16OdfbVnpDj4sfx22uQENoGFlDFL+tabF8aX8h9DCrr46D8G/fAcJIgHpfr4nzLmanqIM+fPlFjrcDNGqKNpGhkXcH4uJ75WNTjGhvDNG18vNkbaol7yllHMGewIgj1poYwfium+ci/ss4nZ1hh2BA6JBtBcsQjczw4peNXftBospiSdjPevNY7QVDGvk1O9+YlER/QOSB8CLzgEiHbePUi06w9f/BRfGTEG6Dwz5fOMEK8Z31US0DLj6As/WL38NdlKUnP2IQnXOa0njUbxGOws5FdBmUMFc+jct16n6QygEUEQeHlbeXvDHDZ0zk8E++M9MAMR2uutvRDRxop0u7BKoF72F5stEEV/G6AHVlqTTSJwAKFmQMv2fgmrjKXlZmxMQlrC7xnSdf5ADPD26PG+IlNCU25I8cFRoDU8T3mktXRUqxsxJab5bafg3ENgdFQXj2J5iC0Sld52g==
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(40470700004)(36840700001)(46966006)(26005)(41300700001)(24736004)(86362001)(108616005)(7636003)(7596003)(82740400003)(356005)(336012)(47076005)(83380400001)(40460700003)(2616005)(186003)(36860700001)(8936002)(5660300002)(8676002)(70206006)(166002)(41320700001)(2906002)(70586007)(40480700001)(19627405001)(1015004)(82310400005)(36756003)(786003)(6916009)(316002)(478600001)(966005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 21:08:10.3620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d73511c-0f6d-4b80-21be-08da7b146e6e
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT075.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4281
Subject: Re: [Nouveau] Blank screen after upgrade Fedora 34/XFCE -> Fedora
 36/XFCE
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

--_000_6958563693124d4aa07c6db66783a54adikudk_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Karol,


> > After upgrade from Fedora 34/XFCE to Fedora 36/XFCE, I experience a bla=
ck screen instead of a login prompt, unless I make a file named /etc/X11/xo=
rg.conf.d/90-monitor.conf which contains eg

> >
> >
> > Section "Monitor"
> >         Identifier "DP-1"
> >         Option "PreferredMode" "720x480"
> > EndSection
> >
> > Before the upgrade from Fedora 34 to 36, everything worked if the file =
looked like this:
> >
> > Section "Monitor"
> >         Identifier "DP-1"
> >         Modeline "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 =
2222 +hsync -vsync
> >         Option "PreferredMode" "3840x2160"
> > EndSection
> >
> > But that does not work on my Fedora 36.
> >

> did you try not using any custom Xorg config, because I don't see why you=
 are even trying that?

Yes, I have tried not using any custom Xorg config. That gives me a blank s=
creen under both Fedora 34 and Fedora 36.

Or, more precisely: My /etc/X11 contains no xorg.conf. My /etc/X11/xorg.con=
f.d only contains a file named 00-keyboard.conf which is written by systemd=
-localed(8). If I do not add an /etc/X11/xorg.conf.d/90-monitor.conf then I=
 get a blank screen instead of a login screen.

My screen went blank first time at upgrade from 5.8.18-300.fc33.x86_64 to 5=
.9.9-200.fc33.x86_64, cf https://ask.fedoraproject.org/t/no-login-screen-af=
ter-upgrade/10618 . It was after that upgrade I added an /etc/X11/xorg.conf=
.d/90-monitor.conf. Now my screen has gone blank a second time at upgrade f=
rom Fedora 34 to 36, and I am a bit short of ideas what to do from here.

Cheers,
Klaus


--_000_6958563693124d4aa07c6db66783a54adikudk_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi Karol,</p>
<p><br>
</p>
<p>&gt; &gt; After upgrade from Fedora 34/XFCE to Fedora 36/XFCE, I experie=
nce a black screen instead of a login prompt, unless I make a file named /e=
tc/X11/xorg.conf.d/90-monitor.conf which contains eg<br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<div dir=3D"ltr"><span>&gt; </span>&gt;<br>
<span>&gt; </span>&gt;<br>
<span>&gt; </span>&gt; Section &quot;Monitor&quot;<br>
<span>&gt; </span>&gt; &nbsp; &nbsp; &nbsp; &nbsp; Identifier &quot;DP-1&qu=
ot;<br>
<span>&gt; </span>&gt; &nbsp; &nbsp; &nbsp; &nbsp; Option &quot;PreferredMo=
de&quot; &quot;720x480&quot;<br>
<span>&gt; </span>&gt; EndSection<br>
<span>&gt; </span>&gt;<br>
<span>&gt; </span>&gt; Before the upgrade from Fedora 34 to 36, everything =
worked if the file looked like this:<br>
<span>&gt; </span>&gt;<br>
<span>&gt; </span>&gt; Section &quot;Monitor&quot;<br>
<span>&gt; </span>&gt; &nbsp; &nbsp; &nbsp; &nbsp; Identifier &quot;DP-1&qu=
ot;<br>
<span>&gt; </span>&gt; &nbsp; &nbsp; &nbsp; &nbsp; Modeline &quot;3840x2160=
&quot; 533.25 3840 3888 3920 4000 2160 2163 2168 2222 &#43;hsync -vsync<br>
<span>&gt; </span>&gt; &nbsp; &nbsp; &nbsp; &nbsp; Option &quot;PreferredMo=
de&quot; &quot;3840x2160&quot;<br>
<span>&gt; </span>&gt; EndSection<br>
<span>&gt; </span>&gt;<br>
<span>&gt; </span>&gt; But that does not work on my Fedora 36.<br>
<span>&gt; </span>&gt;
<div><br>
</div>
<div>
<div class=3D"gmail_default" style=3D"font-family:arial,sans-serif"><span>&=
gt; </span>did you try not using any custom Xorg config, because I don't se=
e why you are even trying that?</div>
<br>
</div>
<div>Yes, I have tried not using any custom Xorg config. That gives me a bl=
ank screen under both Fedora 34 and Fedora 36.</div>
<div><br>
</div>
<div>Or, more precisely: My /etc/X11 contains no xorg.conf. My /etc/X11/xor=
g.conf.d only contains a file named
<span>00-keyboard.conf</span> which is written by <span>systemd-localed(8)<=
/span>. If I do not add an
<span>/etc/X11/xorg.conf.d<span>/90-monitor.conf then I get a blank screen =
instead of a login screen.</span></span></div>
<div><br>
</div>
<div>My screen went blank first time at upgrade from <span>5.8.18-300.fc33.=
x86_64 to 5.9.9-200.fc33.x86_64</span>, cf
<a href=3D"https://ask.fedoraproject.org/t/no-login-screen-after-upgrade/10=
618" class=3D"OWAAutoLink" id=3D"LPlnk722601" previewremoved=3D"true">
https://ask.fedoraproject.org/t/no-login-screen-after-upgrade/10618</a> . I=
t was after that upgrade I added an
<span>/etc/X11/xorg.conf.d<span>/90-monitor.conf. Now my screen has gone bl=
ank a second time at upgrade from Fedora 34 to 36, and I am a bit short of =
ideas what to do from here.</span></span><br>
</div>
<div><br>
</div>
<div>Cheers,</div>
<div>Klaus</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6958563693124d4aa07c6db66783a54adikudk_--
