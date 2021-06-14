Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247723A62F8
	for <lists+nouveau@lfdr.de>; Mon, 14 Jun 2021 13:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82F89C05;
	Mon, 14 Jun 2021 11:05:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BEA89B30;
 Mon, 14 Jun 2021 11:05:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r7so31506736edv.12;
 Mon, 14 Jun 2021 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poJHyYi+U6hi4XqNqX9Ddd4HYWOh74niH3vqVM4huzI=;
 b=leVGIxAzOPZLakkvuPONeueYQpPw6n80dnPy9wBm6R/syQZmuhzJM+N3kvTLJlXorI
 CaxhbkhOhRU09Akhlo1XpKUUcq9NEBg4/vYubH9z3p9cfwMF+3Y3pSrBU00jSubh8Kdl
 Ag0IDyx0KeYJw8V7Qc3m1A3WnO76W1W7eEIJwG4hS5HW0tyRqbXHjNChzkAMQAXuW2bC
 YM8CtlzJQFgvuYaK1RkjaI+Snd9IOsRR16KFzihGH9QO8yIq4XMNDjkfWDUsOYsnZiew
 hSTdiK0aVZdv4GoQF1tU/JgnEaNpsN+dTF/U/3XNc4rnytcGeImIrVJPzlBHwKJHXYdq
 ounA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poJHyYi+U6hi4XqNqX9Ddd4HYWOh74niH3vqVM4huzI=;
 b=nq5kGlyGgPuHr7oKrDz5SuA/OXr78A6xc/4JWW6Cx2KNbg573jrBHYMQquaf5fel0m
 d0uiLEe1EAVG4mqwD5lpz87tNr7d96P2VQHyuGEjpNucgtsfcl4YXCFjP+tEa+JwyLPF
 Qli+SGIUVVAQf3kMjZwd7AmQr6kOHlaVahHEOlpdN8BQZdfaeS+/gxf6bkyYCSFuegSR
 Di1d9ZWc7aCtN10jBKCsNOIoIyap/tAcEcfUhBUG3ZF8D47oVH4//V2EGd03P4h0z5Fr
 PatMISqaDcx1LulTqFoLS9k7gBTbEdQ07vgHQn4CX8Sm7K6PiYihD9djm6D+fRz6ZlFS
 Xhaw==
X-Gm-Message-State: AOAM532QVGl1kZB2mMGscKEYVx6RBFm2MwObu7oVa46IUCQlgR782xVn
 T1mH4fTMm5wk9TxAIszMwX6Qhurf40Y=
X-Google-Smtp-Source: ABdhPJxfeDXHZr6wp9ldQF4GsMa6NNw6mikAo2ke3BKc19aLK9cwAxjYNAkiUqA/8ZN7KYepyHiVMQ==
X-Received: by 2002:a05:6402:11d3:: with SMTP id
 j19mr16444655edw.247.1623668718852; 
 Mon, 14 Jun 2021 04:05:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f8f:f28f:880f:43d2])
 by smtp.gmail.com with ESMTPSA id b22sm8442242eds.71.2021.06.14.04.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 04:05:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux@zary.sk, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Mon, 14 Jun 2021 13:05:17 +0200
Message-Id: <20210614110517.1624-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau: fix dma_address check for CPU/GPU
 sync
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QUdQIGZvciBleGFtcGxlIGRvZXNuJ3QgaGF2ZSBhIGRtYV9hZGRyZXNzIGFycmF5LgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2JvLmMKaW5kZXggM2UwOWRmMDQ3MmNlLi4xNzBhYmE5OWExMTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTU0Niw3ICs1NDYsNyBAQCBub3V2ZWF1X2Jv
X3N5bmNfZm9yX2RldmljZShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibykKIAlzdHJ1Y3QgdHRtX3R0
ICp0dG1fZG1hID0gKHN0cnVjdCB0dG1fdHQgKiludmJvLT5iby50dG07CiAJaW50IGksIGo7CiAK
LQlpZiAoIXR0bV9kbWEpCisJaWYgKCF0dG1fZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVzcykK
IAkJcmV0dXJuOwogCWlmICghdHRtX2RtYS0+cGFnZXMpIHsKIAkJTlZfREVCVUcoZHJtLCAidHRt
X2RtYSAweCVwOiBwYWdlcyBOVUxMXG4iLCB0dG1fZG1hKTsKQEAgLTU4Miw3ICs1ODIsNyBAQCBu
b3V2ZWF1X2JvX3N5bmNfZm9yX2NwdShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibykKIAlzdHJ1Y3Qg
dHRtX3R0ICp0dG1fZG1hID0gKHN0cnVjdCB0dG1fdHQgKiludmJvLT5iby50dG07CiAJaW50IGks
IGo7CiAKLQlpZiAoIXR0bV9kbWEpCisJaWYgKCF0dG1fZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRk
cmVzcykKIAkJcmV0dXJuOwogCWlmICghdHRtX2RtYS0+cGFnZXMpIHsKIAkJTlZfREVCVUcoZHJt
LCAidHRtX2RtYSAweCVwOiBwYWdlcyBOVUxMXG4iLCB0dG1fZG1hKTsKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
