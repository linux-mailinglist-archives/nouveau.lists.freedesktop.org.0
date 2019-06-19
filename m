Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E145024F
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 08:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A98991A;
	Mon, 24 Jun 2019 06:33:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2836E440
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 16:36:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p15so20703433qtl.3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 09:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DzpNw7iMfHgKemdLUrfJxvdy9KGKJSIkCkr6aus8rCA=;
 b=OUvFOKgjiMVA/oBXLMbXv4DhC6z+5/mmVzmKtV5NHuyrQdh87S6VLbihg1lQ8G62dD
 W4WERLvjB2rvga86H3zTL1JvB/hHsQydrL2aEFwxcXptqZtQpVm64dijjuPbvjjUqsIo
 4u6tYNNU9DHbuBJ886xZm9L9ZbZCMuRoYfg499Dk3/9KwVzaaGB/tE7YHu1TcVJ8Ky7z
 bnaiivyzDYgDkPZ8E+H/sixx8xpCBYUtiVWHD5Bg+1UnVqcmUhI78Or1L9sN8QwH6si3
 wqaJTUT5wLZzwst1k/mpmIh51BzRijiY5Sj+zM8W305AsQaOnJEifQPzs+/cCptgDw/p
 /srA==
X-Gm-Message-State: APjAAAWJA9h20DF6s6TH+95YR82d6GduHANcWbW85KHIhCojZHm4b8UU
 tXMd9fVhpJb5XNKOb2CRqdV/5g==
X-Google-Smtp-Source: APXvYqzqHRHHrr8SACyRyLxcASgrxSvjDf6v3XwfN8DQX4ZVR7KLVzKliqO65H7tJkj2zv0u+29foQ==
X-Received: by 2002:a0c:d24d:: with SMTP id o13mr34947576qvh.86.1560962216870; 
 Wed, 19 Jun 2019 09:36:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r36sm11720396qte.71.2019.06.19.09.36.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 09:36:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hddZv-0001vf-QN; Wed, 19 Jun 2019 13:36:55 -0300
Date: Wed, 19 Jun 2019 13:36:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190619163655.GG9360@ziepe.ca>
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
 <20190619094032.GA8928@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619094032.GA8928@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 24 Jun 2019 06:33:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DzpNw7iMfHgKemdLUrfJxvdy9KGKJSIkCkr6aus8rCA=;
 b=EDamHHKFiI7TTHkw3d71MrV0NdBwB6F1R0bV3XkjGbuH5mQMYmiVlZa63N43certmw
 GaIE2u+163Cb4BhvTpbwTBxOWcLAcGEeI/3LO9nZ2D3hphDdktczve9XtPtWbb/zjdgx
 QuoJYZuWKxQ1Q1HWKQMOXlDG8688RHVxOe9ZrXX0wEZogGnlfFfLqDn8V5Dbs8IQvczi
 yQX28xdFN722tg0xFkBas291DRO6iaiEm0BDaeD7B2Eul7XBDtVnG/ZeKQsPeS/6vBSl
 FO7l2jZl3LYlQIBoVhkk/uCuTaMtyaMfsLTID0dqUBuf/FNrb2Plto9Q3eXvKdPYCYXn
 mxug==
Subject: Re: [Nouveau] dev_pagemap related cleanups v2
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTE6NDA6MzJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTI6NDc6MTBQTSAtMDcwMCwgRGFu
IFdpbGxpYW1zIHdyb3RlOgo+ID4gPiBHaXQgdHJlZToKPiA+ID4KPiA+ID4gICAgIGdpdDovL2dp
dC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBobW0tZGV2bWVtLWNsZWFudXAuMgo+
ID4gPgo+ID4gPiBHaXR3ZWI6Cj4gPiA+Cj4gPiA+ICAgICBodHRwOi8vZ2l0LmluZnJhZGVhZC5v
cmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVhZHMvaG1tLWRldm1lbS1jbGVh
bnVwLjIKPiAKPiA+IAo+ID4gQXR0YWNoZWQgaXMgbXkgaW5jcmVtZW50YWwgZml4dXBzIG9uIHRv
cCBvZiB0aGlzIHNlcmllcywgd2l0aCB0aG9zZQo+ID4gaW50ZWdyYXRlZCB5b3UgY2FuIGFkZDoK
PiAKPiBJJ3ZlIGZvbGRlZCB5b3VyIGluY3JlbWVudGFsIGJpdHMgaW4gYW5kIHB1c2hlZCBvdXQg
YSBuZXcKPiBobW0tZGV2bWVtLWNsZWFudXAuMyB0byB0aGUgcmVwbyBhYm92ZS4gIExldCBtZSBr
bm93IGlmIEkgZGlkbid0IG1lc3MKPiB1cCBhbnl0aGluZyBlbHNlLiAgSSdsbCB3YWl0IGZvciBh
IGZldyBtb3JlIGNvbW1lbnRzIGFuZCBKYXNvbidzCj4gcGxhbm5lZCByZWJhc2Ugb2YgdGhlIGht
bSBicmFuY2ggYmVmb3JlIHJlcG9zdGluZy4KCkkgc2FpZCBJIHdvdWxkbid0IHJlYmFzZSB0aGUg
aG1tLmdpdCAoYXMgaXQgbmVlZHMgdG8gZ28gdG8gRFJNLCBBTUQKYW5kIFJETUEgZ2l0IHRyZWVz
KS4uCgpJbnN0ZWFkIEkgd2lsbCBtZXJnZSB2NS4yLXJjNSB0byB0aGUgdHJlZSBiZWZvcmUgYXBw
bHlpbmcgdGhpcyBzZXJpZXMuCgpJJ3ZlIHVuZGVyc3Rvb2QgdGhpcyB0byBiZSBMaW51cydzIHBy
ZWZlcmVkIHdvcmtmbG93LgoKU28sIHBsZWFzZSBzZW5kIHRoZSBuZXh0IGl0ZXJhdGlvbiBvZiB0
aGlzIGFnYWluc3QgZWl0aGVyCnBsYWludjUuMi1yYzUgb3IgdjUuMi1yYzUgbWVyZ2VkIHdpdGgg
aG1tLmdpdCBhbmQgSSdsbCBzb3J0IGl0IG91dC4KCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
