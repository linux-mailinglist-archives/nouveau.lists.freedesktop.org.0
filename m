Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358F44D25
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 22:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C1F8928F;
	Thu, 13 Jun 2019 20:13:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CA38929C
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 20:13:52 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x21so384075otq.12
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 13:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DdSbzBj3GN9lmFE97uLhhDp9bhFpPD/Ri2wBNX09PfQ=;
 b=sRm7O39CKzjfWrxFFVABtQn+CmgQQAeD0Q3RTFm7eg/mko4LIIz8xmwAEPr3XTmNQh
 bR0H4rEP80J66JtdFqUdugyphnqvhSs3ItQYGJYvxLMGKyE/8B9ybVhUPkYh3EwZjATt
 VzYry15Y69GQaAMq9dll55KL5MXJQyGSO6SpcJ6CsFMYlkZNpj4JUfyqC715h6H8Ja+C
 yyAl4EOBTW6YSFPntCHuk3RCDR+POaS7ooAlT3UbgpCuJD8p5i0khPesAmYAykfc7iIH
 v0oNn0Otsp5TVDXYXdwlReSTxpjhtG1CwyC99TghgiS9XYvUkE6IJrAWRptJUJoIMw6O
 jq9w==
X-Gm-Message-State: APjAAAXt9vbGzewAqfr7n5h96ok7esEDPCuqRb8EQNIIzr5AZB2rICNG
 qnr3GtBjqEJQahdngp59XyNCgtQPzz36y3ZEntFI2w==
X-Google-Smtp-Source: APXvYqykaGayuOdeZmPun6lqMah28WqyaWO5bFenPtOzBFg0qXVTvO/T6gfkniMpvZVUXEcVxeJc+t1pW1I4QrwLh2Q=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr37784514otn.71.1560456832159; 
 Thu, 13 Jun 2019 13:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-10-hch@lst.de>
 <20190613193427.GU22062@mellanox.com>
In-Reply-To: <20190613193427.GU22062@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 13:13:41 -0700
Message-ID: <CAPcyv4iwVPm2XBviR8E32VJG+ZZTHZLGxDdXS3et22CTT_3qNA@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DdSbzBj3GN9lmFE97uLhhDp9bhFpPD/Ri2wBNX09PfQ=;
 b=OSBqGRX5/KZ8rtnYLy8/+VzWXJoy8dOkJHihIoyUXY2eP7FoiV7nziOVkOw4+nZKoB
 8BX3vQfUbWi26DrxuPJOZQTkwLvG8bcvI5bR3K46S8XaTPV6uYDB19u7pEoWDIMGVXIT
 76Gat4HdmnE0UfZtW6tDnTRkZMx/UjOMIIhYc/M0re4EVEJMI//Xgzy79OcW2RngZAFY
 Ex/a+k84aj46psorP2SyODhm0RWUknVG0v09x5bcP8Nl31V8edNccp6WpICo1yfvAEqk
 4PlHWylrgwZOgDTADWj7FVO4iX7LA9uouJaVlZvN2+vo54OtBLhCAxLVmuocFehTb/fy
 IX0Q==
Subject: Re: [Nouveau] [PATCH 09/22] memremap: lift the devmap_enable
 manipulation into devm_memremap_pages
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
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6MzUgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjEyQU0g
KzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gSnVzdCBjaGVjayBpZiB0aGVyZSBp
cyBhIC0+cGFnZV9mcmVlIG9wZXJhdGlvbiBzZXQgYW5kIHRha2UgY2FyZSBvZiB0aGUKPiA+IHN0
YXRpYyBrZXkgZW5hYmxlLCBhcyB3ZWxsIGFzIHRoZSBwdXQgdXNpbmcgZGV2aWNlIG1hbmFnZWQg
cmVzb3VyY2VzLgo+ID4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiA+IGluZGV4
IGM3NmExYjVkZWZkYS4uNmRjNzY5ZmViMmUxIDEwMDY0NAo+ID4gKysrIGIvbW0vaG1tLmMKPiA+
IEBAIC0xMzc4LDggKzEzNzgsNiBAQCBzdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQo
Y29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMsCj4gPiAgICAgICB2b2lkICpyZXN1bHQ7
Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgIGRldl9wYWdlbWFwX2dldF9vcHMoKTsK
PiA+IC0KPgo+IFdoZXJlIHdhcyB0aGUgbWF0Y2hpbmcgZGV2X3BhZ2VtYXBfcHV0X29wcygpIGZv
ciB0aGlzIGhtbSBjYXNlPyBUaGlzCj4gaXMgYSBidWcgZml4IHRvbz8KPgoKSXQgbmV2ZXIgZXhp
c3RlZC4gSE1NIHR1cm5lZCBvbiB0aGUgZmFjaWxpdHkgYW5kIG1hZGUgZXZlcnlvbmUncwpwdXRf
cGFnZSgpIG9wZXJhdGlvbnMgc2xvd2VyIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBITU0gd2FzIGlu
IGFjdGl2ZQp1c2UuCgo+IFRoZSBub3V2ZWF1IGRyaXZlciBpcyB0aGUgb25seSBvbmUgdG8gYWN0
dWFsbHkgY2FsbCB0aGlzIGhtbSBmdW5jdGlvbgo+IGFuZCBpdCBkb2VzIGl0IGFzIHBhcnQgb2Yg
YSBwcm9iZSBmdW5jdGlvbi4KPgo+IFNlZW1zIHJlYXNvbmFibGUsIGhvd2V2ZXIsIGluIHRoZSB1
bmxpa2VseSBldmVudCB0aGF0IGl0IGZhaWxzIHRvIGluaXQKPiAnZG1lbScgdGhlIGRyaXZlciB3
aWxsIHJldGFpbiBhIGRldl9wYWdlbWFwX2dldF9vcHMgdW50aWwgaXQgdW5sb2Fkcy4KPiBUaGlz
IGltYmFsYW5jZSBkb2Vzbid0IHNlZW0gd29ydGggd29ycnlpbmcgYWJvdXQuCgpSaWdodCwgdW5s
ZXNzL3VudGlsIHRoZSBvdmVyaGVhZCBvZiBjaGVja2luZyBmb3IgcHV0X3BhZ2UoKSBjYWxsYmFj
a3MKc3RhcnRzIHRvIGh1cnQgbGVhdmluZyBwYWdlbWFwX29wcyB0aWVkIHRvIGxpZmV0aW1lIG9m
IHRoZSBkcml2ZXIgbG9hZApzZWVtcyBhY2NlcHRhYmxlIGJlY2F1c2Ugd2hvIHVuYmluZHMgdGhl
aXIgR1BVIGRldmljZSBhdCBydW50aW1lPyBPbgp0aGUgb3RoZXIgaGFuZCBpdCB3YXMgc2ltcGxl
IGVub3VnaCBmb3IgdGhlIHBtZW0gZHJpdmVyIHRvIGRyb3AgdGhlCnJlZmVyZW5jZSBlYWNoIHRp
bWUgYSBkZXZpY2Ugd2FzIHVuYm91bmQganVzdCB0byBjbG9zZSB0aGUgbG9vcC4KCj4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgouLi5taW5vciB0eXBvLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
