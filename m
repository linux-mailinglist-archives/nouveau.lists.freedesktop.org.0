Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346EA7537
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 22:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FFB898CA;
	Tue,  3 Sep 2019 20:47:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C2E898B7;
 Tue,  3 Sep 2019 20:47:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AB3F190C03E;
 Tue,  3 Sep 2019 20:47:54 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65A66100195C;
 Tue,  3 Sep 2019 20:47:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  3 Sep 2019 16:45:42 -0400
Message-Id: <20190903204645.25487-5-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 20:47:54 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 04/27] drm/dp_mst: Move test_calc_pbn_mode()
 into an actual selftest
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
Cc: Sean Paul <sean@poorly.run>, Thomas Hellstrom <thellstrom@vmware.com>,
 David Airlie <airlied@linux.ie>, Imre Deak <imre.deak@intel.com>,
 Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Deepak Rawat <drawat@vmware.com>,
 Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

WWVzLCBhcHBhcmVudGx5IHdlJ3ZlIGJlZW4gdGVzdGluZyB0aGlzIGZvciBldmVyeSBzaW5nbGUg
ZHJpdmVyIGxvYWQgZm9yCnF1aXRlIGEgbG9uZyB0aW1lIG5vdy4gQXQgbGVhc3QgdGhhdCBtZWFu
cyBvdXIgUEJOIGNhbGN1bGF0aW9uIGlzIHNvbGlkIQoKQW55d2F5LCBpbnRyb2R1Y2Ugc2VsZiB0
ZXN0cyBmb3IgTVNUIGFuZCBtb3ZlIHRoaXMgaW50byB0aGVyZS4KCkNjOiBKdXN0b24gTGkgPGp1
c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFy
cnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
ICAgICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9N
YWtlZmlsZSAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fbW9k
ZXNldF9zZWxmdGVzdHMuaCB8ICAxICsKIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21z
dF9oZWxwZXIuYyAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIC4uLi9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX21vZGVzZXRfY29tbW9uLmggICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA3MzhmMjYwZDRiMTUuLjZmN2Y0NDljYTEyYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC00Nyw3ICs0Nyw2IEBACiAg
Ki8KIHN0YXRpYyBib29sIGR1bXBfZHBfcGF5bG9hZF90YWJsZShzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwKIAkJCQkgIGNoYXIgKmJ1Zik7Ci1zdGF0aWMgaW50IHRlc3RfY2Fs
Y19wYm5fbW9kZSh2b2lkKTsKIAogc3RhdGljIHZvaWQgZHJtX2RwX21zdF90b3BvbG9neV9wdXRf
cG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KTsKIApAQCAtMzU2MSwzMCArMzU2MCw2
IEBAIGludCBkcm1fZHBfY2FsY19wYm5fbW9kZShpbnQgY2xvY2ssIGludCBicHApCiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9kcF9jYWxjX3Bibl9tb2RlKTsKIAotc3RhdGljIGludCB0ZXN0X2NhbGNf
cGJuX21vZGUodm9pZCkKLXsKLQlpbnQgcmV0OwotCXJldCA9IGRybV9kcF9jYWxjX3Bibl9tb2Rl
KDE1NDAwMCwgMzApOwotCWlmIChyZXQgIT0gNjg5KSB7Ci0JCURSTV9FUlJPUigiUEJOIGNhbGN1
bGF0aW9uIHRlc3QgZmFpbGVkIC0gY2xvY2sgJWQsIGJwcCAlZCwgZXhwZWN0ZWQgUEJOICVkLCBh
Y3R1YWwgUEJOICVkLlxuIiwKLQkJCQkxNTQwMDAsIDMwLCA2ODksIHJldCk7Ci0JCXJldHVybiAt
RUlOVkFMOwotCX0KLQlyZXQgPSBkcm1fZHBfY2FsY19wYm5fbW9kZSgyMzQwMDAsIDMwKTsKLQlp
ZiAocmV0ICE9IDEwNDcpIHsKLQkJRFJNX0VSUk9SKCJQQk4gY2FsY3VsYXRpb24gdGVzdCBmYWls
ZWQgLSBjbG9jayAlZCwgYnBwICVkLCBleHBlY3RlZCBQQk4gJWQsIGFjdHVhbCBQQk4gJWQuXG4i
LAotCQkJCTIzNDAwMCwgMzAsIDEwNDcsIHJldCk7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQly
ZXQgPSBkcm1fZHBfY2FsY19wYm5fbW9kZSgyOTcwMDAsIDI0KTsKLQlpZiAocmV0ICE9IDEwNjMp
IHsKLQkJRFJNX0VSUk9SKCJQQk4gY2FsY3VsYXRpb24gdGVzdCBmYWlsZWQgLSBjbG9jayAlZCwg
YnBwICVkLCBleHBlY3RlZCBQQk4gJWQsIGFjdHVhbCBQQk4gJWQuXG4iLAotCQkJCTI5NzAwMCwg
MjQsIDEwNjMsIHJldCk7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQlyZXR1cm4gMDsKLX0KLQog
Lyogd2Ugd2FudCB0byBraWNrIHRoZSBUWCBhZnRlciB3ZSd2ZSBhY2sgdGhlIHVwL2Rvd24gSVJR
cy4gKi8KIHN0YXRpYyB2b2lkIGRybV9kcF9tc3Rfa2lja190eChzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1ncikKIHsKQEAgLTQwMzMsOCArNDAwOCw2IEBAIGludCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21ncl9pbml0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAog
CWlmICghbWdyLT5wcm9wb3NlZF92Y3BpcykKIAkJcmV0dXJuIC1FTk9NRU07CiAJc2V0X2JpdCgw
LCAmbWdyLT5wYXlsb2FkX21hc2spOwotCWlmICh0ZXN0X2NhbGNfcGJuX21vZGUoKSA8IDApCi0J
CURSTV9FUlJPUigiTVNUIFBCTiBzZWxmLXRlc3QgZmFpbGVkXG4iKTsKIAogCW1zdF9zdGF0ZSA9
IGt6YWxsb2Moc2l6ZW9mKCptc3Rfc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAlpZiAobXN0X3N0YXRl
ID09IE5VTEwpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL01ha2VmaWxl
IGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9NYWtlZmlsZQppbmRleCBhYWU4OGY4YTAxNmMu
LmQyMTM3MzQyYjM3MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9NYWtl
ZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL01ha2VmaWxlCkBAIC0xLDYgKzEs
NiBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiB0ZXN0LWRybV9t
b2Rlc2V0LXkgOj0gdGVzdC1kcm1fbW9kZXNldF9jb21tb24ubyB0ZXN0LWRybV9wbGFuZV9oZWxw
ZXIubyBcCiAgICAgICAgICAgICAgICAgICAgICAgdGVzdC1kcm1fZm9ybWF0Lm8gdGVzdC1kcm1f
ZnJhbWVidWZmZXIubyBcCi0JCSAgICAgIHRlc3QtZHJtX2RhbWFnZV9oZWxwZXIubworCQkgICAg
ICB0ZXN0LWRybV9kYW1hZ2VfaGVscGVyLm8gdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5vCiAKIG9i
ai0kKENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1QpICs9IHRlc3QtZHJtX21tLm8gdGVzdC1kcm1f
bW9kZXNldC5vIHRlc3QtZHJtX2NtZGxpbmVfcGFyc2VyLm8KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zZWxmdGVzdHMvZHJtX21vZGVzZXRfc2VsZnRlc3RzLmggYi9kcml2ZXJzL2dwdS9k
cm0vc2VsZnRlc3RzL2RybV9tb2Rlc2V0X3NlbGZ0ZXN0cy5oCmluZGV4IDQ2NDc1Mzc0NjAxMy4u
ZGVjM2VlM2VjOTZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9t
b2Rlc2V0X3NlbGZ0ZXN0cy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX21v
ZGVzZXRfc2VsZnRlc3RzLmgKQEAgLTMyLDMgKzMyLDQgQEAgc2VsZnRlc3QoZGFtYWdlX2l0ZXJf
ZGFtYWdlX29uZV9pbnRlcnNlY3QsIGlndF9kYW1hZ2VfaXRlcl9kYW1hZ2Vfb25lX2ludGVyc2Vj
dCkKIHNlbGZ0ZXN0KGRhbWFnZV9pdGVyX2RhbWFnZV9vbmVfb3V0c2lkZSwgaWd0X2RhbWFnZV9p
dGVyX2RhbWFnZV9vbmVfb3V0c2lkZSkKIHNlbGZ0ZXN0KGRhbWFnZV9pdGVyX2RhbWFnZV9zcmNf
bW92ZWQsIGlndF9kYW1hZ2VfaXRlcl9kYW1hZ2Vfc3JjX21vdmVkKQogc2VsZnRlc3QoZGFtYWdl
X2l0ZXJfZGFtYWdlX25vdF92aXNpYmxlLCBpZ3RfZGFtYWdlX2l0ZXJfZGFtYWdlX25vdF92aXNp
YmxlKQorc2VsZnRlc3QoZHBfbXN0X2NhbGNfcGJuX21vZGUsIGlndF9kcF9tc3RfY2FsY19wYm5f
bW9kZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBf
bXN0X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3Rf
aGVscGVyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45YmFhNTE3
MTk4OGQKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3Qt
ZHJtX2RwX21zdF9oZWxwZXIuYwpAQCAtMCwwICsxLDM0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CisvKgorICogVGVzdCBjYXNlcyBmb3IgZm9yIHRoZSBEUk0g
RFAgTVNUIGhlbHBlcnMKKyAqLworCisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+
CisjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgorCisjaW5jbHVkZSAidGVzdC1kcm1fbW9kZXNl
dF9jb21tb24uaCIKKworaW50IGlndF9kcF9tc3RfY2FsY19wYm5fbW9kZSh2b2lkICppZ25vcmVk
KQoreworCWludCBwYm4sIGk7CisJY29uc3Qgc3RydWN0IHsKKwkJaW50IHJhdGU7CisJCWludCBi
cHA7CisJCWludCBleHBlY3RlZDsKKwl9IHRlc3RfcGFyYW1zW10gPSB7CisJCXsgMTU0MDAwLCAz
MCwgNjg5IH0sCisJCXsgMjM0MDAwLCAzMCwgMTA0NyB9LAorCQl7IDI5NzAwMCwgMjQsIDEwNjMg
fSwKKwl9OworCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUodGVzdF9wYXJhbXMpOyBpKysp
IHsKKwkJcGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUodGVzdF9wYXJhbXNbaV0ucmF0ZSwKKwkJ
CQkJICAgdGVzdF9wYXJhbXNbaV0uYnBwKTsKKwkJRkFJTChwYm4gIT0gdGVzdF9wYXJhbXNbaV0u
ZXhwZWN0ZWQsCisJCSAgICAgIkV4cGVjdGVkIFBCTiAlZCBmb3IgY2xvY2sgJWQgYnBwICVkLCBn
b3QgJWRcbiIsCisJCSAgICAgdGVzdF9wYXJhbXNbaV0uZXhwZWN0ZWQsIHRlc3RfcGFyYW1zW2ld
LnJhdGUsCisJCSAgICAgdGVzdF9wYXJhbXNbaV0uYnBwLCBwYm4pOworCX0KKworCXJldHVybiAw
OworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tb2Rl
c2V0X2NvbW1vbi5oIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tb2Rlc2V0
X2NvbW1vbi5oCmluZGV4IDhjNzZmMDljMTJkMS4uNTkwYmRhMzVhNjgzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21vZGVzZXRfY29tbW9uLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tb2Rlc2V0X2NvbW1vbi5oCkBAIC0z
OSw1ICszOSw2IEBAIGludCBpZ3RfZGFtYWdlX2l0ZXJfZGFtYWdlX29uZV9pbnRlcnNlY3Qodm9p
ZCAqaWdub3JlZCk7CiBpbnQgaWd0X2RhbWFnZV9pdGVyX2RhbWFnZV9vbmVfb3V0c2lkZSh2b2lk
ICppZ25vcmVkKTsKIGludCBpZ3RfZGFtYWdlX2l0ZXJfZGFtYWdlX3NyY19tb3ZlZCh2b2lkICpp
Z25vcmVkKTsKIGludCBpZ3RfZGFtYWdlX2l0ZXJfZGFtYWdlX25vdF92aXNpYmxlKHZvaWQgKmln
bm9yZWQpOworaW50IGlndF9kcF9tc3RfY2FsY19wYm5fbW9kZSh2b2lkICppZ25vcmVkKTsKIAog
I2VuZGlmCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
