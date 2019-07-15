Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66F68686
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 11:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A889930;
	Mon, 15 Jul 2019 09:43:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486218991A
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 09:43:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f9so16273841wre.12
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 02:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qg72Q/9dDrzVaCYz9iXOZGOqlByievjkJ2m+Qd9PKGI=;
 b=UIDylxZe5r/KNyIKqtGbhCsIpMEJsMvpYqzWjK7i7lBeaZ7duDXCyQsJO3u1b84Cjl
 H2q4mrkeg/6C6e4pPWjJ2LUbHrmhwrWWGLsmpk5svMYKSfi0m6YiWafIr96V5LbVI5iQ
 /jzipGlNODnnp9ocR7Ic/iEIAw2PHoIkRpxrex1C6AsTWI2h/9yZyxeiHNU8yp6IwAwE
 xDS7jJGaLnvm41FOL0sr/a/2/Jid+clxW4nslvLySPUXrFlWb9yolDIfPX+Ifuy6riJj
 rvcAADTmhnv00ygyQZZ2+dddBM+zOxd+YO1XG9WR8AI3nTrxvZLa+dl9O6MGQk3YTLRc
 ZEzA==
X-Gm-Message-State: APjAAAU0DJMir9ztxmwVTDKaythSjeg6EQwjjKGXmnQhQmxNkyeEPB5N
 NV5pUb++ADzSTY9J/X6pi/6bdje9f1k=
X-Google-Smtp-Source: APXvYqxejSWRs1hlfmTzNIaK+zhnkIIqelCffUEIYmeg1NuBE5+es4BGZHHT1TF/eBV+NKT5Bdejrw==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr21484755wrs.136.1563183792826; 
 Mon, 15 Jul 2019 02:43:12 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o126sm14383044wmo.1.2019.07.15.02.43.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 02:43:12 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 15 Jul 2019 11:42:47 +0200
Message-Id: <20190715094247.8331-5-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715094247.8331-1-mmenzyns@redhat.com>
References: <20190715094247.8331-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 4/4] gpio: check function 76 in the power check
 as well
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

QWRkZWQgR1BJTyBpcyAiUG93ZXIgQWxlcnQiLiBJdCdzIHVuY2VydGFpbiBpZiB0aGlzCkdQSU8g
aXMgc2V0IG9uIEdQVSBpbml0aWFsaXphdGlvbiBvciBvbmx5IGlmIGEgY2hhbmdlIGlzIGRldGVj
dGVkIGJ5IHRoZQpHUFUgYXQgcnVudGltZS4KClRoaXMgR1BJTyBjYW4gYmUgZm91bmQgb24gVGVz
bGEgYW5kIHNvbWV0aW1lcyBvbiBGZXJtaSBHUFVzLgoKVW50ZXN0ZWQsIHdyb3RlIGFjY29yZGlu
ZyB0byBkb2N1bWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56
eW5zQHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9z
L2dwaW8uaCB8IDEgKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMgICAgICAg
ICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oIGIvZHJtL25vdXZlYXUv
aW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaAppbmRleCBmYzJiNWZiMC4uNzg0YzVmMjIg
MTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgK
KysrIGIvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaApAQCAtOCw2
ICs4LDcgQEAgZW51bSBkY2JfZ3Bpb19mdW5jX25hbWUgewogCURDQl9HUElPX1RIRVJNX0VYVF9Q
T1dFUl9FVkVOVCA9IDB4MTAsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKIAlEQ0JfR1BJT19G
QU5fU0VOU0UgPSAweDNkLAorCURDQl9HUElPX1BPV0VSX0FMRVJUID0gMHg0YywKIAlEQ0JfR1BJ
T19FWFRfUE9XRVJfTE9XID0gMHg3OSwKIAlEQ0JfR1BJT19MT0dPX0xFRF9QV00gPSAweDg0LAog
CURDQl9HUElPX1VOVVNFRCA9IDB4ZmYsCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9ncGlvL2Jhc2UuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCmlu
ZGV4IDBjODg2NTQzLi43NTVmMDE2ZiAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZ3Bpby9iYXNlLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMK
QEAgLTE4NCw2ICsxODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgZ3Bp
b19yZXNldF9pZHNbXSA9IHsKIAogc3RhdGljIGVudW0gZGNiX2dwaW9fZnVuY19uYW1lIHBvd2Vy
X2NoZWNrc1tdID0gewogCURDQl9HUElPX1RIRVJNX0VYVF9QT1dFUl9FVkVOVCwKKwlEQ0JfR1BJ
T19QT1dFUl9BTEVSVCwKIAlEQ0JfR1BJT19FWFRfUE9XRVJfTE9XLAogfTsKIAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
