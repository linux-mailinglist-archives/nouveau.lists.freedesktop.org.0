Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17CC1984
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2019 23:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911E76E340;
	Sun, 29 Sep 2019 21:01:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42E6E342
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2019 21:01:10 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-PK5VGkyiM-qk6Xa4dVo_KA-1; Sun, 29 Sep 2019 17:01:02 -0400
Received: by mail-io1-f71.google.com with SMTP id f9so25955161ioh.6
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2019 14:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30emWlVfHfTyK2BbByLaI/vIIYAuGrWMLwtHaX8vu2Q=;
 b=k5+nUXgwgjpZdYvThDyn1GP/gWdK+oGMQJXfCjfIfnmkNNd2AVWy/+JsqghfBzSbdD
 cA4cW7JTf1IVITWLMCM2mIC1hmqSAUXDaRtuIo5DGl2WsB5QHg5jhJTuEORdcgF4wXtJ
 K8gX5+YhIkebk45qTgztiksvZxqbrHjjv9BPtJz9lcfy7lOK9k7H3HDz+qOrSR1ug6Q+
 D8A8cB9T+sIYdtYdLc7GT4B3XX6PAGB70BieAQBIKPLRR9XBD5lypX+F/2aljXeL4Eer
 j/eL0vhv83/g+r1MZHYAlTpiT1OohoBKCB/uu4VPBwf6WOn5Af4DT0hmwEMBktWPoo/i
 Og1A==
X-Gm-Message-State: APjAAAUBXBOD/78XnkBiK3EmmEpv+PddJqRC7R88N0quMU3x9md5GyhA
 APswlSd9elCxG+taSrWCwqrQXebCcKqufOUdtzrfQZ7hs5heJCJxcu6LClytj/Ms5lxmlu25QQ2
 CjmQra1cPzCbRjQRXCuBgS8Aak9dNL+nzPL8Yh6XAHg==
X-Received: by 2002:a92:3ad1:: with SMTP id i78mr17443054ilf.100.1569790861321; 
 Sun, 29 Sep 2019 14:01:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyv6bEGbqq9tQnUildjegms7QFmSkVTP0vzm9LsE/W/Dpw+Jnlje1lsrYnEFd4pow6RNEb1uBMkn34cgsPaN60=
X-Received: by 2002:a92:3ad1:: with SMTP id i78mr17443027ilf.100.1569790861058; 
 Sun, 29 Sep 2019 14:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <bug-111853-8800@http.bugs.freedesktop.org/>
 <bug-111853-8800-UEGS6ysitq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111853-8800-UEGS6ysitq@http.bugs.freedesktop.org/>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 29 Sep 2019 23:00:49 +0200
Message-ID: <CACO55ttq0t_1Vtna9_wzKOYc_k-WgtDhkGAXg3QYGZ1oSDNOUA@mail.gmail.com>
To: bugzilla-daemon@freedesktop.org
X-MC-Unique: PK5VGkyiM-qk6Xa4dVo_KA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1569790869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUWvQ4+6EO5GufvgiQsWKgXw91EjYkYkXHls45lRTlU=;
 b=PPN3TiTRUY+kLWJqKmgkHHiWSiUh5v9VqFEVaZhf2m6UJC5lKkkdyAwJAtLPbQMSboHV3r
 usFFskSssdNzllZMmmOxr0kEOH/hV9JI3cYCKjOYihCuzhnQxSNjy/JbVQ1Qh5n/l2FI6C
 AhtOHZdXGHkmIrqbkdWfR0eipG6yoWE=
Subject: Re: [Nouveau] [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ZG9lcyBhbnl0aGluZyBpbiBkbWVzZyBzaG93IHRoZSByZWFzb24/CgpPbiBTdW4sIFNlcCAyOSwg
MjAxOSBhdCAxMDo0MSBQTSA8YnVnemlsbGEtZGFlbW9uQGZyZWVkZXNrdG9wLm9yZz4gd3JvdGU6
Cj4KPiBDb21tZW50ICMgMiBvbiBidWcgMTExODUzIGZyb20gRmVsaXggTWlhdGEKPgo+IEhvdz8K
PiBlLmcuIG9uIFR1bWJsZXdlZWQ6Cj4gTm90aGluZyBpbiAvZXRjL21vKi8gY29udGFpbnMgdmVh
dQo+IE5vdGhpbmcgaW4gL2V0Yy8gaXMgbmFtZWQgKnZlYXUqCj4gIyBsc3BjaSB8IGdyZXAgLWkg
dmlkaWEKPiAwMTowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJQSBDb3Jwb3Jh
dGlvbiBHODZNIFtHZUZvcmNlIDg0MDBNIEdUXQo+IChyZXYgYTEpCj4gIyB1bmFtZSAtYQo+IExp
bnV4IHZhaW8gNS4zLjEtMi5nMzM1NDIxNi12YW5pbGxhICMxIFNNUCBUaHUgU2VwIDI2IDA2OjA1
OjQ3IFVUQyAyMDE5Cj4gKDMzNTQyMTYpIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eAo+
ICMgY2F0IC9wcm9jL2NtZGxpbmUKPiByb290PS9kZXYvc2RhOSBpcHY2LmRpc2FibGU9MSBuZXQu
aWZuYW1lcz0wIG5vcmVzdW1lIG1pdGlnYXRpb25zPWF1dG8KPiBjb25zb2xlYmxhbms9MCBkcm0u
ZGVidWc9MHgxZSBsb2dfYnVmX2xlbj0xTSBhY3BpPW9mZiAzCj4gIyBwd2QKPiAvbGliL21vZHVs
ZXMvNS4zLjEtMi5nMzM1NDIxNi12YW5pbGxhL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dQo+IGxzIC1sIHwgZ3JlcCB2ZWF1Cj4gLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCA2NDU5ODAgU2Vw
IDI3IDA1OjAzIG5vdXZlYXUua28ueHoKPiAjIHpjYXQgL3Byb2MvY29uZmlnLmd6IHwgZ3JlcCAt
aSB2ZWF1Cj4gQ09ORklHX0RSTV9OT1VWRUFVPW0KPiAjIENPTkZJR19OT1VWRUFVX0xFR0FDWV9D
VFhfU1VQUE9SVCBpcyBub3Qgc2V0Cj4gQ09ORklHX05PVVZFQVVfREVCVUc9NQo+IENPTkZJR19O
T1VWRUFVX0RFQlVHX0RFRkFVTFQ9Mwo+ICMgQ09ORklHX05PVVZFQVVfREVCVUdfTU1VIGlzIG5v
dCBzZXQKPiBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUPXkKPiBDT05GSUdfRFJNX05PVVZF
QVVfU1ZNPXkKPiAjIG1vZHByb2JlIG5vdXZlYXUKPiBtb2Rwcm9iZTogRVJST1I6IGNvdWxkIG5v
dCBpbnNlcnQgJ25vdXZlYXUnOiBObyBzdWNoIGRldmljZQo+Cj4gSG93IGNvdWxkIGl0IGJlIGJs
YWNrbGlzdGVkLCBhbmQgd2h5IGRvZXMgbW9kcHJvYmUgY2xhaW0gdGhlcmUgaXMgbm8gc3VjaAo+
IGRldmljZT8KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cj4KPiBZb3UgYXJlIHRoZSBhc3NpZ25lZSBmb3Ig
dGhlIGJ1Zy4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
