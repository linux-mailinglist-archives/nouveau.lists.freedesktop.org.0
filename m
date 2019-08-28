Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A804EA0561
	for <lists+nouveau@lfdr.de>; Wed, 28 Aug 2019 16:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455D89127;
	Wed, 28 Aug 2019 14:54:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7189127;
 Wed, 28 Aug 2019 14:54:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 07:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="264669630"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 28 Aug 2019 07:54:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Aug 2019 17:54:04 +0300
Date: Wed, 28 Aug 2019 17:54:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20190828145404.GE7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
 <20190828143821.GD7482@intel.com>
 <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH v3 5/7] drm/nouveau: utilize subconnector
 property for DP
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6NDc6MDhBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MzggQU0gVmlsbGUgU3lyasOkbMOkCj4g
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1
ZyAyNiwgMjAxOSBhdCAwOTozNjo1MEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+ID4g
VGhpcyBzaG91bGQgcHJvYmFibHkgYmUgZml4ZWQgdG8gYWNjb3VudCBmb3IgdGhlIHNjZW5hcmlv
IHdoZXJlIGFuCj4gPiA+IEhETUkgY29ubmVjdG9yIGlzIHBsdWdnZWQgZGlyZWN0bHkgaW50byB0
aGUgRFArKyBwb3J0LiBJIGRvbid0IHRoaW5rCj4gPiA+IHRoZSBkcC5zdWJjb25uZWN0b3IgcHJv
cGVydHkgd2lsbCBiZSB2YWxpZCBpbiB0aGF0IGNhc2UuCj4gPiA+IChVbmZvcnR1bmF0ZWx5IEkg
ZG9uJ3QgcmVtZW1iZXIgaG93IG9uZSBkZXRlY3RzIHRoYXQgcGFydGljdWxhcgo+ID4gPiBzaXR1
YXRpb24uKQo+ID4KPiA+IE9uZSBtYXkgb3IgbWF5IG5vdCBiZSBhYmxlIHRvIGRldGVjdCBpdCB2
ZXJ5IHdlbGwuIEkndmUgc2VlbiBkb25nbGVzCj4gPiB0aGF0IGF1dG9tYWdpY2FsbHkgY2hhbmdl
IHRoZSBERlAgdHlwZSBmcm9tIERQKysgdG8gRFAvSERNSSBkZXBlbmRpbmcKPiA+IG9uIHdoYXQn
cyBwbHVnZ2VkIGluLCBhbmQgSSd2ZSBhbHNvIHNlZW4gZG9uZ2xlcyB0aGF0IGxlYXZlIHRoZSBE
RlAKPiA+IHR5cGUgdG8gRFArKy4KPiAKPiBXZWxsLCBvdXIgaW50ZXJuYWwgbG9naWMgY2VydGFp
bmx5IGtub3dzIGlmIGl0J3MgZHJpdmluZyBEUCBvciBUTURTLiBJCj4ganVzdCBkb24ndCByZW1l
bWJlciBob3cgaXQga25vd3MgdGhpcy4KCllvdSdsbCBiZSBkcml2aW5nIERQIGluIHRoaXMgY2Fz
ZS4gVGhlIERGUCB3aWxsIGJlIHRoZSBvbmUgZHJpdmluZwpEUCBvciBUTURTIGRlcGVuZGluZyBv
biB3aGF0J3MgcGx1Z2dlZCBpbi4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
