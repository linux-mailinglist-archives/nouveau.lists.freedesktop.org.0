Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE212B2E8
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9C36E109;
	Fri, 27 Dec 2019 08:14:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1186989DE6
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id u184so9779212qkd.4
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY8VkDw3eNXkN3ve3RU1KQeIU43sa/wg6eleBANnW0s=;
 b=DEr56Hh74X+X72AV3xFwB6L9JnBevGoNetIPQYOP/zd2/Yqv+xW0QpRIlNYHPORLpb
 oQEYkPMf4Lal5RDCcNxJl8AJ7ze8/fRAkBBJODYY12IZB6jSoMY/va88pG9h2W8WqUOR
 37mptL5bDe0UcHD8ZJ6M37AhsomlQ64wZvaR8kLiBLvpO4rdwxODI52hYTY6cYK3kbfn
 KfvRbvYIffFczb6KVSKFN4d3pyp1+Qb0QW1ESq9SRe188VhVqmT3emeOA8NR0UzHL3Et
 zm5fH13BimjlZKpgLBRiIrFmvRL+pQnMJMLkYtEvLA09BG+LXZe63sB5laWjspNVkK68
 BKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY8VkDw3eNXkN3ve3RU1KQeIU43sa/wg6eleBANnW0s=;
 b=oaoPn74vJDlnxQfe5Bk+6yul3m9r/zq+j/YQDBXH5YRaYO8RWln94s505oRuu150KA
 6RCqgbpTfshFDVAV72tGT1dDfb6AXDmbTKm8byyQ5LhkI5STUSr6bMwlLiXckDy1xi0D
 YLADNEq19IdXakmqPcNZq1GKvFLiEQH7BAj8VfXb1FTs/dGoYH7PjtzEokKk+PrFmxcT
 pQtGXVbIrRh/9KbBJphAJ3W2dfPy6Py5YxiBziGtyI8VgYAHO7ypnkTp2q4LnlXTiq9o
 CtYsvq+0PLSQyHEFQHiMgdo2Klh4o1qr7awd8fl6CZyJaNYSQogkZs+8IrHOsDmKqdsk
 OLWQ==
X-Gm-Message-State: APjAAAX6OzlbS3CNoAa7vMpRiYHtW7rY8eaJ3dELK1qlQ1I5JM5TE8oh
 pmq7Ncl0dLN6lgZ0SWLpdPjulw==
X-Google-Smtp-Source: APXvYqwif0aVeBBMbFc9Yj1JzTl7fNWCptP6HcE8ZUm49PZ2JWsZu6LE81XhNg4T5SkIR5YG7CpXEg==
X-Received: by 2002:a05:620a:74b:: with SMTP id
 i11mr17365591qki.397.1572293447074; 
 Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o3sm3980109qkf.97.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gG-5c; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:20 -0300
Message-Id: <20191028201032.6352-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 03/15] mm/hmm: allow hmm_range to be used with
 a mmu_range_notifier or hmm_mirror
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX21pcnJvcidzIGhh
bmRsaW5nIG9mIHJhbmdlcyBkb2VzIG5vdCB1c2UgYSBzZXF1ZW5jZSBjb3VudCB3aGljaApyZXN1
bHRzIGluIHRoaXMgYnVnOgoKICAgICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1BVMQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaG1tX3Jh
bmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsaWQgPT0gdHJ1ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaG1tX3JhbmdlX2ZhdWx0KHJhbmdlKQpobW1faW52YWxpZGF0ZV9yYW5nZV9zdGFydCgp
CiAgIHJhbmdlLT52YWxpZCA9IGZhbHNlCmhtbV9pbnZhbGlkYXRlX3JhbmdlX2VuZCgpCiAgIHJh
bmdlLT52YWxpZCA9IHRydWUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGht
bV9yYW5nZV92YWxpZChyYW5nZSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmFsaWQgPT0gdHJ1ZQoKV2hlcmUgdGhlIGhtbV9yYW5nZV92YWxpZCBzaG91bGQgbm90
IGhhdmUgc3VjY2VlZGVkLgoKQWRkaW5nIHRoZSByZXF1aXJlZCBzZXF1ZW5jZSBjb3VudCB3b3Vs
ZCBtYWtlIGl0IG5lYXJseSBpZGVudGljYWwgdG8gdGhlCm5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIu
IEluc3RlYWQgcmVwbGFjZSB0aGUgaG1tX21pcnJvciBzdHVmZiB3aXRoCm1tdV9yYW5nZV9ub3Rp
Zmllci4KCkNvLWV4aXN0ZW5jZSBvZiB0aGUgdHdvIEFQSXMgaXMgdGhlIGZpcnN0IHN0ZXAuCgpS
ZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRlL2xp
bnV4L2htbS5oIHwgIDUgKysrKysKIG1tL2htbS5jICAgICAgICAgICAgfCAyNSArKysrKysrKysr
KysrKysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGlu
dXgvaG1tLmgKaW5kZXggM2ZlYzUxM2I5YzAwZjEuLjhhYzFmZDZhODFhZjhmIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTE0NSw2
ICsxNDUsOSBAQCBlbnVtIGhtbV9wZm5fdmFsdWVfZSB7CiAvKgogICogc3RydWN0IGhtbV9yYW5n
ZSAtIHRyYWNrIGludmFsaWRhdGlvbiBsb2NrIG9uIHZpcnR1YWwgYWRkcmVzcyByYW5nZQogICoK
KyAqIEBub3RpZmllcjogYW4gb3B0aW9uYWwgbW11X3JhbmdlX25vdGlmaWVyCisgKiBAbm90aWZp
ZXJfc2VxOiB3aGVuIG5vdGlmaWVyIGlzIHVzZWQgdGhpcyBpcyB0aGUgcmVzdWx0IG9mCisgKiAg
ICAgICAgICAgICAgICBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpCiAgKiBAaG1tOiB0aGUgY29yZSBI
TU0gc3RydWN0dXJlIHRoaXMgcmFuZ2UgaXMgYWN0aXZlIGFnYWluc3QKICAqIEB2bWE6IHRoZSB2
bSBhcmVhIHN0cnVjdCBmb3IgdGhlIHJhbmdlCiAgKiBAbGlzdDogYWxsIHJhbmdlIGxvY2sgYXJl
IG9uIGEgbGlzdApAQCAtMTU5LDYgKzE2Miw4IEBAIGVudW0gaG1tX3Bmbl92YWx1ZV9lIHsKICAq
IEB2YWxpZDogcGZucyBhcnJheSBkaWQgbm90IGNoYW5nZSBzaW5jZSBpdCBoYXMgYmVlbiBmaWxs
IGJ5IGFuIEhNTSBmdW5jdGlvbgogICovCiBzdHJ1Y3QgaG1tX3JhbmdlIHsKKwlzdHJ1Y3QgbW11
X3JhbmdlX25vdGlmaWVyICpub3RpZmllcjsKKwl1bnNpZ25lZCBsb25nCQlub3RpZmllcl9zZXE7
CiAJc3RydWN0IGhtbQkJKmhtbTsKIAlzdHJ1Y3QgbGlzdF9oZWFkCWxpc3Q7CiAJdW5zaWduZWQg
bG9uZwkJc3RhcnQ7CmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDkwMmY1
ZmE2YmY5M2FkLi4yMmFjMzU5NTc3MWZlYiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0v
aG1tLmMKQEAgLTg1Miw2ICs4NTIsMTQgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSkKIH0KIEVYUE9SVF9TWU1CT0woaG1tX3JhbmdlX3VucmVnaXN0
ZXIpOwogCitzdGF0aWMgYm9vbCBuZWVkc19yZXRyeShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkK
K3sKKwlpZiAocmFuZ2UtPm5vdGlmaWVyKQorCQlyZXR1cm4gbW11X3JhbmdlX2NoZWNrX3JldHJ5
KHJhbmdlLT5ub3RpZmllciwKKwkJCQkJICAgICByYW5nZS0+bm90aWZpZXJfc2VxKTsKKwlyZXR1
cm4gIXJhbmdlLT52YWxpZDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBtbV93YWxrX29wcyBo
bW1fd2Fsa19vcHMgPSB7CiAJLnB1ZF9lbnRyeQk9IGhtbV92bWFfd2Fsa19wdWQsCiAJLnBtZF9l
bnRyeQk9IGhtbV92bWFfd2Fsa19wbWQsCkBAIC04OTIsMTggKzkwMCwyMyBAQCBsb25nIGhtbV9y
YW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKQog
CWNvbnN0IHVuc2lnbmVkIGxvbmcgZGV2aWNlX3ZtYSA9IFZNX0lPIHwgVk1fUEZOTUFQIHwgVk1f
TUlYRURNQVA7CiAJdW5zaWduZWQgbG9uZyBzdGFydCA9IHJhbmdlLT5zdGFydCwgZW5kOwogCXN0
cnVjdCBobW1fdm1hX3dhbGsgaG1tX3ZtYV93YWxrOwotCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdl
LT5obW07CisJc3RydWN0IG1tX3N0cnVjdCAqbW07CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWE7CiAJaW50IHJldDsKIAotCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmhtbS0+bW11X25vdGlmaWVy
Lm1tLT5tbWFwX3NlbSk7CisJaWYgKHJhbmdlLT5ub3RpZmllcikKKwkJbW0gPSByYW5nZS0+bm90
aWZpZXItPm1tOworCWVsc2UKKwkJbW0gPSByYW5nZS0+aG1tLT5tbXVfbm90aWZpZXIubW07CisK
Kwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZtbS0+bW1hcF9zZW0pOwogCiAJZG8gewogCQkvKiBJZiBy
YW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnkuICovCi0JCWlmICghcmFuZ2UtPnZh
bGlkKQorCQlpZiAobmVlZHNfcmV0cnkocmFuZ2UpKQogCQkJcmV0dXJuIC1FQlVTWTsKIAotCQl2
bWEgPSBmaW5kX3ZtYShobW0tPm1tdV9ub3RpZmllci5tbSwgc3RhcnQpOworCQl2bWEgPSBmaW5k
X3ZtYShtbSwgc3RhcnQpOwogCQlpZiAodm1hID09IE5VTEwgfHwgKHZtYS0+dm1fZmxhZ3MgJiBk
ZXZpY2Vfdm1hKSkKIAkJCXJldHVybiAtRUZBVUxUOwogCkBAIC05MzMsNyArOTQ2LDcgQEAgbG9u
ZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHVuc2lnbmVkIGludCBm
bGFncykKIAkJCXN0YXJ0ID0gaG1tX3ZtYV93YWxrLmxhc3Q7CiAKIAkJCS8qIEtlZXAgdHJ5aW5n
IHdoaWxlIHRoZSByYW5nZSBpcyB2YWxpZC4gKi8KLQkJfSB3aGlsZSAocmV0ID09IC1FQlVTWSAm
JiByYW5nZS0+dmFsaWQpOworCQl9IHdoaWxlIChyZXQgPT0gLUVCVVNZICYmICFuZWVkc19yZXRy
eShyYW5nZSkpOwogCiAJCWlmIChyZXQpIHsKIAkJCXVuc2lnbmVkIGxvbmcgaTsKQEAgLTk5MSw3
ICsxMDA0LDcgQEAgbG9uZyBobW1fcmFuZ2VfZG1hX21hcChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSwgc3RydWN0IGRldmljZSAqZGV2aWNlLAogCQkJY29udGludWU7CiAKIAkJLyogQ2hlY2sgaWYg
cmFuZ2UgaXMgYmVpbmcgaW52YWxpZGF0ZWQgKi8KLQkJaWYgKCFyYW5nZS0+dmFsaWQpIHsKKwkJ
aWYgKG5lZWRzX3JldHJ5KHJhbmdlKSkgewogCQkJcmV0ID0gLUVCVVNZOwogCQkJZ290byB1bm1h
cDsKIAkJfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
