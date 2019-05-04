Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F8B13B2F
	for <lists+nouveau@lfdr.de>; Sat,  4 May 2019 18:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F9F893E7;
	Sat,  4 May 2019 16:32:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26433893A8
 for <nouveau@lists.freedesktop.org>; Sat,  4 May 2019 16:32:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p21so10617501wmc.0
 for <nouveau@lists.freedesktop.org>; Sat, 04 May 2019 09:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcwyi8P4IAspzSpjorTOkrW2MWXRFdKVrBvhkJ3JsPI=;
 b=bDAUWIjpP743sE84lecPNA99s8E4TzietTqBWNpMtaP+SS7Rff8180/zHGQTml4QxW
 tnNS7fBUdpUYYg2mYIVpH7xAt4yBQce9g4qcDeYWBpRWZeOpxGneuFOzjvsUlj9simDK
 t1tfYW6s5DVH1DuuMPhEtTDUwGOQPRu1O08cZjJVKMkBJv2LpwtNzUoni8rMLnZGjVw0
 3lX0hrWu00wF9DBoOJt+qH8BKVTL6BokoDmexnyd2Z6U16ppriA39HOLUy8ByGJKu1zX
 7aD3zIbk3VbjBxN6DYTGo5wTPqTDvqGvkT5ZeN77/Q+Wj5HUcPsj/u/Ra6Os/pBLqcCr
 BhDg==
X-Gm-Message-State: APjAAAXciKjU+7AuIAE1NQPsaM3aGYuJhCDPlG+vIK59G/icQlQKUA3g
 P9Q8/pBKBXVVev1lGm8QbLH/byhQirs=
X-Google-Smtp-Source: APXvYqw/bk0eqphbPYqZ3PxPkD53gOpCgY03bzwQ6nVgOrM68FAahBR0frIglFI1RtRtTAIXqUntSQ==
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr11298340wmq.31.1556987551586; 
 Sat, 04 May 2019 09:32:31 -0700 (PDT)
Received: from kherbst.pingu ([2a02:8308:b0be:6900:3cb7:ac97:41a7:519d])
 by smtp.gmail.com with ESMTPSA id z17sm3824707wrm.33.2019.05.04.09.32.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 May 2019 09:32:30 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Sat,  4 May 2019 18:32:19 +0200
Message-Id: <20190504163219.8349-6-kherbst@redhat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504163219.8349-1-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 5/5] pci: restore the boot pcie link speed on fini
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

Zml4ZXMgcnVudGltZSBzdXNwZW5kIG9uIG15IGdwMTA3CgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBI
ZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KLS0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvYmFzZS5jIHwgMiArKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyB8IDgg
KysrKysrKysKIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmggfCAxICsKIDMgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L3BjaS9iYXNlLmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYmFzZS5j
CmluZGV4IGI2ZWJlZTZmLi5kOWZiNWE4MyAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2Jhc2UuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYmFzZS5j
CkBAIC05MCw2ICs5MCw4IEBAIG52a21fcGNpX2Zpbmkoc3RydWN0IG52a21fc3ViZGV2ICpzdWJk
ZXYsIGJvb2wgc3VzcGVuZCkKIAogCWlmIChwY2ktPmFncC5icmlkZ2UpCiAJCW52a21fYWdwX2Zp
bmkocGNpKTsKKwllbHNlIGlmIChwY2lfaXNfcGNpZShwY2ktPnBkZXYpKQorCQludmttX3BjaWVf
ZmluaShwY2kpOwogCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcGNpZS5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYwpp
bmRleCA3MjdiNWQ2YS4uMDBjMDdmZDggMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9wY2llLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYwpA
QCAtMTE4LDYgKzExOCwxNCBAQCBudmttX3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkK
IAlyZXR1cm4gMDsKIH0KIAoraW50CitudmttX3BjaWVfZmluaShzdHJ1Y3QgbnZrbV9wY2kgKnBj
aSkKK3sKKwlpZiAoIUlTX0VSUl9WQUxVRShwY2ktPnBjaWUuZGVmX3NwZWVkKSkKKwkJcmV0dXJu
IG52a21fcGNpZV9zZXRfbGluayhwY2ksIHBjaS0+cGNpZS5kZWZfc3BlZWQsIDE2KTsKKwlyZXR1
cm4gMDsKK30KKwogaW50CiBudmttX3BjaWVfc2V0X2xpbmsoc3RydWN0IG52a21fcGNpICpwY2ks
IGVudW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkLCB1OCB3aWR0aCkKIHsKZGlmZiAtLWdpdCBhL2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmggYi9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcHJpdi5oCmluZGV4IGRjM2FlM2NkLi5lNzc0NDY3MSAxMDA2NDQKLS0tIGEvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAorKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcHJpdi5oCkBAIC02Miw0ICs2Miw1IEBAIGludCBnazEwNF9wY2llX3ZlcnNpb25fc3Vw
cG9ydGVkKHN0cnVjdCBudmttX3BjaSAqKTsKIGludCBudmttX3BjaWVfb25laW5pdChzdHJ1Y3Qg
bnZrbV9wY2kgKik7CiBpbnQgbnZrbV9wY2llX3ByZWluaXQoc3RydWN0IG52a21fcGNpICopOwog
aW50IG52a21fcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKK2ludCBudmttX3BjaWVfZmlu
aShzdHJ1Y3QgbnZrbV9wY2kgKik7CiAjZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
