Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF798DFE8
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 23:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3CA6E856;
	Wed, 14 Aug 2019 21:31:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFA26E858
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f72so468369wmf.5
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JS9FDqsk2E6RQCD4HkMjbuys2g4pNRCG7WFODU185bI=;
 b=loV3QCn1UWh92Z4FygNEkhYuAvARwm9gN/o5ow3OpPq7NW62AVsRc0RmHoJMj3g2GI
 HfVaqJ4C2BwUTucrow5Qo8ZEmzc8ARBrcPUJ/Twk+07Uv/5C6fK5sRC2oKlJaBS+f7X+
 jpwRBIGoe5GELpaJw0n5GHmu7BmV3l+KAH9IEcgWirePZCITWnYUyi6FtmMmtBhq1nUA
 hH7RgYys6E1IT7zk+jLyvF+RRJM0hMXl65jsWZtpj0R/0Zh52VCNxWjCCnZBShwyMKTx
 G/Z6HJvNcOnunPHs1h+CFlJXtAH9ASmoSOr7x4OcGSnT48RWaBPq0D9+VbZoc4eYO/mP
 o/1Q==
X-Gm-Message-State: APjAAAWLquXK0ai+a4ZmDQ88VRRQyB6Wx5VZeB7nIianhw+2stw+utRf
 gYMfE1DGLxXgZKnSWduazOErqw==
X-Google-Smtp-Source: APXvYqzHDWQhfPJ6We27I1c01VEHmcH6AedqLJLeDfuYhTAnIpxtfMqyBLvyHd9LxsMu3eLuFy5VVA==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr949715wmg.150.1565818300170;
 Wed, 14 Aug 2019 14:31:40 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:39 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 14 Aug 2019 23:31:18 +0200
Message-Id: <20190814213118.28473-8-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 7/7] drm/nouveau: abort runtime suspend if we hit
 an error
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+CkNDOiBBbGV4
IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNDOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cm0uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCAxNjQ0MWM1YmYyOWMuLmIxNjE1N2E5Yzcz
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC05MTAsNiArOTEwLDcg
QEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewog
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwogCXN0cnVjdCBkcm1fZGV2
aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBub3V2ZWF1X2Ry
bSAqZHJtID0gbm91dmVhdV9kcm0oZHJtX2Rldik7CiAJaW50IHJldDsKIAogCWlmICghbm91dmVh
dV9wbW9wc19ydW50aW1lKCkpIHsKQEAgLTkxOSw2ICs5MjAsMTAgQEAgbm91dmVhdV9wbW9wc19y
dW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCiAJbm91dmVhdV9zd2l0Y2hlcm9v
X29wdGltdXNfZHNtKCk7CiAJcmV0ID0gbm91dmVhdV9kb19zdXNwZW5kKGRybV9kZXYsIHRydWUp
OworCWlmIChyZXQpIHsKKwkJTlZfRVJST1IoZHJtLCAic3VzcGVuZCBmYWlsZWQgd2l0aDogJWRc
biIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQogCXBjaV9zYXZlX3N0YXRlKHBkZXYpOwogCXBj
aV9kaXNhYmxlX2RldmljZShwZGV2KTsKIAlwY2lfaWdub3JlX2hvdHBsdWcocGRldik7Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
