Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C813B2A
	for <lists+nouveau@lfdr.de>; Sat,  4 May 2019 18:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04112893C0;
	Sat,  4 May 2019 16:32:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532CC89381
 for <nouveau@lists.freedesktop.org>; Sat,  4 May 2019 16:32:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s18so1849369wmh.0
 for <nouveau@lists.freedesktop.org>; Sat, 04 May 2019 09:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mW7sIrlZhBnwOvsitNIUn+Rap474mH9WYLMQFB7jzlY=;
 b=n2o/yVXDOG8O3+h5dSjk2oZNyiTqd+U9G2FKnXaKbDxNH4RHlSbTbvUFxc47FTiygt
 uaU2KYt4AZB0J9BSdcfN2KDFr/0hJygO/M3KzDsUa9lSmFRnjEVLwhe+nlVovO7yAomW
 8yunhk8w6djlpOj4v2FSJy4WDubdfPoql6HdnrfcM/gH4pEz8D1SVZN6Rm+B8kOICrsp
 jYxc1wgGTHWwacDrNWEDRERB+QlssjwiO9HmKKTWtj+ug0WEZ2op1Dgjd7LwyrLeA3I2
 ABiN0i3GYJAA/h//UVYcP2M//OCH9NqucbITVsbHxjQj4U90WNaByb6piCqS7vsOjyhN
 iGsg==
X-Gm-Message-State: APjAAAWsShmtQF+dvyCnwBlaSG1o5MSpI9l2oyFANDH++3SBLXV+DjMV
 dPk7zj0v8tA0gsv56Gt6awhgs++yDqc=
X-Google-Smtp-Source: APXvYqxCBNLl2GcjmeWFJ6PnFEfqZQDgicnizJ43FnQFFyeVSxTqyhbg7cfyPE6eeyItXuZH4ve0OA==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr11006750wmq.102.1556987546674; 
 Sat, 04 May 2019 09:32:26 -0700 (PDT)
Received: from kherbst.pingu ([2a02:8308:b0be:6900:3cb7:ac97:41a7:519d])
 by smtp.gmail.com with ESMTPSA id z17sm3824707wrm.33.2019.05.04.09.32.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 May 2019 09:32:25 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Sat,  4 May 2019 18:32:16 +0200
Message-Id: <20190504163219.8349-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504163219.8349-1-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/5] pci: enable pcie link changes for pascal
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Ci0tLQogZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCAgOCArKysrLS0tLQogZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMgfCAxMCArKysrKysrKysrCiBkcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvcHJpdi5oICB8ICA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvcGNpL2drMTA0LmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQu
YwppbmRleCBlNjgwMzA1MC4uNjY0ODkwMTggMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L3BjaS9nazEwNC5jCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEw
NC5jCkBAIC0yMyw3ICsyMyw3IEBACiAgKi8KICNpbmNsdWRlICJwcml2LmgiCiAKLXN0YXRpYyBp
bnQKK2ludAogZ2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZChzdHJ1Y3QgbnZrbV9wY2kgKnBj
aSkKIHsKIAlyZXR1cm4gKG52a21fcmQzMihwY2ktPnN1YmRldi5kZXZpY2UsIDB4OGMxYzApICYg
MHg0KSA9PSAweDQgPyAyIDogMTsKQEAgLTEwOCw3ICsxMDgsNyBAQCBnazEwNF9wY2llX2xua2N0
bF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkKIAlyZXR1cm4gLTE7CiB9CiAKLXN0YXRpYyBl
bnVtIG52a21fcGNpZV9zcGVlZAorZW51bSBudmttX3BjaWVfc3BlZWQKIGdrMTA0X3BjaWVfbWF4
X3NwZWVkKHN0cnVjdCBudmttX3BjaSAqcGNpKQogewogCXUzMiBtYXhfc3BlZWQgPSBudmttX3Jk
MzIocGNpLT5zdWJkZXYuZGV2aWNlLCAweDhjMWMwKSAmIDB4MzAwMDAwOwpAQCAtMTQ2LDcgKzE0
Niw3IEBAIGdrMTA0X3BjaWVfc2V0X2xpbmtfc3BlZWQoc3RydWN0IG52a21fcGNpICpwY2ksIGVu
dW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkKQogCW52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4
MSwgMHgxKTsKIH0KIAotc3RhdGljIGludAoraW50CiBnazEwNF9wY2llX2luaXQoc3RydWN0IG52
a21fcGNpICogcGNpKQogewogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua2N0bF9zcGVlZCwgbWF4
X3NwZWVkLCBjYXBfc3BlZWQ7CkBAIC0xNzgsNyArMTc4LDcgQEAgZ2sxMDRfcGNpZV9pbml0KHN0
cnVjdCBudmttX3BjaSAqIHBjaSkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludAoraW50CiBn
azEwNF9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtIG52a21fcGNpZV9z
cGVlZCBzcGVlZCwgdTggd2lkdGgpCiB7CiAJc3RydWN0IG52a21fc3ViZGV2ICpzdWJkZXYgPSAm
cGNpLT5zdWJkZXY7CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3Ax
MDAuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9ncDEwMC5jCmluZGV4IDgyYzUyMzRh
Li5lYjE5YzdhNCAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAw
LmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMKQEAgLTM1LDYgKzM1
LDE2IEBAIGdwMTAwX3BjaV9mdW5jID0gewogCS53cjA4ID0gbnY0MF9wY2lfd3IwOCwKIAkud3Iz
MiA9IG52NDBfcGNpX3dyMzIsCiAJLm1zaV9yZWFybSA9IGdwMTAwX3BjaV9tc2lfcmVhcm0sCisK
KwkucGNpZS5pbml0ID0gZ2sxMDRfcGNpZV9pbml0LAorCS5wY2llLnNldF9saW5rID0gZ2sxMDRf
cGNpZV9zZXRfbGluaywKKworCS5wY2llLm1heF9zcGVlZCA9IGdrMTA0X3BjaWVfbWF4X3NwZWVk
LAorCS5wY2llLmN1cl9zcGVlZCA9IGc4NF9wY2llX2N1cl9zcGVlZCwKKworCS5wY2llLnNldF92
ZXJzaW9uID0gZ2YxMDBfcGNpZV9zZXRfdmVyc2lvbiwKKwkucGNpZS52ZXJzaW9uID0gZ2YxMDBf
cGNpZV92ZXJzaW9uLAorCS5wY2llLnZlcnNpb25fc3VwcG9ydGVkID0gZ2sxMDRfcGNpZV92ZXJz
aW9uX3N1cHBvcnRlZCwKIH07CiAKIGludApkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL3ByaXYuaCBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmgKaW5k
ZXggYzE3ZjYwNjMuLmEwZDRjMDA3IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcHJpdi5oCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmgKQEAg
LTU0LDYgKzU0LDExIEBAIGludCBnZjEwMF9wY2llX2NhcF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kg
Kik7CiBpbnQgZ2YxMDBfcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKIGludCBnZjEwMF9w
Y2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9zcGVlZCwgdTgp
OwogCitpbnQgZ2sxMDRfcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKK2ludCBnazEwNF9w
Y2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9zcGVlZCwgdTgg
d2lkdGgpOworZW51bSBudmttX3BjaWVfc3BlZWQgZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0
IG52a21fcGNpICopOworaW50IGdrMTA0X3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQoc3RydWN0IG52
a21fcGNpICopOworCiBpbnQgbnZrbV9wY2llX29uZWluaXQoc3RydWN0IG52a21fcGNpICopOwog
aW50IG52a21fcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKICNlbmRpZgotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
