Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722C1488AC
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2020 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63B472ACC;
	Fri, 24 Jan 2020 14:30:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8607072ACC;
 Fri, 24 Jan 2020 14:30:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so2236270wrr.1;
 Fri, 24 Jan 2020 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mRWuwmjboI7kPSIb5Ytgo4kHCKiv020QjA5PjwE+/Y8=;
 b=Cn/TaG+XFVaiyBWG4SONXbB5ejERCe/pAXCEdhIf/2Fv2g7qt43Bm6P5PDWQ/BGT1f
 oT4uCV6jGMdQQDjGCNYK+BK9GeMRhctGC2o7UhTYPN8ucjdY/wWquWU2OnE4vtCGNVMO
 pQw1B7p3Z7+HRIVSC5nolC2suhKm4VZxw+zKoEjVOKL78eHrvFeKbyQP8yzM9PjIhCBS
 w2iUVwWYYc8i5+54JFu/phJcfzgoLZNbfOLA0s+gavRKHhd2B8cFpHNDfOPnu0lrAFix
 zt85lfKEx3h422SEqUWihcSPSKOVxUhWGNOd3U7+Xd34n+HEgmJvsRl87SJfVR/IVX+c
 nQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRWuwmjboI7kPSIb5Ytgo4kHCKiv020QjA5PjwE+/Y8=;
 b=cU0Z7IE1tl6hB8rqhl9jUujflB3Uc13k1m5hBJBbfD9pGXBG5C2h/xV69R16Jgz5lV
 UZjWRrvHagifhCnFw4pQs7XypYZfh+cxTWiDknRcBnxEQkJZG0t7LmXeGSm4XLQkXfks
 /+v2yQyXMcmGn10xwrk6on0kRbQt1czoTGFB2s9DeVLLtuPTiLqjC0V34cqBT/lA+iyW
 kQlROmat1Ju/5Q3s+B8rLA7jK3rIJvN90EYZngZQz7WXv7eMbVKEj7nduGvcVrGUx+6f
 B4xSEna0HUpgjb+WdcZ238KgrgqPvthEUUc/p5c3nJ2/0QHY7GDacctaBIcVDrVRlgCj
 wOmg==
X-Gm-Message-State: APjAAAVPyQaN/rW/0XWt1od7N1njkieEPNKRr03252oLwm0xd1yw51QG
 0rBobwA25jPuApr43+FhkQ4=
X-Google-Smtp-Source: APXvYqyhQcp+tKsxMAYA+50GOkzyRlaG3qEq9j0Hy94P6y7FDb29nMv1XZF7i53VB/SCkyLRNCbj6Q==
X-Received: by 2002:adf:e887:: with SMTP id d7mr4569647wrm.162.1579876246036; 
 Fri, 24 Jan 2020 06:30:46 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9c03:ec12:e225:5a75])
 by smtp.gmail.com with ESMTPSA id f207sm8381679wme.9.2020.01.24.06.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 06:30:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bskeggs@redhat.com, airlied@linux.ie, imirkin@alum.mit.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Fri, 24 Jan 2020 15:30:41 +0100
Message-Id: <20200124143042.93733-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124143042.93733-1-christian.koenig@amd.com>
References: <20200124143042.93733-1-christian.koenig@amd.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 1/2] drm/nouveau: move io_reserve_lru handling
 into the driver v2
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
CgpXaGlsZSB3b3JraW5nIG9uIFRUTSBjbGVhbnVwcyBJJ3ZlIGZvdW5kIHRoYXQgdGhlIGlvX3Jl
c2VydmVfbHJ1IHVzZWQgYnkKTm91dmVhdSBpcyBhY3R1YWxseSBub3Qgd29ya2luZyBhdCBhbGwu
CgpJbiBnZW5lcmFsIHdlIHNob3VsZCByZW1vdmUgZHJpdmVyIHNwZWNpZmljIGhhbmRsaW5nIGZy
b20gdGhlIG1lbW9yeQptYW5hZ2VtZW50LCBzbyB0aGlzIHBhdGNoIG1vdmVzIHRoZSBpb19yZXNl
cnZlX2xydSBoYW5kbGluZyBpbnRvIE5vdXZlYXUKaW5zdGVhZC4KClRoZSBwYXRjaCBzaG91bGQg
YmUgZnVuY3Rpb25hbCBjb3JyZWN0LCBidXQgaXMgb25seSBjb21waWxlIHRlc3RlZCEKCnYyOiBk
b24ndCBjYWxsIHR0bV9ib191bm1hcF92aXJ0dWFsIGluIG5vdXZlYXVfdHRtX2lvX21lbV9yZXNl
cnZlCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgfCAxMDcgKysrKysrKysr
KysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uaCAg
fCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCB8ICAgMiArCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIHwgIDQzICsrKysrKysrKystCiA0
IGZpbGVzIGNoYW5nZWQsIDEzMSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggODE2NjgxMDQ1OTVmLi5hY2VlMDU0Zjc3
ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEzNyw2ICsxMzcsNyBA
QCBub3V2ZWF1X2JvX2RlbF90dG0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIAlzdHJ1
Y3Qgbm91dmVhdV9ibyAqbnZibyA9IG5vdXZlYXVfYm8oYm8pOwogCiAJV0FSTl9PTihudmJvLT5w
aW5fcmVmY250ID4gMCk7CisJbm91dmVhdV9ib19kZWxfaW9fcmVzZXJ2ZV9scnUoYm8pOwogCW52
MTBfYm9fcHV0X3RpbGVfcmVnaW9uKGRldiwgbnZiby0+dGlsZSwgTlVMTCk7CiAKIAkvKgpAQCAt
MzA0LDYgKzMwNSw3IEBAIG5vdXZlYXVfYm9faW5pdChzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibywg
dTY0IHNpemUsIGludCBhbGlnbiwgdTMyIGZsYWdzLAogCiAJbnZiby0+Ym8ubWVtLm51bV9wYWdl
cyA9IHNpemUgPj4gUEFHRV9TSElGVDsKIAlub3V2ZWF1X2JvX3BsYWNlbWVudF9zZXQobnZibywg
ZmxhZ3MsIDApOworCUlOSVRfTElTVF9IRUFEKCZudmJvLT5pb19yZXNlcnZlX2xydSk7CiAKIAly
ZXQgPSB0dG1fYm9faW5pdChudmJvLT5iby5iZGV2LCAmbnZiby0+Ym8sIHNpemUsIHR5cGUsCiAJ
CQkgICZudmJvLT5wbGFjZW1lbnQsIGFsaWduID4+IFBBR0VfU0hJRlQsIGZhbHNlLApAQCAtNTc0
LDYgKzU3NiwyNiBAQCBub3V2ZWF1X2JvX3N5bmNfZm9yX2NwdShzdHJ1Y3Qgbm91dmVhdV9ibyAq
bnZibykKIAkJCQkJUEFHRV9TSVpFLCBETUFfRlJPTV9ERVZJQ0UpOwogfQogCit2b2lkIG5vdXZl
YXVfYm9fYWRkX2lvX3Jlc2VydmVfbHJ1KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCit7
CisJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2JkZXYoYm8tPmJkZXYpOworCXN0
cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9ibyhibyk7CisKKwltdXRleF9sb2NrKCZk
cm0tPnR0bS5pb19yZXNlcnZlX211dGV4KTsKKwlsaXN0X21vdmVfdGFpbCgmbnZiby0+aW9fcmVz
ZXJ2ZV9scnUsICZkcm0tPnR0bS5pb19yZXNlcnZlX2xydSk7CisJbXV0ZXhfdW5sb2NrKCZkcm0t
PnR0bS5pb19yZXNlcnZlX211dGV4KTsKK30KKwordm9pZCBub3V2ZWF1X2JvX2RlbF9pb19yZXNl
cnZlX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQoreworCXN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtID0gbm91dmVhdV9iZGV2KGJvLT5iZGV2KTsKKwlzdHJ1Y3Qgbm91dmVhdV9ibyAq
bnZibyA9IG5vdXZlYXVfYm8oYm8pOworCisJbXV0ZXhfbG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2
ZV9tdXRleCk7CisJbGlzdF9kZWxfaW5pdCgmbnZiby0+aW9fcmVzZXJ2ZV9scnUpOworCW11dGV4
X3VubG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7Cit9CisKIGludAogbm91dmVhdV9i
b192YWxpZGF0ZShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibywgYm9vbCBpbnRlcnJ1cHRpYmxlLAog
CQkgICAgYm9vbCBub193YWl0X2dwdSkKQEAgLTY3NSw4ICs2OTcsNiBAQCBub3V2ZWF1X2JvX2lu
aXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJ
CQl9CiAKIAkJCW1hbi0+ZnVuYyA9ICZub3V2ZWF1X3ZyYW1fbWFuYWdlcjsKLQkJCW1hbi0+aW9f
cmVzZXJ2ZV9mYXN0cGF0aCA9IGZhbHNlOwotCQkJbWFuLT51c2VfaW9fcmVzZXJ2ZV9scnUgPSB0
cnVlOwogCQl9IGVsc2UgewogCQkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7CiAJ
CX0KQEAgLTEzMDUsNiArMTMyNSw4IEBAIG5vdXZlYXVfYm9fbW92ZV9udGZ5KHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCiAJaWYgKGJvLT5kZXN0cm95ICE9IG5vdXZl
YXVfYm9fZGVsX3R0bSkKIAkJcmV0dXJuOwogCisJbm91dmVhdV9ib19kZWxfaW9fcmVzZXJ2ZV9s
cnUoYm8pOworCiAJaWYgKG1lbSAmJiBuZXdfcmVnLT5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVN
ICYmCiAJICAgIG1lbS0+bWVtLnBhZ2UgPT0gbnZiby0+cGFnZSkgewogCQlsaXN0X2Zvcl9lYWNo
X2VudHJ5KHZtYSwgJm52Ym8tPnZtYV9saXN0LCBoZWFkKSB7CkBAIC0xNDI3LDYgKzE0NDksMzAg
QEAgbm91dmVhdV9ib192ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IHN0cnVjdCBmaWxlICpmaWxwKQogCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7CiB9CiAKK3N0
YXRpYyB2b2lkCitub3V2ZWF1X3R0bV9pb19tZW1fZnJlZV9sb2NrZWQoc3RydWN0IG5vdXZlYXVf
ZHJtICpkcm0sIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQoreworCXN0cnVjdCBub3V2ZWF1X21l
bSAqbWVtID0gbm91dmVhdV9tZW0ocmVnKTsKKworCWlmICghcmVnLT5idXMuYmFzZSkKKwkJcmV0
dXJuOyAvKiBhbHJlYWR5IGZyZWVkICovCisKKwlpZiAoZHJtLT5jbGllbnQubWVtLT5vY2xhc3Mg
Pj0gTlZJRl9DTEFTU19NRU1fTlY1MCkgeworCQlzd2l0Y2ggKHJlZy0+bWVtX3R5cGUpIHsKKwkJ
Y2FzZSBUVE1fUExfVFQ6CisJCQlpZiAobWVtLT5raW5kKQorCQkJCW52aWZfb2JqZWN0X3VubWFw
X2hhbmRsZSgmbWVtLT5tZW0ub2JqZWN0KTsKKwkJCWJyZWFrOworCQljYXNlIFRUTV9QTF9WUkFN
OgorCQkJbnZpZl9vYmplY3RfdW5tYXBfaGFuZGxlKCZtZW0tPm1lbS5vYmplY3QpOworCQkJYnJl
YWs7CisJCWRlZmF1bHQ6CisJCQlicmVhazsKKwkJfQorCX0KKwlyZWctPmJ1cy5iYXNlID0gMDsK
K30KKwogc3RhdGljIGludAogbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQogewpAQCAtMTQzNCwxOCAr
MTQ4MCwyNiBAQCBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnICpyZWcpCiAJc3RydWN0IG5vdXZlYXVfZHJtICpk
cm0gPSBub3V2ZWF1X2JkZXYoYmRldik7CiAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2UgPSBu
dnh4X2RldmljZSgmZHJtLT5jbGllbnQuZGV2aWNlKTsKIAlzdHJ1Y3Qgbm91dmVhdV9tZW0gKm1l
bSA9IG5vdXZlYXVfbWVtKHJlZyk7CisJc3RydWN0IG5vdXZlYXVfYm8gKm52Ym87CisJaW50IHJl
dDsKKworCWlmIChyZWctPmJ1cy5iYXNlKQorCQlyZXR1cm4gMDsgLyogYWxyZWFkeSBtYXBwZWQg
Ki8KIAogCXJlZy0+YnVzLmFkZHIgPSBOVUxMOwogCXJlZy0+YnVzLm9mZnNldCA9IDA7CiAJcmVn
LT5idXMuc2l6ZSA9IHJlZy0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Ci0JcmVnLT5idXMuYmFz
ZSA9IDA7CiAJcmVnLT5idXMuaXNfaW9tZW0gPSBmYWxzZTsKIAlpZiAoIShtYW4tPmZsYWdzICYg
VFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSkpCiAJCXJldHVybiAtRUlOVkFMOworCisJbXV0ZXhf
bG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7CityZXRyeToKIAlzd2l0Y2ggKHJlZy0+
bWVtX3R5cGUpIHsKIAljYXNlIFRUTV9QTF9TWVNURU06CiAJCS8qIFN5c3RlbSBtZW1vcnkgKi8K
LQkJcmV0dXJuIDA7CisJCXJldCA9IDA7CisJCWdvdG8gb3V0OwogCWNhc2UgVFRNX1BMX1RUOgog
I2lmIElTX0VOQUJMRUQoQ09ORklHX0FHUCkKIAkJaWYgKGRybS0+YWdwLmJyaWRnZSkgewpAQCAt
MTQ2OSw3ICsxNTIzLDYgQEAgbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQogCQkJfSBhcmdzOwogCQkJ
dTY0IGhhbmRsZSwgbGVuZ3RoOwogCQkJdTMyIGFyZ2MgPSAwOwotCQkJaW50IHJldDsKIAogCQkJ
c3dpdGNoIChtZW0tPm1lbS5vYmplY3Qub2NsYXNzKSB7CiAJCQljYXNlIE5WSUZfQ0xBU1NfTUVN
X05WNTA6CkBAIC0xNDkzLDM4ICsxNTQ2LDQ2IEBAIG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZl
KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKnJlZykKIAkJ
CXJldCA9IG52aWZfb2JqZWN0X21hcF9oYW5kbGUoJm1lbS0+bWVtLm9iamVjdCwKIAkJCQkJCSAg
ICAgJmFyZ3MsIGFyZ2MsCiAJCQkJCQkgICAgICZoYW5kbGUsICZsZW5ndGgpOwotCQkJaWYgKHJl
dCAhPSAxKQotCQkJCXJldHVybiByZXQgPyByZXQgOiAtRUlOVkFMOworCQkJaWYgKHJldCAhPSAx
KSB7CisJCQkJcmV0ID0gcmV0ID8gcmV0IDogLUVJTlZBTDsKKwkJCQlnb3RvIG91dDsKKwkJCX0K
KwkJCXJldCA9IDA7CiAKIAkJCXJlZy0+YnVzLmJhc2UgPSAwOwogCQkJcmVnLT5idXMub2Zmc2V0
ID0gaGFuZGxlOwogCQl9CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0JCXJldHVybiAtRUlOVkFMOwor
CQlyZXQgPSAtRUlOVkFMOwogCX0KLQlyZXR1cm4gMDsKKworb3V0OgorCWlmIChyZXQgPT0gLUVB
R0FJTikgeworCQludmJvID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZkcm0tPnR0bS5pb19y
ZXNlcnZlX2xydSwKKwkJCQkJCXR5cGVvZigqbnZibyksCisJCQkJCQlpb19yZXNlcnZlX2xydSk7
CisJCWlmIChudmJvKSB7CisJCQlsaXN0X2RlbF9pbml0KCZudmJvLT5pb19yZXNlcnZlX2xydSk7
CisJCQlkcm1fdm1hX25vZGVfdW5tYXAoJm52Ym8tPmJvLmJhc2Uudm1hX25vZGUsCisJCQkJCSAg
IGJkZXYtPmRldl9tYXBwaW5nKTsKKwkJCW5vdXZlYXVfdHRtX2lvX21lbV9mcmVlX2xvY2tlZChk
cm0sICZudmJvLT5iby5tZW0pOworCQkJZ290byByZXRyeTsKKwkJfQorCisJfQorCW11dGV4X3Vu
bG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7CisJcmV0dXJuIHJldDsKIH0KIAogc3Rh
dGljIHZvaWQKIG5vdXZlYXVfdHRtX2lvX21lbV9mcmVlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKnJlZykKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRy
bSA9IG5vdXZlYXVfYmRldihiZGV2KTsKLQlzdHJ1Y3Qgbm91dmVhdV9tZW0gKm1lbSA9IG5vdXZl
YXVfbWVtKHJlZyk7CiAKLQlpZiAoZHJtLT5jbGllbnQubWVtLT5vY2xhc3MgPj0gTlZJRl9DTEFT
U19NRU1fTlY1MCkgewotCQlzd2l0Y2ggKHJlZy0+bWVtX3R5cGUpIHsKLQkJY2FzZSBUVE1fUExf
VFQ6Ci0JCQlpZiAobWVtLT5raW5kKQotCQkJCW52aWZfb2JqZWN0X3VubWFwX2hhbmRsZSgmbWVt
LT5tZW0ub2JqZWN0KTsKLQkJCWJyZWFrOwotCQljYXNlIFRUTV9QTF9WUkFNOgotCQkJbnZpZl9v
YmplY3RfdW5tYXBfaGFuZGxlKCZtZW0tPm1lbS5vYmplY3QpOwotCQkJYnJlYWs7Ci0JCWRlZmF1
bHQ6Ci0JCQlicmVhazsKLQkJfQotCX0KKwltdXRleF9sb2NrKCZkcm0tPnR0bS5pb19yZXNlcnZl
X211dGV4KTsKKwlub3V2ZWF1X3R0bV9pb19tZW1fZnJlZV9sb2NrZWQoZHJtLCByZWcpOworCW11
dGV4X3VubG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7CiB9CiAKIHN0YXRpYyBpbnQK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uaCBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uaAppbmRleCAzOGY5ZDgzNTA5NjMuLmM0N2Zj
ZGY4MGFkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uaApAQCAtMTcsNiArMTcs
NyBAQCBzdHJ1Y3Qgbm91dmVhdV9ibyB7CiAJYm9vbCBmb3JjZV9jb2hlcmVudDsKIAlzdHJ1Y3Qg
dHRtX2JvX2ttYXBfb2JqIGttYXA7CiAJc3RydWN0IGxpc3RfaGVhZCBoZWFkOworCXN0cnVjdCBs
aXN0X2hlYWQgaW9fcmVzZXJ2ZV9scnU7CiAKIAkvKiBwcm90ZWN0ZWQgYnkgdHRtX2JvX3Jlc2Vy
dmUoKSAqLwogCXN0cnVjdCBkcm1fZmlsZSAqcmVzZXJ2ZWRfYnk7CkBAIC05Miw2ICs5Myw4IEBA
IGludCAgbm91dmVhdV9ib192YWxpZGF0ZShzdHJ1Y3Qgbm91dmVhdV9ibyAqLCBib29sIGludGVy
cnVwdGlibGUsCiAJCQkgYm9vbCBub193YWl0X2dwdSk7CiB2b2lkIG5vdXZlYXVfYm9fc3luY19m
b3JfZGV2aWNlKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvKTsKIHZvaWQgbm91dmVhdV9ib19zeW5j
X2Zvcl9jcHUoc3RydWN0IG5vdXZlYXVfYm8gKm52Ym8pOwordm9pZCBub3V2ZWF1X2JvX2FkZF9p
b19yZXNlcnZlX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKK3ZvaWQgbm91dmVh
dV9ib19kZWxfaW9fcmVzZXJ2ZV9scnUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CiAK
IC8qIFRPRE86IHN1Ym1pdCBlcXVpdmFsZW50IHRvIFRUTSBnZW5lcmljIEFQSSB1cHN0cmVhbT8g
Ki8KIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2Rydi5oCmluZGV4IGRhOGM0NmUwOTk0My4uY2QxOWM4Y2U1OTM5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKQEAgLTE1OCw2ICsxNTgsOCBAQCBzdHJ1Y3Qgbm91dmVh
dV9kcm0gewogCQlpbnQgdHlwZV92cmFtOwogCQlpbnQgdHlwZV9ob3N0WzJdOwogCQlpbnQgdHlw
ZV9uY29oWzJdOworCQlzdHJ1Y3QgbXV0ZXggaW9fcmVzZXJ2ZV9tdXRleDsKKwkJc3RydWN0IGxp
c3RfaGVhZCBpb19yZXNlcnZlX2xydTsKIAl9IHR0bTsKIAogCS8qIEdFTSBpbnRlcmZhY2Ugc3Vw
cG9ydCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKaW5kZXggNzdhMGM2YWQz
Y2VmLi41MDUxOGI0OGU5YjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwpA
QCAtMTYyLDEzICsxNjIsNTEgQEAgY29uc3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1
bmMgbnYwNF9nYXJ0X21hbmFnZXIgPSB7CiAJLmRlYnVnID0gbm91dmVhdV9tYW5hZ2VyX2RlYnVn
CiB9OwogCitzdGF0aWMgdm1fZmF1bHRfdCBub3V2ZWF1X3R0bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1
bHQgKnZtZikKK3sKKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOworCXN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKKwlwZ3By
b3RfdCBwcm90OworCXZtX2ZhdWx0X3QgcmV0OworCisJcmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUo
Ym8sIHZtZik7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCW5vdXZlYXVfYm9fZGVsX2lv
X3Jlc2VydmVfbHJ1KGJvKTsKKworCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxh
Z3MpOworCXJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHByb3QsIFRUTV9CT19W
TV9OVU1fUFJFRkFVTFQpOworCWlmIChyZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZs
YWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKQorCQlyZXR1cm4gcmV0OworCisJbm91dmVh
dV9ib19hZGRfaW9fcmVzZXJ2ZV9scnUoYm8pOworCisJZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNl
LnJlc3YpOworCisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIHN0cnVjdCB2bV9vcGVyYXRpb25z
X3N0cnVjdCBub3V2ZWF1X3R0bV92bV9vcHMgPSB7CisJLmZhdWx0ID0gbm91dmVhdV90dG1fZmF1
bHQsCisJLm9wZW4gPSB0dG1fYm9fdm1fb3BlbiwKKwkuY2xvc2UgPSB0dG1fYm9fdm1fY2xvc2Us
CisJLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nlc3MKK307CisKIGludAogbm91dmVhdV90dG1fbW1h
cChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CiAJc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7CiAJc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShmaWxlX3ByaXYtPm1pbm9yLT5kZXYpOworCWlu
dCByZXQ7CiAKLQlyZXR1cm4gdHRtX2JvX21tYXAoZmlscCwgdm1hLCAmZHJtLT50dG0uYmRldik7
CisJcmV0ID0gdHRtX2JvX21tYXAoZmlscCwgdm1hLCAmZHJtLT50dG0uYmRldik7CisJaWYgKHJl
dCkKKwkJcmV0dXJuIHJldDsKKworCXZtYS0+dm1fb3BzID0gJm5vdXZlYXVfdHRtX3ZtX29wczsK
KwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludApAQCAtMjczLDYgKzMxMSw5IEBAIG5vdXZlYXVf
dHRtX2luaXQoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0pCiAJCXJldHVybiByZXQ7CiAJfQogCisJ
bXV0ZXhfaW5pdCgmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7CisJSU5JVF9MSVNUX0hFQUQo
JmRybS0+dHRtLmlvX3Jlc2VydmVfbHJ1KTsKKwogCU5WX0lORk8oZHJtLCAiVlJBTTogJWQgTWlC
XG4iLCAodTMyKShkcm0tPmdlbS52cmFtX2F2YWlsYWJsZSA+PiAyMCkpOwogCU5WX0lORk8oZHJt
LCAiR0FSVDogJWQgTWlCXG4iLCAodTMyKShkcm0tPmdlbS5nYXJ0X2F2YWlsYWJsZSA+PiAyMCkp
OwogCXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
