Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C541488AF
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2020 15:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA82072ACF;
	Fri, 24 Jan 2020 14:30:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA3B72ACD;
 Fri, 24 Jan 2020 14:30:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so1892126wmi.5;
 Fri, 24 Jan 2020 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LFm8SCBqT+FagwGHOvLlV3R23f5oX4MAs+o53iSSXFc=;
 b=eHmJYtBJvhPGmomxuUfbOuwD8Vh/FYnfW3m5aoH3glp6LyJBsJBX5xy7JfhWG2tRcS
 mLN4i73IM9MZYiQ3Czl3XXWzCwF+wSELILR/TujoVOykOpJE0Z8TGQQeR0zqymdSagwU
 4XxlqIF0cXMJ1NmT7DKAu/ncfDGWNpz5UbPVYWrv3eqyi1rj77WvG0lekblhza5hUA2x
 W6ilxlwhwRuqDLWKnOATvD/7Gbz+mI9Yredx6TtlQv3WXgX3V9I3pmrq4jXy7WlyMGJs
 91/1iUvonfiJxem1R3Oz8KNEXLtLMzLkH2tYiUPHVcdstIz8pkzlU78erzv14he2dT9i
 wGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFm8SCBqT+FagwGHOvLlV3R23f5oX4MAs+o53iSSXFc=;
 b=Tpu70PRMpM3thLrq1DBPSsOXq17+AcQg7uvrX2zVR1WicYmA3e93cbYi0KoPMm5+QK
 DbDG2w2PK1a7sX2BYLHCsH4S8foXOFkq0TzaFszGyPZDpNk/Yr2tA4kUGMCzLKCClFM8
 0ERQ6Ov5+9pM7FRfXAMaL/KgZVDxYsatQlmNf3x5kvfcd69nITLWwor9rNz/hZ/Sjy4m
 /PyX2+T0aSpMo6pvCR0bi1K5tcd4i1LVz2OGO18I32QTHot39vmrpIHAVL3evr+3aARO
 iyLkiwa2mZv3Cfh4GyVYjwUGvAHuD1UgeQq/Hoz0Aa8tgOEv3MSKFswyFVjwTJSlo1yv
 3Tsg==
X-Gm-Message-State: APjAAAV/In3T9Tb3//1aX+TkZ/GRkfatD60iNrcjCjRQwV27EkafSqXr
 YdjevxKL/wFbPtBdNrrr//I=
X-Google-Smtp-Source: APXvYqwcRFslp8dAoyte3WK7AEZKmH9YIGUgskGTlSdqbQI+MH9BFEAMhtxaxGJdPyJ+/U6Qb1Ej9A==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr3412514wmd.96.1579876247049; 
 Fri, 24 Jan 2020 06:30:47 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9c03:ec12:e225:5a75])
 by smtp.gmail.com with ESMTPSA id f207sm8381679wme.9.2020.01.24.06.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 06:30:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bskeggs@redhat.com, airlied@linux.ie, imirkin@alum.mit.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Fri, 24 Jan 2020 15:30:42 +0100
Message-Id: <20200124143042.93733-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124143042.93733-1-christian.koenig@amd.com>
References: <20200124143042.93733-1-christian.koenig@amd.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/2] drm/ttm: remove io_reserve_lru handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
CgpUaGF0IGlzIG5vdCB1c2VkIGFueSBtb3JlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
ICAgICAgfCAgMzcgKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5j
IHwgMTE0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyAgIHwgIDMzICsrKy0tLS0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaCAgICAgIHwgICA1IC0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgfCAg
IDUgLS0KIDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTc0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IDFmYmMzNmYwNWQ4OS4uNTY4MzI5ZTUxN2QyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKQEAgLTMxMSwxMyArMzExLDggQEAgc3RhdGljIGludCB0dG1fYm9faGFu
ZGxlX21vdmVfbWVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJaW50IHJldCA9IDA7
CiAKIAlpZiAob2xkX2lzX3BjaSB8fCBuZXdfaXNfcGNpIHx8Ci0JICAgICgobWVtLT5wbGFjZW1l
bnQgJiBiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9NQVNLX0NBQ0hJTkcpID09IDApKSB7Ci0J
CXJldCA9IHR0bV9tZW1faW9fbG9jayhvbGRfbWFuLCB0cnVlKTsKLQkJaWYgKHVubGlrZWx5KHJl
dCAhPSAwKSkKLQkJCWdvdG8gb3V0X2VycjsKLQkJdHRtX2JvX3VubWFwX3ZpcnR1YWxfbG9ja2Vk
KGJvKTsKLQkJdHRtX21lbV9pb191bmxvY2sob2xkX21hbik7Ci0JfQorCSAgICAoKG1lbS0+cGxh
Y2VtZW50ICYgYm8tPm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfTUFTS19DQUNISU5HKSA9PSAwKSkK
KwkJdHRtX2JvX3VubWFwX3ZpcnR1YWwoYm8pOwogCiAJLyoKIAkgKiBDcmVhdGUgYW5kIGJpbmQg
YSB0dG0gaWYgcmVxdWlyZWQuCkBAIC02NDYsMTUgKzY0MSwxMiBAQCBzdGF0aWMgdm9pZCB0dG1f
Ym9fcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvID0KIAkgICAgY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCwg
a3JlZik7CiAJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKLQlzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV07
CiAKIAlpZiAoYm8tPmJkZXYtPmRyaXZlci0+cmVsZWFzZV9ub3RpZnkpCiAJCWJvLT5iZGV2LT5k
cml2ZXItPnJlbGVhc2Vfbm90aWZ5KGJvKTsKIAogCWRybV92bWFfb2Zmc2V0X3JlbW92ZShiZGV2
LT52bWFfbWFuYWdlciwgJmJvLT5iYXNlLnZtYV9ub2RlKTsKLQl0dG1fbWVtX2lvX2xvY2sobWFu
LCBmYWxzZSk7Ci0JdHRtX21lbV9pb19mcmVlX3ZtKGJvKTsKLQl0dG1fbWVtX2lvX3VubG9jayht
YW4pOworCXR0bV9tZW1faW9fZnJlZShiZGV2LCAmYm8tPm1lbSk7CiAJdHRtX2JvX2NsZWFudXBf
cmVmc19vcl9xdWV1ZShibyk7CiAJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxl
YXNlX2xpc3QpOwogfQpAQCAtNzAzLDggKzY5NSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2V2aWN0
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAlldmljdF9tZW0gPSBiby0+bWVtOwog
CWV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKLQlldmljdF9tZW0uYnVzLmlvX3Jlc2VydmVkX3Zt
ID0gZmFsc2U7Ci0JZXZpY3RfbWVtLmJ1cy5pb19yZXNlcnZlZF9jb3VudCA9IDA7CisJZXZpY3Rf
bWVtLmJ1cy5iYXNlID0gMDsKIAogCXJldCA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1l
bnQsICZldmljdF9tZW0sIGN0eCk7CiAJaWYgKHJldCkgewpAQCAtMTE1NSw4ICsxMTQ2LDcgQEAg
c3RhdGljIGludCB0dG1fYm9fbW92ZV9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKIAltZW0ubnVtX3BhZ2VzID0gYm8tPm51bV9wYWdlczsKIAltZW0uc2l6ZSA9IG1lbS5udW1f
cGFnZXMgPDwgUEFHRV9TSElGVDsKIAltZW0ucGFnZV9hbGlnbm1lbnQgPSBiby0+bWVtLnBhZ2Vf
YWxpZ25tZW50OwotCW1lbS5idXMuaW9fcmVzZXJ2ZWRfdm0gPSBmYWxzZTsKLQltZW0uYnVzLmlv
X3Jlc2VydmVkX2NvdW50ID0gMDsKKwltZW0uYnVzLmJhc2UgPSAwOwogCS8qCiAJICogRGV0ZXJt
aW5lIHdoZXJlIHRvIG1vdmUgdGhlIGJ1ZmZlci4KIAkgKi8KQEAgLTEzMDEsOCArMTI5MSw3IEBA
IGludCB0dG1fYm9faW5pdF9yZXNlcnZlZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAli
by0+bWVtLm51bV9wYWdlcyA9IGJvLT5udW1fcGFnZXM7CiAJYm8tPm1lbS5tbV9ub2RlID0gTlVM
TDsKIAliby0+bWVtLnBhZ2VfYWxpZ25tZW50ID0gcGFnZV9hbGlnbm1lbnQ7Ci0JYm8tPm1lbS5i
dXMuaW9fcmVzZXJ2ZWRfdm0gPSBmYWxzZTsKLQliby0+bWVtLmJ1cy5pb19yZXNlcnZlZF9jb3Vu
dCA9IDA7CisJYm8tPm1lbS5idXMuYmFzZSA9IDA7CiAJYm8tPm1vdmluZyA9IE5VTEw7CiAJYm8t
Pm1lbS5wbGFjZW1lbnQgPSAoVFRNX1BMX0ZMQUdfU1lTVEVNIHwgVFRNX1BMX0ZMQUdfQ0FDSEVE
KTsKIAliby0+YWNjX3NpemUgPSBhY2Nfc2l6ZTsKQEAgLTE3NDgsMjIgKzE3MzcsMTIgQEAgYm9v
bCB0dG1fbWVtX3JlZ19pc19wY2koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0
dG1fbWVtX3JlZyAqbWVtKQogCXJldHVybiB0cnVlOwogfQogCi12b2lkIHR0bV9ib191bm1hcF92
aXJ0dWFsX2xvY2tlZChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQotewotCXN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Ci0KLQlkcm1fdm1hX25vZGVfdW5tYXAoJmJv
LT5iYXNlLnZtYV9ub2RlLCBiZGV2LT5kZXZfbWFwcGluZyk7Ci0JdHRtX21lbV9pb19mcmVlX3Zt
KGJvKTsKLX0KLQogdm9pZCB0dG1fYm9fdW5tYXBfdmlydHVhbChzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvKQogewogCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Ci0J
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW2JvLT5tZW0ubWVt
X3R5cGVdOwogCi0JdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwotCXR0bV9ib191bm1hcF92
aXJ0dWFsX2xvY2tlZChibyk7Ci0JdHRtX21lbV9pb191bmxvY2sobWFuKTsKKwlkcm1fdm1hX25v
ZGVfdW5tYXAoJmJvLT5iYXNlLnZtYV9ub2RlLCBiZGV2LT5kZXZfbWFwcGluZyk7CisJdHRtX21l
bV9pb19mcmVlKGJkZXYsICZiby0+bWVtKTsKIH0KIAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGls
LmMKaW5kZXggMmIwZTVhMDg4ZGEwLi5hY2UzMWFkNjU5OTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b191dGlsLmMKQEAgLTkxLDEyNCArOTEsMzAgQEAgaW50IHR0bV9ib19tb3ZlX3R0bShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9fbW92ZV90dG0p
OwogCi1pbnQgdHRtX21lbV9pb19sb2NrKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
LCBib29sIGludGVycnVwdGlibGUpCi17Ci0JaWYgKGxpa2VseShtYW4tPmlvX3Jlc2VydmVfZmFz
dHBhdGgpKQotCQlyZXR1cm4gMDsKLQotCWlmIChpbnRlcnJ1cHRpYmxlKQotCQlyZXR1cm4gbXV0
ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZtYW4tPmlvX3Jlc2VydmVfbXV0ZXgpOwotCi0JbXV0ZXhf
bG9jaygmbWFuLT5pb19yZXNlcnZlX211dGV4KTsKLQlyZXR1cm4gMDsKLX0KLQotdm9pZCB0dG1f
bWVtX2lvX3VubG9jayhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikKLXsKLQlpZiAo
bGlrZWx5KG1hbi0+aW9fcmVzZXJ2ZV9mYXN0cGF0aCkpCi0JCXJldHVybjsKLQotCW11dGV4X3Vu
bG9jaygmbWFuLT5pb19yZXNlcnZlX211dGV4KTsKLX0KLQotc3RhdGljIGludCB0dG1fbWVtX2lv
X2V2aWN0KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQotewotCXN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm87Ci0KLQlpZiAoIW1hbi0+dXNlX2lvX3Jlc2VydmVfbHJ1IHx8IGxp
c3RfZW1wdHkoJm1hbi0+aW9fcmVzZXJ2ZV9scnUpKQotCQlyZXR1cm4gLUVBR0FJTjsKLQotCWJv
ID0gbGlzdF9maXJzdF9lbnRyeSgmbWFuLT5pb19yZXNlcnZlX2xydSwKLQkJCSAgICAgIHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCwKLQkJCSAgICAgIGlvX3Jlc2VydmVfbHJ1KTsKLQlsaXN0X2Rl
bF9pbml0KCZiby0+aW9fcmVzZXJ2ZV9scnUpOwotCXR0bV9ib191bm1hcF92aXJ0dWFsX2xvY2tl
ZChibyk7Ci0KLQlyZXR1cm4gMDsKLX0KLQotCiBpbnQgdHRtX21lbV9pb19yZXNlcnZlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQkgICAgICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0p
CiB7Ci0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+
bWVtX3R5cGVdOwotCWludCByZXQgPSAwOwotCiAJaWYgKCFiZGV2LT5kcml2ZXItPmlvX21lbV9y
ZXNlcnZlKQogCQlyZXR1cm4gMDsKLQlpZiAobGlrZWx5KG1hbi0+aW9fcmVzZXJ2ZV9mYXN0cGF0
aCkpCi0JCXJldHVybiBiZGV2LT5kcml2ZXItPmlvX21lbV9yZXNlcnZlKGJkZXYsIG1lbSk7Ci0K
LQlpZiAoYmRldi0+ZHJpdmVyLT5pb19tZW1fcmVzZXJ2ZSAmJgotCSAgICBtZW0tPmJ1cy5pb19y
ZXNlcnZlZF9jb3VudCsrID09IDApIHsKLXJldHJ5OgotCQlyZXQgPSBiZGV2LT5kcml2ZXItPmlv
X21lbV9yZXNlcnZlKGJkZXYsIG1lbSk7Ci0JCWlmIChyZXQgPT0gLUVBR0FJTikgewotCQkJcmV0
ID0gdHRtX21lbV9pb19ldmljdChtYW4pOwotCQkJaWYgKHJldCA9PSAwKQotCQkJCWdvdG8gcmV0
cnk7Ci0JCX0KLQl9Ci0JcmV0dXJuIHJldDsKKworCXJldHVybiBiZGV2LT5kcml2ZXItPmlvX21l
bV9yZXNlcnZlKGJkZXYsIG1lbSk7CiB9CiAKIHZvaWQgdHRtX21lbV9pb19mcmVlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LAogCQkgICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQogewot
CXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hblttZW0tPm1lbV90
eXBlXTsKLQotCWlmIChsaWtlbHkobWFuLT5pb19yZXNlcnZlX2Zhc3RwYXRoKSkKLQkJcmV0dXJu
OwotCi0JaWYgKGJkZXYtPmRyaXZlci0+aW9fbWVtX3Jlc2VydmUgJiYKLQkgICAgLS1tZW0tPmJ1
cy5pb19yZXNlcnZlZF9jb3VudCA9PSAwICYmCi0JICAgIGJkZXYtPmRyaXZlci0+aW9fbWVtX2Zy
ZWUpCisJaWYgKGJkZXYtPmRyaXZlci0+aW9fbWVtX2ZyZWUpCiAJCWJkZXYtPmRyaXZlci0+aW9f
bWVtX2ZyZWUoYmRldiwgbWVtKTsKLQotfQotCi1pbnQgdHRtX21lbV9pb19yZXNlcnZlX3ZtKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCi17Ci0Jc3RydWN0IHR0bV9tZW1fcmVnICptZW0g
PSAmYm8tPm1lbTsKLQlpbnQgcmV0OwotCi0JaWYgKCFtZW0tPmJ1cy5pb19yZXNlcnZlZF92bSkg
ewotCQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9Ci0JCQkmYm8tPmJkZXYtPm1h
blttZW0tPm1lbV90eXBlXTsKLQotCQlyZXQgPSB0dG1fbWVtX2lvX3Jlc2VydmUoYm8tPmJkZXYs
IG1lbSk7Ci0JCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCi0JCQlyZXR1cm4gcmV0OwotCQltZW0t
PmJ1cy5pb19yZXNlcnZlZF92bSA9IHRydWU7Ci0JCWlmIChtYW4tPnVzZV9pb19yZXNlcnZlX2xy
dSkKLQkJCWxpc3RfYWRkX3RhaWwoJmJvLT5pb19yZXNlcnZlX2xydSwKLQkJCQkgICAgICAmbWFu
LT5pb19yZXNlcnZlX2xydSk7Ci0JfQotCXJldHVybiAwOwotfQotCi12b2lkIHR0bV9tZW1faW9f
ZnJlZV92bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQotewotCXN0cnVjdCB0dG1fbWVt
X3JlZyAqbWVtID0gJmJvLT5tZW07Ci0KLQlpZiAobWVtLT5idXMuaW9fcmVzZXJ2ZWRfdm0pIHsK
LQkJbWVtLT5idXMuaW9fcmVzZXJ2ZWRfdm0gPSBmYWxzZTsKLQkJbGlzdF9kZWxfaW5pdCgmYm8t
PmlvX3Jlc2VydmVfbHJ1KTsKLQkJdHRtX21lbV9pb19mcmVlKGJvLT5iZGV2LCBtZW0pOwotCX0K
IH0KIAogc3RhdGljIGludCB0dG1fbWVtX3JlZ19pb3JlbWFwKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwKIAkJCXZvaWQgKip2aXJ0dWFsKQogewot
CXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hblttZW0tPm1lbV90
eXBlXTsKIAlpbnQgcmV0OwogCXZvaWQgKmFkZHI7CiAKIAkqdmlydHVhbCA9IE5VTEw7Ci0JKHZv
aWQpIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKIAlyZXQgPSB0dG1fbWVtX2lvX3Jlc2Vy
dmUoYmRldiwgbWVtKTsKLQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwogCWlmIChyZXQgfHwgIW1l
bS0+YnVzLmlzX2lvbWVtKQogCQlyZXR1cm4gcmV0OwogCkBAIC0yMjAsOSArMTI2LDcgQEAgc3Rh
dGljIGludCB0dG1fbWVtX3JlZ19pb3JlbWFwKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX21lbV9yZWcgKm0KIAkJZWxzZQogCQkJYWRkciA9IGlvcmVtYXBfbm9jYWNoZSht
ZW0tPmJ1cy5iYXNlICsgbWVtLT5idXMub2Zmc2V0LCBtZW0tPmJ1cy5zaXplKTsKIAkJaWYgKCFh
ZGRyKSB7Ci0JCQkodm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwogCQkJdHRtX21l
bV9pb19mcmVlKGJkZXYsIG1lbSk7Ci0JCQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOwogCQkJcmV0
dXJuIC1FTk9NRU07CiAJCX0KIAl9CkBAIC0yMzksOSArMTQzLDcgQEAgc3RhdGljIHZvaWQgdHRt
X21lbV9yZWdfaW91bm1hcChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV9t
ZW1fcmVnICoKIAogCWlmICh2aXJ0dWFsICYmIG1lbS0+YnVzLmFkZHIgPT0gTlVMTCkKIAkJaW91
bm1hcCh2aXJ0dWFsKTsKLQkodm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwogCXR0
bV9tZW1faW9fZnJlZShiZGV2LCBtZW0pOwotCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7CiB9CiAK
IHN0YXRpYyBpbnQgdHRtX2NvcHlfaW9fcGFnZSh2b2lkICpkc3QsIHZvaWQgKnNyYywgdW5zaWdu
ZWQgbG9uZyBwYWdlKQpAQCAtNjE2LDggKzUxOCw2IEBAIGludCB0dG1fYm9fa21hcChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQl1bnNpZ25lZCBsb25nIHN0YXJ0X3BhZ2UsIHVuc2ln
bmVkIGxvbmcgbnVtX3BhZ2VzLAogCQlzdHJ1Y3QgdHRtX2JvX2ttYXBfb2JqICptYXApCiB7Ci0J
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPQotCQkmYm8tPmJkZXYtPm1hbltiby0+
bWVtLm1lbV90eXBlXTsKIAl1bnNpZ25lZCBsb25nIG9mZnNldCwgc2l6ZTsKIAlpbnQgcmV0Owog
CkBAIC02MjgsOSArNTI4LDcgQEAgaW50IHR0bV9ib19rbWFwKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCiAJaWYgKHN0YXJ0X3BhZ2UgPiBiby0+bnVtX3BhZ2VzKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAotCSh2b2lkKSB0dG1fbWVtX2lvX2xvY2sobWFuLCBmYWxzZSk7CiAJcmV0ID0gdHRt
X21lbV9pb19yZXNlcnZlKGJvLT5iZGV2LCAmYm8tPm1lbSk7Ci0JdHRtX21lbV9pb191bmxvY2so
bWFuKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCWlmICghYm8tPm1lbS5idXMuaXNfaW9t
ZW0pIHsKQEAgLTY0NSwxMCArNTQzLDYgQEAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fa21hcCk7CiAK
IHZvaWQgdHRtX2JvX2t1bm1hcChzdHJ1Y3QgdHRtX2JvX2ttYXBfb2JqICptYXApCiB7Ci0Jc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IG1hcC0+Ym87Ci0Jc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyICptYW4gPQotCQkmYm8tPmJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXTsKLQog
CWlmICghbWFwLT52aXJ0dWFsKQogCQlyZXR1cm47CiAJc3dpdGNoIChtYXAtPmJvX2ttYXBfdHlw
ZSkgewpAQCAtNjY2LDkgKzU2MCw3IEBAIHZvaWQgdHRtX2JvX2t1bm1hcChzdHJ1Y3QgdHRtX2Jv
X2ttYXBfb2JqICptYXApCiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQotCSh2b2lkKSB0dG1fbWVt
X2lvX2xvY2sobWFuLCBmYWxzZSk7CiAJdHRtX21lbV9pb19mcmVlKG1hcC0+Ym8tPmJkZXYsICZt
YXAtPmJvLT5tZW0pOwotCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7CiAJbWFwLT52aXJ0dWFsID0g
TlVMTDsKIAltYXAtPnBhZ2UgPSBOVUxMOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXgg
ZWViYjRjMDZjMDRkLi4xMWQ0OWZhOTBiZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAt
MTkxLDggKzE5MSw2IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVj
dCB2bV9mYXVsdCAqdm1mLAogCXBnb2ZmX3QgaTsKIAl2bV9mYXVsdF90IHJldCA9IFZNX0ZBVUxU
X05PUEFHRTsKIAl1bnNpZ25lZCBsb25nIGFkZHJlc3MgPSB2bWYtPmFkZHJlc3M7Ci0Jc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPQotCQkmYmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5
cGVdOwogCiAJLyoKIAkgKiBSZWZ1c2UgdG8gZmF1bHQgaW1wb3J0ZWQgcGFnZXMuIFRoaXMgc2hv
dWxkIGJlIGhhbmRsZWQKQEAgLTIzMSwyNCArMjI5LDE3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3Zt
X2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCWlmICh1bmxpa2VseShyZXQg
IT0gMCkpCiAJCXJldHVybiByZXQ7CiAKLQllcnIgPSB0dG1fbWVtX2lvX2xvY2sobWFuLCB0cnVl
KTsKKwllcnIgPSB0dG1fbWVtX2lvX3Jlc2VydmUoYmRldiwgJmJvLT5tZW0pOwogCWlmICh1bmxp
a2VseShlcnIgIT0gMCkpCi0JCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7Ci0JZXJyID0gdHRtX21l
bV9pb19yZXNlcnZlX3ZtKGJvKTsKLQlpZiAodW5saWtlbHkoZXJyICE9IDApKSB7Ci0JCXJldCA9
IFZNX0ZBVUxUX1NJR0JVUzsKLQkJZ290byBvdXRfaW9fdW5sb2NrOwotCX0KKwkJcmV0dXJuIFZN
X0ZBVUxUX1NJR0JVUzsKIAogCXBhZ2Vfb2Zmc2V0ID0gKChhZGRyZXNzIC0gdm1hLT52bV9zdGFy
dCkgPj4gUEFHRV9TSElGVCkgKwogCQl2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9ub2RlX3N0YXJ0
KCZiby0+YmFzZS52bWFfbm9kZSk7CiAJcGFnZV9sYXN0ID0gdm1hX3BhZ2VzKHZtYSkgKyB2bWEt
PnZtX3Bnb2ZmIC0KIAkJZHJtX3ZtYV9ub2RlX3N0YXJ0KCZiby0+YmFzZS52bWFfbm9kZSk7CiAK
LQlpZiAodW5saWtlbHkocGFnZV9vZmZzZXQgPj0gYm8tPm51bV9wYWdlcykpIHsKLQkJcmV0ID0g
Vk1fRkFVTFRfU0lHQlVTOwotCQlnb3RvIG91dF9pb191bmxvY2s7Ci0JfQorCWlmICh1bmxpa2Vs
eShwYWdlX29mZnNldCA+PSBiby0+bnVtX3BhZ2VzKSkKKwkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JV
UzsKIAogCWN2bWEudm1fcGFnZV9wcm90ID0gdHRtX2lvX3Byb3QoYm8tPm1lbS5wbGFjZW1lbnQs
IHByb3QpOwogCWlmICghYm8tPm1lbS5idXMuaXNfaW9tZW0pIHsKQEAgLTI2MCwxMCArMjUxLDgg
QEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2
bWYsCiAJCX07CiAKIAkJdHRtID0gYm8tPnR0bTsKLQkJaWYgKHR0bV90dF9wb3B1bGF0ZShiby0+
dHRtLCAmY3R4KSkgewotCQkJcmV0ID0gVk1fRkFVTFRfT09NOwotCQkJZ290byBvdXRfaW9fdW5s
b2NrOwotCQl9CisJCWlmICh0dG1fdHRfcG9wdWxhdGUoYm8tPnR0bSwgJmN0eCkpCisJCQlyZXR1
cm4gVk1fRkFVTFRfT09NOwogCX0gZWxzZSB7CiAJCS8qIElvbWVtIHNob3VsZCBub3QgYmUgbWFy
a2VkIGVuY3J5cHRlZCAqLwogCQljdm1hLnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQo
Y3ZtYS52bV9wYWdlX3Byb3QpOwpAQCAtMjc5LDggKzI2OCw3IEBAIHZtX2ZhdWx0X3QgdHRtX2Jv
X3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCQl9IGVsc2UgewogCQkJ
cGFnZSA9IHR0bS0+cGFnZXNbcGFnZV9vZmZzZXRdOwogCQkJaWYgKHVubGlrZWx5KCFwYWdlICYm
IGkgPT0gMCkpIHsKLQkJCQlyZXQgPSBWTV9GQVVMVF9PT007Ci0JCQkJZ290byBvdXRfaW9fdW5s
b2NrOworCQkJCXJldHVybiBWTV9GQVVMVF9PT007CiAJCQl9IGVsc2UgaWYgKHVubGlrZWx5KCFw
YWdlKSkgewogCQkJCWJyZWFrOwogCQkJfQpAQCAtMjk4LDcgKzI4Niw3IEBAIHZtX2ZhdWx0X3Qg
dHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCQkvKiBOZXZl
ciBlcnJvciBvbiBwcmVmYXVsdGVkIFBURXMgKi8KIAkJaWYgKHVubGlrZWx5KChyZXQgJiBWTV9G
QVVMVF9FUlJPUikpKSB7CiAJCQlpZiAoaSA9PSAwKQotCQkJCWdvdG8gb3V0X2lvX3VubG9jazsK
KwkJCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwogCQkJZWxzZQogCQkJCWJyZWFrOwogCQl9CkBA
IC0zMDcsMTAgKzI5NSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0
cnVjdCB2bV9mYXVsdCAqdm1mLAogCQlpZiAodW5saWtlbHkoKytwYWdlX29mZnNldCA+PSBwYWdl
X2xhc3QpKQogCQkJYnJlYWs7CiAJfQotCXJldCA9IFZNX0ZBVUxUX05PUEFHRTsKLW91dF9pb191
bmxvY2s6Ci0JdHRtX21lbV9pb191bmxvY2sobWFuKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiBW
TV9GQVVMVF9OT1BBR0U7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9mYXVsdF9yZXNlcnZl
ZCk7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oCmluZGV4IDY2Y2E0OWRiOTYzMy4uM2MwODJkM2Q2OTU5IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCisrKyBiL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fYXBpLmgKQEAgLTYyLDggKzYyLDYgQEAgc3RydWN0IHR0bV9scnVfYnVsa19t
b3ZlOwogICogQGlzX2lvbWVtOgkJaXMgdGhpcyBpbyBtZW1vcnkgPwogICogQHNpemU6CQlzaXpl
IGluIGJ5dGUKICAqIEBvZmZzZXQ6CQlvZmZzZXQgZnJvbSB0aGUgYmFzZSBhZGRyZXNzCi0gKiBA
aW9fcmVzZXJ2ZWRfdm06ICAgICBUaGUgVk0gc3lzdGVtIGhhcyBhIHJlZmNvdW50IGluIEBpb19y
ZXNlcnZlZF9jb3VudAotICogQGlvX3Jlc2VydmVkX2NvdW50OiAgUmVmY291bnRpbmcgdGhlIG51
bWJlcnMgb2YgY2FsbGVycyB0byB0dG1fbWVtX2lvX3Jlc2VydmUKICAqCiAgKiBTdHJ1Y3R1cmUg
aW5kaWNhdGluZyB0aGUgYnVzIHBsYWNlbWVudCBvZiBhbiBvYmplY3QuCiAgKi8KQEAgLTczLDEx
ICs3MSw4IEBAIHN0cnVjdCB0dG1fYnVzX3BsYWNlbWVudCB7CiAJdW5zaWduZWQgbG9uZwlzaXpl
OwogCXVuc2lnbmVkIGxvbmcJb2Zmc2V0OwogCWJvb2wJCWlzX2lvbWVtOwotCWJvb2wJCWlvX3Jl
c2VydmVkX3ZtOwotCXVpbnQ2NF90ICAgICAgICBpb19yZXNlcnZlZF9jb3VudDsKIH07CiAKLQog
LyoqCiAgKiBzdHJ1Y3QgdHRtX21lbV9yZWcKICAqCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAppbmRl
eCBjOWUwZmQwOWY0YjIuLjVjYjZiMjhmOTU0YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCkBA
IC02MDksMTEgKzYwOSw2IEBAIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibyk7CiAgKi8KIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfbG9ja2Vk
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogCi1pbnQgdHRtX21lbV9pb19yZXNlcnZl
X3ZtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwotdm9pZCB0dG1fbWVtX2lvX2ZyZWVf
dm0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Ci1pbnQgdHRtX21lbV9pb19sb2NrKHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLCBib29sIGludGVycnVwdGlibGUpOwotdm9p
ZCB0dG1fbWVtX2lvX3VubG9jayhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbik7Ci0K
IC8qKgogICogX190dG1fYm9fcmVzZXJ2ZToKICAqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
