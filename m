Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7689135BBE
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2020 15:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8E26E907;
	Thu,  9 Jan 2020 14:53:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D21A6E907
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2020 14:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUUnni0f+4KFIfE4FNSyU6J/nqQ9xX5Qj5qjjn1XZlAH8HjL9Mwfcw2XeEuwnMvUaZ3MOVbEcDBe/gMLkSK1/NScprORjFO3PxPbUrZsQ9VFpUY2uy7PdX2+y6xlczoRJRaX7ws/HWTQ4DB76QLEvCBJ38sDvZiOEYCKh8CH+/Jwzr9gSCYNwCn2++aTRWdBf1uAmUpeGkISRY3GQW9BEaNvC6txaIqtERAO9L8HRUmUmVi9YOdxvsi2rJGYpETjbXssfpoV8xYrrBjOYz/mtkVW3lKMGs/64I+UAqVv30YDta0DI2wAQDVqvFlixRv+kubIR4+1LgIBwG2it67DbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0ATy1b4E3suKZK6doB2snn5SjorABiMGoiwns1dzyM=;
 b=Rwd9Mg4+k75j6Pin6KrtF5g/mjYPlxpKN0D6+XxhsDebyzn174z6J4otxFrpBOE2opUm7zb9C87sq5tM00ScXeTUtBCkUxmWWGmpcM6C+D/JF+MWwa/dZuAcTYAGTaaSioMiwQdffaf2/OssZojVWT++jLsdg7EiG6t0n5+G+lSdyTjWx3gfw4LwJ7miIfOIGBnbjfqQALQXLuZPUsFTREgqCwk89vT9GFuekCJNoaZZgvOIbuE+px9Qff4IXL4Diw7YDhhWNUIWtwQgvGnzJ/Rt+kgdJ6wubSPppDpMXy1/bIlimgcng6li1uP32tyvUlP39SCCR79k0i87h6ivyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0ATy1b4E3suKZK6doB2snn5SjorABiMGoiwns1dzyM=;
 b=KU32mdi7If9PNeLQE+XqTp2+kA+W+xOG+pJi4mbET9dV74YXCZesWqiqcDg/9/JU2Tai06KhkIZfMMLX0J6++vNPj6ZfLMT2ydu8V1Ggoqxx+8mAnCQiBhOpC3r0g7r0sP+DEiWguDjmvC2YNl5ziT5BPjHwShyypZLKQrJFOLE=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5246.eurprd05.prod.outlook.com (20.178.11.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Thu, 9 Jan 2020 14:53:10 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2623.008; Thu, 9 Jan 2020
 14:53:10 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:236::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.6 via Frontend
 Transport; Thu, 9 Jan 2020 14:53:09 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1ipZBJ-00064R-Ux; Thu, 09 Jan 2020 10:53:05 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Thread-Topic: [BUG] nouveau lockdep splat
Thread-Index: AQHVxop40iaTho7qbUKqgrcuG+zr9afia+qA
Date: Thu, 9 Jan 2020 14:53:09 +0000
Message-ID: <20200109145305.GV20978@mellanox.com>
References: <20200109011640.19678-1-rcampbell@nvidia.com>
In-Reply-To: <20200109011640.19678-1-rcampbell@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:208:236::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 07309543-e7be-4084-0d84-08d79513a4c0
x-ms-traffictypediagnostic: VI1PR05MB5246:
x-microsoft-antispam-prvs: <VI1PR05MB5246291D6A076B2665502640CF390@VI1PR05MB5246.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(36756003)(86362001)(33656002)(4326008)(2906002)(6916009)(81156014)(66556008)(66946007)(9746002)(9786002)(5660300002)(186003)(81166006)(8676002)(66476007)(66446008)(64756008)(8936002)(54906003)(1076003)(52116002)(316002)(71200400001)(26005)(2616005)(478600001)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5246;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B/J6ZYMldnU2P26XFX01gTkW8Vw1mFBFzWaS9kzwTpjJg5XNZyIYveYii9nIio4E8CCudIXESSGd5q/83mhvSQYnIM++LU7Q2kXjPo6hZSQ0tk18cSKA3c6Y9L+zF1k9mZKmZtsktqSV9uoRCvlhNts2+k70OJQ+1YV8O1X6drJOBw3/ifsdxqG7P/e5MKfLp8KFEFWoPlaA5+BSixNGBvhBzTaWISaVWpM6PZulEoSi/4mu15clllUm066Yi/TDkEhfGTSa/8Uie3TuzBOVYsKMEbiL1rl3RWew20HeqKJTwiXUsFExjvggKYGJ5NoT+HwOJRkTqlSRaYzxqDP/xeTX4Sq/TgD8g799jriiYF/DNRRInZ7Pb5Y35rbh/2jxtsFM0/fRgcDIpKYpskFMJqtVcgi8+qT2Q9RHnfgnYLshHNdiqkpXWgdGAT78Jp37S8vypHpXzSN8atpM+sUFANyRW3FodV3lOBlg9ICKTBBn17BTKxtoJ3fsqFhwtGwW
x-ms-exchange-transport-forked: True
Content-ID: <EFCCE5C3CA7FC54D9497CF2317C63284@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07309543-e7be-4084-0d84-08d79513a4c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 14:53:09.8860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeI/5U2K+twQHQaiZDCYgP0vQaQRfa+AEFl2o2bVgTSeIMrXlzYuZbjRGD0nbAKEwFgaz70lm38pZAyUdYdwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5246
Subject: Re: [Nouveau] [BUG] nouveau lockdep splat
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 05:16:40PM -0800, Ralph Campbell wrote:
> I hit this while testing HMM with nouveau on linux-5.5-rc5.
> I'm not a lockdep expert but my understanding of this is that an
> invalidation callback could potentially call kzalloc(GFP_KERNEL)
> which could cause another invalidation and recursively deadlock.
> Looking at the drivers/gpu/drm/nouveau/nvkm/ layer, I do see a
> number of places where GFP_KERNEL is used for allocations and I
> don't see an easy way to avoid that.

Not quite..

Any lock held by the invalidation callback becomes a lock where
GFP_KERNEL cannot be used within it's critical region.

Ie we can't have a notifier callback block on a lock which is held by
another thread which is blocked on GFP_KERNEL as we now risk
deadlocking on other mm locks if that allocation triggers reclaim.

AFAIK there is no fix from the core side. The driver must respect this
and be organized to deal with it. Daniel fixed the intel driver
already, I fixed RDMA recently, the other drivers must also be fixed.

Some choices
 - Split up the lock held by the notifier callback so it doesn't need
   to cover allocations
 - Use GFP_ATOMIC for allocations
 - Speculatively do allocations before obtaining the lock and free if
   they were not needed.

I suppose it will be some troublbe for nouveau, but it must be done
there..

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
