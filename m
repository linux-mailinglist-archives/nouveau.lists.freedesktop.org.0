Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEAB50259
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 08:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CDC899A3;
	Mon, 24 Jun 2019 06:33:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845CD89291
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 20:24:57 +0000 (UTC)
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.132])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hbW5G-00040b-8N; Thu, 13 Jun 2019 14:12:31 -0600
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-9-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <d9e24f8e-986d-e7b8-cf1d-9344ba51719e@deltatee.com>
Date: Thu, 13 Jun 2019 14:12:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-9-hch@lst.de>
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
Subject: Re: [Nouveau] [PATCH 08/22] memremap: pass a struct dev_pagemap to
 ->kill
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

CgpPbiAyMDE5LTA2LTEzIDM6NDMgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gUGFz
c2luZyB0aGUgYWN0dWFsIHR5cGVkIHN0cnVjdHVyZSBsZWFkcyB0byBtb3JlIHVuZGVyc3RhbmRh
YmxlIGNvZGUKPiB2cyB0aGUgYWN0dWFsIHJlZmVyZW5jZXMuCgpIYSwgb2ssIEkgb3JpZ2luYWxs
eSBzdWdnZXN0ZWQgdGhpcyB0byBEYW4gd2hlbiBoZSBpbnRyb2R1Y2VkIHRoZQpjYWxsYmFja1sx
XS4KClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+CgpM
b2dhbgoKWzFdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOGYwY2FlODItMTMwZi04YTY0
LWNmYmQtZmRhNWZkNzZiYjc5QGRlbHRhdGVlLmNvbS9ULyN1CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
