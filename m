Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5812F8BF
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2020 14:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52536E2FF;
	Fri,  3 Jan 2020 13:25:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DE16E2FF
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2020 13:25:50 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8606E88DD324DA67D18B;
 Fri,  3 Jan 2020 21:25:47 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.238) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 3 Jan 2020 21:25:44 +0800
To: Roy Spliet <nouveau@spliet.org>, <nouveau@lists.freedesktop.org>
References: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
 <fd3273d3-5814-be43-dbec-e49bc7990705@spliet.org>
From: "Wuxu (Max)" <wuxu.wu@huawei.com>
Organization: huawei
Message-ID: <9a86afda-9ee3-058d-a4b1-88606b8bfcc1@huawei.com>
Date: Fri, 3 Jan 2020 21:25:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <fd3273d3-5814-be43-dbec-e49bc7990705@spliet.org>
Content-Language: en-US
X-Originating-IP: [10.173.222.238]
X-CFilter-Loop: Reflected
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: fix incorrect kfree in
 platform_init
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
Reply-To: wuxu.wu@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhhbmsgeW91LCBJIGdvdCBpdAoKT24gMjAyMC8xLzMgMTk6NTgsIFJveSBTcGxpZXQgd3JvdGU6
Cj4gKHJlLXNlbmRpbmcgYXMgcGxhaW4gdGV4dCkKPiAKPiBOQUNLLiBUaGUgYmVmb3JlIGFuZCBh
ZnRlciBvZiB0aGlzIHBhdGNoIGFyZSBmdW5jdGlvbmFsbHkgaWRlbnRpY2FsLiBUaGUgaWYtYmxv
Y2sgcmV0dXJucyB1bmNvbmRpdGlvbmFsbHkgKCJyZXR1cm4gcHJpdjsiKSwgc28gdGhlIGtmcmVl
IHdpbGwgb25seSBldmVyIGJlIHJlYWNoZWQgaWYgdGhlIGNvbmRpdGlvbiBpbiB0aGUgaWYtc3Rh
dGVtZW50IGV2YWx1YXRlcyB0byBmYWxzZS4gRXhwbGljaXRseSB3cml0aW5nIG91dCBhbiBlbHNl
LWJsb2NrIGlzIHRodXMgc3VwZXJmbHVvdXMuCj4gCj4gT3AgMDMtMDEtMjAyMCBvbSAwOToxMCBz
Y2hyZWVmIHd1eHUud3U6Cj4+IEhpLCBJIHRoaW5rIHRoZXJlIGhhcyBhIGluY29ycmVjdCBrZnJl
ZSBpbiBwY2lyb21faW5pdCBmdW5jdGlvbi4gSW4KPj4gcGNpcm9tX2luaXQgZnVuY3Rpb24gcHJp
diBwb3JpbnRlciBjb3VsZCBiZSBmcmVlIG9ubHkgd2hlbiBwcml2ICE9IG51bGwKPj4gYW5kIHBy
aXYtPnJvbSBpcyBudWxsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB3dXh1Lnd1IDx3dXh1Lnd1QGh1
YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9iaW9zL3NoYWRvd3BjaS5jIHwgMyArKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9zaGFkb3dwY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mvc2hhZG93cGNpLmMKPj4gaW5kZXggOWI5MWRhMC4uZDc3
NmUwMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
Ymlvcy9zaGFkb3dwY2kuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9iaW9zL3NoYWRvd3BjaS5jCj4+IEBAIC03MCw4ICs3MCw5IEBAIHBjaXJvbV9pbml0KHN0
cnVjdCBudmttX2Jpb3MgKmJpb3MsIGNvbnN0IGNoYXIgKm5hbWUpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKHByaXYtPnJvbSA9IHBjaV9tYXBfcm9tKHBkZXYsICZwcml2
LT5zaXplKSkpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcml2LT5w
ZGV2ID0gcGRldjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cHJpdjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShwcml2KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShwcml2KTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9kaXNhYmxlX3JvbShwZGV2
KTsKPj4gwqDCoMKgwqDCoCB9Cj4+Cj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
