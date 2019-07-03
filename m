Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D75EB60
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7F26E186;
	Wed,  3 Jul 2019 18:15:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70196E186
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 18:15:43 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r4so3516542qkm.13
 for <nouveau@lists.freedesktop.org>; Wed, 03 Jul 2019 11:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wryDEDMxoF6Vk+K+7duTnFgyottGCGFfZAdbutaWn2g=;
 b=ON3X0pcTjXf83o7+V9l3THvD1kuP8UD1VEzgTulN51OgVSmJFkyu3hKxmbOLW4mWH4
 br/jf2hM2Ae0XQcSVlVLLJUVpHAqZkkA42WwVN+1wkN3gwFWot9thCL6tGySooxZCJBW
 VgfWADR299pOttd+yBEBaVtaLE9NYCA+oKd8uGzaqo3twzhgAFAG5rJF7fy+CEgFTSuk
 W1uLP79l/AWFzMW4K9Zhgu/12/DqZtFLRYrDSbPCrFvCLimsx2v4PSfSAq469xldZ9xf
 iGPnlcLTMG5SKxIhaLq1kkvbmJ/7WRE+/tNhgHdbMTSAuF/WyrFkfls7du+KJI9KV7az
 A3kw==
X-Gm-Message-State: APjAAAWDBZoKDBgWjwvmO2L4INFh9JsAV3dlO+mqLY1pkabQL5lV7vri
 9c15eZEVYStaSf82JrLn2LAiKA==
X-Google-Smtp-Source: APXvYqx+Obpp289GMjyQScpks1hosaCdzO2IJ2gOygQVUkXAuZU/IoXFFk8Hk2uU2aW+fFE5K61x4g==
X-Received: by 2002:a37:4914:: with SMTP id w20mr31403797qka.156.1562177743091; 
 Wed, 03 Jul 2019 11:15:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id j184sm1204269qkc.65.2019.07.03.11.15.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:15:42 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijnC-0000Ju-2z; Wed, 03 Jul 2019 15:15:42 -0300
Date: Wed, 3 Jul 2019 15:15:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190703181542.GD18673@ziepe.ca>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de>
 <20190703180125.GA18673@ziepe.ca> <20190703180308.GA13656@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703180308.GA13656@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wryDEDMxoF6Vk+K+7duTnFgyottGCGFfZAdbutaWn2g=;
 b=MGb4X8V0OjUmCxHXdwat5t//603Imvm3kttDyzPr4B1R8dke3zyk8pDWGq7fzjOf9T
 vhoLDzI6WCU5N4NrK/vZZAt9KDue5n72hIeNC1cz1j/ds592t4xYj0gPc7RQWN5tu3kK
 y/BZeSVV19CFNNBfNU5x0lM9OM/CH02xFeKxUrblZJMqjjhX0l4gjG924KSmb6umCVqY
 q+ZOkych1AFQ/2d82ikRe4cso3C8TVySqyZbPVlAYKLNARrOu29Nsf2uO3Rs45jVcEQb
 PCfasJR/oBWrfsPe016/1vxmUYZfy876Nti6m+RO+WQbCOzAxMa5i5a/ZdgHoU8lAwIn
 KN7g==
Subject: Re: [Nouveau] [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDg6MDM6MDhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDE6MjVQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gQ2hyaXN0b3BoLCBJIGd1ZXNzIHlvdSBkaWRuJ3QgbWVh
biB0byBzZW5kIHRoaXMgYnJhbmNoIHRvIHRoZSBtYWlsaW5nCj4gPiBsaXN0Pwo+ID4gCj4gPiBJ
biBhbnkgZXZlbnQgc29tZSBvZiB0aGVzZSwgbGlrZSB0aGlzIG9uZSwgbG9vayBvYnZpb3VzIGFu
ZCBJIGNvdWxkCj4gPiBzdGlsbCBncmFiIGEgZmV3IGZvciBobW0uZ2l0Lgo+ID4gCj4gPiBMZXQg
bWUga25vdyB3aGF0IHlvdSdkIGxpa2UgcGxlYXNlCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gCj4gVGhhbmtzLiAgSSB3YXMgZ29pbmcg
dG8gc2VuZCB0aGlzIHNlcmllcyBvdXQgYXMgc29vbiBhcyB5b3UgaGFkCj4gYXBwbGllZCB0aGUg
cHJldmlvdXMgb25lLiAgTm93IHRoYXQgaXQgbGVha2VkIEknbSBoYXBweSB0byBjb2xsZWN0Cj4g
cmV2aWV3cy4gIEJ1dCB3aGlsZSBJJ3ZlIGdvdCB5b3VyIGF0dGVudGlvbjogIHRoZSByZG1hLmdp
dCBobW0KPiBicmFuY2ggaXMgc3RpbGwgYXQgdGhlIC1yYzcgbWVyZ2UgYW5kIGRvZW4ndCBoYXZl
IG15IHNlcmllcywgaXMgdGhhdAo+IGludGVudGlvbmFsPwoKU29ycnksIEkgcnVzaGVkIGl0IHRv
byBsYXRlIGF0IG5pZ2h0IHRvIGRvIGl0IHJpZ2h0IGFwcGFyZW50bHkuIEZpeGVkLgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
