Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E8A753B
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 22:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEDC89932;
	Tue,  3 Sep 2019 20:47:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA5E898B7;
 Tue,  3 Sep 2019 20:47:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD6543018FC5;
 Tue,  3 Sep 2019 20:47:55 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DEA11001B02;
 Tue,  3 Sep 2019 20:47:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  3 Sep 2019 16:45:43 -0400
Message-Id: <20190903204645.25487-6-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 20:47:55 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 05/27] drm/print: Add drm_err_printer()
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

QSBzaW1wbGUgY29udmllbmVuY2UgZnVuY3Rpb24gdGhhdCByZXR1cm5zIGEgZHJtX3ByaW50ZXIg
d2hpY2ggcHJpbnRzCnVzaW5nIHByX2VycigpCgpDaGFuZ2VzIHNpbmNlIHYxOgoqIE1ha2UgX19k
cm1fcHJpbnRmbl9lcnIoKSBtb3JlIGNvbnNpc3RlbnQgd2l0aCBEUk1fRVJST1IoKSAtIGRhbnZl
dAoKQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1y
ZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmludC5jIHwgIDYgKysrKysrCiBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgfCAxNyAr
KysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmludC5jCmluZGV4IGExN2M4YTE0ZGJhNC4uYWQzMDJkNzFlZWVlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlu
dC5jCkBAIC0xNDcsNiArMTQ3LDEyIEBAIHZvaWQgX19kcm1fcHJpbnRmbl9kZWJ1ZyhzdHJ1Y3Qg
ZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB2YV9mb3JtYXQgKnZhZikKIH0KIEVYUE9SVF9TWU1CT0wo
X19kcm1fcHJpbnRmbl9kZWJ1Zyk7CiAKK3ZvaWQgX19kcm1fcHJpbnRmbl9lcnIoc3RydWN0IGRy
bV9wcmludGVyICpwLCBzdHJ1Y3QgdmFfZm9ybWF0ICp2YWYpCit7CisJcHJfZXJyKCIqRVJST1Iq
ICVzICVwViIsIHAtPnByZWZpeCwgdmFmKTsKK30KK0VYUE9SVF9TWU1CT0woX19kcm1fcHJpbnRm
bl9lcnIpOworCiAvKioKICAqIGRybV9wdXRzIC0gcHJpbnQgYSBjb25zdCBzdHJpbmcgdG8gYSAm
ZHJtX3ByaW50ZXIgc3RyZWFtCiAgKiBAcDogdGhlICZkcm0gcHJpbnRlcgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAppbmRleCBh
NWQ2ZjJmM2U0MzAuLjExMjE2NWQzMTk1ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3By
aW50LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKQEAgLTgzLDYgKzgzLDcgQEAgdm9p
ZCBfX2RybV9wcmludGZuX3NlcV9maWxlKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IHZh
X2Zvcm1hdCAqdmFmKTsKIHZvaWQgX19kcm1fcHV0c19zZXFfZmlsZShzdHJ1Y3QgZHJtX3ByaW50
ZXIgKnAsIGNvbnN0IGNoYXIgKnN0cik7CiB2b2lkIF9fZHJtX3ByaW50Zm5faW5mbyhzdHJ1Y3Qg
ZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB2YV9mb3JtYXQgKnZhZik7CiB2b2lkIF9fZHJtX3ByaW50
Zm5fZGVidWcoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgdmFfZm9ybWF0ICp2YWYpOwor
dm9pZCBfX2RybV9wcmludGZuX2VycihzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB2YV9m
b3JtYXQgKnZhZik7CiAKIF9fcHJpbnRmKDIsIDMpCiB2b2lkIGRybV9wcmludGYoc3RydWN0IGRy
bV9wcmludGVyICpwLCBjb25zdCBjaGFyICpmLCAuLi4pOwpAQCAtMjI3LDYgKzIyOCwyMiBAQCBz
dGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fcHJpbnRlciBkcm1fZGVidWdfcHJpbnRlcihjb25zdCBj
aGFyICpwcmVmaXgpCiAJcmV0dXJuIHA7CiB9CiAKKy8qKgorICogZHJtX2Vycl9wcmludGVyIC0g
Y29uc3RydWN0IGEgJmRybV9wcmludGVyIHRoYXQgb3V0cHV0cyB0byBwcl9lcnIoKQorICogQHBy
ZWZpeDogZGVidWcgb3V0cHV0IHByZWZpeAorICoKKyAqIFJFVFVSTlM6CisgKiBUaGUgJmRybV9w
cmludGVyIG9iamVjdAorICovCitzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fcHJpbnRlciBkcm1f
ZXJyX3ByaW50ZXIoY29uc3QgY2hhciAqcHJlZml4KQoreworCXN0cnVjdCBkcm1fcHJpbnRlciBw
ID0geworCQkucHJpbnRmbiA9IF9fZHJtX3ByaW50Zm5fZXJyLAorCQkucHJlZml4ID0gcHJlZml4
CisJfTsKKwlyZXR1cm4gcDsKK30KKwogLyoKICAqIFRoZSBmb2xsb3dpbmcgY2F0ZWdvcmllcyBh
cmUgZGVmaW5lZDoKICAqCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
