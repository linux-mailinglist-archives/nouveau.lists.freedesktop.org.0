Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE32F4EDE
	for <lists+nouveau@lfdr.de>; Wed, 13 Jan 2021 16:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71116EAA4;
	Wed, 13 Jan 2021 15:37:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F8D6E08E
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a6so693595wmc.2
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gN1pD37GpSZ83lBrPZbFyIukV/8d6W9Y5EyS4/7EyT0=;
 b=inmJeTRl4AVmWMtUkVPGB6U6xWuEnOy3Wwm4sKiHJLQr/ccYwrp4sJFIK+50RReh0+
 hgSuriGNX6dbro0Ugw1yfhjeQI8Jc1zjDXvqu990sAW99mZRA4BfxoGZM5aJaSKiab5y
 LM9dCZizOE5P9N47EzRuqmR/jFzb1jcrdKk/Ys7WM2bgE5w2vr0hvA7v+ASZSQe/hmcT
 kiMYQYgFkZ3e33wu5V+eP3/j3W0nF8lyUJbAgcPaIoeY6Tn6F2ruDrQ7kuslLJSpkv3v
 8idhUwfBq9kNYqLsoiSKrc+ehX2mq2F+mqgESYAiCJNENlcz+7yhexTyyiDG1XRiISBj
 18yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gN1pD37GpSZ83lBrPZbFyIukV/8d6W9Y5EyS4/7EyT0=;
 b=EkrTNTGr0GTqeM/9/BGbfl/fOwF0iVt2ijNCR/BC7dC+YBbAjr2PQyWRRX8W0AqDI9
 a4X2MinEMyRkq8h9ExfulleCMTxn4JxC8hgzEaxE9RYft9mgG1qULWTEO8dLB9IFfdnZ
 k17pIkgZ12qc0PEmGdCH8xJMSo691TO8NC00eBEwfbjAJ3JhlJEx4wU0K6VQTaEeQTmX
 1QZlcQVWMTfVhTEPZu4R8e7kXDCpYGKcx79dxyQGQuTzqCrW4MuH35VBNY0fWtONG8ab
 qs8YAZ/+vTLjRnA1wdSZwLUcI9Cq67dJIyQ/FcL8WXxUSHF+fNEeMVps8Ofrpss0mhN+
 nDcw==
X-Gm-Message-State: AOAM530IVXzQjcwzZ2lKiFCzCajtgGOVdJKp+rzARlpQowo3cxvvH/Nx
 NQUDCWlfjBWtKJC97kvubzREwQ==
X-Google-Smtp-Source: ABdhPJx+93HfbyhiJTrNv1M8rdT5OtKObgEgorUSuxqO9H+3Jzzjw3dp0ay9rMwIeonHgYOAzhHW2g==
X-Received: by 2002:a1c:5644:: with SMTP id k65mr955899wmb.62.1610525309184;
 Wed, 13 Jan 2021 00:08:29 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 13 Jan 2021 08:07:49 +0000
Message-Id: <20210113080752.1003793-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 15:37:10 +0000
Subject: [Nouveau] [PATCH 27/30] drm/nouveau/dispnv50/disp: Remove unused
 variable 'ret' from function returning void
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
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOiBJbiBmdW5jdGlvbiDigJhudjUwX21z
dG1fY2xlYW51cOKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzox
MzU3OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXgg
YjYxNTIwNGMyY2JhNi4uODA5YTliMjBhNjg5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYwpAQCAtMTM1NCwxMiArMTM1NCwxMSBAQCBudjUwX21zdG1fY2xlYW51cChz
dHJ1Y3QgbnY1MF9tc3RtICptc3RtKQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91
dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7CiAJc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyOwotCWludCByZXQ7CiAKIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51
cFxuIiwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwotCXJldCA9IGRybV9kcF9jaGVja19h
Y3Rfc3RhdHVzKCZtc3RtLT5tZ3IpOworCWRybV9kcF9jaGVja19hY3Rfc3RhdHVzKCZtc3RtLT5t
Z3IpOwogCi0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5tZ3IpOwor
CWRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKIAogCWRybV9mb3JfZWFj
aF9lbmNvZGVyKGVuY29kZXIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYpIHsKIAkJaWYgKGVu
Y29kZXItPmVuY29kZXJfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
