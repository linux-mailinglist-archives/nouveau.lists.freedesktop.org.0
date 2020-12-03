Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B322CDA98
	for <lists+nouveau@lfdr.de>; Thu,  3 Dec 2020 17:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D86EB7D;
	Thu,  3 Dec 2020 16:03:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80130.outbound.protection.outlook.com [40.107.8.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462EA6EB7D
 for <nouveau@lists.freedesktop.org>; Thu,  3 Dec 2020 16:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNHNaiZAD80+0VnzrJZFxtLx3hT8XL7TtWqwCqWtwteKztdWXnT2IaabhzlKRlZXUaK0xw/UtuhNweGKd+c8TmiCd7YhKKsrS3G5GhDByLD37TNFWhbwBbz4Sc15e9v2dx2s2kK4bKJ0Fs93kCzeKfBw6KAB/cCAIxQB95ckOAnGGb9qnifGtLwNnoBOFXOMTFxRhC1c0fjiV0r8cCau0ZhbOg0DzNC6RZMNPn5e9HFEGhy1taLw9UYtAPXrY3fo4hI6iwmb6HYIUrbH6Juy4wSkQhetYSeA9tXFTq22yzTxlBn/vpc54ZQy0vhH2D4gJIF1cvUxwvnxejA4jmFDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf2HPpi5SOh0S2UYNM8jlYM48qFzTVXwA5ZhM0z8cHw=;
 b=jr0Rax7QEX2Ct/aSNB6k4CfMY7xjpv4ySLsJY+T8RtXzNob9fxOFc/OCRzRYYg7h5EG0BEtnwIvI48LTANSlww+gNdIyf1oqp49F2nr9I2Ym5v0XRu4VPOmqvDMoafNGTGAYgpdBq96XHuu8xUZut5mSNMn3xduN40xK8Z4+bf/5BJFNd6Kwq9pN4oku3ihZ5Ai+/NZfdRkv6GZKxSkkVoGGxtBks2sIDjUgfXnL5bDcrZgWIRHKAtv/FVOi3JlvNHRFlh4X2VoX7+67ufaMx3fLMDdHRgdGcQwnJ6aW4L6k1EQtnQGPZUIAuNM8iwxMnKKmMGD50ZmG8z/y8qsC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 192.38.125.140)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=di.ku.dk; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=di.ku.dk; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf2HPpi5SOh0S2UYNM8jlYM48qFzTVXwA5ZhM0z8cHw=;
 b=Q+YyPrltf5MkSchBq3iZdyHT46cnWMRU32tzyZLkEfyWE+VsYiuObqGb/h7CbG/BjD3gswo2pkNDeqbEOmGcz/3PBQEntpegoQ44Mxb3T9UM4HDA8fasfFgq3bXSxWjUyxO03iDp/jWdqCgP3BQiqKXHHRggiT1nbvtbJsUdyZ8=
Received: from AM5PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::36)
 by AM0PR04MB5315.eurprd04.prod.outlook.com (2603:10a6:208:c3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 16:03:09 +0000
Received: from AM5EUR02FT029.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::93) by AM5PR1001CA0023.outlook.office365.com
 (2603:10a6:206:2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 16:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 192.38.125.140) smtp.mailfrom=di.ku.dk; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=di.ku.dk;
Received-SPF: PermError (protection.outlook.com: domain of di.ku.dk used an
 invalid SPF mechanism)
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 AM5EUR02FT029.mail.protection.outlook.com (10.152.8.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 16:03:09 +0000
Received: from sepo4.ku.dk (10.78.8.10) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2106.2; Thu, 3 Dec 2020
 17:03:09 +0100
Received: from 10.78.0.166 ([10.78.0.166])
 by sepo4.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 195;
 Thu, 3 Dec 2020 17:03:09 +0100 (CET)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX03PW.unicph.domain (10.77.0.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 3 Dec 2020 17:03:08 +0100
Received: from MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c]) by
 MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c%6]) with mapi id
 15.01.2106.004; Thu, 3 Dec 2020 17:03:08 +0100
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
Thread-Index: AQHWxlD2xLL8tgVWbEyZw6VXVXLananfqVaAgAEiW7WABMHvhw==
Date: Thu, 3 Dec 2020 16:03:08 +0000
Message-ID: <20e4ed0a13c34dd0b3dfa41924a40fc0@di.ku.dk>
References: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>,
 <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>,
 <45fcac9dfcd54c20873427cc5042aeb4@di.ku.dk>
In-Reply-To: <45fcac9dfcd54c20873427cc5042aeb4@di.ku.dk>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.8.10]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c1837d-fc37-4bb6-c5fb-08d897a4ee15
X-MS-TrafficTypeDiagnostic: AM0PR04MB5315:
X-Microsoft-Antispam-PRVS: <AM0PR04MB53157D6858D52D1658334857E3F20@AM0PR04MB5315.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3ivIUYIaH0irvuBmQFTv01+Eqq+/fJ6xo6LMb7tttjCZrd4KCjgJFftxUHHI/Wu60SyY2Iag9PBJPX+F3kJyiR1kh0E8wbf/IAX2rO8BrBQiDuLzKS886ZKwZXmLxuWa8TFDghtWZBz2O+giiIWA/7cU5IHBFpM82TF/xbj3U1WzZ8Js/nuJOs+/Njb5pNPbdbb8qKhwgYK43XWZ40h3iit8L41UIlXK0zjwTuoHqesE+NdXZfHuH7f/8QPt87fiZYPonvuC6PgHxyf6S3Q56FhbS0c6I1n7CHR8LbJg9VGCN9VjRsWB8BDRXRjhyLsYXfwx57N9ISUET9cPBZkYw8TwCrB/4bnHPdU3J6H6MLSL9jiMiJSyXi0c1Krrc8+WhLHcc9zOi2z5zQBpmKbCQ==
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(46966005)(7636003)(70586007)(108616005)(356005)(4326008)(24736004)(186003)(4744005)(336012)(8676002)(47076004)(2906002)(82740400003)(8936002)(6916009)(86362001)(36756003)(70206006)(7596003)(2616005)(478600001)(316002)(26005)(36906005)(82310400003)(5660300002)(83380400001)(54906003)(786003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 16:03:09.6920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c1837d-fc37-4bb6-c5fb-08d897a4ee15
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT029.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5315
Subject: Re: [Nouveau] Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Ilia,

Just to follow up:

I can work around the problem using this file:

> cat /etc/X11/xorg.conf.d/90-monitor.conf
Section "Monitor"
        Identifier "DP-1"
        Modeline "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 +hsync -vsync
        Option "PreferredMode" "3840x2160"
EndSection

So it seems that everything works except detection of the monitor.

Cheers,
Klaus
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
