Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7E32B87F
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237A66E9A2;
	Wed,  3 Mar 2021 14:09:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766A46E8E9
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u16so5732604wrt.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1D64SVMvmhdwuXpC8yQyBurTfGArjqR5f88yUwkGnjo=;
 b=PFvYLvLOQQyWQMQRv4QlSlNwCBMSEjOKXmCpUftQ+PvbDpgZOJKJWEzuCJ/uFmzDFT
 uGEpjSkOlZNv2tRYz7PFRV4iWltZDCbgb1FFE5BEUmtSbT0XQ8EnMYsuCBcmYL8V9En3
 1V8IKzlZVWlD9//2RJlxWN+ye9+ba1OnpWhjakABlRSfaGY6fSdvmD0scUf55SI8fba9
 Zu3Gk7arkZw39XPrAAOH6i6RInJWfI7pOUsy26ANUMBndF7AIzmvFRgdZ30pAmtKcbZb
 WtOtgpOrP8xBW1/Ii2jnB1Jy11P7zdZk5bjEoEcvU9EezBqTQ6m1frK5HvQLasK+erwD
 EnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1D64SVMvmhdwuXpC8yQyBurTfGArjqR5f88yUwkGnjo=;
 b=rszFaZP4HpaWqlsrc7RT5FS8EzmUfze26Acd3beZEBfAOSQhM3H6xITwLLQRPxR31N
 Qo7HhpLBRzOGIdzdTC+Wrc6IjxFslfKRtXlxhtvnSmwKvXrAEChcUVscbJ7wN6675e0W
 xkXCp7mfEJ7VlV3DpkUFzqxzd2B80aqrEvure41h28bRlzGOlmNAR2E5Tm/h54BX1DvB
 ypy4uuKJiIzb+GNtoWNYujoqmIJuYyf4Gy3PT5ERkjktMc/V5jkTH94/TZ4mH3tJSrlN
 vfmoMaynNwDpeMfaIkTPNQP0xB8geHt1GgDmiynZgd65YyqNeMr9XWgWBLpRPTWBADUx
 AKRQ==
X-Gm-Message-State: AOAM531PZm9+4B3zJg28l6qgJKN26LjEP+ydkgVHjcYg/7XpDytx+r0k
 Dix4Orxb+q4jZdNFbhIzeTHW9g==
X-Google-Smtp-Source: ABdhPJyPcj3Wwm2bRs4O0dM5WyZr7c0wcEd1Ru7yoUgsPiH2vfNsDtk3ue6LDrOHmw+mZStSZxT77A==
X-Received: by 2002:adf:ffc8:: with SMTP id x8mr16151717wrs.384.1614779027164; 
 Wed, 03 Mar 2021 05:43:47 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:42 +0000
Message-Id: <20210303134319.3160762-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 16/53] drm/nouveau/dispnv50/disp: Remove unused
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
YzUxZWZjYTgyYWM3OC4uODI4ZjQ4ZDViZGQ0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYwpAQCAtMTM4NiwxMiArMTM4NiwxMSBAQCBudjUwX21zdG1fY2xlYW51cChz
dHJ1Y3QgbnY1MF9tc3RtICptc3RtKQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91
dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7CiAJc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyOwotCWludCByZXQ7CiAKIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51
cFxuIiwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwotCXJldCA9IGRybV9kcF9jaGVja19h
Y3Rfc3RhdHVzKCZtc3RtLT5tZ3IpOworCWRybV9kcF9jaGVja19hY3Rfc3RhdHVzKCZtc3RtLT5t
Z3IpOwogCi0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5tZ3IpOwor
CWRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKIAogCWRybV9mb3JfZWFj
aF9lbmNvZGVyKGVuY29kZXIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYpIHsKIAkJaWYgKGVu
Y29kZXItPmVuY29kZXJfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7Ci0tIAoyLjI3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
