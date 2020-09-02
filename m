Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326825B644
	for <lists+nouveau@lfdr.de>; Thu,  3 Sep 2020 00:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2866E0EA;
	Wed,  2 Sep 2020 22:02:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3F46E0EA
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 22:02:45 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5016550000>; Wed, 02 Sep 2020 15:01:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 02 Sep 2020 15:02:44 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 02 Sep 2020 15:02:44 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 2 Sep 2020 22:02:43 +0000
To: Zi Yan <ziy@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
 <20200902165830.5367-2-rcampbell@nvidia.com>
 <78B69571-13C6-4BF5-8478-6AAA4AB2C287@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <171f31cd-91e5-5c74-a68a-ec7cbd9bb450@nvidia.com>
Date: Wed, 2 Sep 2020 15:02:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <78B69571-13C6-4BF5-8478-6AAA4AB2C287@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599084117; bh=kkuRtxf1vezbhGt7LWXFhp9w3lxcVmX2TYTJjhJna0A=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=PYlXhRotiQZLfTXQ3wUKaNi2lAIqWGmhDdY0PnXG5Z+lN/QCMYFo0RG5cTDV6WwFH
 CnfNo7aO+sfSX2fI+lJwU6aarLglAM/a5KXmMrCwp2e1o9Baq4M81nd71iUwdUgx//
 uZ/a2+LKxSXP2G1SaaWWxXeK+62Cc8u3wUAa1bnCoMsdwDkTq4p9UjZ7iM9A35rRXq
 JIFyutr6uKQ66rQKeR1y+8M4g0+cnTjIYBu59SdC1oEOjQqwNU4m4C6gP6n5Hhq5ba
 bJJgl8MHVyNQvB3qHhrFcZXNGUdYAp0il6xrP4DrP96t1panNvmqFIm5/Wpc+h4Dk6
 GwYzA74WFlDOQ==
Subject: Re: [Nouveau] [PATCH v2 1/7] mm/thp: fix __split_huge_pmd_locked()
 for migration PMD
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alistair
 Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDkvMi8yMCAyOjQ3IFBNLCBaaSBZYW4gd3JvdGU6Cj4gT24gMiBTZXAgMjAyMCwgYXQgMTI6
NTgsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+IAo+PiBBIG1pZ3JhdGluZyB0cmFuc3BhcmVudCBo
dWdlIHBhZ2UgaGFzIHRvIGFscmVhZHkgYmUgdW5tYXBwZWQuIE90aGVyd2lzZSwKPj4gdGhlIHBh
Z2UgY291bGQgYmUgbW9kaWZpZWQgd2hpbGUgaXQgaXMgYmVpbmcgY29waWVkIHRvIGEgbmV3IHBh
Z2UgYW5kCj4+IGRhdGEgY291bGQgYmUgbG9zdC4gVGhlIGZ1bmN0aW9uIF9fc3BsaXRfaHVnZV9w
bWQoKSBjaGVja3MgZm9yIGEgUE1ECj4+IG1pZ3JhdGlvbiBlbnRyeSBiZWZvcmUgY2FsbGluZyBf
X3NwbGl0X2h1Z2VfcG1kX2xvY2tlZCgpIGxlYWRpbmcgb25lIHRvCj4+IHRoaW5rIHRoYXQgX19z
cGxpdF9odWdlX3BtZF9sb2NrZWQoKSBjYW4gaGFuZGxlIHNwbGl0dGluZyBhIG1pZ3JhdGluZyBQ
TUQuCj4+IEhvd2V2ZXIsIHRoZSBjb2RlIGFsd2F5cyBpbmNyZW1lbnRzIHRoZSBwYWdlLT5fbWFw
Y291bnQgYW5kIGFkanVzdHMgdGhlCj4+IG1lbW9yeSBjb250cm9sIGdyb3VwIGFjY291bnRpbmcg
YXNzdW1pbmcgdGhlIHBhZ2UgaXMgbWFwcGVkLgo+PiBBbHNvLCBpZiB0aGUgUE1EIGVudHJ5IGlz
IGEgbWlncmF0aW9uIFBNRCBlbnRyeSwgdGhlIGNhbGwgdG8KPj4gaXNfaHVnZV96ZXJvX3BtZCgq
cG1kKSBpcyBpbmNvcnJlY3QgYmVjYXVzZSBpdCBjYWxscyBwbWRfcGZuKHBtZCkgaW5zdGVhZAo+
PiBvZiBtaWdyYXRpb25fZW50cnlfdG9fcGZuKHBtZF90b19zd3BfZW50cnkocG1kKSkuCj4+IEZp
eCB0aGVzZSBwcm9ibGVtcyBieSBjaGVja2luZyBmb3IgYSBQTUQgbWlncmF0aW9uIGVudHJ5Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+
Cj4gCj4gVGhhbmtzIGZvciB0aGUgZml4LiBZb3UgY2FuIGFkZCBSZXZpZXdlZC1ieTogWmkgWWFu
IDx6aXlAbnZpZGlhLmNvbT4KPiAKPiBJIHRoaW5rIHlvdSBhbHNvIHdhbnQgdG8gYWRkIHRoZSBG
aXhlcyB0YWcgYW5kIGNjIHN0YWJsZS4KPiAKPiBGaXhlcyA4NGMzZmM0ZTljNTYgKOKAnG1tOiB0
aHA6IGNoZWNrIHBtZCBtaWdyYXRpb24gZW50cnkgaW4gY29tbW9uIHBhdGjigJ0pCj4gY2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyA0LjE0KwoKVGhhbmtzLCBJJ2xsIGFkZCB0aGVzZS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
