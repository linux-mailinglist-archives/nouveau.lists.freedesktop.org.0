Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F779D5B97
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2019 08:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11E89DB8;
	Mon, 14 Oct 2019 06:47:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD8389DB8;
 Mon, 14 Oct 2019 06:47:01 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u40so23934133qth.11;
 Sun, 13 Oct 2019 23:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gBY3KrQPhZOniLzzenkAT+Lt4l2XRp5rFRvFQg1agFc=;
 b=AsxXJQ8rUZ3STrlamthNC0IdXsg3rCst0ttMksW1DUOKP1iYG2tk/NoruFq4xI4wLt
 MX/U/IECGYVLZz7sR5JX9HxVTNqz7IujiXOSJVtK8e6/iIaqhtMfRRxp5voNBwY5EWxA
 tsd7ypbM3Ii8gstgu1H7bq3ezRAFVzTGddJE/yB07kY/81hbNAml38uqffM0OWQ6UM55
 w589y/5b0WnekhveoPx66RTqudli61OH9OkKe3AWDTXgAlcWRh9sDzKdHpCLgjd7uxAI
 X/DQb0paia4J5BPq/+r3K74G9Q6taSGjmTciPbgphbZcCj2uv39s90BNrDK8W1+Zlsyp
 YV+A==
X-Gm-Message-State: APjAAAV/5B2ltIq2ksTEZGlJOV5MI/WIiymuP9If1beEkfDELF9Bhb60
 jgraeh3ClDw4NyjD+Cg18DGDf9wmIPI=
X-Google-Smtp-Source: APXvYqx4M4xe7Noi5Irr8tkR4gBDimP9gWM0EI5Vqymoya169tvnGcw354ZhWKP/8EaaqoAjqFtiUg==
X-Received: by 2002:a0c:d6c3:: with SMTP id l3mr29503646qvi.201.1571035619672; 
 Sun, 13 Oct 2019 23:46:59 -0700 (PDT)
Received: from athos.glmx.com (pool-173-68-201-69.nycmny.fios.verizon.net.
 [173.68.201.69])
 by smtp.gmail.com with ESMTPSA id e4sm7514705qkl.135.2019.10.13.23.46.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Oct 2019 23:46:59 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: mesa-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Mon, 14 Oct 2019 02:46:58 -0400
Message-Id: <20191014064658.2325-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBY3KrQPhZOniLzzenkAT+Lt4l2XRp5rFRvFQg1agFc=;
 b=tUoMHrpWi90PXNDCmpMWh0N7SsXZ9khQqkX/19FUDSSWVJRsFE+RiJCik15wQ7TO8B
 gIyN55LJ+YNehv7rKRwUkFaWKs9VZ1G4+g832cz7qQAVq4jF56v8YIEL3y5+hSWTteYZ
 NDw2bzylmLTbLjDW0wgE1m8YNpvpN5BRfaKzisnDp2R0G9YXQvTv4YyrT6k9oeH5hhxo
 DtDyAtIuTdmLbyy9L5K8G9+iSrkTyDuyeCqsiKNLWoX4DmvHcoA6fEeoRCaz5Va1TFQ+
 idIVQgGeI6azvKY8NtJqH8KDot+Jg3CgDtQH3yjIi9Io/LZNB8nPVvRjokuGttM9CFkH
 MWPA==
Subject: [Nouveau] [PATCH] nv50/ir: mark STORE destination inputs as used
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

T2JzZXJ2ZWQgYW4gaXNzdWUgd2hlbiBsb29raW5nIGF0IHRoZSBjb2RlIGdlbmVyYXRlZHkgYnkg
dGhlCmltYWdlLXZlcnRleC1hdHRyaWItaW5wdXQtb3V0cHV0IHBpZ2xpdCB0ZXN0LiBFdmVuIHRo
b3VnaCB0aGUgdGVzdAppdHNlbGYgd29ya2VkIGZpbmUgKGR1ZSB0byBUSUMgMCBiZWluZyB1c2Vk
IGZvciB0aGUgaW1hZ2UpLCB0aGlzIG5lZWRzCnRvIGJlIGZpeGVkLgoKU2lnbmVkLW9mZi1ieTog
SWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHNyYy9nYWxsaXVtL2RyaXZl
cnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZnJvbV90Z3NpLmNwcCB8IDYgKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJp
dmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9mcm9tX3Rnc2kuY3BwIGIvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9pcl9mcm9tX3Rnc2kuY3BwCmluZGV4IGQ2MmQz
NjAwOGU2Li44YzQyOTAyNjQ1MiAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2
ZWF1L2NvZGVnZW4vbnY1MF9pcl9mcm9tX3Rnc2kuY3BwCisrKyBiL3NyYy9nYWxsaXVtL2RyaXZl
cnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZnJvbV90Z3NpLmNwcApAQCAtMTU5MSw2ICsxNTkx
LDEyIEBAIGJvb2wgU291cmNlOjpzY2FuSW5zdHJ1Y3Rpb24oY29uc3Qgc3RydWN0IHRnc2lfZnVs
bF9pbnN0cnVjdGlvbiAqaW5zdCkKICAgICAgIGlmIChpbnNuLmdldE9wY29kZSgpID09IFRHU0lf
T1BDT0RFX1NUT1JFICYmCiAgICAgICAgICAgZHN0LmdldEZpbGUoKSAhPSBUR1NJX0ZJTEVfTUVN
T1JZKSB7CiAgICAgICAgICBpbmZvLT5pby5nbG9iYWxBY2Nlc3MgfD0gMHgyOworCisgICAgICAg
ICBpZiAoZHN0LmdldEZpbGUoKSA9PSBUR1NJX0ZJTEVfSU5QVVQpIHsKKyAgICAgICAgICAgIC8v
IFRPRE86IEhhbmRsZSBpbmRpcmVjdCBzb21laG93PworICAgICAgICAgICAgY29uc3QgaW50IGkg
PSBkc3QuZ2V0SW5kZXgoMCk7CisgICAgICAgICAgICBpbmZvLT5pbltpXS5tYXNrIHw9IDE7Cisg
ICAgICAgICB9CiAgICAgICB9CiAKICAgICAgIGlmIChkc3QuZ2V0RmlsZSgpID09IFRHU0lfRklM
RV9PVVRQVVQpIHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1
