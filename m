Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1838E488
	for <lists+nouveau@lfdr.de>; Mon, 24 May 2021 12:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AE6E19A;
	Mon, 24 May 2021 10:48:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5929B6E190;
 Mon, 24 May 2021 10:48:05 +0000 (UTC)
IronPort-SDR: kB8vCDuLWipRcZwnT/2jZXG9OR/WUOkTJEgSAnUAyoUxNCeoAOwqs4bM7FJg3soFRI0ad4whtS
 k/rjRrFG6EIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="181544376"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="181544376"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 03:48:04 -0700
IronPort-SDR: QuEnAfZ5/WIeo3m+UEXFblrExKUADwlP9aJSrqDHvReibVvmxIJCm/OBqO5uyGflOOKgDPu+dc
 Y6pL8dPMhDpg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="413543179"
Received: from gtenuto-mobl1.ger.corp.intel.com (HELO [10.213.210.116])
 ([10.213.210.116])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 03:48:02 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
 <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
 <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>
 <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
 <b1d508ee-6809-f5dc-6539-70cb89ef5e3b@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <74dd3086-13c5-2fb0-bb66-eec1a061e693@linux.intel.com>
Date: Mon, 24 May 2021 11:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b1d508ee-6809-f5dc-6539-70cb89ef5e3b@linux.intel.com>
Content-Language: en-US
Subject: Re: [Nouveau] [Intel-gfx] [PATCH 0/7] Per client engine busyness
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Nieto, David M" <David.Nieto@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDIwLzA1LzIwMjEgMDk6MzUsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IE9uIDE5LzA1LzIw
MjEgMTk6MjMsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFdlZCwgTWF5IDE5LCAyMDIxIGF0
IDY6MTYgUE0gVHZydGtvIFVyc3VsaW4KPj4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDE4LzA1LzIwMjEgMTA6NDAsIFR2cnRrbyBVcnN1bGlu
IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMTgvMDUvMjAyMSAxMDoxNiwgRGFuaWVsIFN0b25lIHdyb3Rl
Ogo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gVHVlLCAxOCBNYXkgMjAyMSBhdCAxMDowOSwgVHZy
dGtvIFVyc3VsaW4KPj4+Pj4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj4+Pj4+PiBJIHdhcyBqdXN0IHdvbmRlcmluZyBpZiBzdGF0KDIpIGFuZCBhIGNocmRldiBtYWpv
ciBjaGVjayB3b3VsZCBiZSBhCj4+Pj4+PiBzb2xpZCBjcml0ZXJpYSB0byBtb3JlIGVmZmljaWVu
dGx5IChjb21wYXJlZCB0byBwYXJzaW5nIHRoZSB0ZXh0Cj4+Pj4+PiBjb250ZW50KSBkZXRlY3Qg
ZHJtIGZpbGVzIHdoaWxlIHdhbGtpbmcgcHJvY2ZzLgo+Pj4+Pgo+Pj4+PiBNYXliZSBJJ20gbWlz
c2luZyBzb21ldGhpbmcsIGJ1dCBpcyB0aGUgcGVyLVBJRCB3YWxrIGFjdHVhbGx5IGEKPj4+Pj4g
bWVhc3VyYWJsZSBwZXJmb3JtYW5jZSBpc3N1ZSByYXRoZXIgdGhhbiBqdXN0IGEgYml0IHVucGxl
YXNhbnQ/Cj4+Pj4KPj4+PiBQZXIgcGlkIGFuZCBwZXIgZWFjaCBvcGVuIGZkLgo+Pj4+Cj4+Pj4g
QXMgc2FpZCBpbiB0aGUgb3RoZXIgdGhyZWFkIHdoYXQgYm90aGVycyBtZSBhIGJpdCBpbiB0aGlz
IHNjaGVtZSBpcyAKPj4+PiB0aGF0Cj4+Pj4gdGhlIGNvc3Qgb2Ygb2J0YWluaW5nIEdQVSB1c2Fn
ZSBzY2FsZXMgYmFzZWQgb24gbm9uLUdQVSBjcml0ZXJpYS4KPj4+Pgo+Pj4+IEZvciB1c2UgY2Fz
ZSBvZiBhIHRvcC1saWtlIHRvb2wgd2hpY2ggc2hvd3MgYWxsIHByb2Nlc3NlcyB0aGlzIGlzIGEK
Pj4+PiBzbWFsbGVyIGFkZGl0aW9uYWwgY29zdCwgYnV0IHRoZW4gZm9yIGEgZ3B1LXRvcCBsaWtl
IHRvb2wgaXQgaXMgCj4+Pj4gc29tZXdoYXQKPj4+PiBoaWdoZXIuCj4+Pgo+Pj4gVG8gZnVydGhl
ciBleHBhbmQsIG5vdCBvbmx5IGNvc3Qgd291bGQgc2NhbGUgcGVyIHBpZCBtdWx0aXBsaWVzIHBl
ciBvcGVuCj4+PiBmZCwgYnV0IHRvIGRldGVjdCB3aGljaCBvZiB0aGUgZmRzIGFyZSBEUk0gSSBz
ZWUgdGhlc2UgdGhyZWUgb3B0aW9uczoKPj4+Cj4+PiAxKSBPcGVuIGFuZCBwYXJzZSBmZGluZm8u
Cj4+PiAyKSBOYW1lIGJhc2VkIG1hdGNoaW5nIGllIC9kZXYvZHJpLy4uIHNvbWV0aGluZy4KPj4+
IDMpIFN0YXQgdGhlIHN5bWxpbmsgdGFyZ2V0IGFuZCBjaGVjayBmb3IgRFJNIG1ham9yLgo+Pgo+
PiBzdGF0IHdpdGggc3ltbGluayBmb2xsb3dpbmcgc2hvdWxkIGJlIHBsZW50eSBmYXN0Lgo+IAo+
IE1heWJlLiBJIGRvbid0IHRoaW5rIG15IHBvaW50IGFib3V0IGtlZXBpbmcgdGhlIGRlbnRyeSBj
YWNoZSBuZWVkbGVzc2x5IAo+IGhvdCBpcyBnZXR0aW5nIHRocm91Z2ggYXQgYWxsLiBPbiBteSBs
aWdodGx5IGxvYWRlZCBkZXNrdG9wOgo+IAo+ICDCoCQgc3VkbyBsc29mIHwgd2MgLWwKPiAgwqA1
OTk1NTEKPiAKPiAgwqAkIHN1ZG8gbHNvZiB8IGdyZXAgIi9kZXYvZHJpLyIgfCB3YyAtbAo+ICDC
oDE5NjUKPiAKPiBJdCdzIGdvaW5nIHRvIGxvb2sgdXAgfjYwMGsgcG9pbnRsZXNzIGRlbnRyaWVz
IGluIGV2ZXJ5IGl0ZXJhdGlvbi4gSnVzdCAKPiB0byBmaW5kIGEgaGFuZGZ1bCBvZiBEUk0gb25l
cy4gSGFyZCB0byBzYXkgaWYgdGhhdCBpcyBiZXR0ZXIgb3Igd29yc2UgCj4gdGhhbiBqdXN0IHBh
cnNpbmcgZmRpbmZvIHRleHQgZm9yIGFsbCBmaWxlcy4gV2lsbCBzZWUuCgpDUFUgdXNhZ2UgbG9v
a3MgcGFzc2FibGUgdW5kZXIgYSBwcm9kdWN0aW9uIGtlcm5lbCAobm9uLWRlYnVnKS4gT25jZSBh
IApzZWNvbmQgcmVmcmVzaCBwZXJpb2QsIG9uIGEgbm90IHJlYWxseSB0aGF0IGxvYWRlZCBzeXN0
ZW0gKDExNSBydW5uaW5nIApwcm9jZXNzZXMsIDMwOTYgb3BlbiBmaWxlIGRlc2NyaXB0b3JzIGFz
IHJlcG9ydGVkIGJ5IGxzb2YsIG5vbmUgb2Ygd2hpY2ggCmFyZSBEUk0pLCByZXN1bHRzIGluIGEg
c3lzdGVtIGNhbGwgaGVhdnkgbG9hZDoKCnJlYWwgICAgMG01NS4zNDhzCnVzZXIgICAgMG0wLjEw
MHMKc3lzICAgICAwbTAuMzE5cwoKT25jZSBwZXIgc2Vjb25kIGxvb3AgaXMgZXNzZW50aWFsbHkg
YWxvbmcgdGhlIGxpbmVzIG9mOgoKICAgZm9yIGVhY2ggcGlkIGluIC9wcm9jLzxwaWQ+OgogICAg
IGZvciBlYWNoIGZkIGluIC9wcm9jLzxwaWQ+L2ZkaW5mbzoKICAgICAgIGlmIGZzdGF0YXQoZmQp
IGlzIGRybSBtYWpvcjoKICAgICAgICAgcmVhZCBmZGluZm8gdGV4dCBpbiBvbmUgc3dlZXAgYW5k
IHBhcnNlIGl0CgpJJ2xsIHBvc3QgdGhlIHF1aWNrIGludGVsX2dwdV90b3AgcGF0Y2ggZm9yIHJl
ZmVyZW5jZSBidXQgc3RyaW5nIHBhcnNpbmcgCmluIEMgbGVhdmVzIGEgZmV3IHRoaW5ncyB0byBi
ZSBkZXNpcmVkIHRoZXJlLgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
