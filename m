Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A456079CC6
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 01:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BF889DEC;
	Mon, 29 Jul 2019 23:26:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C5389DB5;
 Mon, 29 Jul 2019 23:26:27 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f809a0000>; Mon, 29 Jul 2019 16:26:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:26:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jul 2019 16:26:27 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:26:22 +0000
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-6-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <0c07ed9b-96c3-ec06-c6c5-1676f5c91eda@nvidia.com>
Date: Mon, 29 Jul 2019 16:26:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-6-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564442778; bh=G1LxFP21VZwF9eYr/zeeq4GDQS7/44MoewdM+HDB/gs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jqHrHACFZoBWZhi9/KhmjsswxPPZKCo1ogM0BBbLeMCZvjL3ndhiINa06G8EJiKN0
 aAX6fVNQjvjapU5IucYrQ/PhBYE8Qx8c/sAOM4QU2qCASBFP0gD+tFx8UFSUk3i3Vl
 Ejuy9i1TcRUJWr0F1IrRz7TBdUQ6qgEl08TNpNkTIJ20D/ALypTrxp2C4WBZe/N3IQ
 +rxP8muTU6k5kEqB0rS9hBGrI6xFyzE5OLjvnvIJ4gHOqTQfOb4sC+hatCAD90TaTt
 5vaMEs4XyJ3e5wjJbW542SA46PeXPAEYqnOPmpWBLVIjTs5u4ZF0eW+xVkHRO57m6t
 0McRcwIAbGuLQ==
Subject: Re: [Nouveau] [PATCH 5/9] nouveau: simplify
 nouveau_dmem_migrate_to_ram
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gRmFjdG9yIHRo
ZSBtYWluIGNvcHkgcGFnZSB0byByYW0gcm91dGluZSBvdXQgaW50byBhIGhlbHBlciB0aGF0IGFj
dHMgb24KPiBhIHNpbmdsZSBwYWdlIGFuZCB3aGljaCBkb2Vzbid0IHJlcXVpcmUgdGhlIG5vdXZl
YXVfZG1lbV9mYXVsdAo+IHN0cnVjdHVyZSBmb3IgYXJndW1lbnQgcGFzc2luZy4gIEFsc28gcmVt
b3ZlIHRoZSBsb29wIG92ZXIgbXVsdGlwbGUKPiBwYWdlcyBhcyB3ZSBvbmx5IGhhbmRsZSBvbmUg
YXQgdGhlIG1vbWVudCwgYWx0aG91Z2ggdGhlIHN0cnVjdHVyZSBvZgo+IHRoZSBtYWluIHdvcmtl
ciBmdW5jdGlvbiBtYWtlcyBpdCByZWxhdGl2ZWx5IGVhc3kgdG8gYWRkIG11bHRpIHBhZ2UKPiBz
dXBwb3J0IGJhY2sgaWYgbmVlZGVkIGluIHRoZSBmdXR1cmUuICBCdXQgYXQgbGVhc3QgZm9yIG5v
dyB0aGlzIGF2b2lkCj4gdGhlIG5lZWRlZCB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIHRoZSBkbWEgYWRkcmVzc2VzIGluCj4gd2hhdCBpcyBlc3NlbnRpYWxseSB0aGUgcGFnZSBm
YXVsdCBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgoKUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDE1OCAr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKSwgMTE5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZG1lbS5jCj4gaW5kZXggMjEwNTJhNGFhZjY5Li4wMzZlNmMwN2Q0ODkgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+IEBAIC04NiwxMyArODYsNiBAQCBzdGF0aWMg
aW5saW5lIHN0cnVjdCBub3V2ZWF1X2RtZW0gKnBhZ2VfdG9fZG1lbShzdHJ1Y3QgcGFnZSAqcGFn
ZSkKPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKHBhZ2UtPnBnbWFwLCBzdHJ1Y3Qgbm91dmVhdV9k
bWVtLCBwYWdlbWFwKTsKPiAgIH0KPiAgIAo+IC1zdHJ1Y3Qgbm91dmVhdV9kbWVtX2ZhdWx0IHsK
PiAtCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtOwo+IC0Jc3RydWN0IG5vdXZlYXVfZmVuY2UgKmZl
bmNlOwo+IC0JZG1hX2FkZHJfdCAqZG1hOwo+IC0JdW5zaWduZWQgbG9uZyBucGFnZXM7Cj4gLX07
Cj4gLQo+ICAgc3RydWN0IG5vdXZlYXVfbWlncmF0ZSB7Cj4gICAJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWE7Cj4gICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gQEAgLTE0NiwxMzAgKzEz
OSw1NSBAQCBzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1fZmVuY2VfZG9uZShzdHJ1Y3Qgbm91dmVh
dV9mZW5jZSAqKmZlbmNlKQo+ICAgCX0KPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZAo+IC1ub3V2
ZWF1X2RtZW1fZmF1bHRfYWxsb2NfYW5kX2NvcHkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
Cj4gLQkJCQkgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKnNyY19wZm5zLAo+IC0JCQkJICB1bnNpZ25l
ZCBsb25nICpkc3RfcGZucywKPiAtCQkJCSAgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAtCQkJCSAg
dW5zaWduZWQgbG9uZyBlbmQsCj4gLQkJCQkgIHN0cnVjdCBub3V2ZWF1X2RtZW1fZmF1bHQgKmZh
dWx0KQo+ICtzdGF0aWMgdm1fZmF1bHRfdCBub3V2ZWF1X2RtZW1fZmF1bHRfY29weV9vbmUoc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gKwkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVu
c2lnbmVkIGxvbmcgYWRkciwKPiArCQl1bnNpZ25lZCBsb25nIHNyYywgdW5zaWduZWQgbG9uZyAq
ZHN0LCBkbWFfYWRkcl90ICpkbWFfYWRkcikKPiAgIHsKPiAtCXN0cnVjdCBub3V2ZWF1X2RybSAq
ZHJtID0gZmF1bHQtPmRybTsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkcm0tPmRldi0+ZGV2
Owo+IC0JdW5zaWduZWQgbG9uZyBhZGRyLCBpLCBucGFnZXMgPSAwOwo+IC0Jbm91dmVhdV9taWdy
YXRlX2NvcHlfdCBjb3B5Owo+IC0JaW50IHJldDsKPiAtCj4gLQo+IC0JLyogRmlyc3QgYWxsb2Nh
dGUgbmV3IG1lbW9yeSAqLwo+IC0JZm9yIChhZGRyID0gc3RhcnQsIGkgPSAwOyBhZGRyIDwgZW5k
OyBhZGRyICs9IFBBR0VfU0laRSwgaSsrKSB7Cj4gLQkJc3RydWN0IHBhZ2UgKmRwYWdlLCAqc3Bh
Z2U7Cj4gLQo+IC0JCWRzdF9wZm5zW2ldID0gMDsKPiAtCQlzcGFnZSA9IG1pZ3JhdGVfcGZuX3Rv
X3BhZ2Uoc3JjX3BmbnNbaV0pOwo+IC0JCWlmICghc3BhZ2UgfHwgIShzcmNfcGZuc1tpXSAmIE1J
R1JBVEVfUEZOX01JR1JBVEUpKQo+IC0JCQljb250aW51ZTsKPiArCXN0cnVjdCBwYWdlICpkcGFn
ZSwgKnNwYWdlOwo+ICAgCj4gLQkJZHBhZ2UgPSBhbGxvY19wYWdlX3ZtYShHRlBfSElHSFVTRVIs
IHZtYSwgYWRkcik7Cj4gLQkJaWYgKCFkcGFnZSkgewo+IC0JCQlkc3RfcGZuc1tpXSA9IE1JR1JB
VEVfUEZOX0VSUk9SOwo+IC0JCQljb250aW51ZTsKPiAtCQl9Cj4gLQkJbG9ja19wYWdlKGRwYWdl
KTsKPiAtCj4gLQkJZHN0X3BmbnNbaV0gPSBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkp
IHwKPiAtCQkJICAgICAgTUlHUkFURV9QRk5fTE9DS0VEOwo+IC0JCW5wYWdlcysrOwo+IC0JfQo+
ICsJc3BhZ2UgPSBtaWdyYXRlX3Bmbl90b19wYWdlKHNyYyk7Cj4gKwlpZiAoIXNwYWdlIHx8ICEo
c3JjICYgTUlHUkFURV9QRk5fTUlHUkFURSkpCj4gKwkJcmV0dXJuIDA7Cj4gICAKPiAtCS8qIEFs
bG9jYXRlIHN0b3JhZ2UgZm9yIERNQSBhZGRyZXNzZXMsIHNvIHdlIGNhbiB1bm1hcCBsYXRlci4g
Ki8KPiAtCWZhdWx0LT5kbWEgPSBrbWFsbG9jKHNpemVvZigqZmF1bHQtPmRtYSkgKiBucGFnZXMs
IEdGUF9LRVJORUwpOwo+IC0JaWYgKCFmYXVsdC0+ZG1hKQo+ICsJZHBhZ2UgPSBhbGxvY19wYWdl
X3ZtYShHRlBfSElHSFVTRVIsIGFyZ3MtPnZtYSwgYWRkcik7Cj4gKwlpZiAoIWRwYWdlKQo+ICAg
CQlnb3RvIGVycm9yOwo+ICsJbG9ja19wYWdlKGRwYWdlKTsKPiAgIAo+IC0JLyogQ29weSB0aGlu
Z3Mgb3ZlciAqLwo+IC0JY29weSA9IGRybS0+ZG1lbS0+bWlncmF0ZS5jb3B5X2Z1bmM7Cj4gLQlm
b3IgKGFkZHIgPSBzdGFydCwgaSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBp
KyspIHsKPiAtCQlzdHJ1Y3QgcGFnZSAqc3BhZ2UsICpkcGFnZTsKPiAtCj4gLQkJZHBhZ2UgPSBt
aWdyYXRlX3Bmbl90b19wYWdlKGRzdF9wZm5zW2ldKTsKPiAtCQlpZiAoIWRwYWdlIHx8IGRzdF9w
Zm5zW2ldID09IE1JR1JBVEVfUEZOX0VSUk9SKQo+IC0JCQljb250aW51ZTsKPiAtCj4gLQkJc3Bh
Z2UgPSBtaWdyYXRlX3Bmbl90b19wYWdlKHNyY19wZm5zW2ldKTsKPiAtCQlpZiAoIXNwYWdlIHx8
ICEoc3JjX3BmbnNbaV0gJiBNSUdSQVRFX1BGTl9NSUdSQVRFKSkgewo+IC0JCQlkc3RfcGZuc1tp
XSA9IE1JR1JBVEVfUEZOX0VSUk9SOwo+IC0JCQlfX2ZyZWVfcGFnZShkcGFnZSk7Cj4gLQkJCWNv
bnRpbnVlOwo+IC0JCX0KPiAtCj4gLQkJZmF1bHQtPmRtYVtmYXVsdC0+bnBhZ2VzXSA9Cj4gLQkJ
CWRtYV9tYXBfcGFnZV9hdHRycyhkZXYsIGRwYWdlLCAwLCBQQUdFX1NJWkUsCj4gLQkJCQkJICAg
UENJX0RNQV9CSURJUkVDVElPTkFMLAo+IC0JCQkJCSAgIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMp
Owo+IC0JCWlmIChkbWFfbWFwcGluZ19lcnJvcihkZXYsIGZhdWx0LT5kbWFbZmF1bHQtPm5wYWdl
c10pKSB7Cj4gLQkJCWRzdF9wZm5zW2ldID0gTUlHUkFURV9QRk5fRVJST1I7Cj4gLQkJCV9fZnJl
ZV9wYWdlKGRwYWdlKTsKPiAtCQkJY29udGludWU7Cj4gLQkJfQo+IC0KPiAtCQlyZXQgPSBjb3B5
KGRybSwgMSwgTk9VVkVBVV9BUEVSX0hPU1QsCj4gLQkJCQlmYXVsdC0+ZG1hW2ZhdWx0LT5ucGFn
ZXMrK10sCj4gLQkJCQlOT1VWRUFVX0FQRVJfVlJBTSwKPiAtCQkJCW5vdXZlYXVfZG1lbV9wYWdl
X2FkZHIoc3BhZ2UpKTsKPiAtCQlpZiAocmV0KSB7Cj4gLQkJCWRzdF9wZm5zW2ldID0gTUlHUkFU
RV9QRk5fRVJST1I7Cj4gLQkJCV9fZnJlZV9wYWdlKGRwYWdlKTsKPiAtCQkJY29udGludWU7Cj4g
LQkJfQo+IC0JfQo+ICsJKmRtYV9hZGRyID0gZG1hX21hcF9wYWdlKGRldiwgZHBhZ2UsIDAsIFBB
R0VfU0laRSwgRE1BX0JJRElSRUNUSU9OQUwpOwo+ICsJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRl
diwgKmRtYV9hZGRyKSkKPiArCQlnb3RvIGVycm9yX2ZyZWVfcGFnZTsKPiAgIAo+IC0Jbm91dmVh
dV9mZW5jZV9uZXcoZHJtLT5kbWVtLT5taWdyYXRlLmNoYW4sIGZhbHNlLCAmZmF1bHQtPmZlbmNl
KTsKPiArCWlmIChkcm0tPmRtZW0tPm1pZ3JhdGUuY29weV9mdW5jKGRybSwgMSwgTk9VVkVBVV9B
UEVSX0hPU1QsICpkbWFfYWRkciwKPiArCQkJTk9VVkVBVV9BUEVSX1ZSQU0sIG5vdXZlYXVfZG1l
bV9wYWdlX2FkZHIoc3BhZ2UpKSkKPiArCQlnb3RvIGVycm9yX2RtYV91bm1hcDsKPiAgIAo+IC0J
cmV0dXJuOwo+ICsJKmRzdCA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9fcGZuKGRwYWdlKSkgfCBNSUdS
QVRFX1BGTl9MT0NLRUQ7CgpOZWVkIGEgInJldHVybiAwOyIgaGVyZSBvciB5b3UgdW5kbyB0aGUg
d29yayBkb25lLgoKPiAgIAo+ICtlcnJvcl9kbWFfdW5tYXA6Cj4gKwlkbWFfdW5tYXBfcGFnZShk
ZXYsICpkbWFfYWRkciwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gK2Vycm9yX2Zy
ZWVfcGFnZToKPiArCV9fZnJlZV9wYWdlKGRwYWdlKTsKPiAgIGVycm9yOgo+IC0JZm9yIChhZGRy
ID0gc3RhcnQsIGkgPSAwOyBhZGRyIDwgZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgKytpKSB7Cj4g
LQkJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gLQo+IC0JCWlmICghZHN0X3BmbnNbaV0gfHwgZHN0X3Bm
bnNbaV0gPT0gTUlHUkFURV9QRk5fRVJST1IpCj4gLQkJCWNvbnRpbnVlOwo+IC0KPiAtCQlwYWdl
ID0gbWlncmF0ZV9wZm5fdG9fcGFnZShkc3RfcGZuc1tpXSk7Cj4gLQkJZHN0X3BmbnNbaV0gPSBN
SUdSQVRFX1BGTl9FUlJPUjsKPiAtCQlpZiAocGFnZSA9PSBOVUxMKQo+IC0JCQljb250aW51ZTsK
PiAtCj4gLQkJX19mcmVlX3BhZ2UocGFnZSk7Cj4gLQl9Cj4gLX0KPiAtCj4gLXN0YXRpYyB2b2lk
Cj4gLW5vdXZlYXVfZG1lbV9mYXVsdF9maW5hbGl6ZV9hbmRfbWFwKHN0cnVjdCBub3V2ZWF1X2Rt
ZW1fZmF1bHQgKmZhdWx0KQo+IC17Cj4gLQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IGZhdWx0
LT5kcm07Cj4gLQo+IC0Jbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJmZhdWx0LT5mZW5jZSk7Cj4g
LQo+IC0Jd2hpbGUgKGZhdWx0LT5ucGFnZXMtLSkgewo+IC0JCWRtYV91bm1hcF9wYWdlKGRybS0+
ZGV2LT5kZXYsIGZhdWx0LT5kbWFbZmF1bHQtPm5wYWdlc10sCj4gLQkJCSAgICAgICBQQUdFX1NJ
WkUsIFBDSV9ETUFfQklESVJFQ1RJT05BTCk7Cj4gLQl9Cj4gLQlrZnJlZShmYXVsdC0+ZG1hKTsK
PiArCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2bV9mYXVs
dF90IG5vdXZlYXVfZG1lbV9taWdyYXRlX3RvX3JhbShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiAg
IHsKPiAgIAlzdHJ1Y3Qgbm91dmVhdV9kbWVtICpkbWVtID0gcGFnZV90b19kbWVtKHZtZi0+cGFn
ZSk7Cj4gLQl1bnNpZ25lZCBsb25nIHNyY1sxXSA9IHswfSwgZHN0WzFdID0gezB9Owo+ICsJc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0gPSBkbWVtLT5kcm07Cj4gKwlzdHJ1Y3Qgbm91dmVhdV9mZW5j
ZSAqZmVuY2U7Cj4gKwl1bnNpZ25lZCBsb25nIHNyYyA9IDAsIGRzdCA9IDA7Cj4gKwlkbWFfYWRk
cl90IGRtYV9hZGRyID0gMDsKPiArCXZtX2ZhdWx0X3QgcmV0Owo+ICAgCXN0cnVjdCBtaWdyYXRl
X3ZtYSBhcmdzID0gewo+ICAgCQkudm1hCQk9IHZtZi0+dm1hLAo+ICAgCQkuc3RhcnQJCT0gdm1m
LT5hZGRyZXNzLAo+ICAgCQkuZW5kCQk9IHZtZi0+YWRkcmVzcyArIFBBR0VfU0laRSwKPiAtCQku
c3JjCQk9IHNyYywKPiAtCQkuZHN0CQk9IGRzdCwKPiArCQkuc3JjCQk9ICZzcmMsCj4gKwkJLmRz
dAkJPSAmZHN0LAo+ICAgCX07Cj4gLQlzdHJ1Y3Qgbm91dmVhdV9kbWVtX2ZhdWx0IGZhdWx0ID0g
eyAuZHJtID0gZG1lbS0+ZHJtIH07Cj4gICAKPiAgIAkvKgo+ICAgCSAqIEZJWE1FIHdoYXQgd2Ug
cmVhbGx5IHdhbnQgaXMgdG8gZmluZCBzb21lIGhldXJpc3RpYyB0byBtaWdyYXRlIG1vcmUKPiBA
QCAtMjgxLDE2ICsxOTksMTggQEAgc3RhdGljIHZtX2ZhdWx0X3Qgbm91dmVhdV9kbWVtX21pZ3Jh
dGVfdG9fcmFtKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICAgCWlmICghYXJncy5jcGFnZXMpCj4g
ICAJCXJldHVybiAwOwo+ICAgCj4gLQlub3V2ZWF1X2RtZW1fZmF1bHRfYWxsb2NfYW5kX2NvcHko
YXJncy52bWEsIHNyYywgZHN0LCBhcmdzLnN0YXJ0LAo+IC0JCQlhcmdzLmVuZCwgJmZhdWx0KTsK
PiAtCW1pZ3JhdGVfdm1hX3BhZ2VzKCZhcmdzKTsKPiAtCW5vdXZlYXVfZG1lbV9mYXVsdF9maW5h
bGl6ZV9hbmRfbWFwKCZmYXVsdCk7Cj4gKwlyZXQgPSBub3V2ZWF1X2RtZW1fZmF1bHRfY29weV9v
bmUoZHJtLCB2bWYtPnZtYSwgdm1mLT5hZGRyZXNzLCBzcmMsCj4gKwkJCSZkc3QsICZkbWFfYWRk
cik7Cj4gKwlpZiAocmV0IHx8IGRzdCA9PSAwKQo+ICsJCWdvdG8gZG9uZTsKPiAgIAo+ICsJbm91
dmVhdV9mZW5jZV9uZXcoZG1lbS0+bWlncmF0ZS5jaGFuLCBmYWxzZSwgJmZlbmNlKTsKPiArCW1p
Z3JhdGVfdm1hX3BhZ2VzKCZhcmdzKTsKPiArCW5vdXZlYXVfZG1lbV9mZW5jZV9kb25lKCZmZW5j
ZSk7Cj4gKwlkbWFfdW5tYXBfcGFnZShkcm0tPmRldi0+ZGV2LCBkbWFfYWRkciwgUEFHRV9TSVpF
LCBETUFfQklESVJFQ1RJT05BTCk7Cj4gK2RvbmU6Cj4gICAJbWlncmF0ZV92bWFfZmluYWxpemUo
JmFyZ3MpOwo+IC0JaWYgKGRzdFswXSA9PSBNSUdSQVRFX1BGTl9FUlJPUikKPiAtCQlyZXR1cm4g
Vk1fRkFVTFRfU0lHQlVTOwo+IC0KPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIHJldDsKPiAgIH0K
PiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcGFnZW1hcF9vcHMgbm91dmVhdV9kbWVt
X3BhZ2VtYXBfb3BzID0gewo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
