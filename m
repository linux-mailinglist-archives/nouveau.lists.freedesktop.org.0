Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A0ED019
	for <lists+nouveau@lfdr.de>; Sat,  2 Nov 2019 18:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F15C6E4E8;
	Sat,  2 Nov 2019 17:56:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D516E4DD;
 Sat,  2 Nov 2019 17:56:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z19so7886852wmk.3;
 Sat, 02 Nov 2019 10:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
 b=qeT0qmZk6sbb+JlLu+1+QibZIpOrYMAQiveBO3Gtc9hAH/HCcoZmZPJpHssW1MvFGq
 dBXM9SxYs1lM4lYmfyW5yeCuCbGtdakDyTvu5ZGutR9R1QwKMDdHld3BRpgy6sHX0HKx
 UABX/QOT9YbohCzhnMyHx7p2M3H0Tm7cm5VBVzL9mSm/nXGp/dDlpg1za39NBboDYObz
 AbWD5j4fv0wfVQqpsm9TPgzQObea2b9G8ZmN6ya94kCSj8PxlEsdwxKmF3/1B5k/fLO5
 XVf+KFeVZrV/VOTrOj/i8mSU6Mv3xzJLVqxIYpl12Kw+5c0rW7xqp5G4Bj3ftMR8p9NG
 4fNg==
X-Gm-Message-State: APjAAAUoPJUDoCu2Ir8iBo1oId8IRVA8lDD9wB/q6KwEc8e5UhdHB2kK
 +JjCLEHYA2J+z3tBocHaY3A=
X-Google-Smtp-Source: APXvYqx9tdG3WA1HsVorLUlV0lcZZZ0mAl4cYePM67MnHlKZPh33QVcD9sYlhIq0QqLoi69/NETT4w==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr16062345wme.103.1572717406828; 
 Sat, 02 Nov 2019 10:56:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v10sm14574594wmg.48.2019.11.02.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Date: Sat,  2 Nov 2019 18:56:31 +0100
Message-Id: <20191102175637.3065-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANfPpmnsT/oeTWNuA93BRI4tRFioqEyA5OCtqkzBRZ8=;
 b=UXbkDudP4dmji/zYAcLUXUjXdfcd7W8lG7HOEPZCRPQ/6upGd6Z4dRI0UqJ/eGYXSZ
 PLMxF18nEMIkCDF0isYInwxVgqRIYo/72TByzGmzBFSzQZCAdRgwTIryOPQIhNqOhr1h
 1g9+Iw7wBTRe5OR191YmEP9h0M7sfvvZJR61fRTAg1D+EoAGZD9n4MlUxzP4yFXTUmQ3
 It0P7xe765MhQnJJNkKaKrRYFKa0vwZ0/RF9ZqhC0Fvn8McebUWCECb+JRXOs+kFwX/6
 9qjUeDtVJemHafAMcSnJ2n3EUH2Rgx05UHdjXsUd7Fi8GdyrZnIaPU5Sv5E69i5gbe7r
 Vf0w==
Subject: [Nouveau] [PATCH v2 3/9] drm/nouveau: fault: Add support for GP10B
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZXJlIGlzIG5vIEJB
UjIgb24gR1AxMEIgYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8gbWFwIHRocm91Z2ggQkFSMgpiZWNh
dXNlIGFsbCBtZW1vcnkgaXMgc2hhcmVkIGJldHdlZW4gdGhlIEdQVSBhbmQgdGhlIENQVS4gQWRk
IGEgY3VzdG9tCmltcGxlbWVudGF0aW9uIG9mIHRoZSBmYXVsdCBzdWItZGV2aWNlIHRoYXQgdXNl
cyBudmttX21lbW9yeV9hZGRyKCkKaW5zdGVhZCBvZiBudmttX21lbW9yeV9iYXIyKCkgdG8gcmV0
dXJuIHRoZSBhZGRyZXNzIG9mIGEgcGlubmVkIGZhdWx0CmJ1ZmZlci4KClNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogLi4uL2RybS9ub3V2ZWF1
L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmF1bHQuaCAgIHwgIDEgKwogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jIHwgIDIgKy0KIC4uLi9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvZmF1bHQvS2J1aWxkICB8ICAxICsKIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZmF1bHQvYmFzZS5jICB8ICAyICstCiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2ZhdWx0L2dwMTAwLmMgfCAxNyArKysrLS0KIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZmF1bHQvZ3AxMGIuYyB8IDUzICsrKysrKysrKysrKysrKysrKysKIC4uLi9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYyB8ICAxICsKIC4uLi9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvcHJpdi5oICB8IDEwICsrKysKIDggZmlsZXMgY2hh
bmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ncDEwYi5jCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9mYXVs
dC5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9mYXVsdC5o
CmluZGV4IDk3MzIyZjk1YjNlZS4uYTUxM2MxNmFiMTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2ZhdWx0LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9mYXVsdC5oCkBAIC0zMSw2ICszMSw3
IEBAIHN0cnVjdCBudmttX2ZhdWx0X2RhdGEgewogfTsKIAogaW50IGdwMTAwX2ZhdWx0X25ldyhz
dHJ1Y3QgbnZrbV9kZXZpY2UgKiwgaW50LCBzdHJ1Y3QgbnZrbV9mYXVsdCAqKik7CitpbnQgZ3Ax
MGJfZmF1bHRfbmV3KHN0cnVjdCBudmttX2RldmljZSAqLCBpbnQsIHN0cnVjdCBudmttX2ZhdWx0
ICoqKTsKIGludCBndjEwMF9mYXVsdF9uZXcoc3RydWN0IG52a21fZGV2aWNlICosIGludCwgc3Ry
dWN0IG52a21fZmF1bHQgKiopOwogaW50IHR1MTAyX2ZhdWx0X25ldyhzdHJ1Y3QgbnZrbV9kZXZp
Y2UgKiwgaW50LCBzdHJ1Y3QgbnZrbV9mYXVsdCAqKik7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jCmluZGV4IGMzYzcxNTlm
MzQxMS4uYjA2MWRmMTM4MTQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vZW5naW5lL2RldmljZS9iYXNlLmMKQEAgLTIzNzUsNyArMjM3NSw3IEBAIG52MTNiX2NoaXBz
ZXQgPSB7CiAJLm5hbWUgPSAiR1AxMEIiLAogCS5iYXIgPSBnbTIwYl9iYXJfbmV3LAogCS5idXMg
PSBnZjEwMF9idXNfbmV3LAotCS5mYXVsdCA9IGdwMTAwX2ZhdWx0X25ldywKKwkuZmF1bHQgPSBn
cDEwYl9mYXVsdF9uZXcsCiAJLmZiID0gZ3AxMGJfZmJfbmV3LAogCS5mdXNlID0gZ20xMDdfZnVz
ZV9uZXcsCiAJLmlidXMgPSBncDEwYl9pYnVzX25ldywKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L0tidWlsZCBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L0tidWlsZAppbmRleCA1M2I5ZDYzOGYyYzguLmQ2NWVj
NzE5ZjE1MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
ZmF1bHQvS2J1aWxkCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Zh
dWx0L0tidWlsZApAQCAtMiw1ICsyLDYgQEAKIG52a20teSArPSBudmttL3N1YmRldi9mYXVsdC9i
YXNlLm8KIG52a20teSArPSBudmttL3N1YmRldi9mYXVsdC91c2VyLm8KIG52a20teSArPSBudmtt
L3N1YmRldi9mYXVsdC9ncDEwMC5vCitudmttLXkgKz0gbnZrbS9zdWJkZXYvZmF1bHQvZ3AxMGIu
bwogbnZrbS15ICs9IG52a20vc3ViZGV2L2ZhdWx0L2d2MTAwLm8KIG52a20teSArPSBudmttL3N1
YmRldi9mYXVsdC90dTEwMi5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9mYXVsdC9iYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9mYXVsdC9iYXNlLmMKaW5kZXggY2EyNTE1NjBkM2UwLi4xYzRiODUyYjI2YzMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2Jhc2UuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9iYXNlLmMKQEAg
LTEwOCw3ICsxMDgsNyBAQCBudmttX2ZhdWx0X29uZWluaXRfYnVmZmVyKHN0cnVjdCBudmttX2Zh
dWx0ICpmYXVsdCwgaW50IGlkKQogCQlyZXR1cm4gcmV0OwogCiAJLyogUGluIGZhdWx0IGJ1ZmZl
ciBpbiBCQVIyLiAqLwotCWJ1ZmZlci0+YWRkciA9IG52a21fbWVtb3J5X2JhcjIoYnVmZmVyLT5t
ZW0pOworCWJ1ZmZlci0+YWRkciA9IGZhdWx0LT5mdW5jLT5idWZmZXIucGluKGJ1ZmZlcik7CiAJ
aWYgKGJ1ZmZlci0+YWRkciA9PSB+MFVMTCkKIAkJcmV0dXJuIC1FRkFVTFQ7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2dwMTAwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ncDEwMC5jCmluZGV4IDRm
M2M0ZTA5MTExNy4uZjZiMTg5Y2M0MzMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9mYXVsdC9ncDEwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2ZhdWx0L2dwMTAwLmMKQEAgLTIxLDI1ICsyMSwyNiBAQAogICovCiAj
aW5jbHVkZSAicHJpdi5oIgogCisjaW5jbHVkZSA8Y29yZS9tZW1vcnkuaD4KICNpbmNsdWRlIDxz
dWJkZXYvbWMuaD4KIAogI2luY2x1ZGUgPG52aWYvY2xhc3MuaD4KIAotc3RhdGljIHZvaWQKK3Zv
aWQKIGdwMTAwX2ZhdWx0X2J1ZmZlcl9pbnRyKHN0cnVjdCBudmttX2ZhdWx0X2J1ZmZlciAqYnVm
ZmVyLCBib29sIGVuYWJsZSkKIHsKIAlzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9IGJ1ZmZl
ci0+ZmF1bHQtPnN1YmRldi5kZXZpY2U7CiAJbnZrbV9tY19pbnRyX21hc2soZGV2aWNlLCBOVktN
X1NVQkRFVl9GQVVMVCwgZW5hYmxlKTsKIH0KIAotc3RhdGljIHZvaWQKK3ZvaWQKIGdwMTAwX2Zh
dWx0X2J1ZmZlcl9maW5pKHN0cnVjdCBudmttX2ZhdWx0X2J1ZmZlciAqYnVmZmVyKQogewogCXN0
cnVjdCBudmttX2RldmljZSAqZGV2aWNlID0gYnVmZmVyLT5mYXVsdC0+c3ViZGV2LmRldmljZTsK
IAludmttX21hc2soZGV2aWNlLCAweDAwMmE3MCwgMHgwMDAwMDAwMSwgMHgwMDAwMDAwMCk7CiB9
CiAKLXN0YXRpYyB2b2lkCit2b2lkCiBncDEwMF9mYXVsdF9idWZmZXJfaW5pdChzdHJ1Y3QgbnZr
bV9mYXVsdF9idWZmZXIgKmJ1ZmZlcikKIHsKIAlzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9
IGJ1ZmZlci0+ZmF1bHQtPnN1YmRldi5kZXZpY2U7CkBAIC00OCw3ICs0OSwxMiBAQCBncDEwMF9m
YXVsdF9idWZmZXJfaW5pdChzdHJ1Y3QgbnZrbV9mYXVsdF9idWZmZXIgKmJ1ZmZlcikKIAludmtt
X21hc2soZGV2aWNlLCAweDAwMmE3MCwgMHgwMDAwMDAwMSwgMHgwMDAwMDAwMSk7CiB9CiAKLXN0
YXRpYyB2b2lkCit1NjQgZ3AxMDBfZmF1bHRfYnVmZmVyX3BpbihzdHJ1Y3QgbnZrbV9mYXVsdF9i
dWZmZXIgKmJ1ZmZlcikKK3sKKwlyZXR1cm4gbnZrbV9tZW1vcnlfYmFyMihidWZmZXItPm1lbSk7
Cit9CisKK3ZvaWQKIGdwMTAwX2ZhdWx0X2J1ZmZlcl9pbmZvKHN0cnVjdCBudmttX2ZhdWx0X2J1
ZmZlciAqYnVmZmVyKQogewogCWJ1ZmZlci0+ZW50cmllcyA9IG52a21fcmQzMihidWZmZXItPmZh
dWx0LT5zdWJkZXYuZGV2aWNlLCAweDAwMmE3OCk7CkBAIC01Niw3ICs2Miw3IEBAIGdwMTAwX2Zh
dWx0X2J1ZmZlcl9pbmZvKHN0cnVjdCBudmttX2ZhdWx0X2J1ZmZlciAqYnVmZmVyKQogCWJ1ZmZl
ci0+cHV0ID0gMHgwMDJhODA7CiB9CiAKLXN0YXRpYyB2b2lkCit2b2lkCiBncDEwMF9mYXVsdF9p
bnRyKHN0cnVjdCBudmttX2ZhdWx0ICpmYXVsdCkKIHsKIAludmttX2V2ZW50X3NlbmQoJmZhdWx0
LT5ldmVudCwgMSwgMCwgTlVMTCwgMCk7CkBAIC02OCw2ICs3NCw3IEBAIGdwMTAwX2ZhdWx0ID0g
ewogCS5idWZmZXIubnIgPSAxLAogCS5idWZmZXIuZW50cnlfc2l6ZSA9IDMyLAogCS5idWZmZXIu
aW5mbyA9IGdwMTAwX2ZhdWx0X2J1ZmZlcl9pbmZvLAorCS5idWZmZXIucGluID0gZ3AxMDBfZmF1
bHRfYnVmZmVyX3BpbiwKIAkuYnVmZmVyLmluaXQgPSBncDEwMF9mYXVsdF9idWZmZXJfaW5pdCwK
IAkuYnVmZmVyLmZpbmkgPSBncDEwMF9mYXVsdF9idWZmZXJfZmluaSwKIAkuYnVmZmVyLmludHIg
PSBncDEwMF9mYXVsdF9idWZmZXJfaW50ciwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2dwMTBiLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9mYXVsdC9ncDEwYi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uOWU2NmQxZjc2NTRkCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3AxMGIuYwpAQCAtMCwwICsxLDUzIEBACisv
KgorICogQ29weXJpZ2h0IChjKSAyMDE5IE5WSURJQSBDb3Jwb3JhdGlvbi4KKyAqCisgKiBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3
YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24KKyAq
IHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmli
dXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwg
YW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCisgKiBTb2Z0d2FyZSBpcyBmdXJuaXNo
ZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorICoKKyAq
IFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNo
YWxsIGJlIGluY2x1ZGVkIGluCisgKiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25z
IG9mIHRoZSBTb2Z0d2FyZS4KKyAqCisgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElT
IiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorICogSU1QTElFRCwg
SU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFC
SUxJVFksCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklO
R0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKKyAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9S
IEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUgorICogT1RIRVIg
TElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhF
UldJU0UsCisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhF
IFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKKyAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FS
RS4KKyAqLworCisjaW5jbHVkZSAicHJpdi5oIgorCisjaW5jbHVkZSA8Y29yZS9tZW1vcnkuaD4K
KworI2luY2x1ZGUgPG52aWYvY2xhc3MuaD4KKwordTY0CitncDEwYl9mYXVsdF9idWZmZXJfcGlu
KHN0cnVjdCBudmttX2ZhdWx0X2J1ZmZlciAqYnVmZmVyKQoreworCXJldHVybiBudmttX21lbW9y
eV9hZGRyKGJ1ZmZlci0+bWVtKTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBudmttX2ZhdWx0
X2Z1bmMKK2dwMTBiX2ZhdWx0ID0geworCS5pbnRyID0gZ3AxMDBfZmF1bHRfaW50ciwKKwkuYnVm
ZmVyLm5yID0gMSwKKwkuYnVmZmVyLmVudHJ5X3NpemUgPSAzMiwKKwkuYnVmZmVyLmluZm8gPSBn
cDEwMF9mYXVsdF9idWZmZXJfaW5mbywKKwkuYnVmZmVyLnBpbiA9IGdwMTBiX2ZhdWx0X2J1ZmZl
cl9waW4sCisJLmJ1ZmZlci5pbml0ID0gZ3AxMDBfZmF1bHRfYnVmZmVyX2luaXQsCisJLmJ1ZmZl
ci5maW5pID0gZ3AxMDBfZmF1bHRfYnVmZmVyX2ZpbmksCisJLmJ1ZmZlci5pbnRyID0gZ3AxMDBf
ZmF1bHRfYnVmZmVyX2ludHIsCisJLnVzZXIgPSB7IHsgMCwgMCwgTUFYV0VMTF9GQVVMVF9CVUZG
RVJfQSB9LCAwIH0sCit9OworCitpbnQKK2dwMTBiX2ZhdWx0X25ldyhzdHJ1Y3QgbnZrbV9kZXZp
Y2UgKmRldmljZSwgaW50IGluZGV4LAorCQlzdHJ1Y3QgbnZrbV9mYXVsdCAqKnBmYXVsdCkKK3sK
KwlyZXR1cm4gbnZrbV9mYXVsdF9uZXdfKCZncDEwYl9mYXVsdCwgZGV2aWNlLCBpbmRleCwgcGZh
dWx0KTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L2ZhdWx0L2d2MTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVs
dC9ndjEwMC5jCmluZGV4IDY3NDdmMDljMmRjMy4uMjcwN2JlNGZmYWJjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEwMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMKQEAgLTIxNCw2
ICsyMTQsNyBAQCBndjEwMF9mYXVsdCA9IHsKIAkuYnVmZmVyLm5yID0gMiwKIAkuYnVmZmVyLmVu
dHJ5X3NpemUgPSAzMiwKIAkuYnVmZmVyLmluZm8gPSBndjEwMF9mYXVsdF9idWZmZXJfaW5mbywK
KwkuYnVmZmVyLnBpbiA9IGdwMTAwX2ZhdWx0X2J1ZmZlcl9waW4sCiAJLmJ1ZmZlci5pbml0ID0g
Z3YxMDBfZmF1bHRfYnVmZmVyX2luaXQsCiAJLmJ1ZmZlci5maW5pID0gZ3YxMDBfZmF1bHRfYnVm
ZmVyX2ZpbmksCiAJLmJ1ZmZlci5pbnRyID0gZ3YxMDBfZmF1bHRfYnVmZmVyX2ludHIsCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9wcml2Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9wcml2LmgKaW5kZXgg
OTc1ZTY2YWM2MzQ0Li5mNmYxZGQ3ZWVlMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L3ByaXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9mYXVsdC9wcml2LmgKQEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IG52
a21fZmF1bHRfZnVuYyB7CiAJCWludCBucjsKIAkJdTMyIGVudHJ5X3NpemU7CiAJCXZvaWQgKCpp
bmZvKShzdHJ1Y3QgbnZrbV9mYXVsdF9idWZmZXIgKik7CisJCXU2NCAoKnBpbikoc3RydWN0IG52
a21fZmF1bHRfYnVmZmVyICopOwogCQl2b2lkICgqaW5pdCkoc3RydWN0IG52a21fZmF1bHRfYnVm
ZmVyICopOwogCQl2b2lkICgqZmluaSkoc3RydWN0IG52a21fZmF1bHRfYnVmZmVyICopOwogCQl2
b2lkICgqaW50cikoc3RydWN0IG52a21fZmF1bHRfYnVmZmVyICosIGJvb2wgZW5hYmxlKTsKQEAg
LTQwLDYgKzQxLDE1IEBAIHN0cnVjdCBudmttX2ZhdWx0X2Z1bmMgewogCX0gdXNlcjsKIH07CiAK
K3ZvaWQgZ3AxMDBfZmF1bHRfYnVmZmVyX2ludHIoc3RydWN0IG52a21fZmF1bHRfYnVmZmVyICos
IGJvb2wgZW5hYmxlKTsKK3ZvaWQgZ3AxMDBfZmF1bHRfYnVmZmVyX2Zpbmkoc3RydWN0IG52a21f
ZmF1bHRfYnVmZmVyICopOwordm9pZCBncDEwMF9mYXVsdF9idWZmZXJfaW5pdChzdHJ1Y3QgbnZr
bV9mYXVsdF9idWZmZXIgKik7Cit1NjQgZ3AxMDBfZmF1bHRfYnVmZmVyX3BpbihzdHJ1Y3QgbnZr
bV9mYXVsdF9idWZmZXIgKik7Cit2b2lkIGdwMTAwX2ZhdWx0X2J1ZmZlcl9pbmZvKHN0cnVjdCBu
dmttX2ZhdWx0X2J1ZmZlciAqKTsKK3ZvaWQgZ3AxMDBfZmF1bHRfaW50cihzdHJ1Y3QgbnZrbV9m
YXVsdCAqKTsKKwordTY0IGdwMTBiX2ZhdWx0X2J1ZmZlcl9waW4oc3RydWN0IG52a21fZmF1bHRf
YnVmZmVyICopOworCiBpbnQgZ3YxMDBfZmF1bHRfb25laW5pdChzdHJ1Y3QgbnZrbV9mYXVsdCAq
KTsKIAogaW50IG52a21fdWZhdWx0X25ldyhzdHJ1Y3QgbnZrbV9kZXZpY2UgKiwgY29uc3Qgc3Ry
dWN0IG52a21fb2NsYXNzICosCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
