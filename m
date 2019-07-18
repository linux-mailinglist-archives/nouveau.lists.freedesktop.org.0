Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58C6CAA2
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 10:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074EE6E33F;
	Thu, 18 Jul 2019 08:07:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C68C6E342
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 08:07:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r1so27581165wrl.7
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 01:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+aKshin+cvfQzeYY7lvU4p/kfcDFe/TyM5OVeCVtbw=;
 b=hRM7uhE5yxESdaV6XOPL58lff7LnM/P3KxzeJ/9hq3hP1kL9gquQtcxDnBre9JAtHt
 CprnVUc/l7oDK295LWrSzhlgqYxfbf/X+eIw3LMmJx1QHJWecW2fOQI+F+9Lv89CjmEZ
 na1jbnBYGU+ckiwWIW5VybEiR5cu05nv+FGB7NCoUOQHmxDhNGCHT9dq5dEB1SRF2pA4
 5i6ZkTd46QETjNUevXev8Kub8Xle2OTb3CnKVbfhhh7oU7sJnwJiuTZTFlisfu/rJCpm
 uts/A6ddZem1juCyZQHZBZW8xD+eP0mJvDRQN9yUGkvV0EwRLH1UKELyzRPxhka6xgV+
 +6Cw==
X-Gm-Message-State: APjAAAXQfUBhici+vDKhY+F5u/ZriFeD35yYXCUq0cqu4cHd9xtYKywT
 GLhGKmPdlxYUh4WjjJuLvKblzXIgihQ=
X-Google-Smtp-Source: APXvYqyDJbDHBv2ruzWDOTKYIPjMDK0Kyxjv45/QJNPfMB4w/P6zI7BVI9MNDRat3MWUZ8kAQYiG5w==
X-Received: by 2002:a5d:428b:: with SMTP id k11mr17801898wrq.174.1563437268728; 
 Thu, 18 Jul 2019 01:07:48 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm28354532wrv.90.2019.07.18.01.07.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:07:48 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Jul 2019 10:07:41 +0200
Message-Id: <20190718080741.3147-5-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718080741.3147-1-mmenzyns@redhat.com>
References: <20190718080741.3147-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 4/4] gpio: check function 76 in the power check
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
ZGV4IGNjNTY2MzdmLi5hYjU0MWYyNiAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvZ3Bpby9iYXNlLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMK
QEAgLTE4NSw2ICsxODUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgZ3Bp
b19yZXNldF9pZHNbXSA9IHsKIAogc3RhdGljIGVudW0gZGNiX2dwaW9fZnVuY19uYW1lIHBvd2Vy
X2NoZWNrc1tdID0gewogCURDQl9HUElPX1RIRVJNX0VYVF9QT1dFUl9FVkVOVCwKKwlEQ0JfR1BJ
T19QT1dFUl9BTEVSVCwKIAlEQ0JfR1BJT19FWFRfUE9XRVJfTE9XLAogfTsKIAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
