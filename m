Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFE27DC13
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 00:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4536E1F8;
	Tue, 29 Sep 2020 22:31:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118F6E1F9
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 22:31:49 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601418708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YkwAgkWJX6QtzYei4hnlo1IwT6pmSKXCDsQMxV6UrsY=;
 b=HSVGdASkINHCgITuqAFMQ8CmahMd9uNzK28zQETI2FqHfDb4wWWSW49Oj50kex0vmXEaJO
 VqLM6yOHrpNH0Pt5saabJlGVDZ+QlO7m5Af0YsNrJnI+7HCAVPnDsds6M9DLTqxflomznK
 HZzhEkpb6CXKiwFeoMe8mEQM/nBhWvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-KEqnqiKPMZi0DBO_wJHiSA-1; Tue, 29 Sep 2020 18:31:44 -0400
X-MC-Unique: KEqnqiKPMZi0DBO_wJHiSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 144AE1018F63;
 Tue, 29 Sep 2020 22:31:43 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-121-117.rdu2.redhat.com [10.10.121.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60BD355775;
 Tue, 29 Sep 2020 22:31:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 29 Sep 2020 18:31:31 -0400
Message-Id: <20200929223132.333453-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: [Nouveau] [PATCH v2 1/2] drm/nouveau/kms/nv50-: Get rid of bogus
 nouveau_conn_mode_valid()
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VmlsbGUgYWxzbyBwb2ludGVkIG91dCB0aGF0IEkgZ290IGEgbG90IG9mIHRoZSBsb2dpYyBoZXJl
IHdyb25nIGFzIHdlbGwsIHdob29wcy4KV2hpbGUgSSBkb24ndCB0aGluayBhbnlvbmUncyBsaWtl
bHkgdXNpbmcgM0Qgb3V0cHV0IHdpdGggbm91dmVhdSwgdGhlIG5leHQgcGF0Y2gKd2lsbCBtYWtl
IG5vdXZlYXVfY29ubl9tb2RlX3ZhbGlkKCkgbWFrZSBhIGxvdCBsZXNzIHNlbnNlLiBTbywgbGV0
J3MganVzdCBnZXQKcmlkIG9mIGl0IGFuZCBvcGVuLWNvZGUgaXQgbGlrZSBiZWZvcmUsIHdoaWxl
IHRha2luZyBjYXJlIHRvIG1vdmUgdGhlIDNEIGZyYW1lCnBhY2tpbmcgY2FsY3VsYXRpb25zIG9u
IHRoZSBkb3QgY2xvY2sgaW50byB0aGUgcmlnaHQgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpGaXhlczogZDZhOWVmZWNlNzI0ICgiZHJtL25vdXZl
YXUva21zL252NTAtOiBTaGFyZSBEUCBTU1QgbW9kZV92YWxpZCgpIGhhbmRsaW5nIHdpdGggTVNU
IikKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS44KwotLS0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgfCAzNiArKysrKystLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyAgICAgICAgfCAxNiArKysrKystLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKaW5kZXggNDlkZDBjYmMz
MzJmLi42ZjIxZjM2NzE5ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9j
b25uZWN0b3IuYwpAQCAtMTAyMywyOSArMTAyMyw2IEBAIGdldF90bWRzX2xpbmtfYmFuZHdpZHRo
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJCXJldHVybiAxMTIwMDAgKiBkdWFs
bGlua19zY2FsZTsKIH0KIAotZW51bSBkcm1fbW9kZV9zdGF0dXMKLW5vdXZlYXVfY29ubl9tb2Rl
X2Nsb2NrX3ZhbGlkKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAotCQkJICAg
ICAgY29uc3QgdW5zaWduZWQgbWluX2Nsb2NrLAotCQkJICAgICAgY29uc3QgdW5zaWduZWQgbWF4
X2Nsb2NrLAotCQkJICAgICAgdW5zaWduZWQgaW50ICpjbG9ja19vdXQpCi17Ci0JdW5zaWduZWQg
aW50IGNsb2NrID0gbW9kZS0+Y2xvY2s7Ci0KLQlpZiAoKG1vZGUtPmZsYWdzICYgRFJNX01PREVf
RkxBR18zRF9NQVNLKSA9PQotCSAgICBEUk1fTU9ERV9GTEFHXzNEX0ZSQU1FX1BBQ0tJTkcpCi0J
CWNsb2NrICo9IDI7Ci0KLQlpZiAoY2xvY2sgPCBtaW5fY2xvY2spCi0JCXJldHVybiBNT0RFX0NM
T0NLX0xPVzsKLQlpZiAoY2xvY2sgPiBtYXhfY2xvY2spCi0JCXJldHVybiBNT0RFX0NMT0NLX0hJ
R0g7Ci0KLQlpZiAoY2xvY2tfb3V0KQotCQkqY2xvY2tfb3V0ID0gY2xvY2s7Ci0KLQlyZXR1cm4g
TU9ERV9PSzsKLX0KLQogc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzCiBub3V2ZWF1X2Nvbm5l
Y3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkgICAg
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQpAQCAtMTA1Myw3ICsxMDMwLDcgQEAgbm91
dmVhdV9jb25uZWN0b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAogCXN0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqbnZfY29ubmVjdG9yID0gbm91dmVhdV9jb25u
ZWN0b3IoY29ubmVjdG9yKTsKIAlzdHJ1Y3Qgbm91dmVhdV9lbmNvZGVyICpudl9lbmNvZGVyID0g
bnZfY29ubmVjdG9yLT5kZXRlY3RlZF9lbmNvZGVyOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlciA9IHRvX2RybV9lbmNvZGVyKG52X2VuY29kZXIpOwotCXVuc2lnbmVkIG1pbl9jbG9jayA9
IDI1MDAwLCBtYXhfY2xvY2sgPSBtaW5fY2xvY2s7CisJdW5zaWduZWQgaW50IG1pbl9jbG9jayA9
IDI1MDAwLCBtYXhfY2xvY2sgPSBtaW5fY2xvY2ssIGNsb2NrID0gbW9kZS0+Y2xvY2s7CiAKIAlz
d2l0Y2ggKG52X2VuY29kZXItPmRjYi0+dHlwZSkgewogCWNhc2UgRENCX09VVFBVVF9MVkRTOgpA
QCAtMTA4Miw4ICsxMDU5LDE1IEBAIG5vdXZlYXVfY29ubmVjdG9yX21vZGVfdmFsaWQoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJcmV0dXJuIE1PREVfQkFEOwogCX0KIAotCXJl
dHVybiBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9ja192YWxpZChtb2RlLCBtaW5fY2xvY2ssIG1heF9j
bG9jaywKLQkJCQkJICAgICBOVUxMKTsKKwlpZiAoKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxB
R18zRF9NQVNLKSA9PSBEUk1fTU9ERV9GTEFHXzNEX0ZSQU1FX1BBQ0tJTkcpCisJCWNsb2NrICo9
IDI7CisKKwlpZiAoY2xvY2sgPCBtaW5fY2xvY2spCisJCXJldHVybiBNT0RFX0NMT0NLX0xPVzsK
KwlpZiAoY2xvY2sgPiBtYXhfY2xvY2spCisJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7CisKKwly
ZXR1cm4gTU9ERV9PSzsKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKaW5kZXggN2I2NDBlMDViZDRjLi45M2UzNzUxYWQ3ZjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKQEAgLTIzMiwxMiArMjMyLDE0IEBA
IG52NTBfZHBfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkg
ICB1bnNpZ25lZCAqb3V0X2Nsb2NrKQogewogCWNvbnN0IHVuc2lnbmVkIG1pbl9jbG9jayA9IDI1
MDAwOwotCXVuc2lnbmVkIG1heF9jbG9jaywgZHNfY2xvY2ssIGNsb2NrOwotCWVudW0gZHJtX21v
ZGVfc3RhdHVzIHJldDsKKwl1bnNpZ25lZCBtYXhfY2xvY2ssIGRzX2Nsb2NrLCBjbG9jayA9IG1v
ZGUtPmNsb2NrOwogCiAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0Ug
JiYgIW91dHAtPmNhcHMuZHBfaW50ZXJsYWNlKQogCQlyZXR1cm4gTU9ERV9OT19JTlRFUkxBQ0U7
CiAKKwlpZiAoKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR18zRF9NQVNLKSA9PSBEUk1fTU9E
RV9GTEFHXzNEX0ZSQU1FX1BBQ0tJTkcpCisJCWNsb2NrICo9IDI7CisKIAltYXhfY2xvY2sgPSBv
dXRwLT5kcC5saW5rX25yICogb3V0cC0+ZHAubGlua19idzsKIAlkc19jbG9jayA9IGRybV9kcF9k
b3duc3RyZWFtX21heF9kb3RjbG9jayhvdXRwLT5kcC5kcGNkLAogCQkJCQkJICBvdXRwLT5kcC5k
b3duc3RyZWFtX3BvcnRzKTsKQEAgLTI0NSw5ICsyNDcsMTMgQEAgbnY1MF9kcF9tb2RlX3ZhbGlk
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCW1heF9jbG9jayA9IG1pbihtYXhf
Y2xvY2ssIGRzX2Nsb2NrKTsKIAogCWNsb2NrID0gbW9kZS0+Y2xvY2sgKiAoY29ubmVjdG9yLT5k
aXNwbGF5X2luZm8uYnBjICogMykgLyAxMDsKLQlyZXQgPSBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9j
a192YWxpZChtb2RlLCBtaW5fY2xvY2ssIG1heF9jbG9jaywKLQkJCQkJICAgICZjbG9jayk7CisJ
aWYgKGNsb2NrIDwgbWluX2Nsb2NrKQorCQlyZXR1cm4gTU9ERV9DTE9DS19MT1c7CisJaWYgKGNs
b2NrID4gbWF4X2Nsb2NrKQorCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOworCiAJaWYgKG91dF9j
bG9jaykKIAkJKm91dF9jbG9jayA9IGNsb2NrOwotCXJldHVybiByZXQ7CisKKwlyZXR1cm4gTU9E
RV9PSzsKIH0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
