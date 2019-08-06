Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B983628
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E326E40A;
	Tue,  6 Aug 2019 16:06:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774226E3FC;
 Tue,  6 Aug 2019 16:06:00 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yG-0000Ve-2p; Tue, 06 Aug 2019 16:05:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:38 +0300
Message-Id: <20190806160554.14046-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5MxxtDMNs1Lvn21R+Aqvcobycge3qF/vKSqdu5UNw7E=; b=eIIvEQvbf6HxKp4vB8rYWilc1
 Y+u02rLmHHgGDQ0BTiNLEYHLedfAofs5F3rHecD7klB5qWZyLsUVZ6dxMkLS2pAWxn04GZTAsbBO/
 ouTJ85EOwF/aluMfxLMuqi+nHzvOBHhK79wk9TKTlzEO/ORS3GGMIcaDAA5aQ/dikzACu9/rM2gl6
 pdRKvVBCY0KTPXd1q47Fs+imhFbAzx721LUs3CqY+31uYX516XCJ473j9veaAi1jB50nfgfna6Gf6
 LLlbHAeFh+Cb66JQz5UcvMUc+Bju9mEnnjbibagKSd8OEOzKmC4fRTXUeOQC3Q/7CRnpMm8MDH+Ro
 R8ayd9OvQ==;
Subject: [Nouveau] hmm cleanups, v2
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CkhpIErDqXLDtG1lLCBCZW4sIEZlbGl4IGFuZCBKYXNvbiwKCmJlbG93IGlzIGEgc2VyaWVzIGFn
YWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGNsZWFucyB1cCB2YXJpb3VzIG1pbm9yCmJpdHMgYW5k
IGFsbG93cyBITU1fTUlSUk9SIHRvIGJlIGJ1aWx0IG9uIGFsbCBhcmNoaXRlY3R1cmVzLgoKRGlm
ZnN0YXQ6CgogICAgMTEgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKSwgMjEwIGRlbGV0
aW9ucygtKQoKQSBnaXQgdHJlZSBpcyBhbHNvIGF2YWlsYWJsZSBhdDoKCiAgICBnaXQ6Ly9naXQu
aW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQgaG1tLWNsZWFudXBzLjIKCkdpdHdlYjoK
CiAgICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9n
L3JlZnMvaGVhZHMvaG1tLWNsZWFudXBzLjIKCkNoYW5nZXMgc2luY2UgdjE6CiAtIGZpeCB0aGUg
Y292ZXIgbGV0dGVyIHN1YmplY3QKIC0gaW1wcm92ZSB2YXJpb3VzIHBhdGNoIGRlc2NyaXB0aW9u
cwogLSB1c2Ugc3ZtbS0+bW0gaW4gbm91dmVhdV9yYW5nZV9mYXVsdAogLSBpbnZlcnNlIHRoZSBo
bWFzayBmaWVsZCB3aGVuIHVzaW5nIGl0CiAtIHNlbGVjdCBITU1fTUlSUk9SIGluc3RlYWQgb2Yg
bWFraW5nIGl0IGEgdXNlciB2aXNpYmxlIG9wdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
