Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDDB12B2D5
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70276E12C;
	Fri, 27 Dec 2019 08:14:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482D6E432
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:50 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m4so15672745qke.9
 for <nouveau@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RW58zr8YTNVHuTBfIVxZyU6EJd/oHLVvWKcypECtMjs=;
 b=mSX+wJ+8VUX1382IHhLVx6fBdAWs6gXvU0I32j+wK2yrM6ZkKGtovH1/NPjehZ8ovE
 1T0Z0w4CHSgxOjOWg78rUMLlihvA2VQuqm44HX3C/1ZLAMQjsARlaHNBCW9gz6N48wKJ
 y9PM2onSIWQgFDrhE8sOQPU0nJxnAlm4dGvf735qGtY5kABa7ifc2bFJa2gjCHgJHDWB
 H9uN853ltamgQii1TxpifGWrSt8UcwbEHZ/zxACuyEsslH7wGCXdsqUB6pj/D0T30D1q
 5KfZ1V6veRSoxZqHsr/Z2Op+C435uIf2bvVnVSct0GKZjzoJD+J9DajjzRnO10FRijpY
 fRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RW58zr8YTNVHuTBfIVxZyU6EJd/oHLVvWKcypECtMjs=;
 b=kADRKxwLjVJxHosbYE7WlZieJcSsCyzqQJ+tgx7+6N7wflVJtGRI1eQuyjdDcx65sT
 AQ9xi67yYHJDumbAVQ5f2EX8IgX1VIKzyel+ONd3I/yHMThYbb9P3BXi3OoG+SNTUms9
 Kle9Mlb5TcHdpzZiiY53roTZCyOYRbeCilEtVusEbT/+Kg+mpcLSEllJQeoyqH/pZxGS
 7j/082tc68DkdSLVw9tSsAbPX/xJnQN2mGfviT37nha/9yhT2lgd+mpECs9loKlvsTt5
 c07o4VoAgvRL6gkZFpbumk7jHu+5APHdqOe8Kv2IAjW7cQc6q4YQ+03TFuU2Rayl4Pdc
 I5eg==
X-Gm-Message-State: APjAAAWjKIhamk+F3uYVypvgTpd8qq3Y+6jhNahYWjMdAKcIhECyU86u
 eHGkPli3vhgN7VWIgI7DWFpibQ==
X-Google-Smtp-Source: APXvYqwQcC+LL9E9LKfiZNHrcVJ95fvA4RxWhxexVl340jx3LOfHzjk66AKsaYtFFr6K39s9sLHHzA==
X-Received: by 2002:a05:620a:110f:: with SMTP id
 o15mr14029771qkk.127.1573590169690; 
 Tue, 12 Nov 2019 12:22:49 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id p33sm13643736qtf.80.2019.11.12.12.22.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003jm-8M; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Tue, 12 Nov 2019 16:22:20 -0400
Message-Id: <20191112202231.3856-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v3 03/14] mm/hmm: allow hmm_range to be used with
 a mmu_interval_notifier or hmm_mirror
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
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
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
ICAgICAgdmFsaWQgPT0gdHJ1ZQoKV2hlcmUgdGhlIGhtbV9yYW5nZV92YWxpZCgpIHNob3VsZCBu
b3QgaGF2ZSBzdWNjZWVkZWQuCgpBZGRpbmcgdGhlIHJlcXVpcmVkIHNlcXVlbmNlIGNvdW50IHdv
dWxkIG1ha2UgaXQgbmVhcmx5IGlkZW50aWNhbCB0byB0aGUKbmV3IG1tdV9pbnRlcnZhbF9ub3Rp
Zmllci4gSW5zdGVhZCByZXBsYWNlIHRoZSBobW1fbWlycm9yIHN0dWZmIHdpdGgKbW11X2ludGVy
dmFsX25vdGlmaWVyLgoKQ28tZXhpc3RlbmNlIG9mIHRoZSB0d28gQVBJcyBpcyB0aGUgZmlyc3Qg
c3RlcC4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
VGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KVGVzdGVkLWJ5OiBS
YWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwg
IDUgKysrKysKIG1tL2htbS5jICAgICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5k
ZXggM2ZlYzUxM2I5YzAwZjEuLmZiYjM1Yzc4NjM3ZTU3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTE0NSw2ICsxNDUsOSBAQCBl
bnVtIGhtbV9wZm5fdmFsdWVfZSB7CiAvKgogICogc3RydWN0IGhtbV9yYW5nZSAtIHRyYWNrIGlu
dmFsaWRhdGlvbiBsb2NrIG9uIHZpcnR1YWwgYWRkcmVzcyByYW5nZQogICoKKyAqIEBub3RpZmll
cjogYW4gb3B0aW9uYWwgbW11X2ludGVydmFsX25vdGlmaWVyCisgKiBAbm90aWZpZXJfc2VxOiB3
aGVuIG5vdGlmaWVyIGlzIHVzZWQgdGhpcyBpcyB0aGUgcmVzdWx0IG9mCisgKiAgICAgICAgICAg
ICAgICBtbXVfaW50ZXJ2YWxfcmVhZF9iZWdpbigpCiAgKiBAaG1tOiB0aGUgY29yZSBITU0gc3Ry
dWN0dXJlIHRoaXMgcmFuZ2UgaXMgYWN0aXZlIGFnYWluc3QKICAqIEB2bWE6IHRoZSB2bSBhcmVh
IHN0cnVjdCBmb3IgdGhlIHJhbmdlCiAgKiBAbGlzdDogYWxsIHJhbmdlIGxvY2sgYXJlIG9uIGEg
bGlzdApAQCAtMTU5LDYgKzE2Miw4IEBAIGVudW0gaG1tX3Bmbl92YWx1ZV9lIHsKICAqIEB2YWxp
ZDogcGZucyBhcnJheSBkaWQgbm90IGNoYW5nZSBzaW5jZSBpdCBoYXMgYmVlbiBmaWxsIGJ5IGFu
IEhNTSBmdW5jdGlvbgogICovCiBzdHJ1Y3QgaG1tX3JhbmdlIHsKKwlzdHJ1Y3QgbW11X2ludGVy
dmFsX25vdGlmaWVyICpub3RpZmllcjsKKwl1bnNpZ25lZCBsb25nCQlub3RpZmllcl9zZXE7CiAJ
c3RydWN0IGhtbQkJKmhtbTsKIAlzdHJ1Y3QgbGlzdF9oZWFkCWxpc3Q7CiAJdW5zaWduZWQgbG9u
ZwkJc3RhcnQ7CmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDZiMDEzNjY2
NTQwN2EzLi44ZDA2MGM1ZGFiZTM3YiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1t
LmMKQEAgLTg1OCw2ICs4NTgsMTQgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3Qg
aG1tX3JhbmdlICpyYW5nZSkKIH0KIEVYUE9SVF9TWU1CT0woaG1tX3JhbmdlX3VucmVnaXN0ZXIp
OwogCitzdGF0aWMgYm9vbCBuZWVkc19yZXRyeShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKK3sK
KwlpZiAocmFuZ2UtPm5vdGlmaWVyKQorCQlyZXR1cm4gbW11X2ludGVydmFsX2NoZWNrX3JldHJ5
KHJhbmdlLT5ub3RpZmllciwKKwkJCQkJCXJhbmdlLT5ub3RpZmllcl9zZXEpOworCXJldHVybiAh
cmFuZ2UtPnZhbGlkOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1tX3dhbGtfb3BzIGhtbV93
YWxrX29wcyA9IHsKIAkucHVkX2VudHJ5CT0gaG1tX3ZtYV93YWxrX3B1ZCwKIAkucG1kX2VudHJ5
CT0gaG1tX3ZtYV93YWxrX3BtZCwKQEAgLTg5OCwxOCArOTA2LDIzIEBAIGxvbmcgaG1tX3Jhbmdl
X2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJY29u
c3QgdW5zaWduZWQgbG9uZyBkZXZpY2Vfdm1hID0gVk1fSU8gfCBWTV9QRk5NQVAgfCBWTV9NSVhF
RE1BUDsKIAl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gcmFuZ2UtPnN0YXJ0LCBlbmQ7CiAJc3RydWN0
IGhtbV92bWFfd2FsayBobW1fdm1hX3dhbGs7Ci0Jc3RydWN0IGhtbSAqaG1tID0gcmFuZ2UtPmht
bTsKKwlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsK
IAlpbnQgcmV0OwogCi0JbG9ja2RlcF9hc3NlcnRfaGVsZCgmaG1tLT5tbXVfbm90aWZpZXIubW0t
Pm1tYXBfc2VtKTsKKwlpZiAocmFuZ2UtPm5vdGlmaWVyKQorCQltbSA9IHJhbmdlLT5ub3RpZmll
ci0+bW07CisJZWxzZQorCQltbSA9IHJhbmdlLT5obW0tPm1tdV9ub3RpZmllci5tbTsKKworCWxv
Y2tkZXBfYXNzZXJ0X2hlbGQoJm1tLT5tbWFwX3NlbSk7CiAKIAlkbyB7CiAJCS8qIElmIHJhbmdl
IGlzIG5vIGxvbmdlciB2YWxpZCBmb3JjZSByZXRyeS4gKi8KLQkJaWYgKCFyYW5nZS0+dmFsaWQp
CisJCWlmIChuZWVkc19yZXRyeShyYW5nZSkpCiAJCQlyZXR1cm4gLUVCVVNZOwogCi0JCXZtYSA9
IGZpbmRfdm1hKGhtbS0+bW11X25vdGlmaWVyLm1tLCBzdGFydCk7CisJCXZtYSA9IGZpbmRfdm1h
KG1tLCBzdGFydCk7CiAJCWlmICh2bWEgPT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmlj
ZV92bWEpKQogCQkJcmV0dXJuIC1FRkFVTFQ7CiAKQEAgLTkzOSw3ICs5NTIsNyBAQCBsb25nIGht
bV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdz
KQogCQkJc3RhcnQgPSBobW1fdm1hX3dhbGsubGFzdDsKIAogCQkJLyogS2VlcCB0cnlpbmcgd2hp
bGUgdGhlIHJhbmdlIGlzIHZhbGlkLiAqLwotCQl9IHdoaWxlIChyZXQgPT0gLUVCVVNZICYmIHJh
bmdlLT52YWxpZCk7CisJCX0gd2hpbGUgKHJldCA9PSAtRUJVU1kgJiYgIW5lZWRzX3JldHJ5KHJh
bmdlKSk7CiAKIAkJaWYgKHJldCkgewogCQkJdW5zaWduZWQgbG9uZyBpOwpAQCAtOTk3LDcgKzEw
MTAsNyBAQCBsb25nIGhtbV9yYW5nZV9kbWFfbWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBz
dHJ1Y3QgZGV2aWNlICpkZXZpY2UsCiAJCQljb250aW51ZTsKIAogCQkvKiBDaGVjayBpZiByYW5n
ZSBpcyBiZWluZyBpbnZhbGlkYXRlZCAqLwotCQlpZiAoIXJhbmdlLT52YWxpZCkgeworCQlpZiAo
bmVlZHNfcmV0cnkocmFuZ2UpKSB7CiAJCQlyZXQgPSAtRUJVU1k7CiAJCQlnb3RvIHVubWFwOwog
CQl9Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
