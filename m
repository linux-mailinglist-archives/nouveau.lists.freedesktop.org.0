Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB9A051E
	for <lists+nouveau@lfdr.de>; Wed, 28 Aug 2019 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4020689CAC;
	Wed, 28 Aug 2019 14:38:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BF489CAC;
 Wed, 28 Aug 2019 14:38:25 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 07:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="182045649"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 28 Aug 2019 07:38:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Aug 2019 17:38:21 +0300
Date: Wed, 28 Aug 2019 17:38:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20190828143821.GD7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
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

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDk6MzY6NTBBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gVGhpcyBzaG91bGQgcHJvYmFibHkgYmUgZml4ZWQgdG8gYWNjb3VudCBmb3IgdGhlIHNj
ZW5hcmlvIHdoZXJlIGFuCj4gSERNSSBjb25uZWN0b3IgaXMgcGx1Z2dlZCBkaXJlY3RseSBpbnRv
IHRoZSBEUCsrIHBvcnQuIEkgZG9uJ3QgdGhpbmsKPiB0aGUgZHAuc3ViY29ubmVjdG9yIHByb3Bl
cnR5IHdpbGwgYmUgdmFsaWQgaW4gdGhhdCBjYXNlLgo+IChVbmZvcnR1bmF0ZWx5IEkgZG9uJ3Qg
cmVtZW1iZXIgaG93IG9uZSBkZXRlY3RzIHRoYXQgcGFydGljdWxhcgo+IHNpdHVhdGlvbi4pCgpP
bmUgbWF5IG9yIG1heSBub3QgYmUgYWJsZSB0byBkZXRlY3QgaXQgdmVyeSB3ZWxsLiBJJ3ZlIHNl
ZW4gZG9uZ2xlcwp0aGF0IGF1dG9tYWdpY2FsbHkgY2hhbmdlIHRoZSBERlAgdHlwZSBmcm9tIERQ
KysgdG8gRFAvSERNSSBkZXBlbmRpbmcKb24gd2hhdCdzIHBsdWdnZWQgaW4sIGFuZCBJJ3ZlIGFs
c28gc2VlbiBkb25nbGVzIHRoYXQgbGVhdmUgdGhlIERGUAp0eXBlIHRvIERQKysuCgpJJ20gYWN0
dWFsbHkgYnJvaWxpbmcgYSBzZXJpZXMgb2YgcGF0Y2hlcyB3aGljaCB0cnkgdG8gaW1wcm92ZSBo
b3cKaTkxNSBoYW5kbGVzIHZhcmlvdXMgREZQIHR5cGVzLCBhbmQgZm9yIHRoYXQgSSdtIHRoaW5r
aW5nIG9mIHVzaW5nCmEgY29tYmluYXRpb24gb2YgdGhlIERGUCB0eXBlIGFuZCB0aGUgRURJRCBk
aWdpdGFsIGlucHV0IHR5cGUgdG8KZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRoZSB0d28gY2FzZXMg
bGlrZSBzbzoKCnN0YXRpYyBib29sIGlzX2VkaWRfZGlnaXRhbF9pbnB1dF9kcChjb25zdCBzdHJ1
Y3QgZWRpZCAqZWRpZCkKewoJcmV0dXJuIGVkaWQgJiYgZWRpZC0+cmV2aXNpb24gPj0gNCAmJgoJ
CWVkaWQtPmlucHV0ICYgRFJNX0VESURfSU5QVVRfRElHSVRBTCAmJgoJCShlZGlkLT5pbnB1dCAm
IERSTV9FRElEX0RJR0lUQUxfVFlQRV9NQVNLKSA9PSBEUk1fRURJRF9ESUdJVEFMX1RZUEVfRFA7
Cn0KCnsKCXN3aXRjaCAocG9ydF9jYXBbMF0gJiBEUF9EU19QT1JUX1RZUEVfTUFTSykgewoJY2Fz
ZSBEUF9EU19QT1JUX1RZUEVfRFA6CgkJRFBfU1RVRkY7CgljYXNlIERQX0RTX1BPUlRfVFlQRV9E
UF9EVUFMTU9ERToKCQlpZiAoaXNfZWRpZF9kaWdpdGFsX2lucHV0X2RwKGVkaWQpKQoJCQlEUF9T
VFVGRjsKCQkvKiBmYWxsIHRocm91Z2ggKi8KCWNhc2UgRFBfRFNfUE9SVF9UWVBFX0hETUk6Cglj
YXNlIERQX0RTX1BPUlRfVFlQRV9EVkk6CgkJVE1EU19TVFVGRjsKfQoKPiAKPiBPbiBNb24sIEF1
ZyAyNiwgMjAxOSBhdCA5OjIyIEFNIE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gU2luY2UgRFAtc3BlY2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVk
IGluIGRyaXZlcidzIHN0cnVjdHVyZXMsIGV2ZXJ5Cj4gPiBkcml2ZXIgbmVlZHMgdG8gaW1wbGVt
ZW50IHN1YmNvbm5lY3RvciBwcm9wZXJ0eSBieSBpdHNlbGYuCj4gPgo+ID4gUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Cj4gPiBDYzogQmVuIFNr
ZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5l
Y3Rvci5jIHwgMTMgKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZHAuYyAgICAgICAgfCAgOSArKysrKysrKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2VuY29kZXIuaCAgIHwgIDEgKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9j
b25uZWN0b3IuYwo+ID4gaW5kZXggOTRkZmEyZTVhOWFiLi5kOWMxMTZjYzExYjkgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gPiBAQCAt
NjM1LDYgKzYzNSwxNyBAQCBub3V2ZWF1X2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKPiA+ICAgICAgICAgcG1fcnVudGltZV9tYXJr
X2xhc3RfYnVzeShkZXYtPmRldik7Cj4gPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKGRldi0+ZGV2KTsKPiA+Cj4gPiArICAgICAgIGlmIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90
eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCB8fAo+ID4gKyAgICAgICAgICAg
Y29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSB7Cj4g
PiArICAgICAgICAgICAgICAgZW51bSBkcm1fbW9kZV9zdWJjb25uZWN0b3Igc3ViY29ubmVjdG9y
ID0gRFJNX01PREVfU1VCQ09OTkVDVE9SX1Vua25vd247Cj4gPiArCj4gPiArICAgICAgICAgICAg
ICAgaWYgKGNvbm5fc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkICYmIG52X2Vu
Y29kZXIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdWJjb25uZWN0b3IgPSBudl9lbmNv
ZGVyLT5kcC5zdWJjb25uZWN0b3I7Cj4gPiArICAgICAgICAgICAgICAgZHJtX29iamVjdF9wcm9w
ZXJ0eV9zZXRfdmFsdWUoJmNvbm5lY3Rvci0+YmFzZSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbm5lY3Rvci0+ZGV2LT5tb2RlX2NvbmZpZy5kcF9zdWJjb25uZWN0b3JfcHJvcGVydHks
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdWJjb25uZWN0b3IpOwo+ID4gKyAgICAgICB9
Cj4gPiArCj4gPiAgICAgICAgIHJldHVybiBjb25uX3N0YXR1czsKPiA+ICB9Cj4gPgo+ID4gQEAg
LTEzNTksNiArMTM3MCw4IEBAIG5vdXZlYXVfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUobnZfY29ubmVjdG9y
KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7Cj4gPiAg
ICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGRybV9tb2RlX2FkZF9k
cF9zdWJjb25uZWN0b3JfcHJvcGVydHkoY29ubmVjdG9yKTsKPiA+ICAgICAgICAgICAgICAgICBm
dW5jcyA9ICZub3V2ZWF1X2Nvbm5lY3Rvcl9mdW5jczsKPiA+ICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rw
LmMKPiA+IGluZGV4IDI2NzRmMTU4NzQ1Ny4uODVlYWM4NTNlM2Y4IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKPiA+IEBAIC02Miw2ICs2Miw3IEBAIG5vdXZlYXVf
ZHBfZGV0ZWN0KHN0cnVjdCBub3V2ZWF1X2VuY29kZXIgKm52X2VuY29kZXIpCj4gPiAgICAgICAg
IHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oZGV2KTsKPiA+ICAgICAgICAg
c3RydWN0IG52a21faTJjX2F1eCAqYXV4Owo+ID4gICAgICAgICB1OCBkcGNkWzhdOwo+ID4gKyAg
ICAgICB1OCBwb3J0X2NhcFtEUF9NQVhfRE9XTlNUUkVBTV9QT1JUU10gPSB7fTsKPiA+ICAgICAg
ICAgaW50IHJldDsKPiA+Cj4gPiAgICAgICAgIGF1eCA9IG52X2VuY29kZXItPmF1eDsKPiA+IEBA
IC03Miw2ICs3MywxNCBAQCBub3V2ZWF1X2RwX2RldGVjdChzdHJ1Y3Qgbm91dmVhdV9lbmNvZGVy
ICpudl9lbmNvZGVyKQo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4gPgo+ID4gKyAgICAgICBpZiAoZHBjZFtEUF9EUENEX1JFVl0gPiAweDEwKSB7
Cj4gPiArICAgICAgICAgICAgICAgcmV0ID0gbnZrbV9yZGF1eChhdXgsIERQX0RPV05TVFJFQU1f
UE9SVF8wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydF9jYXAsIERQ
X01BWF9ET1dOU1RSRUFNX1BPUlRTKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0KHBvcnRfY2FwLCAwLCBEUF9NQVhfRE9XTlNU
UkVBTV9QT1JUUyk7Cj4gPiArICAgICAgIH0KPiA+ICsgICAgICAgbnZfZW5jb2Rlci0+ZHAuc3Vi
Y29ubmVjdG9yID0gZHJtX2RwX3N1YmNvbm5lY3Rvcl90eXBlKGRwY2QsIHBvcnRfY2FwKTsKPiA+
ICsKPiA+ICAgICAgICAgbnZfZW5jb2Rlci0+ZHAubGlua19idyA9IDI3MDAwICogZHBjZFsxXTsK
PiA+ICAgICAgICAgbnZfZW5jb2Rlci0+ZHAubGlua19uciA9IGRwY2RbMl0gJiBEUF9NQVhfTEFO
RV9DT1VOVF9NQVNLOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2VuY29kZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZW5j
b2Rlci5oCj4gPiBpbmRleCAzNTE3ZjkyMGJmODkuLmUxNzk3MWEzMDIyMSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZW5jb2Rlci5oCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2VuY29kZXIuaAo+ID4gQEAgLTYzLDYgKzYz
LDcgQEAgc3RydWN0IG5vdXZlYXVfZW5jb2RlciB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbnY1MF9tc3RtICptc3RtOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50
IGxpbmtfbnI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGlua19idzsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGVudW0gZHJtX21vZGVfc3ViY29ubmVjdG9yIHN1YmNvbm5l
Y3RvcjsKPiA+ICAgICAgICAgICAgICAgICB9IGRwOwo+ID4gICAgICAgICB9Owo+ID4KPiA+IC0t
Cj4gPiAyLjIzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiA+IE5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
