Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7B71D81
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 19:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5576E31D;
	Tue, 23 Jul 2019 17:18:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841276E31D
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 17:18:19 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id r3so29312565vsr.13
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 10:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0B8rPPy+2ZXzBZ5P/6QN4Hb9TBfPCAUoHiabvJr5FcE=;
 b=XDnpiOYx9ID2ZlTqKM2B/AuYwAb9iBhm4gEYw0IkaL64f9mHQNlaj0WQj9efN1EQ2B
 618mF2zaMB2tlowdS2EvFy8bQZ3OdN2rGLBhYJ/5RUxgr7w9Aj18YINDiMDkF1EQQa57
 05W8zgPYrf7ajxb8eg349X7SqUJTxCmbz9FUMRuddbhPgBSMINQa4a7S4Hy9elmTKWog
 EsuaovvLIhnh7rPPQo9EgZm35/xEdpcrJNlaWnVQcE2Xf84fyoecnxyijfgJynJ6VU0l
 eZhx6L/0owVCbQl54a8EItxUY94+aGDUn8DaLD+h3MVE4IUAEXd68fobvcSl1aLybPd6
 KBXw==
X-Gm-Message-State: APjAAAUavL4bwUC+Vbu9LTo4xqqm83GIo+m+M5L3PXjIOfpGHK65MlX1
 OsRIR+GQhdxs/lZ5hfuL5WnfYQ==
X-Google-Smtp-Source: APXvYqxuzXgliI3GFFRnGNkj/EgjQA5jk124NBKZFVu7wii1lUqI5vsy37of5hMl2W7MgMsFdFJF7A==
X-Received: by 2002:a67:1e44:: with SMTP id e65mr50704721vse.45.1563902298689; 
 Tue, 23 Jul 2019 10:18:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s67sm15723604vkb.30.2019.07.23.10.18.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jul 2019 10:18:18 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hpyQb-0002Yx-CQ; Tue, 23 Jul 2019 14:18:17 -0300
Date: Tue, 23 Jul 2019 14:18:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190723171817.GE15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-2-hch@lst.de>
 <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
 <20190723145441.GI15331@mellanox.com>
 <20190723161907.GB1655@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723161907.GB1655@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0B8rPPy+2ZXzBZ5P/6QN4Hb9TBfPCAUoHiabvJr5FcE=;
 b=TWoi52D8rfeqTBQSa1fcx6QWG63Ntk0exIFf5AUJVd3WTblBruQ+cylK1+Aq6U2g8I
 I7t4fdrtcdj5SN1bDc0/Kg0coJ86BhXzItFv8/tlfnAujkwPIO9ZZ2RjaZb7NUSbooI7
 3ltnRcDS0Wf4Dq2qNc6ARyJizVl0RXPIagQpi/49DQJufEQ7sgs3+URXsAHw1IKoV2Cz
 CStWHQDRV/RAeZ7idchpS6ZNJrNUZDt/3Eyjdita5OUUpQHlDwi9JI3k2/on6Wfa/hYW
 cRWNKC09OYoVLpdxT0M9vuFRG9rF1fqOAV+dU5wZlNcsyZrhEpXaXS46fiW0mqgmA7oc
 81tQ==
Subject: Re: [Nouveau] [PATCH 1/6] mm: always return EBUSY for invalid
 ranges in hmm_range_{fault, snapshot}
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-MM <linux-mm@kvack.org>, Souptick Joarder <jrdr.linux@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDY6MTk6MDdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6NTQ6NDVQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSSB0aGluayB3aXRob3V0IHRoZSBjb21taXQgbWVzc2Fn
ZSBJIHdvdWxkbid0IGhhdmUgYmVlbiBhYmxlIHRvCj4gPiB1bmRlcnN0YW5kIHRoYXQsIHNvIENo
cmlzdG9waCwgY291bGQgeW91IGFsc28gYWRkIHRoZSBjb21tZW50IGJlbG93Cj4gPiBwbGVhc2U/
Cj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGJlbG9uZ3MgaW50byB0aGlzIHBhdGNoLiAgSSBjYW4g
YWRkIGl0IGFzIGEgc2VwYXJhdGUKPiBwYXRjaCB1bmRlciB5b3VyIG5hbWUgYW5kIHdpdGggeW91
ciBzaWdub2ZmIGlmIHlvdSBhcmUgb2sgd2l0aCB0aGF0LgoKWWVwLCB0aGFua3MKCkphc29uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
