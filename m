Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F249200
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8D389FAC;
	Mon, 17 Jun 2019 21:09:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A789FAC
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 21:09:36 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x21so11145416otq.12
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 14:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJY8mRWNKYbMrxiqtcC6On1cSl2WUj/ZIwS4ootoQak=;
 b=Zv5iRX0b/lj+PcdR2xlc/i98CFpGcwl0BdEGGNueadUnWqdod9eJscNZblAN7QN6qZ
 8OWC7xFK8rCukHZZyCgdXS8Hc/BLLNcz9LK6onemUmHJEp0UpZQ8ZiVgcB/9MfntzMAN
 rsrRWVTNd+vmAQ17st7Na617ZliRY/kFh8QN0UJcQ1AMXa3WwPSrScKpx5/g4C0E4Ogx
 YlnfRCaRR0J6kYLkvv/TXh2iKJ+CPJttmwMjIEQb3J+ic1Dm2ixAktujf1cD5Q3phSxX
 N11h8N/tfzZcO3ksHzofbCaLFG4aqKPAIFpsxSsMvnVB3GcsXP4qF/6S17k2Qdspt5Av
 Vpog==
X-Gm-Message-State: APjAAAUHRi1PihmlZNrZPiBCVN9dDcfU598bVgCZp2gRVfpl5U/Gs+wx
 zkZoKI2Al15dWZsb38sOmt94u+7/151pP8U9+V95gg==
X-Google-Smtp-Source: APXvYqyAU1TcMvPiGYVYhBbyC0eVXwwhkAqKTWqXoLyuFCBz8f0kthsk9jFJXToSNfs33gSFBQCmV/94ID8R2le9oJQ=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr55835238otn.247.1560805775819; 
 Mon, 17 Jun 2019 14:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
 <20190617195526.GB20275@lst.de>
In-Reply-To: <20190617195526.GB20275@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 14:09:24 -0700
Message-ID: <CAPcyv4iYP-7QtO7hDkAeaxJsfUCrCTBSJi3bK6e5v-VVAKQz-w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJY8mRWNKYbMrxiqtcC6On1cSl2WUj/ZIwS4ootoQak=;
 b=1CPoHsv8eJYyjii0r2v+tpwEGCkSWwSYtZacx/AqtzGMRs3fZPgZrV7RbEeA45KDwP
 lsJvq7QgmiqEwVzp5wdQHibzWroOdc9btguH5MJ/BTdcEtQKRrkY2A644oJ5v1entk28
 jQX1i10dz7Bzaag9WMXeIi4g9aL/drgYMGhz0EwOOdHkXNcNmVY9Lux9aw2TbX6HsoFA
 rgd+c/SR//qS9xH7huYep7vdqcSElSiqUL7CnczUCly0wMqqGAQdyboSJvis9joomSOv
 KyK08LiIatM0igaxt5Yo3ksIlA7sTKvevIo1tgB6DFbvKhgZgBfO8B1hLUl5bdDehAB/
 2KGw==
Subject: Re: [Nouveau] [PATCH 08/25] memremap: move dev_pagemap callbacks
 into a separate structure
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
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTE6MzVBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gPiAtICAgICAgIHN0cnVjdCBkZXZfcGFnZW1hcCAq
cGdtYXAgPSBfcGdtYXA7Cj4gPgo+ID4gV2hvb3BzLCBuZWVkZWQgdG8ga2VlcCB0aGlzIGxpbmUg
dG8gYXZvaWQ6Cj4gPgo+ID4gdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jOjEwOTox
MTogZXJyb3I6IOKAmHBnbWFw4oCZIHVuZGVjbGFyZWQKPiA+IChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhfcGdtYXDigJk/Cj4KPiBTbyBJIHJlYWxseSBzaG91
bGRuJ3QgYmUgdHJpcHBpbmcgb3ZlciB0aGlzIGFueW1vcmUsIGJ1dCBjYW4gd2Ugc29tZWhvdwo+
IHRoaXMgbWVzcz8KPgo+ICAtIGF0IGxlYXN0IGFkZCBpdCB0byB0aGUgbm9ybWFsIGJ1aWxkIHN5
c3RlbSBhbmQga2NvbmZpZyBkZXBzIGluc3RlYWQKPiAgICBvZiBzdGFzaGluZyBpdCBhd2F5IHNv
IHRoYXQgdGhpbmdzIGxpa2UgYnVpbGRib3QgY2FuIGJ1aWxkIGl0Pwo+ICAtIGF0IGxlYXN0IGFs
bG93IGJ1aWxkaW5nIGl0ICh1bmRlciBDT01QSUxFX1RFU1QpIGlmIG5lZWRlZCBldmVuIHdoZW4K
PiAgICBwbWVtLmtvIGFuZCBmcmllbmRzIGFyZSBidWlsdCBpbiB0aGUga2VybmVsPwoKRG9uZTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTAwMDQ3Ny8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
