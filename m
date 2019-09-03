Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2297A753E
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 22:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F53D89948;
	Tue,  3 Sep 2019 20:48:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7D089948;
 Tue,  3 Sep 2019 20:47:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1162718F3520;
 Tue,  3 Sep 2019 20:47:59 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CCCA1001B07;
 Tue,  3 Sep 2019 20:47:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  3 Sep 2019 16:45:44 -0400
Message-Id: <20190903204645.25487-7-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 03 Sep 2019 20:47:59 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 06/27] drm/dp_mst: Combine redundant cases in
 drm_dp_encode_sideband_req()
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

Tm90aWNlZCB0aGlzIHdoaWxlIHdvcmtpbmcgb24gYWRkaW5nIGEgZHJtX2RwX2RlY29kZV9zaWRl
YmFuZF9yZXEoKS4KRFBfUE9XRVJfRE9XTl9QSFkvRFBfUE9XRVJfVVBfUEhZIGJvdGggdXNlIHRo
ZSBzYW1lIHN0cnVjdCwgc28gd2UgY2FuCmp1c3QgY29tYmluZSB0aGVpciBjYXNlcy4KClNpZ25l
ZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwu
Y29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
d2VudGxhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDZmN2Y0NDlj
YTEyYi4uMWM4NjI3NDljYjYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
QEAgLTI3MSw2ICsyNzEsOCBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfZW5jb2RlX3NpZGViYW5kX3Jl
cShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqcmVxLAogCiAJc3dpdGNoIChy
ZXEtPnJlcV90eXBlKSB7CiAJY2FzZSBEUF9FTlVNX1BBVEhfUkVTT1VSQ0VTOgorCWNhc2UgRFBf
UE9XRVJfRE9XTl9QSFk6CisJY2FzZSBEUF9QT1dFUl9VUF9QSFk6CiAJCWJ1ZltpZHhdID0gKHJl
cS0+dS5wb3J0X251bS5wb3J0X251bWJlciAmIDB4ZikgPDwgNDsKIAkJaWR4Kys7CiAJCWJyZWFr
OwpAQCAtMzU4LDEyICszNjAsNiBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfZW5jb2RlX3NpZGViYW5k
X3JlcShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqcmVxLAogCQltZW1jcHko
JmJ1ZltpZHhdLCByZXEtPnUuaTJjX3dyaXRlLmJ5dGVzLCByZXEtPnUuaTJjX3dyaXRlLm51bV9i
eXRlcyk7CiAJCWlkeCArPSByZXEtPnUuaTJjX3dyaXRlLm51bV9ieXRlczsKIAkJYnJlYWs7Ci0K
LQljYXNlIERQX1BPV0VSX0RPV05fUEhZOgotCWNhc2UgRFBfUE9XRVJfVVBfUEhZOgotCQlidWZb
aWR4XSA9IChyZXEtPnUucG9ydF9udW0ucG9ydF9udW1iZXIgJiAweGYpIDw8IDQ7Ci0JCWlkeCsr
OwotCQlicmVhazsKIAl9CiAJcmF3LT5jdXJfbGVuID0gaWR4OwogfQotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
