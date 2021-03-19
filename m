Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E373418FA
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2AF6E9D9;
	Fri, 19 Mar 2021 09:58:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EE16E9D8
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14N7YiIxyiIUD8jIqz1YlQ1wNnYD6BJh9pT3hmKB6gU=;
 b=QbUilbYtXdLoNLcfvLhrcDNMrmb3n6ngwOa+oI7wPWheroMjj/WZWtiZY0iloLmnaTOMQh
 j2BKkjuySwaXlIycphDqbKU9Tw86NLaVAqA+sZpD/cWaWtYs5w2MylQiKcvx0ktbh++TF7
 UYm6VOyWCVOapqkA/ws4p32/Bx1rc4w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-8UwjsL6KNl6-VjUwD2a6gA-1; Fri, 19 Mar 2021 05:58:24 -0400
X-MC-Unique: 8UwjsL6KNl6-VjUwD2a6gA-1
Received: by mail-wm1-f72.google.com with SMTP id i14so12659179wmq.7
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=14N7YiIxyiIUD8jIqz1YlQ1wNnYD6BJh9pT3hmKB6gU=;
 b=PLgGrBYyJnI+/fT7aj80vY7utdfsxuwpVPWmSPc7tq7c74w10HHsHdqFnzulKh196h
 e6H5SzjOyZJuMEtkXpDXM4dnQAfrOz9qcifdQ2G6IdNT0buVSbJ8nYZ4uFFUUDZPjXVD
 r3efKmuG02m18rP1tYhK5uAU15MbZ8aXKAB9o/zbuw25OctLHWlBUZcszKX7iTNY1bGn
 Bp7Tk2lnnFEntlxwfi+gzAUPD7Pnvst1/ca80cwLObICy2I+xWngEJnafGKpWKmP+IrI
 Erv28FKgBbazSaStjA7j1VUCk/pAL6a2S+2O+pejpCKOv+eqyPxgOSOsc9hIq+k2/WCt
 hyvA==
X-Gm-Message-State: AOAM530neejwZoGegzws0qNrafAgQr1BPX6/fK1FIDE4DKe1QBCSbmb2
 5jzs+uJJoUs7kpY8hQLx++LHkZp6VMWDCAEjzyU5VMfY10COt62qQnIEYsC3z/Y+eVAYb8djE8L
 YV/1Wosy8kmMkCaZiaDVxr1tV25SZnYBECW/bgLs7og==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3643925wrv.10.1616147903078; 
 Fri, 19 Mar 2021 02:58:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeORHso+wJAMW5iE+h4wMikaT3nxP8XYKaAeRR1AoFZSCKv6xsGOxkyaAWdZVyocVW2UEWX29YgKydp9i6sUE=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3643914wrv.10.1616147902914; 
 Fri, 19 Mar 2021 02:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-15-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-15-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:58:12 +0100
Message-ID: <CACO55ts4nBY1DptpqcUGKgfkUzuQy61o+ZZ5voRfr4hSsqQcRQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 14/19] drm/nouveau/dispnv50/headc57d: Make
 local function 'headc57d_olut' static
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgOToyNSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdk
LmM6MTczOjE6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYaGVhZGM1N2Rf
b2x1dOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBu
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2hlYWRjNTdkLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9o
ZWFkYzU3ZC5jCj4gaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwo+IEBAIC0xNjksNyAr
MTY5LDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwgaW50
IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQo+ICAgICAgICAgd3JpdGV3KHJlYWR3KG1lbSAtIDQp
LCBtZW0gKyA0KTsKPiAgfQo+Cj4gLWJvb2wKPiArc3RhdGljIGJvb2wKPiAgaGVhZGM1N2Rfb2x1
dChzdHJ1Y3QgbnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgsIGlu
dCBzaXplKQo+ICB7Cj4gICAgICAgICBpZiAoc2l6ZSAhPSAwICYmIHNpemUgIT0gMjU2ICYmIHNp
emUgIT0gMTAyNCkKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpSZXZpZXdlZC1ieTogS2Fyb2wgSGVyYnN0IDxraGVy
YnN0QHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
