Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174205A9143
	for <lists+nouveau@lfdr.de>; Thu,  1 Sep 2022 09:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B46210E639;
	Thu,  1 Sep 2022 07:53:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70093.outbound.protection.outlook.com [40.107.7.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F310E639
 for <nouveau@lists.freedesktop.org>; Thu,  1 Sep 2022 07:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF/AjAx95AL43JVrubugwkaiE57MFf0XUGhgc/01wQ5H64pkF2q/ZCnPtlTX4j+ANTRbLdlEVXcKBDPuXrOrX4KYCke01zYtZ+HJgCwiI8P+/Ws3GxtCCBn+16K1OVSLNqpjfWB2CxrHxIDy6Kl6mTFolmZrwtXZ4MmFZbpOw6BQf3zaKNpScGX3OYjAC59AjaX5svd4VI0jp59rrFxCPjo+vt985Fjn2YlxQ1/MBrm/OI8hUgNhA9Jb5fUsdALR3UbQ02ngAYPffor+LiTyMyeFYXpvDd/6jVt1fJjIHVFR0Mb1IsQmPeMPGza31wqAJSiux3qeRtfnDLilW11I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5OE/vMSkC8IrQ3SUWak9Lfi9MiCuKob+Ma686GZMS0=;
 b=SmiGLDe/h4UM+U5ZGp7bz8A6qnsjpHKSzMo8IB7ucesFmwMJ+Tk/ktT7wlQjHVdOEVQDRvj0FXVp/k7i3haw9eF9q5Lv4PKWeHZu1eDSVgC0OMwemvENA5WUtYGfAr9mQ1T4a+xG+LTsNISYrGzTVpOhC2Ss+F+Kc5wGoo4smU9kw4Yccp10ARfe5qYtA9TQJInaLhGh9IGGkChrrqrvr8Bi0CObcjXlCg1oP1GVMrYU4yNuxc9DWz3O4MKdpF2+Jl07cjBFqTfJIjVOv5m8ZFeTKzOUSPaVNA11wCf8OjnZafpO3+9VpmY774IXY6bJhMwk4I4fhDvwkdEaUfQv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.38.125.140) smtp.rcpttodomain=owenh.net smtp.mailfrom=di.ku.dk;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=di.ku.dk;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5OE/vMSkC8IrQ3SUWak9Lfi9MiCuKob+Ma686GZMS0=;
 b=EBbpGytbaw5jeNqPOMNywRiz5BWzmPaA8Ep692xgBn/Uagqq2cKBwN5CasSFZnS55nZWw+OZsQMeOvHCWICkWg2rADZpMti1uatxvUAEP6DflyuP40r0ulco1gEaUL40w+AKNVKbxAOUuL/dithmG9ywZ3Qfr+5IKUvFSCynVMI=
Received: from FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::23)
 by VI1PR04MB4398.eurprd04.prod.outlook.com (2603:10a6:803:69::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 07:53:22 +0000
Received: from VE1EUR02FT046.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::62) by FR0P281CA0046.outlook.office365.com
 (2603:10a6:d10:48::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Thu, 1 Sep 2022 07:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.38.125.140)
 smtp.mailfrom=di.ku.dk; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=di.ku.dk;
Received-SPF: Pass (protection.outlook.com: domain of di.ku.dk designates
 192.38.125.140 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.38.125.140; helo=mailedg02pw.ku.dk; pr=C
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 VE1EUR02FT046.mail.protection.outlook.com (10.152.12.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 07:53:21 +0000
Received: from mailsepo01.ku.dk (10.78.10.24) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2507.12; Thu, 1 Sep 2022
 09:52:47 +0200
Received: from 10.78.10.5 ([10.78.10.5])
 by mailsepo01.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 825;
 Thu, 1 Sep 2022 09:38:45 +0200 (CEST)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX15PW.unicph.domain (10.77.0.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 09:38:44 +0200
Received: from MAILMBX06PW.unicph.domain ([fe80::2871:26e7:5dea:a154]) by
 MAILMBX06PW.unicph.domain ([fe80::2871:26e7:5dea:a154%6]) with mapi id
 15.01.2507.012; Thu, 1 Sep 2022 09:38:44 +0200
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: "Owen T. Heisler" <writer@owenh.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Thread-Topic: [Nouveau] Patch to TroubleShooting.html
Thread-Index: AQHYusWQNyW5Hsp4QUCOjnVYKCB58a3IPtGAgAH2WbY=
Date: Thu, 1 Sep 2022 07:38:44 +0000
Message-ID: <56ad0ca76d2942b8ab2ebe4f212b771d@di.ku.dk>
References: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>,
 <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
In-Reply-To: <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.10.24]
Content-Type: multipart/alternative;
 boundary="_000_56ad0ca76d2942b8ab2ebe4f212b771ddikudk_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7806318b-61a0-495a-f446-08da8bef0a8b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4398:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HL32O4hoSjqUAcCXt0jOTi7peMxLKXF4HV67f+6sP1fqMeuBF639regcqTBZV96uu8RIEynGzWoBv5T3XkYOmZhZfWofOVWXrGn88Fdu31vU/Elxbz2E9NyawpcbfJBCbsr5SbcCC045R1b3djoYt8hHst0qfGMlUIgFDh1fAmM/F+EekKVwvHWkkB7CER9W+EHtiDaz3U9epDvJb3WoasHlj/kerrlurOrEvdlBdytYdpJJlL4e0z/CzoNQf9rpL6epQjYGEaofejVZYylwbmK0UqB8iQKjD7AzmPYf70k+OoBCLsOdxxOfARbYAmi+1K1EHgqM7jod0sGelqsbrOxM9VJt5G9EubDPRU1UtvJGY7ApYNps4/cWbviSC7GPuUEgdGMFb5M2iuT3CIDw6CL0fC4tpaolgAWyAsSH9RMnPnhoA74iD+OjTcwr67Ff9jG+t/pE2lr1rXTz4oRcJiS5A9O2mCMQi9Q/dTDB6V2mem50eAgm7pa3DVWWSJkaTuUfsuGK1XDo1ErdcCfxcMH7Zcg9skCFHWEOg0MLzHCqYamR4b0IDosbTXsU6JKV7s3kYibXUZ6gAYiF0IuZBVgd2PcQ/4uLp3O/DIFRDItjPKFopRbinwWDqy4guIPXOOgoUa7zbPJGS3gu2tEbBI4XzV6JuXxEZEiOQEIJqSbczpaeAMHTZ6S5Bl6VBr7B2qnD7fycOL2WQpRugWKJBBrQLMJirTsrJmllrxtKbCl2anHPP0CSpsdkre1ryp455vhRPjvNxU97klrmxFaYMA==
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(40470700004)(8936002)(41300700001)(19627405001)(24736004)(108616005)(478600001)(26005)(356005)(40480700001)(86362001)(82740400003)(40460700003)(41320700001)(7636003)(82310400005)(7596003)(36756003)(83380400001)(2906002)(47076005)(336012)(36860700001)(186003)(8676002)(70206006)(2616005)(70586007)(110136005)(5660300002)(786003)(316002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:53:21.5641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7806318b-61a0-495a-f446-08da8bef0a8b
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT046.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4398
Subject: Re: [Nouveau] Patch to TroubleShooting.html
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

--_000_56ad0ca76d2942b8ab2ebe4f212b771ddikudk_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Owen,


 > The edit buttons on the wiki link to the source repository on GitLab. I
> asked about developer access on 2022-08-05 and never received a reply:
> ...
> I haven't tried asking on IRC (#nouveau on OFTC).

OK. Thanks for the warning. I will see if I have the energy to continue.

Cheers,
Klaus


--_000_56ad0ca76d2942b8ab2ebe4f212b771ddikudk_
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
<p>Hi Owen,</p>
<p><br>
</p>
<p></p>
<div>&nbsp;&gt; The edit buttons on the wiki link to the source repository =
on GitLab. I<br>
&gt; asked about developer access on 2022-08-05 and never received a reply:=
<br>
&gt; ...<br>
&gt; I haven't tried asking on IRC (#nouveau on OFTC).<br>
</div>
<div><br>
</div>
<div>OK. Thanks for the warning. I will see if I have the energy to continu=
e.<br>
</div>
<div><br>
</div>
<div>Cheers,</div>
<div>Klaus</div>
<div><br>
</div>
<p></p>
</div>
</body>
</html>

--_000_56ad0ca76d2942b8ab2ebe4f212b771ddikudk_--
