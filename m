Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3039312B2EC
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E50F6E13D;
	Fri, 27 Dec 2019 08:14:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3089DC9
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:47 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o49so16510764qta.7
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfZfiXb3zJ195gWPi/l/D27toKL96PSF+DrXZsTvCKc=;
 b=Vc58TGVq1lmjMY4eOa7KbtL6DEqVXlgPnJsOzrFIA+Kq+VIv+n8OiCivi4cUtamTnT
 1KYSo7v2A3a+ickTwHSH38kA5tGy8OuuNpGMwWxeSjiIUwF3+ru9o9EbSpkLUVe4ONKL
 vwoevPFvTqW4AXdpTwIwYVfG1lCs2EgIFUFFard0RfJWd72B2i5FrekyEo9dDa85D8eS
 IgS1EDvxvQkqOsgxFumEvEuegOpwLnX2TxR9uWKcEKPRRgLoUO9yKB4vsfjdqKaXA3Zr
 0ht0Y4lwbn51FabpNrQPAmMzXA34J6VR9wDC/ZusGDpxulAVuNULgD/MF+Wf668IbxSy
 16vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfZfiXb3zJ195gWPi/l/D27toKL96PSF+DrXZsTvCKc=;
 b=cRtOIhHF7GTQXhGHvFgG7NIqZ36AwAyDqnrj/qPlNwmLS77Z9GS/NOC33ER4e9faj1
 p0H0Ls2GaYuu5cAr5vd+tzWpUnB08kuxYHh67spiBE3KuvfY0QC/OSaEJf7kjq4Ainzw
 ah6trNwihOh7f9aKX2NA+gDDlr0RY0kp0YZTUHYeghnvCBSg0QTT4+KODrE+KZDYjGsj
 ufHk5a6yK6p7SKU+SxpQvbF5aUaADNMNS1zKQmzKeo79b7QwIFud3fY2PAlG6GZOuvN1
 xxi1I0ZDHvY6aK6jMhjNeOj9/UlK70jyHAu1dnTbfFYr6n/53GHrAHnLTlN5CN2n934N
 4m2Q==
X-Gm-Message-State: APjAAAU3zBACbEZMPdKr2JMJl1hOsT6VWf19PRu068Xc2PcZtB4+KOd3
 JdI8/8iqZ86eNfXZaukHsvTNNg==
X-Google-Smtp-Source: APXvYqyzwQd88COzKjNYUtUi77xt5inAXAbC04JrmAuM/rVN/+ea+Lu0JHPIt/2aFSc9iA4BmT0l3w==
X-Received: by 2002:ac8:3f67:: with SMTP id w36mr271020qtk.99.1572293446378;
 Mon, 28 Oct 2019 13:10:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id r7sm6375208qkf.124.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gM-77; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:21 -0300
Message-Id: <20191028201032.6352-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 04/15] mm/hmm: define the pre-processor related
 parts of hmm.h even if disabled
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKT25seSB0aGUgZnVuY3Rp
b24gY2FsbHMgYXJlIHN0dWJiZWQgb3V0IHdpdGggc3RhdGljIGlubGluZXMgdGhhdCBhbHdheXMK
ZmFpbC4gVGhpcyBpcyB0aGUgc3RhbmRhcmQgd2F5IHRvIHdyaXRlIGEgaGVhZGVyIGZvciBhbiBv
cHRpb25hbCBjb21wb25lbnQKYW5kIG1ha2VzIGl0IGVhc2llciBmb3IgZHJpdmVycyB0aGF0IG9u
bHkgb3B0aW9uYWxseSBuZWVkIEhNTV9NSVJST1IuCgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xp
c3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiBrZXJuZWwvZm9yay5jICAgICAg
IHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0u
aAppbmRleCA4YWMxZmQ2YTgxYWY4Zi4uMjY2NmViMDhhNDA2MTUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvaG1tLmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNjIsOCArNjIsNiBA
QAogI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgog
Ci0jaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKLQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgog
I2luY2x1ZGUgPGxpbnV4L21pZ3JhdGUuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1yZW1hcC5oPgpA
QCAtMzc0LDYgKzM3MiwxNSBAQCBzdHJ1Y3QgaG1tX21pcnJvciB7CiAJc3RydWN0IGxpc3RfaGVh
ZAkJbGlzdDsKIH07CiAKKy8qCisgKiBSZXRyeSBmYXVsdCBpZiBub24tYmxvY2tpbmcsIGRyb3Ag
bW1hcF9zZW0gYW5kIHJldHVybiAtRUFHQUlOIGluIHRoYXQgY2FzZS4KKyAqLworI2RlZmluZSBI
TU1fRkFVTFRfQUxMT1dfUkVUUlkJCSgxIDw8IDApCisKKy8qIERvbid0IGZhdWx0IGluIG1pc3Np
bmcgUFRFcywganVzdCBzbmFwc2hvdCB0aGUgY3VycmVudCBzdGF0ZS4gKi8KKyNkZWZpbmUgSE1N
X0ZBVUxUX1NOQVBTSE9UCQkoMSA8PCAxKQorCisjaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKIGlu
dCBobW1fbWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKTsKIHZvaWQgaG1tX21pcnJvcl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWly
cm9yICptaXJyb3IpOwogCkBAIC0zODMsMTQgKzM5MCw2IEBAIHZvaWQgaG1tX21pcnJvcl91bnJl
Z2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpOwogaW50IGhtbV9yYW5nZV9yZWdpc3Rl
cihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcik7CiB2
b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKTsKIAotLyoK
LSAqIFJldHJ5IGZhdWx0IGlmIG5vbi1ibG9ja2luZywgZHJvcCBtbWFwX3NlbSBhbmQgcmV0dXJu
IC1FQUdBSU4gaW4gdGhhdCBjYXNlLgotICovCi0jZGVmaW5lIEhNTV9GQVVMVF9BTExPV19SRVRS
WQkJKDEgPDwgMCkKLQotLyogRG9uJ3QgZmF1bHQgaW4gbWlzc2luZyBQVEVzLCBqdXN0IHNuYXBz
aG90IHRoZSBjdXJyZW50IHN0YXRlLiAqLwotI2RlZmluZSBITU1fRkFVTFRfU05BUFNIT1QJCSgx
IDw8IDEpCi0KIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpOwogCiBsb25nIGhtbV9yYW5nZV9kbWFfbWFwKHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlLApAQCAtNDAxLDYgKzQwMCw0NCBAQCBsb25nIGhtbV9yYW5nZV9kbWFfdW5t
YXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAJCQkgc3RydWN0IGRldmljZSAqZGV2aWNlLAog
CQkJIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJCSBib29sIGRpcnR5KTsKKyNlbHNlCitpbnQgaG1t
X21pcnJvcl9yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLCBzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSkKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKK3ZvaWQgaG1tX21pcnJvcl91
bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCit7Cit9CisKK2ludCBobW1fcmFu
Z2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHN0cnVjdCBobW1fbWlycm9yICpt
aXJyb3IpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCit2b2lkIGhtbV9yYW5nZV91bnJl
Z2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQoreworfQorCitzdGF0aWMgaW5saW5lIGxv
bmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCitzdGF0aWMgaW5saW5lIGxvbmcg
aG1tX3JhbmdlX2RtYV9tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCisJCQkJICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXZpY2UsIGRtYV9hZGRyX3QgKmRhZGRycywKKwkJCQkgICAgIHVuc2lnbmVk
IGludCBmbGFncykKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKK3N0YXRpYyBpbmxpbmUg
bG9uZyBobW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAorCQkJCSAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCisJCQkJICAgICAgIGRtYV9hZGRyX3QgKmRhZGRy
cywgYm9vbCBkaXJ0eSkKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisjZW5kaWYKIAogLyoK
ICAqIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQgLSBkZWZhdWx0IHRpbWVvdXQgKG1zKSB3aGVu
IHdhaXRpbmcgZm9yIGEgcmFuZ2UKQEAgLTQxMSw2ICs0NDgsNCBAQCBsb25nIGhtbV9yYW5nZV9k
bWFfdW5tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAgKi8KICNkZWZpbmUgSE1NX1JBTkdF
X0RFRkFVTFRfVElNRU9VVCAxMDAwCiAKLSNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1f
TUlSUk9SKSAqLwotCiAjZW5kaWYgLyogTElOVVhfSE1NX0ggKi8KZGlmZiAtLWdpdCBhL2tlcm5l
bC9mb3JrLmMgYi9rZXJuZWwvZm9yay5jCmluZGV4IGY5NTcyZjQxNjEyNjI4Li40NTYxYTY1ZDE5
ZGI4OCAxMDA2NDQKLS0tIGEva2VybmVsL2ZvcmsuYworKysgYi9rZXJuZWwvZm9yay5jCkBAIC00
MCw3ICs0MCw2IEBACiAjaW5jbHVkZSA8bGludXgvYmluZm10cy5oPgogI2luY2x1ZGUgPGxpbnV4
L21tYW4uaD4KICNpbmNsdWRlIDxsaW51eC9tbXVfbm90aWZpZXIuaD4KLSNpbmNsdWRlIDxsaW51
eC9obW0uaD4KICNpbmNsdWRlIDxsaW51eC9mcy5oPgogI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAj
aW5jbHVkZSA8bGludXgvdm1hY2FjaGUuaD4KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
