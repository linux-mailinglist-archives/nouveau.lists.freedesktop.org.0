Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE59143199
	for <lists+nouveau@lfdr.de>; Mon, 20 Jan 2020 19:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF09A6EAB8;
	Mon, 20 Jan 2020 18:41:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3FD6E7F5;
 Mon, 20 Jan 2020 08:23:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8417AB244;
 Mon, 20 Jan 2020 08:23:41 +0000 (UTC)
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
Date: Mon, 20 Jan 2020 09:23:06 +0100
Message-Id: <20200120082314.14756-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120082314.14756-1-tzimmermann@suse.de>
References: <20200120082314.14756-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jan 2020 18:41:18 +0000
Subject: [Nouveau] [PATCH v3 14/22] drm/stm: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
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
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIGNhbGxiYWNrIHN0cnVjdCBkcm1fZHJpdmVyLmdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgaXMg
ZGVwcmVjYXRlZCBpbgpmYXZvciBvZiBzdHJ1Y3QgZHJtX2NydGNfaGVscGVyX2Z1bmNzLmdldF9z
Y2Fub3V0X3Bvc2l0aW9uKCkuIENvbnZlcnQgc3RtCm92ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KVGVzdGVkLWJ5OiBZYW5uaWNrIEZl
cnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Ry
di5jICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgNjUgKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oIHwg
IDUgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vc3RtL2Rydi5jCmluZGV4IDVhOWY5YWNhOGJjMi4uNDg2OTg1NjA0MTA5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2
LmMKQEAgLTcyLDcgKzcyLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRydl9kcml2ZXIg
PSB7CiAJLmdlbV9wcmltZV92bWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKIAkuZ2VtX3By
aW1lX3Z1bm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1hcCwKIAkuZ2VtX3ByaW1lX21tYXAg
PSBkcm1fZ2VtX2NtYV9wcmltZV9tbWFwLAotCS5nZXRfc2Nhbm91dF9wb3NpdGlvbiA9IGx0ZGNf
Y3J0Y19zY2Fub3V0cG9zLAogCS5nZXRfdmJsYW5rX3RpbWVzdGFtcCA9IGRybV9jYWxjX3ZibHRp
bWVzdGFtcF9mcm9tX3NjYW5vdXRwb3MsCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmluZGV4IGMyODE1ZThh
ZTFkYS4uOGI2ZDFhMjI1MmUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtNjM2LDM4ICs2MzYsMTMgQEAg
c3RhdGljIHZvaWQgbHRkY19jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJfQogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyBsdGRj
X2NydGNfaGVscGVyX2Z1bmNzID0gewotCS5tb2RlX3ZhbGlkID0gbHRkY19jcnRjX21vZGVfdmFs
aWQsCi0JLm1vZGVfZml4dXAgPSBsdGRjX2NydGNfbW9kZV9maXh1cCwKLQkubW9kZV9zZXRfbm9m
YiA9IGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiLAotCS5hdG9taWNfZmx1c2ggPSBsdGRjX2NydGNf
YXRvbWljX2ZsdXNoLAotCS5hdG9taWNfZW5hYmxlID0gbHRkY19jcnRjX2F0b21pY19lbmFibGUs
Ci0JLmF0b21pY19kaXNhYmxlID0gbHRkY19jcnRjX2F0b21pY19kaXNhYmxlLAotfTsKLQotc3Rh
dGljIGludCBsdGRjX2NydGNfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCi17
Ci0Jc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwotCi0JRFJN
X0RFQlVHX0RSSVZFUigiXG4iKTsKLQlyZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJf
TElFKTsKLQotCXJldHVybiAwOwotfQotCi1zdGF0aWMgdm9pZCBsdGRjX2NydGNfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IGRybV9jcnRjICpjcnRjKQotewotCXN0cnVjdCBsdGRjX2RldmljZSAqbGRl
diA9IGNydGNfdG9fbHRkYyhjcnRjKTsKLQotCURSTV9ERUJVR19EUklWRVIoIlxuIik7Ci0JcmVn
X2NsZWFyKGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfTElFKTsKLX0KLQotYm9vbCBsdGRjX2Ny
dGNfc2Nhbm91dHBvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwgdW5zaWduZWQgaW50IHBpcGUs
Ci0JCQkgIGJvb2wgaW5fdmJsYW5rX2lycSwgaW50ICp2cG9zLCBpbnQgKmhwb3MsCi0JCQkgIGt0
aW1lX3QgKnN0aW1lLCBrdGltZV90ICpldGltZSwKLQkJCSAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUpCitzdGF0aWMgYm9vbCBsdGRjX2NydGNfZ2V0X3NjYW5vdXRfcG9zaXRp
b24oc3RydWN0IGRybV9jcnRjICpjcnRjLAorCQkJCQkgICBib29sIGluX3ZibGFua19pcnEsCisJ
CQkJCSAgIGludCAqdnBvcywgaW50ICpocG9zLAorCQkJCQkgICBrdGltZV90ICpzdGltZSwga3Rp
bWVfdCAqZXRpbWUsCisJCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
KQogeworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2OwogCXN0cnVjdCBsdGRj
X2RldmljZSAqbGRldiA9IGRkZXYtPmRldl9wcml2YXRlOwogCWludCBsaW5lLCB2YWN0aXZlX3N0
YXJ0LCB2YWN0aXZlX2VuZCwgdnRvdGFsOwogCkBAIC03MTAsNiArNjg1LDM0IEBAIGJvb2wgbHRk
Y19jcnRjX3NjYW5vdXRwb3Moc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsIHVuc2lnbmVkIGludCBw
aXBlLAogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hl
bHBlcl9mdW5jcyBsdGRjX2NydGNfaGVscGVyX2Z1bmNzID0geworCS5tb2RlX3ZhbGlkID0gbHRk
Y19jcnRjX21vZGVfdmFsaWQsCisJLm1vZGVfZml4dXAgPSBsdGRjX2NydGNfbW9kZV9maXh1cCwK
KwkubW9kZV9zZXRfbm9mYiA9IGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiLAorCS5hdG9taWNfZmx1
c2ggPSBsdGRjX2NydGNfYXRvbWljX2ZsdXNoLAorCS5hdG9taWNfZW5hYmxlID0gbHRkY19jcnRj
X2F0b21pY19lbmFibGUsCisJLmF0b21pY19kaXNhYmxlID0gbHRkY19jcnRjX2F0b21pY19kaXNh
YmxlLAorCS5nZXRfc2Nhbm91dF9wb3NpdGlvbiA9IGx0ZGNfY3J0Y19nZXRfc2Nhbm91dF9wb3Np
dGlvbiwKK307CisKK3N0YXRpYyBpbnQgbHRkY19jcnRjX2VuYWJsZV92Ymxhbmsoc3RydWN0IGRy
bV9jcnRjICpjcnRjKQoreworCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRk
YyhjcnRjKTsKKworCURSTV9ERUJVR19EUklWRVIoIlxuIik7CisJcmVnX3NldChsZGV2LT5yZWdz
LCBMVERDX0lFUiwgSUVSX0xJRSk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHZvaWQgbHRk
Y19jcnRjX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKK3sKKwlzdHJ1Y3Qg
bHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3RvX2x0ZGMoY3J0Yyk7CisKKwlEUk1fREVCVUdfRFJJ
VkVSKCJcbiIpOworCXJlZ19jbGVhcihsZGV2LT5yZWdzLCBMVERDX0lFUiwgSUVSX0xJRSk7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MgbHRkY19jcnRjX2Z1bmNzID0g
ewogCS5kZXN0cm95ID0gZHJtX2NydGNfY2xlYW51cCwKIAkuc2V0X2NvbmZpZyA9IGRybV9hdG9t
aWNfaGVscGVyX3NldF9jb25maWcsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oCmluZGV4IGExYWQwYWUzYjAwNi4uYzU0
NjdkNzRlNzA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaApAQCAtMzksMTEgKzM5LDYgQEAgc3RydWN0IGx0ZGNf
ZGV2aWNlIHsKIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3VzcGVuZF9zdGF0ZTsKIH07CiAK
LWJvb2wgbHRkY19jcnRjX3NjYW5vdXRwb3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IHBpcGUsCi0JCQkgIGJvb2wgaW5fdmJsYW5rX2lycSwgaW50ICp2cG9zLCBpbnQgKmhw
b3MsCi0JCQkgIGt0aW1lX3QgKnN0aW1lLCBrdGltZV90ICpldGltZSwKLQkJCSAgY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwotCiBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZGV2KTsKIHZvaWQgbHRkY191bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYp
Owogdm9pZCBsdGRjX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpOwotLSAKMi4yNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
