Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B74324D2
	for <lists+nouveau@lfdr.de>; Mon, 18 Oct 2021 19:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07426EA8D;
	Mon, 18 Oct 2021 17:18:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAFE89AE6
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 01:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dK/ggnaHtEnURRJAo9YV6K/umhGvZkf/EOwLnabvXp7CcKhi0UwO6WH5wqODKQlLL9wWjDjypHjuK7xXxqEDhw2OYPNv7mYTDPSMyPerl3fJ8H0XkDa25Gu0mWWXTvneIURbUIWYXQqhLwlsRYYAfxOw4y46e4JXF5DnGxhUjLpPJYSLrKZzfdg0274d0yAX0HoZdxA1ujPzlU6gTYOsGSXcl5uvb9pAiovwfKYazEyFM3KfCuXuy4Ck2GPAO78GxqdwpNsq7j8VB/vcwDCPAn/bkAvavDIXig+un410pfdVzqcWJjbedFCEiWLuTzJNBpjzZQbSOqbvyDNv2PwXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzDpYU3WACSUscc+YK6oCFwXrWGVDiBZs1XdkO20bzI=;
 b=BHQu5wHmFKmY1bNjMPPAQYnOzeO4R0IwlzTl51jUYZzRGtn4sPu+BNvL9UWz5QVSWgz1J23g0rOrCTtLV50nuvc3xugDNa0twpJUumbHRqZG/xpHv3z4NqnYUGxUv7QzN4mKFKzTa+Vs58tMrTR4CimQzCzQ5LDhE5+I4wOc4BaJ8Mh02n8YMfVzpc1XJGGqEGfCcHVE+7I9xlVctbow71sTKjUWidi7RUfDG/7bqPXSpTDlag/fzbhhDTHAyMxKp2rhzm9V2ujkehaaO4utv5KUJNoNxYKgMis7zxJ6TKMgJHajkJF2w3Jk7PyVFTvZKcQr7a9ZhballkRCPxrb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 188.184.36.50) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=cern.ch; 
 dmarc=bestguesspass action=none header.from=cern.ch; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com; 
 s=selector2-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzDpYU3WACSUscc+YK6oCFwXrWGVDiBZs1XdkO20bzI=;
 b=km0d0K3Od+egBa2FZRLPnllp9PUQoswhD4UQJwno6XW/+l0qt0h1pZOHjgQAunTCrR/9cE5rZgs3GSXV+1OO6ODMkIlTNtVKxfWsY7etoi7FlJr6rsDTADFJYBbq4IYbSSsmefmpH50WS1l0hpDpjYGI2uWP3OQ2bpLmmjcGlDQ=
Received: from AM6P193CA0065.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::42)
 by VI1PR0602MB3680.eurprd06.prod.outlook.com (2603:10a6:803:1e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 01:12:37 +0000
Received: from AM5EUR02FT055.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::cf) by AM6P193CA0065.outlook.office365.com
 (2603:10a6:209:8e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 01:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 188.184.36.50)
 smtp.mailfrom=cern.ch; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.50; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.50) by
 AM5EUR02FT055.mail.protection.outlook.com (10.152.9.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 13 Oct 2021 01:12:36 +0000
Received: from cernfe02.cern.ch (188.184.36.47) by cernmxgwlb4.cern.ch
 (188.184.36.50) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Oct
 2021 03:12:35 +0200
Received: from [IPv6:2600:1700:ef10:46e0:9aa1:450a:4eb:4e12]
 (2600:1700:ef10:46e0:9aa1:450a:4eb:4e12) by smtp.cern.ch
 (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id 14.3.498.0;
 Wed, 13 Oct 2021 03:12:35 +0200
To: <nouveau@lists.freedesktop.org>
From: Dhevan Gangadharan <dhevan.raja.gangadharan@cern.ch>
Message-ID: <96ecf8a6-e75e-4f11-b3c2-92f1b95af5db@cern.ch>
Date: Tue, 12 Oct 2021 20:12:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2600:1700:ef10:46e0:9aa1:450a:4eb:4e12]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09929804-d4f7-49dd-658c-08d98de68b0a
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3680:
X-Microsoft-Antispam-PRVS: <VI1PR0602MB368077F3AD23F60D37C35AEAB3B79@VI1PR0602MB3680.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dpRp8WABQ6wDX2QhHSdzLBB+hB3GA+8EF2BCXJtU4AqTnwKrjLy79CjWDJXQJ7SVbkQ0zTT9EaevDci3DF8/MQlyJlNvIv4iwrDngQgF/ElOlyLOfFZH0JSGBsmFqsOqspuyOVG4rJuRg6tB4r2c7KAFvfOxJ4R66Od6aJfieghL5ure6fu49PlIX6e8F4FzrA4C1Gh3h5ep6ImRtZPlpmzBN92Ctmp5cqtGdWmPYMifg/xd/3wibuWu2L43wA+5nzoFplxqmVlohCWhh0tO5vP4gx+RC5nAhMkwqskI7KppL83wH41TDMMRujzcyU2YHI/qEm96gFKOs6RPSzuK9pet2OeiyrbkDHX3Z4qnfEO/lJYUGZHKE/W0lTUKnPzgdhdXkTUwmZCo3Nwd1VBOyEwbyw0uK30iwo3VKDifUhYfn5CNoYvnLvx8Cp6imR1RJP11Yrb63PXfIJVrdSq1T+5AjR/xC8xy0S8zprSbb0ggNmBO0mYaN6hTOlnl5yEUatUdho6KwiRAjCMAJru/zqkpfTELc99x3oKYb+WzNQhYPEu2PerfS59CH3p2pDgZdzF2EPEbvFCjIADTqQcLXSPIdoiIMYucHTPxVZghVWCPY/2tnDbO4yPLOQug73NeAARfXE2IyISzmSfTNn0QhZdYHpFlW3c+XHDH08i8YhEUkQG84PA/Oj4Ucl93QHPLQDvgDuDUoqk+VHR6uWUPyQFAKvZPN9ho/YMc6Ildec=
X-Forefront-Antispam-Report: CIP:188.184.36.50; CTRY:CH; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:cernmxgwlb4.cern.ch; PTR:cernmx11.cern.ch; CAT:NONE;
 SFS:(46966006)(36840700001)(8936002)(6666004)(5660300002)(36860700001)(2616005)(316002)(82310400003)(2906002)(36756003)(508600001)(4744005)(70206006)(26005)(86362001)(31696002)(31686004)(8676002)(356005)(7116003)(70586007)(16526019)(83380400001)(426003)(6916009)(336012)(186003)(7636003)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 01:12:36.1326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09929804-d4f7-49dd-658c-08d98de68b0a
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19; Ip=[188.184.36.50];
 Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT055.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3680
X-Mailman-Approved-At: Mon, 18 Oct 2021 17:18:27 +0000
Subject: [Nouveau] RTX 5000 compatibility
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

Hi,

I recently purchased an nvidia quadro RTX 5000 but for a certain linux 
application the proprietary drivers do not work.  I was recommended to 
try nouveau but first I wanted to see if this GPU is currently 
supported.  I could not determine this from your documentation online.
Could you let me know if your driver would work for me?  My OS is Ubuntu 20.

Thanks,
Dhevan
