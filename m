Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AB32B878
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8004B6E9A3;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBD46E3FE
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o2so5881739wme.5
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=sRgB8t25PZ10NkKal1+Peihtxu3GBrpIEwtbkDw27UzpVFQ3vx8N1Mf2WTQ7ghbjVQ
 Xl76lwrOvw1fNHzen5mLV36KjI+ddlwXHlxOFhD0iqCJg9U/mdhCaSpzgc5ppVg7T+kA
 tAcDT+por1yZTddeRmmq1oEn72Qig/It4dAOaIhLvuW4PJFhrOa8jzeYlneKPloH7vKQ
 8EMprRzfE6UxTKOqziJbd+JBDsTyYgkr0ZdR7nvsGLCtsQTIBRql7VF76lFxSiwe6A0y
 Gociy9qIFajV/I1guI1glaRMFdlcm1bOgG2ONLUZ9H8DB4KHNtljK5w8/L5xkCFNKA2U
 hChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=ouqawegz/ya0x/i7pXrto2cOXtnigEvPpnnzbUpZg474ERtiz4kB8T2ttd+BVs/GNG
 GwMAz0GILfNYXAzFc6K1DzRDxhx3vQ47SIWmxpCsq4LzmVUEV6ZW19sM0K1wRdha14Ym
 Z0Zrt5+FtwVyZA/vnbqiyBeqfdbBNFMz/haQKY80VayRZn6DWaU/JkYwMA3SzAvLYiRL
 RlPLGdVM5h5dEkqgyjsO61wTfjDncWSyvZUJI+UaL9i6phRPUEdZfPKW0ytcU/Rt0MgF
 LOSQnygoCaL3okfU2niE9cX55sRUZcJ6mgEb2HDRYi8poOzCZNbJ7403EaS6q5EGyqt6
 vmiA==
X-Gm-Message-State: AOAM530QAklht21l9fyJrRpapxtorXPaYVXZv+rNMh1HAW+QtN4rhgVA
 9HXzr2BhLxyOXGaR+V7NpIgzLQ==
X-Google-Smtp-Source: ABdhPJzkSWfUf5AtDHRBf8M7UDr5+MfhzhlBIZuFec+xGndDdtkpKDFTGPC1IOEXNzz1Uowj2875Lg==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr9078519wma.167.1614779011028; 
 Wed, 03 Mar 2021 05:43:31 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:28 +0000
Message-Id: <20210303134319.3160762-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 02/53] drm/nouveau/dispnv50/disp: Remove unused
 variable 'ret'
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEzODE6Njogd2FybmluZzogdmFyaWFi
bGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAxOTY2MTJhZGRmZDYxLi5jNTFlZmNhODJh
Yzc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xNDEwLDEw
ICsxNDEwLDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIHsK
IAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2Uu
YmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0OwogCiAJ
TlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIHByZXBhcmVcbiIsIG1zdG0tPm91dHAtPmJhc2UuYmFz
ZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7
CisJZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwogCiAJZHJtX2Zvcl9l
YWNoX2VuY29kZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewogCQlpZiAo
ZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKLS0gCjIu
MjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
