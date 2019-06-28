Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503D5A4AD
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 20:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E256E982;
	Fri, 28 Jun 2019 18:59:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AED6E4DE
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 18:59:30 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r21so6344018otq.6
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 11:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZKi8dPs5bce5TA+lDYDR67LZgo76bXK/epIzKFvivc=;
 b=ntIUkYiJzJ0PKtpCcteyKolaMycMpOl7e9xpULhaICyjQnT+snBn79mVGdBGoNURNk
 W4LL9u6ODgX9R5Ah0cTA/tfOLplbzAzWWLE2xtnarm8IveP5MVnQvZXvCDdPZJFyigwk
 hBi2AVNR9g7d3pTuUvzRkoEVVzNxXVX9cTC2k7Rns3pMhO2oUthJg9W9rWPEUQSZz0qz
 NVHuH77EAWW2S8jq8psGeCNm8DPovarBgOw4KsE5mQei93WGhsI9GQjyiFg+jqtiJXgX
 oPK1b/IcNbi2jy1xX+vdtqXIrkUet4bXgDl5xE6srQkdzBfVpUyBbuYCkLDroxI4QjB2
 +I4g==
X-Gm-Message-State: APjAAAVg9x+N3cwTxyUlSjUWH6q2bKZjRIAN1OD6IkuwxpLcxI8OIfRa
 +g5vWs6TKv7zgvsQuNrtiEmd6EfeFpfRSiugra+JEg==
X-Google-Smtp-Source: APXvYqxUAlE0PhQVf+kI2qGh3xwcV/BdcPGn6HCqEnYJmqo0MIx4gI+EfnCAuColBmsblnHh366HyPqaX1Z8NdWYLok=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr8858325otn.247.1561748370285; 
 Fri, 28 Jun 2019 11:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
In-Reply-To: <20190628185152.GA9117@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 11:59:19 -0700
Message-ID: <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xZKi8dPs5bce5TA+lDYDR67LZgo76bXK/epIzKFvivc=;
 b=w73nxePK59nSfEruxrF1M0kHpQTfXV+T0BR3rvgPNUWzxDsJQPeaM7uFD7eKRrxE9Y
 9ImwGmBtt6yXJ6nlctHx0FbYi1ua/8g/5ZblEqYZrPEU8IkQx9AAwyacMH73KkUPSZW4
 2CnxLw8FBn5LZR6QuLzXXkPegk+n9WnVTkvOy7EQwUeDTJ/KqrjyTyioxg0mlKF5l5Fl
 pBgbtoepm7/tvV+XTP8uNL6F6V5682w/nGp9yu+fmrqAAOl3CXi6A8E63DaUmygnIHBK
 Lo3TxfO9CsdVEHmVkApvqnki+XHSFnPPV047Ep963nO0SUi6VwELdrivAHXWP8JUXEYH
 XM8g==
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NTIgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NDQ6MzVBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gVGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIHNl
cmllcyBpbiBDSCdzIHRyZWUuIEl0IHJlbW92ZXMgdGhlCj4gPiAtPnBhZ2VfZnJlZSgpIGNhbGxi
YWNrIGZyb20gdGhlIHJlbGVhc2VfcGFnZXMoKSBwYXRoIGJlY2F1c2UgaXQgZ29lcwo+ID4gdG9v
IGZhciBhbmQgcmVtb3ZlcyB0aGUgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKSBjYWxsLgo+Cj4g
cmVsZWFzZV9wYWdlcyBvbmx5IGNhbGxlZCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSBmb3IgZGV2
aWNlIHB1YmxpYwo+IHBhZ2VzLiAgU28gSSBjYW4ndCBzZWUgaG93IHRoYXQgaXMgaW4gYW55IHdh
eSBhIHByb2JsZW0uCgpJdCdzIGEgYnVnIHRoYXQgdGhlIGNhbGwgdG8gcHV0X2Rldm1hcF9tYW5h
Z2VkX3BhZ2UoKSB3YXMgZ2F0ZWQgYnkKTUVNT1JZX0RFVklDRV9QVUJMSUMgaW4gcmVsZWFzZV9w
YWdlcygpLiBUaGF0IHBhdGggaXMgYWxzbyBhcHBsaWNhYmxlCnRvIE1FTU9SWV9ERVZJQ0VfRlNE
QVggYmVjYXVzZSBpdCBuZWVkcyB0byB0cmlnZ2VyIHRoZSAtPnBhZ2VfZnJlZSgpCmNhbGxiYWNr
IHRvIHdha2UgdXAgd2FpdF9vbl92YXIoKSB2aWEgZnNkYXhfcGFnZWZyZWUoKS4KClNvIEkgZ3Vl
c3MgeW91IGNvdWxkIGFyZ3VlIHRoYXQgdGhlIE1FTU9SWV9ERVZJQ0VfUFVCTElDIHJlbW92YWwg
cGF0Y2gKbGVmdCB0aGUgb3JpZ2luYWwgYnVnIGluIHBsYWNlLiBJbiB0aGF0IHNlbnNlIHdlJ3Jl
IG5vIHdvcnNlIG9mZiwgYnV0CnNpbmNlIHdlIGtub3cgYWJvdXQgdGhlIGJ1ZywgdGhlIGZpeCBh
bmQgdGhlIHBhdGNoZXMgaGF2ZSBub3QgYmVlbgphcHBsaWVkIHlldCwgd2h5IG5vdCBmaXggaXQg
bm93PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
