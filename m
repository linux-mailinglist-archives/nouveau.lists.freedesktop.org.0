Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38A44B23
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 20:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8E889834;
	Thu, 13 Jun 2019 18:52:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00068.outbound.protection.outlook.com [40.107.0.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1681B89823;
 Thu, 13 Jun 2019 18:52:48 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5919.eurprd05.prod.outlook.com (20.178.126.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 18:52:44 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 18:52:44 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 03/22] mm: remove hmm_devmem_add_resource
Thread-Index: AQHVIcx8KEghGfMSdEK+G1+HLD+T3KaZ7r+A
Date: Thu, 13 Jun 2019 18:52:44 +0000
Message-ID: <20190613185239.GP22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-4-hch@lst.de>
In-Reply-To: <20190613094326.24093-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:208:134::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88cc1feb-7b67-4d6e-c18f-08d6f03051c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5919; 
x-ms-traffictypediagnostic: VI1PR05MB5919:
x-microsoft-antispam-prvs: <VI1PR05MB5919FFFF62953C9A7D5AF300CFEF0@VI1PR05MB5919.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(39860400002)(136003)(199004)(189003)(99286004)(229853002)(7416002)(2906002)(53936002)(6486002)(6436002)(86362001)(81166006)(8676002)(186003)(6916009)(26005)(81156014)(102836004)(6116002)(4326008)(3846002)(25786009)(305945005)(7736002)(76176011)(6246003)(68736007)(486006)(316002)(52116002)(476003)(386003)(6506007)(11346002)(2616005)(446003)(1076003)(14454004)(256004)(4744005)(71190400001)(66066001)(33656002)(64756008)(66476007)(66946007)(66556008)(71200400001)(54906003)(36756003)(8936002)(6512007)(73956011)(5660300002)(478600001)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5919;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iPoetAJzPWZv8VU52oGqZLrf5f3NTUkWPIOsu2E3P9cUOeZ3NwtuyEYz7iS7GJhlnDVMvGysQH81INXAyHGi4fhjs5va1Vo7Rdk93MlIgXRDPGqXx6+KGKEioXBXh61QIBW+HjfcdF9Afc/Uz8IU4w2KDhGZZyhNl/YEDKF9BG8aoozap+p31SfnFwV4kfNk64o6JW56KSiT60BrYrmeCz1XjhbsuaBg6SlAuqng5W2PWwz6FDD5jzrI/s5ZqBSLG+9QaRGa5ztkbj0f21QAbgQ9bDRkhNtDPfY/D24ndwUJPvjpdNIvVA5Nbk22Z1FnYXFRZc91aJgcqQyXDuUFzCT23/IfQophXoBr4oq2jKokb9DjG1mV1f29A7FqlAqhk+lNsM6TLohpGpppFxMbAIkVr/LP6Ao3e2lHBGtj3ng=
Content-ID: <866711CC77D78F4DBA1F59965DF24E41@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cc1feb-7b67-4d6e-c18f-08d6f03051c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 18:52:44.2949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNfgWtpWZP+R3zWab6EmeYAQTAYgx2pVR+LpFXyrRss=;
 b=HuhOeDN4cvQnIPbnkY3/38FWBgnbccW+6aHtR17EeaLBgLlfggbM7Jmgd9HH/svLW/bPsC9MlhNeSNa3bXCOnAHSwbCOCWxV/UJ9cNCAooyjp2IS3RJ6Yyn/362HV2+z6SsrcvE5DkDoUj77xNdUXAVZHIbvMwr5hkc5ZHOX/JM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Subject: Re: [Nouveau] [PATCH 03/22] mm: remove hmm_devmem_add_resource
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDZBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2VkIHNpbmNlIGl0IHdh
cyBmaXJzdCBhZGRlZCB0byB0aGUga2VybmVsCj4gbW9yZSB0aGFuIGEgeWVhciBhbmQgYSBoYWxm
IGFnbywgYW5kIGlmIHdlIGV2ZXIgZ3JvdyBhIGNvbnN1bWVyIG9mIHRoZQo+IE1FTU9SWV9ERVZJ
Q0VfUFVCTElDIGluZnJhc3RydWN0dXJlIGl0IGNhbiBlYXNpbHkgdXNlIGRldm1fbWVtcmVtYXBf
cGFnZXMKPiBkaXJlY3RseSBub3cgdGhhdCB3ZSd2ZSBzaW1wbGlmaWVkIHRoZSBBUEkgZm9yIGl0
LgoKbml0OiBIYXZlIHdlIHNpbXBsaWZpZWQgdGhlIGludGVyZmFjZSBmb3IgZGV2bV9tZW1yZW1h
cF9wYWdlcygpIGF0CnRoaXMgcG9pbnQsIG9yIGFyZSB5b3UgdGFsa2luZyBhYm91dCBsYXRlciBw
YXRjaGVzIGluIHRoaXMgc2VyaWVzLgoKSSBjaGVja2VkIHRoaXMgYW5kIGFsbCB0aGUgY2FsbGVk
IGZ1bmN0aW9ucyBhcmUgZXhwb3J0ZWQgc3ltYm9scywgc28KdGhlcmUgaXMgbm8gYmxvY2tlciBm
b3IgYSBmdXR1cmUgZHJpdmVyIHRvIGNhbGwgZGV2bV9tZW1yZW1hcF9wYWdlcygpLAptYXliZSBl
dmVuIHdpdGggYWxsIHRoaXMgYm9pbGVyIHBsYXRlLCBpbiBmdXR1cmUuCgpJZiB3ZSBldmVudHVh
bGx5IGdldCBtYW55IHVzZXJzIHRoYXQgbmVlZCBzb21lIHNpbXBsaWZpZWQgcmVnaXN0cmF0aW9u
CnRoZW4gd2Ugc2hvdWxkIGFkZCBhIGRldm1fbWVtcmVtYXBfcGFnZXNfc2ltcGxpZmllZCgpIGlu
dGVyZmFjZSBhbmQKZmFjdG9yIG91dCB0aGF0IGNvZGUgd2hlbiB3ZSBjYW4gc2VlIHRoZSBwYXR0
ZXJuLgoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
