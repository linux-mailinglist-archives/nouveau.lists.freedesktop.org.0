Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D795025F
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 08:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266F789991;
	Mon, 24 Jun 2019 06:33:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D2D892E6;
 Thu, 13 Jun 2019 19:53:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02a9a20000>; Thu, 13 Jun 2019 12:53:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 12:53:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 13 Jun 2019 12:53:06 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 19:53:02 +0000
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
Date: Thu, 13 Jun 2019 12:53:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190613194430.GY22062@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Jun 2019 06:33:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560455586; bh=Jb4g90Z1ba65oKYjTxGpf+f/32abJWQiXQLuIbWbzvY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fX5tey0oBNTieShQOoS4gHfsvizLQIZuWaHc6dzOwFFJidyDqIYU2AUhp266HRFrN
 XrtOPBnaSUAKElzDHFexziLEsf0mgRvYpwoaL4sSYsIU1LcKrpDAHjizgl/yJjcdl3
 p6Pf6shBbCxBVGLYCn7p1Sc7R72zptzPvDHZbEr82hLm46tnMp65GrRnZ3EbGnwLJz
 23lgDPGqY/fbBOf3AXToJKAO/Z8B9A4BRpstqapMwDkQOz+kz4JCB2SNVDQH0ir2MJ
 WzkLVK43aAga/2HoikuGF1iJ+5COBwso/r1BhSmM63r0HyIcQnSmXduf+EERM53rtq
 kwroL2mZCH2Jw==
Subject: Re: [Nouveau] [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDYvMTMvMTkgMTI6NDQgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUsIEp1
biAxMywgMjAxOSBhdCAxMTo0MzoyMUFNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
Pj4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRy
ZWUsIGFuZCBkb2Vzbid0Cj4+IGFwcGVhciB0byBhY3R1YWxseSBiZSB1c2FibGUuICBNYXJrIGl0
IGFzIEJST0tFTiB1bnRpbCBlaXRoZXIgYSB1c2VyCj4+IGNvbWVzIGFsb25nIG9yIHdlIGZpbmFs
bHkgZ2l2ZSB1cCBvbiBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4+ICAgbW0vS2NvbmZpZyB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcK
Pj4gaW5kZXggMGQyYmE3ZTFmNDNlLi40MDZmYTQ1ZTllY2MgMTAwNjQ0Cj4+ICsrKyBiL21tL0tj
b25maWcKPj4gQEAgLTcyMSw2ICs3MjEsNyBAQCBjb25maWcgREVWSUNFX1BSSVZBVEUKPj4gICBj
b25maWcgREVWSUNFX1BVQkxJQwo+PiAgIAlib29sICJBZGRyZXNzYWJsZSBkZXZpY2UgbWVtb3J5
IChsaWtlIEdQVSBtZW1vcnkpIgo+PiAgIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+PiArCWRl
cGVuZHMgb24gQlJPS0VOCj4+ICAgCXNlbGVjdCBITU0KPj4gICAJc2VsZWN0IERFVl9QQUdFTUFQ
X09QUwo+IAo+IFRoaXMgc2VlbXMgYSBiaXQgaGFyc2gsIHdlIGRvIGhhdmUgYW5vdGhlciBrY29u
ZmlnIHRoYXQgc2VsZWN0cyB0aGlzCj4gb25lIHRvZGF5Ogo+IAo+IGNvbmZpZyBEUk1fTk9VVkVB
VV9TVk0KPiAgICAgICAgICBib29sICIoRVhQRVJJTUVOVEFMKSBFbmFibGUgU1ZNIChTaGFyZWQg
VmlydHVhbCBNZW1vcnkpIHN1cHBvcnQiCj4gICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX0hBU19I
TU0KPiAgICAgICAgICBkZXBlbmRzIG9uIERSTV9OT1VWRUFVCj4gICAgICAgICAgZGVwZW5kcyBv
biBTVEFHSU5HCj4gICAgICAgICAgc2VsZWN0IEhNTV9NSVJST1IKPiAgICAgICAgICBzZWxlY3Qg
REVWSUNFX1BSSVZBVEUKPiAgICAgICAgICBkZWZhdWx0IG4KPiAgICAgICAgICBoZWxwCj4gICAg
ICAgICAgICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRvIGVuYWJsZSBleHBlcmltZW50YWwgc3Vw
cG9ydCBmb3IKPiAgICAgICAgICAgIFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSAoU1ZNKS4KPiAKPiBN
YXliZSBpdCBzaG91bGQgYmUgZGVwZW5kcyBvbiBTVEFHSU5HIG5vdCBicm9rZW4/Cj4gCj4gb3Ig
bWF5YmUgbm91dmVhdV9zdm0gZG9lc24ndCBhY3R1YWxseSBuZWVkIERFVklDRV9QUklWQVRFPwo+
IAo+IEphc29uCgpJIHRoaW5rIHlvdSBhcmUgY29uZnVzaW5nIERFVklDRV9QUklWQVRFIGZvciBE
RVZJQ0VfUFVCTElDLgpEUk1fTk9VVkVBVV9TVk0gZG9lcyB1c2UgREVWSUNFX1BSSVZBVEUgYnV0
IG5vdCBERVZJQ0VfUFVCTElDLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
