Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF18CF260
	for <lists+nouveau@lfdr.de>; Tue,  8 Oct 2019 08:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D589EB1;
	Tue,  8 Oct 2019 06:05:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86489E4C;
 Tue,  8 Oct 2019 06:05:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 23:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="206577319"
Received: from wpross-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.86])
 by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2019 23:05:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
In-Reply-To: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191004144549.3567-1-krzk@kernel.org> <87sgo4hjii.fsf@intel.com>
 <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
 <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Date: Tue, 08 Oct 2019 09:05:49 +0300
Message-ID: <87v9szdb5u.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH TRIVIAL v2] gpu: Fix Kconfig indentation
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jiri Kosina <trivial@kernel.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
PiB3cm90ZToKPiBPbiBNb24sIDcgT2N0IDIwMTkgYXQgMTg6MDksIEFsZXggRGV1Y2hlciA8YWxl
eGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gTW9uLCBPY3QgNywgMjAxOSBhdCA3
OjM5IEFNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+
PiA+Cj4+ID4gT24gRnJpLCAwNCBPY3QgMjAxOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnICAg
ICAgICAgICAgIHwgIDEyICstCj4+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5k
ZWJ1ZyAgICAgICB8IDE0NCArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+PiA+Cj4+ID4gUGxlYXNl
IHNwbGl0IHRoZXNlIG91dCB0byBhIHNlcGFyYXRlIHBhdGNoLiBDYW4ndCBzcGVhayBmb3Igb3Ro
ZXJzLCBidXQKPj4gPiB0aGUgcGF0Y2ggbG9va3MgbGlrZSBpdCdsbCBiZSBjb25mbGljdHMgZ2Fs
b3JlIGFuZCBhIHByb2JsZW0gdG8gbWFuYWdlCj4+ID4gaWYgbWVyZ2VkIGluIG9uZSBiaWcgbHVt
cC4KPj4KPj4gWWVzLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhlIGFtZCBwYXRjaCBzZXBh
cmF0ZSBhcyB3ZWxsLgo+Cj4gSSdsbCBzcGxpdCB0aGUgQU1EIGFuZCBpOTE1IGFsdGhvdWdoIEkg
YW0gbm90IHN1cmUgaWYgaXQgaXMgc2Vuc2UgdG8KPiBzcGxpdCBzdWNoIHRyaXZpYWwgcGF0Y2gg
cGVyIGVhY2ggZHJpdmVyLgoKVGhhbmtzLgoKU2VlIE1BSU5UQUlORVJTLCBtYW55IG9mIHRoZSBk
cml2ZXJzIGFyZSBtYWludGFpbmVkIGluIHRoZSBzYW1lIGRybS1taXNjCnJlcG8sIGFuZCBpdCBt
YWtlcyBubyBkaWZmZXJlbmNlIHRvIHNwbGl0IHRob3NlLgoKSW4gZ2VuZXJhbCBpdCdzLCB3ZWxs
LCB0cml2aWFsIHRvIHNwbGl0IHVwIHBhdGNoZXMgbGlrZSB0aGlzIHBlciBkcml2ZXIKb3IgcmVw
bywgYnV0IG5vdCBzcGxpdHRpbmcgaXQgdXAgZ2VuZXJhdGVzIGV4dHJhIGJ1c3l3b3JrIGluIG1h
bmFnaW5nCmNvbmZsaWN0cyB1bnRpbCBzb21lIGNvbW1vbiBtZXJnZS9iYWNrbWVyZ2UgaGFwcGVu
cy4gV2UganVzdCB3YW50IHRvCmFwcGx5IHRoZSBwYXRjaCBhbmQgZm9yZ2V0IGFib3V0IGl0LCBp
bnN0ZWFkIG9mIGRlYWxpbmcgd2l0aCBhIHRyaXZpYWwKd2hpdGVzcGFjZSBjbGVhbnVwIG1hbnkg
dGltZXMgb3Zlci4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
