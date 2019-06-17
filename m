Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711404917B
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 22:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6D989F75;
	Mon, 17 Jun 2019 20:36:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8067089F73
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 20:36:57 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w196so7720797oie.7
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2019 13:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUuONrlgmwtIZdvsw0S0/4Mq9T1WyA1gy6J4VLXnacI=;
 b=dZum2w8RMpBdISpMmNDXWCmLcpqkn89Y9WxfG4Z8FWT2iO2CZIlcOkuwDUiO6z/+Ri
 FsnougzmlOfcJzkgozCs23Cme9YlnjWLfvx671QV/papK4ljmEjamMSS+NNA2lyxOkCZ
 jgLdMfdaVKCpKl+2unSghpPTvc3STMFOd+CCIZfata9nzVBOWoAPauD5VAuNriK3+krf
 VObUL3l2hWyAyBDcHHjNS1Pl3C1a5jWZmund8HJ8cKgfO+XsBGCy4cK8mxlq5J9/T31E
 Iu2UCQ424oU6gx9OSf9i/2qsA86/PuwDJTvuxNxW6O9P/4oItARUzAHUcP2zmZriqKHF
 9E0Q==
X-Gm-Message-State: APjAAAVsMAkbW3GLm+NVoDkw6dKuiRQEAII+ZKl1LSuKVQYEF2ggC2FU
 2vvwaJwhq62RKbwFh5Am//bkaCcCJpFn0Jh9zD7lcg==
X-Google-Smtp-Source: APXvYqyP6F9zlBzZPah8lr14kIAj+Xnb/4HPIraAg3Phba4tJ1HESSkAprhGKci8EGOWV3IPPT/MSOptYr7l5lvozUE=
X-Received: by 2002:aca:3006:: with SMTP id w6mr9263oiw.5.1560803816566; Mon,
 17 Jun 2019 13:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-8-hch@lst.de>
 <CAPcyv4hbGfOawfafqQ-L1CMr6OMFGmnDtdgLTXrgQuPxYNHA2w@mail.gmail.com>
 <20190617195404.GA20275@lst.de>
In-Reply-To: <20190617195404.GA20275@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 13:36:44 -0700
Message-ID: <CAPcyv4jhhEbLDi82gVw7GLASEtqU=U7Ty67AGwTijmzMqw8X8Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WUuONrlgmwtIZdvsw0S0/4Mq9T1WyA1gy6J4VLXnacI=;
 b=iJnOfDSpsfcRrkO7Z3UmtsU/3SdEZ7eTfjySEwglR4kCk3eP1rlaXEv8n0WSdyQhgA
 KaWNKrnvNbK3Ivdrsdf3WrCRENxklnMUOfkYt77DH4iUmhsBJjRM+eotXHjLnTJ0fpft
 IRATZl7xjDYDdLodZoW7pDj5e/et1XUyWXubUfGW4vRD1RKoqQhNZy2/KBjKy8cusMgh
 2woSBHrnLGC1xQF+N5ZRLi9uSQi5GRNsM2OXCHe8Pv4k1LMuUVnyUieU8WnCi9CQp/zd
 XBqL0kuZ9/hoegyaGxXD87pJJNEmxb5JL0BejjNLkP1oeIbdjPfVsh40yBVMT2gDQuUx
 ng8g==
Subject: Re: [Nouveau] [PATCH 07/25] memremap: validate the pagemap type
 passed to devm_memremap_pages
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
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6NTkgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTI6MDI6MDlQTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gTmVlZCBhIGxlYWQgaW4gcGF0Y2ggdGhhdCBpbnRy
b2R1Y2VzIE1FTU9SWV9ERVZJQ0VfREVWREFYLCBvdGhlcndpc2U6Cj4KPiBPciBtYXliZSBhIE1F
TU9SWV9ERVZJQ0VfREVGQVVMVCA9IDAgc2hhcmVkIGJ5IGZzZGF4IGFuZCBwMnBkbWE/CgpJIHRo
b3VnaHQgYWJvdXQgdGhhdCwgYnV0IGl0IHNlZW1zIGlzX3BjaV9wMnBkbWFfcGFnZSgpIG5lZWRz
IHRoZQpkaXN0aW5jdGlvbiBiZXR3ZWVuIHRoZSAyIHR5cGVzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
