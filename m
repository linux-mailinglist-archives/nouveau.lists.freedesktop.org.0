Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6249ED0
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 13:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C346E12F;
	Tue, 18 Jun 2019 11:01:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C026E12F
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 11:01:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d18so13469840wrs.5
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 04:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdVj+cf6QDP+KBp5yUUIh15517WnwY6C9010W9kUxZk=;
 b=raNPDa8zKMRccOLfwlTrdHNGMcCRG+xioDP/WgTYGRaV5SuLTg5cgpwFZyBpqd2kDe
 8roah52zruJgKiLdq7dy19TyBS2z0pAi+nhoJWmNkomUbLExixcT1h7h/77bzAftiw4e
 at9cK0+EgktLuimNX7KT9Wcn63M143aClmRVkaYmMH4UkEKsugo4wAWpt6O4v+oMSA4t
 icVVgwjzsbZihcacxNccyqwE/Fpz0OqOmwR91eCWeqJnRIN1kLqiDgOLyzfp40ZGgqHG
 /uVF1LCHrAhxyIdB00evTRcD98M8yhI61w5hYLRc3Mbety+754jPBJPG3SVuZes/E6+q
 r/EQ==
X-Gm-Message-State: APjAAAWirhEIvl+wwRuuEWecdZWWe6+G/85W2H8n6qd8tsr/ESWRuIAD
 27oQ8/U3y/BxHNQnPvXFcYwW+egCqT0=
X-Google-Smtp-Source: APXvYqzritpUXqSdtt1Ah9HF0XbLSkPpiq0nSiUvtAUZNJy+cgpNv3fucopGtD/fmvFfeuCcouRwQg==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr64044765wrw.73.1560855696789; 
 Tue, 18 Jun 2019 04:01:36 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:a436:9628:593f:d774])
 by smtp.gmail.com with ESMTPSA id f204sm3741096wme.18.2019.06.18.04.01.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 04:01:36 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 18 Jun 2019 13:01:33 +0200
Message-Id: <20190618110133.9526-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] hwmon: return EINVAL if the GPU is powered down
 for sensors reads
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

Zml4ZXMgYm9ndXMgdmFsdWVzIHVzZXJzcGFjZSBnZXRzIGZyb20gaHdtb24gd2hpbGUgdGhlIEdQ
VSBpcyBwb3dlcmVkIGRvd24KClNpZ25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEBy
ZWRoYXQuY29tPgotLS0KIGRybS9ub3V2ZWF1L25vdXZlYXVfaHdtb24uYyB8IDEwICsrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25v
dXZlYXUvbm91dmVhdV9od21vbi5jIGIvZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jCmluZGV4
IDYxOGQ4Yjc4MC4uZDQ0NWM2ZjNmIDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9ub3V2ZWF1X2h3
bW9uLmMKKysrIGIvZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jCkBAIC00MjYsNiArNDI2LDgg
QEAgbm91dmVhdV90ZW1wX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgYXR0ciwgaW50IGNo
YW5uZWwsIGxvbmcgKnZhbCkKIAogCXN3aXRjaCAoYXR0cikgewogCWNhc2UgaHdtb25fdGVtcF9p
bnB1dDoKKwkJaWYgKGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSAhPSBEUk1fU1dJVENIX1BP
V0VSX09OKQorCQkJcmV0dXJuIC1FSU5WQUw7CiAJCXJldCA9IG52a21fdGhlcm1fdGVtcF9nZXQo
dGhlcm0pOwogCQkqdmFsID0gcmV0IDwgMCA/IHJldCA6IChyZXQgKiAxMDAwKTsKIAkJYnJlYWs7
CkBAIC00NzIsNiArNDc0LDggQEAgbm91dmVhdV9mYW5fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHUzMiBhdHRyLCBpbnQgY2hhbm5lbCwgbG9uZyAqdmFsKQogCiAJc3dpdGNoIChhdHRyKSB7CiAJ
Y2FzZSBod21vbl9mYW5faW5wdXQ6CisJCWlmIChkcm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUg
IT0gRFJNX1NXSVRDSF9QT1dFUl9PTikKKwkJCXJldHVybiAtRUlOVkFMOwogCQkqdmFsID0gbnZr
bV90aGVybV9mYW5fc2Vuc2UodGhlcm0pOwogCQlicmVhazsKIAlkZWZhdWx0OgpAQCAtNDk0LDYg
KzQ5OCw4IEBAIG5vdXZlYXVfaW5fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBhdHRyLCBp
bnQgY2hhbm5lbCwgbG9uZyAqdmFsKQogCiAJc3dpdGNoIChhdHRyKSB7CiAJY2FzZSBod21vbl9p
bl9pbnB1dDoKKwkJaWYgKGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSAhPSBEUk1fU1dJVENI
X1BPV0VSX09OKQorCQkJcmV0dXJuIC1FSU5WQUw7CiAJCXJldCA9IG52a21fdm9sdF9nZXQodm9s
dCk7CiAJCSp2YWwgPSByZXQgPCAwID8gcmV0IDogKHJldCAvIDEwMDApOwogCQlicmVhazsKQEAg
LTUyNSw2ICs1MzEsOCBAQCBub3V2ZWF1X3B3bV9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMy
IGF0dHIsIGludCBjaGFubmVsLCBsb25nICp2YWwpCiAJCSp2YWwgPSB0aGVybS0+YXR0cl9nZXQo
dGhlcm0sIE5WS01fVEhFUk1fQVRUUl9GQU5fTU9ERSk7CiAJCWJyZWFrOwogCWNhc2UgaHdtb25f
cHdtX2lucHV0OgorCQlpZiAoZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlICE9IERSTV9TV0lU
Q0hfUE9XRVJfT04pCisJCQlyZXR1cm4gLUVJTlZBTDsKIAkJKnZhbCA9IHRoZXJtLT5mYW5fZ2V0
KHRoZXJtKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKQEAgLTU0Niw2ICs1NTQsOCBAQCBub3V2ZWF1
X3Bvd2VyX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgYXR0ciwgaW50IGNoYW5uZWwsIGxv
bmcgKnZhbCkKIAogCXN3aXRjaCAoYXR0cikgewogCWNhc2UgaHdtb25fcG93ZXJfaW5wdXQ6CisJ
CWlmIChkcm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgIT0gRFJNX1NXSVRDSF9QT1dFUl9PTikK
KwkJCXJldHVybiAtRUlOVkFMOwogCQkqdmFsID0gbnZrbV9pY2NzZW5zZV9yZWFkX2FsbChpY2Nz
ZW5zZSk7CiAJCWJyZWFrOwogCWNhc2UgaHdtb25fcG93ZXJfbWF4OgotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
