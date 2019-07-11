Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699046592F
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256156E255;
	Thu, 11 Jul 2019 14:42:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147716E258
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:18:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so6550781wru.0
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 07:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gdYLhNmyERRe1jsuxgZzgHrszMUboWiuJT1CdADiim8=;
 b=A2vbAacXjGSQ+/ajbDGKsjqAdlOQGPIt5AT0CreeHDTfT4a827fR4x4AowD04r/dxv
 Y9CURv2HLcWZpA4dnhG1ljyG8+wuM6+ZdJc/yfrN/5PbPTGMrDSFUdpGsFf2/64hX58D
 iINYTq6rJvpppgJ9P1dLSFlRCm1QQtf4UPj7xg/lh/blCKIvGgmsE2tAtNn4NzweCwd3
 evsrKOalwcFV6+ueL5bFeyGahJUSSObfBqBzZqDT4UYaxCFbTOAaMjwlC9wnyRmSFt88
 9uZvuF8OfDoeBNK9POS3m9Ikz4XpDgqF0BQtdhXoNfRsMR0pFo2VTdTV4776jpxIwM/X
 tb7A==
X-Gm-Message-State: APjAAAUC7Ds5ZXeo+ye1fxoGbazLzelomt4/gEXx3v8y92Lryr1Cx8N4
 FehmkJN5u9keWDImMh9XE5mKeEIP/Lk=
X-Google-Smtp-Source: APXvYqxsmbqc7/ixozrGNK6GDvbj/cv/6lS43mRC8Rp/rMbdQxai8x8OatmHWnTXQhOICPqEQV+2Nw==
X-Received: by 2002:adf:f246:: with SMTP id b6mr5671743wrp.92.1562854706550;
 Thu, 11 Jul 2019 07:18:26 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 5sm5883635wmg.42.2019.07.11.07.18.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 07:18:26 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 16:11:51 +0200
Message-Id: <20190711141153.7723-3-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711141153.7723-1-mmenzyns@redhat.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 14:42:17 +0000
Subject: [Nouveau] [PATCH 2/4] gpio: checking if gpu power cable is connected
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

VGVzdGVkIG9uIFRVMTA0LCBHUDEwNiBhbmQgR0YxMDAKClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVu
enluc2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0KIGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZr
bS9zdWJkZXYvYmlvcy9ncGlvLmggfCAgMSArCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9ncGlv
L2Jhc2UuYyAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9pbmNsdWRlL252
a20vc3ViZGV2L2Jpb3MvZ3Bpby5oIGIvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9i
aW9zL2dwaW8uaAppbmRleCAyZjQwOTM1Zi4uYTcwZWM5ZTggMTAwNjQ0Ci0tLSBhL2RybS9ub3V2
ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKKysrIGIvZHJtL25vdXZlYXUvaW5j
bHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaApAQCAtNyw2ICs3LDcgQEAgZW51bSBkY2JfZ3Bp
b19mdW5jX25hbWUgewogCURDQl9HUElPX1RWREFDMCA9IDB4MGMsCiAJRENCX0dQSU9fVFZEQUMx
ID0gMHgyZCwKIAlEQ0JfR1BJT19GQU5fU0VOU0UgPSAweDNkLAorCURDQl9HUElPX0VYVF9QT1dF
Ul9MT1cgPSAweDc5LAogCURDQl9HUElPX0xPR09fTEVEX1BXTSA9IDB4ODQsCiAJRENCX0dQSU9f
VU5VU0VEID0gMHhmZiwKIAlEQ0JfR1BJT19WSUQwID0gMHgwNCwKZGlmZiAtLWdpdCBhL2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
Z3Bpby9iYXNlLmMKaW5kZXggMTM5OWQ5MjMuLmM0Njg1ODA3IDEwMDY0NAotLS0gYS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9ncGlvL2Jhc2UuYwpAQCAtMTgyLDEyICsxODIsMzUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWlfc3lzdGVtX2lkIGdwaW9fcmVzZXRfaWRzW10gPSB7CiAJeyB9CiB9OwogCitzdGF0aWMgZW51
bSBkY2JfZ3Bpb19mdW5jX25hbWUgcG93ZXJfY2hlY2tzW10gPSB7CisJRENCX0dQSU9fRVhUX1BP
V0VSX0xPVywKK307CisKIHN0YXRpYyBpbnQKIG52a21fZ3Bpb19pbml0KHN0cnVjdCBudmttX3N1
YmRldiAqc3ViZGV2KQogewogCXN0cnVjdCBudmttX2dwaW8gKmdwaW8gPSBudmttX2dwaW8oc3Vi
ZGV2KTsKKwlzdHJ1Y3QgZGNiX2dwaW9fZnVuYyBmdW5jOworCWludCByZXQ7CisJaW50IGk7CisK
IAlpZiAoZG1pX2NoZWNrX3N5c3RlbShncGlvX3Jlc2V0X2lkcykpCiAJCW52a21fZ3Bpb19yZXNl
dChncGlvLCBEQ0JfR1BJT19VTlVTRUQpOworCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
cG93ZXJfY2hlY2tzKTsgKytpKSB7CisJCXJldCA9IG52a21fZ3Bpb19maW5kKGdwaW8sIDAsIHBv
d2VyX2NoZWNrc1tpXSwgRENCX0dQSU9fVU5VU0VELAorCQkJCSAgICAgJmZ1bmMpOworCQlpZiAo
cmV0KQorCQkJY29udGludWU7CisKKwkJcmV0ID0gbnZrbV9ncGlvX2dldChncGlvLCAwLCBmdW5j
LmZ1bmMsIGZ1bmMubGluZSk7CisJCWlmIChyZXQpIHsKKwkJCW52a21fZXJyb3IoJmdwaW8tPnN1
YmRldiwKKwkJCQkgICAibm90IGVub3VnaCBwb3dlciwgY2hlY2sgR1BVIHBvd2VyIGNhYmxlXG4i
KTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisJfQorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
