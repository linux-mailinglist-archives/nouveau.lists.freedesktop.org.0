Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82474FCE9E
	for <lists+nouveau@lfdr.de>; Thu, 14 Nov 2019 20:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE58D6E087;
	Thu, 14 Nov 2019 19:17:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2CB6E087
 for <nouveau@lists.freedesktop.org>; Thu, 14 Nov 2019 19:17:48 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-hUhH9UIYO-aEreW_HnrilA-1; Thu, 14 Nov 2019 14:17:45 -0500
Received: by mail-qt1-f197.google.com with SMTP id 6so4687981qtu.7
 for <nouveau@lists.freedesktop.org>; Thu, 14 Nov 2019 11:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzU2orsV1IQ0b605t7GrUNqdH9lGit9QLMaD0lmIB5c=;
 b=sqOJwBKbUx+oyWPPx0+tt3UqJi+0kV+iXb7kPjsjk8Ig1FVD32WaDNHpLtVsqPey1e
 b+9/rvAkV0lcB2hkuJ7/Yt0+yeIst+Q7Yk2oHP5a4Xz5viOY9iMy/3CjzOtIsTG73jKR
 BvbBgDB8AGR6HPkn5m2vkHGdHOy8+tjRtGWSurLD2wt+6ejxxyZsaiXuQtUGRsqK2AL9
 61/Xep618wf75vh+rMGf2mKRQihkAKu+bkAc87Mdn/WQCZL456kxfxx7QFSwVVvu9fH/
 k4ZRJiifvFNbhTsMXJlKikGMU3HsTS04tjqgJAbaTWCLgWzvhYRDISRDvb5BgPCmt3QE
 bZKw==
X-Gm-Message-State: APjAAAU2hPgDWColcDeF96hLnE7n63cyRbslfNOVh0z/SiChlYjLk+I+
 OQH6pyz4w6h0YHPccQ1Lzmq6ztfUQnrNnyHU9EXB0Q/bZ52LYpmHTgbR4hBlxY/P6zSTxJ5EYFp
 y/zZL3gBXdh4dK4Su48SiYssqYAlwSAwBaHzqaHR1ig==
X-Received: by 2002:ac8:75ce:: with SMTP id z14mr9911910qtq.130.1573759062326; 
 Thu, 14 Nov 2019 11:17:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBzlpxS0u5QYAn3+7xHyAlZnhB1xo77FSDY0Sd/oCUw4ff3cxInd+1N0Ly/+l1puO3E0enij5HXFW6Mn/Bh7c=
X-Received: by 2002:ac8:75ce:: with SMTP id z14mr9911890qtq.130.1573759062129; 
 Thu, 14 Nov 2019 11:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
In-Reply-To: <20191017121901.13699-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 14 Nov 2019 20:17:30 +0100
Message-ID: <CACO55tuMvHtPSHmU_G_0f5P6O3Ao0OqVMDPvaaRCYrMSd29NMQ@mail.gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
X-MC-Unique: hUhH9UIYO-aEreW_HnrilA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573759066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iO7IjIFxA01AP12H/14msCUb1F6tFNp4BMry0uJ072A=;
 b=XJjP5tDV5hTyiLgGoZDbQehhbViTUWP09PJaXZnAJqqWl3gEeYIunBcx2qkofSAuS5eikV
 jJIE5Aw61Y4fDkCT28UDichazHR7O5pUyvZxKo1UJgyo5r0zz+qBttS9GKRX9Lf0tY/zB4
 SKWQsSNVScxJ/UKmNhpeTwG3rhc7U7U=
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

cGluZyBvbiB0aGUgcGF0Y2guCgpJIHdhc24ndCBhYmxlIHRvIHZlcmlmeSB0aGlzIGlzc3VlIG9u
IGFueSBvdGhlciBicmlkZ2UgY29udHJvbGxlciwgc28KaXQgcmVhbGx5IG1pZ2h0IGJlIG9ubHkg
dGhpcyBvbmUuCgpPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAyOjE5IFBNIEthcm9sIEhlcmJzdCA8
a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPgo+IEZpeGVzIHN0YXRlIHRyYW5zaXRpb25zIG9m
IE52aWRpYSBQYXNjYWwgR1BVcyBmcm9tIEQzY29sZCBpbnRvIGhpZ2hlciBkZXZpY2UKPiBzdGF0
ZXMuCj4KPiB2MjogY29udmVydCB0byBwY2lfZGV2IHF1aXJrCj4gICAgIHB1dCBhIHByb3BlciB0
ZWNobmljYWwgZXhwbGFuYXRpb24gb2YgdGhlIGlzc3VlIGFzIGEgaW4tY29kZSBjb21tZW50Cj4g
djM6IGRpc2FibGUgaXQgb25seSBmb3IgY2VydGFpbiBjb21iaW5hdGlvbnMgb2YgaW50ZWwgYW5k
IG52aWRpYSBoYXJkd2FyZQo+IHY0OiBzaW1wbGlmeSBxdWlyayBieSBzZXR0aW5nIGZsYWcgb24g
dGhlIEdQVSBpdHNlbGYKPgo+IFNpZ25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEBy
ZWRoYXQuY29tPgo+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+IENj
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENjOiBSYWZhZWwgSi4gV3lzb2NraSA8
cmp3QHJqd3lzb2NraS5uZXQ+Cj4gQ2M6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJn
QGludGVsLmNvbT4KPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1w
bUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+ICBkcml2ZXJzL3BjaS9w
Y2kuYyAgICB8ICA3ICsrKysrKwo+ICBkcml2ZXJzL3BjaS9xdWlya3MuYyB8IDUzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvcGNp
LmggIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNpL3BjaS5jCj4gaW5kZXggYjk3
ZDllMTBjOWNjLi4wMmU3MWUwYmNkZDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvcGNpLmMK
PiArKysgYi9kcml2ZXJzL3BjaS9wY2kuYwo+IEBAIC04NTAsNiArODUwLDEzIEBAIHN0YXRpYyBp
bnQgcGNpX3Jhd19zZXRfcG93ZXJfc3RhdGUoc3RydWN0IHBjaV9kZXYgKmRldiwgcGNpX3Bvd2Vy
X3Qgc3RhdGUpCj4gICAgICAgICAgICB8fCAoc3RhdGUgPT0gUENJX0QyICYmICFkZXYtPmQyX3N1
cHBvcnQpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPgo+ICsgICAgICAgLyoKPiAr
ICAgICAgICAqIGNoZWNrIGlmIHdlIGhhdmUgYSBiYWQgY29tYmluYXRpb24gb2YgYnJpZGdlIGNv
bnRyb2xsZXIgYW5kIG52aWRpYQo+ICsgICAgICAgICAqIEdQVSwgc2VlIHF1aXJrX2Jyb2tlbl9u
dl9ydW5wbSBmb3IgbW9yZSBpbmZvCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChzdGF0ZSAh
PSBQQ0lfRDAgJiYgZGV2LT5icm9rZW5fbnZfcnVucG0pCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICsKPiAgICAgICAgIHBjaV9yZWFkX2NvbmZpZ193b3JkKGRldiwgZGV2LT5wbV9jYXAg
KyBQQ0lfUE1fQ1RSTCwgJnBtY3NyKTsKPgo+ICAgICAgICAgLyoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wY2kvcXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+IGluZGV4IDQ0YzRhZTFh
YmQwMC4uMDAwNmM5ZTM3YjZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4g
KysrIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiBAQCAtNTI2OCwzICs1MjY4LDU2IEBAIHN0YXRp
YyB2b2lkIHF1aXJrX3Jlc2V0X2xlbm92b190aGlua3BhZF9wNTBfbnZncHUoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpCj4gIERFQ0xBUkVfUENJX0ZJWFVQX0NMQVNTX0ZJTkFMKFBDSV9WRU5ET1JfSURf
TlZJRElBLCAweDEzYjEsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0NMQVNT
X0RJU1BMQVlfVkdBLCA4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHF1aXJrX3Jl
c2V0X2xlbm92b190aGlua3BhZF9wNTBfbnZncHUpOwo+ICsKPiArLyoKPiArICogU29tZSBJbnRl
bCBQQ0llIGJyaWRnZXMgY2F1c2UgZGV2aWNlcyB0byBkaXNhcHBlYXIgZnJvbSB0aGUgUENJZSBi
dXMgYWZ0ZXIKPiArICogdGhvc2Ugd2VyZSBwdXQgaW50byBEM2NvbGQgc3RhdGUgaWYgdGhleSB3
ZXJlIHB1dCBpbnRvIGEgbm9uIEQwIFBDSSBQTQo+ICsgKiBkZXZpY2Ugc3RhdGUgYmVmb3JlIGRv
aW5nIHNvLgo+ICsgKgo+ICsgKiBUaGlzIGxlYWRzIHRvIHZhcmlvdXMgaXNzdWUgZGlmZmVyZW50
IGlzc3VlcyB3aGljaCBhbGwgbWFuaWZlc3QgZGlmZmVyZW50bHksCj4gKyAqIGJ1dCBoYXZlIHRo
ZSBzYW1lIHJvb3QgY2F1c2U6Cj4gKyAqICAtIEFJTUwgY29kZSBleGVjdXRpb24gaGl0cyBhbiBp
bmZpbml0ZSBsb29wIChhcyB0aGUgY29lIHdhaXRzIG9uIGRldmljZQo+ICsgKiAgICBtZW1vcnkg
dG8gY2hhbmdlKS4KPiArICogIC0ga2VybmVsIGNyYXNoZXMsIGFzIGFsbCBwY2kgcmVhZHMgcmV0
dXJuIC0xLCB3aGljaCBtb3N0IGNvZGUgaXNuJ3QgYWJsZQo+ICsgKiAgICB0byBoYW5kbGUgd2Vs
bCBlbm91Z2guCj4gKyAqICAtIHN1ZGRlbiBzaHV0ZG93bnMsIGFzIHRoZSBrZXJuZWwgaWRlbnRp
ZmllZCBhbiB1bnJlY292ZXJhYmxlIGVycm9yIGFmdGVyCj4gKyAqICAgIHVzZXJzcGFjZSB0cmll
cyB0byBhY2Nlc3MgdGhlIEdQVS4KPiArICoKPiArICogSW4gYWxsIGNhc2VzIGRtZXNnIHdpbGwg
Y29udGFpbiBhdCBsZWFzdCBvbmUgbGluZSBsaWtlIHRoaXM6Cj4gKyAqICdub3V2ZWF1IDAwMDA6
MDE6MDAuMDogUmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUsIGN1cnJlbnRseSBpbiBEMycK
PiArICogZm9sbG93ZWQgYnkgYSBsb3Qgb2Ygbm91dmVhdSB0aW1lb3V0cy4KPiArICoKPiArICog
QUNQSSBjb2RlIHdyaXRlcyBiaXQgMHg4MCB0byB0aGUgbm90IGRvY3VtZW50ZWQgUENJIHJlZ2lz
dGVyIDB4MjQ4IG9mIHRoZQo+ICsgKiBQQ0llIGJyaWRnZSBjb250cm9sbGVyIGluIG9yZGVyIHRv
IHBvd2VyIGRvd24gdGhlIEdQVS4KPiArICogTm9uZXRoZWxlc3MsIHRoZXJlIGFyZSBvdGhlciBj
b2RlIHBhdGhzIGluc2lkZSB0aGUgQUNQSSBmaXJtd2FyZSB3aGljaCB1c2UKPiArICogb3RoZXIg
cmVnaXN0ZXJzLCB3aGljaCBzZWVtIHRvIHdvcmsgZmluZToKPiArICogIC0gMHhiYyBiaXQgMHgy
MCAocHVibGljbHkgYXZhaWxhYmxlIGRvY3VtZW50YXRpb24gY2xhaW1zICdyZXNlcnZlZCcpCj4g
KyAqICAtIDB4YjAgYml0IDB4MTAgKGxpbmsgZGlzYWJsZSkKPiArICogQ2hhbmdpbmcgdGhlIGNv
bmRpdGlvbnMgaW5zaWRlIHRoZSBmaXJtd2FyZSBieSBwb2tpbmcgaW50byB0aGUgcmVsZXZhbnQK
PiArICogYWRkcmVzc2VzIGRvZXMgcmVzb2x2ZSB0aGUgaXNzdWUsIGJ1dCBpdCBzZWVtZWQgdG8g
YmUgQUNQSSBwcml2YXRlIG1lbW9yeQo+ICsgKiBhbmQgbm90IGFueSBkZXZpY2UgYWNjZXNzaWJs
ZSBtZW1vcnkgYXQgYWxsLCBzbyB0aGVyZSBpcyBubyBwb3J0YWJsZSB3YXkgb2YKPiArICogY2hh
bmdpbmcgdGhlIGNvbmRpdGlvbnMuCj4gKyAqCj4gKyAqIFRoZSBvbmx5IHN5c3RlbXMgd2hlcmUg
dGhpcyBiZWhhdmlvciBjYW4gYmUgc2VlbiBhcmUgaHlicmlkIGdyYXBoaWNzIGxhcHRvcHMKPiAr
ICogd2l0aCBhIHNlY29uZGFyeSBOdmlkaWEgUGFzY2FsIEdQVS4gSXQgY2Fubm90IGJlIHJ1bGVk
IG91dCB0aGF0IHRoaXMgaXNzdWUKPiArICogb25seSBvY2N1cnMgaW4gY29tYmluYXRpb24gd2l0
aCBsaXN0ZWQgSW50ZWwgUENJZSBicmlkZ2UgY29udHJvbGxlcnMgYW5kCj4gKyAqIHRoZSBtZW50
aW9uZWQgR1BVcyBvciBpZiBpdCdzIG9ubHkgYSBodyBidWcgaW4gdGhlIGJyaWRnZSBjb250cm9s
bGVyLgo+ICsgKgo+ICsgKiBCdXQgYmVjYXVzZSB0aGlzIGlzc3VlIHdhcyBOT1Qgc2VlbiBvbiBs
YXB0b3BzIHdpdGggYW4gTnZpZGlhIFBhc2NhbCBHUFUKPiArICogYW5kIGFuIEludGVsIENvZmZl
ZSBMYWtlIFNvQywgdGhlcmUgaXMgYSBoaWdoZXIgY2hhbmNlIG9mIHRoZXJlIGJlaW5nIGEgYnVn
Cj4gKyAqIGluIHRoZSBicmlkZ2UgY29udHJvbGxlciByYXRoZXIgdGhhbiBpbiB0aGUgR1BVLgo+
ICsgKgo+ICsgKiBUaGlzIGlzc3VlIHdhcyBub3QgYWJsZSB0byBiZSByZXByb2R1Y2VkIG9uIG5v
biBsYXB0b3Agc3lzdGVtcy4KPiArICovCj4gKwo+ICtzdGF0aWMgdm9pZCBxdWlya19icm9rZW5f
bnZfcnVucG0oc3RydWN0IHBjaV9kZXYgKmRldikKPiArewo+ICsgICAgICAgc3RydWN0IHBjaV9k
ZXYgKmJyaWRnZSA9IHBjaV91cHN0cmVhbV9icmlkZ2UoZGV2KTsKPiArCj4gKyAgICAgICBpZiAo
YnJpZGdlLT52ZW5kb3IgPT0gUENJX1ZFTkRPUl9JRF9JTlRFTCAmJgo+ICsgICAgICAgICAgIGJy
aWRnZS0+ZGV2aWNlID09IDB4MTkwMSkKPiArICAgICAgICAgICAgICAgZGV2LT5icm9rZW5fbnZf
cnVucG0gPSAxOwo+ICt9Cj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0NMQVNTX0ZJTkFMKFBDSV9WRU5E
T1JfSURfTlZJRElBLCBQQ0lfQU5ZX0lELAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFBDSV9CQVNFX0NMQVNTX0RJU1BMQVksIDE2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHF1aXJrX2Jyb2tlbl9udl9ydW5wbSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
cGNpLmggYi9pbmNsdWRlL2xpbnV4L3BjaS5oCj4gaW5kZXggYWM4YTZjNGUxNzkyLi45MDNhMGIz
YTM5ZWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9wY2kuaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvcGNpLmgKPiBAQCAtNDE2LDYgKzQxNiw3IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiAgICAg
ICAgIHVuc2lnbmVkIGludCAgICBfX2Flcl9maXJtd2FyZV9maXJzdF92YWxpZDoxOwo+ICAgICAg
ICAgdW5zaWduZWQgaW50ICAgIF9fYWVyX2Zpcm13YXJlX2ZpcnN0OjE7Cj4gICAgICAgICB1bnNp
Z25lZCBpbnQgICAgYnJva2VuX2ludHhfbWFza2luZzoxOyAgLyogSU5UeCBtYXNraW5nIGNhbid0
IGJlIHVzZWQgKi8KPiArICAgICAgIHVuc2lnbmVkIGludCAgICBicm9rZW5fbnZfcnVucG06MTsg
ICAgICAvKiBzb21lIGNvbWJpbmF0aW9ucyBvZiBpbnRlbCBicmlkZ2UgY29udHJvbGxlciBhbmQg
bnZpZGlhIEdQVXMgYnJlYWsgcnRkMyAqLwo+ICAgICAgICAgdW5zaWduZWQgaW50ICAgIGlvX3dp
bmRvd18xazoxOyAgICAgICAgIC8qIEludGVsIGJyaWRnZSAxSyBJL08gd2luZG93cyAqLwo+ICAg
ICAgICAgdW5zaWduZWQgaW50ICAgIGlycV9tYW5hZ2VkOjE7Cj4gICAgICAgICB1bnNpZ25lZCBp
bnQgICAgaGFzX3NlY29uZGFyeV9saW5rOjE7Cj4gLS0KPiAyLjIxLjAKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
