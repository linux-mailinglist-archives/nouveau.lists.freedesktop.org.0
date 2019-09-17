Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD2B574C
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 23:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022326ED72;
	Tue, 17 Sep 2019 21:01:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822A06ED76
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:01:04 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 04D82C0495A3
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:01:04 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id h6so1715704wrh.6
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8VWxQHckW3V9wyrU96fapJXPSV8nKZ6Ue7oN8nELSI=;
 b=rx39ipMUspUVTVAmdPuokBhnKilTP6Qui70qarE59sLv484U2Co36BDFRtrYOUgSw/
 0YbEsnvB2O2Has4aODYmbbIb8PFxIJXZeeOlpNp4WOVIB3UQ3PniCHqR9kox87qgNOwZ
 N4s2i2kIe7lY563oMGjm4Mjxv8Q2rzWrVSfR9LZKUJd7eFunFzRlHh3Sz147zm78GdSJ
 zVIwo06R3hhD5Zn3W++6dn5LY3yfKmlErhW8OL1P2QeJ06OYLYNbR4s6Zit6Lbpmt4pV
 NvoRc+VF6PbSpL9XoTV1avj7kgpdXD62L9p6W3HCBT/YxGEXk0zJptmq4SyKctg4SheH
 7pOA==
X-Gm-Message-State: APjAAAWY1+AGpmZDG+yLtNMRP23KW0FKrG1Vr6dpSq8YvECGZlqEJM1R
 CTXx4LHv4PlxXI0FXBAflK9/hspwr98iLhSbxlNu0PaBrBOq/9NFx0brXE1Bgo5JFld9v7OTrUc
 t9BP1kXwlQnk0JUgSr9V57WK4xA==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr415792wrv.136.1568754062492; 
 Tue, 17 Sep 2019 14:01:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzz5zXPC+damysFmxykhlbQ72QLYg1WYOUYdNaE+XPQ9zHeRyj5btMxlNCMSVZA/NbMNMvEw==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr415780wrv.136.1568754062327; 
 Tue, 17 Sep 2019 14:01:02 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:e8b1:5ee7:bce5:6a14])
 by smtp.gmail.com with ESMTPSA id i74sm15907wmg.44.2019.09.17.14.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 14:01:01 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 23:00:50 +0200
Message-Id: <20190917210050.24457-7-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917210050.24457-1-kherbst@redhat.com>
References: <20190917210050.24457-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 6/6] drm: abort runtime suspend if we hit an error
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
L25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJtL25v
dXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCA3OGQ1NWM1MjUuLjZhNjgxOWQ5NiAxMDA2NDQKLS0t
IGEvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysgYi9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
bS5jCkBAIC05MTEsNiArOTExLDcgQEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldihk
ZXYpOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYp
OworCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oZHJtX2Rldik7CiAJaW50
IHJldDsKIAogCWlmICghbm91dmVhdV9wbW9wc19ydW50aW1lKCkpIHsKQEAgLTkyMCw2ICs5MjEs
MTAgQEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQog
CiAJbm91dmVhdV9zd2l0Y2hlcm9vX29wdGltdXNfZHNtKCk7CiAJcmV0ID0gbm91dmVhdV9kb19z
dXNwZW5kKGRybV9kZXYsIHRydWUpOworCWlmIChyZXQpIHsKKwkJTlZfRVJST1IoZHJtLCAic3Vz
cGVuZCBmYWlsZWQgd2l0aDogJWRcbiIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQogCXBjaV9z
YXZlX3N0YXRlKHBkZXYpOwogCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIAlwY2lfaWdub3Jl
X2hvdHBsdWcocGRldik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
