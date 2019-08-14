Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2AD8DFE6
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 23:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535F6E85C;
	Wed, 14 Aug 2019 21:31:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7D6E855
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k2so470144wrq.2
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+R7LV1MxNrT9xguc00MGuS05JmkrEhR9rX0ez6LOs84=;
 b=Ghp6o6zdttOP+hpCnnVkBdfMqguhap/H1vWUlkq5VdklVpuhImBuStmU3XGBfV+scS
 hPX3Rx/wba9PT5GwNRWXCBVEjQ3CTECZ2ZNYjAKcf+832jnsmr2/F/1Xg3MQEsVmUpCf
 L/Tge6ELj9ASQUQF4BES78Gyqo15trtHX4EwJr6gY7wM1oYfX47zeCoUO6S9ZUUMU1ir
 mfFPdEKry4nAkLmuvoCKV4hQrI9+r3DoyCXTE46GqB/QeZSykVXF5QcswvQGoZAQzcH4
 1UVkzaRtQIYe7xW34AaHUZ+a5Zxxa1rSJiSvuBmu9+9/MfAi0Yl0x8KxbtBtL4vLlda9
 dquQ==
X-Gm-Message-State: APjAAAWkNS9uN903O+uYbNESAkccdxXl5o5QhRSLQzeXzHwJ5tXfPEi8
 Vy/SiNlY5VagvA5lJZgeAN6Hug==
X-Google-Smtp-Source: APXvYqy6Bct927d1tcxDlG3Bau1plPbpmZhGaupy99LmABC4eq6mo/7HS+c9vx5OHhIXxUPcYDgtMQ==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr1624418wro.268.1565818297742; 
 Wed, 14 Aug 2019 14:31:37 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:37 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 14 Aug 2019 23:31:16 +0200
Message-Id: <20190814213118.28473-6-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 5/7] drm/nouveau/pci: add nvkm_pcie_get_speed
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

djI6IGZpeGVkIGNvbXBpbGF0aW9uIGVycm9yCgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CkNDOiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkND
OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2lu
Y2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKaW5kZXggNDgwM2E0ZmFkNGEyLi5iMjkxMDFlNDg1Zjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
cGNpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9w
Y2kuaApAQCAtNTMsNCArNTMsNSBAQCBpbnQgZ3AxMDBfcGNpX25ldyhzdHJ1Y3QgbnZrbV9kZXZp
Y2UgKiwgaW50LCBzdHJ1Y3QgbnZrbV9wY2kgKiopOwogCiAvKiBwY2llIGZ1bmN0aW9ucyAqLwog
aW50IG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVf
c3BlZWQsIHU4IHdpZHRoKTsKK2VudW0gbnZrbV9wY2llX3NwZWVkIG52a21fcGNpZV9nZXRfc3Bl
ZWQoc3RydWN0IG52a21fcGNpICopOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYwppbmRleCBkNzFlNWRiNTAyOGEuLjAzYmUyNDkzMGMw
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3Bj
aWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5j
CkBAIC0xNjMsMyArMTYzLDExIEBAIG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCiAJcmV0dXJuIHJl
dDsKIH0KKworZW51bSBudmttX3BjaWVfc3BlZWQKK252a21fcGNpZV9nZXRfc3BlZWQoc3RydWN0
IG52a21fcGNpICpwY2kpCit7CisJaWYgKCFwY2kgfHwgIXBjaV9pc19wY2llKHBjaS0+cGRldikg
fHwgIXBjaS0+ZnVuYy0+cGNpZS5jdXJfc3BlZWQpCisJCXJldHVybiAtRU5PREVWOworCXJldHVy
biBwY2ktPmZ1bmMtPnBjaWUuY3VyX3NwZWVkKHBjaSk7Cit9Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
