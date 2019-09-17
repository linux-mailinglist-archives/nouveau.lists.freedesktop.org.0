Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E8B5748
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 23:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EC86ED6C;
	Tue, 17 Sep 2019 21:01:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D501D6ED6B
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:00:58 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60BBD85541
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:00:58 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id q10so1696246wro.22
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBUWX0v1EoPnQi+r80QoiPw8Qj/OeYC9a+VeTlpswS8=;
 b=VEBqqCxJ30Hv1dmRhsxVHGIDU0D/KnENrC4i2bHP9CSmx1QsMmKxtvewOkWWdghZQV
 8GjePt92WXmTlPXN5mCmJst/fouv5sVnSYplbK+9Z9ALlmbgVqYxSvH1E3X3emZdLr/P
 tIloQ8CJFkpMvriSX/EsBAZJpVLt8mHYD9yeAPondxR+ZdYkqhwyCu8hDwUDSlK3oSUD
 n0eP2nO6EmeVDmTmJigmv9eAk4Fyk6sDPF2iMg/4SldaZvqhIJEQ/kjcvPgZ+R/TnP9k
 Z1LjuMiS8mdK5gv521aHVo3Ei8Mq7e5xQgbbbDjw6Cd0zh+Y/t0IHV/9nFbW1IC7GqYH
 1R7A==
X-Gm-Message-State: APjAAAWi4MrPffLZZsCRve9TCh7Y0ilbi8wz7Fo43jhaWQHet3aEAG/Q
 PbNtSkZJ91xI8wysy+K40IZi6YuelwthrohYjC7okPq9AFXwUlTsx8l3HbquimpnacAQTDFSkb8
 AmMaL3uEZ/c26gnWOjaOqRqe22w==
X-Received: by 2002:adf:b3c1:: with SMTP id x1mr418082wrd.33.1568754056884;
 Tue, 17 Sep 2019 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybvBXaV6Ide1j+SODbeBoXEYTj6uGg18rdGuzY4nKmjuM3Fx9Cr9gYULH6WSN6Jd/lOvxe4A==
X-Received: by 2002:adf:b3c1:: with SMTP id x1mr418073wrd.33.1568754056724;
 Tue, 17 Sep 2019 14:00:56 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:e8b1:5ee7:bce5:6a14])
 by smtp.gmail.com with ESMTPSA id i74sm15907wmg.44.2019.09.17.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 14:00:55 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 23:00:46 +0200
Message-Id: <20190917210050.24457-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917210050.24457-1-kherbst@redhat.com>
References: <20190917210050.24457-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/6] pci/gk104: enable dl_mgr safe mode
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

bm8gaWRlYSB3aHkgYW5kIHdoYXQgaXQgZG9lcywgdGFrZW4gZnJvbSBudmdwdQoKU2lnbmVkLW9m
Zi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5j
IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKaW5kZXggYTQwMTRkNGE3Li4x
YzRmOWExY2QgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5j
CisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCkBAIC0xODQsNiArMTg0
LDcgQEAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmtt
X3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCXN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2
ID0gJnBjaS0+c3ViZGV2OwogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua19jdGxfc3BlZWQgPSBn
azEwNF9wY2llX2xua2N0bF9zcGVlZChwY2kpOwogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua19j
YXBfc3BlZWQgPSBnazEwNF9wY2llX2NhcF9zcGVlZChwY2kpOworCXUzMiBvbGRfZGxfbWdyOwog
CiAJaWYgKHNwZWVkID4gbG5rX2NhcF9zcGVlZCkgewogCQlzcGVlZCA9IGxua19jYXBfc3BlZWQ7
CkBAIC0xOTcsNyArMTk4LDkgQEAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCQkJICAiIGxua2N0
bCBzcGVlZFxuIik7CiAJfQogCisJb2xkX2RsX21nciA9IG52a21fbWFzayhzdWJkZXYtPmRldmlj
ZSwgMHg4YjhjMCwgMHg0LCAweDQpOwogCWdrMTA0X3BjaWVfc2V0X2xpbmtfc3BlZWQocGNpLCBz
cGVlZCk7CisJbnZrbV93cjMyKHN1YmRldi0+ZGV2aWNlLCAweDhiOGMwLCBvbGRfZGxfbWdyKTsK
IAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
