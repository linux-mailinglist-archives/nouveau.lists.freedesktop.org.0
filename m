Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6517742CE
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 03:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67478993B;
	Thu, 25 Jul 2019 01:14:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF6B8994D
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jul 2019 01:14:27 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so35256425qkk.5
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 18:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2QscBl/3tbBrXReK2tsv96us6PdZtQnqjBeeXbxeJtw=;
 b=mRjjzDyanSwSAv3W46XJRgRu9+vCUqLG8qeppsTkcQHs1eBVqgcvQzbdXXU9NCeSSF
 ItO/bXGA6FXBtreNPb61SGDLsg6o0cF23wFqkMPOWJxxxF0r+6ZFRyjAWg1L6+/LWN8q
 ViYhHxwVAIacXOksUyJWqUGYC8nnKRTZt4rza4NdtGU0N3opf0Uu6DGhvCqvkfIsZV/e
 arqYFRJ7RU9KMJko3nGpLAfl3B45ycLbEWGUlPObtoQbvKA0HFauOpKHLXQkNukzlNci
 bkh9hUXTGThNjsITU/V7pLAUdcgXWjH2ZUvQZoG+P12TsO+iIBGl6C0X05xVmkivxPRm
 OZvg==
X-Gm-Message-State: APjAAAWSxMJSZvYrrnIthwS3X4Z0mr39njDEV7M0LsXbLy0ZzC7dUJLm
 ufu0Bn67Nf0WO/Xb/KHFzHHb5g==
X-Google-Smtp-Source: APXvYqx9ciisQdvPSwTvcdjpywJ+TPlixY+OV7qviQmXLqIq62Jmz3/cvYtUMzroSQEs8t3xbOZYHw==
X-Received: by 2002:a05:620a:1ea:: with SMTP id
 x10mr54556510qkn.484.1564017266127; 
 Wed, 24 Jul 2019 18:14:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id k7sm20307997qth.88.2019.07.24.18.14.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 18:14:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqSKu-00006q-Vv; Wed, 24 Jul 2019 22:14:24 -0300
Date: Wed, 24 Jul 2019 22:14:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190725011424.GA377@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723210506.25127-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=2QscBl/3tbBrXReK2tsv96us6PdZtQnqjBeeXbxeJtw=;
 b=CLuwqZyxlnhSQLNy2YRvagdU0Et/zZ17Ms4ehbdSvHLmk/gxwl3Wy/TTFegvnq+Et5
 4OpzVJv31gfdKu+/y13I9cSc1xlCIrpNLtabHb96qgORKl53PzbY30X66v61S563aYvw
 Z37UCLu003OZv8+NzTJzDSWyvzaPJpCNXSGq9hTC782PqR5qb6OfdY663YIxKKz6zIal
 IUoHez0chz3E2syIDBmGa7w0i9EJIB2xJ/Oxn1p3vnYmrNLjnuIVSG83ByHoyfGxuzLd
 v/OfQGlL/BCupE+LUBwfJE+qrXBuBE9jk/6+jF2E0ImNgnz9zBrdwCRnFkuXmowLxdCC
 tjIQ==
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MDU6MDZQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gVGhlIGhtbV9taXJyb3Jfb3BzIGNhbGxiYWNrIGZ1bmN0aW9uIHN5bmNfY3B1X2Rl
dmljZV9wYWdldGFibGVzKCkgcGFzc2VzCj4gYSBzdHJ1Y3QgaG1tX3VwZGF0ZSB3aGljaCBpcyBh
IHNpbXBsaWZpZWQgdmVyc2lvbiBvZiBzdHJ1Y3QKPiBtbXVfbm90aWZpZXJfcmFuZ2UuIFRoaXMg
aXMgdW5uZWNlc3Nhcnkgc28gcmVwbGFjZSBobW1fdXBkYXRlIHdpdGgKPiBtbXVfbm90aWZpZXJf
cmFuZ2UgZGlyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgo+IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQu
Y29tPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gQ2M6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Cj4gCj4gVGhpcyBpcyBiYXNlZCBvbiA1LjMuMC1yYzEgcGx1cyBDaHJpc3RvcGggSGVs
bHdpZydzIDYgcGF0Y2hlcwo+ICgiaG1tX3JhbmdlX2ZhdWx0IHJlbGF0ZWQgZml4ZXMgYW5kIGxl
Z2FjeSBBUEkgcmVtb3ZhbCB2MiIpLgo+IEphc29uLCBJIGJlbGlldmUgdGhpcyBpcyB0aGUgcGF0
Y2ggeW91IHdlcmUgcmVxdWVzdGluZy4KCkRvZXNuJ3QgdGhpcyBuZWVkIHJldmlzaW9uIHRvIGlu
Y2x1ZGUgYW1ncHU/Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYzogICAg
ICAgICAuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3luY19wYWdldGFi
bGVzX2dmeCwKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmM6ICAgICAgICAg
LnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzID0gYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlc19o
c2EsCgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
