Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D24212B2B4
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC81089DBA;
	Fri, 27 Dec 2019 08:13:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BF189D84
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id h6so1635431qkf.2
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRggeho95DncGN+AT9iW7vh5wy6AMhDkR1ylS8BLo3U=;
 b=Z6FPqWY8xhqWHQ1Z1jE+fDSLBwgVSNxVQ8c9GC0HnqL5aTlEoyKukvRT0bLCjEmeO3
 jdEy/Wt8g7+3oLmfDgjRUbD8LM8pbZV8IsUUjEWlnPSUG6xDdecc6GIDe9+nHnX7zFLj
 94H+N0wC5u9gJGFk6UA3/FcBBNDzqp4Gm02HhEfQ+cIEhJMrbcnmOgivf8xIkm8iUAIm
 +FjxdgozOVglobkgBolzICZS/1dqujKTPGQE594CvbYjULQrckQQ2MpdIeH8TmMUu5Kv
 nJepfYhuvVSKeFYEijWIva8OuyV40mQb6yTlSYo5sOvsDPinwvNddf4UMo6en49hpBFG
 RQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRggeho95DncGN+AT9iW7vh5wy6AMhDkR1ylS8BLo3U=;
 b=nPlxojnX8rJjuKEWZTUniMeyF9ip3BdCRXDeiCuXrlwPLFE/jJqg/M78WYfC5m74gT
 28kgBje4b7Acn7ZxCEckWgyvrs7vLLQvIiRsZdgnTNRD/i7MDVejT26NUn4YNJoxjP+V
 wVkeycuRre0yAF9jxW3ksC+jXasvKHqseKmR0S72URrH4KSi7j2M5Y4hWHhg+d+zD+Fj
 ol3wqHiZcLcKVy3jJ1eQdo8djJBZEONvw9qmiVm7x6/gdRnRoAdiOcf91caY8LB6Qf1l
 yp2XvqAlls5cdjyW7d1lAz/Vk1PGUL0LKtWNCp1Rw3NTb0ven13Be2HLVkGyo0RpSNvf
 meIA==
X-Gm-Message-State: APjAAAUhqOaOkzy0tu5peZDGIalncO3dlPsS2PWUW44qtxZIlLZCpYbh
 7qJbnqcBz2Jz7+JjtzXzaOqEjA==
X-Google-Smtp-Source: APXvYqy/RbSa3eEPDBlXrh1yGA/H58lhDB5xOYOKxwKTP9IyRxvM48S8YYUitKPIWnrC9+g+LsGdEA==
X-Received: by 2002:a37:7c42:: with SMTP id x63mr13834831qkc.134.1572293448467; 
 Mon, 28 Oct 2019 13:10:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o1sm7821372qtb.82.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001ge-Bn; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:24 -0300
Message-Id: <20191028201032.6352-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 07/15] drm/radeon: use mmu_range_notifier_insert
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIG5ldyBBUEkgaXMg
YW4gZXhhY3QgbWF0Y2ggZm9yIHRoZSBuZWVkcyBvZiByYWRlb24uCgpGb3Igc29tZSByZWFzb24g
cmFkZW9uIHRyaWVzIHRvIHJlbW92ZSBvdmVybGFwcGluZyByYW5nZXMgZnJvbSB0aGUKaW50ZXJ2
YWwgdHJlZSwgYnV0IGludGVydmFsIHRyZWVzIChhbmQgbW11X3JhbmdlX25vdGlmaWVyX2luc2Vy
dCkKc3VwcG9ydCBvdmVybGFwcGluZyByYW5nZXMgZGlyZWN0bHkuIFNpbXBseSBkZWxldGUgYWxs
IHRoaXMgY29kZS4KClNpbmNlIHRoaXMgZHJpdmVyIGlzIG1pc3NpbmcgYSBpbnZhbGlkYXRlX3Jh
bmdlX2VuZCBjYWxsYmFjaywgYnV0CnN0aWxsIGNhbGxzIGdldF91c2VyX3BhZ2VzKCksIGl0IGNh
bm5vdCBiZSBjb3JyZWN0IGFnYWluc3QgYWxsIHJhY2VzLgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1k
LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBQZXRyIEN2ZWsgPHBl
dHJjdmVrY3pAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICB8ICAg
OSArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyB8IDIxOSArKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAx
NzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b24uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKaW5kZXggZDU5YjAwNGY2Njk1
ODMuLjI3OTU5ZjNhY2UxMTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKQEAgLTY4LDYgKzY4
LDEwIEBACiAjaW5jbHVkZSA8bGludXgvaGFzaHRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvZG1h
LWZlbmNlLmg+CiAKKyNpZmRlZiBDT05GSUdfTU1VX05PVElGSUVSCisjaW5jbHVkZSA8bGludXgv
bW11X25vdGlmaWVyLmg+CisjZW5kaWYKKwogI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2FwaS5o
PgogI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZlci5oPgogI2luY2x1ZGUgPGRybS90dG0v
dHRtX3BsYWNlbWVudC5oPgpAQCAtNTA5LDggKzUxMyw5IEBAIHN0cnVjdCByYWRlb25fYm8gewog
CXN0cnVjdCB0dG1fYm9fa21hcF9vYmoJCWRtYV9idWZfdm1hcDsKIAlwaWRfdAkJCQlwaWQ7CiAK
LQlzdHJ1Y3QgcmFkZW9uX21uCQkqbW47Ci0Jc3RydWN0IGxpc3RfaGVhZAkJbW5fbGlzdDsKKyNp
ZmRlZiBDT05GSUdfTU1VX05PVElGSUVSCisJc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllcglub3Rp
ZmllcjsKKyNlbmRpZgogfTsKICNkZWZpbmUgZ2VtX3RvX3JhZGVvbl9ibyhnb2JqKSBjb250YWlu
ZXJfb2YoKGdvYmopLCBzdHJ1Y3QgcmFkZW9uX2JvLCB0Ym8uYmFzZSkKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX21uLmMKaW5kZXggZGJhYjlhM2E5NjliOWUuLmQzZDQxZTIwYTY0OTIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tbi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKQEAgLTM2LDEzMSArMzYsNTEgQEAKIAogI2luY2x1
ZGUgInJhZGVvbi5oIgogCi1zdHJ1Y3QgcmFkZW9uX21uIHsKLQlzdHJ1Y3QgbW11X25vdGlmaWVy
CW1uOwotCi0JLyogb2JqZWN0cyBwcm90ZWN0ZWQgYnkgbG9jayAqLwotCXN0cnVjdCBtdXRleAkJ
bG9jazsKLQlzdHJ1Y3QgcmJfcm9vdF9jYWNoZWQJb2JqZWN0czsKLX07Ci0KLXN0cnVjdCByYWRl
b25fbW5fbm9kZSB7Ci0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZQlpdDsKLQlzdHJ1Y3QgbGlz
dF9oZWFkCQlib3M7Ci19OwotCiAvKioKLSAqIHJhZGVvbl9tbl9pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0IC0gY2FsbGJhY2sgdG8gbm90aWZ5IGFib3V0IG1tIGNoYW5nZQorICogcmFkZW9uX21uX2lu
dmFsaWRhdGUgLSBjYWxsYmFjayB0byBub3RpZnkgYWJvdXQgbW0gY2hhbmdlCiAgKgogICogQG1u
OiBvdXIgbm90aWZpZXIKLSAqIEBtbjogdGhlIG1tIHRoaXMgY2FsbGJhY2sgaXMgYWJvdXQKLSAq
IEBzdGFydDogc3RhcnQgb2YgdXBkYXRlZCByYW5nZQotICogQGVuZDogZW5kIG9mIHVwZGF0ZWQg
cmFuZ2UKKyAqIEByYW5nZTogdGhlIFZNQSB1bmRlciBpbnZhbGlkYXRpb24KICAqCiAgKiBXZSBi
bG9jayBmb3IgYWxsIEJPcyBiZXR3ZWVuIHN0YXJ0IGFuZCBlbmQgdG8gYmUgaWRsZSBhbmQKICAq
IHVubWFwIHRoZW0gYnkgbW92ZSB0aGVtIGludG8gc3lzdGVtIGRvbWFpbiBhZ2Fpbi4KICAqLwot
c3RhdGljIGludCByYWRlb25fbW5faW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3QgbW11X25v
dGlmaWVyICptbiwKLQkJCQljb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkK
K3N0YXRpYyBib29sIHJhZGVvbl9tbl9pbnZhbGlkYXRlKHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZp
ZXIgKm1uLAorCQkJCSBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSwKKwkJ
CQkgdW5zaWduZWQgbG9uZyBjdXJfc2VxKQogewotCXN0cnVjdCByYWRlb25fbW4gKnJtbiA9IGNv
bnRhaW5lcl9vZihtbiwgc3RydWN0IHJhZGVvbl9tbiwgbW4pOworCXN0cnVjdCByYWRlb25fYm8g
KmJvID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgcmFkZW9uX2JvLCBub3RpZmllcik7CiAJc3Ry
dWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07Ci0Jc3RydWN0IGlu
dGVydmFsX3RyZWVfbm9kZSAqaXQ7Ci0JdW5zaWduZWQgbG9uZyBlbmQ7Ci0JaW50IHJldCA9IDA7
Ci0KLQkvKiBub3RpZmljYXRpb24gaXMgZXhjbHVzaXZlLCBidXQgaW50ZXJ2YWwgaXMgaW5jbHVz
aXZlICovCi0JZW5kID0gcmFuZ2UtPmVuZCAtIDE7Ci0KLQkvKiBUT0RPIHdlIHNob3VsZCBiZSBh
YmxlIHRvIHNwbGl0IGxvY2tpbmcgZm9yIGludGVydmFsIHRyZWUgYW5kCi0JICogdGhlIHRlYXIg
ZG93bi4KLQkgKi8KLQlpZiAobW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCi0J
CW11dGV4X2xvY2soJnJtbi0+bG9jayk7Ci0JZWxzZSBpZiAoIW11dGV4X3RyeWxvY2soJnJtbi0+
bG9jaykpCi0JCXJldHVybiAtRUFHQUlOOwotCi0JaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfZmly
c3QoJnJtbi0+b2JqZWN0cywgcmFuZ2UtPnN0YXJ0LCBlbmQpOwotCXdoaWxlIChpdCkgewotCQlz
dHJ1Y3QgcmFkZW9uX21uX25vZGUgKm5vZGU7Ci0JCXN0cnVjdCByYWRlb25fYm8gKmJvOwotCQls
b25nIHI7Ci0KLQkJaWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkgewot
CQkJcmV0ID0gLUVBR0FJTjsKLQkJCWdvdG8gb3V0X3VubG9jazsKLQkJfQotCi0JCW5vZGUgPSBj
b250YWluZXJfb2YoaXQsIHN0cnVjdCByYWRlb25fbW5fbm9kZSwgaXQpOwotCQlpdCA9IGludGVy
dmFsX3RyZWVfaXRlcl9uZXh0KGl0LCByYW5nZS0+c3RhcnQsIGVuZCk7CisJbG9uZyByOwogCi0J
CWxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZub2RlLT5ib3MsIG1uX2xpc3QpIHsKKwlpZiAoIWJv
LT50Ym8udHRtIHx8IGJvLT50Ym8udHRtLT5zdGF0ZSAhPSB0dF9ib3VuZCkKKwkJcmV0dXJuIHRy
dWU7CiAKLQkJCWlmICghYm8tPnRiby50dG0gfHwgYm8tPnRiby50dG0tPnN0YXRlICE9IHR0X2Jv
dW5kKQotCQkJCWNvbnRpbnVlOworCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShy
YW5nZSkpCisJCXJldHVybiBmYWxzZTsKIAotCQkJciA9IHJhZGVvbl9ib19yZXNlcnZlKGJvLCB0
cnVlKTsKLQkJCWlmIChyKSB7Ci0JCQkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gcmVzZXJ2
ZSB1c2VyIGJvXG4iLCByKTsKLQkJCQljb250aW51ZTsKLQkJCX0KLQotCQkJciA9IGRtYV9yZXN2
X3dhaXRfdGltZW91dF9yY3UoYm8tPnRiby5iYXNlLnJlc3YsCi0JCQkJdHJ1ZSwgZmFsc2UsIE1B
WF9TQ0hFRFVMRV9USU1FT1VUKTsKLQkJCWlmIChyIDw9IDApCi0JCQkJRFJNX0VSUk9SKCIoJWxk
KSBmYWlsZWQgdG8gd2FpdCBmb3IgdXNlciBib1xuIiwgcik7Ci0KLQkJCXJhZGVvbl90dG1fcGxh
Y2VtZW50X2Zyb21fZG9tYWluKGJvLCBSQURFT05fR0VNX0RPTUFJTl9DUFUpOwotCQkJciA9IHR0
bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOwotCQkJaWYgKHIp
Ci0JCQkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gdmFsaWRhdGUgdXNlciBib1xuIiwgcik7
Ci0KLQkJCXJhZGVvbl9ib191bnJlc2VydmUoYm8pOwotCQl9CisJciA9IHJhZGVvbl9ib19yZXNl
cnZlKGJvLCB0cnVlKTsKKwlpZiAocikgeworCQlEUk1fRVJST1IoIiglbGQpIGZhaWxlZCB0byBy
ZXNlcnZlIHVzZXIgYm9cbiIsIHIpOworCQlyZXR1cm4gdHJ1ZTsKIAl9Ci0JCi1vdXRfdW5sb2Nr
OgotCW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsKLQotCXJldHVybiByZXQ7Ci19Ci0KLXN0YXRp
YyB2b2lkIHJhZGVvbl9tbl9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKLXsKLQlzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlIHJhbmdlID0gewot
CQkubW0gPSBtbSwKLQkJLnN0YXJ0ID0gMCwKLQkJLmVuZCA9IFVMT05HX01BWCwKLQkJLmZsYWdz
ID0gMCwKLQkJLmV2ZW50ID0gTU1VX05PVElGWV9VTk1BUCwKLQl9OwotCi0JcmFkZW9uX21uX2lu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnQobW4sICZyYW5nZSk7Ci19Ci0KLXN0YXRpYyBzdHJ1Y3QgbW11
X25vdGlmaWVyICpyYWRlb25fbW5fYWxsb2Nfbm90aWZpZXIoc3RydWN0IG1tX3N0cnVjdCAqbW0p
Ci17Ci0Jc3RydWN0IHJhZGVvbl9tbiAqcm1uOwogCi0Jcm1uID0ga3phbGxvYyhzaXplb2YoKnJt
biksIEdGUF9LRVJORUwpOwotCWlmICghcm1uKQotCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsK
KwlyID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShiby0+dGJvLmJhc2UucmVzdiwgdHJ1ZSwg
ZmFsc2UsCisJCQkJICAgICAgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOworCWlmIChyIDw9IDApCisJ
CURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHdhaXQgZm9yIHVzZXIgYm9cbiIsIHIpOwogCi0J
bXV0ZXhfaW5pdCgmcm1uLT5sb2NrKTsKLQlybW4tPm9iamVjdHMgPSBSQl9ST09UX0NBQ0hFRDsK
LQlyZXR1cm4gJnJtbi0+bW47Ci19CisJcmFkZW9uX3R0bV9wbGFjZW1lbnRfZnJvbV9kb21haW4o
Ym8sIFJBREVPTl9HRU1fRE9NQUlOX0NQVSk7CisJciA9IHR0bV9ib192YWxpZGF0ZSgmYm8tPnRi
bywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOworCWlmIChyKQorCQlEUk1fRVJST1IoIiglbGQpIGZh
aWxlZCB0byB2YWxpZGF0ZSB1c2VyIGJvXG4iLCByKTsKIAotc3RhdGljIHZvaWQgcmFkZW9uX21u
X2ZyZWVfbm90aWZpZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4pCi17Ci0Ja2ZyZWUoY29udGFp
bmVyX29mKG1uLCBzdHJ1Y3QgcmFkZW9uX21uLCBtbikpOworCXJhZGVvbl9ib191bnJlc2VydmUo
Ym8pOworCXJldHVybiB0cnVlOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmll
cl9vcHMgcmFkZW9uX21uX29wcyA9IHsKLQkucmVsZWFzZSA9IHJhZGVvbl9tbl9yZWxlYXNlLAot
CS5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0ID0gcmFkZW9uX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnQsCi0JLmFsbG9jX25vdGlmaWVyID0gcmFkZW9uX21uX2FsbG9jX25vdGlmaWVyLAotCS5mcmVl
X25vdGlmaWVyID0gcmFkZW9uX21uX2ZyZWVfbm90aWZpZXIsCitzdGF0aWMgY29uc3Qgc3RydWN0
IG1tdV9yYW5nZV9ub3RpZmllcl9vcHMgcmFkZW9uX21uX29wcyA9IHsKKwkuaW52YWxpZGF0ZSA9
IHJhZGVvbl9tbl9pbnZhbGlkYXRlLAogfTsKIAogLyoqCkBAIC0xNzQsNTEgKzk0LDIxIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyByYWRlb25fbW5fb3BzID0gewogICov
CiBpbnQgcmFkZW9uX21uX3JlZ2lzdGVyKHN0cnVjdCByYWRlb25fYm8gKmJvLCB1bnNpZ25lZCBs
b25nIGFkZHIpCiB7Ci0JdW5zaWduZWQgbG9uZyBlbmQgPSBhZGRyICsgcmFkZW9uX2JvX3NpemUo
Ym8pIC0gMTsKLQlzdHJ1Y3QgbW11X25vdGlmaWVyICptbjsKLQlzdHJ1Y3QgcmFkZW9uX21uICpy
bW47Ci0Jc3RydWN0IHJhZGVvbl9tbl9ub2RlICpub2RlID0gTlVMTDsKLQlzdHJ1Y3QgbGlzdF9o
ZWFkIGJvczsKLQlzdHJ1Y3QgaW50ZXJ2YWxfdHJlZV9ub2RlICppdDsKLQotCW1uID0gbW11X25v
dGlmaWVyX2dldCgmcmFkZW9uX21uX29wcywgY3VycmVudC0+bW0pOwotCWlmIChJU19FUlIobW4p
KQotCQlyZXR1cm4gUFRSX0VSUihtbik7Ci0Jcm1uID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3Qg
cmFkZW9uX21uLCBtbik7Ci0KLQlJTklUX0xJU1RfSEVBRCgmYm9zKTsKLQotCW11dGV4X2xvY2so
JnJtbi0+bG9jayk7Ci0KLQl3aGlsZSAoKGl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0KCZy
bW4tPm9iamVjdHMsIGFkZHIsIGVuZCkpKSB7Ci0JCWtmcmVlKG5vZGUpOwotCQlub2RlID0gY29u
dGFpbmVyX29mKGl0LCBzdHJ1Y3QgcmFkZW9uX21uX25vZGUsIGl0KTsKLQkJaW50ZXJ2YWxfdHJl
ZV9yZW1vdmUoJm5vZGUtPml0LCAmcm1uLT5vYmplY3RzKTsKLQkJYWRkciA9IG1pbihpdC0+c3Rh
cnQsIGFkZHIpOwotCQllbmQgPSBtYXgoaXQtPmxhc3QsIGVuZCk7Ci0JCWxpc3Rfc3BsaWNlKCZu
b2RlLT5ib3MsICZib3MpOwotCX0KLQotCWlmICghbm9kZSkgewotCQlub2RlID0ga21hbGxvYyhz
aXplb2Yoc3RydWN0IHJhZGVvbl9tbl9ub2RlKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghbm9kZSkg
ewotCQkJbXV0ZXhfdW5sb2NrKCZybW4tPmxvY2spOwotCQkJcmV0dXJuIC1FTk9NRU07Ci0JCX0K
LQl9Ci0KLQliby0+bW4gPSBybW47Ci0KLQlub2RlLT5pdC5zdGFydCA9IGFkZHI7Ci0Jbm9kZS0+
aXQubGFzdCA9IGVuZDsKLQlJTklUX0xJU1RfSEVBRCgmbm9kZS0+Ym9zKTsKLQlsaXN0X3NwbGlj
ZSgmYm9zLCAmbm9kZS0+Ym9zKTsKLQlsaXN0X2FkZCgmYm8tPm1uX2xpc3QsICZub2RlLT5ib3Mp
OwotCi0JaW50ZXJ2YWxfdHJlZV9pbnNlcnQoJm5vZGUtPml0LCAmcm1uLT5vYmplY3RzKTsKLQot
CW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsKLQorCWludCByZXQ7CisKKwliby0+bm90aWZpZXIu
b3BzID0gJnJhZGVvbl9tbl9vcHM7CisJcmV0ID0gbW11X3JhbmdlX25vdGlmaWVyX2luc2VydCgm
Ym8tPm5vdGlmaWVyLCBhZGRyLCByYWRlb25fYm9fc2l6ZShibyksCisJCQkJCWN1cnJlbnQtPm1t
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJLyoKKwkgKiBGSVhNRTogcmFkZW9uIGFw
cGVhcnMgdG8gYWxsb3cgZ2V0X3VzZXJfcGFnZXMgdG8gcnVuIGR1cmluZworCSAqIGludmFsaWRh
dGVfcmFuZ2Vfc3RhcnQvZW5kLCB3aGljaCBpcyBub3QgYSBzYWZlIHdheSB0byByZWFkIHRoZQor
CSAqIFBURXMuIEl0IHNob3VsZCB1c2UgdGhlIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkgc2NoZW1l
IGFyb3VuZCB0aGUKKwkgKiBnZXRfdXNlcl9wYWdlcyB0byBlbnN1cmUgdGhhdCB0aGUgUFRFcyBh
cmUgcmVhZCBwcm9wZXJseQorCSAqLworCW1tdV9yYW5nZV9yZWFkX2JlZ2luKCZiby0+bm90aWZp
ZXIpOwogCXJldHVybiAwOwogfQogCkBAIC0yMzEsMjcgKzEyMSw4IEBAIGludCByYWRlb25fbW5f
cmVnaXN0ZXIoc3RydWN0IHJhZGVvbl9ibyAqYm8sIHVuc2lnbmVkIGxvbmcgYWRkcikKICAqLwog
dm9pZCByYWRlb25fbW5fdW5yZWdpc3RlcihzdHJ1Y3QgcmFkZW9uX2JvICpibykKIHsKLQlzdHJ1
Y3QgcmFkZW9uX21uICpybW4gPSBiby0+bW47Ci0Jc3RydWN0IGxpc3RfaGVhZCAqaGVhZDsKLQot
CWlmICghcm1uKQorCWlmICghYm8tPm5vdGlmaWVyLm1tKQogCQlyZXR1cm47Ci0KLQltdXRleF9s
b2NrKCZybW4tPmxvY2spOwotCS8qIHNhdmUgdGhlIG5leHQgbGlzdCBlbnRyeSBmb3IgbGF0ZXIg
Ki8KLQloZWFkID0gYm8tPm1uX2xpc3QubmV4dDsKLQotCWxpc3RfZGVsKCZiby0+bW5fbGlzdCk7
Ci0KLQlpZiAobGlzdF9lbXB0eShoZWFkKSkgewotCQlzdHJ1Y3QgcmFkZW9uX21uX25vZGUgKm5v
ZGU7Ci0JCW5vZGUgPSBjb250YWluZXJfb2YoaGVhZCwgc3RydWN0IHJhZGVvbl9tbl9ub2RlLCBi
b3MpOwotCQlpbnRlcnZhbF90cmVlX3JlbW92ZSgmbm9kZS0+aXQsICZybW4tPm9iamVjdHMpOwot
CQlrZnJlZShub2RlKTsKLQl9Ci0KLQltdXRleF91bmxvY2soJnJtbi0+bG9jayk7Ci0KLQltbXVf
bm90aWZpZXJfcHV0KCZybW4tPm1uKTsKLQliby0+bW4gPSBOVUxMOworCW1tdV9yYW5nZV9ub3Rp
Zmllcl9yZW1vdmUoJmJvLT5ub3RpZmllcik7CisJYm8tPm5vdGlmaWVyLm1tID0gTlVMTDsKIH0K
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
