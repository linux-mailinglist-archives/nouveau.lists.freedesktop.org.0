Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E27B126
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 20:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2EA6E5F8;
	Tue, 30 Jul 2019 18:03:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF72D6E5F8;
 Tue, 30 Jul 2019 18:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk0bVpZiIeNPTu0EyrrhRFLJcNWf4YDhhNeZ8X3Jywa4yU8jafq35yLEduNuf/4OCnYN5RVZhn0zZatcJkRHE8CBGDtaiu5w6SzFpEMwq0Z9rzxMmfyz7bxvqNER7b1Y5uHBD5VWtBXaTUHYmp0fUZNjnaEnGiOjrIiGph+Wb+56//se4vkx2ZSX+nSH4JiCJp8Zu1YTCnsQXCS/9BRo6yH54JCkX49ILapy90zQyDuafmX3ypTeujx4D5WhF0sROgOZil7/S+dpfeOVhu9jHvYceTUwwsS+jhzYyecDMrbhrsjU5oEXtFGV4BWoW8dNoTG6rf0QGLyASVtPYJ/9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe6eJ2krxq6gY9cV8D0PGtTCTRLtX31xUVU26+G/yF0=;
 b=NnZ3enlQmLx3U2OqvG9MmdLXhElOTKS4YnIU9qVT/6+RrsyXSOQ2Sb8UnfQKDgYkbplDtcyQnKVejGdqRw9lZlj38j8NaTvvnyoyO23t77vehtrrQJVF3q/23IVZEPMBrM7pDXjH1JQ9I/w6j8EFeY0nLRc6QR6bLa76trwkkKGvpbnHdo+cj9V9Ju3SRapoGRlTDKUajPMtzAUN7C6DyIq/2a9AGELfhzkQrPPjUDXrct/n3P9GngJ9DKW4SVcXnZ1x7KR0o7P9tdxY6HseJJnf8xOO4iS3xbyy9uPD7Ssl7+KTNzhHVVbxAowF9EDpdH0CScURx/nHnRI987UH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5728.eurprd05.prod.outlook.com (20.178.121.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 18:03:51 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 18:03:51 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 13/13] mm: allow HMM_MIRROR on all architectures with MMU
Thread-Index: AQHVRpsJa23GemswhU+gJVFr5hDTJqbjdQwA
Date: Tue, 30 Jul 2019 18:03:51 +0000
Message-ID: <20190730180346.GR24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-14-hch@lst.de>
In-Reply-To: <20190730055203.28467-14-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::14) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 085a24eb-2e30-4b11-f6ac-08d715184728
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5728; 
x-ms-traffictypediagnostic: VI1PR05MB5728:
x-microsoft-antispam-prvs: <VI1PR05MB57281EA66ED36E4B6697FAFCCFDC0@VI1PR05MB5728.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(6116002)(3846002)(68736007)(2616005)(71200400001)(71190400001)(2906002)(11346002)(14454004)(386003)(102836004)(26005)(446003)(486006)(256004)(305945005)(6506007)(5660300002)(476003)(52116002)(186003)(76176011)(7736002)(66066001)(86362001)(81156014)(6916009)(6486002)(6512007)(6436002)(25786009)(4326008)(36756003)(7416002)(4744005)(99286004)(66946007)(478600001)(1076003)(8676002)(81166006)(8936002)(316002)(54906003)(66476007)(33656002)(66446008)(66556008)(64756008)(6246003)(53936002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5728;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dl5OFmKR4GZLV8C0uAvDZAoziNdxhHyg4xcY8lGvTPBO5va7Xl90/JyOsSjIJI7vtEbOsCDgApn1DvvYg+Q5MKW/vMCbjCLzwlO3946LGu2vIMB8gQuJdCTgK7pcsFv/MS8LEFyfzFC9prjhZFcLNoMbsJFc1eLpkh8/C2iRnzMeMwm3hr0Td5xd2Wue+j/UhROameb0ZI1eS65K/vBfopXojSIId5z8e9UDw8XLpgBtBrepcRGtFvUEXyuSa22NWEM3hK2iASodMMPNdBcqIAfPBcZSvan6MhiEhu4kUK6gjoGpS3RH71GeuK5U5XtXdaEGD1IhzAMlQ7zW2O5ERMSoXR0YeSGhsvJ2Zvka1GfbHOcxVuIhqKq6MEfbpXEHmQ9HKDLxhyi4Lc7RAovc3XbxuZcB75KR4wFiQEo6RQY=
Content-ID: <99F74B5B1EA70C41A24AB791174D4BBD@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085a24eb-2e30-4b11-f6ac-08d715184728
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 18:03:51.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5728
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe6eJ2krxq6gY9cV8D0PGtTCTRLtX31xUVU26+G/yF0=;
 b=HTE7x31h+0FTE57z7CvH0ButSvGq5gxxVbbgAz78qZGH7x4T281JeDV77tBrEnCRmG0GUy/Ng4EbWHXw/XF2AKtQEN4csbHGn4INBv5lJveUfVCKKSNt2MTWWB58T/ou8qZiRi7mGxkKUPOqpzbke66FLjvWeTIC6EuKJ9B85SI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Subject: Re: [Nouveau] [PATCH 13/13] mm: allow HMM_MIRROR on all
 architectures with MMU
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTI6MDNBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlcmUgaXNuJ3QgcmVhbGx5IGFueSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMg
Y29kZSBpbiB0aGlzIHBhZ2UgdGFibGUKPiB3YWxrIGltcGxlbWVudGF0aW9uLCBzbyBkcm9wIHRo
ZSBkZXBlbmRlbmNpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Cj4gIG1tL0tjb25maWcgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpIYXBweSB0byBzZWUgaXQsIGxldHMgdHJ5IHRvIGdl
dCB0aGlzIHBhdGNoICsgdGhlIHJlcXVpcmVkIHBhcnRzIG9mCnRoaXMgc2VyaWVzIGludG8gbGlu
dXgtbmV4dCB0byBiZSByZWFsbHkgc3VyZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
