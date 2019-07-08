Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C67562723
	for <lists+nouveau@lfdr.de>; Mon,  8 Jul 2019 19:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3CA89F53;
	Mon,  8 Jul 2019 17:30:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB63D89F53;
 Mon,  8 Jul 2019 17:30:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d237dcc0001>; Mon, 08 Jul 2019 10:30:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 10:30:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 10:30:56 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Jul
 2019 17:30:55 +0000
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
 <20190704164236.GP3401@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
Date: Mon, 8 Jul 2019 10:30:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190704164236.GP3401@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562607052; bh=uAosH4rcWhCpsYgdv7tD56ho8lbt2DTohfs/exVueGE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jHtVNZux6j3btAC9zECxouW2X2X+bK1i9oF4C4A/Q9DWBR6i+sgDlWhjq9OHySob+
 NKYQ+ttlZ144MP71OeW7R8RFbx3dpzYZtDFxJ4U8MMtirXaSFOMFf5Wrr/ALyvn0NV
 ImhfP70z7sKEnSBaWwJDHhcwMQ7Lzp2xgBPbUa5ma7/wScK0abV/JFCWJFKePtyEiY
 3wz80LEdu5nuw/rDGedPWDuwfuYUC1cP3J4H+C0Ewt3gXjrcCe8fQAHRVFUUmKBA3V
 pPffYKMqtSM0gysCMdxQnW88TizXrXplVyoXYIzb8LYYAAFg8PE1kZsaKHw5TlXlOl
 tHpsXfTMIiEcw==
Subject: Re: [Nouveau] hmm_range_fault related fixes and legacy API removal
 v2
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDcvNC8xOSA5OjQyIEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MDMsIDIwMTkgYXQgMDM6MDI6MDhQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+
IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLAo+Pgo+PiBiZWxvdyBpcyBhIHNlcmllcyBhZ2Fp
bnN0IHRoZSBobW0gdHJlZSB3aGljaCBmaXhlcyB1cCB0aGUgbW1hcF9zZW0KPj4gbG9ja2luZyBp
biBub3V2ZWF1IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhN
TSBBUElzCj4+IG9ubHkgdXNlZCBieSBub3V2ZWF1Lgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+
PiAgIC0gZG9uJ3QgcmV0dXJuIHRoZSB2YWxpZCBzdGF0ZSBmcm9tIGhtbV9yYW5nZV91bnJlZ2lz
dGVyCj4+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMKPiAKPiBSYWxwaCwgc2luY2Ug
bW9zdCBvZiB0aGlzIGlzIG5vdXZlYXUgY291bGQgeW91IGNvbnRyaWJ1dGUgYQo+IFRlc3RlZC1i
eT8gVGhhbmtzCj4gCj4gSmFzb24KPiAKCkkgY2FuIHRlc3QgdGhpbmdzIGZhaXJseSBlYXNpbHkg
YnV0IHdpdGggYWxsIHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywKY29uZmxpY3RzLCBhbmQgcGVyc29u
YWwgZ2l0IHRyZWVzLCBjYW4geW91IHNwZWNpZnkgdGhlIGdpdCB0cmVlCmFuZCBicmFuY2ggd2l0
aCBldmVyeXRoaW5nIGFwcGxpZWQgdGhhdCB5b3Ugd2FudCBtZSB0byB0ZXN0PwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
