Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B0189329
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 01:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC68D6E82E;
	Wed, 18 Mar 2020 00:42:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860666E260
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrJr5DDzY7He3+ZxkXY02+ZvmcciwemGomoVbHNJovQ=;
 b=dtg47APBpxu9u+c/FkNT9JXgkhachze2WlhL/iEMZ7F2zcazvwJKQLToPVt0TchMGlF/2b
 moJNtCOUgznS1KMtIp5OMaTBfL4Py+0adKri/gwM48LBvkZ3EX1H7QWLTwO9SzY2Uu5gyC
 LiZFLQxlNTMtCA/h7W3P2ljOHMdY9ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Cwg8FdcCPyKvqwVsKbqM1g-1; Tue, 17 Mar 2020 20:42:31 -0400
X-MC-Unique: Cwg8FdcCPyKvqwVsKbqM1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B9318FF660;
 Wed, 18 Mar 2020 00:42:29 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 532F960BE0;
 Wed, 18 Mar 2020 00:42:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:40:58 -0400
Message-Id: <20200318004159.235623-2-lyude@redhat.com>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 1/9] drm/vblank: Add vblank works
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBzb21lIGtpbmQgb2YgdmJsYW5rIHdvcmtlcnMuIFRoZSBpbnRlcmZhY2UgaXMgc2ltaWxhciB0
byByZWd1bGFyCmRlbGF5ZWQgd29ya3MsIGFuZCBhbHNvIGFsbG93cyBmb3IgcmUtc2NoZWR1bGlu
Zy4KCldoYXRldmVyIGhhcmR3YXJlIHByb2dyYW1taW5nIHdlIGRvIGluIHRoZSB3b3JrIG11c3Qg
YmUgZmFzdAoobXVzdCBhdCBsZWFzdCBjb21wbGV0ZSBkdXJpbmcgdGhlIHZibGFuaywgc29tZXRp
bWVzIGR1cmluZwp0aGUgZmlyc3QgZmV3IHNjYW5saW5lcyBvZiB2YmxhbmspLCBzbyB3ZSdsbCBm
aXJlIHVwIGEgcGVyLWNydGMKaGlnaCBwcmlvcml0eSB0aHJlYWQgZm9yIHRoaXMuCgpbYmFzZWQg
b2ZmIHBhdGNoZXMgZnJvbSBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPiwKY2hhbmdlIGJlbG93IHRvIHNpZ25vZmYgbGF0ZXJdCgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
IHwgMzIyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9k
cm1fdmJsYW5rLmggICAgIHwgIDM0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzU2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCBkYTdiMGIwYzEwOTAuLjA2Yzc5NmI2YzM4MSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ZibGFuay5jCkBAIC0yNSw3ICsyNSw5IEBACiAgKi8KIAogI2luY2x1ZGUgPGxp
bnV4L2V4cG9ydC5oPgorI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGVwYXJhbS5oPgorI2luY2x1ZGUgPHVhcGkvbGludXgvc2NoZWQvdHlwZXMuaD4KIAog
I2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgogI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+CkBAIC05
MSw2ICs5Myw3IEBACiBzdGF0aWMgYm9vbAogZHJtX2dldF9sYXN0X3ZibHRpbWVzdGFtcChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwKIAkJCSAga3RpbWVfdCAqdHZi
bGFuaywgYm9vbCBpbl92YmxhbmtfaXJxKTsKK3N0YXRpYyBpbnQgZHJtX3ZibGFua19nZXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpOwogCiBzdGF0aWMgdW5zaWdu
ZWQgaW50IGRybV90aW1lc3RhbXBfcHJlY2lzaW9uID0gMjA7ICAvKiBEZWZhdWx0IHRvIDIwIHVz
ZWNzLiAqLwogCkBAIC00NDAsNiArNDQzLDkgQEAgdm9pZCBkcm1fdmJsYW5rX2NsZWFudXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKIAkJCWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklW
RVJfTU9ERVNFVCkpOwogCiAJCWRlbF90aW1lcl9zeW5jKCZ2YmxhbmstPmRpc2FibGVfdGltZXIp
OworCisJCXdha2VfdXBfYWxsKCZ2YmxhbmstPnZibGFua193b3JrLndvcmtfd2FpdCk7CisJCWt0
aHJlYWRfc3RvcCh2YmxhbmstPnZibGFua193b3JrLnRocmVhZCk7CiAJfQogCiAJa2ZyZWUoZGV2
LT52YmxhbmspOwpAQCAtNDQ3LDYgKzQ1MywxMDggQEAgdm9pZCBkcm1fdmJsYW5rX2NsZWFudXAo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlkZXYtPm51bV9jcnRjcyA9IDA7CiB9CiAKK3N0YXRp
YyBpbnQgdmJsYW5rX3dvcmtfdGhyZWFkKHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGRybV92Ymxh
bmtfY3J0YyAqdmJsYW5rID0gZGF0YTsKKworCXdoaWxlICgha3RocmVhZF9zaG91bGRfc3RvcCgp
KSB7CisJCXN0cnVjdCBkcm1fdmJsYW5rX3dvcmsgKndvcmssICpuZXh0OworCQlMSVNUX0hFQUQo
bGlzdCk7CisJCXU2NCBjb3VudDsKKwkJaW50IHJldDsKKworCQlzcGluX2xvY2tfaXJxKCZ2Ymxh
bmstPmRldi0+ZXZlbnRfbG9jayk7CisKKwkJcmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxl
X2xvY2tfaXJxKHZibGFuay0+cXVldWUsCisJCQkJCQkJa3RocmVhZF9zaG91bGRfc3RvcCgpIHx8
CisJCQkJCQkJIWxpc3RfZW1wdHkoJnZibGFuay0+dmJsYW5rX3dvcmsud29ya19saXN0KSwKKwkJ
CQkJCQl2YmxhbmstPmRldi0+ZXZlbnRfbG9jayk7CisKKwkJV0FSTl9PTihyZXQgJiYgIWt0aHJl
YWRfc2hvdWxkX3N0b3AoKSAmJgorCQkJbGlzdF9lbXB0eSgmdmJsYW5rLT52Ymxhbmtfd29yay5p
cnFfbGlzdCkgJiYKKwkJCWxpc3RfZW1wdHkoJnZibGFuay0+dmJsYW5rX3dvcmsud29ya19saXN0
KSk7CisKKwkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHdvcmssIG5leHQsCisJCQkJCSAmdmJs
YW5rLT52Ymxhbmtfd29yay53b3JrX2xpc3QsCisJCQkJCSBsaXN0KSB7CisJCQlsaXN0X21vdmVf
dGFpbCgmd29yay0+bGlzdCwgJmxpc3QpOworCQkJd29yay0+c3RhdGUgPSBEUk1fVkJMX1dPUktf
UlVOTklORzsKKwkJfQorCisJCXNwaW5fdW5sb2NrX2lycSgmdmJsYW5rLT5kZXYtPmV2ZW50X2xv
Y2spOworCisJCWlmIChsaXN0X2VtcHR5KCZsaXN0KSkKKwkJCWNvbnRpbnVlOworCisJCWNvdW50
ID0gYXRvbWljNjRfcmVhZCgmdmJsYW5rLT5jb3VudCk7CisJCWxpc3RfZm9yX2VhY2hfZW50cnko
d29yaywgJmxpc3QsIGxpc3QpCisJCQl3b3JrLT5mdW5jKHdvcmssIGNvdW50KTsKKworCQlzcGlu
X2xvY2tfaXJxKCZ2YmxhbmstPmRldi0+ZXZlbnRfbG9jayk7CisKKwkJbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKHdvcmssIG5leHQsICZsaXN0LCBsaXN0KSB7CisJCQlpZiAod29yay0+cmVzY2hl
ZHVsZSkgeworCQkJCWxpc3RfbW92ZV90YWlsKCZ3b3JrLT5saXN0LAorCQkJCQkgICAgICAgJnZi
bGFuay0+dmJsYW5rX3dvcmsuaXJxX2xpc3QpOworCQkJCWRybV92YmxhbmtfZ2V0KHZibGFuay0+
ZGV2LCB2YmxhbmstPnBpcGUpOworCQkJCXdvcmstPnJlc2NoZWR1bGUgPSBmYWxzZTsKKwkJCQl3
b3JrLT5zdGF0ZSA9IERSTV9WQkxfV09SS19XQUlUSU5HOworCQkJfSBlbHNlIHsKKwkJCQlsaXN0
X2RlbF9pbml0KCZ3b3JrLT5saXN0KTsKKwkJCQl3b3JrLT5jYW5jZWwgPSBmYWxzZTsKKwkJCQl3
b3JrLT5zdGF0ZSA9IERSTV9WQkxfV09SS19JRExFOworCQkJfQorCQl9CisKKwkJc3Bpbl91bmxv
Y2tfaXJxKCZ2YmxhbmstPmRldi0+ZXZlbnRfbG9jayk7CisKKwkJd2FrZV91cF9hbGwoJnZibGFu
ay0+dmJsYW5rX3dvcmsud29ya193YWl0KTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGlj
IHZvaWQgdmJsYW5rX3dvcmtfaW5pdChzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmspCit7
CisJc3RydWN0IHNjaGVkX3BhcmFtIHBhcmFtID0geworCQkuc2NoZWRfcHJpb3JpdHkgPSBNQVhf
UlRfUFJJTyAtIDEsCisJfTsKKwlpbnQgcmV0OworCisJSU5JVF9MSVNUX0hFQUQoJnZibGFuay0+
dmJsYW5rX3dvcmsuaXJxX2xpc3QpOworCUlOSVRfTElTVF9IRUFEKCZ2YmxhbmstPnZibGFua193
b3JrLndvcmtfbGlzdCk7CisJaW5pdF93YWl0cXVldWVfaGVhZCgmdmJsYW5rLT52Ymxhbmtfd29y
ay53b3JrX3dhaXQpOworCisJdmJsYW5rLT52Ymxhbmtfd29yay50aHJlYWQgPQorCQlrdGhyZWFk
X3J1bih2Ymxhbmtfd29ya190aHJlYWQsIHZibGFuaywgImNhcmQgJWQgY3J0YyAlZCIsCisJCQkg
ICAgdmJsYW5rLT5kZXYtPnByaW1hcnktPmluZGV4LCB2YmxhbmstPnBpcGUpOworCisJcmV0ID0g
c2NoZWRfc2V0c2NoZWR1bGVyKHZibGFuay0+dmJsYW5rX3dvcmsudGhyZWFkLAorCQkJCSBTQ0hF
RF9GSUZPLCAmcGFyYW0pOworCVdBUk5fT04ocmV0KTsKK30KKworLyoqCisgKiBkcm1fdmJsYW5r
X3dvcmtfaW5pdCAtIGluaXRpYWxpemUgYSB2Ymxhbmsgd29yayBpdGVtCisgKiBAd29yazogdmJs
YW5rIHdvcmsgaXRlbQorICogQGNydGM6IENSVEMgd2hvc2UgdmJsYW5rIHdpbGwgdHJpZ2dlciB0
aGUgd29yayBleGVjdXRpb24KKyAqIEBmdW5jOiB3b3JrIGZ1bmN0aW9uIHRvIGJlIGV4ZWN1dGVk
CisgKgorICogSW5pdGlhbGl6ZSBhIHZibGFuayB3b3JrIGl0ZW0gZm9yIGEgc3BlY2lmaWMgY3J0
Yy4KKyAqLwordm9pZCBkcm1fdmJsYW5rX3dvcmtfaW5pdChzdHJ1Y3QgZHJtX3ZibGFua193b3Jr
ICp3b3JrLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCisJCQkgIHZvaWQgKCpmdW5jKShzdHJ1Y3Qg
ZHJtX3ZibGFua193b3JrICp3b3JrLCB1NjQgY291bnQpKQoreworCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYgPSBjcnRjLT5kZXY7CisJc3RydWN0IGRybV92YmxhbmtfY3J0YyAqdmJsYW5rID0gJmRl
di0+dmJsYW5rW2RybV9jcnRjX2luZGV4KGNydGMpXTsKKworCXdvcmstPnZibGFuayA9IHZibGFu
azsKKwl3b3JrLT5zdGF0ZSA9IERSTV9WQkxfV09SS19JRExFOworCXdvcmstPmZ1bmMgPSBmdW5j
OworCUlOSVRfTElTVF9IRUFEKCZ3b3JrLT5saXN0KTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX3Zi
bGFua193b3JrX2luaXQpOworCiAvKioKICAqIGRybV92YmxhbmtfaW5pdCAtIGluaXRpYWxpemUg
dmJsYW5rIHN1cHBvcnQKICAqIEBkZXY6IERSTSBkZXZpY2UKQEAgLTQ4MSw2ICs1ODksOCBAQCBp
bnQgZHJtX3ZibGFua19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBu
dW1fY3J0Y3MpCiAJCWluaXRfd2FpdHF1ZXVlX2hlYWQoJnZibGFuay0+cXVldWUpOwogCQl0aW1l
cl9zZXR1cCgmdmJsYW5rLT5kaXNhYmxlX3RpbWVyLCB2YmxhbmtfZGlzYWJsZV9mbiwgMCk7CiAJ
CXNlcWxvY2tfaW5pdCgmdmJsYW5rLT5zZXFsb2NrKTsKKworCQl2Ymxhbmtfd29ya19pbml0KHZi
bGFuayk7CiAJfQogCiAJRFJNX0lORk8oIlN1cHBvcnRzIHZibGFuayB0aW1lc3RhbXAgY2FjaGlu
ZyBSZXYgMiAoMjEuMTAuMjAxMykuXG4iKTsKQEAgLTE4MjUsNiArMTkzNSwyMiBAQCBzdGF0aWMg
dm9pZCBkcm1faGFuZGxlX3ZibGFua19ldmVudHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IHBpcGUpCiAJdHJhY2VfZHJtX3ZibGFua19ldmVudChwaXBlLCBzZXEsIG5vdywg
aGlnaF9wcmVjKTsKIH0KIAorc3RhdGljIHZvaWQgZHJtX2hhbmRsZV92Ymxhbmtfd29ya3Moc3Ry
dWN0IGRybV92YmxhbmtfY3J0YyAqdmJsYW5rKQoreworCXN0cnVjdCBkcm1fdmJsYW5rX3dvcmsg
KndvcmssICpuZXh0OworCXU2NCBjb3VudCA9IGF0b21pYzY0X3JlYWQoJnZibGFuay0+Y291bnQp
OworCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHdvcmssIG5leHQsICZ2YmxhbmstPnZibGFu
a193b3JrLmlycV9saXN0LAorCQkJCSBsaXN0KSB7CisJCWlmICghdmJsYW5rX3Bhc3NlZChjb3Vu
dCwgd29yay0+Y291bnQpKQorCQkJY29udGludWU7CisKKwkJZHJtX3ZibGFua19wdXQodmJsYW5r
LT5kZXYsIHZibGFuay0+cGlwZSk7CisJCWxpc3RfbW92ZV90YWlsKCZ3b3JrLT5saXN0LCAmdmJs
YW5rLT52Ymxhbmtfd29yay53b3JrX2xpc3QpOworCQl3b3JrLT5zdGF0ZSA9IERSTV9WQkxfV09S
S19TQ0hFRFVMRUQ7CisJfQorfQorCiAvKioKICAqIGRybV9oYW5kbGVfdmJsYW5rIC0gaGFuZGxl
IGEgdmJsYW5rIGV2ZW50CiAgKiBAZGV2OiBEUk0gZGV2aWNlCkBAIC0xODY2LDYgKzE5OTIsNyBA
QCBib29sIGRybV9oYW5kbGVfdmJsYW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCBwaXBlKQogCiAJc3Bpbl91bmxvY2soJmRldi0+dmJsYW5rX3RpbWVfbG9jayk7CiAKKwlk
cm1faGFuZGxlX3ZibGFua193b3Jrcyh2YmxhbmspOwogCXdha2VfdXAoJnZibGFuay0+cXVldWUp
OwogCiAJLyogV2l0aCBpbnN0YW50LW9mZiwgd2UgZGVmZXIgZGlzYWJsaW5nIHRoZSBpbnRlcnJ1
cHQgdW50aWwgYWZ0ZXIKQEAgLTIwNzYsMyArMjIwMywxOTggQEAgaW50IGRybV9jcnRjX3F1ZXVl
X3NlcXVlbmNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJa2Zy
ZWUoZSk7CiAJcmV0dXJuIHJldDsKIH0KKworLyoqCisgKiBkcm1fdmJsYW5rX3dvcmtfc2NoZWR1
bGUgLSBzY2hlZHVsZSBhIHZibGFuayB3b3JrCisgKiBAd29yazogdmJsYW5rIHdvcmsgdG8gc2No
ZWR1bGUKKyAqIEBjb3VudDogdGFyZ2V0IHZibGFuayBjb3VudAorICogQG5leHRvbm1pc3M6IGRl
ZmVyIHVudGlsIHRoZSBuZXh0IHZibGFuayBpZiB0YXJnZXQgdmJsYW5rIHdhcyBtaXNzZWQKKyAq
CisgKiBTY2hlZHVsZSBAd29yayBmb3IgZXhlY3V0aW9uIG9uY2UgdGhlIGNydGMgdmJsYW5rIGNv
dW50IHJlYWNoZXMgQGNvdW50LgorICoKKyAqIElmIHRoZSBjcnRjIHZibGFuayBjb3VudCBoYXMg
YWxyZWFkeSByZWFjaGVkIEBjb3VudCBhbmQgQG5leHRvbm1pc3MgaXMKKyAqICVmYWxzZSB0aGUg
d29yayBzdGFydHMgdG8gZXhlY3V0ZSBpbW1lZGlhdGVseS4KKyAqCisgKiBJZiB0aGUgY3J0YyB2
YmxhbmsgY291bnQgaGFzIGFscmVhZHkgcmVhY2hlZCBAY291bnQgYW5kIEBuZXh0b25taXNzIGlz
CisgKiAldHJ1ZSB0aGUgd29yayBpcyBkZWZlcnJlZCB1bnRpbCB0aGUgbmV4dCB2YmxhbmsgKGFz
IGlmIEBjb3VudCBoYXMgYmVlbgorICogc3BlY2lmaWVkIGFzIGNydGMgdmJsYW5rIGNvdW50ICsg
MSkuCisgKgorICogSWYgQHdvcmsgaXMgYWxyZWFkeSBzY2hlZHVsZWQsIHRoaXMgZnVuY3Rpb24g
d2lsbCByZXNjaGVkdWxlIHNhaWQgd29yaworICogdXNpbmcgdGhlIG5ldyBAY291bnQuCisgKgor
ICogUmV0dXJuczoKKyAqIDAgb24gc3VjY2VzcywgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgorICov
CitpbnQgZHJtX3ZibGFua193b3JrX3NjaGVkdWxlKHN0cnVjdCBkcm1fdmJsYW5rX3dvcmsgKndv
cmssCisJCQkgICAgIHU2NCBjb3VudCwgYm9vbCBuZXh0b25taXNzKQoreworCXN0cnVjdCBkcm1f
dmJsYW5rX2NydGMgKnZibGFuayA9IHdvcmstPnZibGFuazsKKwl1bnNpZ25lZCBsb25nIGlycWZs
YWdzOworCXU2NCBjdXJfdmJsOworCWludCByZXQgPSAwOworCWJvb2wgcmVzY2hlZHVsaW5nID0g
ZmFsc2U7CisJYm9vbCBwYXNzZWQ7CisKKwlzcGluX2xvY2tfaXJxc2F2ZSgmdmJsYW5rLT5kZXYt
PmV2ZW50X2xvY2ssIGlycWZsYWdzKTsKKworCWlmICh3b3JrLT5jYW5jZWwpCisJCWdvdG8gb3V0
OworCisJaWYgKHdvcmstPnN0YXRlID09IERSTV9WQkxfV09SS19SVU5OSU5HKSB7CisJCXdvcmst
PnJlc2NoZWR1bGUgPSB0cnVlOworCQl3b3JrLT5jb3VudCA9IGNvdW50OworCQlnb3RvIG91dDsK
Kwl9IGVsc2UgaWYgKHdvcmstPnN0YXRlICE9IERSTV9WQkxfV09SS19JRExFKSB7CisJCWlmICh3
b3JrLT5jb3VudCA9PSBjb3VudCkKKwkJCWdvdG8gb3V0OworCQlyZXNjaGVkdWxpbmcgPSB0cnVl
OworCX0KKworCWlmICh3b3JrLT5zdGF0ZSAhPSBEUk1fVkJMX1dPUktfV0FJVElORykgeworCQly
ZXQgPSBkcm1fdmJsYW5rX2dldCh2YmxhbmstPmRldiwgdmJsYW5rLT5waXBlKTsKKwkJaWYgKHJl
dCkKKwkJCWdvdG8gb3V0OworCX0KKworCXdvcmstPmNvdW50ID0gY291bnQ7CisKKwljdXJfdmJs
ID0gYXRvbWljNjRfcmVhZCgmdmJsYW5rLT5jb3VudCk7CisJcGFzc2VkID0gdmJsYW5rX3Bhc3Nl
ZChjdXJfdmJsLCBjb3VudCk7CisJaWYgKHBhc3NlZCkKKwkJRFJNX0VSUk9SKCJjcnRjICVkIHZi
bGFuayAlbGx1IGFscmVhZHkgcGFzc2VkIChjdXJyZW50ICVsbHUpXG4iLAorCQkJICB2Ymxhbmst
PnBpcGUsIGNvdW50LCBjdXJfdmJsKTsKKworCWlmICghbmV4dG9ubWlzcyAmJiBwYXNzZWQpIHsK
KwkJZHJtX3ZibGFua19wdXQodmJsYW5rLT5kZXYsIHZibGFuay0+cGlwZSk7CisJCWlmIChyZXNj
aGVkdWxpbmcpCisJCQlsaXN0X21vdmVfdGFpbCgmd29yay0+bGlzdCwKKwkJCQkgICAgICAgJnZi
bGFuay0+dmJsYW5rX3dvcmsud29ya19saXN0KTsKKwkJZWxzZQorCQkJbGlzdF9hZGRfdGFpbCgm
d29yay0+bGlzdCwKKwkJCQkgICAgICAmdmJsYW5rLT52Ymxhbmtfd29yay53b3JrX2xpc3QpOwor
CQl3b3JrLT5zdGF0ZSA9IERSTV9WQkxfV09SS19TQ0hFRFVMRUQ7CisJCXdha2VfdXBfYWxsKCZ2
YmxhbmstPnF1ZXVlKTsKKwl9IGVsc2UgeworCQlpZiAocmVzY2hlZHVsaW5nKQorCQkJbGlzdF9t
b3ZlX3RhaWwoJndvcmstPmxpc3QsCisJCQkJICAgICAgICZ2YmxhbmstPnZibGFua193b3JrLmly
cV9saXN0KTsKKwkJZWxzZQorCQkJbGlzdF9hZGRfdGFpbCgmd29yay0+bGlzdCwKKwkJCQkgICAg
ICAmdmJsYW5rLT52Ymxhbmtfd29yay5pcnFfbGlzdCk7CisJCXdvcmstPnN0YXRlID0gRFJNX1ZC
TF9XT1JLX1dBSVRJTkc7CisJfQorCisgb3V0OgorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZi
bGFuay0+ZGV2LT5ldmVudF9sb2NrLCBpcnFmbGFncyk7CisKKwlyZXR1cm4gcmV0OworfQorRVhQ
T1JUX1NZTUJPTChkcm1fdmJsYW5rX3dvcmtfc2NoZWR1bGUpOworCitzdGF0aWMgYm9vbCB2Ymxh
bmtfd29ya19jYW5jZWwoc3RydWN0IGRybV92Ymxhbmtfd29yayAqd29yaykKK3sKKwlzdHJ1Y3Qg
ZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSB3b3JrLT52Ymxhbms7CisKKwlzd2l0Y2ggKHdvcmst
PnN0YXRlKSB7CisJY2FzZSBEUk1fVkJMX1dPUktfUlVOTklORzoKKwkJd29yay0+Y2FuY2VsID0g
dHJ1ZTsKKwkJd29yay0+cmVzY2hlZHVsZSA9IGZhbHNlOworCQkvKiBmYWxsIHRocm91Z2ggKi8K
KwlkZWZhdWx0OgorCWNhc2UgRFJNX1ZCTF9XT1JLX0lETEU6CisJCXJldHVybiBmYWxzZTsKKwlj
YXNlIERSTV9WQkxfV09SS19XQUlUSU5HOgorCQlkcm1fdmJsYW5rX3B1dCh2YmxhbmstPmRldiwg
dmJsYW5rLT5waXBlKTsKKwkJLyogZmFsbCB0aHJvdWdoICovCisJY2FzZSBEUk1fVkJMX1dPUktf
U0NIRURVTEVEOgorCQlsaXN0X2RlbF9pbml0KCZ3b3JrLT5saXN0KTsKKwkJd29yay0+c3RhdGUg
PSBEUk1fVkJMX1dPUktfSURMRTsKKwkJcmV0dXJuIHRydWU7CisJfQorfQorCisvKioKKyAqIGRy
bV92Ymxhbmtfd29ya19jYW5jZWwgLSBjYW5jZWwgYSB2Ymxhbmsgd29yaworICogQHdvcms6IHZi
bGFuayB3b3JrIHRvIGNhbmNlbAorICoKKyAqIENhbmNlbCBhbiBhbHJlYWR5IHNjaGVkdWxlZCB2
Ymxhbmsgd29yay4KKyAqCisgKiBPbiByZXR1cm4gQHdvcmsgbWF5IHN0aWxsIGJlIGV4ZWN1dGlu
ZywgdW5sZXNzIHRoZSByZXR1cm4KKyAqIHZhbHVlIGlzICV0cnVlLgorICoKKyAqIFJldHVybnM6
CisgKiBUcnVlIGlmIHRoZSB3b3JrIHdhcyBjYW5jZWxsZWQgYmVmb3JlIGl0IHN0YXJ0ZWQgdG8g
ZXhjdXRlLCBmYWxzZSBvdGhlcndpc2UuCisgKi8KK2Jvb2wgZHJtX3ZibGFua193b3JrX2NhbmNl
bChzdHJ1Y3QgZHJtX3ZibGFua193b3JrICp3b3JrKQoreworCXN0cnVjdCBkcm1fdmJsYW5rX2Ny
dGMgKnZibGFuayA9IHdvcmstPnZibGFuazsKKwlib29sIGNhbmNlbGxlZDsKKworCXNwaW5fbG9j
a19pcnEoJnZibGFuay0+ZGV2LT5ldmVudF9sb2NrKTsKKworCWNhbmNlbGxlZCA9IHZibGFua193
b3JrX2NhbmNlbCh3b3JrKTsKKworCXNwaW5fdW5sb2NrX2lycSgmdmJsYW5rLT5kZXYtPmV2ZW50
X2xvY2spOworCisJcmV0dXJuIGNhbmNlbGxlZDsKK30KK0VYUE9SVF9TWU1CT0woZHJtX3ZibGFu
a193b3JrX2NhbmNlbCk7CisKKy8qKgorICogZHJtX3ZibGFua193b3JrX2NhbmNlbF9zeW5jIC0g
Y2FuY2VsIGEgdmJsYW5rIHdvcmsgYW5kIHdhaXQgZm9yIGl0IHRvIGZpbmlzaCBleGVjdXRpbmcK
KyAqIEB3b3JrOiB2Ymxhbmsgd29yayB0byBjYW5jZWwKKyAqCisgKiBDYW5jZWwgYW4gYWxyZWFk
eSBzY2hlZHVsZWQgdmJsYW5rIHdvcmsgYW5kIHdhaXQgZm9yIGl0cworICogZXhlY3V0aW9uIHRv
IGZpbmlzaC4KKyAqCisgKiBPbiByZXR1cm4gQHdvcmsgaXMgbm8gbG9uZ2VyIGd1YXJhbmVlZCB0
byBiZSBleGVjdXRpbmcuCisgKgorICogUmV0dXJuczoKKyAqIFRydWUgaWYgdGhlIHdvcmsgd2Fz
IGNhbmNlbGxlZCBiZWZvcmUgaXQgc3RhcnRlZCB0byBleGN1dGUsIGZhbHNlIG90aGVyd2lzZS4K
KyAqLworYm9vbCBkcm1fdmJsYW5rX3dvcmtfY2FuY2VsX3N5bmMoc3RydWN0IGRybV92Ymxhbmtf
d29yayAqd29yaykKK3sKKwlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSB3b3JrLT52
Ymxhbms7CisJYm9vbCBjYW5jZWxsZWQ7CisJbG9uZyByZXQ7CisKKwlzcGluX2xvY2tfaXJxKCZ2
YmxhbmstPmRldi0+ZXZlbnRfbG9jayk7CisKKwljYW5jZWxsZWQgPSB2Ymxhbmtfd29ya19jYW5j
ZWwod29yayk7CisKKwlyZXQgPSB3YWl0X2V2ZW50X2xvY2tfaXJxX3RpbWVvdXQodmJsYW5rLT52
Ymxhbmtfd29yay53b3JrX3dhaXQsCisJCQkJCSAgd29yay0+c3RhdGUgPT0gRFJNX1ZCTF9XT1JL
X0lETEUsCisJCQkJCSAgdmJsYW5rLT5kZXYtPmV2ZW50X2xvY2ssCisJCQkJCSAgMTAgKiBIWik7
CisKKwlzcGluX3VubG9ja19pcnEoJnZibGFuay0+ZGV2LT5ldmVudF9sb2NrKTsKKworCVdBUk4o
IXJldCwgImNydGMgJWQgdmJsYW5rIHdvcmsgdGltZWQgb3V0XG4iLCB2YmxhbmstPnBpcGUpOwor
CisJcmV0dXJuIGNhbmNlbGxlZDsKK30KK0VYUE9SVF9TWU1CT0woZHJtX3ZibGFua193b3JrX2Nh
bmNlbF9zeW5jKTsKKworLyoqCisgKiBkcm1fdmJsYW5rX3dvcmtfZmx1c2ggLSB3YWl0IGZvciBh
IHNjaGVkdWxlZCB2Ymxhbmsgd29yayB0byBmaW5pc2ggZXhjdXRpbmcKKyAqIEB3b3JrOiB2Ymxh
bmsgd29yayB0byBmbHVzaAorICoKKyAqIFdhaXQgdW50aWwgQHdvcmsgaGFzIGZpbmlzaGVkIGV4
ZWN1dGluZy4KKyAqLwordm9pZCBkcm1fdmJsYW5rX3dvcmtfZmx1c2goc3RydWN0IGRybV92Ymxh
bmtfd29yayAqd29yaykKK3sKKwlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSB3b3Jr
LT52Ymxhbms7CisJbG9uZyByZXQ7CisKKwlzcGluX2xvY2tfaXJxKCZ2YmxhbmstPmRldi0+ZXZl
bnRfbG9jayk7CisKKwlyZXQgPSB3YWl0X2V2ZW50X2xvY2tfaXJxX3RpbWVvdXQodmJsYW5rLT52
Ymxhbmtfd29yay53b3JrX3dhaXQsCisJCQkJCSAgd29yay0+c3RhdGUgPT0gRFJNX1ZCTF9XT1JL
X0lETEUsCisJCQkJCSAgdmJsYW5rLT5kZXYtPmV2ZW50X2xvY2ssCisJCQkJCSAgMTAgKiBIWik7
CisKKwlzcGluX3VubG9ja19pcnEoJnZibGFuay0+ZGV2LT5ldmVudF9sb2NrKTsKKworCVdBUk4o
IXJldCwgImNydGMgJWQgdmJsYW5rIHdvcmsgdGltZWQgb3V0XG4iLCB2YmxhbmstPnBpcGUpOwor
fQorRVhQT1JUX1NZTUJPTChkcm1fdmJsYW5rX3dvcmtfZmx1c2gpOwpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX3ZibGFuay5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCmluZGV4IGRk
OWY1YjllNTZlNC4uYWM5MTMwZjQxOWFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fdmJs
YW5rLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCkBAIC0yMDMsOCArMjAzLDQyIEBA
IHN0cnVjdCBkcm1fdmJsYW5rX2NydGMgewogCSAqIGRpc2FibGluZyBmdW5jdGlvbnMgbXVsdGlw
bGUgdGltZXMuCiAJICovCiAJYm9vbCBlbmFibGVkOworCisJc3RydWN0IHsKKwkJc3RydWN0IHRh
c2tfc3RydWN0ICp0aHJlYWQ7CisJCXN0cnVjdCBsaXN0X2hlYWQgaXJxX2xpc3QsIHdvcmtfbGlz
dDsKKwkJd2FpdF9xdWV1ZV9oZWFkX3Qgd29ya193YWl0OworCX0gdmJsYW5rX3dvcms7Cit9Owor
CitzdHJ1Y3QgZHJtX3ZibGFua193b3JrIHsKKwl1NjQgY291bnQ7CisJc3RydWN0IGRybV92Ymxh
bmtfY3J0YyAqdmJsYW5rOworCXZvaWQgKCpmdW5jKShzdHJ1Y3QgZHJtX3ZibGFua193b3JrICp3
b3JrLCB1NjQgY291bnQpOworCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKKwllbnVtIHsKKwkJRFJN
X1ZCTF9XT1JLX0lETEUsCisJCURSTV9WQkxfV09SS19XQUlUSU5HLAorCQlEUk1fVkJMX1dPUktf
U0NIRURVTEVELAorCQlEUk1fVkJMX1dPUktfUlVOTklORywKKwl9IHN0YXRlOworCWJvb2wgY2Fu
Y2VsIDogMTsKKwlib29sIHJlc2NoZWR1bGUgOiAxOwogfTsKIAoraW50IGRybV92Ymxhbmtfd29y
a19zY2hlZHVsZShzdHJ1Y3QgZHJtX3ZibGFua193b3JrICp3b3JrLAorCQkJICAgICB1NjQgY291
bnQsIGJvb2wgbmV4dG9ubWlzcyk7Cit2b2lkIGRybV92Ymxhbmtfd29ya19pbml0KHN0cnVjdCBk
cm1fdmJsYW5rX3dvcmsgKndvcmssIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwkJCSAgdm9pZCAo
KmZ1bmMpKHN0cnVjdCBkcm1fdmJsYW5rX3dvcmsgKndvcmssIHU2NCBjb3VudCkpOworYm9vbCBk
cm1fdmJsYW5rX3dvcmtfY2FuY2VsKHN0cnVjdCBkcm1fdmJsYW5rX3dvcmsgKndvcmspOworYm9v
bCBkcm1fdmJsYW5rX3dvcmtfY2FuY2VsX3N5bmMoc3RydWN0IGRybV92Ymxhbmtfd29yayAqd29y
ayk7Cit2b2lkIGRybV92Ymxhbmtfd29ya19mbHVzaChzdHJ1Y3QgZHJtX3ZibGFua193b3JrICp3
b3JrKTsKKworc3RhdGljIGlubGluZSBib29sIGRybV92Ymxhbmtfd29ya19wZW5kaW5nKHN0cnVj
dCBkcm1fdmJsYW5rX3dvcmsgKndvcmspCit7CisJcmV0dXJuIHdvcmstPnN0YXRlICE9IERSTV9W
QkxfV09SS19JRExFOworfQorCiBpbnQgZHJtX3ZibGFua19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCBudW1fY3J0Y3MpOwogYm9vbCBkcm1fZGV2X2hhc192Ymxhbmso
Y29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiB1NjQgZHJtX2NydGNfdmJsYW5rX2NvdW50
KHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
