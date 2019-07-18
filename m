Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64926CAA0
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE16E340;
	Thu, 18 Jul 2019 08:07:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D776E33E
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 08:07:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y4so27613634wrm.2
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 01:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJ5ETVyZ9UdZnWPpmt/cgPaHw4vbBkohxla01Y453OE=;
 b=f9NsvmvnlWjrSyrnTqwo8uR5luLu7P5zo9c0cRBgyZec52upraw5Y4HU1d4L9oPBI+
 aCxeQ4eMFcpIMpR+IDqYjlvzAZVfP+a3yiRzDlcE+WIN7LIbmpA/GmCKBiuqgWhnZ7nr
 UNT8HNroWxuAj8tuM5ZrLzmsCNKSqm2zIAojUbY+glJa4r99X+n36gxUuFjMFZaQN0pA
 er/CF+FEI4erMJTYD421SMZDdsQiHqcvtMVos4tWdakgYowWgGKnPW0gdEdXk2M8z3Gc
 1PVqSy1BQSLlA2VBUAhTzNcO4jMSQdhdYVpv1H9JDmastaidAo662m0iY/L/9xeBR7Le
 80Dw==
X-Gm-Message-State: APjAAAUYZvyxiqPhMzkguTUdrguYT1Ib50F5EMxeOKQTt33OZ9oUXxia
 Ew1+HMYRbxMzDLvSeo1Jgzza9+R6pqU=
X-Google-Smtp-Source: APXvYqyUBqkpJi1IzRTXg9HoLjmg/pc0Np/CUAOU4NBNkZwFzhLXRRo4qnw1mrkXi2RW/ByJVO8Pvg==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr48655641wrt.183.1563437267002; 
 Thu, 18 Jul 2019 01:07:47 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm28354532wrv.90.2019.07.18.01.07.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:07:46 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Jul 2019 10:07:39 +0200
Message-Id: <20190718080741.3147-3-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718080741.3147-1-mmenzyns@redhat.com>
References: <20190718080741.3147-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 2/4] gpio: fail if gpu external power is missing
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

Q3VycmVudGx5LCBub3V2ZWF1IGRvZXNuJ3QgY2hlY2sgaWYgR1BVIGlzIG1pc3NpbmcgcG93ZXIu
IFRoaXMKcGF0Y2ggbWFrZXMgbm91dmVhdSBmYWlsIHdoZW4gdGhpcyBoYXBwZW5zIG9uIGxhdGVz
dCBHUFVzLgoKSXQgY2hlY2tzIEdQSU8gZnVuY3Rpb24gMTIxIChFeHRlcm5hbCBQb3dlciBFbWVy
Z2VuY3kpLCB3aGljaApzaG91bGQgZGV0ZWN0IHBvd2VyIHByb2JsZW1zIG9uIEdQVSBpbml0aWFs
aXphdGlvbi4KClRoaXMgY2FuIGJlIGRpc2FibGVkIHdpdGggbm91dmVhdS5jb25maWc9TnZQb3dl
ckNoZWNrcz0xCgpUZXN0ZWQgb24gVFUxMDQsIEdQMTA2IGFuZCBHRjEwMC4KCnYzOgoqICBBZGQg
Y29uZmlnIG92ZXJyaWRlIGZvciBkaXNhYmxpbmcgcG93ZXIgY2hlY2tzCgpTaWduZWQtb2ZmLWJ5
OiBNYXJrIE1lbnp5bnNraSA8bW1lbnp5bnNAcmVkaGF0LmNvbT4KLS0tCiBkcm0vbm91dmVhdS9p
bmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oIHwgIDEgKwogZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvZ3Bpby9iYXNlLmMgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUv
aW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZr
bS9zdWJkZXYvYmlvcy9ncGlvLmgKaW5kZXggMmY0MDkzNWYuLmE3MGVjOWU4IDEwMDY0NAotLS0g
YS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCisrKyBiL2RybS9u
b3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKQEAgLTcsNiArNyw3IEBAIGVu
dW0gZGNiX2dwaW9fZnVuY19uYW1lIHsKIAlEQ0JfR1BJT19UVkRBQzAgPSAweDBjLAogCURDQl9H
UElPX1RWREFDMSA9IDB4MmQsCiAJRENCX0dQSU9fRkFOX1NFTlNFID0gMHgzZCwKKwlEQ0JfR1BJ
T19FWFRfUE9XRVJfTE9XID0gMHg3OSwKIAlEQ0JfR1BJT19MT0dPX0xFRF9QV00gPSAweDg0LAog
CURDQl9HUElPX1VOVVNFRCA9IDB4ZmYsCiAJRENCX0dQSU9fVklEMCA9IDB4MDQsCmRpZmYgLS1n
aXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYyBiL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2dwaW8vYmFzZS5jCmluZGV4IDEzOTlkOTIzLi43MjI4OWUyZSAxMDA2NDQKLS0t
IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMKKysrIGIvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMKQEAgLTIzLDYgKzIzLDcgQEAKICAqLwogI2luY2x1ZGUg
InByaXYuaCIKIAorI2luY2x1ZGUgPGNvcmUvb3B0aW9uLmg+CiAjaW5jbHVkZSA8Y29yZS9ub3Rp
ZnkuaD4KIAogc3RhdGljIGludApAQCAtMTgyLDEyICsxODMsNDEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkbWlfc3lzdGVtX2lkIGdwaW9fcmVzZXRfaWRzW10gPSB7CiAJeyB9CiB9OwogCitzdGF0
aWMgZW51bSBkY2JfZ3Bpb19mdW5jX25hbWUgcG93ZXJfY2hlY2tzW10gPSB7CisJRENCX0dQSU9f
RVhUX1BPV0VSX0xPVywKK307CisKIHN0YXRpYyBpbnQKIG52a21fZ3Bpb19pbml0KHN0cnVjdCBu
dmttX3N1YmRldiAqc3ViZGV2KQogewogCXN0cnVjdCBudmttX2dwaW8gKmdwaW8gPSBudmttX2dw
aW8oc3ViZGV2KTsKKwlzdHJ1Y3QgZGNiX2dwaW9fZnVuYyBmdW5jOworCWludCByZXQ7CisJaW50
IGk7CisKIAlpZiAoZG1pX2NoZWNrX3N5c3RlbShncGlvX3Jlc2V0X2lkcykpCiAJCW52a21fZ3Bp
b19yZXNldChncGlvLCBEQ0JfR1BJT19VTlVTRUQpOworCisJaWYgKG52a21fYm9vbG9wdChzdWJk
ZXYtPmRldmljZS0+Y2Znb3B0LCAiTnZQb3dlckNoZWNrcyIsIHRydWUpKQorCXsKKwkJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUocG93ZXJfY2hlY2tzKTsgKytpKQorCQl7CisJCQlyZXQgPSBu
dmttX2dwaW9fZmluZChncGlvLCAwLCBwb3dlcl9jaGVja3NbaV0sCisJCQkJCSAgICAgRENCX0dQ
SU9fVU5VU0VELCAmZnVuYyk7CisJCQlpZiAocmV0KQorCQkJCWNvbnRpbnVlOworCisJCQlyZXQg
PSBudmttX2dwaW9fZ2V0KGdwaW8sIDAsIGZ1bmMuZnVuYywgZnVuYy5saW5lKTsKKwkJCWlmICgh
cmV0KQorCQkJCWNvbnRpbnVlOworCisJCQludmttX2Vycm9yKCZncGlvLT5zdWJkZXYsCisJCQkJ
ICAgIkdQVSBpcyBtaXNzaW5nIHBvd2VyLCBjaGVjayBpdHMgcG93ZXIgY2FibGVzLiAiCisJCQkJ
ICAgIkJvb3Qgd2l0aCBub3V2ZWF1LmNvbmZpZz1OdlBvd2VyQ2hlY2tzPTAgdG8gZGlzYWJsZS5c
biIpOworCQkJcmV0dXJuIC1FSU5WQUw7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIAotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
