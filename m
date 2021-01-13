Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF72F4EE0
	for <lists+nouveau@lfdr.de>; Wed, 13 Jan 2021 16:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915686EAC6;
	Wed, 13 Jan 2021 15:37:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ADE6E08E
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r7so1069755wrc.5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qkAO/aGHo5CcrKre6xluwg8dEdIWKSiyZUvz4qO5fI=;
 b=fK1nyW2AuJAUc4P3U08Io3K5pslY3Qe+t7ZLNtrnVRB0J22NU2/CdxFP096XibmbmF
 TPgZ014z9pkUJeqBZgCb+LqDnEj1wZTKn1K9vsS8BP2fRvu8MqEADkgJC4iSAVRExKvH
 TFVcuQId+YR1/mySwfbskaUpIhXx5/dFTrDmiJpp7n2rpSnm+qhsWDAWEzZyiCmweMeU
 9CU49nydxJsRPbqrX5Fma0dooI88HQ/C5U6sM6XS3myuJla2FvTJxSYFijuSF4lPBFeO
 sK747r7kYb2EQ6Cj1yhQK99qglrQNrSY/svRrKZuJPG4KgceTPFb/EO2bpA2wMtsOfTY
 lDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qkAO/aGHo5CcrKre6xluwg8dEdIWKSiyZUvz4qO5fI=;
 b=ANCxuTCQVHdQeAfz6kTRia1/CsUlLhVfkFgpXFlQ94J/TlY5XeS/mQzB6/MUekw4QY
 PweBVB7vAMO7SuYaqNlCbevOwRkyh00CScxBUW22LqP2aG+Yudssh4X1A4fbtbnFLyZG
 V3pn3f2cJY7n+WUJ85jBjmV/G/AxmUNdPnb9eVBNXmKbgb6HW4b6+/lFEK1vMKUEvOVr
 ki4X7KcZkf2xO/yVL/GWaDMNVKiE+YSw4ZXAp8vDao651zcXbR9TmhiyIbPqjkRow7m6
 Aiub1bOtX9OYNZvQUfMjM7ZSbkA/8FsXZo0ftyGYxjPPZptIuQEWMvAl/1TurGmO71kT
 udPg==
X-Gm-Message-State: AOAM533DFkmjGQ5rHlutp434yMqxARuWN3vwWj9MMxQPXWpTUlFTRjY1
 SHF0rkOL5rqUcb5XWHR9PkT0Eg==
X-Google-Smtp-Source: ABdhPJwm1hXgI8m72Rvsxy8t+CaS4V32+7aBrAamJKyyaKIMciFMNOVopmGGOLhsccFZBjF4t5GjWA==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr1179688wrq.75.1610525311521;
 Wed, 13 Jan 2021 00:08:31 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 13 Jan 2021 08:07:51 +0000
Message-Id: <20210113080752.1003793-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 15:37:10 +0000
Subject: [Nouveau] [PATCH 29/30] drm/nouveau/nv50_display: Remove
 superfluous prototype for local static functions
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmM6MjUzMDoxOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKA
mG52NTBfZGlzcGxheV9maW5p4oCZCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnY1MF9kaXNwbGF5Lmg6MzY6Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1
MF9kaXNwbGF5X2ZpbmnigJkgd2FzIGhlcgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKA
mG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBoZXJlCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6MjU4MToxOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmG52
NTBfZGlzcGxheV9kZXN0cm954oCZIGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlvbgogSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Yzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6
IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBo
ZXJlCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCB8IDMgLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBf
ZGlzcGxheS5oCmluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCkBAIC0zMSw3ICszMSw0IEBACiAjaW5jbHVkZSAi
bm91dmVhdV9yZWcuaCIKIAogaW50ICBudjUwX2Rpc3BsYXlfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICopOwotdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqKTsK
LWludCAgbnY1MF9kaXNwbGF5X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKik7Ci12b2lkIG52NTBf
ZGlzcGxheV9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICopOwogI2VuZGlmIC8qIF9fTlY1MF9ESVNQ
TEFZX0hfXyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
