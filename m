Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC6BBD2D
	for <lists+nouveau@lfdr.de>; Mon, 23 Sep 2019 22:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E389FCC;
	Mon, 23 Sep 2019 20:40:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5989F99
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:09 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E96DC3DE31
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:08 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id s19so2951883wmj.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 13:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkDlr9WjsdtjevjPQx25uNODJGzumrq9ayOZpNhiomE=;
 b=F0OO+xiyXYleCrPQGG67ntCk4Qqa77rJZkgi7vh8/ZSZ8CECA90nLindK3cOM4AbZy
 Wyb4mYHCkM8S3MMZWN0ax70rnMpiBaKjIJtw5pVizWUva+JOG4Zt1Q7K9+G0gAYlujXO
 5/548X4tqjyq+pbIT6ifTdL83G0U4uAs/tqUgrzt94Kavy35uflnOYxkZ4GBaydRkJ81
 Q8Fi2kJxZcI3GQkrOReerGJ72r9LcU1PcGTirgJDg1rJmqHjl4UTfIooIkjOZsEMfXad
 AMre3Dbxu/hhBsOANtV2v0XMP1s2n+jJZX49sSmATV7Fc/r3LdACVh36TZVPKyZ27+s/
 ZK5w==
X-Gm-Message-State: APjAAAWJCgXJDKhlcfLkh9zm86gqvYggOweq4AY1Lm9XymobxS9eNvcY
 iu8tsxD9wYLiS1/GpSg5vAu2a+cy37iKMiHHjc0jNB7GwnzpghumiB0aedTbh2EAjvcCzEQhJmr
 WX1K6YAQy+tTMGFhCdOUYmDNliA==
X-Received: by 2002:adf:f401:: with SMTP id g1mr849666wro.275.1569271207249;
 Mon, 23 Sep 2019 13:40:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSeLrc9B+JHUskHyAdLYbfsOJO8DCd648ghgZiGIyDpJdbesUljGQjbdBeJpz6yEcwPESYrQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr849656wro.275.1569271207082;
 Mon, 23 Sep 2019 13:40:07 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:2d3c:bd88:58b8:6e7c])
 by smtp.gmail.com with ESMTPSA id o9sm21912918wrh.46.2019.09.23.13.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 13:40:05 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 23 Sep 2019 22:39:51 +0200
Message-Id: <20190923203951.1652-9-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923203951.1652-1-kherbst@redhat.com>
References: <20190923203951.1652-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 8/8] drm: abort runtime suspend if we hit an error
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
dXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCBkY2U4ZTdmZTYuLmFkMTMxMWIyMSAxMDA2NDQKLS0t
IGEvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysgYi9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
bS5jCkBAIC05MTEsNiArOTExLDcgQEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldihk
ZXYpOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYp
OworCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oZHJtX2Rldik7CiAJaW50
IHJldDsKIAogCWlmICghbm91dmVhdV9wbW9wc19ydW50aW1lKCkpIHsKQEAgLTkyMSw2ICs5MjIs
MTAgQEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQog
CWRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9XRVJfQ0hBTkdJTkc7
CiAJbm91dmVhdV9zd2l0Y2hlcm9vX29wdGltdXNfZHNtKCk7CiAJcmV0ID0gbm91dmVhdV9kb19z
dXNwZW5kKGRybV9kZXYsIHRydWUpOworCWlmIChyZXQpIHsKKwkJTlZfRVJST1IoZHJtLCAic3Vz
cGVuZCBmYWlsZWQgd2l0aDogJWRcbiIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQogCXBjaV9z
YXZlX3N0YXRlKHBkZXYpOwogCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIAlwY2lfaWdub3Jl
X2hvdHBsdWcocGRldik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
