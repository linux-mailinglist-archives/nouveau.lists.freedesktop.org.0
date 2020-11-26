Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC62C551E
	for <lists+nouveau@lfdr.de>; Thu, 26 Nov 2020 14:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348616E945;
	Thu, 26 Nov 2020 13:17:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from p-impout005.msg.pkvw.co.charter.net
 (p-impout005aa.msg.pkvw.co.charter.net [47.43.26.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496D6E945
 for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2020 13:17:34 +0000 (UTC)
Received: from [172.16.10.100] ([68.205.28.126]) by cmsmtp with ESMTP
 id iH9Rk5Td1hO0AiH9RkzWeM; Thu, 26 Nov 2020 13:17:33 +0000
X-Authority-Analysis: v=2.3 cv=e/Z4tph/ c=1 sm=1 tr=0
 a=gmNTOe8/cTguWXMaQW2Lwg==:117 a=gmNTOe8/cTguWXMaQW2Lwg==:17
 a=IkcTkHD0fZMA:10 a=ayC55rCoAAAA:8 a=LN7EJh0wAAAA:8 a=cfAAkiydlZ14mqaL-M8A:9
 a=QEXdDO2ut3YA:10 a=B_RyunTPg8udlmYm5Cu2:22 a=dXGCnajoxBWOfxtheKDs:22
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 markh@compro.net, nouveau@lists.freedesktop.org
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
 <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
 <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
 <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
 <1d85e515-4d9c-30ec-c69b-217dacc1fa51@cfl.rr.com>
 <22bdd617-abda-6014-55d9-1677066641ca@amd.com>
From: Mark Hounschell <dmarkh@cfl.rr.com>
Message-ID: <7aeb8f62-1971-4e1d-a6c9-9ed809e82091@cfl.rr.com>
Date: Thu, 26 Nov 2020 08:17:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <22bdd617-abda-6014-55d9-1677066641ca@amd.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNnyCbbpd8sbkhyjtxT2z+MFrGlPNBUj2fB8JGY9pQfh3TzUeTLxMszb4ZYzHb1PKnDNLQRQ7kYcR/sQAa+XUG0Eaon9VUf/Q5kGxhbgE4FZ+Ujz9VID
 TBb0QKpcmvz50ndKzQpxVx6HcZ4M7mRtEvKIayn2n8Wg6U8cMo9lZONo0LvEvCr9dOvRCDb9Yht/wnjI3j1pjzmZ8qL1d4U2xkqLgPb30DdLAwBMjQO1tW8H
 ypPByxHprHyOdxmJgCDh5g==
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

T24gMTEvMjYvMjAgODowMSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyNi4xMS4y
MCB1bSAxMzo1NyBzY2hyaWViIE1hcmsgSG91bnNjaGVsbDoKPj4gT24gMTEvMjYvMjAgNzo0MSBB
TSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEhpIE1hcmssCj4+Pgo+Pj4gQW0gMjYuMTEu
MjAgdW0gMTM6MjYgc2NocmllYiBNYXJrIEhvdW5zY2hlbGw6Cj4+Pj4gT24gMTEvMjYvMjAgNzow
NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gSGkgTWFyaywKPj4+Pj4KPj4+Pj4g
QW0gMjYuMTEuMjAgdW0gMTA6NTkgc2NocmllYiBNYXJrIEhvdW5zY2hlbGw6Cj4+Pj4+PiBPbiAx
MS8yNi8yMCAzOjM1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+PiBJJ20gcnVu
bmluZyBhbiBvbGRlciAiTlZJRElBIENvcnBvcmF0aW9uIEc3MCBbR2VGb3JjZSA3ODAwIEdUXSAo
cmV2IAo+Pj4+Pj4+PiBhMSkiIGNhcmQgaW4gYSBuZXdlciBCSU9TVEFSIEI1NTBHVEEgTUIuIEtl
cm5lbCA1LjEwLXJjeCBkb2VzIG5vdCAKPj4+Pj4+Pj4gd29yay4gSSBnZXQgbm8gdmlydHVhbCBj
b25zb2xlcyBvciBYIHNjcmVlbi4KPj4+Pj4KPj4+Pj4gdGhhbmtzIGZvciB0aGUgZG1lc2cuCj4+
Pj4+Cj4+Pj4+IFByb2JsZW0gaXMgSSBkb24ndCBoYXZlIHRoZSBzbGlnaHRlc3QgaWRlYSB3aGF0
J3MgZ29pbmcgd3JvbmcgaGVyZSA6KQo+Pj4+Pgo+Pj4+PiBUaGUgY29kZSBzaG91bGQgYmUgZnVu
Y3Rpb25hbCBpZGVudGljYWwsIGl0IHdhcyBqdXN0IG1vdmVkIGZyb20gVFRNIHRvIAo+Pj4+PiBu
b3V2ZWF1LCBzbyB3ZSBhcmUgbWlzc2luZyBzb21lIGRldGFpbCBpbiB0aGUgaGFuZGxpbmcuCj4+
Pj4+Cj4+Pj4+IENhbiB5b3UgcnVuIHRoZSBmb2xsb3dpbmcgdGVzdCBmb3IgbWU6IEZpcnN0IHlv
dSBuZWVkIHRvIGRpc2FibGUgCj4+Pj4+IGxvYWRpbmcgb2YgdGhlIG5vdXZlYXUga2VybmVsIG1v
ZHVsZSBieSBhZGRpbmcgCj4+Pj4+IG1vZHByb2JlLmJsYWNrbGlzdD1ub3V2ZWF1IHRvIHRoZSBr
ZXJuZWwgY29tbWFuZCBsaW5lLgo+Pj4+Pgo+Pj4+PiBUaGVuIGxvZyBpbnRvIHRoZSBzeXN0ZW0g
b3ZlciB0aGUgbmV0d29yayBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZHM6Cj4+Pj4+Cj4+
Pj4+IHN1ZG8gbW9kcHJvYmUgdHRtCj4+Pj4+IHN1ZG8gYmFzaCAtYyAiZWNobyAndHRtX2JvX2tt
YXAnID4gCj4+Pj4+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvc2V0X2dyYXBoX2Z1bmN0aW9u
Igo+Pj4+PiBzdWRvIGJhc2ggLWMgImVjaG8gZnVuY3Rpb25fZ3JhcGggPiAKPj4+Pj4gL3N5cy9r
ZXJuZWwvZGVidWcvdHJhY2luZy9jdXJyZW50X3RyYWNlciIKPj4+Pj4gc3VkbyBtb2Rwcm9iZSBu
b3V2ZWF1Cj4+Pj4+IHN1ZG8gYmFzaCAtYyAiY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcv
dHJhY2UiID4gdHJhY2UubG9nCj4+Pj4+Cj4+Pj4+IFBsZWFzZSB0aGVuIHNlbmQgbWUgdGhlIHJl
c3VsdGluZyB0cmFjZS5sb2cgZmlsZSBzbyB0aGF0IEkgY2FuIAo+Pj4+PiBpbnZlc3RpZ2F0ZSB3
aHkgbWFwcGluZyB0aGUgZnJhbWVidWZmZXIgZmFpbHMgZHVyaW5nIGRyaXZlciBsb2FkLgo+Pj4+
Pgo+Pj4+PiBUaGFua3MgaW4gYWR2YW5jZSwKPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4gSSBo
b3BlIHRoaXMgaXMgd2hhdCB5b3UgbmVlZC4gSSBkbyBub3JtYWxseSB0dXJuIG9mZiBhIGxvdCBv
ZiBkZWJ1ZyAKPj4+PiBmZWF0dXJlcy4gTGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIGNoYW5nZSB0
aGUga2VybmVsIGNvbmZpZy4KPj4+Cj4+PiBJdCB3YXMgbm90IHdoYXQgSSBoYWQgZXhwZWN0ZWQg
YnV0IGl0IHBvaW50ZWQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbi4gCj4+PiBJIHRoaW5rIEkn
dmUgZm91bmQgdGhlIHByb2JsZW0sIGl0J3MganVzdCBhbiB1bmluaXRpYWxpemVkIHJldHVybiB2
YWx1ZSAKPj4+IGZvciB5b3VyIGhhcmR3YXJlIGdlbmVyYXRpb24uCj4+Pgo+Pj4gUGxlYXNlIHRy
eSB0aGUgYXR0YWNoZWQgcGF0Y2ggYW5kIGxldCBtZSBrbm93IGlmIGl0IGZpeGVzIHRoZSBwcm9i
bGVtLgo+Pj4KPj4+IFRoYW5rcyBpbiBhZHZhbmNlLAo+Pj4gQ2hyaXN0aWFuLgo+Pgo+PiBZZXAs
IHRoYXQgZml4ZWQgaXQuwqAgLXJjNj8KPiAKPiBJZiBJIGdldCBhbiByYiB0b2RheSB0aGVuIHll
cywgb3RoZXJ3aXNlIGl0IG1pZ2h0IGVuZCB1cCBpbiAtcmM3IG5leHQgd2Vlay4KPiAKPiBBbnkg
b2JqZWN0aW9uIGlmIEkgYWRkIGFuIFJlcG9ydGVkLWFuZC1UZXN0ZWQtYnk6IE1hcmsgSG91bnNj
aGVsbCAKPiA8ZG1hcmtoQGNmbC5yci5jb20+ID8KPiAKPiBUaGFua3MgZm9yIHRoZSBoZWxwLAo+
IENocmlzdGlhbi4KPiAKCllhLCBubyBwcm9ibGVtLiBKdXN0IHVzZSBtYXJraEBjb21wcm8ubmV0
IHRob3VnaC4KClJlZ2FyZHMKTWFyawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
