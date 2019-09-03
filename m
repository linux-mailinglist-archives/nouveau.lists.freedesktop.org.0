Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFEA7582
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 22:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F789CA8;
	Tue,  3 Sep 2019 20:49:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5255A89C94;
 Tue,  3 Sep 2019 20:49:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD18E3086228;
 Tue,  3 Sep 2019 20:49:18 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE0F1001B0B;
 Tue,  3 Sep 2019 20:49:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  3 Sep 2019 16:46:05 -0400
Message-Id: <20190903204645.25487-28-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 03 Sep 2019 20:49:18 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 27/27] drm/dp_mst: Add topology ref history
 tracking for debugging
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rm9yIHZlcnkgc3VidGxlIG1pc3Rha2VzIHdpdGggdG9wb2xvZ3kgcmVmcywgaXQgY2FuIGJlIHJh
dGhlciBkaWZmaWN1bHQKdG8gdHJhY2UgdGhlbSBkb3duIHdpdGggdGhlIGRlYnVnZ2luZyBpbmZv
IHRoYXQgd2UgYWxyZWFkeSBoYXZlLiBJIGhhZApvbmUgc3VjaCBpc3N1ZSByZWNlbnRseSB3aGls
ZSB0cnlpbmcgdG8gaW1wbGVtZW50IHN1c3BlbmQvcmVzdW1lCnJlcHJvYmluZyBmb3IgTVNULCBh
bmQgZW5kZWQgdXAgY29taW5nIHVwIHdpdGggdGhpcy4KCkluc3BpcmVkIGJ5IENocmlzIFdpbHNv
bidzIHdha2VyZWYgdHJhY2tpbmcgZm9yIGk5MTUsIHRoaXMgYWRkcyBhIHZlcnkKc2ltaWxhciBm
ZWF0dXJlIHRvIHRoZSBEUCBNU1QgaGVscGVycywgd2hpY2ggYWxsb3dzIGZvciBwYXJ0aWFsIHRy
YWNraW5nCm9mIHRvcG9sb2d5IHJlZnMgZm9yIGJvdGggcG9ydHMgYW5kIGJyYW5jaCBkZXZpY2Vz
LiBUaGlzIGlzIGEgbG90IGxlc3MKYWR2YW5jZWQgdGhlbiB3YWtlcmVmIHRyYWNraW5nOiB3ZSBt
ZXJlbHkga2VlcCBhIGNvdW50IG9mIGFsbCBvZiB0aGUKc3BvdHMgd2hlcmUgYSB0b3BvbG9neSBy
ZWYgaGFzIGJlZW4gZ3JhYmJlZCBvciBkcm9wcGVkLCB0aGVuIGR1bXAgb3V0CnRoYXQgaGlzdG9y
eSBpbiBjaHJvbm9sb2dpY2FsIG9yZGVyIHdoZW4gYSBwb3J0IG9yIGJyYW5jaCBkZXZpY2Uncwp0
b3BvbG9neSByZWZjb3VudCByZWFjaGVzIDAuIFNvIGZhciwgSSd2ZSBmb3VuZCB0aGlzIGluY3Jl
ZGlibHkgdXNlZnVsCmZvciBkZWJ1Z2dpbmcgdG9wb2xvZ3kgcmVmY291bnQgZXJyb3JzLgoKU2lu
Y2UgdGhpcyBoYXMgdGhlIHBvdGVudGlhbCB0byBiZSBzb21ld2hhdCBzbG93IGFuZCBsb3VkLCB3
ZSBhZGQgYW4KZXhwZXJ0IGtlcm5lbCBjb25maWcgb3B0aW9uIHRvIGVuYWJsZSBvciBkaXNhYmxl
IHRoaXMgZmVhdHVyZSwKQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUy4KCkNo
YW5nZXMgc2luY2UgdjE6CiogRG9uJ3QgZm9yZ2V0IHRvIGRlc3Ryb3kgdG9wb2xvZ3lfcmVmX2hp
c3RvcnlfbG9jawoKQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KQ2M6IEltcmUg
RGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNv
bT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL0tj
b25maWcgICAgICAgICAgICAgICB8ICAxNCArKwogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyB8IDIzMyArKysrKysrKysrKysrKysrKysrKysrKysrLQogaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8ICA0NSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAy
ODggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IGU2N2MxOTRjMmFj
YS4uNDRmYzJjMmE2ZTJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwpAQCAtOTMsNiArOTMsMjAgQEAgY29uZmlnIERSTV9L
TVNfRkJfSEVMUEVSCiAJaGVscAogCSAgRkJERVYgaGVscGVycyBmb3IgS01TIGRyaXZlcnMuCiAK
K2NvbmZpZyBEUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlMKKyAgICAgICAgYm9vbCAiRW5h
YmxlIHJlZmNvdW50IGJhY2t0cmFjZSBoaXN0b3J5IGluIHRoZSBEUCBNU1QgaGVscGVycyIKKyAg
ICAgICAgc2VsZWN0IFNUQUNLREVQT1QKKyAgICAgICAgZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBF
UgorICAgICAgICBkZXBlbmRzIG9uIERFQlVHX0tFUk5FTAorICAgICAgICBkZXBlbmRzIG9uIEVY
UEVSVAorICAgICAgICBoZWxwCisgICAgICAgICAgRW5hYmxlcyBkZWJ1ZyB0cmFjaW5nIGZvciB0
b3BvbG9neSByZWZzIGluIERSTSdzIERQIE1TVCBoZWxwZXJzLiBBCisgICAgICAgICAgaGlzdG9y
eSBvZiBlYWNoIHRvcG9sb2d5IHJlZmVyZW5jZS9kZXJlZmVyZW5jZSB3aWxsIGJlIHByaW50ZWQg
dG8gdGhlCisgICAgICAgICAga2VybmVsIGxvZyBvbmNlIGEgcG9ydCBvciBicmFuY2ggZGV2aWNl
J3MgdG9wb2xvZ3kgcmVmY291bnQgcmVhY2hlcyAwLgorCisgICAgICAgICAgVGhpcyBoYXMgdGhl
IHBvdGVudGlhbCB0byB1c2UgYSBsb3Qgb2YgbWVtb3J5IGFuZCBwcmludCBzb21lIHZlcnkKKyAg
ICAgICAgICBsYXJnZSBrZXJuZWwgbWVzc2FnZXMuIElmIGluIGRvdWJ0LCBzYXkgIk4iLgorCiBj
b25maWcgRFJNX0ZCREVWX0VNVUxBVElPTgogCWJvb2wgIkVuYWJsZSBsZWdhY3kgZmJkZXYgc3Vw
cG9ydCBmb3IgeW91ciBtb2Rlc2V0dGluZyBkcml2ZXIiCiAJZGVwZW5kcyBvbiBEUk0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDViNWMwYjNiM2MwZS4uMThmOWEwMjky
N2Q5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTI4LDYgKzI4LDEz
IEBACiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5o
PgogCisjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9SRUZT
KQorI2luY2x1ZGUgPGxpbnV4L3N0YWNrZGVwb3QuaD4KKyNpbmNsdWRlIDxsaW51eC9zb3J0Lmg+
CisjaW5jbHVkZSA8bGludXgvdGltZWtlZXBpbmcuaD4KKyNpbmNsdWRlIDxsaW51eC9tYXRoNjQu
aD4KKyNlbmRpZgorCiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX2F0b21pY19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4K
QEAgLTE0MDUsMTIgKzE0MTIsMTg5IEBAIGRybV9kcF9tc3RfcHV0X3BvcnRfbWFsbG9jKHN0cnVj
dCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfcHV0
X3BvcnRfbWFsbG9jKTsKIAorI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9ERUJVR19EUF9NU1Rf
VE9QT0xPR1lfUkVGUykKKworI2RlZmluZSBTVEFDS19ERVBUSCA4CisKK3N0YXRpYyBub2lubGlu
ZSB2b2lkCitfX3RvcG9sb2d5X3JlZl9zYXZlKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
ciAqbWdyLAorCQkgICAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfcmVmX2hpc3RvcnkgKmhp
c3RvcnksCisJCSAgICBlbnVtIGRybV9kcF9tc3RfdG9wb2xvZ3lfcmVmX3R5cGUgdHlwZSkKK3sK
KwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZfZW50cnkgKmVudHJ5ID0gTlVMTDsKKwlk
ZXBvdF9zdGFja19oYW5kbGVfdCBiYWNrdHJhY2U7CisJdWxvbmcgc3RhY2tfZW50cmllc1tTVEFD
S19ERVBUSF07CisJdWludCBuOworCWludCBpOworCisJbiA9IHN0YWNrX3RyYWNlX3NhdmUoc3Rh
Y2tfZW50cmllcywgQVJSQVlfU0laRShzdGFja19lbnRyaWVzKSwgMSk7CisJYmFja3RyYWNlID0g
c3RhY2tfZGVwb3Rfc2F2ZShzdGFja19lbnRyaWVzLCBuLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWJh
Y2t0cmFjZSkKKwkJZ290byBmYWlsX2FsbG9jOworCisJLyogVHJ5IHRvIGZpbmQgYW4gZXhpc3Rp
bmcgZW50cnkgZm9yIHRoaXMgYmFja3RyYWNlICovCisJZm9yIChpID0gMDsgaSA8IGhpc3Rvcnkt
PmxlbjsgaSsrKSB7CisJCWlmIChoaXN0b3J5LT5lbnRyaWVzW2ldLmJhY2t0cmFjZSA9PSBiYWNr
dHJhY2UpIHsKKwkJCWVudHJ5ID0gJmhpc3RvcnktPmVudHJpZXNbaV07CisJCQlicmVhazsKKwkJ
fQorCX0KKworCS8qIE90aGVyd2lzZSBhZGQgb25lICovCisJaWYgKCFlbnRyeSkgeworCQlzdHJ1
Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZfZW50cnkgKm5ldzsKKwkJaW50IG5ld19sZW4gPSBo
aXN0b3J5LT5sZW4gKyAxOworCisJCW5ldyA9IGtyZWFsbG9jKGhpc3RvcnktPmVudHJpZXMsIHNp
emVvZigqbmV3KSAqIG5ld19sZW4sCisJCQkgICAgICAgR0ZQX0tFUk5FTCk7CisJCWlmICghbmV3
KQorCQkJZ290byBmYWlsX2FsbG9jOworCisJCWVudHJ5ID0gJm5ld1toaXN0b3J5LT5sZW5dOwor
CQloaXN0b3J5LT5sZW4gPSBuZXdfbGVuOworCQloaXN0b3J5LT5lbnRyaWVzID0gbmV3OworCisJ
CWVudHJ5LT5iYWNrdHJhY2UgPSBiYWNrdHJhY2U7CisJCWVudHJ5LT50eXBlID0gdHlwZTsKKwkJ
ZW50cnktPmNvdW50ID0gMDsKKwl9CisJZW50cnktPmNvdW50Kys7CisJZW50cnktPnRzX25zZWMg
PSBrdGltZV9nZXRfbnMoKTsKKworCXJldHVybjsKK2ZhaWxfYWxsb2M6CisJRFJNX1dBUk5fT05D
RSgiRmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgdG9wb2xvZ3kgcmVmY291bnQgYmFja3Ry
YWNlXG4iKTsKK30KKworc3RhdGljIGludAordG9wb2xvZ3lfcmVmX2hpc3RvcnlfY21wKGNvbnN0
IHZvaWQgKmEsIGNvbnN0IHZvaWQgKmIpCit7CisJY29uc3Qgc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfcmVmX2VudHJ5ICplbnRyeV9hID0gYSwgKmVudHJ5X2IgPSBiOworCisJaWYgKGVudHJ5
X2EtPnRzX25zZWMgPiBlbnRyeV9iLT50c19uc2VjKQorCQlyZXR1cm4gMTsKKwllbHNlIGlmIChl
bnRyeV9hLT50c19uc2VjIDwgZW50cnlfYi0+dHNfbnNlYykKKwkJcmV0dXJuIC0xOworCWVsc2UK
KwkJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqCit0b3BvbG9neV9y
ZWZfdHlwZV90b19zdHIoZW51bSBkcm1fZHBfbXN0X3RvcG9sb2d5X3JlZl90eXBlIHR5cGUpCit7
CisJaWYgKHR5cGUgPT0gRFJNX0RQX01TVF9UT1BPTE9HWV9SRUZfR0VUKQorCQlyZXR1cm4gImdl
dCI7CisJZWxzZQorCQlyZXR1cm4gInB1dCI7Cit9CisKK3N0YXRpYyB2b2lkCitfX2R1bXBfdG9w
b2xvZ3lfcmVmX2hpc3Rvcnkoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfcmVmX2hpc3Rvcnkg
Kmhpc3RvcnksCisJCQkgICAgdm9pZCAqcHRyLCBjb25zdCBjaGFyICp0eXBlX3N0cikKK3sKKwlz
dHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9kZWJ1Z19wcmludGVyKERCR19QUkVGSVgpOworCWNo
YXIgKmJ1ZiA9IGt6YWxsb2MoUEFHRV9TSVpFLCBHRlBfS0VSTkVMKTsKKwlpbnQgaTsKKworCWlm
ICghYnVmKQorCQlyZXR1cm47CisKKwlpZiAoIWhpc3RvcnktPmxlbikKKwkJZ290byBvdXQ7CisK
KwkvKiBGaXJzdCwgc29ydCB0aGUgbGlzdCBzbyB0aGF0IGl0IGdvZXMgZnJvbSBvbGRlc3QgdG8g
bmV3ZXN0CisJICogcmVmZXJlbmNlIGVudHJ5CisJICovCisJc29ydChoaXN0b3J5LT5lbnRyaWVz
LCBoaXN0b3J5LT5sZW4sIHNpemVvZigqaGlzdG9yeS0+ZW50cmllcyksCisJICAgICB0b3BvbG9n
eV9yZWZfaGlzdG9yeV9jbXAsIE5VTEwpOworCisJZHJtX3ByaW50ZigmcCwKKwkJICAgIiVzICgl
cC8lcHgpIHRvcG9sb2d5IGNvdW50IHJlYWNoZWQgMCwgZHVtcGluZyBoaXN0b3J5OlxuIiwKKwkJ
ICAgdHlwZV9zdHIsIHB0ciwgcHRyKTsKKworCWZvciAoaSA9IDA7IGkgPCBoaXN0b3J5LT5sZW47
IGkrKykgeworCQljb25zdCBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZfZW50cnkgKmVu
dHJ5ID0KKwkJCSZoaXN0b3J5LT5lbnRyaWVzW2ldOworCQl1bG9uZyAqZW50cmllczsKKwkJdWlu
dCBucl9lbnRyaWVzOworCQl1NjQgdHNfbnNlYyA9IGVudHJ5LT50c19uc2VjOworCQl1NjQgcmVt
X25zZWMgPSBkb19kaXYodHNfbnNlYywgMTAwMDAwMDAwMCk7CisKKwkJbnJfZW50cmllcyA9IHN0
YWNrX2RlcG90X2ZldGNoKGVudHJ5LT5iYWNrdHJhY2UsICZlbnRyaWVzKTsKKwkJc3RhY2tfdHJh
Y2Vfc25wcmludChidWYsIFBBR0VfU0laRSwgZW50cmllcywgbnJfZW50cmllcywgNCk7CisKKwkJ
ZHJtX3ByaW50ZigmcCwgIiAgJWQgJXNzIChsYXN0IGF0ICU1bGx1LiUwNmxsdSk6XG4lcyIsCisJ
CQkgICBlbnRyeS0+Y291bnQsCisJCQkgICB0b3BvbG9neV9yZWZfdHlwZV90b19zdHIoZW50cnkt
PnR5cGUpLAorCQkJICAgdHNfbnNlYywgcmVtX25zZWMgLyAxMDAwLCBidWYpOworCX0KKworCS8q
IE5vdyBmcmVlIHRoZSBoaXN0b3J5LCBzaW5jZSB0aGlzIGlzIHRoZSBvbmx5IHRpbWUgd2UgZXhw
b3NlIGl0ICovCisJa2ZyZWUoaGlzdG9yeS0+ZW50cmllcyk7CitvdXQ6CisJa2ZyZWUoYnVmKTsK
K30KKworc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkCitkcm1fZHBfbXN0X2R1bXBfbXN0Yl90
b3BvbG9neV9oaXN0b3J5KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YikKK3sKKwlfX2R1
bXBfdG9wb2xvZ3lfcmVmX2hpc3RvcnkoJm1zdGItPnRvcG9sb2d5X3JlZl9oaXN0b3J5LCBtc3Ri
LAorCQkJCSAgICAiTVNUQiIpOworfQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKK2Ry
bV9kcF9tc3RfZHVtcF9wb3J0X3RvcG9sb2d5X2hpc3Rvcnkoc3RydWN0IGRybV9kcF9tc3RfcG9y
dCAqcG9ydCkKK3sKKwlfX2R1bXBfdG9wb2xvZ3lfcmVmX2hpc3RvcnkoJnBvcnQtPnRvcG9sb2d5
X3JlZl9oaXN0b3J5LCBwb3J0LAorCQkJCSAgICAiUG9ydCIpOworfQorCitzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQKK3NhdmVfbXN0Yl90b3BvbG9neV9yZWYoc3RydWN0IGRybV9kcF9tc3Rf
YnJhbmNoICptc3RiLAorCQkgICAgICAgZW51bSBkcm1fZHBfbXN0X3RvcG9sb2d5X3JlZl90eXBl
IHR5cGUpCit7CisJX190b3BvbG9neV9yZWZfc2F2ZShtc3RiLT5tZ3IsICZtc3RiLT50b3BvbG9n
eV9yZWZfaGlzdG9yeSwgdHlwZSk7Cit9CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZAor
c2F2ZV9wb3J0X3RvcG9sb2d5X3JlZihzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LAorCQkg
ICAgICAgZW51bSBkcm1fZHBfbXN0X3RvcG9sb2d5X3JlZl90eXBlIHR5cGUpCit7CisJX190b3Bv
bG9neV9yZWZfc2F2ZShwb3J0LT5tZ3IsICZwb3J0LT50b3BvbG9neV9yZWZfaGlzdG9yeSwgdHlw
ZSk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZAordG9wb2xvZ3lfcmVmX2hpc3RvcnlfbG9jayhz
dHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKK3sKKwltdXRleF9sb2NrKCZtZ3It
PnRvcG9sb2d5X3JlZl9oaXN0b3J5X2xvY2spOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQKK3Rv
cG9sb2d5X3JlZl9oaXN0b3J5X3VubG9jayhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1ncikKK3sKKwltdXRleF91bmxvY2soJm1nci0+dG9wb2xvZ3lfcmVmX2hpc3RvcnlfbG9jayk7
Cit9CisjZWxzZQorc3RhdGljIGlubGluZSB2b2lkCit0b3BvbG9neV9yZWZfaGlzdG9yeV9sb2Nr
KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKSB7fQorc3RhdGljIGlubGluZSB2
b2lkCit0b3BvbG9neV9yZWZfaGlzdG9yeV91bmxvY2soc3RydWN0IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyICptZ3IpIHt9CitzdGF0aWMgaW5saW5lIHZvaWQKK2RybV9kcF9tc3RfZHVtcF9tc3Ri
X3RvcG9sb2d5X2hpc3Rvcnkoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKSB7fQorc3Rh
dGljIGlubGluZSB2b2lkCitkcm1fZHBfbXN0X2R1bXBfcG9ydF90b3BvbG9neV9oaXN0b3J5KHN0
cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpIHt9CisjZGVmaW5lIHNhdmVfbXN0Yl90b3BvbG9n
eV9yZWYobXN0YiwgdHlwZSkKKyNkZWZpbmUgc2F2ZV9wb3J0X3RvcG9sb2d5X3JlZihwb3J0LCB0
eXBlKQorI2VuZGlmCisKIHN0YXRpYyB2b2lkIGRybV9kcF9kZXN0cm95X21zdF9icmFuY2hfZGV2
aWNlKHN0cnVjdCBrcmVmICprcmVmKQogewogCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0
YiA9CiAJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2gsIHRvcG9s
b2d5X2tyZWYpOwogCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyID0gbXN0Yi0+
bWdyOwogCisJZHJtX2RwX21zdF9kdW1wX21zdGJfdG9wb2xvZ3lfaGlzdG9yeShtc3RiKTsKKwog
CUlOSVRfTElTVF9IRUFEKCZtc3RiLT5kZXN0cm95X25leHQpOwogCiAJLyoKQEAgLTE0NDgsMTEg
KzE2MzIsMTggQEAgc3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lfbXN0X2JyYW5jaF9kZXZpY2Uo
c3RydWN0IGtyZWYgKmtyZWYpCiBzdGF0aWMgaW50IF9fbXVzdF9jaGVjawogZHJtX2RwX21zdF90
b3BvbG9neV90cnlfZ2V0X21zdGIoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKQogewot
CWludCByZXQgPSBrcmVmX2dldF91bmxlc3NfemVybygmbXN0Yi0+dG9wb2xvZ3lfa3JlZik7CisJ
aW50IHJldDsKIAotCWlmIChyZXQpCisJdG9wb2xvZ3lfcmVmX2hpc3RvcnlfbG9jayhtc3RiLT5t
Z3IpOworCXJldCA9IGtyZWZfZ2V0X3VubGVzc196ZXJvKCZtc3RiLT50b3BvbG9neV9rcmVmKTsK
KworCWlmIChyZXQpIHsKIAkJRFJNX0RFQlVHKCJtc3RiICVwLyVweCAoJWQpXG4iLAogCQkJICBt
c3RiLCBtc3RiLCBrcmVmX3JlYWQoJm1zdGItPnRvcG9sb2d5X2tyZWYpKTsKKwkJc2F2ZV9tc3Ri
X3RvcG9sb2d5X3JlZihtc3RiLCBEUk1fRFBfTVNUX1RPUE9MT0dZX1JFRl9HRVQpOworCX0KKwor
CXRvcG9sb2d5X3JlZl9oaXN0b3J5X3VubG9jayhtc3RiLT5tZ3IpOwogCiAJcmV0dXJuIHJldDsK
IH0KQEAgLTE0NzMsMTAgKzE2NjQsMTUgQEAgZHJtX2RwX21zdF90b3BvbG9neV90cnlfZ2V0X21z
dGIoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKQogICovCiBzdGF0aWMgdm9pZCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X2dldF9tc3RiKHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YikK
IHsKKwl0b3BvbG9neV9yZWZfaGlzdG9yeV9sb2NrKG1zdGItPm1ncik7CisKKwlzYXZlX21zdGJf
dG9wb2xvZ3lfcmVmKG1zdGIsIERSTV9EUF9NU1RfVE9QT0xPR1lfUkVGX0dFVCk7CiAJV0FSTl9P
TihrcmVmX3JlYWQoJm1zdGItPnRvcG9sb2d5X2tyZWYpID09IDApOwogCWtyZWZfZ2V0KCZtc3Ri
LT50b3BvbG9neV9rcmVmKTsKIAlEUk1fREVCVUcoIm1zdGIgJXAvJXB4ICglZClcbiIsCiAJCSAg
bXN0YiwgbXN0Yiwga3JlZl9yZWFkKCZtc3RiLT50b3BvbG9neV9rcmVmKSk7CisKKwl0b3BvbG9n
eV9yZWZfaGlzdG9yeV91bmxvY2sobXN0Yi0+bWdyKTsKIH0KIAogLyoqCkBAIC0xNDk0LDkgKzE2
OTAsMTQgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9nZXRfbXN0YihzdHJ1Y3Qg
ZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCiBzdGF0aWMgdm9pZAogZHJtX2RwX21zdF90b3BvbG9n
eV9wdXRfbXN0YihzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCiB7CisJdG9wb2xvZ3lf
cmVmX2hpc3RvcnlfbG9jayhtc3RiLT5tZ3IpOworCiAJRFJNX0RFQlVHKCJtc3RiICVwLyVweCAo
JWQpXG4iLAogCQkgIG1zdGIsIG1zdGIsIGtyZWZfcmVhZCgmbXN0Yi0+dG9wb2xvZ3lfa3JlZikg
LSAxKTsKKwlzYXZlX21zdGJfdG9wb2xvZ3lfcmVmKG1zdGIsIERSTV9EUF9NU1RfVE9QT0xPR1lf
UkVGX1BVVCk7CiAJa3JlZl9wdXQoJm1zdGItPnRvcG9sb2d5X2tyZWYsIGRybV9kcF9kZXN0cm95
X21zdF9icmFuY2hfZGV2aWNlKTsKKworCXRvcG9sb2d5X3JlZl9oaXN0b3J5X3VubG9jayhtc3Ri
LT5tZ3IpOwogfQogCiBzdGF0aWMgdm9pZCBkcm1fZHBfZGVzdHJveV9wb3J0KHN0cnVjdCBrcmVm
ICprcmVmKQpAQCAtMTUwNSw2ICsxNzA2LDggQEAgc3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lf
cG9ydChzdHJ1Y3Qga3JlZiAqa3JlZikKIAkJY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBkcm1f
ZHBfbXN0X3BvcnQsIHRvcG9sb2d5X2tyZWYpOwogCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21nciAqbWdyID0gcG9ydC0+bWdyOwogCisJZHJtX2RwX21zdF9kdW1wX3BvcnRfdG9wb2xvZ3lf
aGlzdG9yeShwb3J0KTsKKwogCS8qIFRoZXJlJ3Mgbm90aGluZyB0aGF0IG5lZWRzIGxvY2tpbmcg
dG8gZGVzdHJveSBhbiBpbnB1dCBwb3J0IHlldCAqLwogCWlmIChwb3J0LT5pbnB1dCkgewogCQlk
cm1fZHBfbXN0X3B1dF9wb3J0X21hbGxvYyhwb3J0KTsKQEAgLTE1NDgsMTIgKzE3NTEsMTggQEAg
c3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lfcG9ydChzdHJ1Y3Qga3JlZiAqa3JlZikKIHN0YXRp
YyBpbnQgX19tdXN0X2NoZWNrCiBkcm1fZHBfbXN0X3RvcG9sb2d5X3RyeV9nZXRfcG9ydChzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogewotCWludCByZXQgPSBrcmVmX2dldF91bmxlc3Nf
emVybygmcG9ydC0+dG9wb2xvZ3lfa3JlZik7CisJaW50IHJldDsKKworCXRvcG9sb2d5X3JlZl9o
aXN0b3J5X2xvY2socG9ydC0+bWdyKTsKKwlyZXQgPSBrcmVmX2dldF91bmxlc3NfemVybygmcG9y
dC0+dG9wb2xvZ3lfa3JlZik7CiAKLQlpZiAocmV0KQorCWlmIChyZXQpIHsKIAkJRFJNX0RFQlVH
KCJwb3J0ICVwLyVweCAoJWQpXG4iLAogCQkJICBwb3J0LCBwb3J0LCBrcmVmX3JlYWQoJnBvcnQt
PnRvcG9sb2d5X2tyZWYpKTsKKwkJc2F2ZV9wb3J0X3RvcG9sb2d5X3JlZihwb3J0LCBEUk1fRFBf
TVNUX1RPUE9MT0dZX1JFRl9HRVQpOworCX0KIAorCXRvcG9sb2d5X3JlZl9oaXN0b3J5X3VubG9j
ayhwb3J0LT5tZ3IpOwogCXJldHVybiByZXQ7CiB9CiAKQEAgLTE1NzIsMTAgKzE3ODEsMTUgQEAg
ZHJtX2RwX21zdF90b3BvbG9neV90cnlfZ2V0X3BvcnQoc3RydWN0IGRybV9kcF9tc3RfcG9ydCAq
cG9ydCkKICAqLwogc3RhdGljIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogeworCXRvcG9sb2d5X3JlZl9oaXN0b3J5X2xvY2so
cG9ydC0+bWdyKTsKKwogCVdBUk5fT04oa3JlZl9yZWFkKCZwb3J0LT50b3BvbG9neV9rcmVmKSA9
PSAwKTsKIAlrcmVmX2dldCgmcG9ydC0+dG9wb2xvZ3lfa3JlZik7CiAJRFJNX0RFQlVHKCJwb3J0
ICVwLyVweCAoJWQpXG4iLAogCQkgIHBvcnQsIHBvcnQsIGtyZWZfcmVhZCgmcG9ydC0+dG9wb2xv
Z3lfa3JlZikpOworCXNhdmVfcG9ydF90b3BvbG9neV9yZWYocG9ydCwgRFJNX0RQX01TVF9UT1BP
TE9HWV9SRUZfR0VUKTsKKworCXRvcG9sb2d5X3JlZl9oaXN0b3J5X3VubG9jayhwb3J0LT5tZ3Ip
OwogfQogCiAvKioKQEAgLTE1OTEsOSArMTgwNSwxNCBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfbXN0
X3RvcG9sb2d5X2dldF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCiAgKi8KIHN0
YXRpYyB2b2lkIGRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQoc3RydWN0IGRybV9kcF9tc3Rf
cG9ydCAqcG9ydCkKIHsKKwl0b3BvbG9neV9yZWZfaGlzdG9yeV9sb2NrKHBvcnQtPm1ncik7CisK
IAlEUk1fREVCVUcoInBvcnQgJXAvJXB4ICglZClcbiIsCiAJCSAgcG9ydCwgcG9ydCwga3JlZl9y
ZWFkKCZwb3J0LT50b3BvbG9neV9rcmVmKSAtIDEpOworCXNhdmVfcG9ydF90b3BvbG9neV9yZWYo
cG9ydCwgRFJNX0RQX01TVF9UT1BPTE9HWV9SRUZfUFVUKTsKIAlrcmVmX3B1dCgmcG9ydC0+dG9w
b2xvZ3lfa3JlZiwgZHJtX2RwX2Rlc3Ryb3lfcG9ydCk7CisKKwl0b3BvbG9neV9yZWZfaGlzdG9y
eV91bmxvY2socG9ydC0+bWdyKTsKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5j
aCAqCkBAIC00NTQ4LDYgKzQ3NjcsOSBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW5p
dChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAltdXRleF9pbml0KCZtZ3It
PnBheWxvYWRfbG9jayk7CiAJbXV0ZXhfaW5pdCgmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfbG9jayk7
CiAJbXV0ZXhfaW5pdCgmbWdyLT51cF9yZXFfbG9jayk7CisjaWYgSVNfRU5BQkxFRChDT05GSUdf
RFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9SRUZTKQorCW11dGV4X2luaXQoJm1nci0+dG9wb2xv
Z3lfcmVmX2hpc3RvcnlfbG9jayk7CisjZW5kaWYKIAlJTklUX0xJU1RfSEVBRCgmbWdyLT50eF9t
c2dfZG93bnEpOwogCUlOSVRfTElTVF9IRUFEKCZtZ3ItPmRlc3Ryb3lfcG9ydF9saXN0KTsKIAlJ
TklUX0xJU1RfSEVBRCgmbWdyLT5kZXN0cm95X2JyYW5jaF9kZXZpY2VfbGlzdCk7CkBAIC00NjEz
LDYgKzQ4MzUsOSBAQCB2b2lkIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2Rlc3Ryb3koc3RydWN0
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiAJbXV0ZXhfZGVzdHJveSgmbWdyLT5xbG9j
ayk7CiAJbXV0ZXhfZGVzdHJveSgmbWdyLT5sb2NrKTsKIAltdXRleF9kZXN0cm95KCZtZ3ItPnVw
X3JlcV9sb2NrKTsKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9M
T0dZX1JFRlMpCisJbXV0ZXhfZGVzdHJveSgmbWdyLT50b3BvbG9neV9yZWZfaGlzdG9yeV9sb2Nr
KTsKKyNlbmRpZgogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9kZXN0
cm95KTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5kZXggMWJkZWU1ZWU2ZGNkLi43NWI4ZmJh
NmYzOTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApAQCAtMjYsNiArMjYsMjYgQEAKICNpbmNs
dWRlIDxkcm0vZHJtX2RwX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAK
KyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlMpCisj
aW5jbHVkZSA8bGludXgvc3RhY2tkZXBvdC5oPgorI2luY2x1ZGUgPGxpbnV4L3RpbWVrZWVwaW5n
Lmg+CisKK2VudW0gZHJtX2RwX21zdF90b3BvbG9neV9yZWZfdHlwZSB7CisJRFJNX0RQX01TVF9U
T1BPTE9HWV9SRUZfR0VULAorCURSTV9EUF9NU1RfVE9QT0xPR1lfUkVGX1BVVCwKK307CisKK3N0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3JlZl9oaXN0b3J5IHsKKwlzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9yZWZfZW50cnkgeworCQllbnVtIGRybV9kcF9tc3RfdG9wb2xvZ3lfcmVmX3R5
cGUgdHlwZTsKKwkJaW50IGNvdW50OworCQlrdGltZV90IHRzX25zZWM7CisJCWRlcG90X3N0YWNr
X2hhbmRsZV90IGJhY2t0cmFjZTsKKwl9ICplbnRyaWVzOworCWludCBsZW47Cit9OworI2VuZGlm
IC8qIElTX0VOQUJMRUQoQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUykgKi8K
Kwogc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoOwogCiAvKioKQEAgLTkyLDYgKzExMiwxNCBAQCBz
dHJ1Y3QgZHJtX2RwX21zdF9wb3J0IHsKIAkgKi8KIAlzdHJ1Y3Qga3JlZiBtYWxsb2Nfa3JlZjsK
IAorI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUykK
KwkvKioKKwkgKiBAdG9wb2xvZ3lfcmVmX2hpc3Rvcnk6IEEgaGlzdG9yeSBvZiBlYWNoIHRvcG9s
b2d5CisJICogcmVmZXJlbmNlL2RlcmVmZXJlbmNlLiBTZWUgQ09ORklHX0RSTV9ERUJVR19EUF9N
U1RfVE9QT0xPR1lfUkVGUy4KKwkgKi8KKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZf
aGlzdG9yeSB0b3BvbG9neV9yZWZfaGlzdG9yeTsKKyNlbmRpZgorCiAJdTggcG9ydF9udW07CiAJ
Ym9vbCBpbnB1dDsKIAlib29sIG1jczsKQEAgLTE2Miw2ICsxOTAsMTQgQEAgc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoIHsKIAkgKi8KIAlzdHJ1Y3Qga3JlZiBtYWxsb2Nfa3JlZjsKIAorI2lmIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUykKKwkvKioKKwkg
KiBAdG9wb2xvZ3lfcmVmX2hpc3Rvcnk6IEEgaGlzdG9yeSBvZiBlYWNoIHRvcG9sb2d5CisJICog
cmVmZXJlbmNlL2RlcmVmZXJlbmNlLiBTZWUgQ09ORklHX0RSTV9ERUJVR19EUF9NU1RfVE9QT0xP
R1lfUkVGUy4KKwkgKi8KKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZfaGlzdG9yeSB0
b3BvbG9neV9yZWZfaGlzdG9yeTsKKyNlbmRpZgorCiAJLyoqCiAJICogQGRlc3Ryb3lfbmV4dDog
bGlua2VkLWxpc3QgZW50cnkgdXNlZCBieQogCSAqIGRybV9kcF9kZWxheWVkX2Rlc3Ryb3lfd29y
aygpCkBAIC02MzAsNiArNjY2LDE1IEBAIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciB7
CiAJICogdHJhbnNtaXNzaW9ucy4KIAkgKi8KIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QgdXBfcmVxX3dv
cms7CisKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JF
RlMpCisJLyoqCisJICogQHRvcG9sb2d5X3JlZl9oaXN0b3J5X2xvY2s6IHByb3RlY3RzCisJICog
JmRybV9kcF9tc3RfcG9ydC50b3BvbG9neV9yZWZfaGlzdG9yeSBhbmQKKwkgKiAmZHJtX2RwX21z
dF9icmFuY2gudG9wb2xvZ3lfcmVmX2hpc3RvcnkuCisJICovCisJc3RydWN0IG11dGV4IHRvcG9s
b2d5X3JlZl9oaXN0b3J5X2xvY2s7CisjZW5kaWYKIH07CiAKIGludCBkcm1fZHBfbXN0X3RvcG9s
b2d5X21ncl9pbml0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
