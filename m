Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50AB079B
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 06:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE5D6EB8E;
	Thu, 12 Sep 2019 04:12:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE63A6E0E2;
 Wed, 11 Sep 2019 22:28:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d7975230000>; Wed, 11 Sep 2019 15:28:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Sep 2019 15:28:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Sep 2019 15:28:49 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Sep
 2019 22:28:46 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Sep 2019 22:28:46 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d79751e0002>; Wed, 11 Sep 2019 15:28:46 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Date: Wed, 11 Sep 2019 15:28:28 -0700
Message-ID: <20190911222829.28874-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190911222829.28874-1-rcampbell@nvidia.com>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1568240931; bh=F20+CtE96DKxf8E9hC0a2S8wRPS9i4pdaXNv/ANnE1k=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=EHV8pR7Vx2o54VOBe9IiUlPWtdqX1Bc/1/UKUEx3gpEMFs7hfOIwd/89RCnmdNqV/
 JxxnSfJKv+Lv+A9hv5TtPCiEQ7UeRyHgPP165+7aebwpPZ/iuE5m1lagJtleznsAgb
 RHcAoxNlxawV83OHZC8z8vwpSD7eV3fSD9HWbJry61FPhtIbRFOvFpre4bIrcVubvC
 GxD2YwE9TkX0WYagYzw0Ma0JO1W415YxmhSJPW4Tmhkep2I5j2pnJF1VDhbJCdi4RH
 Y6nNbO/Sh8DurJ3DJPCtvHqf0hRlvIlYyO3ePZLlK2KWMZB9DFAUWRK0HXg3ozACcV
 KiOoYgiwY9dHQ==
Subject: [Nouveau] [PATCH 3/4] mm/hmm: allow hmm_range_fault() of
 mmap(PROT_NONE)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWxsb3cgaG1tX3JhbmdlX2ZhdWx0KCkgdG8gcmV0dXJuIHN1Y2Nlc3MgKDApIHdoZW4gdGhlIHJh
bmdlIGhhcyBubyBhY2Nlc3MKKCEodm1hLT52bV9mbGFncyAmIFZNX1JFQUQpKS4gVGhlIHJhbmdl
LT5wZm5zW10gYXJyYXkgd2lsbCBiZSBmaWxsZWQgd2l0aApyYW5nZS0+dmFsdWVzW0hNTV9QRk5f
Tk9ORV0gaW4gdGhpcyBjYXNlLgpUaGlzIGFsbG93cyB0aGUgY2FsbGVyIHRvIGdldCBhIHNuYXBz
aG90IG9mIGEgcmFuZ2Ugd2l0aG91dCBoYXZpbmcgdG8KbG9va3VwIHRoZSB2bWEgYmVmb3JlIGNh
bGxpbmcgaG1tX3JhbmdlX2ZhdWx0KCkuCklmIHRoZSBjYWxsIHRvIGhtbV9yYW5nZV9mYXVsdCgp
IGlzIG5vdCBhIHNuYXBzaG90LCB0aGUgY2FsbGVyIGNhbiBzdGlsbApjaGVjayB0aGF0IHBmbnMg
aGF2ZSB0aGUgZGVzaXJlZCBhY2Nlc3MgcGVybWlzc2lvbnMuCgpTaWduZWQtb2ZmLWJ5OiBSYWxw
aCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8
amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29t
PgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogbW0vaG1tLmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDcyMTc5MTJiZWYxMy4uMTZjODM0ZTVk
MWMwIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtNzk1LDcgKzc5NSw5
IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX3Rlc3QodW5zaWduZWQgbG9uZyBzdGFydCwKIAkg
Ki8KIAlpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fUkVBRCkpIHsKIAkJKHZvaWQpIGhtbV9wZm5z
X2ZpbGwoc3RhcnQsIGVuZCwgcmFuZ2UsIEhNTV9QRk5fTk9ORSk7Ci0JCXJldHVybiAtRVBFUk07
CisKKwkJLyogU2tpcCB0aGlzIHZtYSBhbmQgY29udGludWUgcHJvY2Vzc2luZyB0aGUgbmV4dCB2
bWEuICovCisJCXJldHVybiAxOwogCX0KIAogCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
