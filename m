Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F065930
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1486E252;
	Thu, 11 Jul 2019 14:42:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F16E252
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:18:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y4so6532037wrm.2
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/offaTeukG4y5dVIM1I0agxQ7PlR/Vq/0xtuFGljow=;
 b=OPR/JgktmJjtRTPkC9Cx/5jWwgD0MimaP5pxszlSIlFGXXL8S5siT9T8kGrSsDYg7y
 wyLIpF98iR19Xz0wUctDd3GgfJa85Ad2iHmxhR5CEvaiAj3K5dRNIY0EbJjoJtKYoYJm
 6UmGiHo0/BO7gqN5DlKP40OKcqCJbd8QUaH4BXZZ3vNcizuJM2dRIRFDiJVE4CidbnYt
 D0Y9CMed1g0E3AwuucN+Uk6GeaDXZanBxuZ7dRrVeaLgqlgV0BL2De+re5ebL1XeGp8V
 NFF49CI+TpbkXqm5KBAsnznpBvcaiNTc1M3U6x9mO/JWJxDkheYoZN7kQbMy/G0XQHFL
 gV1w==
X-Gm-Message-State: APjAAAX8Pq3zUVRvU8faKuSVgMiGI3qqsWqZEpPff3piAEUpJw5YBkob
 73WtfC6TKackj1c+uw8cD2yj9GckWR0=
X-Google-Smtp-Source: APXvYqx8eQdp+wepHyBpyr/LRIJVvzGI1W5ZC9yts0aDCeqJO+3W/3GNpUN7U9vxwGOQhJg7lWhIhQ==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr5853338wrp.245.1562854708427; 
 Thu, 11 Jul 2019 07:18:28 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 5sm5883635wmg.42.2019.07.11.07.18.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 07:18:27 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 16:11:52 +0200
Message-Id: <20190711141153.7723-4-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711141153.7723-1-mmenzyns@redhat.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 14:42:17 +0000
Subject: [Nouveau] [PATCH 3/4] gpio: added power check for another GPIO
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

dGhpcyBvbmUgaXMgbWFpbmx5IHVzZWQgb24gUmFua2luZSBhbmQgQ3VyaWUgYW5kIHJhcmVseSBv
biBUZXNsYSBHUFVzCgp1bnRlc3RlZCwgd3JvdGUgYWNjb3JkaW5nIHRvIGRvY3VtZW50YXRpb24K
ClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVuenluc2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0K
IGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggfCAxICsKIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9u
dmttL3N1YmRldi9iaW9zL2dwaW8uaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
Ymlvcy9ncGlvLmgKaW5kZXggYTcwZWM5ZTguLmZjMmI1ZmIwIDEwMDY0NAotLS0gYS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCisrKyBiL2RybS9ub3V2ZWF1L2lu
Y2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKQEAgLTUsNiArNSw3IEBAIGVudW0gZGNiX2dw
aW9fZnVuY19uYW1lIHsKIAlEQ0JfR1BJT19QQU5FTF9QT1dFUiA9IDB4MDEsCiAJRENCX0dQSU9f
RkFOID0gMHgwOSwKIAlEQ0JfR1BJT19UVkRBQzAgPSAweDBjLAorCURDQl9HUElPX1RIRVJNX0VY
VF9QT1dFUl9FVkVOVCA9IDB4MTAsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKIAlEQ0JfR1BJ
T19GQU5fU0VOU0UgPSAweDNkLAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1cgPSAweDc5LApkaWZm
IC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYwppbmRleCBjNDY4NTgwNy4uMGM4ODY1NDMgMTAwNjQ0
Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCisrKyBiL2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCkBAIC0xODMsNiArMTgzLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGdwaW9fcmVzZXRfaWRzW10gPSB7CiB9OwogCiBzdGF0
aWMgZW51bSBkY2JfZ3Bpb19mdW5jX25hbWUgcG93ZXJfY2hlY2tzW10gPSB7CisJRENCX0dQSU9f
VEhFUk1fRVhUX1BPV0VSX0VWRU5ULAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1csCiB9OwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
