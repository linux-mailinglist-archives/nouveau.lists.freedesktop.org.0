Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CDA2F4EE3
	for <lists+nouveau@lfdr.de>; Wed, 13 Jan 2021 16:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92B6EACE;
	Wed, 13 Jan 2021 15:37:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95426E09A
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r3so1087790wrt.2
 for <nouveau@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4npnZBZUdB9VpRylBzLja8pV22PiHGoMVGeBjYnlKk=;
 b=ITSzPdTHABER1VheL/3HTMsa+peAOHNXWe9qQVNaliJwdCllNgkrjqNGUnnUoW1L8f
 TdK83gGX3FP7vDXmcFOgJx7vm9TGReb81hw6E4oTH2UM1IL3zW+q4gHPxvPDvd5AjKLm
 Gs+Fq4hVcFU/+NCK9s027XGyClxfE7KC/iXRoIU7sHz+fsTZAVPw6tV+wEsphAIL4kdI
 vHHXbjRGuiWVqmI3Q42dhbmNicEJpdsE38hcFJOwBPnn4jEboyFgMChQtAy+mNGDRQjX
 oTNmSqc/Gg8k9NpklmMiKL/QTj+29a6HQsHmlyC25nwS1XH3rQt7Qi7xdVTyOam0d9fo
 bzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4npnZBZUdB9VpRylBzLja8pV22PiHGoMVGeBjYnlKk=;
 b=KhvE89fZxB/XgOBAzlC2vnoEPmYMzKX8pfg00ig0urHRKAbffHYmo0XRxWuRMDR//T
 JouLRVhvpjBHgjDzPKjoqs2dUcn58zO5H36W1fMhBGzvMlA8yaEdmFi/aa0Nh6ezpHxq
 00Q1huW/zrqrn3akErSfiFie+2OR8NV/DSRXDOk869tsCyziYjv08nS0xLKBeQeMLsoj
 LnmZ3WugcGHduIZJ3oPODK8p3wvk55noz7qvRoCTSO6wv0Q/D9yXCh0TJbRAX7S1dBwl
 BsoXJU1hllJWo+95B9pDS4/ragsTjlEtIy8ijGhJeCR5+Tt2riuCBz/uUF/WTtKrKCg1
 kAuw==
X-Gm-Message-State: AOAM533RbwxTBq/i6P6OklUprt+ReUkNuThuj3UrPlMpiTzlwFLVRjtk
 X4uObxvm7DOdGoMLsXcpXP94gA==
X-Google-Smtp-Source: ABdhPJyl/Qhbk6jkk5C3J8WRijqVE/SpDxKAue04bKado0wqe6IdXSv6///j096igmmNz7SjwqECMQ==
X-Received: by 2002:adf:f989:: with SMTP id f9mr1164742wrr.299.1610525312650; 
 Wed, 13 Jan 2021 00:08:32 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 13 Jan 2021 08:07:52 +0000
Message-Id: <20210113080752.1003793-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 15:37:10 +0000
Subject: [Nouveau] [PATCH 30/30] drm/nouveau/dispnv50/disp: Include header
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
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggODA5YTliMjBhNjg5OS4uZDgyOTY1ODkzYjZiYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNjgsNiArNjgsOCBA
QAogCiAjaW5jbHVkZSA8c3ViZGV2L2Jpb3MvZHAuaD4KIAorI2luY2x1ZGUgIm52NTBfZGlzcGxh
eS5oIgorCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFVk8gY2hhbm5lbAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
