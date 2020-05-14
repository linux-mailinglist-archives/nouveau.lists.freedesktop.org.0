Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBB1D3475
	for <lists+nouveau@lfdr.de>; Thu, 14 May 2020 17:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2156E35F;
	Thu, 14 May 2020 15:07:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2089.outbound.protection.outlook.com [40.92.18.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263816E35F
 for <nouveau@lists.freedesktop.org>; Thu, 14 May 2020 15:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feBD37hJbIE6B1NieE+U+u8WNaIkpQLeKZ0zR7hg6ctzcew0BIarwwAHj5rB2Qyj03wYA7blLBpi2Fyux5HLMbTMLeZjWInnKTF8CquP+HvJvyaW8Wt9+RzDyk02O6Rppm93rhXgPhsxIAwKwDolkrWsXcqV1uFr/VdEY4AR1PWCVIK6cNbwJd4pqfrySK/Fm18FgUSi1pWglhGjRxzh2glYGKMSsUOeOGqx5GOgtVo1WvJG95OWg2Cyia77zyB3MtN8exvoF8RjYJgkEYnsbX2SfuI2Pj55VdBuDzZIlzwS7vK46l1H6qUAuexewnB8a+j8nN28m6v218do1MfiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ2p8s4XAwvRh09jO0ZU1WzUeXuLm0W4FyZEHBJuTbM=;
 b=Ki/vEXUCqDF75Lfj2mwnUuwB4/TbkYroHOE0G9COMn/lCOYN5oAsJIZqQgt4CVJme+VAaUkp8QQ6bJ1WU+MeeJSkD3ymZYBW9+3u+jT+xOOkdcJSTyH0By54HAevF2+ai7ckU1U4EcZiqay8B1YzZ7D57T8FZsxpWFD3E1Y6b+iZC1ECUt9+PmzAjmAM21yKg1murtLKjGxkqdICv6+fngeaBPK7GFR0GESmtiKhY6j1fwu5IiI+fc+ofg6vo7NoQv7ld0QtFYP4/OAsHcvwSFPXyW5IcXEOLZhQ+ompTJ27UBVwxl7hToZOoes2nQQzIHujzNYI4PRawPXFlI8g3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ2p8s4XAwvRh09jO0ZU1WzUeXuLm0W4FyZEHBJuTbM=;
 b=u927cZ+oAnAj8tKGu3FapDMsEej9t2HL9r51/TXLjJijScvV6RjBTVZKaj15PPMYC1WXxzOG09JGGNIfPNRLCHY8abWWrVUiPsf5st9qB5oTAKD9qbsoijkTOMGkdBOvyNup4xy4jXhoF3yZ/eFMkDNECTVRPhcziNHbvjTOKQCnP0eKGBNJq0irQW/WjcH8RrsqMbtTYDKArXZhQCQHs/e0QAra/r0NBOgae+6/6xN5wAzFiFcjmy1QarnlctPt+S4cyEY93V7hDlhEibLE1k07muQA2uYaOwP0wKPz07HUxzFS5P811/gAudwUNq+uAEMFBCWDcir+YYuYk3+75g==
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::4b) by
 BN8NAM11HT233.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::382)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Thu, 14 May
 2020 15:07:28 +0000
Received: from MW2PR02MB3788.namprd02.prod.outlook.com
 (2a01:111:e400:fc4b::42) by BN8NAM11FT067.mail.protection.outlook.com
 (2a01:111:e400:fc4b::415) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Thu, 14 May 2020 15:07:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F98C564B0B8FD8DC87D339E1984133F80659C6C638810A1944CF6723FAE5923B;
 UpperCasedChecksum:296AD96AA1CA56A9A046CDAF64235CE14A9263F0878616EE0CE8013017F52010;
 SizeAsReceived:8834; Count:49
Received: from MW2PR02MB3788.namprd02.prod.outlook.com
 ([fe80::7812:a29d:6f65:b5f2]) by MW2PR02MB3788.namprd02.prod.outlook.com
 ([fe80::7812:a29d:6f65:b5f2%6]) with mapi id 15.20.3000.016; Thu, 14 May 2020
 15:07:28 +0000
To: nouveau@lists.freedesktop.org
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-3-lyude@redhat.com>
From: William Lewis <minutemaidpark@hotmail.com>
Message-ID: <MW2PR02MB37884675611A8D5325E5E30CC8BC0@MW2PR02MB3788.namprd02.prod.outlook.com>
Date: Thu, 14 May 2020 10:07:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200508204751.155488-3-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: DM5PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:3:16::32) To MW2PR02MB3788.namprd02.prod.outlook.com
 (2603:10b6:907:a::22)
X-Microsoft-Original-Message-ID: <28d7f6d3-74d5-087a-8abd-789b1bdbdd96@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.58] (73.115.93.144) by
 DM5PR07CA0046.namprd07.prod.outlook.com (2603:10b6:3:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.30 via Frontend Transport; Thu, 14 May 2020 15:07:27 +0000
X-Microsoft-Original-Message-ID: <28d7f6d3-74d5-087a-8abd-789b1bdbdd96@hotmail.com>
X-TMN: [AD+26Dgait9HJ5nzUOQCzKBZ3mDg4h4g]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1e94ccf2-00e0-481b-c474-08d7f818846e
X-MS-TrafficTypeDiagnostic: BN8NAM11HT233:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrb259LZEZBScY1noXeDaAbzpC0C/Tkrc+3e1pWrTCYA76Aa/lnwjJYute5uz65fwLsG+CEMdPU/trgRBk0qoxXqA2z7dAjlZ8xsbScrILdLLwEArwzg6FyTNRnzJgGRCTLZ2cIJN2JTufjWWOtvwNUmBeNwDtrWvovm71zxJ0Vt9EXASLFz3I0ap5R9Cx0J1yFSQVzwAbl+N9nrIJI57w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3788.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: 5XuCwhSDMKJwKZP8w8PoAZtAub4GCziJ/C22Su64++s8Y49kaHZcbO6fJp/F7vRtFEckfKXRtAQcbtmY/9RUVImhwbv1IKaa0rfZYRVvA1Yu1uNxT6qM7zv+jauuASLfjXPJdZj8Gp3E4NObIQ53aA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e94ccf2-00e0-481b-c474-08d7f818846e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 15:07:28.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT233
Subject: Re: [Nouveau] [RFC v4 02/12] kthread: Add
 kthread_(un)block_work_queuing() and kthread_work_queuable()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TWlub3Igbml0cGljay7CoCBzL3F1ZXVpbmcvcXVldWVpbmcvIGFuZCBzL3F1ZXVhYmxlL3F1ZXVl
YWJsZS8uCgpPbiAyMDIwLTA1LTA4IDE1OjQ2LCBMeXVkZSBQYXVsIHdyb3RlOgo+IEFkZCBzb21l
IHNpbXBsZSB3cmFwcGVycyBhcm91bmQgaW5jcmVtZW50aW5nL2RlY3JlbWVudGluZwo+IGt0aHJl
YWRfd29yay5jYW5jZWxsaW5nIHVuZGVyIGxvY2ssIGFsb25nIHdpdGggY2hlY2tpbmcgd2hldGhl
ciBxdWV1aW5nCj4gaXMgY3VycmVudGx5IGFsbG93ZWQgb24gYSBnaXZlbiBrdGhyZWFkX3dvcmss
IHdoaWNoIHdlJ2xsIHVzZSB3YW50IHRvCj4gaW1wbGVtZW50IHdvcmsgY2FuY2VsbGluZyB3aXRo
IERSTSdzIHZibGFuayB3b3JrIGhlbHBlcnMuCj4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+Cj4gQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IC0tLQo+ICAg
aW5jbHVkZS9saW51eC9rdGhyZWFkLmggfCAxOSArKysrKysrKysrKysrKysrKwo+ICAga2VybmVs
L2t0aHJlYWQuYyAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9rdGhyZWFkLmggYi9pbmNsdWRlL2xpbnV4L2t0aHJlYWQuaAo+
IGluZGV4IDAwMDY1NDBjZTdmOS4uYzZmZWUyMDBmY2VkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgva3RocmVhZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9rdGhyZWFkLmgKPiBAQCAtMjEx
LDkgKzIxMSwyOCBAQCB2b2lkIGt0aHJlYWRfZmx1c2hfd29ya2VyKHN0cnVjdCBrdGhyZWFkX3dv
cmtlciAqd29ya2VyKTsKPiAgIAo+ICAgYm9vbCBrdGhyZWFkX2NhbmNlbF93b3JrX3N5bmMoc3Ry
dWN0IGt0aHJlYWRfd29yayAqd29yayk7Cj4gICBib29sIGt0aHJlYWRfY2FuY2VsX2RlbGF5ZWRf
d29ya19zeW5jKHN0cnVjdCBrdGhyZWFkX2RlbGF5ZWRfd29yayAqd29yayk7Cj4gK3ZvaWQga3Ro
cmVhZF9ibG9ja193b3JrX3F1ZXVpbmcoc3RydWN0IGt0aHJlYWRfd29ya2VyICp3b3JrZXIsCj4g
KwkJCQlzdHJ1Y3Qga3RocmVhZF93b3JrICp3b3JrKTsKPiArdm9pZCBrdGhyZWFkX3VuYmxvY2tf
d29ya19xdWV1aW5nKHN0cnVjdCBrdGhyZWFkX3dvcmtlciAqd29ya2VyLAo+ICsJCQkJICBzdHJ1
Y3Qga3RocmVhZF93b3JrICp3b3JrKTsKPiAgIAo+ICAgdm9pZCBrdGhyZWFkX2Rlc3Ryb3lfd29y
a2VyKHN0cnVjdCBrdGhyZWFkX3dvcmtlciAqd29ya2VyKTsKPiAgIAo+ICsvKioKPiArICoga3Ro
cmVhZF93b3JrX3F1ZXVhYmxlIC0gd2hldGhlciBvciBub3QgYSBrdGhyZWFkIHdvcmsgY2FuIGJl
IHF1ZXVlZAo+ICsgKiBAd29yazogVGhlIGt0aHJlYWQgd29yayB0byBjaGVjawo+ICsgKgo+ICsg
KiBDaGVja3Mgd2hldGhlciBvciBub3QgcXVldWluZyBAd29yayBpcyBjdXJyZW50bHkgYmxvY2tl
ZCBmcm9tIHF1ZXVpbmcsCj4gKyAqIGVpdGhlciBieSBrdGhyZWFkX2NhbmNlbF93b3JrX3N5bmMo
KSBhbmQgZnJpZW5kcyBvcgo+ICsgKiBrdGhyZWFkX2Jsb2NrX3dvcmtfcXVldWluZygpLgo+ICsg
Kgo+ICsgKiBSZXR1cm5zOiB3aGV0aGVyIG9yIG5vdCB0aGUgQHdvcmsgbWF5IGJlIHF1ZXVlZC4K
PiArICovCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBrdGhyZWFkX3dvcmtfcXVldWFibGUoc3RydWN0
IGt0aHJlYWRfd29yayAqd29yaykKPiArewo+ICsJcmV0dXJuIFJFQURfT05DRSh3b3JrLT5jYW5j
ZWxpbmcpID09IDA7Cj4gK30KPiArCj4gICBzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZTsKPiAg
IAo+ICAgI2lmZGVmIENPTkZJR19CTEtfQ0dST1VQCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9rdGhy
ZWFkLmMgYi9rZXJuZWwva3RocmVhZC5jCj4gaW5kZXggYzFmOGVjOWQ1ODM2Li5mOGE1YzVhODdj
YzYgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2t0aHJlYWQuYwo+ICsrKyBiL2tlcm5lbC9rdGhyZWFk
LmMKPiBAQCAtMTE4Nyw2ICsxMTg3LDUyIEBAIGJvb2wga3RocmVhZF9jYW5jZWxfZGVsYXllZF93
b3JrX3N5bmMoc3RydWN0IGt0aHJlYWRfZGVsYXllZF93b3JrICpkd29yaykKPiAgIH0KPiAgIEVY
UE9SVF9TWU1CT0xfR1BMKGt0aHJlYWRfY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKTsKPiAgIAo+
ICsvKioKPiArICoga3RocmVhZF9ibG9ja193b3JrX3F1ZXVpbmcgLSBwcmV2ZW50IGEga3RocmVh
ZF93b3JrIGZyb20gYmVpbmcgcXVldWVkCj4gKyAqIHdpdGhvdXQgYWN0dWFsbHkgY2FuY2VsbGlu
ZyBpdAo+ICsgKiBAd29ya2VyOiBrdGhyZWFkIHdvcmtlciB0byB1c2UKPiArICogQHdvcms6IHdv
cmsgdG8gYmxvY2sgcXVldWluZyBvbgo+ICsgKgo+ICsgKiBQcmV2ZW50cyBAd29yayBmcm9tIGJl
aW5nIHF1ZXVlZCB1c2luZyBrdGhyZWFkX3F1ZXVlX3dvcmsoKSBhbmQgZnJpZW5kcywKPiArICog
YnV0IGRvZXNuJ3QgYXR0ZW1wdCB0byBjYW5jZWwgYW55IHByZXZpb3VzIHF1ZXVpbmcuIFRoZSBj
YWxsZXIgbXVzdCB1bmJsb2NrCj4gKyAqIHF1ZXVpbmcgbGF0ZXIgYnkgY2FsbGluZyBrdGhyZWFk
X3VuYmxvY2tfd29ya19xdWV1aW5nKCkuIFRoaXMgY2FsbCBjYW4gYmUKPiArICogY2FsbGVkIG11
bHRpcGxlIHRpbWVzLgo+ICsgKgo+ICsgKiBTZWUgYWxzbzoga3RocmVhZF93b3JrX3F1ZXVhYmxl
KCkKPiArICovCj4gK3ZvaWQga3RocmVhZF9ibG9ja193b3JrX3F1ZXVpbmcoc3RydWN0IGt0aHJl
YWRfd29ya2VyICp3b3JrZXIsCj4gKwkJCQlzdHJ1Y3Qga3RocmVhZF93b3JrICp3b3JrKQo+ICt7
Cj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsKPiArCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgm
d29ya2VyLT5sb2NrLCBmbGFncyk7Cj4gKwl3b3JrLT5jYW5jZWxpbmcrKzsKPiArCXJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZ3b3JrZXItPmxvY2ssIGZsYWdzKTsKPiArfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChrdGhyZWFkX2Jsb2NrX3dvcmtfcXVldWluZyk7Cj4gKwo+ICsvKioKPiArICog
a3RocmVhZF91bmJsb2NrX3dvcmtfcXVldWluZyAtIHVuYmxvY2sgcXVldWluZyBvbiBhIGt0aHJl
YWRfd29yawo+ICsgKiBAd29ya2VyOiBrdGhyZWFkIHdvcmtlciB0byB1c2UKPiArICogQHdvcms6
IHdvcmsgdG8gdW5ibG9jayBxdWV1aW5nIG9uCj4gKyAqCj4gKyAqIFJlbW92ZXMgYSByZXF1ZXN0
IHRvIHByZXZlbnQgQHdvcmsgZnJvbSBiZWluZyBxdWV1ZWQgd2l0aAo+ICsgKiBrdGhyZWFkX3F1
ZXVlX3dvcmsoKSBhbmQgZnJpZW5kcywgc28gdGhhdCBpdCBtYXkgcG90ZW50aWFsbHkgYmUgcXVl
dWVkCj4gKyAqIGFnYWluLgo+ICsgKgo+ICsgKiBTZWUgYWxzbzoga3RocmVhZF93b3JrX3F1ZXVh
YmxlKCkKPiArICovCj4gK3ZvaWQga3RocmVhZF91bmJsb2NrX3dvcmtfcXVldWluZyhzdHJ1Y3Qg
a3RocmVhZF93b3JrZXIgKndvcmtlciwKPiArCQkJCSAgc3RydWN0IGt0aHJlYWRfd29yayAqd29y
aykKPiArewo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKwlyYXdfc3Bpbl9sb2NrX2ly
cXNhdmUoJndvcmtlci0+bG9jaywgZmxhZ3MpOwo+ICsJV0FSTl9PTl9PTkNFKC0td29yay0+Y2Fu
Y2VsaW5nIDwgMCk7Cj4gKwlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmd29ya2VyLT5sb2Nr
LCBmbGFncyk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoa3RocmVhZF91bmJsb2NrX3dvcmtf
cXVldWluZyk7Cj4gKwo+ICAgLyoqCj4gICAgKiBrdGhyZWFkX2ZsdXNoX3dvcmtlciAtIGZsdXNo
IGFsbCBjdXJyZW50IHdvcmtzIG9uIGEga3RocmVhZF93b3JrZXIKPiAgICAqIEB3b3JrZXI6IHdv
cmtlciB0byBmbHVzaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
