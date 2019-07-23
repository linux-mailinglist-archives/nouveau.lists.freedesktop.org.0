Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA471DB7
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 19:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A53189E19;
	Tue, 23 Jul 2019 17:30:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288C4899F0
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 17:30:34 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 8so17244809uaz.11
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 10:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RbhpiDasw1Ewe5g+7weE9TXbMjL8KAWk+B3qwXxWc/M=;
 b=QGgpvDSjVv/LMUgv2UF6PnE/cULcMpqdnzJDzgFHNZCHvoPLV5LxrtLifg/UEaY4N/
 3AUtkUl9jHW6B1pQiDq8ci36ruYz3HGgh+aOGymvXEvEWYw/S7yRHs/EMgJy/YVlmSFg
 LG9lke3wTxL0OCwh5SGsqjHNEBzfHkjh+uwzNvqFWoBRX3Bml0BqQmizIGORw5cyunAy
 pVoifma5AN5Fj82M9ge8hdmZVGz3E5vPMznX0nkGrqbYGIGeusKbMkYmWFGiXnoXzgDv
 WqjeQOHr/rhi4pt2P4pL0hgXx1oUVa6xNKFDySzG6QbsWWmGHPIEfvlNyz6OtKLslUzI
 OZjw==
X-Gm-Message-State: APjAAAUrzgmQvfLFRhx2j+BK9SOkeu2je7d9Trc4OFDno4YjDFoAfDXi
 X7ZetHl8MJwB4RT8ZjfgOmnESg==
X-Google-Smtp-Source: APXvYqwgXpmyPlVv/AMR8i5yc7RI1B7//ksxiY/lelX41GFnDNSTYMBLZpaY2My1r5ik6s2sxtfhhQ==
X-Received: by 2002:ab0:60ad:: with SMTP id f13mr37669182uam.129.1563903033250; 
 Tue, 23 Jul 2019 10:30:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id d3sm4771548uaq.20.2019.07.23.10.30.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jul 2019 10:30:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hpycS-0002gy-4J; Tue, 23 Jul 2019 14:30:32 -0300
Date: Tue, 23 Jul 2019 14:30:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190723173032.GF15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
 <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de> <20190723171731.GD15357@ziepe.ca>
 <20190723172335.GA2846@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723172335.GA2846@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RbhpiDasw1Ewe5g+7weE9TXbMjL8KAWk+B3qwXxWc/M=;
 b=O9hWpCDR380rbhw90TNwrzp28pNffEoS4Us5UckcJaWEOyzBJaUbrQSE98N+ymjxQW
 oiBk973xZ6ORiEBiV9Zx6YM5f6Q32IYj0/SyGtmDoGFY8uMFYwt3mdlZ97s5C49fnMui
 2OTpVNIjIGGJAlPoeE+X847UupJo0ZA8rnMsUoH0URd6UnZ19b2YDamDSx3OJSe3EMOb
 Kt2uJ7zSPkpnVExd29sGDon2CJhSCEdXgWKiUUomK2L0M/1EIgZbY6L4agXTd7JVcj3V
 AkElcQgYYmWIkQrV6d6fmuAyO9EgG8sewHhTtRGw4oqVCiwsjjyyZ/Ue6PsPkX8h/K78
 iXYw==
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDc6MjM6MzVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MTc6MzFQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gVGhhdCByZW1pbmRzIG1lLCB0aGlzIGNvZGUgaXMgYWxz
byBsZWFraW5nIGhtbV9yYW5nZV91bnJlZ2lzdGVyKCkgaW4KPiA+IHRoZSBzdWNjZXNzIHBhdGgs
IHJpZ2h0Pwo+IAo+IE5vLCB0aGF0IGlzIGRvbmUgYnkgaG1tX3ZtYV9yYW5nZV9kb25lIC8gbm91
dmVhdV9yYW5nZV9kb25lIGZvciB0aGUKPiBzdWNjZXNzIHBhdGguCgouLiB3aGljaCBpcyBkb25l
IHdpdGggdGhlIG1tYXBfc2VtIGhlbGQgOigKCj4gPiBJIHRoaW5rIHRoZSByaWdodCB3YXkgdG8g
c3RydWN0dXJlIHRoaXMgaXMgdG8gbW92ZSB0aGUgZ290byBhZ2FpbiBhbmQKPiA+IHJlbGF0ZWQg
aW50byB0aGUgbm91dmVhdV9yYW5nZV9mYXVsdCgpIHNvIHRoZSB3aG9sZSByZXRyeSBhbGdvcml0
aG0gaXMKPiA+IHNlbnNpYmx5IHNlbGYgY29udGFpbmVkLgo+IAo+IFRoZW4gd2UnZCB0YWtlIHN2
bW0tPm11dGV4IGluc2lkZSB0aGUgaGVscGVyIGFuZCBsZXQgdGhlIGNhbGxlcgo+IHVubG9jayB0
aGF0LiAgRWl0aGVyIHdheSBpdCBpcyBhIGJpdCBvZiBhIG1lc3MsIGFuZCBJJ2QgcmF0aGVyIHBy
ZWZlcgo+IGlmIHNvbWVvbmUgaGFzIHRoZSBoYXJkd2FyZSB3b3VsZCBkbyBhIGdyYW5kIHJld3Jp
dGUgb2YgdGhpcyBwYXRoCj4gZXZlbnR1YWxseS4gIEFsdGVybmF0aXZlbHkgaWYgbm8gb25lIHNp
Z25zIHVwIHRvIG1haW5haW4gdGhpcyBjb2RlCj4gd2Ugc2hvdWxkIGV2ZW50dWFsbHkgZHJvcCBp
dCBnaXZlbiB0aGUgc3RhZ2luZyBzdGF0dXMuCgpJIHRlbmQgdG8gYWdyZWUgd2l0aCB0aGUgc2Vu
dGltZW50LCBpdCBqdXN0IG1ha2VzIG1lIHNhZCB0aGF0IGFsbCB0aGUKZXhhbXBsZXMgd2UgaGF2
ZSBvZiB0aGVzZSBBUElzIGFyZSBzbyB0cm91YmxlZC4KCkphc29uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
