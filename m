Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D2B1C6A
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2019 13:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2AA6EF21;
	Fri, 13 Sep 2019 11:33:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAC66EF22
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:16 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C2402026F
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:16 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id h6so1149618wmb.2
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 04:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8VWxQHckW3V9wyrU96fapJXPSV8nKZ6Ue7oN8nELSI=;
 b=nq2dmJq4U4W/p/SAGarOIVzopmcMHKOC/qf8sFIBEnnTXFwdNAJd8DbjXABnV+Ra31
 ro5iMkX/7Q+9/jQe9WoK/WNafaeXs6jWqoT9NgiTSvVBtc/UK6DSpRNL+sYHSBoXOJ6J
 3OVBPPldffAPKjeGnVLx5dq8b6/wKCvkaLi9qWzTj087G61eKKo8jJkmF9aKX4SWnkhv
 13wIjqgAf84FH38ABhSyKWK3bRvzefH8pCWUVAfzACBAW7tJhAXrXSrmXF44CyiB7mqy
 GTKN+o9RU6Vz3XpDjvz333n0neOT0x8GqL0latm3xOW7I6QVZu75HOzUIktXfm3ia3Go
 7EiA==
X-Gm-Message-State: APjAAAWgm0rxGadNchC/L/MYvrWv0+aj/rT2n0j5zFZkNEv6eiFsy/bH
 8eB157nMUXqWt0UWCXixekPts3XwwxXP+DuXHajM2u0H8rjzqSTzr7c+PqEOlOs3SpGkn4f76CP
 yqXgrSqH1vtnoPign4bzgPQpg1A==
X-Received: by 2002:a7b:c447:: with SMTP id l7mr2898015wmi.33.1568374394938;
 Fri, 13 Sep 2019 04:33:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1aina90igbTW1/e+IrLvNzHP7NtSGEIQgzVbAsX2eIWlCQEsyOEd6O27wfGJZ10w/VxID2A==
X-Received: by 2002:a7b:c447:: with SMTP id l7mr2898001wmi.33.1568374394781;
 Fri, 13 Sep 2019 04:33:14 -0700 (PDT)
Received: from kherbst.pingu.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15sm2262769wmh.42.2019.09.13.04.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 04:33:13 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 13 Sep 2019 13:33:06 +0200
Message-Id: <20190913113306.20972-5-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113306.20972-1-kherbst@redhat.com>
References: <20190913113306.20972-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4 4/4] drm: abort runtime suspend if we hit an
 error
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
