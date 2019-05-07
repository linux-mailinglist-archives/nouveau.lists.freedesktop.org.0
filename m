Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBC16BF1
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 22:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6DC6E83B;
	Tue,  7 May 2019 20:12:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5A46E83A
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 20:12:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v10so11765501wrt.6
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 13:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93Jcsgep0R0A0N9Dr5m56DS8FTS0C2WwOTkkQWhbHyo=;
 b=ea6OLREJaa83ZLIFABQyaOOLtWI6zhisPSOtafYAM4s+wRD6BUo3T4wVEPWERO94R7
 1v8kEdzNx6jQGRHJv4tmyJLswSUnV6gbyQGsrFyvxY/+NMtcKlakHBc/Axv3XlsZfk6i
 cebOSuBTQYjuFZHtFBbCFI/ibwE4jn+NxxhlcWUU6tp6n0F6g9ftk0eCLAHrCbB9XBBS
 GufYlY4e8gYaqYsr6hWfRyLamQ6dXAxXhmd3yFo170vSkPZQy9cVYoLtg7PbzzUZFcmO
 o6JS1o+dvQcGERsvx5aZB1OsMF5WHPbE3sGXh7JrK37i+6HgbWjbctkPykLdLGOXu8qB
 tTBA==
X-Gm-Message-State: APjAAAUpg/am32q9hGLWAgTxPkwilqfHlz+Ua5AHXucAahAY3vZAWIpx
 wX/QhXbFFaKNq9RGihVfz5thGX1hBqI=
X-Google-Smtp-Source: APXvYqx4e2uhHe+Go510Nty8fUqVTqbLfz8UfSFIX+gESi/Tdp6VeYde/Z4aQ2jARnVlLg3tW8gUEQ==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr21681200wrq.86.1557259976061; 
 Tue, 07 May 2019 13:12:56 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:ac7d:46be:871b:a956])
 by smtp.gmail.com with ESMTPSA id c10sm31816882wrd.69.2019.05.07.13.12.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 13:12:55 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue,  7 May 2019 22:12:44 +0200
Message-Id: <20190507201245.9295-4-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507201245.9295-1-kherbst@redhat.com>
References: <20190507201245.9295-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 3/4] pci: add nvkm_pcie_get_speed
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
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRybS9ub3V2ZWF1L2luY2x1
ZGUvbnZrbS9zdWJkZXYvcGNpLmggfCAxICsKIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9w
Y2llLmMgICAgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmggYi9kcm0v
bm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oCmluZGV4IDIzODAzY2M4Li4xZmRmMzA5
OCAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaAorKysg
Yi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oCkBAIC01Myw0ICs1Myw1IEBA
IGludCBncDEwMF9wY2lfbmV3KHN0cnVjdCBudmttX2RldmljZSAqLCBpbnQsIHN0cnVjdCBudmtt
X3BjaSAqKik7CiAKIC8qIHBjaWUgZnVuY3Rpb25zICovCiBpbnQgbnZrbV9wY2llX3NldF9saW5r
KHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9zcGVlZCwgdTggd2lkdGgpOworZW51
bSBudmttX3BjaWVfc3BlZWQgbnZrbV9wY2llX2dldF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKik7
CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMg
Yi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCmluZGV4IGQ3MWU1ZGI1Li43MGNj
YmUwZCAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYworKysg
Yi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCkBAIC0xNjMsMyArMTYzLDExIEBA
IG52a21fcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmttX3BjaWVf
c3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCiAJcmV0dXJuIHJldDsKIH0KKworZW51bSBudmttX3Bj
aWVfc3BlZWQKK252a21fcGNpZV9nZXRfc3BlZWQoc3RydWN0IG52a21fcGNpICpwY2kpCit7CisJ
aWYgKCFwY2kgfHwgIXBjaV9pc19wY2llKHBjaS0+cGRldikgfHwgIXBjaS0+cGNpZS5jdXJfc3Bl
ZWQpCisJCXJldHVybiAtRU5PREVWOworCXJldHVybiBwY2ktPmZ1bmMtPnBjaWUuY3VyX3NwZWVk
KHBjaSk7Cit9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
