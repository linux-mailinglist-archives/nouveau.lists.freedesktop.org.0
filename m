Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050445152
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 03:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD212892E4;
	Fri, 14 Jun 2019 01:48:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1D892E4;
 Fri, 14 Jun 2019 01:47:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02fcce0000>; Thu, 13 Jun 2019 18:47:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 18:47:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 18:47:58 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 01:47:57 +0000
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d83280b5-8cca-3b28-1727-58a70648e2b9@nvidia.com>
Date: Thu, 13 Jun 2019 18:47:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-6-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560476879; bh=W7HIzAAq5sQ4cds9yVoSXH+lwR7EoHWX9W6ILDXWS68=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=I8MPAgx2vYT6KwhZqE7Iz0XmBDUAPkhjJ2muXoBXvyuvRRzqt+N/vYMC8nbdYG25/
 WSlmXfyDpPT5QeLCb+OCPbYjTfqvYqP4DCyLjNUFaxdOx4cGM1afGuLLi0esWZSgMu
 A8GQ9BiCgUF44kc2o88bVgpXE3mC+ZezmwWJQmLHcMqWujgPfAbqMUvlo+s7Iiq7sU
 WHoYSAAnR0/4orH9jeAbwNklddZnxg4UewSkrDUWY6MGnu9yd4bNKuRV1sh4wBzCNg
 U+IAYEyyzX1/h2C96Uiqk0lQ+n/ZSuk409t8qWCUpSU856fphT2d9dv2ddj3jG5GUT
 /1wLT1eB7j1+w==
Subject: Re: [Nouveau] [PATCH 05/22] mm: export alloc_pages_vma
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSAyOjQzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBub3ZlYXUgaXMg
Y3VycmVudGx5IHVzaW5nIHRoaXMgdGhyb3VnaCBhbiBvZGQgaG1tIHdyYXBwZXIsIGFuZCBJIHBs
YW4KCiAgIm5vdXZlYXUiCgo+IHRvIHN3aXRjaCBpdCB0byB0aGUgcmVhbCB0aGluZyBsYXRlciBp
biB0aGlzIHNlcmllcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KPiAtLS0KClJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+IAoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQoKPiAgbW0vbWVtcG9saWN5
LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdp
dCBhL21tL21lbXBvbGljeS5jIGIvbW0vbWVtcG9saWN5LmMKPiBpbmRleCAwMTYwMGQ4MGFlMDEu
LmY5MDIzYjVmYmEzNyAxMDA2NDQKPiAtLS0gYS9tbS9tZW1wb2xpY3kuYwo+ICsrKyBiL21tL21l
bXBvbGljeS5jCj4gQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3ZtYShnZnBfdCBn
ZnAsIGludCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gIG91dDoKPiAgCXJl
dHVybiBwYWdlOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGFsbG9jX3BhZ2VzX3ZtYSk7Cj4g
IAo+ICAvKioKPiAgICogCWFsbG9jX3BhZ2VzX2N1cnJlbnQgLSBBbGxvY2F0ZSBwYWdlcy4KPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
