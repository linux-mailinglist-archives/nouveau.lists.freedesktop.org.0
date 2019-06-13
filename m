Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250150256
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 08:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6EE8991C;
	Mon, 24 Jun 2019 06:33:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8AE89291
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 20:24:57 +0000 (UTC)
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.132])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hbW7f-00041s-Vm; Thu, 13 Jun 2019 14:15:00 -0600
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-8-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <4ff7926e-7021-7b7f-93b4-c745055d06b5@deltatee.com>
Date: Thu, 13 Jun 2019 14:14:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-8-hch@lst.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.80.180
X-SA-Exim-Rcpt-To: nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvdimm@lists.01.org, bskeggs@redhat.com,
 jgg@mellanox.com, jglisse@redhat.com, dan.j.williams@intel.com, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Mon, 24 Jun 2019 06:33:28 +0000
Subject: Re: [Nouveau] [PATCH 07/22] memremap: move dev_pagemap callbacks
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA2LTEzIDM6NDMgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVGhl
IGRldl9wYWdlbWFwIGlzIGEgZ3Jvd2luZyB0b28gbWFueSBjYWxsYmFja3MuICBNb3ZlIHRoZW0g
aW50byBhCj4gc2VwYXJhdGUgb3BzIHN0cnVjdHVyZSBzbyB0aGF0IHRoZXkgYXJlIG5vdCBkdXBs
aWNhdGVkIGZvciBtdWx0aXBsZQo+IGluc3RhbmNlcywgYW5kIGFuIGF0dGFja2VyIGNhbid0IGVh
c2lseSBvdmVyd3JpdGUgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgZHJpdmVycy9kYXgvZGV2aWNlLmMgICAgICAgICAgICAg
IHwgIDYgKysrKystCj4gIGRyaXZlcnMvbnZkaW1tL3BtZW0uYyAgICAgICAgICAgICB8IDE4ICsr
KysrKysrKysrKystLS0tLQo+ICBkcml2ZXJzL3BjaS9wMnBkbWEuYyAgICAgICAgICAgICAgfCAg
NSArKysrLQo+ICBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggICAgICAgICAgfCAyOSArKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQo+ICBrZXJuZWwvbWVtcmVtYXAuYyAgICAgICAgICAgICAg
ICAgfCAxMiArKysrKystLS0tLS0KPiAgbW0vaG1tLmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggKysrKysrLS0KPiAgdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jIHwgIDIg
Ky0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkK
Ckxvb2tzIGdvb2QgdG8gbWUsCgpSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdA
ZGVsdGF0ZWUuY29tPgoKTG9nYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
