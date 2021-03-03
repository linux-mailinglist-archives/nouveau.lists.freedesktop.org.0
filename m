Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEE32B95E
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 18:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBFE899FF;
	Wed,  3 Mar 2021 17:03:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A14B899FF
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 17:03:30 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603fc1610003>; Wed, 03 Mar 2021 09:03:29 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar
 2021 17:03:29 +0000
Received: from [172.20.40.53] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar 2021
 17:03:28 +0000
To: <lyude@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, Alex Riesen
 <alexander.riesen@cetitec.com>
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
 <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
 <2dd41d05f6fff86cce7f5a08063de1509e2e3a42.camel@redhat.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <b33cdcd4-25f9-c748-61f2-cb07918ee94f@nvidia.com>
Date: Wed, 3 Mar 2021 09:05:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2dd41d05f6fff86cce7f5a08063de1509e2e3a42.camel@redhat.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614791009; bh=3TDADC4lZ3vZLoUxb7V+ZV07nSVr4velaoki8KKgB7k=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=VhMsYVjY3Jx/ow4gErhuL7Te83YqM8wzpaQzUGekUA3kBcJf6GnINB/z7vciBE7IC
 uGIVz8J9AIbFDw2NHMhIrCS5i6rd8KsxflxhwlSYFtptd0d/8XexAo5yVhZEXDnAl/
 LEb8MMHfQwYlxACg+TtmL3T6fqcW2ynxz68P3SJAcI63X0wm0WcWJchwx4KdfUjE+s
 tk+M/bKi73dtyinu8LCtm0QIRukBP+o2AB1F0cDmLmfxffNAHJVpOrGPHpRNctwZ8k
 OJ2xZdMBStawJUjgXjGOfv4HbEeq5mQ6mpvNy+Q+zUGqnPiI1HAoQoAv0WU8VT0UAo
 /6jTuv6ppnPwA==
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMy8zLzIxIDg6NTEgQU0sIEx5dWRlIFBhdWwgd3JvdGU6Cj4gT24gV2VkLCAyMDIxLTAzLTAz
IGF0IDA4OjEyIC0wNTAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPj4gT24gV2VkLCBNYXIgMywgMjAy
MSBhdCA3OjQxIEFNIEFsZXggUmllc2VuIDxhbGV4YW5kZXIucmllc2VuQGNldGl0ZWMuY29tPgo+
PiB3cm90ZToKPj4+Cj4+PiBJbGlhIE1pcmtpbiwgU2F0LCBGZWIgMjcsIDIwMjEgMjI6MjY6NTcg
KzAxMDA6Cj4+Pj4gQ2FuIHlvdSB0cnkgQWxleCdzIHBhdGNoIHRvIG1vZGV0ZXN0IGFuZCBjb25m
aXJtIHRoYXQgeW91IHNlZSBpc3N1ZXMKPj4+PiB3aXRoIG1vZGV0ZXN0PyBJZiBzbywgY2FuIHlv
dSAoYW5kIG1heWJlIEFsZXggYXMgd2VsbCkgdHJ5IGFuIG9sZGVyCj4+Pj4ga2VybmVsIChJJ20g
b24gNS42KSBhbmQgc2VlIGlmIG1vZGV0ZXN0IGJlaGF2ZXMgd2VsbCB0aGVyZS4gW1RoZSBwYXRj
aAo+Pj4+IGluIHF1ZXN0aW9uIHdhcyB0byBleHBvc2UgMjU2eDI1NiBhcyB0aGUgJ3ByZWZlcnJl
ZCcgc2l6ZSwgYnV0IHN1cHBvcnQKPj4+PiBmb3IgdGhlIGxhcmdlciBjdXJzb3JzIGhhcyBiZWVu
IGFyb3VuZCBmb3IgYSB3aGlsZS5dIEFsZXggLSBpZiB5b3UKPj4+PiBoYXZlIHRpbWUsIHNhbWUg
cXVlc3Rpb24gdG8geW91Lgo+Pj4KPj4+IFNvcnJ5IHRoYXQgaXQgdG9vayBzbyBsb25nLiBJIHJl
dGVzdGV0IHdpdGggdGhlIHNhbWUga2VybmVsIGFzIFV3ZSBkaWQKPj4+ICg1LjQuMTAxKSBhbmQg
bXkgcmVzdWx0cyBhcmUgdGhlIHNhbWU6IG1vZGV0ZXN0IHdpdGggNjQgYW5kIDEyOCBjdXJzb3Jz
Cj4+PiBsb29rcwo+Pj4gZ29vZCwgMjU2IGJyb2tlbi4gRGlkbid0IHRlc3Qgd2l0aCBYIHRoaXMg
dGltZSAodGhpcyBiZWluZyBteSBtYWluIG9mZmljZQo+Pj4gbWFjaGluZSksIGJ1dCBjYW4gZG8g
bGF0ZXIgaWYgcmVxdWlyZWQuCj4+Cj4+IFRoYW5rcyBmb3IgY29uZmlybWluZyEgTm8gbmVlZCB0
byB0ZXN0IFggLSB0aGF0IHdpbGwgd29yayBmaW5lLCBzaW5jZQo+PiB3ZSB3ZXJlIHJlcG9ydGlu
ZyB0aGUgc21hbGxlciBjdXJzb3JzIG9uIHRoYXQga2VybmVsLgo+Pgo+PiBTbyBJIHRoaW5rIHdl
IGhhdmUgZGVmaW5pdGl2ZSBldmlkZW5jZSB0aGF0IGF0IGxlYXN0IGFsbCBLZXBsZXIKPj4gZG9l
c24ndCBkbyAyNTZ4MjU2IChhbmQgaXQncyBub3QganVzdCBzb21lIGJ1ZyBpbiB0aGUgZGlzcGxh
eSBtYWNybwo+PiByZXdvcmsgdGhhdCBnb3QgaW50cm9kdWNlZCkuIEFuZCB1bmxlc3MgSSdtIGJs
aW5kIGFuZCBkb24ndCBzZWUgdGhlCj4+IGNvcnJ1cHRpb24sIFBhc2NhbCBzZWVtcyBmaW5lLiBR
dWVzdGlvbiByZW1haW5zIGZvciBNYXh3ZWxsMS8yIEdQVXMuCj4+IFVubGVzcyBzb21lb25lIGhh
cyBpbW1lZGlhdGUgcGxhbnMgdG8gdGVzdCBvbiB0aG9zZSwgSSdkIHJlY29tbWVuZAo+PiBidW1w
aW5nIHRoZSBtaW5pbXVtIGZvciAyNTZ4MjU2IGJlaW5nIHJlcG9ydGVkIHRvIFBhc2NhbCwgYW5k
IGRvaW5nCj4+IDEyOHgxMjggZm9yIEtlcGxlciAvIE1heHdlbGwuCj4gCj4gSSdtIGZhaXJseSBz
dXJlIHRoaXMgd2lsbCBhY3R1YWxseSB3b3JrIGZpbmUgb24gbWF4d2VsbCwgSSB0aGluayBLZXBs
ZXIgaXMgdGhlCj4gb25seSBvbmUgSSdtIGF3YXJlIG9mIHNvIGZhciB0aGF0IGhhcyBpc3N1ZXMg
d2l0aCB0aGlzLiBJJ3ZlIGdvdCBvbmUgb2YgZWFjaCBnZW4KPiBmcm9tIGtlcGxlciAxIHVwIHRv
IGFtcGVyZSwgc28gSSdsbCB0cnkgdG8gZmluZCBzb21lIHRvZGF5IHRvIHRlc3QgdGhlIGNhcmRz
Cj4gSSd2ZSBnb3QgYW5kIHNlZSB3aGVyZSB0aGUgc3VwcG9ydCBjdXRvZmYgZm9yIHRoaXMgaXMg
YW5kIHRoZW4gc3VibWl0IGEgcGF0Y2gKPiBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gSXQncyBh
bHNvIHJlYWxseSBzdHJhbmdlIHRvIG1lIHRoYXQgdGhpcyB3b3VsZCBiZSBwcmVzZW50IGluIHRo
ZSBkaXNwbGF5IGNsYXNzZXMKPiB5ZXQgbm90IGJlIHN1cHBvcnRlZCBvbiB0aGUgR1BVLCBzaW5j
ZSB0aGVyZSBkZWZpbml0ZWx5IGFyZW4ndCBhbnkgY2FwYWJpbGl0aWVzCj4gZm9yIHRoaXMuIEkn
bGwgYWxzbyBzZW5kIGFuIGVtYWlsIHRvIEFuZHkgYW5kIHNlZSBpZiBoZSBtaWdodCBrbm93IHdo
YXQncyBnb2luZwo+IG9uIGhlcmUuCgpGV0lXLCBpdCdzIG5vdCBteSBhcmVhLCBidXQgSSd2ZSBi
ZWVuIGZvbGxvd2luZywgYW5kIGZvcndhcmRlZCB0aGlzIAp0aHJlYWQgYXJvdW5kIGludGVybmFs
bHkuICBXZSBkaXNjdXNzZWQgYSBiaXQsIGFuZCBLZXBsZXIgZGVmaW5pdGVseSAKc3VwcG9ydHMg
MjU2eDI1NiBjdXJzb3JzLiBPbmUgc3VnZ2VzdGlvbiB3YXMgaWYgeW91IGFyZW4ndCBhbHJlYWR5
LCB0cnkgCnVzaW5nIDRrIHBhZ2VzLiBUaGUgcmVzdCB3YXMgYSBiaXQgYmV5b25kIG1lLCBzbyBJ
J2xsIGxldCBBbmR5IGFuZCBMeXVkZSAKZGlzY3VzcyBmdXJ0aGVyIGlmIG5lZWRlZC4KClRoYW5r
cywKLUphbWVzCgo+PiBTaW1vbiwgTHl1ZGUgLS0gdGhvdWdodHM/Cj4+Cj4+IENoZWVycywKPj4K
Pj4gIMKgIC1pbGlhCj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQo=
