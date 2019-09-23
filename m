Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A3BBD27
	for <lists+nouveau@lfdr.de>; Mon, 23 Sep 2019 22:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090789F4F;
	Mon, 23 Sep 2019 20:40:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE189F5F
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:01 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE20718C37B
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:00 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id g82so7224532wmg.9
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBUWX0v1EoPnQi+r80QoiPw8Qj/OeYC9a+VeTlpswS8=;
 b=KQRY1xHNwS66uqcUeFY989NZfA23hA56qQ7Oyqrh9b1QqWM02/tCkRs0G6Yz4Vjv1S
 +aZA6VQ0FWNyodrv5YWmzzj+6gNOSyfw1uC5UvYWOapPrin8hZZF+QNeEDQnl3881aZ1
 k5hl76lLIEyNrsXw9ekC6WZ51J8/RM+Ur77VHVxytPVFgM/lFrmvWneVJWEutHYYCIMf
 OLDmTCU9qonTILo5nwYz+fnNFSVW5UajcU6O5nOtUa1ziKFZw4jLnlxXOAufUxCHbLKn
 xShRk0qJqA+NtIut0YURQCMjjz1Mk+XbBypplLpiKLPSAn8aNcfw8rWtX6nmfDnaRBHP
 wjcQ==
X-Gm-Message-State: APjAAAUrS1kGOQ17B1KNfoJjHmAbc+Q4d5l+4hPzNhwQ79aS6dF/0dJ5
 26MpkIsWhcVg4OZM39P8Er0KjewoQk5NWWxFucy7a2f0LXKzQ9k+e1UvbHuRS8hYrK/3cxRbe7s
 ng7pkpr7wbvMxTBevISMtoQsOkQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr849374wro.275.1569271199343;
 Mon, 23 Sep 2019 13:39:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+2qhxLXy10Y8UmkVXb+HrNOYeib7yqymqWyW9zjowG45qEQhLIqFiiTq7iJdYyA42TzLx8g==
X-Received: by 2002:adf:f401:: with SMTP id g1mr849370wro.275.1569271199184;
 Mon, 23 Sep 2019 13:39:59 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:2d3c:bd88:58b8:6e7c])
 by smtp.gmail.com with ESMTPSA id o9sm21912918wrh.46.2019.09.23.13.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 13:39:57 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 23 Sep 2019 22:39:45 +0200
Message-Id: <20190923203951.1652-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923203951.1652-1-kherbst@redhat.com>
References: <20190923203951.1652-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/8] pci/gk104: enable dl_mgr safe mode
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
