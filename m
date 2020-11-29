Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2702C7B62
	for <lists+nouveau@lfdr.de>; Sun, 29 Nov 2020 22:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55366E220;
	Sun, 29 Nov 2020 21:28:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130117.outbound.protection.outlook.com [40.107.13.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E25D6E220
 for <nouveau@lists.freedesktop.org>; Sun, 29 Nov 2020 21:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ghu+QOZ7Lq0GTit5hWXZ4XhtiN0gXob4Sc6Gtq/Ub2OxFijmy7iuQ1kbLpXT4iuI8GxipXvV04oYybMxj0WiDsYRV98uisCvC6+zRYKf/cdMCjGV2/Y4Xz0a+J+MivQpKh8eJlw92C9zh/6cAew9gSac9T5ORYSsevmF6E50ypshdresrnyLMwqHoAM7boLYau0d7x+NyQB4OL2lNTUKJf6zfVeYQWEnKD0AuQ2C35j4dPdJ9B8me8hlZlMTudomCh94CwW72UzAkBWZOAZC/DRZ/azrn67eY+FUeuDANqFionXFoiC4Q3UT+9ammYXsowhgV+EWlfVB6273NCv3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5avGPNnGyuh34goXOwXH8y5qWm09T/2RnmyKd8+flU=;
 b=WRwySHiBjRYk+ky7bM0JCXdISCAgnz0+l1+39fqQFyYC+lJj8yfwq/FeFBkUfIYZSxWCkwmM90bJfYLGcCF4U+bC5vzvJM0Aa/+86OkUYhA09OJnxg/gttkC0wWxPFqJR6ApXKg8W6i4N6HRUpBqbpXqyXSyeuk33BeXC1NGFsdHOefYbh1xu0f6obyzmnUUJj+UJjb0dB6GhEJyfBYOE868TFgW1v16RKsXnOiRZ9KYJ3iP01Cyd9EEU+grLAiLWdmXqvk6z+cvvXq9GBLJ3OMCQuE4GvIOuR70iC+vCvIXMOjjA+7etraJmhl0slL7Urj0QddGM4DJENHWN0ZCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 192.38.125.140)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=di.ku.dk; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=di.ku.dk; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5avGPNnGyuh34goXOwXH8y5qWm09T/2RnmyKd8+flU=;
 b=SndJvVnMSBXc5AWCqHDvKmDAw1yDt0NNCuF0MNJmrngJJzg6GwsGIoTeSH2hoCaK6O3EavF2fajO0le+T3SxOK7E3azr6NFm5YxKAOvsDdHVTOaYxFC/Uis80VeVDAqjxd9tMQSlDTRsc0NLAcM2X81iHiFdH/O4t/FDJQpdwAE=
Received: from AM3PR07CA0098.eurprd07.prod.outlook.com (2603:10a6:207:6::32)
 by DB8PR04MB6457.eurprd04.prod.outlook.com (2603:10a6:10:104::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Sun, 29 Nov
 2020 21:28:19 +0000
Received: from AM5EUR02FT012.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:207:6:cafe::ae) by AM3PR07CA0098.outlook.office365.com
 (2603:10a6:207:6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.8 via Frontend
 Transport; Sun, 29 Nov 2020 21:28:19 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 192.38.125.140) smtp.mailfrom=di.ku.dk; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=di.ku.dk;
Received-SPF: PermError (protection.outlook.com: domain of di.ku.dk used an
 invalid SPF mechanism)
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 AM5EUR02FT012.mail.protection.outlook.com (10.152.8.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.23 via Frontend Transport; Sun, 29 Nov 2020 21:28:19 +0000
Received: from sepo4.ku.dk (10.78.8.10) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2106.2; Sun, 29 Nov 2020
 22:28:18 +0100
Received: from 10.78.0.166 ([10.78.0.166])
 by sepo4.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 772
 for <nouveau@lists.freedesktop.org>;
 Sun, 29 Nov 2020 22:28:18 +0100 (CET)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX16PW.unicph.domain (10.77.128.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 29 Nov 2020 22:28:18 +0100
Received: from MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c]) by
 MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c%6]) with mapi id
 15.01.2106.004; Sun, 29 Nov 2020 22:28:18 +0100
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: Could Fedora-5.9.9/X-server problem be a Nouveau-problem?
Thread-Index: AQHWxlD2xLL8tgVWbEyZw6VXVXLanQ==
Date: Sun, 29 Nov 2020 21:28:17 +0000
Message-ID: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.8.26]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d45c2b1-78b4-4216-7e16-08d894adb10a
X-MS-TrafficTypeDiagnostic: DB8PR04MB6457:
X-Microsoft-Antispam-PRVS: <DB8PR04MB645728011EC13E85869373B7E3F60@DB8PR04MB6457.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPfjrhOdZYCaSwwU1ySUkVaY+zQIWj2xV+PM8GtKjbU337mMeK2YCcNgR6TrmR8vvk9YOaJPbs33CjsVkSMY1jV8KCwUHr0v8PvGkCqYyY617FcZSCd/c2doFVMgpizEq/wg/6b6L5Nl3jVGkuHe6sfSFeuoOcuNbAjqyUZm/n7HmX0Txh/Z+u4baw1yWiDkHE25nLXyQMKdUjgXA6C73GVzw66+KqoeLQtxy8b2TyXunmP2YN15ZqS9UNcDdw4+s0sEgbVwC57ho8Ssoeox+s4K8sh2z6QrjgcO+4tR+1UwFZuqoFCtvDtLguS84/ywHggTC8JHz9xM7v0YnfEaehGRSQS4LVwjJcHWwZy/97dQ2iO/GS9of38DSZ8J7+bCpSAfFzSppnvO5EgrbW90yFsnw8/Q1TYZcFORUsQglutN7xCO6JtkUd1xquTQ5SirRo6O4aKTYdinL1xdjevviFmXYiySmQLF2JkL8dROGAg=
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(356005)(2906002)(82310400003)(82740400003)(47076004)(26005)(7596003)(5660300002)(186003)(336012)(108616005)(24736004)(83380400001)(7636003)(2616005)(8676002)(36756003)(8936002)(6916009)(70206006)(70586007)(786003)(36906005)(478600001)(316002)(86362001)(966005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2020 21:28:19.2643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d45c2b1-78b4-4216-7e16-08d894adb10a
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT012.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6457
Subject: [Nouveau] Could Fedora-5.9.9/X-server problem be a Nouveau-problem?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi nouveau@lists.freedesktop.org

My X-server gives a blank screen on Fedora kernel 5.9.9.

I am in doubt whether or not I should blame Nouveau for that.

I know the nvidea drivers have problems with Fedora kernel 5.9.9.

I can file a bug against Nouveau and provide logs if you think there is a remote chance that Nouveau could be the cause.

Here are some details:

Fedora 5.8.18 / X-server works fine.

I can boot into Fedora 5.9.9 runlevel 3 (no X-server).

If I boot into Fedora 5.9.9 runlevel 5 (with X-server), the screen powers off instead of giving a login prompt, but apart from that, Fedora 5.9.9 works fine and produces log files.

If I then power off and boot into Fedora 5.8.18 and read Xorg.0.log.old I can see that the X-server under Fedora 5.9.9 did not get the screen resolutions right.

Here is what monitor-edid says under both Fedora 5.9.9 and 5.8.18:

> monitor-edid
Name: PHL BDM4350
EISA ID: PHL08fa
EDID version: 1.4
EDID extension blocks: 1
Screen size: 95.3 cm x 54.3 cm (43.18 inches, aspect ratio 16/9 = 1.76)
Gamma: 2.2
Digital signal
Max video bandwidth: 600 MHz
	HorizSync 30-160
	VertRefresh 23-80
	# Monitor preferred modeline (60.0 Hz vsync, 133.3 kHz hsync, ratio 16/9, 102 dpi) (bad ratio)
	ModeLine "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 -hsync +vsync
...

But under Fedora 5.9.9, the X-server is unaware of the 3840x2160 resolution according to Xorg.0.log.old. It also gets the screen physical size wrong.

My first cry of help is here:
https://ask.fedoraproject.org/t/no-login-screen-after-upgrade/10618
That is where I leaned that the nvidea drivers have problems with Fedora 5.9.9

Cheers,
Klaus
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
