Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52EB3D2E
	for <lists+nouveau@lfdr.de>; Mon, 16 Sep 2019 17:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FF96E9C9;
	Mon, 16 Sep 2019 15:04:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5666E9C3;
 Mon, 16 Sep 2019 15:04:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c20so403437eds.1;
 Mon, 16 Sep 2019 08:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mswe0yNxUUeN6+euQulztA2QuAFX/m2N/24ZWKG86JE=;
 b=T1tV6JFycWri9jctrFLFJm4BC7BM4VeoTxjYkGX0ntOeHomWOhkH0lGvOq7uFu6lEu
 xwTakNknW9v3xUt/ESisXkmGXHNB3ZEHriuVrz0RDIDX3ri3fzBbNcMIYNQtB0osAybW
 2rXQOyaS9STQ+f5yxQ/vFdVCMHLlWPHVSC3pMZh22hceIU7FwhdkCjcYUQgC9p/Tnq22
 I3h6IWyJWFvHy4VsZqkjCQCVpLK2mFj6mDSlwsFJVgW045SQ/WEZj3M/FXXJ8/zicq3S
 E+pLSsXo39rlCpd0ibkbQ2rbCZa9DMZ8uqNyvXN2VfGICALzkI5SVhyxxme8A79zdGwU
 /OWw==
X-Gm-Message-State: APjAAAWw+53S6rJas9Z4J59aM+b9n+Ey+/XlQ9G3uzi7g8U0FTaDDoCm
 zghMwHzK/IRfZJAdw+7Y/XY=
X-Google-Smtp-Source: APXvYqwDSbkm/cDSmuomYIzJNKN5v78AAWntn01J516te3mk+kSWMCYmD3jaDjgw0q5vAo3auWR16g==
X-Received: by 2002:a17:906:1385:: with SMTP id
 f5mr422963ejc.145.1568646270307; 
 Mon, 16 Sep 2019 08:04:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id j9sm1139162edt.15.2019.09.16.08.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 16 Sep 2019 17:04:07 +0200
Message-Id: <20190916150412.10025-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mswe0yNxUUeN6+euQulztA2QuAFX/m2N/24ZWKG86JE=;
 b=rDuSB+f9bOB+Ntj6tQgNBi+8+4sqMYyqILs9fUJfEUUbxIJ01GV9sAxiMcM0zZc3vn
 j4tGep08OvEjhVVNq5AqKIehzkD5VuFe8pZmxBBBpjsAOa4MNXi8+HFqRYnP+Jb0P6x8
 YsjzVuR2RG1n8RnTrXakhd6CqAUiTmmLnX1vOC8+GvFOXaJfVSxt0ENyge41heNHrcE8
 QpnFFeNC3FTnoukUTe3FEgVk3XWKjqBXcZeYWYYsS9GDYLPmlR/Q/KuXyTKX5w+cRm7h
 GTeaDMDYd0Ad6p1MzzDTOPG+ZMN4QB2/N6hXGWBJxf28TOIFneIV7mnL+B+bmXG6YthY
 Bgag==
Subject: [Nouveau] [PATCH 06/11] drm/nouveau: gk20a: Set IOMMU bit for DMA
 API if appropriate
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkRldGVjdCBpZiB0aGUg
RE1BIEFQSSBpcyBiYWNrZWQgYnkgYW4gSU9NTVUgYW5kIHNldCB0aGUgSU9NTVUgYml0IGlmIHNv
LgpUaGlzIGlzIG5lZWRlZCB0byBtYWtlIHN1cmUgSU9NTVUgYWRkcmVzc2VzIGFyZSBwcm9wZXJs
eSB0cmFuc2xhdGVkIGV2ZW4KdGhlIGV4cGxpY2l0IElPTU1VIEFQSSBpcyBub3QgdXNlZC4KClNp
Z25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogLi4u
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3RtZW0vZ2syMGEuYyAgIHwgMzUgKysrKysrKysr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2lu
c3RtZW0vZ2syMGEuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3Rt
ZW0vZ2syMGEuYwppbmRleCBiMDQ5M2Y4ZGYxZmUuLjExMjBhMmE3ZDVmMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9nazIwYS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3RtZW0vZ2syMGEuYwpAQCAt
MTAwLDEyICsxMDAsMTQgQEAgc3RydWN0IGdrMjBhX2luc3RtZW0gewogCXVuc2lnbmVkIGludCB2
YWRkcl9tYXg7CiAJc3RydWN0IGxpc3RfaGVhZCB2YWRkcl9scnU7CiAKKwkvKiBJT01NVSBtYXBw
aW5nICovCisJdW5zaWduZWQgaW50IHBhZ2Vfc2hpZnQ7CisJdTY0IGlvbW11X21hc2s7CisKIAkv
KiBPbmx5IHVzZWQgaWYgSU9NTVUgaWYgcHJlc2VudCAqLwogCXN0cnVjdCBtdXRleCAqbW1fbXV0
ZXg7CiAJc3RydWN0IG52a21fbW0gKm1tOwogCXN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbjsK
LQl1bnNpZ25lZCBsb25nIGlvbW11X3Bnc2hpZnQ7Ci0JdTE2IGlvbW11X2JpdDsKIAogCS8qIE9u
bHkgdXNlZCBieSBETUEgQVBJICovCiAJdW5zaWduZWQgbG9uZyBhdHRyczsKQEAgLTM1NywxMiAr
MzU5LDEyIEBAIGdrMjBhX2luc3RvYmpfZHRvcl9pb21tdShzdHJ1Y3QgbnZrbV9tZW1vcnkgKm1l
bW9yeSkKIAltdXRleF91bmxvY2soJmltZW0tPmxvY2spOwogCiAJLyogY2xlYXIgSU9NTVUgYml0
IHRvIHVubWFwIHBhZ2VzICovCi0Jci0+b2Zmc2V0ICY9IH5CSVQoaW1lbS0+aW9tbXVfYml0IC0g
aW1lbS0+aW9tbXVfcGdzaGlmdCk7CisJci0+b2Zmc2V0ICY9IH5pbWVtLT5pb21tdV9tYXNrOwog
CiAJLyogVW5tYXAgcGFnZXMgZnJvbSBHUFUgYWRkcmVzcyBzcGFjZSBhbmQgZnJlZSB0aGVtICov
CiAJZm9yIChpID0gMDsgaSA8IG5vZGUtPmJhc2UubW4tPmxlbmd0aDsgaSsrKSB7CiAJCWlvbW11
X3VubWFwKGltZW0tPmRvbWFpbiwKLQkJCSAgICAoci0+b2Zmc2V0ICsgaSkgPDwgaW1lbS0+aW9t
bXVfcGdzaGlmdCwgUEFHRV9TSVpFKTsKKwkJCSAgICAoci0+b2Zmc2V0ICsgaSkgPDwgaW1lbS0+
cGFnZV9zaGlmdCwgUEFHRV9TSVpFKTsKIAkJZG1hX3VubWFwX3BhZ2UoZGV2LCBub2RlLT5kbWFf
YWRkcnNbaV0sIFBBR0VfU0laRSwKIAkJCSAgICAgICBETUFfQklESVJFQ1RJT05BTCk7CiAJCV9f
ZnJlZV9wYWdlKG5vZGUtPnBhZ2VzW2ldKTsKQEAgLTQ0MCw3ICs0NDIsNyBAQCBnazIwYV9pbnN0
b2JqX2N0b3JfZG1hKHN0cnVjdCBnazIwYV9pbnN0bWVtICppbWVtLCB1MzIgbnBhZ2VzLCB1MzIg
YWxpZ24sCiAKIAkvKiBwcmVzZW50IG1lbW9yeSBmb3IgYmVpbmcgbWFwcGVkIHVzaW5nIHNtYWxs
IHBhZ2VzICovCiAJbm9kZS0+ci50eXBlID0gMTI7Ci0Jbm9kZS0+ci5vZmZzZXQgPSBub2RlLT5o
YW5kbGUgPj4gMTI7CisJbm9kZS0+ci5vZmZzZXQgPSBpbWVtLT5pb21tdV9tYXNrIHwgbm9kZS0+
aGFuZGxlID4+IDEyOwogCW5vZGUtPnIubGVuZ3RoID0gKG5wYWdlcyA8PCBQQUdFX1NISUZUKSA+
PiAxMjsKIAogCW5vZGUtPmJhc2UubW4gPSAmbm9kZS0+cjsKQEAgLTQ5Myw3ICs0OTUsNyBAQCBn
azIwYV9pbnN0b2JqX2N0b3JfaW9tbXUoc3RydWN0IGdrMjBhX2luc3RtZW0gKmltZW0sIHUzMiBu
cGFnZXMsIHUzMiBhbGlnbiwKIAltdXRleF9sb2NrKGltZW0tPm1tX211dGV4KTsKIAkvKiBSZXNl
cnZlIGFyZWEgZnJvbSBHUFUgYWRkcmVzcyBzcGFjZSAqLwogCXJldCA9IG52a21fbW1faGVhZChp
bWVtLT5tbSwgMCwgMSwgbnBhZ2VzLCBucGFnZXMsCi0JCQkgICBhbGlnbiA+PiBpbWVtLT5pb21t
dV9wZ3NoaWZ0LCAmcik7CisJCQkgICBhbGlnbiA+PiBpbWVtLT5wYWdlX3NoaWZ0LCAmcik7CiAJ
bXV0ZXhfdW5sb2NrKGltZW0tPm1tX211dGV4KTsKIAlpZiAocmV0KSB7CiAJCW52a21fZXJyb3Io
c3ViZGV2LCAiSU9NTVUgc3BhY2UgaXMgZnVsbCFcbiIpOwpAQCAtNTAyLDcgKzUwNCw3IEBAIGdr
MjBhX2luc3RvYmpfY3Rvcl9pb21tdShzdHJ1Y3QgZ2syMGFfaW5zdG1lbSAqaW1lbSwgdTMyIG5w
YWdlcywgdTMyIGFsaWduLAogCiAJLyogTWFwIGludG8gR1BVIGFkZHJlc3Mgc3BhY2UgKi8KIAlm
b3IgKGkgPSAwOyBpIDwgbnBhZ2VzOyBpKyspIHsKLQkJdTMyIG9mZnNldCA9IChyLT5vZmZzZXQg
KyBpKSA8PCBpbWVtLT5pb21tdV9wZ3NoaWZ0OworCQl1MzIgb2Zmc2V0ID0gKHItPm9mZnNldCAr
IGkpIDw8IGltZW0tPnBhZ2Vfc2hpZnQ7CiAKIAkJcmV0ID0gaW9tbXVfbWFwKGltZW0tPmRvbWFp
biwgb2Zmc2V0LCBub2RlLT5kbWFfYWRkcnNbaV0sCiAJCQkJUEFHRV9TSVpFLCBJT01NVV9SRUFE
IHwgSU9NTVVfV1JJVEUpOwpAQCAtNTE4LDcgKzUyMCw3IEBAIGdrMjBhX2luc3RvYmpfY3Rvcl9p
b21tdShzdHJ1Y3QgZ2syMGFfaW5zdG1lbSAqaW1lbSwgdTMyIG5wYWdlcywgdTMyIGFsaWduLAog
CX0KIAogCS8qIElPTU1VIGJpdCB0ZWxscyB0aGF0IGFuIGFkZHJlc3MgaXMgdG8gYmUgcmVzb2x2
ZWQgdGhyb3VnaCB0aGUgSU9NTVUgKi8KLQlyLT5vZmZzZXQgfD0gQklUKGltZW0tPmlvbW11X2Jp
dCAtIGltZW0tPmlvbW11X3Bnc2hpZnQpOworCXItPm9mZnNldCB8PSBpbWVtLT5pb21tdV9tYXNr
OwogCiAJbm9kZS0+YmFzZS5tbiA9IHI7CiAJcmV0dXJuIDA7CkBAIC02MTksMTEgKzYyMSwxMiBA
QCBnazIwYV9pbnN0bWVtX25ldyhzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSwgaW50IGluZGV4
LAogCQlpbWVtLT5tbV9tdXRleCA9ICZ0ZGV2LT5pb21tdS5tdXRleDsKIAkJaW1lbS0+bW0gPSAm
dGRldi0+aW9tbXUubW07CiAJCWltZW0tPmRvbWFpbiA9IHRkZXYtPmlvbW11LmRvbWFpbjsKLQkJ
aW1lbS0+aW9tbXVfcGdzaGlmdCA9IHRkZXYtPmlvbW11LnBnc2hpZnQ7Ci0JCWltZW0tPmlvbW11
X2JpdCA9IHRkZXYtPmZ1bmMtPmlvbW11X2JpdDsKKwkJaW1lbS0+cGFnZV9zaGlmdCA9IHRkZXYt
PmlvbW11LnBnc2hpZnQ7CiAKIAkJbnZrbV9pbmZvKCZpbWVtLT5iYXNlLnN1YmRldiwgInVzaW5n
IElPTU1VXG4iKTsKIAl9IGVsc2UgeworCQlpbWVtLT5wYWdlX3NoaWZ0ID0gUEFHRV9TSElGVDsK
KwogCQlpbWVtLT5hdHRycyA9IERNQV9BVFRSX05PTl9DT05TSVNURU5UIHwKIAkJCSAgICAgIERN
QV9BVFRSX1dFQUtfT1JERVJJTkcgfAogCQkJICAgICAgRE1BX0FUVFJfV1JJVEVfQ09NQklORTsK
QEAgLTYzMSw1ICs2MzQsMTcgQEAgZ2syMGFfaW5zdG1lbV9uZXcoc3RydWN0IG52a21fZGV2aWNl
ICpkZXZpY2UsIGludCBpbmRleCwKIAkJbnZrbV9pbmZvKCZpbWVtLT5iYXNlLnN1YmRldiwgInVz
aW5nIERNQSBBUElcbiIpOwogCX0KIAorCS8qCisJICogVGhlIElPTU1VIG1hc2sgbmVlZHMgdG8g
YmUgc2V0IGlmIGFuIElPTU1VIGlzIHVzZWQgZXhwbGljaXRseSAodmlhCisJICogZGlyZWN0IElP
TU1VIEFQSSB1c2FnZSkgb3IgaW1wbGljaXRseSAodmlhIHRoZSBETUEgQVBJKS4gSW4gYm90aAor
CSAqIGNhc2VzIHRoZSBkZXZpY2Ugd2lsbCBoYXZlIGJlZW4gYXR0YWNoZWQgdG8gYW4gSU9NTVUg
ZG9tYWluLgorCSAqLworCWlmIChpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYoZGV2aWNlLT5kZXYp
KSB7CisJCWltZW0tPmlvbW11X21hc2sgPSBCSVRfVUxMKHRkZXYtPmZ1bmMtPmlvbW11X2JpdCAt
CisJCQkJCSAgIGltZW0tPnBhZ2Vfc2hpZnQpOworCQludmttX2RlYnVnKCZpbWVtLT5iYXNlLnN1
YmRldiwgIklPTU1VIG1hc2s6ICUwMTZsbHhcbiIsCisJCQkgICBpbWVtLT5pb21tdV9tYXNrKTsK
Kwl9CisKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
