Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A132B879
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4014D6E99B;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD66E8F3
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n22so5227695wmc.2
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=iMTh4dk09sGxqAE/qzSGNAZyvWAptULs+nQCYT2OtIn3+7m0+6HrnZE1aUNidOxkd1
 HmBXyCE2zeEgjrHTRb3VZSeT3uOaMbsogo1LT36zL6TJcnQSaeedSmHxTVD7t846xMCV
 eDdK6AYjTARDjg8E/gMjAKx0AYRKmz5xxP6aPwaFs9bQtLq/cDZ+1G8tJCD8Sw6/+Si1
 oWKD8iQuNbtQnxKs9XREiEA3GzeA3/ge0ObQRTj0uRHSotea1Ndx9pvJUsW1OI6UJwh1
 m8FyDR4OSbUUM46rq97np9+8LfZYnGxDKtK3Vl0ooMSjZ2eHgo1Le9Z/NLIU8vnm9XBF
 UUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=S4jkfuXT3RzMMupccfvYKgAVLk4LaY+OIBd+NCwhBoQPDMnTf6IjBniWPYYRmcBHKl
 cq5YDUmzgTEgvk8Y0r/q66ZDUg5+P78oip8HWh6GQpvlHFETZfg0jiY3R7cBOQ+SPMeZ
 PDtt6R9nKdb4tm0Zhfb1v2scarGCkMo69OVJPNwVEVcAoqtWHs7xYYUqRr7TzK0JoiXL
 tJzI3HX4y9JoaG7g4T2hJF+0JYH/B8qq7HAB9i7neLUPm0xu7OlcFIvpa1JmIEEg8zZm
 yNQTvFId39adPm41joVgsDqTDxjcoP+eUPP7lg4oNbuZ4PslBlhj951s0G/iNFwu9d7P
 Njyg==
X-Gm-Message-State: AOAM532JCW49NteBPGte5u1jwnvNkLHKx+coTnDVDbVgQHHFl8x0wnqn
 EJz1pc0R8Ec7Mtk/6J376PuTyA==
X-Google-Smtp-Source: ABdhPJzyUy+S8ulahsuVr/azQFNR9h4YD/I4Ad0ABeYj4bYvn2eB4B03dDyZjVZiwtN1lHjN0zcxjA==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr9079631wma.167.1614779030643; 
 Wed, 03 Mar 2021 05:43:50 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:45 +0000
Message-Id: <20210303134319.3160762-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 19/53] drm/nouveau/dispnv50/disp: Include header
 containing our prototypes
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
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjI1OTk6MTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhudjUwX2Rpc3BsYXlfY3JlYXRl4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggODI4ZjQ4ZDViZGQ0ZS4uY2QxNjQzMTQyMjE5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNjgsNiArNjgsOCBA
QAogCiAjaW5jbHVkZSA8c3ViZGV2L2Jpb3MvZHAuaD4KIAorI2luY2x1ZGUgIm52NTBfZGlzcGxh
eS5oIgorCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFVk8gY2hhbm5lbAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
