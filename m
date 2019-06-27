Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7F85871A
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 18:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB856E105;
	Thu, 27 Jun 2019 16:30:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC386E081;
 Thu, 27 Jun 2019 16:30:02 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6032.eurprd05.prod.outlook.com (20.178.127.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 16:29:59 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 16:29:59 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 24/25] mm: remove the HMM config option
Thread-Index: AQHVLBqsRKRxj5FxGkevpNmecZGFtKavsuOA
Date: Thu, 27 Jun 2019 16:29:59 +0000
Message-ID: <20190627162953.GF9499@mellanox.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-25-hch@lst.de>
In-Reply-To: <20190626122724.13313-25-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.199.206.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0151b4b8-c186-417a-5d94-08d6fb1cb28f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6032; 
x-ms-traffictypediagnostic: VI1PR05MB6032:
x-microsoft-antispam-prvs: <VI1PR05MB603205C1A7792960EECA583DCFFD0@VI1PR05MB6032.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(6512007)(102836004)(5660300002)(7736002)(305945005)(6116002)(486006)(478600001)(476003)(81156014)(256004)(386003)(11346002)(53936002)(76176011)(3846002)(2616005)(52116002)(446003)(81166006)(6436002)(8936002)(68736007)(66066001)(6246003)(316002)(2906002)(54906003)(229853002)(99286004)(36756003)(6486002)(26005)(6506007)(186003)(64756008)(6916009)(8676002)(7416002)(66946007)(4744005)(1076003)(66476007)(14454004)(4326008)(86362001)(66556008)(66446008)(73956011)(71190400001)(71200400001)(25786009)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6032;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9A6iNgq7ZRD14y7lsHP8UnKnqhIiFdeKgjWYA1jatzb8GnGnHiDhk19p0NkDyNq/Gcat5H/okmisOy6TJt9eUby66lOVVov9OqQOHhZrCb7iavtLvtwZQD9yD+Kc87mvHoGEH3mzdRnL4QVIJ2AUVshzNBbsSQNOFogrQebge8LavQESGjw8P2EBLmdflurGmw8JERlr2w/ZGRWw0QDUgxgBEMu+rk/mJEfk6O7kGOoQME52DOYMbaibXgt9vHEGeTbCa092EHjSVLfNGYpX0mRLb4w5ljwewWgyFyYANaYbtuj0yQaTgafTijlOAiwof9ioolGafwfyp901ymvyYNMoAOAHyLw1vTwe/ZKuE+qIso6zWpzkOzkrfPUJsDHzlwk3k7d35w08WNYILJzNFScDslN3Qm7b/nwPZmzkFUo=
Content-ID: <F6F5CD4C0A7BBA40A1967D61F8AD76F1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0151b4b8-c186-417a-5d94-08d6fb1cb28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 16:29:59.6088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6032
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUTlgfdID2iRtFCZgVweDp5Qtf+mItNdaN0x/fMGgZs=;
 b=FCgEsLalfRXB4rv9hD0QxS/nthmGlfplI0uu4eJ3CMBFkQ2Bd7YzkRdW+p8gRpkMeGC6OBSQ+POJ9MTepzuc/+EAKH5OnVqI+whx+h24Qw+Rid2rrtIUW6utO9CLzdEdxlI04SsmqIMg8KUBIH0lq9fYbPyWXqFd7/WcsOHb/Fc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Subject: Re: [Nouveau] [PATCH 24/25] mm: remove the HMM config option
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MjNQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQWxsIHRoZSBtbS9obW0uYyBjb2RlIGlzIGJldHRlciBrZXllZCBvZmYgSE1N
X01JUlJPUi4gIEFsc28gbGV0IG5vdXZlYXUKPiBkZXBlbmQgb24gaXQgaW5zdGVhZCBvZiB0aGUg
bWl4IG9mIGEgZHVtbXkgZGVwZW5kZW5jeSBzeW1ib2wgcGx1cyB0aGUKPiBhY3R1YWxseSBzZWxl
Y3RlZCBvbmUuICBEcm9wIHZhcmlvdXMgb2RkIGRlcGVuZGVuY2llcywgYXMgdGhlIGNvZGUgaXMK
PiBwcmV0dHkgcG9ydGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgfCAg
MyArLS0KPiAgaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICB8ICA1ICstLS0tCj4gIGlu
Y2x1ZGUvbGludXgvbW1fdHlwZXMuaCAgICAgICAgfCAgMiArLQo+ICBtbS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgIHwgMjcgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIG1tL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBtbS9obW0uYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDMzIGRlbGV0aW9ucygtKQoKTWFrZXMgbW9yZSBzZW5zZSB0byBtZSB0b28KClJldmlld2VkLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
