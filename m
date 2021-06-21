Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D13AE9A2
	for <lists+nouveau@lfdr.de>; Mon, 21 Jun 2021 15:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482636E02D;
	Mon, 21 Jun 2021 13:03:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BC189F06;
 Mon, 21 Jun 2021 13:03:31 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dm5so16300546ejc.9;
 Mon, 21 Jun 2021 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4p25a67hv/sYt/qONCDrOmoXp4la0F1iN+aDrKvwRL8=;
 b=Rd4UayQUe5dWMay6byaPSeqOtP95DbsJLw4WSFGk/fk0yWrsqZ0/t/Oyk3X53a+f3p
 obCmiA5Wzmu6tv0wT+/F9w3jsldvrqkOj+gkzwTVAAz3xN1505ev017+2iZlcszV7Xy4
 6NUJp/kQ9fKlrBkzH0bQGTy0BU0vh0iNRdJbPpbe21NzGv170N66YSd4CN2p9LyV6cH2
 vHkc7Y6SLuhVtFfCBsct4lWD1S6X1Yq+PDI/QkQHNqRr7XsZwJhm42Fs6QR/CMcewcsB
 /p7Uznyz0sca+65syH+Mel29MLoClxdYCNPYyuC+VC9aTrF1EcyYlRqV7za2oKAhsCK8
 O6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4p25a67hv/sYt/qONCDrOmoXp4la0F1iN+aDrKvwRL8=;
 b=s4PXa1AkXrVhUG4p7CSYOYSTK5cbPeePDMeJC9NDGXmwR7WZjnXWtoY+DbpOWiIHgU
 ARckFAKY8hIvfN0pBl1cxf7aBtKGmOkURn+ncWkrLiHkVq2eJH4NaFhKNgbkGKjsgFLO
 ZS3T7XJavVEL3IYoTDjt6OI+MiAhtu0Hx6SCwOjp2PYoBi4sI1aI0R1d1SBs+u+b7Kqp
 dErT6jUVEh26+fgmDCONaKIxd7/YxdOeBM4jHmmYPLAOlBhFQNk9X9T5Uh7STQ8h3YpF
 Cc1wyyfD2DOBTlvgxurFHPRGD9+a7uzxQJ5uFEeqtAHybbIgLsUNf+BY4Cafx5PIA5Jr
 MiUA==
X-Gm-Message-State: AOAM530j6gye8c+vgnSI2qYCiM+hnQycr6d//HRvBz8hNFdZYGiJuc4+
 ilLIyMibpn3XGsO3/ZBJ7fpny6VTT8g=
X-Google-Smtp-Source: ABdhPJxEa7d4/1EgRIKp9U0VFA7UCLamb5nKdt9865OW3nouO1X2sTRL8UDXS43qwSqQ1XOqhSnipA==
X-Received: by 2002:a17:907:7201:: with SMTP id
 dr1mr25038295ejc.19.1624280610372; 
 Mon, 21 Jun 2021 06:03:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bd92:da7:4d23:8910])
 by smtp.gmail.com with ESMTPSA id w10sm5322375edv.34.2021.06.21.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:03:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Mon, 21 Jun 2021 15:03:27 +0200
Message-Id: <20210621130328.11070-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621130328.11070-1-christian.koenig@amd.com>
References: <20210621130328.11070-1-christian.koenig@amd.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/3] drm/radeon: wait for moving fence after
 pinning
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

V2UgYWN0dWFsbHkgbmVlZCB0byB3YWl0IGZvciB0aGUgbW92aW5nIGZlbmNlIGFmdGVyIHBpbm5p
bmcKdGhlIEJPIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBwaW4gaXMgY29tcGxldGVkLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDQzog
c3RhYmxlQGtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmlt
ZS5jIHwgMTYgKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMKaW5k
ZXggNDJhODc5NDhlMjhjLi40YTkwODA3MzUxZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3ByaW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fcHJpbWUuYwpAQCAtNzcsOSArNzcsMTkgQEAgaW50IHJhZGVvbl9nZW1fcHJpbWVfcGluKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCiAJLyogcGluIGJ1ZmZlciBpbnRvIEdUVCAqLwog
CXJldCA9IHJhZGVvbl9ib19waW4oYm8sIFJBREVPTl9HRU1fRE9NQUlOX0dUVCwgTlVMTCk7Ci0J
aWYgKGxpa2VseShyZXQgPT0gMCkpCi0JCWJvLT5wcmltZV9zaGFyZWRfY291bnQrKzsKLQorCWlm
ICh1bmxpa2VseShyZXQpKQorCQlnb3RvIGVycm9yOworCisJaWYgKGJvLT50Ym8ubW92aW5nKSB7
CisJCXJldCA9IGRtYV9mZW5jZV93YWl0KGJvLT50Ym8ubW92aW5nLCBmYWxzZSk7CisJCWlmICh1
bmxpa2VseShyZXQpKSB7CisJCQlyYWRlb25fYm9fdW5waW4oYm8pOworCQkJZ290byBlcnJvcjsK
KwkJfQorCX0KKworCWJvLT5wcmltZV9zaGFyZWRfY291bnQrKzsKK2Vycm9yOgogCXJhZGVvbl9i
b191bnJlc2VydmUoYm8pOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
