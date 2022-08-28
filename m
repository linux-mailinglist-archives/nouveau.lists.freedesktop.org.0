Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B25A3D2B
	for <lists+nouveau@lfdr.de>; Sun, 28 Aug 2022 12:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC8610E6D6;
	Sun, 28 Aug 2022 10:23:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25A810E6D6
 for <nouveau@lists.freedesktop.org>; Sun, 28 Aug 2022 10:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4Uqqdqf71yqqxbfQkC4KHL0vfLMZV0KvcNdU4adzfEQA8akaMoaUiR89gfoDOCPRPQfbaRt0f/KYqlyOfzxomBlSs2IxW3nGAU2Lss/Pwx/+Y7YsCvWim8tkBnY0MwTc5ZQkTD3KbYVdoIfHWFTekUrI/wR1I2FNUiOnTJtFoXB7SchkfFtOJNNgtAMsPOgq1dVMYbOSpasDQoalx4g5yQrK+rESOJ73+zgDkt30tDMxeke1cugqySxSNY3mOvXfXtO6EZ0RDxelrq0oAYR1FQmc6Z/04jkE2SDVvCYQXdzwoWUdq+G7sdbjiYWVmyGlwhkKiIQSKnN/hZ5vzEMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnDAaAvujRbRZDYkTA9Icj5LcN+JKjnF3u3dxyAJLf0=;
 b=cGEFySXw4I4j4gUObYmZ2wLINWkqSmHhGZ5LyFMroWSF6QXH5LYjfxOTj62l6n5H9I24BgFV/swQxPm682nqeqcn3VtdDt1mVWgTXqCTaS6bZ9c3cHaLfE4TmGKAxVqyZIIF8B36cuFLprMnwHWopaxpdx77D942EBGWRUgoqjMD2dPpCQYislIeT9LAU+JgUvk03j1/aY36T435poifEepOF3Kbl88CVlWj4qBSk0/fiQ8zhbdqLXoSYDjoW/a4H4p4jMWBnlEvliEr+mXplV15nWV+53yA5oq1c2IrUt7IU9DihgFXzAYPiJCkPy3vbRd2gSKu3d9InwuLYMyKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.38.125.140) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=di.ku.dk; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=di.ku.dk; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnDAaAvujRbRZDYkTA9Icj5LcN+JKjnF3u3dxyAJLf0=;
 b=ceULxTFKHaqo0cPouI6mAPUdoGhgHu1jzJsbvwCV5zUFUBz0U5ffOYM7TmzEXHwLkZ46TZ5RWSEWZEz4uxTa8i1LUNVl8Dh3fqHfoNsm20Va16ZHo2EA0o0cDgyEOJ+Dlr6g+CSC+gtbqhZ4GxAMEHylNPtt17qvL2qfLjeCa70=
Received: from AM6P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::42)
 by DB7PR04MB4330.eurprd04.prod.outlook.com (2603:10a6:5:19::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Sun, 28 Aug
 2022 10:23:16 +0000
Received: from VE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::9b) by AM6P191CA0029.outlook.office365.com
 (2603:10a6:209:8b::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Sun, 28 Aug 2022 10:23:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.38.125.140)
 smtp.mailfrom=di.ku.dk; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=di.ku.dk;
Received-SPF: Pass (protection.outlook.com: domain of di.ku.dk designates
 192.38.125.140 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.38.125.140; helo=mailedg02pw.ku.dk; pr=C
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 VE1EUR02FT018.mail.protection.outlook.com (10.152.12.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Sun, 28 Aug 2022 10:23:16 +0000
Received: from mailsepo01.ku.dk (10.78.10.24) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2507.12; Sun, 28 Aug 2022
 12:23:15 +0200
Received: from 10.78.10.5 ([10.78.10.5])
 by mailsepo01.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 263
 for <nouveau@lists.freedesktop.org>;
 Sun, 28 Aug 2022 12:23:14 +0200 (CEST)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX09PW.unicph.domain (10.77.0.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 28 Aug 2022 12:23:14 +0200
Received: from MAILMBX06PW.unicph.domain ([fe80::2871:26e7:5dea:a154]) by
 MAILMBX06PW.unicph.domain ([fe80::2871:26e7:5dea:a154%6]) with mapi id
 15.01.2507.012; Sun, 28 Aug 2022 12:23:14 +0200
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: Patch to TroubleShooting.html
Thread-Index: AQHYusWQNyW5Hsp4QUCOjnVYKCB58Q==
Date: Sun, 28 Aug 2022 10:23:14 +0000
Message-ID: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.10.24]
Content-Type: multipart/alternative;
 boundary="_000_615912a3d56e4330923d9b42802e8b09dikudk_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bd87323-c996-4b08-377b-08da88df522f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4330:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLYOmJmcUc3jEpgzqhD96GWklJWI02H51kk6jLLw19PTdxLikxDI+DAVRAfHLkuN9l88sIHRpXJU99v3oUv11PRBJZx9ZpmLrfzkYDOgGM8OccNp/8vQUV8O5N2s9Vn0/R2TWSpxYEFfTfU2bzTEsTAx1WhXNJAHeU2lWNK1oUxjbF1VIW8qR4IJ1ySLEkkvj7aFutUhHwjm+qZMy3u0v0Uz6fkgPZiMFkzCtEHaZOTTLsDZbrhmw5oZ1UM/+i8NUaBOYeSttqtC+F/NbGvEWyIi5pdRRabDmhuhTmxEJQIS7AVgiFYZa2etCw6BwVk9Hx4ZGkK1ZH29uE+Fbmc+AoI+nuHZQYPZDkY45lQ7SM8Hr8GvBx9eHwMSveXoTtPA4WRcdooTgXrlPSayhKaPRcRUsBaY3nixWQO0a4qjoAmNt/OGAb0udUDuQS14+STG0mcIf9A/izTG5uMEpz6+LGUYPF1hsO97zXCoQ0EIR5A4GAMOCKbDh3G/CYjyAQk2wAJRQw5PUuQo09KQ7/USMHU8Y4fURy7lwneOpmjNYDOG7xUhrXN8akx3aLdgxGwogc4TcDezxLoTAnRKL6hl/0C8HZLzch02Jq17ExUmqWmPZ1rZQcrXOFoiEdtPuqUcV9CVlTKsmXSsJTyQr+lHjK2btYdXaHMdoU8T/IDJBzjobazqLY5b5/nhIPSLirkNBmIgkC5A/uOPwap6m+zg9I7tVmiHn9tlYDQD56sZvLY=
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39850400004)(46966006)(40470700004)(36840700001)(316002)(166002)(356005)(26005)(82310400005)(7596003)(7636003)(82740400003)(41300700001)(8936002)(5660300002)(40460700003)(478600001)(86362001)(41320700001)(6916009)(966005)(8676002)(2906002)(24736004)(108616005)(70206006)(70586007)(2616005)(21615005)(3480700007)(40480700001)(47076005)(336012)(186003)(83380400001)(1015004)(36756003)(19627405001)(36860700001)(786003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 10:23:16.3163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd87323-c996-4b08-377b-08da88df522f
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4330
Subject: [Nouveau] Patch to TroubleShooting.html
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

--_000_615912a3d56e4330923d9b42802e8b09dikudk_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Nouveau

Whoever is in charge of the web-pages, could I persuade you to make a minor=
 update of

https://nouveau.freedesktop.org/TroubleShooting.html

It says (among others)

One option is to provide a custom EDID. You can do this by adding drm_kms_h=
elper.edid_firmware=3DVGA-1:edid/your_edid.bin to the kernel command line.

But drm_kms_helper.edid_firmware is deprecated. Furthermore, there is no me=
ntion that the custom edid should be placed in /lib/firmware. And now we ar=
e at it, one can supply more than one edid. So I would suggest to change th=
e above to eg


One option is to provide a custom EDID. You can do this by creating the dir=
ectory /lib/firmware/edid (if it does not exist) and placing your custom ed=
id file(s) there. Then add drm.edid_firmware=3Dconnector1:edid/your_edid_1.=
bin,connector2:edid/your_edid_2.bin,... to the kernel command line. That wi=
ll make the system use your_edid_1 for whatever is attached to connector1 a=
nd so on. As an example, drm.edid_firmware=3DDP-1:edid/foo.bin will use /li=
b/firmware/edid/foo.bin for whatever is attached to DisplayPort 1.


Cheers,

Klaus


--_000_615912a3d56e4330923d9b42802e8b09dikudk_
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
<p></p>
<div>Hi Nouveau</div>
<div><br>
</div>
<div>Whoever is in charge of the web-pages, could I persuade you to make a =
minor update of<br>
</div>
<div><br>
</div>
<div><a href=3D"https://nouveau.freedesktop.org/TroubleShooting.html" class=
=3D"OWAAutoLink" id=3D"LPlnk579623" previewremoved=3D"true">https://nouveau=
.freedesktop.org/TroubleShooting.html</a></div>
<div><br>
</div>
<div>It says (among others)<br>
</div>
<div><br>
</div>
<div>One option is to provide a custom EDID. You can do this by adding <cod=
e>drm_kms_helper.edid_firmware=3DVGA-1:edid/your_edid.bin</code> to the ker=
nel command line.</div>
<div><br>
</div>
<div>But drm_kms_helper.edid_firmware is deprecated. Furthermore, there is =
no mention that the custom edid should be placed in /lib/firmware. And now =
we are at it, one can supply more than one edid. So I would suggest to chan=
ge the above to eg<br>
</div>
<p></p>
<p><br>
</p>
<p>One option is to provide a custom EDID. You can do this by creating the =
directory /lib/firmware/edid (if it does not exist) and placing your custom=
 edid file(s) there. Then add drm.edid_firmware=3Dconnector1:edid/your_edid=
_1.bin,connector2:edid/your_edid_2.bin,...
 to the kernel command line. That will make the system use your_edid_1 for =
whatever is attached to connector1 and so on. As an example,
<span>drm.edid_firmware=3D</span>DP-1:edid/foo.bin will use /lib/firmware/e=
did/foo.bin for whatever is attached to DisplayPort 1.<br>
</p>
<p><br>
</p>
<p>Cheers,</p>
<p>Klaus</p>
<p><br>
</p>
</div>
</body>
</html>

--_000_615912a3d56e4330923d9b42802e8b09dikudk_--
