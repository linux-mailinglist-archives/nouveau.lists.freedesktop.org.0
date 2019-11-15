Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84DCFE46F
	for <lists+nouveau@lfdr.de>; Fri, 15 Nov 2019 19:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279E6EA1D;
	Fri, 15 Nov 2019 18:00:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD78F6EA1D
 for <nouveau@lists.freedesktop.org>; Fri, 15 Nov 2019 17:59:59 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-T8CKlPufN_K6CJ6mGvFBnA-1; Fri, 15 Nov 2019 12:59:56 -0500
Received: by mail-qk1-f200.google.com with SMTP id o11so5920737qkk.7
 for <nouveau@lists.freedesktop.org>; Fri, 15 Nov 2019 09:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=zIwhRDWnCJJEFN72Q3MbsTCt6QLWvEWwN2DwQHlMJ5A=;
 b=FBFrfZvP8S/kWvI7dugYbPYD55LGFwnlSiGXy4SGCXa5nQhnOBOdN5kRhXmKdeSVs/
 UGKMQPHD8tUTfjiVeQLNfDT7qE3fNtFZgG3heu35sF5aWuk2F5mieK0EJVbbTt9yKomt
 WqBPyCCg4i/Y4mqCJpNeQDfLBV39vTUI/gp67pxlm4tOW8XRXyYO2MIp1u+KXBX3s8or
 FOb9RS5k6glxLn9tqZUQ3BY6wgB+URHB96Yw+QMw99EjAxgfuNdIBk6VN9JIgnnQsag1
 LYlZumolWOWLKZyqKSCLGWmotII9EcrAyXBx74/Tjv11vL0IfJXerg7q4lUWzgMHVGHB
 r5Zg==
X-Gm-Message-State: APjAAAX/0aIm6+/b62oHpTQAZ9SdEGwe9J/G8XUA1jIjIhAZazxkGGc/
 7RmPO6jmi9gevEV4M4KGBkwgY8QrZKSE4hLGd4TluLXIN71YopUojRRr2XhWzClEoWbQqHoGJ0s
 57Vk4nLwOwZNu7k1xs8L+ZjcD0w==
X-Received: by 2002:a05:620a:1127:: with SMTP id
 p7mr14064293qkk.250.1573840796452; 
 Fri, 15 Nov 2019 09:59:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYMAIFotzOGV6FKioNGzxfCKSYD6mwDQxAj9pIiReFd95wUFmBVpX+FCnmdzuihBRadEiwHA==
X-Received: by 2002:a05:620a:1127:: with SMTP id
 p7mr14064271qkk.250.1573840796209; 
 Fri, 15 Nov 2019 09:59:56 -0800 (PST)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id o28sm5561283qtk.4.2019.11.15.09.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 09:59:55 -0800 (PST)
Message-ID: <d3da084d1576a2fdd3818b048ff5afd67df052e0.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: zhengbin <zhengbin13@huawei.com>, bskeggs@redhat.com, airlied@linux.ie, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Fri, 15 Nov 2019 12:59:53 -0500
In-Reply-To: <1573825353-86268-2-git-send-email-zhengbin13@huawei.com>
References: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
 <1573825353-86268-2-git-send-email-zhengbin13@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: T8CKlPufN_K6CJ6mGvFBnA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573840798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5K0xuMYdWnIleL/t0+6BBUk3U5IJmcKBjaaZJaK21ms=;
 b=IcyvTH6iRp0HBIbLZUNPh9I17GABsvhKnamv6OfFQArTT1kviSedUvjdfy7fpiT2RME2ij
 LKp9HxDV9zcWHDRiCztfVvTg+OJbjIN3k6b5TKXc1tclyDf0jzW4cE21HFvIcBCEeKCAy9
 I4qbWLVWboveF4E9irDGCYXX7j+Kr5Q=
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau: remove set but not used
 variable 'pclks', 'width'
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MTEtMTUgYXQgMjE6NDIgKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnYwNC9hcmIuYzogSW4gZnVuY3Rpb24gbnYwNF9jYWxjX2FyYjoKPiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnYwNC9hcmIuYzo1OToyMTogd2FybmluZzogdmFyaWFibGUgcGNs
a3Mgc2V0Cj4gYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+IGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jOiBJbiBmdW5jdGlvbiBudjA0X2NhbGNf
YXJiOgo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jOjU4OjIxOiB3YXJu
aW5nOiB2YXJpYWJsZSB3aWR0aCBzZXQKPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gCj4gSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgNmVlNzM4NjEwZjQxICgi
ZHJtL25vdXZlYXU6Cj4gQWRkIERSTSBkcml2ZXIgZm9yIE5WSURJQSBHUFVzIiksIGJ1dCBuZXZl
ciB1c2VkLAo+IHNvIHJlbW92ZSBpdC4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVh
d2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMg
fCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9h
cmIuYwo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMKPiBpbmRleCAz
NjI0OTU1Li45ZDRhMmQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjA0L2FyYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJi
LmMKPiBAQCAtNTMsOCArNTMsOCBAQCBzdHJ1Y3QgbnZfc2ltX3N0YXRlIHsKPiAgc3RhdGljIHZv
aWQKPiAgbnYwNF9jYWxjX2FyYihzdHJ1Y3QgbnZfZmlmb19pbmZvICpmaWZvLCBzdHJ1Y3QgbnZf
c2ltX3N0YXRlICphcmIpCj4gIHsKPiAtCWludCBwYWdlbWlzcywgY2FzLCB3aWR0aCwgYnBwOwo+
IC0JaW50IG52Y2xrcywgbWNsa3MsIHBjbGtzLCBjcnRwYWdlbWlzczsKPiArCWludCBwYWdlbWlz
cywgY2FzLCBicHA7Cj4gKwlpbnQgbnZjbGtzLCBtY2xrcywgY3J0cGFnZW1pc3M7Cj4gIAlpbnQg
Zm91bmQsIG1jbGtfZXh0cmEsIG1jbGtfbG9vcCwgY2JzLCBtMSwgcDE7Cj4gIAlpbnQgbWNsa19m
cmVxLCBwY2xrX2ZyZXEsIG52Y2xrX2ZyZXE7Cj4gIAlpbnQgdXNfbSwgdXNfbiwgdXNfcCwgY3J0
Y19kcmFpbl9yYXRlOwo+IEBAIC02NSwxMSArNjUsOSBAQCBudjA0X2NhbGNfYXJiKHN0cnVjdCBu
dl9maWZvX2luZm8gKmZpZm8sIHN0cnVjdAo+IG52X3NpbV9zdGF0ZSAqYXJiKQo+ICAJbnZjbGtf
ZnJlcSA9IGFyYi0+bnZjbGtfa2h6Owo+ICAJcGFnZW1pc3MgPSBhcmItPm1lbV9wYWdlX21pc3M7
Cj4gIAljYXMgPSBhcmItPm1lbV9sYXRlbmN5Owo+IC0Jd2lkdGggPSBhcmItPm1lbW9yeV93aWR0
aCA+PiA2Owo+ICAJYnBwID0gYXJiLT5icHA7Cj4gIAljYnMgPSAxMjg7Cj4gCj4gLQlwY2xrcyA9
IDI7Cj4gIAludmNsa3MgPSAxMDsKPiAgCW1jbGtzID0gMTMgKyBjYXM7Cj4gIAltY2xrX2V4dHJh
ID0gMzsKPiAtLQo+IDIuNy40Cj4gCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
