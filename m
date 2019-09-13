Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D94B1C69
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2019 13:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4212B6EF20;
	Fri, 13 Sep 2019 11:33:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595DC6EF20
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:14 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DAB3F3C916
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:13 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id l6so13587851wrn.2
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 04:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zT8OnexrLAc2NHmpwpKRphD7/cNddSWHGMwyi40NIF8=;
 b=OY3he28o3tbRvWzWGAHSJDqLFM+vBZoscQdjLTpckahZglsmg/EdCxM2N46fCVpFiw
 alLJf5eSVXHpuYhSCQ7ATuF4P699mZx4WZVHjX5MiO74uiDFGn272BdlFQA/AA5IjtH3
 pa6kAG35Yo+B6tMFdm9t3a/27LsTa7fuDKfZ17BdfiPhmktqTWv981ejV3Pql8478eC7
 q4re5SKDw06y9OlzDOMItbHv5qUH3P/Ty2TPXD7xvTsPAH6z4wkZzvEcyCfMxqk4tnUy
 XnS7wclBTyuHzmXbS4uGwa01VRiLeSDYKJbZeMWr0IbKRxqfWupW/krEqshm/xa4hlRz
 YBEQ==
X-Gm-Message-State: APjAAAWvcWzMlV2OOUSz4nuGnpm8dqpSY4i34p3ATtPoPSFoALYn2/US
 TO/U1N0rQ7LY4d+1b+yAGjvaih9y+2FKCLLsFtX6V1RTGE01vSTDIDRtY3mwBC8x/+dYLZZubEJ
 ESwjTpbLNSS41183TdrB8i5FK+Q==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr2984323wmc.19.1568374392341; 
 Fri, 13 Sep 2019 04:33:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2idpj8u5j/YZ2vr6fcPwUB21FRzJTSIChm8VA4GE2t17TlAr+tsboaqT0NQQA0/emCmo2+A==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr2984314wmc.19.1568374392171; 
 Fri, 13 Sep 2019 04:33:12 -0700 (PDT)
Received: from kherbst.pingu.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15sm2262769wmh.42.2019.09.13.04.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 04:33:11 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 13 Sep 2019 13:33:04 +0200
Message-Id: <20190913113306.20972-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113306.20972-1-kherbst@redhat.com>
References: <20190913113306.20972-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4 2/4] pci: add nvkm_pcie_get_speed
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

djI6IGZpeGVkIGNvbXBpbGF0aW9uIGVycm9yCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+Ci0tLQogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCB8IDEgKwog
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8IDggKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5j
bHVkZS9udmttL3N1YmRldi9wY2kuaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
cGNpLmgKaW5kZXggNDgwM2E0ZmFkLi5iMjkxMDFlNDggMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1
L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKKysrIGIvZHJtL25vdXZlYXUvaW5jbHVkZS9udmtt
L3N1YmRldi9wY2kuaApAQCAtNTMsNCArNTMsNSBAQCBpbnQgZ3AxMDBfcGNpX25ldyhzdHJ1Y3Qg
bnZrbV9kZXZpY2UgKiwgaW50LCBzdHJ1Y3QgbnZrbV9wY2kgKiopOwogCiAvKiBwY2llIGZ1bmN0
aW9ucyAqLwogaW50IG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBu
dmttX3BjaWVfc3BlZWQsIHU4IHdpZHRoKTsKK2VudW0gbnZrbV9wY2llX3NwZWVkIG52a21fcGNp
ZV9nZXRfc3BlZWQoc3RydWN0IG52a21fcGNpICopOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL3BjaWUuYwppbmRleCAzNTRhYzRjODUuLmI0MjAzZmYxYSAxMDA2NDQKLS0tIGEvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcGNpZS5jCkBAIC0xNzcsMyArMTc3LDExIEBAIG52a21fcGNpZV9zZXRfbGluayhzdHJ1
Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQog
CiAJcmV0dXJuIHJldDsKIH0KKworZW51bSBudmttX3BjaWVfc3BlZWQKK252a21fcGNpZV9nZXRf
c3BlZWQoc3RydWN0IG52a21fcGNpICpwY2kpCit7CisJaWYgKCFwY2kgfHwgIXBjaV9pc19wY2ll
KHBjaS0+cGRldikgfHwgIXBjaS0+ZnVuYy0+cGNpZS5jdXJfc3BlZWQpCisJCXJldHVybiAtRU5P
REVWOworCXJldHVybiBwY2ktPmZ1bmMtPnBjaWUuY3VyX3NwZWVkKHBjaSk7Cit9Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
