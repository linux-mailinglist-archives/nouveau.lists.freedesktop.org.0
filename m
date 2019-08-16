Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8C90D36
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 07:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C156E466;
	Sat, 17 Aug 2019 05:45:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A406E9A4;
 Fri, 16 Aug 2019 21:46:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 14:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,394,1559545200"; d="scan'208";a="352657465"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2019 14:46:04 -0700
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 16 Aug 2019 14:46:04 -0700
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.69]) by
 FMSMSX161.amr.corp.intel.com ([169.254.12.224]) with mapi id 14.03.0439.000;
 Fri, 16 Aug 2019 14:46:04 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: =?utf-8?B?W0ludGVsLWdmeF0g4pyXIEZpLkNJLlNQQVJTRTogd2FybmluZyBmb3IgZHJt?=
 =?utf-8?B?L2Nvbm5lY3RvcjogQWxsb3cgbWF4IHBvc3NpYmxlIGVuY29kZXJzIHRvIGF0?=
 =?utf-8?Q?tach_to_a_connector_(rev2)?=
Thread-Index: AQHVVHmw/Mshb6jJlEaDZpXzI1fX5qb+xGKA
Date: Fri, 16 Aug 2019 21:46:03 +0000
Message-ID: <29e7ed6454978be6b47e9b8e7684331f9680af30.camel@intel.com>
References: <20190816195424.7185-1-jose.souza@intel.com>
 <20190816212926.13759.37782@emeril.freedesktop.org>
In-Reply-To: <20190816212926.13759.37782@emeril.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.9.135]
Content-ID: <E007B18ABDC3AF4DB29A0E6871371BE1@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Aug 2019 05:45:39 +0000
Subject: Re: [Nouveau] 
 =?utf-8?b?W0ludGVsLWdmeF0g4pyXIEZpLkNJLlNQQVJTRTogd2Fy?=
 =?utf-8?q?ning_for_drm/connector=3A_Allow_max_possible_encoders_to_attach?=
 =?utf-8?q?_to_a_connector_=28rev2=29?=
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Pandiyan, 
 Dhinakaran" <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTE2IGF0IDIxOjI5ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09
IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGRybS9jb25uZWN0b3I6IEFsbG93IG1h
eCBwb3NzaWJsZSBlbmNvZGVycyB0byBhdHRhY2ggdG8gYQ0KPiBjb25uZWN0b3IgKHJldjIpDQo+
IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82Mjc0My8N
Cj4gU3RhdGUgOiB3YXJuaW5nDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiAkIGRpbSBzcGFy
c2Ugb3JpZ2luL2RybS10aXANCj4gU3BhcnNlIHZlcnNpb246IHYwLjYuMA0KPiBDb21taXQ6IGRy
bS9jb25uZWN0b3I6IEFsbG93IG1heCBwb3NzaWJsZSBlbmNvZGVycyB0byBhdHRhY2ggdG8gYQ0K
PiBjb25uZWN0b3INCj4gKyBeDQo+ICsgfQ0KPiArZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6NDgwMjoxOg0KPiB3YXJuaW5nOiBjb250
cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12b2lkIGZ1bmN0aW9uIFstV3JldHVybi10eXBlXQ0KPiAr
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmM6IEluDQo+IGZ1bmN0aW9uIOKAmGFtZGdwdV9kbV9jb25uZWN0b3JfdG9fZW5jb2RlcuKAmToN
Cg0KTWlzc2VkIGEgInJldHVybiBOVUxMOyIgdGhhdCB3aWxsIG5vdCBiZSByZWFjaGVkLg0KV2ls
bCBmaXggdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIGFmdGVyIGdldCBzb21lIGNvbW1lbnRzLg0K
DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBJbnRlbC1nZnggbWFpbGluZyBsaXN0DQo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
