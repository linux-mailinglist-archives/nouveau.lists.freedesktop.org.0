Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62B71D7F
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 19:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5F86E319;
	Tue, 23 Jul 2019 17:17:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D29C6E319
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 17:17:34 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id u124so29358664vsu.2
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QqrUJzkPpAaDRvvKsmPrqxCm6oyy05uDqHmCovyhL70=;
 b=nB0dl39lDek46UfPJ3tZWXLtWd2HQW+gby+/14S0j4O0l+1orc0a5luwkGoJt6BO/T
 r+JoKNjNXTRTyR4Y34msaV7XmoqlIy/mS67O2Gl7giBnMMWx+HiOvUCFi6SHFLZ4RN+B
 KCVbHn3BriLKuQjleTtwphFRkW/ctfgJUpaTfcgtCXDiVlRa9ObYmoyGZxYAG91/DdVF
 43u2ptDnHm2pC/5tWqVSFEAAdM7pFyq1cc4kwhDpuaWYt4fk38m6UqVuKCtIPiPDUDGp
 DdPowYdvdnuo/VaLomOwwWsHE92ViOlqt+KQYyg4N5I6gYC+JHzR/HhOCEEqhYwfnkTy
 y3Qw==
X-Gm-Message-State: APjAAAWZ/K15dfF1Np5Btg2mWh8FWHM9YN6qFFsGaAdPdr+L2JDFnNWo
 bQ+V6h1w4bTh4K7JqUBOMrGU+A==
X-Google-Smtp-Source: APXvYqy/BnQGomP9bfEv9fcbGXC5naUZNkETCjo5R1Jblm92pT8i/VM8xtUGyS2NeeXimmoMCnZGHQ==
X-Received: by 2002:a67:db89:: with SMTP id f9mr45182090vsk.150.1563902253192; 
 Tue, 23 Jul 2019 10:17:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i12sm9556385vsr.17.2019.07.23.10.17.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jul 2019 10:17:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hpyPr-0002YL-Ko; Tue, 23 Jul 2019 14:17:31 -0300
Date: Tue, 23 Jul 2019 14:17:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190723171731.GD15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
 <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723163048.GD1655@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QqrUJzkPpAaDRvvKsmPrqxCm6oyy05uDqHmCovyhL70=;
 b=KClY5whBhZJkA8IHSLzSHzX+WVj0t87uGT0lzsUub/COP4/3SMvz4Iet5QPzraFXgF
 3H5sIXzzJFzGpd9sIfkxKMU0QO4M2bcDm0G+Tf39YMzAJvr0jbNxuRcY7ooqKTXsAWgH
 /tofHFhod7aDMEbGJKL6+i0RWw2prFK/Z4DJ6IZYxw+ZrvIyV2lPSgSvI1ubA+ize+sf
 ljiHEYoC3nR0bUaWqY/zvkbdhaQFxXvwycHLfBlxo6jBsBWETWn9TDMISL99sGP0pZng
 cvD04P8wscxYGTWuyLPSEz5GL4VPipUGVTAGOpCofseTd/SoqMw3MQ4eC8DD0yCVjXMt
 0xNg==
Subject: Re: [Nouveau] [PATCH 4/6] nouveau: unlock mmap_sem on all errors
 from nouveau_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDY6MzA6NDhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6MTg6MjhQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSHVtLi4KPiA+IAo+ID4gVGhlIGNhbGxlciBkb2VzIHRo
aXM6Cj4gPiAKPiA+IGFnYWluOgo+ID4gCQlyZXQgPSBub3V2ZWF1X3JhbmdlX2ZhdWx0KCZzdm1t
LT5taXJyb3IsICZyYW5nZSk7Cj4gPiAJCWlmIChyZXQgPT0gMCkgewo+ID4gCQkJbXV0ZXhfbG9j
aygmc3ZtbS0+bXV0ZXgpOwo+ID4gCQkJaWYgKCFub3V2ZWF1X3JhbmdlX2RvbmUoJnJhbmdlKSkg
ewo+ID4gCQkJCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOwo+ID4gCQkJCWdvdG8gYWdhaW47
Cj4gPiAKPiA+IEFuZCB3ZSBjYW4ndCBjYWxsIG5vdXZlYXVfcmFuZ2VfZmF1bHQoKSAtPiBobW1f
cmFuZ2VfZmF1bHQoKSB3aXRob3V0Cj4gPiBob2xkaW5nIHRoZSBtbWFwX3NlbSwgc28gd2UgY2Fu
J3QgYWxsb3cgbm91dmVhdV9yYW5nZV9mYXVsdCB0byB1bmxvY2sKPiA+IGl0Lgo+IAo+IEdvdG8g
YWdhaW4gY2FuIG9ubHkgaGFwcGVuIGlmIG5vdXZlYXVfcmFuZ2VfZmF1bHQgd2FzIHN1Y2Nlc3Nm
dWwsCj4gaW4gd2hpY2ggY2FzZSB3ZSBkaWQgbm90IGRyb3AgbW1hcF9zZW0uCgpPaCwgcmlnaHQg
d2Ugc3dpdGNoIGZyb20gc3VjY2VzcyA9IG51bWJlciBvZiBwYWdlcyB0byBzdWNjZXNzID0wLi4K
Ckhvd2V2ZXIgdGhlIHJlYXNvbiB0aGlzIGxvb2tzIHNvIHdlaXJkIHRvIG1lIGlzIHRoYXQgdGhl
IGxvY2tpbmcKcGF0dGVybiBpc24ndCBiZWluZyBmb2xsb3dlZCwgYW55IHJlc3VsdCBvZiBobW1f
cmFuZ2VfZmF1bHQgc2hvdWxkIGJlCmlnbm9yZWQgdW50aWwgd2UgZW50ZXIgdGhlIHN2bW0tPm11
dGV4IGFuZCBjaGVjayBpZiB0aGVyZSB3YXMgYQpjb2xsaWRpbmcgaW52YWxpZGF0aW9uLgoKU28g
dGhlICdnb3RvIGFnYWluJyAqc2hvdWxkKiBiZSBwb3NzaWJsZSBldmVuIGlmIHJhbmdlX2ZhdWx0
IGZhaWxlZC4KCkJ1dCB0aGF0IGlzIG5vdCBmb3IgdGhpcyBwYXRjaC4uCgo+ID4gIAlyZXQgPSBo
bW1fcmFuZ2VfZmF1bHQocmFuZ2UsIHRydWUpOwo+ID4gIAlpZiAocmV0IDw9IDApIHsKPiA+ICAJ
CWlmIChyZXQgPT0gMCkKPiA+ICAJCQlyZXQgPSAtRUJVU1k7Cj4gPiAtCQl1cF9yZWFkKCZyYW5n
ZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwo+ID4gIAkJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFu
Z2UpOwo+IAo+IFRoaXMgd291bGQgaG9sZCBtbWFwX3NlbSBvdmVyIGhtbV9yYW5nZV91bnJlZ2lz
dGVyLCB3aGljaCBjYW4gbGVhZAo+IHRvIGRlYWRsb2NrIGlmIHdlIGNhbGwgZXhpdF9tbWFwIGFu
ZCB0aGVuIGFjcXVpcmUgbW1hcF9zZW0gYWdhaW4uCgpUaGF0IHJlbWluZHMgbWUsIHRoaXMgY29k
ZSBpcyBhbHNvIGxlYWtpbmcgaG1tX3JhbmdlX3VucmVnaXN0ZXIoKSBpbgp0aGUgc3VjY2VzcyBw
YXRoLCByaWdodD8KCkkgdGhpbmsgdGhlIHJpZ2h0IHdheSB0byBzdHJ1Y3R1cmUgdGhpcyBpcyB0
byBtb3ZlIHRoZSBnb3RvIGFnYWluIGFuZApyZWxhdGVkIGludG8gdGhlIG5vdXZlYXVfcmFuZ2Vf
ZmF1bHQoKSBzbyB0aGUgd2hvbGUgcmV0cnkgYWxnb3JpdGhtIGlzCnNlbnNpYmx5IHNlbGYgY29u
dGFpbmVkLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
