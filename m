Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15A146E5D
	for <lists+nouveau@lfdr.de>; Thu, 23 Jan 2020 17:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4856FDD9;
	Thu, 23 Jan 2020 16:28:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6AF6FCD4;
 Thu, 23 Jan 2020 14:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0E28B25E;
 Thu, 23 Jan 2020 14:00:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Date: Thu, 23 Jan 2020 14:59:42 +0100
Message-Id: <20200123135943.24140-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jan 2020 16:28:43 +0000
Subject: [Nouveau] [PATCH v4 21/22] drm: Clean-up VBLANK-related callbacks
 in struct drm_driver
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWxsIG5vbi1sZWdhY3kgdXNlcnMgb2YgVkJMQU5LIGZ1bmN0aW9ucyBpbiBzdHJ1Y3QgZHJtX2Ry
aXZlciBoYXZlIGJlZW4KY29udmVydGVkIHRvIHVzZSB0aGUgcmVzcGVjdGl2ZSBpbnRlcmZhY2Vz
IGluIHN0cnVjdCBkcm1fY3J0Y19mdW5jcy4gVGhlCnJlbWFpbmluZyB1c2VycyBvZiBWQkxBTksg
Y2FsbGJhY2tzIGluIHN0cnVjdCBkcm1fZHJpdmVyIGFyZSBsZWdhY3kgZHJpdmVycwp3aXRoIHVz
ZXJzcGFjZSBtb2Rlc2V0dGluZy4KCkFsbCB1c2VycyBvZiBzdHJ1Y3QgZHJtX2RyaXZlci5nZXRf
c2Nhbm91dF9wb3NpdGlvbigpIGhhdmUgYmVlbgpjb252ZXJ0ZWQgdG8gdGhlIHJlc3BlY3RpdmUg
Q1JUQyBoZWxwZXIgZnVuY3Rpb24uIFJlbW92ZSB0aGUgY2FsbGJhY2sKZnJvbSBzdHJ1Y3QgZHJt
X2RyaXZlci4KClRoZXJlIGFyZSBubyB1c2VycyBsZWZ0IG9mIGdldF92YmxhbmtfdGltZXN0YW1w
KCksIHNvIHRoZSBjYWxsYmFjayBpcwpiZWluZyByZW1vdmVkLiBUaGUgb3RoZXIgVkJMQU5LIGNh
bGxiYWNrcyBhcmUgYmVpbmcgbW92ZWQgdG8gdGhlIGxlZ2FjeQpzZWN0aW9uIGF0IHRoZSBlbmQg
b2Ygc3RydWN0IGRybV9kcml2ZXIuCgpBbHNvIHJlbW92ZWQgaXMgZHJtX2NhbGNfdmJsdGltZXN0
YW1wX2Zyb21fc2Nhbm91dHBvcygpLiBDYWxsZXJzIG9mIHRoaXMKZnVuY3Rpb24gaGF2ZSBiZWVu
IGNvbnZlcnRlZCB0byB1c2UgdGhlIENSVEMgaW5zdGVhZC4KCnY0OgoJKiBtb3JlIHJlYWRhYmxl
IGNvZGUgZm9yIHNldHRpbmcgaGlnaF9wcmVjIChWaWxsZSwgSmFuaSkKdjI6CgkqIG1lcmdlIHdp
dGggcmVtb3ZhbCBvZiBzdHJ1Y3QgZHJtX2RyaXZlci5nZXRfc2Nhbm91dF9wb3NpdGlvbigpCgkq
IHJlbW92ZSBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zKCkKClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KVGVzdGVkLWJ5OiBZYW5u
aWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZibGFuay5jIHwgIDgxICsrKy0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9k
cnYuaCAgICAgICAgfCAxNTMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGlu
Y2x1ZGUvZHJtL2RybV92YmxhbmsuaCAgICAgfCAgIDQgLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggNmFh
OGY0M2Y3Mzc1Li45MGQ2MjQzMGE2YWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMTM4LDEwICsx
MzgsOSBAQCBzdGF0aWMgdTMyIF9fZ2V0X3ZibGFua19jb3VudGVyKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCiAJCWlmIChjcnRjLT5mdW5jcy0+Z2V0X3ZibGFu
a19jb3VudGVyKQogCQkJcmV0dXJuIGNydGMtPmZ1bmNzLT5nZXRfdmJsYW5rX2NvdW50ZXIoY3J0
Yyk7Ci0JfQotCi0JaWYgKGRldi0+ZHJpdmVyLT5nZXRfdmJsYW5rX2NvdW50ZXIpCisJfSBlbHNl
IGlmIChkZXYtPmRyaXZlci0+Z2V0X3ZibGFua19jb3VudGVyKSB7CiAJCXJldHVybiBkZXYtPmRy
aXZlci0+Z2V0X3ZibGFua19jb3VudGVyKGRldiwgcGlwZSk7CisJfQogCiAJcmV0dXJuIGRybV92
Ymxhbmtfbm9faHdfY291bnRlcihkZXYsIHBpcGUpOwogfQpAQCAtMzM0LDggKzMzMyw3IEBAIHU2
NCBkcm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291bnQoc3RydWN0IGRybV9jcnRjICpjcnRjKQog
CXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlXQVJOX09OQ0UoZHJtX2RlYnVnX2VuYWJsZWQoRFJN
X1VUX1ZCTCkgJiYKLQkJICAhY3J0Yy0+ZnVuY3MtPmdldF92YmxhbmtfdGltZXN0YW1wICYmCi0J
CSAgIWRldi0+ZHJpdmVyLT5nZXRfdmJsYW5rX3RpbWVzdGFtcCwKKwkJICAhY3J0Yy0+ZnVuY3Mt
PmdldF92YmxhbmtfdGltZXN0YW1wLAogCQkgICJUaGlzIGZ1bmN0aW9uIHJlcXVpcmVzIHN1cHBv
cnQgZm9yIGFjY3VyYXRlIHZibGFuayB0aW1lc3RhbXBzLiIpOwogCiAJc3Bpbl9sb2NrX2lycXNh
dmUoJmRldi0+dmJsYW5rX3RpbWVfbG9jaywgZmxhZ3MpOwpAQCAtMzU3LDEzICszNTUsMTEgQEAg
c3RhdGljIHZvaWQgX19kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNp
Z25lZCBpbnQgcGlwZSkKIAkJaWYgKFdBUk5fT04oIWNydGMpKQogCQkJcmV0dXJuOwogCi0JCWlm
IChjcnRjLT5mdW5jcy0+ZGlzYWJsZV92YmxhbmspIHsKKwkJaWYgKGNydGMtPmZ1bmNzLT5kaXNh
YmxlX3ZibGFuaykKIAkJCWNydGMtPmZ1bmNzLT5kaXNhYmxlX3ZibGFuayhjcnRjKTsKLQkJCXJl
dHVybjsKLQkJfQorCX0gZWxzZSB7CisJCWRldi0+ZHJpdmVyLT5kaXNhYmxlX3ZibGFuayhkZXYs
IHBpcGUpOwogCX0KLQotCWRldi0+ZHJpdmVyLT5kaXNhYmxlX3ZibGFuayhkZXYsIHBpcGUpOwog
fQogCiAvKgpAQCAtNTY1LDYyICs1NjEsNiBAQCB2b2lkIGRybV9jYWxjX3RpbWVzdGFtcGluZ19j
b25zdGFudHMoc3RydWN0IGRybV9jcnRjICpjcnRjLAogfQogRVhQT1JUX1NZTUJPTChkcm1fY2Fs
Y190aW1lc3RhbXBpbmdfY29uc3RhbnRzKTsKIAotLyoqCi0gKiBkcm1fY2FsY192Ymx0aW1lc3Rh
bXBfZnJvbV9zY2Fub3V0cG9zIC0gcHJlY2lzZSB2YmxhbmsgdGltZXN0YW1wIGhlbHBlcgotICog
QGRldjogRFJNIGRldmljZQotICogQHBpcGU6IGluZGV4IG9mIENSVEMgd2hvc2UgdmJsYW5rIHRp
bWVzdGFtcCB0byByZXRyaWV2ZQotICogQG1heF9lcnJvcjogRGVzaXJlZCBtYXhpbXVtIGFsbG93
YWJsZSBlcnJvciBpbiB0aW1lc3RhbXBzIChuYW5vc2VjcykKLSAqICAgICAgICAgICAgIE9uIHJl
dHVybiBjb250YWlucyB0cnVlIG1heGltdW0gZXJyb3Igb2YgdGltZXN0YW1wCi0gKiBAdmJsYW5r
X3RpbWU6IFBvaW50ZXIgdG8gdGltZSB3aGljaCBzaG91bGQgcmVjZWl2ZSB0aGUgdGltZXN0YW1w
Ci0gKiBAaW5fdmJsYW5rX2lycToKLSAqICAgICBUcnVlIHdoZW4gY2FsbGVkIGZyb20gZHJtX2Ny
dGNfaGFuZGxlX3ZibGFuaygpLiAgU29tZSBkcml2ZXJzCi0gKiAgICAgbmVlZCB0byBhcHBseSBz
b21lIHdvcmthcm91bmRzIGZvciBncHUtc3BlY2lmaWMgdmJsYW5rIGlycSBxdWlya3MKLSAqICAg
ICBpZiBmbGFnIGlzIHNldC4KLSAqCi0gKiBJbXBsZW1lbnRzIGNhbGN1bGF0aW9uIG9mIGV4YWN0
IHZibGFuayB0aW1lc3RhbXBzIGZyb20gZ2l2ZW4gZHJtX2Rpc3BsYXlfbW9kZQotICogdGltaW5n
cyBhbmQgY3VycmVudCB2aWRlbyBzY2Fub3V0IHBvc2l0aW9uIG9mIGEgQ1JUQy4gVGhpcyBjYW4g
YmUgZGlyZWN0bHkKLSAqIHVzZWQgYXMgdGhlICZkcm1fY3J0Y19mdW5jcy5nZXRfdmJsYW5rX3Rp
bWVzdGFtcCBpbXBsZW1lbnRhdGlvbiBvZiBhIGttcwotICogZHJpdmVyIGlmICZkcm1fY3J0Y19o
ZWxwZXJfZnVuY3MuZ2V0X3NjYW5vdXRfcG9zaXRpb24gb3IKLSAqICZkcm1fZHJpdmVyLmdldF9z
Y2Fub3V0X3Bvc2l0aW9uIGlzIGltcGxlbWVudGVkLgotICoKLSAqIFRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uIG9ubHkgaGFuZGxlcyBzdGFuZGFyZCB2aWRlbyBtb2Rlcy4gRm9yIGRvdWJsZSBz
Y2FuCi0gKiBhbmQgaW50ZXJsYWNlZCBtb2RlcyB0aGUgZHJpdmVyIGlzIHN1cHBvc2VkIHRvIGFk
anVzdCB0aGUgaGFyZHdhcmUgbW9kZQotICogKHRha2VuIGZyb20gJmRybV9jcnRjX3N0YXRlLmFk
anVzdGVkIG1vZGUgZm9yIGF0b21pYyBtb2Rlc2V0IGRyaXZlcnMpIHRvCi0gKiBtYXRjaCB0aGUg
c2Nhbm91dCBwb3NpdGlvbiByZXBvcnRlZC4KLSAqCi0gKiBOb3RlIHRoYXQgYXRvbWljIGRyaXZl
cnMgbXVzdCBjYWxsIGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMoKSBiZWZvcmUKLSAq
IGVuYWJsaW5nIGEgQ1JUQy4gVGhlIGF0b21pYyBoZWxwZXJzIGFscmVhZHkgdGFrZSBjYXJlIG9m
IHRoYXQgaW4KLSAqIGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9sZWdhY3lfbW9kZXNldF9zdGF0
ZSgpLgotICoKLSAqIFJldHVybnM6Ci0gKgotICogUmV0dXJucyB0cnVlIG9uIHN1Y2Nlc3MsIGFu
ZCBmYWxzZSBvbiBmYWlsdXJlLCBpLmUuIHdoZW4gbm8gYWNjdXJhdGUKLSAqIHRpbWVzdGFtcCBj
b3VsZCBiZSBhY3F1aXJlZC4KLSAqLwotYm9vbCBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9z
Y2Fub3V0cG9zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0JCQkJCSAgIHVuc2lnbmVkIGludCBw
aXBlLAotCQkJCQkgICBpbnQgKm1heF9lcnJvciwKLQkJCQkJICAga3RpbWVfdCAqdmJsYW5rX3Rp
bWUsCi0JCQkJCSAgIGJvb2wgaW5fdmJsYW5rX2lycSkKLXsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGM7Ci0KLQlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkp
Ci0JCXJldHVybiBmYWxzZTsKLQotCWNydGMgPSBkcm1fY3J0Y19mcm9tX2luZGV4KGRldiwgcGlw
ZSk7Ci0JaWYgKCFjcnRjKQotCQlyZXR1cm4gZmFsc2U7Ci0KLQlyZXR1cm4gZHJtX2NydGNfdmJs
YW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRlcm5hbChjcnRjLAotCQkJCQkJCQkg
ICAgbWF4X2Vycm9yLAotCQkJCQkJCQkgICAgdmJsYW5rX3RpbWUsCi0JCQkJCQkJCSAgICBpbl92
YmxhbmtfaXJxLAotCQkJCQkJCQkgICAgY3J0Yy0+aGVscGVyX3ByaXZhdGUtPmdldF9zY2Fub3V0
X3Bvc2l0aW9uLAotCQkJCQkJCQkgICAgZGV2LT5kcml2ZXItPmdldF9zY2Fub3V0X3Bvc2l0aW9u
KTsKLX0KLUVYUE9SVF9TWU1CT0woZHJtX2NhbGNfdmJsdGltZXN0YW1wX2Zyb21fc2Nhbm91dHBv
cyk7Ci0KIC8qKgogICogZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFt
cF9pbnRlcm5hbCAtIHByZWNpc2UgdmJsYW5rCiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZXN0YW1wIGhlbHBlcgpAQCAtODU2LDkg
Kzc5Niw2IEBAIGRybV9nZXRfbGFzdF92Ymx0aW1lc3RhbXAoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdW5zaWduZWQgaW50IHBpcGUsCiAKIAkJcmV0ID0gY3J0Yy0+ZnVuY3MtPmdldF92Ymxhbmtf
dGltZXN0YW1wKGNydGMsICZtYXhfZXJyb3IsCiAJCQkJCQkJdHZibGFuaywgaW5fdmJsYW5rX2ly
cSk7Ci0JfSBlbHNlIGlmIChkZXYtPmRyaXZlci0+Z2V0X3ZibGFua190aW1lc3RhbXAgJiYgbWF4
X2Vycm9yID4gMCkgewotCQlyZXQgPSBkZXYtPmRyaXZlci0+Z2V0X3ZibGFua190aW1lc3RhbXAo
ZGV2LCBwaXBlLCAmbWF4X2Vycm9yLAotCQkJCQkJCXR2YmxhbmssIGluX3ZibGFua19pcnEpOwog
CX0KIAogCS8qIEdQVSBoaWdoIHByZWNpc2lvbiB0aW1lc3RhbXAgcXVlcnkgdW5zdXBwb3J0ZWQg
b3IgZmFpbGVkLgpAQCAtMTA4MSw5ICsxMDE4LDExIEBAIHN0YXRpYyBpbnQgX19lbmFibGVfdmJs
YW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCiAJCWlmIChj
cnRjLT5mdW5jcy0+ZW5hYmxlX3ZibGFuaykKIAkJCXJldHVybiBjcnRjLT5mdW5jcy0+ZW5hYmxl
X3ZibGFuayhjcnRjKTsKKwl9IGVsc2UgaWYgKGRldi0+ZHJpdmVyLT5lbmFibGVfdmJsYW5rKSB7
CisJCXJldHVybiBkZXYtPmRyaXZlci0+ZW5hYmxlX3ZibGFuayhkZXYsIHBpcGUpOwogCX0KIAot
CXJldHVybiBkZXYtPmRyaXZlci0+ZW5hYmxlX3ZibGFuayhkZXYsIHBpcGUpOworCXJldHVybiAt
RUlOVkFMOwogfQogCiBzdGF0aWMgaW50IGRybV92YmxhbmtfZW5hYmxlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQpAQCAtMTg2OCw4ICsxODA3LDYgQEAgc3RhdGlj
IHZvaWQgZHJtX2hhbmRsZV92YmxhbmtfZXZlbnRzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCBwaXBlKQogCiAJaWYgKGNydGMgJiYgY3J0Yy0+ZnVuY3MtPmdldF92Ymxhbmtf
dGltZXN0YW1wKQogCQloaWdoX3ByZWMgPSB0cnVlOwotCWVsc2UgaWYgKGRldi0+ZHJpdmVyLT5n
ZXRfdmJsYW5rX3RpbWVzdGFtcCkKLQkJaGlnaF9wcmVjID0gdHJ1ZTsKIAogCXRyYWNlX2RybV92
YmxhbmtfZXZlbnQocGlwZSwgc2VxLCBub3csIGhpZ2hfcHJlYyk7CiB9CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggZDAwNDll
NTc4NmZjLi5lMjkwYjNhY2E2ZWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKQEAgLTI2OCwxNTYgKzI2OCw2IEBAIHN0cnVjdCBk
cm1fZHJpdmVyIHsKIAkgKi8KIAl2b2lkICgqcmVsZWFzZSkgKHN0cnVjdCBkcm1fZGV2aWNlICop
OwogCi0JLyoqCi0JICogQGdldF92YmxhbmtfY291bnRlcjoKLQkgKgotCSAqIERyaXZlciBjYWxs
YmFjayBmb3IgZmV0Y2hpbmcgYSByYXcgaGFyZHdhcmUgdmJsYW5rIGNvdW50ZXIgZm9yIHRoZQot
CSAqIENSVEMgc3BlY2lmaWVkIHdpdGggdGhlIHBpcGUgYXJndW1lbnQuICBJZiBhIGRldmljZSBk
b2Vzbid0IGhhdmUgYQotCSAqIGhhcmR3YXJlIGNvdW50ZXIsIHRoZSBkcml2ZXIgY2FuIHNpbXBs
eSBsZWF2ZSB0aGUgaG9vayBhcyBOVUxMLgotCSAqIFRoZSBEUk0gY29yZSB3aWxsIGFjY291bnQg
Zm9yIG1pc3NlZCB2YmxhbmsgZXZlbnRzIHdoaWxlIGludGVycnVwdHMKLQkgKiB3aGVyZSBkaXNh
YmxlZCBiYXNlZCBvbiBzeXN0ZW0gdGltZXN0YW1wcy4KLQkgKgotCSAqIFdyYXBhcm91bmQgaGFu
ZGxpbmcgYW5kIGxvc3Mgb2YgZXZlbnRzIGR1ZSB0byBtb2Rlc2V0dGluZyBpcyBkZWFsdAotCSAq
IHdpdGggaW4gdGhlIERSTSBjb3JlIGNvZGUsIGFzIGxvbmcgYXMgZHJpdmVycyBjYWxsCi0JICog
ZHJtX2NydGNfdmJsYW5rX29mZigpIGFuZCBkcm1fY3J0Y192Ymxhbmtfb24oKSB3aGVuIGRpc2Fi
bGluZyBvcgotCSAqIGVuYWJsaW5nIGEgQ1JUQy4KLQkgKgotCSAqIFRoaXMgaXMgZGVwcmVjYXRl
ZCBhbmQgc2hvdWxkIG5vdCBiZSB1c2VkIGJ5IG5ldyBkcml2ZXJzLgotCSAqIFVzZSAmZHJtX2Ny
dGNfZnVuY3MuZ2V0X3ZibGFua19jb3VudGVyIGluc3RlYWQuCi0JICoKLQkgKiBSZXR1cm5zOgot
CSAqCi0JICogUmF3IHZibGFuayBjb3VudGVyIHZhbHVlLgotCSAqLwotCXUzMiAoKmdldF92Ymxh
bmtfY291bnRlcikgKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKTsK
LQotCS8qKgotCSAqIEBlbmFibGVfdmJsYW5rOgotCSAqCi0JICogRW5hYmxlIHZibGFuayBpbnRl
cnJ1cHRzIGZvciB0aGUgQ1JUQyBzcGVjaWZpZWQgd2l0aCB0aGUgcGlwZQotCSAqIGFyZ3VtZW50
LgotCSAqCi0JICogVGhpcyBpcyBkZXByZWNhdGVkIGFuZCBzaG91bGQgbm90IGJlIHVzZWQgYnkg
bmV3IGRyaXZlcnMuCi0JICogVXNlICZkcm1fY3J0Y19mdW5jcy5lbmFibGVfdmJsYW5rIGluc3Rl
YWQuCi0JICoKLQkgKiBSZXR1cm5zOgotCSAqCi0JICogWmVybyBvbiBzdWNjZXNzLCBhcHByb3By
aWF0ZSBlcnJubyBpZiB0aGUgZ2l2ZW4gQGNydGMncyB2YmxhbmsKLQkgKiBpbnRlcnJ1cHQgY2Fu
bm90IGJlIGVuYWJsZWQuCi0JICovCi0JaW50ICgqZW5hYmxlX3ZibGFuaykgKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKTsKLQotCS8qKgotCSAqIEBkaXNhYmxlX3Zi
bGFuazoKLQkgKgotCSAqIERpc2FibGUgdmJsYW5rIGludGVycnVwdHMgZm9yIHRoZSBDUlRDIHNw
ZWNpZmllZCB3aXRoIHRoZSBwaXBlCi0JICogYXJndW1lbnQuCi0JICoKLQkgKiBUaGlzIGlzIGRl
cHJlY2F0ZWQgYW5kIHNob3VsZCBub3QgYmUgdXNlZCBieSBuZXcgZHJpdmVycy4KLQkgKiBVc2Ug
JmRybV9jcnRjX2Z1bmNzLmRpc2FibGVfdmJsYW5rIGluc3RlYWQuCi0JICovCi0Jdm9pZCAoKmRp
c2FibGVfdmJsYW5rKSAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUp
OwotCi0JLyoqCi0JICogQGdldF9zY2Fub3V0X3Bvc2l0aW9uOgotCSAqCi0JICogQ2FsbGVkIGJ5
IHZibGFuayB0aW1lc3RhbXBpbmcgY29kZS4KLQkgKgotCSAqIFJldHVybnMgdGhlIGN1cnJlbnQg
ZGlzcGxheSBzY2Fub3V0IHBvc2l0aW9uIGZyb20gYSBjcnRjLCBhbmQgYW4KLQkgKiBvcHRpb25h
bCBhY2N1cmF0ZSBrdGltZV9nZXQoKSB0aW1lc3RhbXAgb2Ygd2hlbiBwb3NpdGlvbiB3YXMKLQkg
KiBtZWFzdXJlZC4gTm90ZSB0aGF0IHRoaXMgaXMgYSBoZWxwZXIgY2FsbGJhY2sgd2hpY2ggaXMg
b25seSB1c2VkIGlmIGEKLQkgKiBkcml2ZXIgdXNlcyBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJv
bV9zY2Fub3V0cG9zKCkgZm9yIHRoZQotCSAqIEBnZXRfdmJsYW5rX3RpbWVzdGFtcCBjYWxsYmFj
ay4KLQkgKgotCSAqIFBhcmFtZXRlcnM6Ci0JICoKLQkgKiBkZXY6Ci0JICogICAgIERSTSBkZXZp
Y2UuCi0JICogcGlwZToKLQkgKiAgICAgSWQgb2YgdGhlIGNydGMgdG8gcXVlcnkuCi0JICogaW5f
dmJsYW5rX2lycToKLQkgKiAgICAgVHJ1ZSB3aGVuIGNhbGxlZCBmcm9tIGRybV9jcnRjX2hhbmRs
ZV92YmxhbmsoKS4gIFNvbWUgZHJpdmVycwotCSAqICAgICBuZWVkIHRvIGFwcGx5IHNvbWUgd29y
a2Fyb3VuZHMgZm9yIGdwdS1zcGVjaWZpYyB2YmxhbmsgaXJxIHF1aXJrcwotCSAqICAgICBpZiBm
bGFnIGlzIHNldC4KLQkgKiB2cG9zOgotCSAqICAgICBUYXJnZXQgbG9jYXRpb24gZm9yIGN1cnJl
bnQgdmVydGljYWwgc2Nhbm91dCBwb3NpdGlvbi4KLQkgKiBocG9zOgotCSAqICAgICBUYXJnZXQg
bG9jYXRpb24gZm9yIGN1cnJlbnQgaG9yaXpvbnRhbCBzY2Fub3V0IHBvc2l0aW9uLgotCSAqIHN0
aW1lOgotCSAqICAgICBUYXJnZXQgbG9jYXRpb24gZm9yIHRpbWVzdGFtcCB0YWtlbiBpbW1lZGlh
dGVseSBiZWZvcmUKLQkgKiAgICAgc2Nhbm91dCBwb3NpdGlvbiBxdWVyeS4gQ2FuIGJlIE5VTEwg
dG8gc2tpcCB0aW1lc3RhbXAuCi0JICogZXRpbWU6Ci0JICogICAgIFRhcmdldCBsb2NhdGlvbiBm
b3IgdGltZXN0YW1wIHRha2VuIGltbWVkaWF0ZWx5IGFmdGVyCi0JICogICAgIHNjYW5vdXQgcG9z
aXRpb24gcXVlcnkuIENhbiBiZSBOVUxMIHRvIHNraXAgdGltZXN0YW1wLgotCSAqIG1vZGU6Ci0J
ICogICAgIEN1cnJlbnQgZGlzcGxheSB0aW1pbmdzLgotCSAqCi0JICogUmV0dXJucyB2cG9zIGFz
IGEgcG9zaXRpdmUgbnVtYmVyIHdoaWxlIGluIGFjdGl2ZSBzY2Fub3V0IGFyZWEuCi0JICogUmV0
dXJucyB2cG9zIGFzIGEgbmVnYXRpdmUgbnVtYmVyIGluc2lkZSB2YmxhbmssIGNvdW50aW5nIHRo
ZSBudW1iZXIKLQkgKiBvZiBzY2FubGluZXMgdG8gZ28gdW50aWwgZW5kIG9mIHZibGFuaywgZS5n
LiwgLTEgbWVhbnMgIm9uZSBzY2FubGluZQotCSAqIHVudGlsIHN0YXJ0IG9mIGFjdGl2ZSBzY2Fu
b3V0IC8gZW5kIG9mIHZibGFuay4iCi0JICoKLQkgKiBSZXR1cm5zOgotCSAqCi0JICogVHJ1ZSBv
biBzdWNjZXNzLCBmYWxzZSBpZiBhIHJlbGlhYmxlIHNjYW5vdXQgcG9zaXRpb24gY291bnRlciBj
b3VsZAotCSAqIG5vdCBiZSByZWFkIG91dC4KLQkgKgotCSAqIFRoaXMgaXMgZGVwcmVjYXRlZCBh
bmQgc2hvdWxkIG5vdCBiZSB1c2VkIGJ5IG5ldyBkcml2ZXJzLgotCSAqIFVzZSAmZHJtX2NydGNf
aGVscGVyX2Z1bmNzLmdldF9zY2Fub3V0X3Bvc2l0aW9uIGluc3RlYWQuCi0JICovCi0JYm9vbCAo
KmdldF9zY2Fub3V0X3Bvc2l0aW9uKSAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IHBpcGUsCi0JCQkJICAgICAgYm9vbCBpbl92YmxhbmtfaXJxLCBpbnQgKnZwb3MsIGludCAq
aHBvcywKLQkJCQkgICAgICBrdGltZV90ICpzdGltZSwga3RpbWVfdCAqZXRpbWUsCi0JCQkJICAg
ICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwotCi0JLyoqCi0JICogQGdl
dF92YmxhbmtfdGltZXN0YW1wOgotCSAqCi0JICogQ2FsbGVkIGJ5IGRybV9nZXRfbGFzdF92Ymx0
aW1lc3RhbXAoKS4gU2hvdWxkIHJldHVybiBhIHByZWNpc2UKLQkgKiB0aW1lc3RhbXAgd2hlbiB0
aGUgbW9zdCByZWNlbnQgVkJMQU5LIGludGVydmFsIGVuZGVkIG9yIHdpbGwgZW5kLgotCSAqCi0J
ICogU3BlY2lmaWNhbGx5LCB0aGUgdGltZXN0YW1wIGluIEB2YmxhbmtfdGltZSBzaG91bGQgY29y
cmVzcG9uZCBhcwotCSAqIGNsb3NlbHkgYXMgcG9zc2libGUgdG8gdGhlIHRpbWUgd2hlbiB0aGUg
Zmlyc3QgdmlkZW8gc2NhbmxpbmUgb2YKLQkgKiB0aGUgdmlkZW8gZnJhbWUgYWZ0ZXIgdGhlIGVu
ZCBvZiBWQkxBTksgd2lsbCBzdGFydCBzY2FubmluZyBvdXQsCi0JICogdGhlIHRpbWUgaW1tZWRp
YXRlbHkgYWZ0ZXIgZW5kIG9mIHRoZSBWQkxBTksgaW50ZXJ2YWwuIElmIHRoZQotCSAqIEBjcnRj
IGlzIGN1cnJlbnRseSBpbnNpZGUgVkJMQU5LLCB0aGlzIHdpbGwgYmUgYSB0aW1lIGluIHRoZSBm
dXR1cmUuCi0JICogSWYgdGhlIEBjcnRjIGlzIGN1cnJlbnRseSBzY2FubmluZyBvdXQgYSBmcmFt
ZSwgdGhpcyB3aWxsIGJlIHRoZQotCSAqIHBhc3Qgc3RhcnQgdGltZSBvZiB0aGUgY3VycmVudCBz
Y2Fub3V0LiBUaGlzIGlzIG1lYW50IHRvIGFkaGVyZQotCSAqIHRvIHRoZSBPcGVuTUwgT01MX3N5
bmNfY29udHJvbCBleHRlbnNpb24gc3BlY2lmaWNhdGlvbi4KLQkgKgotCSAqIFBhcmFtdGVyczoK
LQkgKgotCSAqIGRldjoKLQkgKiAgICAgZGV2IERSTSBkZXZpY2UgaGFuZGxlLgotCSAqIHBpcGU6
Ci0JICogICAgIGNydGMgZm9yIHdoaWNoIHRpbWVzdGFtcCBzaG91bGQgYmUgcmV0dXJuZWQuCi0J
ICogbWF4X2Vycm9yOgotCSAqICAgICBNYXhpbXVtIGFsbG93YWJsZSB0aW1lc3RhbXAgZXJyb3Ig
aW4gbmFub3NlY29uZHMuCi0JICogICAgIEltcGxlbWVudGF0aW9uIHNob3VsZCBzdHJpdmUgdG8g
cHJvdmlkZSB0aW1lc3RhbXAKLQkgKiAgICAgd2l0aCBhbiBlcnJvciBvZiBhdCBtb3N0IG1heF9l
cnJvciBuYW5vc2Vjb25kcy4KLQkgKiAgICAgUmV0dXJucyB0cnVlIHVwcGVyIGJvdW5kIG9uIGVy
cm9yIGZvciB0aW1lc3RhbXAuCi0JICogdmJsYW5rX3RpbWU6Ci0JICogICAgIFRhcmdldCBsb2Nh
dGlvbiBmb3IgcmV0dXJuZWQgdmJsYW5rIHRpbWVzdGFtcC4KLQkgKiBpbl92YmxhbmtfaXJxOgot
CSAqICAgICBUcnVlIHdoZW4gY2FsbGVkIGZyb20gZHJtX2NydGNfaGFuZGxlX3ZibGFuaygpLiAg
U29tZSBkcml2ZXJzCi0JICogICAgIG5lZWQgdG8gYXBwbHkgc29tZSB3b3JrYXJvdW5kcyBmb3Ig
Z3B1LXNwZWNpZmljIHZibGFuayBpcnEgcXVpcmtzCi0JICogICAgIGlmIGZsYWcgaXMgc2V0Lgot
CSAqCi0JICogUmV0dXJuczoKLQkgKgotCSAqIFRydWUgb24gc3VjY2VzcywgZmFsc2Ugb24gZmFp
bHVyZSwgd2hpY2ggbWVhbnMgdGhlIGNvcmUgc2hvdWxkCi0JICogZmFsbGJhY2sgdG8gYSBzaW1w
bGUgdGltZXN0YW1wIHRha2VuIGluIGRybV9jcnRjX2hhbmRsZV92YmxhbmsoKS4KLQkgKgotCSAq
IEZJWE1FOgotCSAqCi0JICogV2Ugc2hvdWxkIG1vdmUgdGhpcyBob29rIHRvICZzdHJ1Y3QgZHJt
X2NydGNfZnVuY3MgbGlrZSBhbGwgdGhlIG90aGVyCi0JICogdmJsYW5rIGhvb2tzLgotCSAqLwot
CWJvb2wgKCpnZXRfdmJsYW5rX3RpbWVzdGFtcCkgKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCBwaXBlLAotCQkJCSAgICAgaW50ICptYXhfZXJyb3IsCi0JCQkJICAgICBrdGlt
ZV90ICp2YmxhbmtfdGltZSwKLQkJCQkgICAgIGJvb2wgaW5fdmJsYW5rX2lycSk7Ci0KIAkvKioK
IAkgKiBAaXJxX2hhbmRsZXI6CiAJICoKQEAgLTc3Miw2ICs2MjIsOSBAQCBzdHJ1Y3QgZHJtX2Ry
aXZlciB7CiAJaW50ICgqZG1hX2lvY3RsKSAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpOwogCWludCAoKmRtYV9xdWllc2NlbnQp
IChzdHJ1Y3QgZHJtX2RldmljZSAqKTsKIAlpbnQgKCpjb250ZXh0X2R0b3IpIChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBpbnQgY29udGV4dCk7CisJdTMyICgqZ2V0X3ZibGFua19jb3VudGVyKShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSk7CisJaW50ICgqZW5hYmxl
X3ZibGFuaykoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpOworCXZv
aWQgKCpkaXNhYmxlX3ZibGFuaykoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50
IHBpcGUpOwogCWludCBkZXZfcHJpdl9zaXplOwogfTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3ZibGFuay5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCmluZGV4IDIyYTljODc0
NDM5Yi4uODdmY2Y0MDM0ZDFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fdmJsYW5rLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCkBAIC0yMjksMTAgKzIyOSw2IEBAIHU2NCBk
cm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291bnQoc3RydWN0IGRybV9jcnRjICpjcnRjKTsKIHZv
aWQgZHJtX3ZibGFua19yZXN0b3JlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGlu
dCBwaXBlKTsKIHZvaWQgZHJtX2NydGNfdmJsYW5rX3Jlc3RvcmUoc3RydWN0IGRybV9jcnRjICpj
cnRjKTsKIAotYm9vbCBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCi0JCQkJCSAgIHVuc2lnbmVkIGludCBwaXBlLCBpbnQgKm1heF9l
cnJvciwKLQkJCQkJICAga3RpbWVfdCAqdmJsYW5rX3RpbWUsCi0JCQkJCSAgIGJvb2wgaW5fdmJs
YW5rX2lycSk7CiB2b2lkIGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAogCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1v
ZGUpOwogd2FpdF9xdWV1ZV9oZWFkX3QgKmRybV9jcnRjX3ZibGFua193YWl0cXVldWUoc3RydWN0
IGRybV9jcnRjICpjcnRjKTsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
