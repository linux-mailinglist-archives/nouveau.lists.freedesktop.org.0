Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015BB54EF
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 20:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B716ED26;
	Tue, 17 Sep 2019 18:11:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B116E968
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 18:11:06 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F8386B
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 18:11:06 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id o133so5215871qke.4
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 11:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kG4gm4qKD8Ms7iGlRGT9MOrEiP9I5AnXWjPbLni340M=;
 b=uP1Fa8PTrCfm3WdKCuEA8inOl5g8r/5vFFI3HNQ5E6Pa8aXGtTFhxe3VJnncP/e8YM
 bF938mlgywAbh6/oVQfjbtErT2YgiKHigflveTWeQeQFXkwCOXuzAMGK1s04Gkp8RfOa
 5WXHgzml/a7iFrStORfavjEItbXSK5z3siVBEOT8kTYCMaWZKs6SIvAwZdF8V9ednw7w
 DX1evY3uCxBZjrTtH6/KEHHlX3t7fu7hYPzH8AlFWbqIkiWsqOjdHld0ifBhv1YaMSjg
 cLcVHa/slnzDpxFkaac/I98SoCsJHoL3jSCPYp/RjcIQL8o16PlzRIdBp/KSMwOGyKzb
 O4BA==
X-Gm-Message-State: APjAAAXyEb9Tt8e/wqTRuqoJWd2yBLiJFKPv051XmVyMaMeGHeDOO+fD
 1IURvN5g1V6LwdUP+Lvy7EQZYlsmIJsGcC2BLkDblOa7C5b71l/EohRJq13pj6G4X/A4nEeAtMN
 z1f+Yn9vcQBLpXmqdbd+7TawFsw==
X-Received: by 2002:a37:9f47:: with SMTP id i68mr5566440qke.246.1568743864643; 
 Tue, 17 Sep 2019 11:11:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9CVIDuaXCX2B7uSBJMAFBmUa538mFxy7FKAZavqWNvoDkWrOQeMkzzvjhfBJ4fiHvFmOabw==
X-Received: by 2002:a37:9f47:: with SMTP id i68mr5566418qke.246.1568743864422; 
 Tue, 17 Sep 2019 11:11:04 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id q49sm1925130qta.60.2019.09.17.11.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:11:03 -0700 (PDT)
Message-ID: <feaad2fac13cc3cf1a5db6577380ea784e9227cf.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 17 Sep 2019 14:11:02 -0400
In-Reply-To: <20190916143606.9272-3-thierry.reding@gmail.com>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
 <20190916143606.9272-3-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau: tegra: Do not try to disable
 PCI device
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSBkb24ndCBzZWUgYW55IHByb2JsZW1zIHdpdGggdGhpcywgc2luY2UgbnZrbV9kZXZpY2VfZGVs
KCkgaXMgbWFpbmx5IGluCmNoYXJnZSBvZiBqdXN0IHJlbGVhc2luZyBtZW1vcnkgYWxsb2NhdGlv
bnMgYXMgaXMgZHJtX2Rldl9wdXQoKS4KClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgoKT24gTW9uLCAyMDE5LTA5LTE2IGF0IDE2OjM2ICswMjAwLCBUaGllcnJ5IFJl
ZGluZyB3cm90ZToKPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
IAo+IFdoZW4gTm91dmVhdSBpcyBpbnN0YW50aWF0ZWQgb24gdG9wIG9mIGEgcGxhdGZvcm0gZGV2
aWNlLCB0aGUgZGV2LT5wZGV2Cj4gZmllbGQgd2lsbCBiZSBOVUxMIGFuZCBjYWxsaW5nIHBjaV9k
aXNhYmxlX2RldmljZSgpIHdpbGwgY3Jhc2guIE1vdmUgdGhlCj4gUENJIGRpc2FibGluZyBjb2Rl
IHRvIHRoZSBQQ0kgc3BlY2lmaWMgZHJpdmVyIHJlbW92YWwgY29kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RybS5jCj4gaW5kZXggMmNkODM4NDk2MDBmLi5iNjVhZTgxN2VhYmYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKPiBAQCAtNzE1LDcgKzcxNSw2IEBA
IHN0YXRpYyBpbnQgbm91dmVhdV9kcm1fcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gIHZv
aWQKPiAgbm91dmVhdV9kcm1fZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+
ICB7Cj4gLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGRldi0+cGRldjsKPiAgCXN0cnVjdCBub3V2
ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oZGV2KTsKPiAgCXN0cnVjdCBudmttX2NsaWVudCAq
Y2xpZW50Owo+ICAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2U7Cj4gQEAgLTcyNyw3ICs3MjYs
NiBAQCBub3V2ZWF1X2RybV9kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4g
IAlkZXZpY2UgPSBudmttX2RldmljZV9maW5kKGNsaWVudC0+ZGV2aWNlKTsKPiAgCj4gIAlub3V2
ZWF1X2RybV9kZXZpY2VfZmluaShkZXYpOwo+IC0JcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+
ICAJZHJtX2Rldl9wdXQoZGV2KTsKPiAgCW52a21fZGV2aWNlX2RlbCgmZGV2aWNlKTsKPiAgfQo+
IEBAIC03MzgsNiArNzM2LDcgQEAgbm91dmVhdV9kcm1fcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsK
PiAgCj4gIAlub3V2ZWF1X2RybV9kZXZpY2VfcmVtb3ZlKGRldik7Cj4gKwlwY2lfZGlzYWJsZV9k
ZXZpY2UocGRldik7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQKLS0gCkNoZWVycywKCUx5dWRlIFBh
dWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
