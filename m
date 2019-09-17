Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22100B5749
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 23:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AA66ED6A;
	Tue, 17 Sep 2019 21:01:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379206ED70
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:01:00 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B3FCB6412B
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:00:59 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j2so1715765wre.1
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+tJC70USFffW6UlJpAbmox9wTlT0FCHU5eWG0nFtiA=;
 b=AN52KtThum/zmtLfmrOyeOAmWz+8osHBarwdjT3LpTuw2kyvpqif3xUSsOEDGMyn9H
 vf8zittEQla1IHD0jMJIWxOcKxPARZDzD8bq+0ZcjfAv5bvcVioyltMBVLmmCdBylj/5
 nX2LKnclx2BltKO2tu/CSjWqRIMa0uei7OOxpwrQ5uZSYNA8zmztJNsrqf/eKi5rAguv
 fz5KLYYtYvqmO+vlrgtWCHbg0utm/MNoCskG5wbj3eQArBPJm/Dp7pJKymjcgZ2xwZBc
 g3xhtiC9/WBreht8mvQzXUnOsJTLqwhe3GkF8g41zXisqGmGSP3G7DQqZELfeppUPcF0
 zwug==
X-Gm-Message-State: APjAAAXgLTuW+T3QBAPqycPxP0Z/XsUFNLmlUCzJeQSC0uHaOsqTxVnZ
 JnsmjRujx3lY77KjZemNSww7m1lE9kxLkHldF0jMoCrRqyKN7fijnqI0Zhuh0YDLxTQ21h5Xtz8
 2OM7gNGfVepwIMGWGFi3iKSCdGg==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr47974wmd.100.1568754058074;
 Tue, 17 Sep 2019 14:00:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbE+PJePC68W38+1qiqiipH7aGy9cqKpkHel9QWuwJcFtU90VuR+gmNKtfxh2mdDEMGLe96g==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr47963wmd.100.1568754057910;
 Tue, 17 Sep 2019 14:00:57 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:e8b1:5ee7:bce5:6a14])
 by smtp.gmail.com with ESMTPSA id i74sm15907wmg.44.2019.09.17.14.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 14:00:57 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 23:00:47 +0200
Message-Id: <20190917210050.24457-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917210050.24457-1-kherbst@redhat.com>
References: <20190917210050.24457-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 3/6] pci/gk104: wait for ltssm idle before
 changing the link
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

dGFrZW4gZnJvbSBudmdwdQoKdjI6IHJldHVybiAtRUJVU1kgd2hlbiB0aGUgdGltZW91dCBpcyBy
ZWFjaGVkCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4K
LS0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyB8IDE3ICsrKysrKysrKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyBiL2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCmluZGV4IDFjNGY5YTFjZC4uZGRhMTEzYTQ1
IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYworKysgYi9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYwpAQCAtMjMsNiArMjMsOCBAQAogICov
CiAjaW5jbHVkZSAicHJpdi5oIgogCisjaW5jbHVkZSA8c3ViZGV2L3RpbWVyLmg+CisKIHN0YXRp
YyBpbnQKIGdrMTA0X3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQoc3RydWN0IG52a21fcGNpICpwY2kp
CiB7CkBAIC0xMjMsNyArMTI1LDcgQEAgZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0IG52a21f
cGNpICpwY2kpCiAJcmV0dXJuIE5WS01fUENJRV9TUEVFRF8yXzU7CiB9CiAKLXN0YXRpYyB2b2lk
CitzdGF0aWMgaW50CiBnazEwNF9wY2llX3NldF9saW5rX3NwZWVkKHN0cnVjdCBudmttX3BjaSAq
cGNpLCBlbnVtIG52a21fcGNpZV9zcGVlZCBzcGVlZCkKIHsKIAlzdHJ1Y3QgbnZrbV9kZXZpY2Ug
KmRldmljZSA9IHBjaS0+c3ViZGV2LmRldmljZTsKQEAgLTE0Miw4ICsxNDQsMTYgQEAgZ2sxMDRf
cGNpZV9zZXRfbGlua19zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmttX3BjaWVf
c3BlZWQgc3BlZWQpCiAJCWJyZWFrOwogCX0KIAorCS8qIHdhaXQgZm9yIGx0c3NtIGlkbGUgKi8K
KwlpZiAobnZrbV9tc2VjKGRldmljZSwgMjAwLAorCQlpZiAoKG52a21fcmQzMihkZXZpY2UsIDB4
OGMwNDApICYgMHgxZikgPT0gMCkKKwkJCWJyZWFrOworCSkgPCAwKSB7CisJCXJldHVybiAtRUJV
U1k7CisJfQogCW52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4YzAwMDAsIG1hc2tfdmFsdWUp
OwogCW52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4MSwgMHgxKTsKKwlyZXR1cm4gMDsKIH0K
IAogc3RhdGljIGludApAQCAtMTg1LDYgKzE5NSw3IEBAIGdrMTA0X3BjaWVfc2V0X2xpbmsoc3Ry
dWN0IG52a21fcGNpICpwY2ksIGVudW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkLCB1OCB3aWR0aCkK
IAllbnVtIG52a21fcGNpZV9zcGVlZCBsbmtfY3RsX3NwZWVkID0gZ2sxMDRfcGNpZV9sbmtjdGxf
c3BlZWQocGNpKTsKIAllbnVtIG52a21fcGNpZV9zcGVlZCBsbmtfY2FwX3NwZWVkID0gZ2sxMDRf
cGNpZV9jYXBfc3BlZWQocGNpKTsKIAl1MzIgb2xkX2RsX21ncjsKKwlpbnQgcmV0OwogCiAJaWYg
KHNwZWVkID4gbG5rX2NhcF9zcGVlZCkgewogCQlzcGVlZCA9IGxua19jYXBfc3BlZWQ7CkBAIC0x
OTksOSArMjEwLDkgQEAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwg
ZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCX0KIAogCW9sZF9kbF9tZ3Ig
PSBudmttX21hc2soc3ViZGV2LT5kZXZpY2UsIDB4OGI4YzAsIDB4NCwgMHg0KTsKLQlnazEwNF9w
Y2llX3NldF9saW5rX3NwZWVkKHBjaSwgc3BlZWQpOworCXJldCA9IGdrMTA0X3BjaWVfc2V0X2xp
bmtfc3BlZWQocGNpLCBzcGVlZCk7CiAJbnZrbV93cjMyKHN1YmRldi0+ZGV2aWNlLCAweDhiOGMw
LCBvbGRfZGxfbWdyKTsKLQlyZXR1cm4gMDsKKwlyZXR1cm4gcmV0OwogfQogCiAKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
