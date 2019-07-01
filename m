Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8195B4C3
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4A889F4A;
	Mon,  1 Jul 2019 06:21:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9889F43;
 Mon,  1 Jul 2019 06:21:01 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgQ-00036S-QO; Mon, 01 Jul 2019 06:20:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:14 +0200
Message-Id: <20190701062020.19239-17-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MFOQKdBekg4uOAbPxr4fTMLEjMHRTQOu8rr2EDfIjss=; b=almZJDAbXnBzGls3pOj8NvkNrg
 EDtv5JCQhprtUoj3msL+8HdfB1SF/bGw3a7VYmwkTA3dICFI4cqC6GaUuZTpYn1JfQvs8543MUZQa
 /cjCFY7Nb30zzkZ1LWtxW1UbEYJtXcLWKms8VR3iI42b3WG6HreqXzn/j+dgC92Bh3IT+9q76eFjs
 HdoS+gFfVfgE0Ik93/RTa7Pft0ZeMVk5W+f1ouhTl61ym6nAg6Lq3hqUVshyyXXLoAgViMSi61syX
 4zsqcXeDSTjSDrYePaOl1SrEhHZHmGtM+ScRgoGqpBcAAWLJo17YUdU+msd/f6SA00fh++p5Z0Q+O
 AKbcbwVQ==;
Subject: [Nouveau] [PATCH 16/22] mm/hmm: Remove confusing comment and logic
 from hmm_release
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
Cc: Philip Yang <Philip.Yang@amd.com>, linux-nvdimm@lists.01.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX3JlbGVhc2UoKSBp
cyBjYWxsZWQgZXhhY3RseSBvbmNlIHBlciBobW0uIG9wcy0+cmVsZWFzZSgpIGNhbm5vdAphY2Np
ZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8K
aG1tLT5taXJyb3JzX3NlbS4KClRoaXMgZml4ZXMgYSB1c2UgYWZ0ZXItZnJlZSByYWNlIG9mIHRo
ZSBmb3JtOgoKICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9yZWxlYXNl
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUo
JmhtbS0+bWlycm9yc19zZW0pOwogaG1tX21pcnJvcl91bnJlZ2lzdGVyKG1pcnJvcikKICBkb3du
X3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7
CiAga2ZyZWUobWlycm9yKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCgpUaGUgb25seSB1c2VyIHdlIGhhdmUg
dG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBmdW5jdGlvbiwgc28gdGhpcwppcyB1
bmFtYmlndW91c2x5IHNhZmUuCgpBcyBhIGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFj
ZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dlZCB0bwpyZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMg
ZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQog
bW0vaG1tLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0u
YyBiL21tL2htbS5jCmluZGV4IGMzMGFhOTQwM2RiZS4uYjIyNGVhNjM1YTc3IDEwMDY0NAotLS0g
YS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMTMwLDI2ICsxMzAsMTYgQEAgc3RhdGljIHZv
aWQgaG1tX3JlbGVhc2Uoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKQogCSAqLwogCVdBUk5fT04oIWxpc3RfZW1wdHlfY2FyZWZ1bCgmaG1tLT5yYW5nZXMpKTsK
IAotCWRvd25fd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwotCW1pcnJvciA9IGxpc3RfZmlyc3Rf
ZW50cnlfb3JfbnVsbCgmaG1tLT5taXJyb3JzLCBzdHJ1Y3QgaG1tX21pcnJvciwKLQkJCQkJICBs
aXN0KTsKLQl3aGlsZSAobWlycm9yKSB7Ci0JCWxpc3RfZGVsX2luaXQoJm1pcnJvci0+bGlzdCk7
Ci0JCWlmIChtaXJyb3ItPm9wcy0+cmVsZWFzZSkgewotCQkJLyoKLQkJCSAqIERyb3AgbWlycm9y
c19zZW0gc28gdGhlIHJlbGVhc2UgY2FsbGJhY2sgY2FuIHdhaXQKLQkJCSAqIG9uIGFueSBwZW5k
aW5nIHdvcmsgdGhhdCBtaWdodCBpdHNlbGYgdHJpZ2dlciBhCi0JCQkgKiBtbXVfbm90aWZpZXIg
Y2FsbGJhY2sgYW5kIHRodXMgd291bGQgZGVhZGxvY2sgd2l0aAotCQkJICogdXMuCi0JCQkgKi8K
LQkJCXVwX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKKwlkb3duX3JlYWQoJmhtbS0+bWlycm9y
c19zZW0pOworCWxpc3RfZm9yX2VhY2hfZW50cnkobWlycm9yLCAmaG1tLT5taXJyb3JzLCBsaXN0
KSB7CisJCS8qCisJCSAqIE5vdGU6IFRoZSBkcml2ZXIgaXMgbm90IGFsbG93ZWQgdG8gdHJpZ2dl
cgorCQkgKiBobW1fbWlycm9yX3VucmVnaXN0ZXIoKSBmcm9tIHRoaXMgdGhyZWFkLgorCQkgKi8K
KwkJaWYgKG1pcnJvci0+b3BzLT5yZWxlYXNlKQogCQkJbWlycm9yLT5vcHMtPnJlbGVhc2UobWly
cm9yKTsKLQkJCWRvd25fd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwotCQl9Ci0JCW1pcnJvciA9
IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmaG1tLT5taXJyb3JzLAotCQkJCQkJICBzdHJ1Y3Qg
aG1tX21pcnJvciwgbGlzdCk7CiAJfQotCXVwX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKKwl1
cF9yZWFkKCZobW0tPm1pcnJvcnNfc2VtKTsKIAogCWhtbV9wdXQoaG1tKTsKIH0KQEAgLTI3OSw3
ICsyNjksNyBAQCB2b2lkIGhtbV9taXJyb3JfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAq
bWlycm9yKQogCXN0cnVjdCBobW0gKmhtbSA9IG1pcnJvci0+aG1tOwogCiAJZG93bl93cml0ZSgm
aG1tLT5taXJyb3JzX3NlbSk7Ci0JbGlzdF9kZWxfaW5pdCgmbWlycm9yLT5saXN0KTsKKwlsaXN0
X2RlbCgmbWlycm9yLT5saXN0KTsKIAl1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7CiAJaG1t
X3B1dChobW0pOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
