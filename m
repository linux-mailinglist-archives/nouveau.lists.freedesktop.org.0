Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9E341F98
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DEF6EA34;
	Fri, 19 Mar 2021 14:36:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616AA6E994
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h10so9706585edt.13
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=WhTHIjR2p9qQ5IzTyze6AacLklI9Uo/G/4AeQAM0EOoFlz5LkznOnDUWF75RUVTZny
 qer7yMUfkB6TKXfPaawXmK5zh8Pi9N5h6zEpScZ1Fu89JdEFkocmRuPbRm5ABbwoiFK+
 gtLZ1h26d4UDgeTtC6QnsZLj98dW37j8gh6W34B4B8Xefus9CJpzpRk4OJPyCMr5bK4+
 VABaE1bCTgYauqI+vzAtGP0+pGooM9EuRNTgoD7Q7DL7ybOqAnDBvAWHhGqs4yoAXfC8
 Q5xYO8pwXh1ZTAuujTxEs+wME7A4VXeS0kaKvcjENfMCF8aSGC5EI3TaxGRPp/HRhFVF
 yQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=JUgny10+bWCE+VFqKZn8ekq6TWtCA7wuGGAiHPxf0YGJ44ZCu4NYEuoKO71q0yPMGI
 ZCJjQkzXrHxDGtkAXFWZO0w/L7STGTL+VprXDxdHSH85jCExW7V6fdIxD+JqFY8ANrd9
 vaIE2t0axVbwTSt76YZ5HlIZnz77vTdnQdgtPF0P9+GBHyGKkTDME6R8eOdZoDrjQbqs
 5sT7RyMJ93yZ5vTC++BAyyEIr4zYPpt0aAoE//n3/pej6ag1DloEq+o/kh01Poiu4/NO
 SL7X9u1S/MGeak7EYYviNZef/7btom6ua67JalRWVYoMA4denY5+DEsU278kh05j6Vbs
 6voQ==
X-Gm-Message-State: AOAM532Dj0SIe2DAyAHnv5DuP4doewwPD4swVg81JVcKScQFhhhKrJfL
 pCtrM7MFuMldMCu9TVway+4zLQ==
X-Google-Smtp-Source: ABdhPJw66ngNg/IJvxqFYVq3B2gZC9vNyjb/90i+qd665pUnOKsuirpenLdXDSTsIgUANeauTQ0TvQ==
X-Received: by 2002:a50:8524:: with SMTP id 33mr8258811edr.110.1616142274097; 
 Fri, 19 Mar 2021 01:24:34 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:11 +0000
Message-Id: <20210319082428.3294591-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 02/19] drm/nouveau/dispnv50/disp: Remove unused
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
