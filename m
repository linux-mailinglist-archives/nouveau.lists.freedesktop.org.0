Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C385261
	for <lists+nouveau@lfdr.de>; Wed,  7 Aug 2019 19:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B16E749;
	Wed,  7 Aug 2019 17:51:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04389236;
 Wed,  7 Aug 2019 17:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXtyE25G3xpLGXX/rt//zw4804WFmHvXf06GoxyEfeIPKr4Vc2YKaASvU8WuKTF8yMxf6ELSDdzIVSlbBnX1t1Gil/y/Y5FntQh6xMkGviKZjITPTEyZf3MgDFA3rU9yQAGbvPf/MQcEba4ECBxB4N1oNgjx/mB4Tw2aAdFKTuOH4CutyUyrYCXXv6zCqzNYJurYVN+/0gMbBUeUTk9mbCMno01CpdjxzZJFY9wmHpvuwyIEsYVOWe38hfCDPWxXn+0zYWWsgXd2TlDAmD76N3V8bHqh2XruHq2EiFhrIwMqOQgCARfdc1UhyocNdKS7HpZjV9iOfpyYspD40EK2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAlAMG+JLtGu7rKGT5llROIM3tAMQg7D1447E3gVtM4=;
 b=bXmPki7M34ONwDreXer1P/NQQPYPpfh9XpG1wqQzRj0M4syioPOpXEO/bvpa+BWbbXTDTMYUGEYq1DUwleqj9qx3E6x88g+SQCaAaapkiV9tW+XkiCcPAJnZCvaQqQqh46Sd/yOQC2iuizoxXYpMG+XjrdzrfqwC+FTu0FQwO8Kl+v8H/bj5pOqyiGtoyEmnWN5OA0PIiixFFHFubpTelT5mLkIGpfi7z/FoZ17ZblYVmffvGxKJJ8OoQqA3+e0ihrAnoH4nwhFoR4yJRNlJ35nlW3RUKLG04Nnr57M0+3sqm3Snk4DYQX148B5gZeBPUw209KnMd04n3l9rIjjbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6607.eurprd05.prod.outlook.com (20.178.205.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 17:51:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 17:51:16 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 07/15] mm: remove the page_shift member from struct
 hmm_range
Thread-Index: AQHVTHDhMApuLJXfWUaciRaOjOxjbqbv+IOA
Date: Wed, 7 Aug 2019 17:51:15 +0000
Message-ID: <20190807175111.GK1571@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-8-hch@lst.de>
In-Reply-To: <20190806160554.14046-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae992588-10fd-446d-e1eb-08d71b5fd822
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6607; 
x-ms-traffictypediagnostic: VI1PR05MB6607:
x-microsoft-antispam-prvs: <VI1PR05MB6607589B4FB067B309C429B1CFD40@VI1PR05MB6607.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(199004)(189003)(26005)(446003)(186003)(81156014)(54906003)(2616005)(36756003)(1076003)(33656002)(6116002)(66446008)(66476007)(66556008)(64756008)(3846002)(4326008)(66946007)(2906002)(25786009)(486006)(5660300002)(86362001)(6512007)(6486002)(68736007)(66066001)(102836004)(229853002)(305945005)(14444005)(256004)(316002)(7416002)(81166006)(476003)(53936002)(6916009)(11346002)(6436002)(6246003)(386003)(8676002)(52116002)(99286004)(14454004)(7736002)(6506007)(76176011)(8936002)(71190400001)(478600001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6607;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kfUNTOMdAfho2KNsdjUo3q203BZssmyXfelnc8PxTtXuszCmv806J1OoBxn+fnZ9d/xz1i2ho2cFcWqEK+AwbdK0EnJEZy0eMhzYSoU66nlbPDvjPo2L8Ozi7hPw527x131L1iV1r2YQ2lSNnfY81sW3DAibEz9pD9OWh6E0DjIZa3m+Lvc4zYLbLWTWPDS4MvmsJeXsSiBujBvCxMe4wHq3VVl2G0/0elnSyowCCiQYRQ5nzisObESi5aJ6VMUJ+4AhgXV7SplcCFxFvPsUnFlcA3rU9tOruJVHAbahwtoO5S44IC/Q+59/rMEvy929Okjv7+PVUroEUwcEiBXu1qG3brDbZhHkAY/UKRtNc3sefaAb9d1VH7TV/q+aTFymGNex5sMyQ2x2u76Y4yon9QkCSI0dQE3znay8y7fKK6k=
Content-ID: <86EB60C23734734B9F17174012EEEC37@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae992588-10fd-446d-e1eb-08d71b5fd822
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 17:51:15.9361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6607
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAlAMG+JLtGu7rKGT5llROIM3tAMQg7D1447E3gVtM4=;
 b=R3wXDFk6hnDteCxXS5NGpq8bVi7h8mU45v/Hcen6oX7SLOE3QihKNnxadklMLOLtZjcpfYpLyLJ+TgiwOFr5gQGZvO1khRoeBKtHaahn6H34cW+VZlLVseM8NIIy2mRkQlN4EUXXV8WJNyfNZ6cHjbkPrRzNIsMOYPqFX/hCpnk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Subject: Re: [Nouveau] [PATCH 07/15] mm: remove the page_shift member from
 struct hmm_range
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDVQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQWxsIHVzZXJzIHBhc3MgUEFHRV9TSVpFIGhlcmUsIGFuZCBpZiB3ZSB3YW50
ZWQgdG8gc3VwcG9ydCBzaW5nbGUKPiBlbnRyaWVzIGZvciBodWdlIHBhZ2VzIHdlIHNob3VsZCBy
ZWFsbHkganVzdCBhZGQgYSBITU1fRkFVTFRfSFVHRVBBR0UKPiBmbGFnIGluc3RlYWQgdGhhdCB1
c2VzIHRoZSBodWdlIHBhZ2Ugc2l6ZSBpbnN0ZWFkIG9mIGhhdmluZyB0aGUKPiBjYWxsZXIgY2Fs
Y3VsYXRlIHRoYXQgc2l6ZSBvbmNlLCBqdXN0IGZvciB0aGUgaG1tIGNvZGUgdG8gdmVyaWZ5IGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IEFj
a2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgIDEgLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jICAgfCAgMSAtCj4gIGluY2x1ZGUvbGludXgv
aG1tLmggICAgICAgICAgICAgICAgICAgICB8IDIyIC0tLS0tLS0tLS0tLS0KPiAgbW0vaG1tLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDIgKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0p
CgpIYXZpbmcgbG9va2VkIGF0IE9EUCBtb3JlIGNsb3NsZXkgdGhpcyBkb2Vzbid0IHNlZW0gdG8g
bWF0Y2ggd2hhdCBpdApuZWVkcyBhbnlob3cuIEl0IGNhbiBrZWVwIHVzaW5nIGl0cyBjaGVja2lu
ZyBhbGdvcml0aG0KIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBp
bmRleCA3MWQ2ZTcwODdiMGIuLjhiZjc5Mjg4YzRlMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKPiBAQCAtODE4LDcgKzgxOCw2IEBAIGludCBhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzKQo+ICAJCQkJMCA6IHJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXTsKPiAgCXJhbmdlLT5w
Zm5fZmxhZ3NfbWFzayA9IDA7Cj4gIAlyYW5nZS0+cGZucyA9IHBmbnM7Cj4gLQlyYW5nZS0+cGFn
ZV9zaGlmdCA9IFBBR0VfU0hJRlQ7Cj4gIAlyYW5nZS0+c3RhcnQgPSBzdGFydDsKPiAgCXJhbmdl
LT5lbmQgPSBzdGFydCArIHR0bS0+bnVtX3BhZ2VzICogUEFHRV9TSVpFOwo+ICAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiBpbmRleCA0MWZhZDQ3MTlhYzYuLjY2OGQ0YmQw
YzExOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC02ODAs
NyArNjgwLDYgQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkp
Cj4gIAkJCSBhcmdzLmkucC5hZGRyICsgYXJncy5pLnAuc2l6ZSwgZm4gLSBmaSk7Cj4gIAo+ICAJ
CS8qIEhhdmUgSE1NIGZhdWx0IHBhZ2VzIHdpdGhpbiB0aGUgZmF1bHQgd2luZG93IHRvIHRoZSBH
UFUuICovCj4gLQkJcmFuZ2UucGFnZV9zaGlmdCA9IFBBR0VfU0hJRlQ7Cj4gIAkJcmFuZ2Uuc3Rh
cnQgPSBhcmdzLmkucC5hZGRyOwo+ICAJCXJhbmdlLmVuZCA9IGFyZ3MuaS5wLmFkZHIgKyBhcmdz
LmkucC5zaXplOwo+ICAJCXJhbmdlLnBmbnMgPSBhcmdzLnBoeXM7Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gaW5kZXggYzViNTEzNzZi
NDUzLi41MWUxOGZiYjg5NTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvaG1tLmgKPiBAQCAtMTU4LDcgKzE1OCw2IEBAIGVudW0gaG1tX3Bm
bl92YWx1ZV9lIHsKPiAgICogQHZhbHVlczogcGZuIHZhbHVlIGZvciBzb21lIHNwZWNpYWwgY2Fz
ZSAobm9uZSwgc3BlY2lhbCwgZXJyb3IsIC4uLikKPiAgICogQGRlZmF1bHRfZmxhZ3M6IGRlZmF1
bHQgZmxhZ3MgZm9yIHRoZSByYW5nZSAod3JpdGUsIHJlYWQsIC4uLiBzZWUgaG1tIGRvYykKPiAg
ICogQHBmbl9mbGFnc19tYXNrOiBhbGxvd3MgdG8gbWFzayBwZm4gZmxhZ3Mgc28gdGhhdCBvbmx5
IGRlZmF1bHRfZmxhZ3MgbWF0dGVyCj4gLSAqIEBwYWdlX3NoaWZ0OiBkZXZpY2UgdmlydHVhbCBh
ZGRyZXNzIHNoaWZ0IHZhbHVlIChzaG91bGQgYmUgPj0gUEFHRV9TSElGVCkKPiAgICogQHBmbl9z
aGlmdHM6IHBmbiBzaGlmdCB2YWx1ZSAoc2hvdWxkIGJlIDw9IFBBR0VfU0hJRlQpCj4gICAqIEB2
YWxpZDogcGZucyBhcnJheSBkaWQgbm90IGNoYW5nZSBzaW5jZSBpdCBoYXMgYmVlbiBmaWxsIGJ5
IGFuIEhNTSBmdW5jdGlvbgo+ICAgKi8KPiBAQCAtMTcyLDMxICsxNzEsMTAgQEAgc3RydWN0IGht
bV9yYW5nZSB7Cj4gIAljb25zdCB1aW50NjRfdAkJKnZhbHVlczsKPiAgCXVpbnQ2NF90CQlkZWZh
dWx0X2ZsYWdzOwo+ICAJdWludDY0X3QJCXBmbl9mbGFnc19tYXNrOwo+IC0JdWludDhfdAkJCXBh
Z2Vfc2hpZnQ7Cj4gIAl1aW50OF90CQkJcGZuX3NoaWZ0Owo+ICAJYm9vbAkJCXZhbGlkOwo+ICB9
Owo+ICAKPiAtLyoKPiAtICogaG1tX3JhbmdlX3BhZ2Vfc2hpZnQoKSAtIHJldHVybiB0aGUgcGFn
ZSBzaGlmdCBmb3IgdGhlIHJhbmdlCj4gLSAqIEByYW5nZTogcmFuZ2UgYmVpbmcgcXVlcmllZAo+
IC0gKiBSZXR1cm46IHBhZ2Ugc2hpZnQgKHBhZ2Ugc2l6ZSA9IDEgPDwgcGFnZSBzaGlmdCkgZm9y
IHRoZSByYW5nZQo+IC0gKi8KPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBobW1fcmFuZ2VfcGFn
ZV9zaGlmdChjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAtewo+IC0JcmV0dXJuIHJh
bmdlLT5wYWdlX3NoaWZ0Owo+IC19Cj4gLQo+IC0vKgo+IC0gKiBobW1fcmFuZ2VfcGFnZV9zaXpl
KCkgLSByZXR1cm4gdGhlIHBhZ2Ugc2l6ZSBmb3IgdGhlIHJhbmdlCj4gLSAqIEByYW5nZTogcmFu
Z2UgYmVpbmcgcXVlcmllZAo+IC0gKiBSZXR1cm46IHBhZ2Ugc2l6ZSBmb3IgdGhlIHJhbmdlIGlu
IGJ5dGVzCj4gLSAqLwo+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgaG1tX3JhbmdlX3Bh
Z2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAtewo+IC0JcmV0dXJuIDFV
TCA8PCBobW1fcmFuZ2VfcGFnZV9zaGlmdChyYW5nZSk7Cj4gLX0KPiAtCj4gIC8qCj4gICAqIGht
bV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKCkgLSB3YWl0IGZvciByYW5nZSB0byBiZSB2YWxpZAo+
ICAgKiBAcmFuZ2U6IHJhbmdlIGFmZmVjdGVkIGJ5IGludmFsaWRhdGlvbiB0byB3YWl0IG9uCj4g
ZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCA5MjY3MzVhM2FlZjkuLmYy
NmQ2YWJjNGVkMiAxMDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAg
LTM0NCwxMyArMzQ0LDEyIEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX2hvbGVfKHVuc2lnbmVk
IGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4gIAlzdHJ1Y3QgaG1tX3ZtYV93YWxrICpo
bW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRlOwo+ICAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Ug
PSBobW1fdm1hX3dhbGstPnJhbmdlOwo+ICAJdWludDY0X3QgKnBmbnMgPSByYW5nZS0+cGZuczsK
PiAtCXVuc2lnbmVkIGxvbmcgaSwgcGFnZV9zaXplOwo+ICsJdW5zaWduZWQgbG9uZyBpOwo+ICAK
PiAgCWhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7Cj4gLQlwYWdlX3NpemUgPSBobW1fcmFuZ2Vf
cGFnZV9zaXplKHJhbmdlKTsKPiAtCWkgPSAoYWRkciAtIHJhbmdlLT5zdGFydCkgPj4gcmFuZ2Ut
PnBhZ2Vfc2hpZnQ7Cj4gKwlpID0gKGFkZHIgLSByYW5nZS0+c3RhcnQpID4+IFBBR0VfU0hJRlQ7
Cj4gIAo+IC0JZm9yICg7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gcGFnZV9zaXplLCBpKyspIHsKPiAr
CWZvciAoOyBhZGRyIDwgZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgaSsrKSB7Cj4gIAkJcGZuc1tp
XSA9IHJhbmdlLT52YWx1ZXNbSE1NX1BGTl9OT05FXTsKPiAgCQlpZiAoZmF1bHQgfHwgd3JpdGVf
ZmF1bHQpIHsKPiAgCQkJaW50IHJldDsKPiBAQCAtNzcyLDcgKzc3MSw3IEBAIHN0YXRpYyBpbnQg
aG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkocHRlX3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBobWFz
aywKPiAgCQkJCSAgICAgIHN0cnVjdCBtbV93YWxrICp3YWxrKQo+ICB7Cj4gICNpZmRlZiBDT05G
SUdfSFVHRVRMQl9QQUdFCj4gLQl1bnNpZ25lZCBsb25nIGFkZHIgPSBzdGFydCwgaSwgcGZuLCBt
YXNrLCBzaXplLCBwZm5faW5jOwo+ICsJdW5zaWduZWQgbG9uZyBhZGRyID0gc3RhcnQsIGksIHBm
biwgbWFzazsKPiAgCXN0cnVjdCBobW1fdm1hX3dhbGsgKmhtbV92bWFfd2FsayA9IHdhbGstPnBy
aXZhdGU7Cj4gIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+cmFuZ2U7
Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHdhbGstPnZtYTsKPiBAQCAtNzgzLDI0
ICs3ODIsMTIgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaHVnZXRsYl9lbnRyeShwdGVfdCAq
cHRlLCB1bnNpZ25lZCBsb25nIGhtYXNrLAo+ICAJcHRlX3QgZW50cnk7Cj4gIAlpbnQgcmV0ID0g
MDsKPiAgCj4gLQlzaXplID0gaHVnZV9wYWdlX3NpemUoaCk7Cj4gLQltYXNrID0gc2l6ZSAtIDE7
Cj4gLQlpZiAocmFuZ2UtPnBhZ2Vfc2hpZnQgIT0gUEFHRV9TSElGVCkgewo+IC0JCS8qIE1ha2Ug
c3VyZSB3ZSBhcmUgbG9va2luZyBhdCBhIGZ1bGwgcGFnZS4gKi8KPiAtCQlpZiAoc3RhcnQgJiBt
YXNrKQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQlpZiAoZW5kIDwgKHN0YXJ0ICsgc2l6ZSkp
Cj4gLQkJCXJldHVybiAtRUlOVkFMOwo+IC0JCXBmbl9pbmMgPSBzaXplID4+IFBBR0VfU0hJRlQ7
Cj4gLQl9IGVsc2Ugewo+IC0JCXBmbl9pbmMgPSAxOwo+IC0JCXNpemUgPSBQQUdFX1NJWkU7Cj4g
LQl9Cj4gKwltYXNrID0gaHVnZV9wYWdlX3NpemUoaCkgLSAxOwo+ICAKPiAgCXB0bCA9IGh1Z2Vf
cHRlX2xvY2soaHN0YXRlX3ZtYSh2bWEpLCB3YWxrLT5tbSwgcHRlKTsKPiAgCWVudHJ5ID0gaHVn
ZV9wdGVwX2dldChwdGUpOwo+ICAKPiAtCWkgPSAoc3RhcnQgLSByYW5nZS0+c3RhcnQpID4+IHJh
bmdlLT5wYWdlX3NoaWZ0Owo+ICsJaSA9IChzdGFydCAtIHJhbmdlLT5zdGFydCkgPj4gUEFHRV9T
SElGVDsKPiAgCW9yaWdfcGZuID0gcmFuZ2UtPnBmbnNbaV07Cj4gIAlyYW5nZS0+cGZuc1tpXSA9
IHJhbmdlLT52YWx1ZXNbSE1NX1BGTl9OT05FXTsKPiAgCWNwdV9mbGFncyA9IHB0ZV90b19obW1f
cGZuX2ZsYWdzKHJhbmdlLCBlbnRyeSk7Cj4gQEAgLTgxMiw4ICs3OTksOCBAQCBzdGF0aWMgaW50
IGhtbV92bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgaG1h
c2ssCj4gIAkJZ290byB1bmxvY2s7Cj4gIAl9Cj4gIAo+IC0JcGZuID0gcHRlX3BmbihlbnRyeSkg
KyAoKHN0YXJ0ICYgbWFzaykgPj4gcmFuZ2UtPnBhZ2Vfc2hpZnQpOwo+IC0JZm9yICg7IGFkZHIg
PCBlbmQ7IGFkZHIgKz0gc2l6ZSwgaSsrLCBwZm4gKz0gcGZuX2luYykKPiArCXBmbiA9IHB0ZV9w
Zm4oZW50cnkpICsgKChzdGFydCAmIG1hc2spID4+IFBBR0VfU0hJRlQpOwo+ICsJZm9yICg7IGFk
ZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBpKyssIHBmbisrKQo+ICAJCXJhbmdlLT5wZm5z
W2ldID0gaG1tX2RldmljZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8Cj4gIAkJCQkgY3B1
X2ZsYWdzOwo+ICAJaG1tX3ZtYV93YWxrLT5sYXN0ID0gZW5kOwo+IEBAIC04NTAsMTQgKzgzNywx
MyBAQCBzdGF0aWMgdm9pZCBobW1fcGZuc19jbGVhcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
PiAgICovCj4gIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
IHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCj4gIHsKPiAtCXVuc2lnbmVkIGxvbmcgbWFzayA9
ICgoMVVMIDw8IHJhbmdlLT5wYWdlX3NoaWZ0KSAtIDFVTCk7Cj4gIAlzdHJ1Y3QgaG1tICpobW0g
PSBtaXJyb3ItPmhtbTsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAo+ICAJcmFuZ2UtPnZh
bGlkID0gZmFsc2U7Cj4gIAlyYW5nZS0+aG1tID0gTlVMTDsKPiAgCj4gLQlpZiAoKHJhbmdlLT5z
dGFydCAmIG1hc2spIHx8IChyYW5nZS0+ZW5kICYgbWFzaykpCj4gKwlpZiAoKHJhbmdlLT5zdGFy
dCAmIChQQUdFX1NJWkUgLSAxKSkgfHwgKHJhbmdlLT5lbmQgJiAoUEFHRV9TSVpFIC0gMSkpKQo+
ICAJCXJldHVybiAtRUlOVkFMOwoKUEFHRV9TSVpFLTEgPT0gUEFHRV9NQVNLID8gSWYgeWVzIEkg
Y2FuIGZpeCBpdAoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNv
bT4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
