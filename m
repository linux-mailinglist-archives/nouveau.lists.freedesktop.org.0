Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2E362291
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 16:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6F6EC1A;
	Fri, 16 Apr 2021 14:37:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB276EC0C
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:45 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j12so7532702edy.3
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDdT4/+XKsblVJiSEV/Ng5U9nFlFYwJI7t0KAgT17Jc=;
 b=GVXZ4RlJwFsNGButwNcLJWso5eM3oO2t1LugQa1WxR7somr6EYngKqt9MGvUfV0Z8W
 spo/YFrOR3/L+OL4pExz+ObuFTvVaxlIwmaIYA6w3hQK7rnf1tuA96FZQMF6en7epBdG
 HpQumRcb3VUt6TsG4HUTHHw6OwUnu9wtDWEl1lVrgbbd9I1wJZ7j2BCeaLZvHtCd21MF
 QcxYTguRaX2CL4McdxAzZ7TpfuM1e86es6aqUz0ESVv2F9jwl8aBqiuJlQKp9418pQBZ
 xWyM1V3MfTcLYKsGQMcnArnMB8vwHKUbkBPB5DwJKigdjWREp1b/yeg+2tt1gZBQWZSs
 cuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDdT4/+XKsblVJiSEV/Ng5U9nFlFYwJI7t0KAgT17Jc=;
 b=bsT9G4L1VvH7MyD8kTVXfM78IrYSHR4wXOgK1VzvFX+mrjfIxkut83yQgIaZ+WFHHU
 M8OMZbz/JgEwD1odW1tW7Zzwe9kWIF/nVDqtEWyKTg0Jv1MrzQDZDkNX+zNzskGMctBB
 Va667GA2xQCTwWggpA7eO7j6S9vWxMIvbuiQkS2h8WThrvuJxSBbQgAsKTNYKCyKp+LB
 ORex0tRDoB7tZij+/n/JAzBubvD2hfBFr/wzHFFES2OcUhI2GUrD59U2yARCz62wfkd0
 3L66cyK4ma+tqvVfOa8fUplF36RtM1j92x7Uw7xJJXKJ7hzxyFr/Tll7ia9TBoLy56Wq
 y6iQ==
X-Gm-Message-State: AOAM532eg7ZusOlV4WE730Oo8Jdl1Cm6vu45eN2G/G5mdRIFAMB2CnUz
 nSy8uoQfdq/YowqBoEMcwI/JjA==
X-Google-Smtp-Source: ABdhPJzotflJvZTB2ll/FcWUU6QTmhzLk1MA/Yw8TC9PpImJipTW60OTtbwHhoYkTSqbc7cvA17dTw==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr10448067ede.129.1618583864278; 
 Fri, 16 Apr 2021 07:37:44 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:58 +0100
Message-Id: <20210416143725.2769053-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 13/40] drm/nouveau/dispnv50/disp: Include header
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
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggMzUxZjk1NDk4OTUzMC4uNDkwNWVkNTg0ZmY0OCAx
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
