Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2548B3FA
	for <lists+nouveau@lfdr.de>; Tue, 13 Aug 2019 11:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5996E0BB;
	Tue, 13 Aug 2019 09:20:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C376E0BB
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 09:20:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v15so817158wml.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 02:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcPhn1A+OQVF4Ytk15OLiFI3TCJSryD2RAdtR9DlhSE=;
 b=nFkK0y18rcypwP/qUKsIzCSKDtfJo4n5yynwVv9SwStP1xMx5WCutoKjyul1XppMay
 37hDSQdy9Rw4OHDjZNLDdR31Kvr9YkSfNdHQdurrPmSzhdCXUxnSQzs0G2hfGnGcHjPc
 CcQWXSLEM0XRTgvlUmmFOXgLkcLzyNsLahUVVQi5I9H2nkVAYuiayDJlnBMWQIFG+iFz
 W7VPxaNcM7TC0sbSf4fvDr3M6LCNbIfsYBVi0uGQtxc8EMk5HsL6y19rCViDHhShNrH2
 HHy2hppRh4U/hg9aXPWvT+prWOlxZ/CF3UgKvYQ/JzyjCKVEVl/orMLvG0dMc1yoFP3e
 9Xwg==
X-Gm-Message-State: APjAAAUrxVn+xvqPZcDO58iKRRMKVsxDSb1ap9IzrWsUeiDdJYRhgVZZ
 sbWDKu/wDs8qPZbvtmxf6FsTHUNr/QR60A==
X-Google-Smtp-Source: APXvYqxPwNt87h4ykgbR5Q8X7ElvuPvR0gGEQDkX9WF6ieRIfHTAlVS9ZZVzxAm1DHQj+P0ujTsefg==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr2083823wma.34.1565688002597; 
 Tue, 13 Aug 2019 02:20:02 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id s64sm1525414wmf.16.2019.08.13.02.20.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:20:01 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 13 Aug 2019 11:19:55 +0200
Message-Id: <20190813091957.4812-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813091957.4812-1-kherbst@redhat.com>
References: <20190813091957.4812-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/4] pci: add nvkm_pcie_get_speed
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
cGNpL3BjaWUuYwppbmRleCBkNzFlNWRiNTAuLjAzYmUyNDkzMCAxMDA2NDQKLS0tIGEvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvcGNpZS5jCkBAIC0xNjMsMyArMTYzLDExIEBAIG52a21fcGNpZV9zZXRfbGluayhzdHJ1
Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQog
CiAJcmV0dXJuIHJldDsKIH0KKworZW51bSBudmttX3BjaWVfc3BlZWQKK252a21fcGNpZV9nZXRf
c3BlZWQoc3RydWN0IG52a21fcGNpICpwY2kpCit7CisJaWYgKCFwY2kgfHwgIXBjaV9pc19wY2ll
KHBjaS0+cGRldikgfHwgIXBjaS0+ZnVuYy0+cGNpZS5jdXJfc3BlZWQpCisJCXJldHVybiAtRU5P
REVWOworCXJldHVybiBwY2ktPmZ1bmMtPnBjaWUuY3VyX3NwZWVkKHBjaSk7Cit9Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
