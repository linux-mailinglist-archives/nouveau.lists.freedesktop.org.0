Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68D12B2F3
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9616E15A;
	Fri, 27 Dec 2019 08:14:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCBB6EBC8
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:52 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d13so15696337qko.3
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xw2ai8Vr1f5l5+zlCN78rO+ZKXMukpf6DQd9uHD6kc8=;
 b=gQiQtULXW3UV8Oh9FfwyO3E18ceB+rUPG/7scE/QRLgHK/rJI+SicVvgByu0b7cRv1
 P3EL30/4moeXzNPr0YSFt0etyt/LoUcyiGveq05UEy1cjdvgc8H03dV4KNgaLRWhg9SJ
 sEU3WHn8tRfj0JLd5NgCYAKsnBziH7B9wB+ZfHNMGxItNMaEHHUgE5GfxAZUDedA7tXH
 vqudTxfFOdHTkfg9bLmvjeSIlXNekjsJ7IqVXuwlNT/I6AEE/DXJPB1uX5GUADdT+erJ
 slvQKvXE5+X0O5xSM2b8/r+Fjf5BRR7KuYudjTmdtC+/VPOJiCLgaVwVqd4lHjWSV5YS
 dcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xw2ai8Vr1f5l5+zlCN78rO+ZKXMukpf6DQd9uHD6kc8=;
 b=p7H8pMh2BVGITIHNpeQ8TBrZ60G+/I21RwzR0aOzMW9TnXqbM9c99+ilzh4MQ5dqgQ
 95TlXZwDV2oTHaxCHibPY3NwDVosIf1loWZYs04yH2rxX/Tb6/TtczPZLRBG3A3zFcwM
 NdkXQXJWiTx76Li+UUFjd6dzSDdE5Sncb9gM44org87DFGUDYsbvpWb5biBaSG3lND7b
 55wECLawBExJbrTaby8lnpAOywnkwffLdnMQuecBkgCCRR5/1J/WtPDWmdAK9sQvGSFY
 3hBgz3Wuo8lZ3rBgScEQxxQlzMFTrzPiwMfI530I6356fRLUu0u/5/Bcz6YCLXT+utui
 4dRw==
X-Gm-Message-State: APjAAAXVDhtxBvk3Ukw6jKE6uKBxUkUU+TL18aVR2/Abr5nkkTksBeOl
 Jk+2e6tXD4WAwpAT7vHEZzrT+w==
X-Google-Smtp-Source: APXvYqxgWgKtyMbX/5h2iyVelZCuU14MNQbnuaor7pMdC+cfcmNuVKUEvAj36OMo4uowOJ2sBx30tw==
X-Received: by 2002:a05:620a:999:: with SMTP id
 x25mr767745qkx.189.1573590171692; 
 Tue, 12 Nov 2019 12:22:51 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id p33sm13643740qtf.80.2019.11.12.12.22.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003kA-ET; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:24 -0400
Message-Id: <20191112202231.3856-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: [Nouveau] [PATCH v3 07/14] drm/radeon: use
 mmu_interval_notifier_insert
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
YWwgdHJlZSwgYnV0IGludGVydmFsIHRyZWVzIChhbmQgbW11X2ludGVydmFsX25vdGlmaWVyX2lu
c2VydCgpKQpzdXBwb3J0IG92ZXJsYXBwaW5nIHJhbmdlcyBkaXJlY3RseS4gU2ltcGx5IGRlbGV0
ZSBhbGwgdGhpcyBjb2RlLgoKU2luY2UgdGhpcyBkcml2ZXIgaXMgbWlzc2luZyBhIGludmFsaWRh
dGVfcmFuZ2VfZW5kIGNhbGxiYWNrLCBidXQKc3RpbGwgY2FsbHMgZ2V0X3VzZXJfcGFnZXMoKSwg
aXQgY2Fubm90IGJlIGNvcnJlY3QgYWdhaW5zdCBhbGwgcmFjZXMuCgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb24uaCAgICB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
bW4uYyB8IDIxOCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCA1MSBpbnNlcnRpb25zKCspLCAxNzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
LmgKaW5kZXggZDU5YjAwNGY2Njk1ODMuLjMwZTMyYWRjMWZjNjY2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uLmgKQEAgLTY4LDYgKzY4LDEwIEBACiAjaW5jbHVkZSA8bGludXgvaGFzaHRhYmxlLmg+
CiAjaW5jbHVkZSA8bGludXgvZG1hLWZlbmNlLmg+CiAKKyNpZmRlZiBDT05GSUdfTU1VX05PVElG
SUVSCisjaW5jbHVkZSA8bGludXgvbW11X25vdGlmaWVyLmg+CisjZW5kaWYKKwogI2luY2x1ZGUg
PGRybS90dG0vdHRtX2JvX2FwaS5oPgogI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZlci5o
PgogI2luY2x1ZGUgPGRybS90dG0vdHRtX3BsYWNlbWVudC5oPgpAQCAtNTA5LDggKzUxMyw5IEBA
IHN0cnVjdCByYWRlb25fYm8gewogCXN0cnVjdCB0dG1fYm9fa21hcF9vYmoJCWRtYV9idWZfdm1h
cDsKIAlwaWRfdAkJCQlwaWQ7CiAKLQlzdHJ1Y3QgcmFkZW9uX21uCQkqbW47Ci0Jc3RydWN0IGxp
c3RfaGVhZAkJbW5fbGlzdDsKKyNpZmRlZiBDT05GSUdfTU1VX05PVElGSUVSCisJc3RydWN0IG1t
dV9pbnRlcnZhbF9ub3RpZmllcglub3RpZmllcjsKKyNlbmRpZgogfTsKICNkZWZpbmUgZ2VtX3Rv
X3JhZGVvbl9ibyhnb2JqKSBjb250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgcmFkZW9uX2JvLCB0
Ym8uYmFzZSkKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKaW5kZXggZGJhYjlhM2E5Njli
OWUuLmY5MzgyOWYwOGE0ZGMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9tbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKQEAgLTM2
LDEzMSArMzYsNTEgQEAKIAogI2luY2x1ZGUgInJhZGVvbi5oIgogCi1zdHJ1Y3QgcmFkZW9uX21u
IHsKLQlzdHJ1Y3QgbW11X25vdGlmaWVyCW1uOwotCi0JLyogb2JqZWN0cyBwcm90ZWN0ZWQgYnkg
bG9jayAqLwotCXN0cnVjdCBtdXRleAkJbG9jazsKLQlzdHJ1Y3QgcmJfcm9vdF9jYWNoZWQJb2Jq
ZWN0czsKLX07Ci0KLXN0cnVjdCByYWRlb25fbW5fbm9kZSB7Ci0Jc3RydWN0IGludGVydmFsX3Ry
ZWVfbm9kZQlpdDsKLQlzdHJ1Y3QgbGlzdF9oZWFkCQlib3M7Ci19OwotCiAvKioKLSAqIHJhZGVv
bl9tbl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IC0gY2FsbGJhY2sgdG8gbm90aWZ5IGFib3V0IG1t
IGNoYW5nZQorICogcmFkZW9uX21uX2ludmFsaWRhdGUgLSBjYWxsYmFjayB0byBub3RpZnkgYWJv
dXQgbW0gY2hhbmdlCiAgKgogICogQG1uOiBvdXIgbm90aWZpZXIKLSAqIEBtbjogdGhlIG1tIHRo
aXMgY2FsbGJhY2sgaXMgYWJvdXQKLSAqIEBzdGFydDogc3RhcnQgb2YgdXBkYXRlZCByYW5nZQot
ICogQGVuZDogZW5kIG9mIHVwZGF0ZWQgcmFuZ2UKKyAqIEByYW5nZTogdGhlIFZNQSB1bmRlciBp
bnZhbGlkYXRpb24KICAqCiAgKiBXZSBibG9jayBmb3IgYWxsIEJPcyBiZXR3ZWVuIHN0YXJ0IGFu
ZCBlbmQgdG8gYmUgaWRsZSBhbmQKICAqIHVubWFwIHRoZW0gYnkgbW92ZSB0aGVtIGludG8gc3lz
dGVtIGRvbWFpbiBhZ2Fpbi4KICAqLwotc3RhdGljIGludCByYWRlb25fbW5faW52YWxpZGF0ZV9y
YW5nZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKLQkJCQljb25zdCBzdHJ1Y3QgbW11
X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKK3N0YXRpYyBib29sIHJhZGVvbl9tbl9pbnZhbGlkYXRl
KHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgKm1uLAorCQkJCSBjb25zdCBzdHJ1Y3QgbW11
X25vdGlmaWVyX3JhbmdlICpyYW5nZSwKKwkJCQkgdW5zaWduZWQgbG9uZyBjdXJfc2VxKQogewot
CXN0cnVjdCByYWRlb25fbW4gKnJtbiA9IGNvbnRhaW5lcl9vZihtbiwgc3RydWN0IHJhZGVvbl9t
biwgbW4pOworCXN0cnVjdCByYWRlb25fYm8gKmJvID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3Qg
cmFkZW9uX2JvLCBub3RpZmllcik7CiAJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsg
ZmFsc2UsIGZhbHNlIH07Ci0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZSAqaXQ7Ci0JdW5zaWdu
ZWQgbG9uZyBlbmQ7Ci0JaW50IHJldCA9IDA7Ci0KLQkvKiBub3RpZmljYXRpb24gaXMgZXhjbHVz
aXZlLCBidXQgaW50ZXJ2YWwgaXMgaW5jbHVzaXZlICovCi0JZW5kID0gcmFuZ2UtPmVuZCAtIDE7
Ci0KLQkvKiBUT0RPIHdlIHNob3VsZCBiZSBhYmxlIHRvIHNwbGl0IGxvY2tpbmcgZm9yIGludGVy
dmFsIHRyZWUgYW5kCi0JICogdGhlIHRlYXIgZG93bi4KLQkgKi8KLQlpZiAobW11X25vdGlmaWVy
X3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCi0JCW11dGV4X2xvY2soJnJtbi0+bG9jayk7Ci0JZWxz
ZSBpZiAoIW11dGV4X3RyeWxvY2soJnJtbi0+bG9jaykpCi0JCXJldHVybiAtRUFHQUlOOwotCi0J
aXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfZmlyc3QoJnJtbi0+b2JqZWN0cywgcmFuZ2UtPnN0YXJ0
LCBlbmQpOwotCXdoaWxlIChpdCkgewotCQlzdHJ1Y3QgcmFkZW9uX21uX25vZGUgKm5vZGU7Ci0J
CXN0cnVjdCByYWRlb25fYm8gKmJvOwotCQlsb25nIHI7Ci0KLQkJaWYgKCFtbXVfbm90aWZpZXJf
cmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkgewotCQkJcmV0ID0gLUVBR0FJTjsKLQkJCWdvdG8gb3V0
X3VubG9jazsKLQkJfQotCi0JCW5vZGUgPSBjb250YWluZXJfb2YoaXQsIHN0cnVjdCByYWRlb25f
bW5fbm9kZSwgaXQpOwotCQlpdCA9IGludGVydmFsX3RyZWVfaXRlcl9uZXh0KGl0LCByYW5nZS0+
c3RhcnQsIGVuZCk7CisJbG9uZyByOwogCi0JCWxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZub2Rl
LT5ib3MsIG1uX2xpc3QpIHsKKwlpZiAoIWJvLT50Ym8udHRtIHx8IGJvLT50Ym8udHRtLT5zdGF0
ZSAhPSB0dF9ib3VuZCkKKwkJcmV0dXJuIHRydWU7CiAKLQkJCWlmICghYm8tPnRiby50dG0gfHwg
Ym8tPnRiby50dG0tPnN0YXRlICE9IHR0X2JvdW5kKQotCQkJCWNvbnRpbnVlOworCWlmICghbW11
X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCisJCXJldHVybiBmYWxzZTsKIAotCQkJ
ciA9IHJhZGVvbl9ib19yZXNlcnZlKGJvLCB0cnVlKTsKLQkJCWlmIChyKSB7Ci0JCQkJRFJNX0VS
Uk9SKCIoJWxkKSBmYWlsZWQgdG8gcmVzZXJ2ZSB1c2VyIGJvXG4iLCByKTsKLQkJCQljb250aW51
ZTsKLQkJCX0KLQotCQkJciA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoYm8tPnRiby5iYXNl
LnJlc3YsCi0JCQkJdHJ1ZSwgZmFsc2UsIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsKLQkJCWlmIChy
IDw9IDApCi0JCQkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gd2FpdCBmb3IgdXNlciBib1xu
Iiwgcik7Ci0KLQkJCXJhZGVvbl90dG1fcGxhY2VtZW50X2Zyb21fZG9tYWluKGJvLCBSQURFT05f
R0VNX0RPTUFJTl9DUFUpOwotCQkJciA9IHR0bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5w
bGFjZW1lbnQsICZjdHgpOwotCQkJaWYgKHIpCi0JCQkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQg
dG8gdmFsaWRhdGUgdXNlciBib1xuIiwgcik7Ci0KLQkJCXJhZGVvbl9ib191bnJlc2VydmUoYm8p
OwotCQl9CisJciA9IHJhZGVvbl9ib19yZXNlcnZlKGJvLCB0cnVlKTsKKwlpZiAocikgeworCQlE
Uk1fRVJST1IoIiglbGQpIGZhaWxlZCB0byByZXNlcnZlIHVzZXIgYm9cbiIsIHIpOworCQlyZXR1
cm4gdHJ1ZTsKIAl9Ci0JCi1vdXRfdW5sb2NrOgotCW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsK
LQotCXJldHVybiByZXQ7Ci19Ci0KLXN0YXRpYyB2b2lkIHJhZGVvbl9tbl9yZWxlYXNlKHN0cnVj
dCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKLXsKLQlzdHJ1Y3QgbW11
X25vdGlmaWVyX3JhbmdlIHJhbmdlID0gewotCQkubW0gPSBtbSwKLQkJLnN0YXJ0ID0gMCwKLQkJ
LmVuZCA9IFVMT05HX01BWCwKLQkJLmZsYWdzID0gMCwKLQkJLmV2ZW50ID0gTU1VX05PVElGWV9V
Tk1BUCwKLQl9OwotCi0JcmFkZW9uX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQobW4sICZyYW5n
ZSk7Ci19Ci0KLXN0YXRpYyBzdHJ1Y3QgbW11X25vdGlmaWVyICpyYWRlb25fbW5fYWxsb2Nfbm90
aWZpZXIoc3RydWN0IG1tX3N0cnVjdCAqbW0pCi17Ci0Jc3RydWN0IHJhZGVvbl9tbiAqcm1uOwog
Ci0Jcm1uID0ga3phbGxvYyhzaXplb2YoKnJtbiksIEdGUF9LRVJORUwpOwotCWlmICghcm1uKQot
CQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKKwlyID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3Jj
dShiby0+dGJvLmJhc2UucmVzdiwgdHJ1ZSwgZmFsc2UsCisJCQkJICAgICAgTUFYX1NDSEVEVUxF
X1RJTUVPVVQpOworCWlmIChyIDw9IDApCisJCURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHdh
aXQgZm9yIHVzZXIgYm9cbiIsIHIpOwogCi0JbXV0ZXhfaW5pdCgmcm1uLT5sb2NrKTsKLQlybW4t
Pm9iamVjdHMgPSBSQl9ST09UX0NBQ0hFRDsKLQlyZXR1cm4gJnJtbi0+bW47Ci19CisJcmFkZW9u
X3R0bV9wbGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIFJBREVPTl9HRU1fRE9NQUlOX0NQVSk7CisJ
ciA9IHR0bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOworCWlm
IChyKQorCQlEUk1fRVJST1IoIiglbGQpIGZhaWxlZCB0byB2YWxpZGF0ZSB1c2VyIGJvXG4iLCBy
KTsKIAotc3RhdGljIHZvaWQgcmFkZW9uX21uX2ZyZWVfbm90aWZpZXIoc3RydWN0IG1tdV9ub3Rp
ZmllciAqbW4pCi17Ci0Ja2ZyZWUoY29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgcmFkZW9uX21uLCBt
bikpOworCXJhZGVvbl9ib191bnJlc2VydmUoYm8pOworCXJldHVybiB0cnVlOwogfQogCi1zdGF0
aWMgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9vcHMgcmFkZW9uX21uX29wcyA9IHsKLQkucmVs
ZWFzZSA9IHJhZGVvbl9tbl9yZWxlYXNlLAotCS5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0ID0gcmFk
ZW9uX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQsCi0JLmFsbG9jX25vdGlmaWVyID0gcmFkZW9u
X21uX2FsbG9jX25vdGlmaWVyLAotCS5mcmVlX25vdGlmaWVyID0gcmFkZW9uX21uX2ZyZWVfbm90
aWZpZXIsCitzdGF0aWMgY29uc3Qgc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgcmFk
ZW9uX21uX29wcyA9IHsKKwkuaW52YWxpZGF0ZSA9IHJhZGVvbl9tbl9pbnZhbGlkYXRlLAogfTsK
IAogLyoqCkBAIC0xNzQsNTEgKzk0LDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlm
aWVyX29wcyByYWRlb25fbW5fb3BzID0gewogICovCiBpbnQgcmFkZW9uX21uX3JlZ2lzdGVyKHN0
cnVjdCByYWRlb25fYm8gKmJvLCB1bnNpZ25lZCBsb25nIGFkZHIpCiB7Ci0JdW5zaWduZWQgbG9u
ZyBlbmQgPSBhZGRyICsgcmFkZW9uX2JvX3NpemUoYm8pIC0gMTsKLQlzdHJ1Y3QgbW11X25vdGlm
aWVyICptbjsKLQlzdHJ1Y3QgcmFkZW9uX21uICpybW47Ci0Jc3RydWN0IHJhZGVvbl9tbl9ub2Rl
ICpub2RlID0gTlVMTDsKLQlzdHJ1Y3QgbGlzdF9oZWFkIGJvczsKLQlzdHJ1Y3QgaW50ZXJ2YWxf
dHJlZV9ub2RlICppdDsKLQotCW1uID0gbW11X25vdGlmaWVyX2dldCgmcmFkZW9uX21uX29wcywg
Y3VycmVudC0+bW0pOwotCWlmIChJU19FUlIobW4pKQotCQlyZXR1cm4gUFRSX0VSUihtbik7Ci0J
cm1uID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgcmFkZW9uX21uLCBtbik7Ci0KLQlJTklUX0xJ
U1RfSEVBRCgmYm9zKTsKLQotCW11dGV4X2xvY2soJnJtbi0+bG9jayk7Ci0KLQl3aGlsZSAoKGl0
ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0KCZybW4tPm9iamVjdHMsIGFkZHIsIGVuZCkpKSB7
Ci0JCWtmcmVlKG5vZGUpOwotCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgcmFkZW9u
X21uX25vZGUsIGl0KTsKLQkJaW50ZXJ2YWxfdHJlZV9yZW1vdmUoJm5vZGUtPml0LCAmcm1uLT5v
YmplY3RzKTsKLQkJYWRkciA9IG1pbihpdC0+c3RhcnQsIGFkZHIpOwotCQllbmQgPSBtYXgoaXQt
Pmxhc3QsIGVuZCk7Ci0JCWxpc3Rfc3BsaWNlKCZub2RlLT5ib3MsICZib3MpOwotCX0KLQotCWlm
ICghbm9kZSkgewotCQlub2RlID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHJhZGVvbl9tbl9ub2Rl
KSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghbm9kZSkgewotCQkJbXV0ZXhfdW5sb2NrKCZybW4tPmxv
Y2spOwotCQkJcmV0dXJuIC1FTk9NRU07Ci0JCX0KLQl9Ci0KLQliby0+bW4gPSBybW47Ci0KLQlu
b2RlLT5pdC5zdGFydCA9IGFkZHI7Ci0Jbm9kZS0+aXQubGFzdCA9IGVuZDsKLQlJTklUX0xJU1Rf
SEVBRCgmbm9kZS0+Ym9zKTsKLQlsaXN0X3NwbGljZSgmYm9zLCAmbm9kZS0+Ym9zKTsKLQlsaXN0
X2FkZCgmYm8tPm1uX2xpc3QsICZub2RlLT5ib3MpOwotCi0JaW50ZXJ2YWxfdHJlZV9pbnNlcnQo
Jm5vZGUtPml0LCAmcm1uLT5vYmplY3RzKTsKLQotCW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsK
LQorCWludCByZXQ7CisKKwlyZXQgPSBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0KCZiby0+
bm90aWZpZXIsIGN1cnJlbnQtPm1tLCBhZGRyLAorCQkJCQkgICByYWRlb25fYm9fc2l6ZShibyks
ICZyYWRlb25fbW5fb3BzKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJLyoKKwkgKiBG
SVhNRTogcmFkZW9uIGFwcGVhcnMgdG8gYWxsb3cgZ2V0X3VzZXJfcGFnZXMgdG8gcnVuIGR1cmlu
ZworCSAqIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kLCB3aGljaCBpcyBub3QgYSBzYWZlIHdh
eSB0byByZWFkIHRoZQorCSAqIFBURXMuIEl0IHNob3VsZCB1c2UgdGhlIG1tdV9pbnRlcnZhbF9y
ZWFkX2JlZ2luKCkgc2NoZW1lIGFyb3VuZCB0aGUKKwkgKiBnZXRfdXNlcl9wYWdlcyB0byBlbnN1
cmUgdGhhdCB0aGUgUFRFcyBhcmUgcmVhZCBwcm9wZXJseQorCSAqLworCW1tdV9pbnRlcnZhbF9y
ZWFkX2JlZ2luKCZiby0+bm90aWZpZXIpOwogCXJldHVybiAwOwogfQogCkBAIC0yMzEsMjcgKzEy
MCw4IEBAIGludCByYWRlb25fbW5fcmVnaXN0ZXIoc3RydWN0IHJhZGVvbl9ibyAqYm8sIHVuc2ln
bmVkIGxvbmcgYWRkcikKICAqLwogdm9pZCByYWRlb25fbW5fdW5yZWdpc3RlcihzdHJ1Y3QgcmFk
ZW9uX2JvICpibykKIHsKLQlzdHJ1Y3QgcmFkZW9uX21uICpybW4gPSBiby0+bW47Ci0Jc3RydWN0
IGxpc3RfaGVhZCAqaGVhZDsKLQotCWlmICghcm1uKQorCWlmICghYm8tPm5vdGlmaWVyLm1tKQog
CQlyZXR1cm47Ci0KLQltdXRleF9sb2NrKCZybW4tPmxvY2spOwotCS8qIHNhdmUgdGhlIG5leHQg
bGlzdCBlbnRyeSBmb3IgbGF0ZXIgKi8KLQloZWFkID0gYm8tPm1uX2xpc3QubmV4dDsKLQotCWxp
c3RfZGVsKCZiby0+bW5fbGlzdCk7Ci0KLQlpZiAobGlzdF9lbXB0eShoZWFkKSkgewotCQlzdHJ1
Y3QgcmFkZW9uX21uX25vZGUgKm5vZGU7Ci0JCW5vZGUgPSBjb250YWluZXJfb2YoaGVhZCwgc3Ry
dWN0IHJhZGVvbl9tbl9ub2RlLCBib3MpOwotCQlpbnRlcnZhbF90cmVlX3JlbW92ZSgmbm9kZS0+
aXQsICZybW4tPm9iamVjdHMpOwotCQlrZnJlZShub2RlKTsKLQl9Ci0KLQltdXRleF91bmxvY2so
JnJtbi0+bG9jayk7Ci0KLQltbXVfbm90aWZpZXJfcHV0KCZybW4tPm1uKTsKLQliby0+bW4gPSBO
VUxMOworCW1tdV9pbnRlcnZhbF9ub3RpZmllcl9yZW1vdmUoJmJvLT5ub3RpZmllcik7CisJYm8t
Pm5vdGlmaWVyLm1tID0gTlVMTDsKIH0KLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
