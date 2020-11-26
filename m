Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C72C544D
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 13:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857F96E936;
	Thu, 26 Nov 2020 12:57:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout010aa.msg.pkvw.co.charter.net [47.43.26.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934EF6E936
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 12:57:16 +0000 (UTC)
Received: from [172.16.10.100] ([68.205.28.126]) by cmsmtp with ESMTP
 id iGpnkFoJpgaoNiGpnk2d29; Thu, 26 Nov 2020 12:57:15 +0000
X-Authority-Analysis: v=2.3 cv=PKRxBsiC c=1 sm=1 tr=0
 a=gmNTOe8/cTguWXMaQW2Lwg==:117 a=gmNTOe8/cTguWXMaQW2Lwg==:17
 a=IkcTkHD0fZMA:10 a=e90LUi6SPypYjDHdUCUA:9 a=QEXdDO2ut3YA:10
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
 <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
 <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
 <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
From: Mark Hounschell <dmarkh@cfl.rr.com>
Message-ID: <1d85e515-4d9c-30ec-c69b-217dacc1fa51@cfl.rr.com>
Date: Thu, 26 Nov 2020 07:57:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDJ7aid5RQ+mWy9MsUZjX1qfK9VUyMoIDDmGV927RDMDRbcVQq4BSTgTXJqb4xEDYZwhDakTPnvGkFawNVAZSNMd5OFTwVk1OEouKXvbtt05fRkk+yRj
 sN+yC8FxKW1ojF2gjfcgbS89jEIczEbq8kY4+PoOHQRAdkejTgxGKvt4MfLV8QqIM7YbKRu9w7l7ZuRe6++g/qvnykyp3PlR04W8FeAYsY6NWSjV3cVGm15R
 I473gzU2DTzSjSTagjuMlA==
Subject: Re: [Nouveau] [BUG][NOUVEAU] G70 broken since 5.10-rc1
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
Reply-To: dmarkh@cfl.rr.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMTEvMjYvMjAgNzo0MSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBIaSBNYXJrLAo+
IAo+IEFtIDI2LjExLjIwIHVtIDEzOjI2IHNjaHJpZWIgTWFyayBIb3Vuc2NoZWxsOgo+PiBPbiAx
MS8yNi8yMCA3OjA1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gSGkgTWFyaywKPj4+
Cj4+PiBBbSAyNi4xMS4yMCB1bSAxMDo1OSBzY2hyaWViIE1hcmsgSG91bnNjaGVsbDoKPj4+PiBP
biAxMS8yNi8yMCAzOjM1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gSSdtIHJ1
bm5pbmcgYW4gb2xkZXIgIk5WSURJQSBDb3Jwb3JhdGlvbiBHNzAgW0dlRm9yY2UgNzgwMCBHVF0g
KHJldiAKPj4+Pj4+IGExKSIgY2FyZCBpbiBhIG5ld2VyIEJJT1NUQVIgQjU1MEdUQSBNQi4gS2Vy
bmVsIDUuMTAtcmN4IGRvZXMgbm90IAo+Pj4+Pj4gd29yay4gSSBnZXQgbm8gdmlydHVhbCBjb25z
b2xlcyBvciBYIHNjcmVlbi4KPj4+Cj4+PiB0aGFua3MgZm9yIHRoZSBkbWVzZy4KPj4+Cj4+PiBQ
cm9ibGVtIGlzIEkgZG9uJ3QgaGF2ZSB0aGUgc2xpZ2h0ZXN0IGlkZWEgd2hhdCdzIGdvaW5nIHdy
b25nIGhlcmUgOikKPj4+Cj4+PiBUaGUgY29kZSBzaG91bGQgYmUgZnVuY3Rpb25hbCBpZGVudGlj
YWwsIGl0IHdhcyBqdXN0IG1vdmVkIGZyb20gVFRNIHRvIAo+Pj4gbm91dmVhdSwgc28gd2UgYXJl
IG1pc3Npbmcgc29tZSBkZXRhaWwgaW4gdGhlIGhhbmRsaW5nLgo+Pj4KPj4+IENhbiB5b3UgcnVu
IHRoZSBmb2xsb3dpbmcgdGVzdCBmb3IgbWU6IEZpcnN0IHlvdSBuZWVkIHRvIGRpc2FibGUgbG9h
ZGluZyAKPj4+IG9mIHRoZSBub3V2ZWF1IGtlcm5lbCBtb2R1bGUgYnkgYWRkaW5nIG1vZHByb2Jl
LmJsYWNrbGlzdD1ub3V2ZWF1IHRvIHRoZSAKPj4+IGtlcm5lbCBjb21tYW5kIGxpbmUuCj4+Pgo+
Pj4gVGhlbiBsb2cgaW50byB0aGUgc3lzdGVtIG92ZXIgdGhlIG5ldHdvcmsgYW5kIHJ1biB0aGUg
Zm9sbG93aW5nIGNvbW1hbmRzOgo+Pj4KPj4+IHN1ZG8gbW9kcHJvYmUgdHRtCj4+PiBzdWRvIGJh
c2ggLWMgImVjaG8gJ3R0bV9ib19rbWFwJyA+IAo+Pj4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2lu
Zy9zZXRfZ3JhcGhfZnVuY3Rpb24iCj4+PiBzdWRvIGJhc2ggLWMgImVjaG8gZnVuY3Rpb25fZ3Jh
cGggPiAKPj4+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvY3VycmVudF90cmFjZXIiCj4+PiBz
dWRvIG1vZHByb2JlIG5vdXZlYXUKPj4+IHN1ZG8gYmFzaCAtYyAiY2F0IC9zeXMva2VybmVsL2Rl
YnVnL3RyYWNpbmcvdHJhY2UiID4gdHJhY2UubG9nCj4+Pgo+Pj4gUGxlYXNlIHRoZW4gc2VuZCBt
ZSB0aGUgcmVzdWx0aW5nIHRyYWNlLmxvZyBmaWxlIHNvIHRoYXQgSSBjYW4gCj4+PiBpbnZlc3Rp
Z2F0ZSB3aHkgbWFwcGluZyB0aGUgZnJhbWVidWZmZXIgZmFpbHMgZHVyaW5nIGRyaXZlciBsb2Fk
Lgo+Pj4KPj4+IFRoYW5rcyBpbiBhZHZhbmNlLAo+Pj4gQ2hyaXN0aWFuLgo+Pgo+PiBJIGhvcGUg
dGhpcyBpcyB3aGF0IHlvdSBuZWVkLiBJIGRvIG5vcm1hbGx5IHR1cm4gb2ZmIGEgbG90IG9mIGRl
YnVnIAo+PiBmZWF0dXJlcy4gTGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIGNoYW5nZSB0aGUga2Vy
bmVsIGNvbmZpZy4KPiAKPiBJdCB3YXMgbm90IHdoYXQgSSBoYWQgZXhwZWN0ZWQgYnV0IGl0IHBv
aW50ZWQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbi4gSSAKPiB0aGluayBJJ3ZlIGZvdW5kIHRo
ZSBwcm9ibGVtLCBpdCdzIGp1c3QgYW4gdW5pbml0aWFsaXplZCByZXR1cm4gdmFsdWUgZm9yIAo+
IHlvdXIgaGFyZHdhcmUgZ2VuZXJhdGlvbi4KPiAKPiBQbGVhc2UgdHJ5IHRoZSBhdHRhY2hlZCBw
YXRjaCBhbmQgbGV0IG1lIGtub3cgaWYgaXQgZml4ZXMgdGhlIHByb2JsZW0uCj4gCj4gVGhhbmtz
IGluIGFkdmFuY2UsCj4gQ2hyaXN0aWFuLgoKWWVwLCB0aGF0IGZpeGVkIGl0LiAgLXJjNj8KClRo
YW5rcwpNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
