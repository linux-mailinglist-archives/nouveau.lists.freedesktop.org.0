Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8433418E8
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4256E9CD;
	Fri, 19 Mar 2021 09:56:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609E66E9CB
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysOGQ+JuPnyfkvsyXVUk/A0GgAxeDgtK3Jp6pwQPGCg=;
 b=Kdh5s9X3t+h7meJi+EJu21uDo/2+ETeiUUaa6s+QXuYs8mDFq34mO/ZhuW3G8V8n4+KDS0
 g5ULmVaZNeLGrUTcXFR9rZ1lNmLR6qRrzLyCozozoR3FyULamnm3kMlEwlCKR86ERDt1QV
 c9vtZ7iDd0vBx4hMGqNcsHbv4b1BBNY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-mheYxf7BNSqaXJ7XsGU7_g-1; Fri, 19 Mar 2021 05:56:42 -0400
X-MC-Unique: mheYxf7BNSqaXJ7XsGU7_g-1
Received: by mail-wr1-f69.google.com with SMTP id r12so21600519wro.15
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ysOGQ+JuPnyfkvsyXVUk/A0GgAxeDgtK3Jp6pwQPGCg=;
 b=XQMG3l1VfBkDy4CkGKb3yg8mHRXcCXPmK3Jk2bIsH4DfQNsPRk1kg4nFMdw4kooIrD
 hbXmNJ77M/EfIsFpHirRmQ5AwhHfW0RAGcO7izK3DvRqNMPM13YbmH8sO9kfr1FoBukR
 Zg8vP09t6K7Hepb6ZPgLb/tu68SSI85L5YSqeGuW43NbD5za28SUjUYxCA2KQf7FM323
 oaXmgelZ8iIF6EcSzl6PVy6Ni8bZOYMOk1exTZ/s0VCiZ1zIIx6q8y3dDTNYDL4wwzw3
 Zo/m6csnRR6l17WEBL7PIh3Aa6GeavV3SJy1s315rqcOrEhn2oEnXiaoQwf7OOPYCN01
 APqg==
X-Gm-Message-State: AOAM532x/1P84DAKSGDLlFJMUhtNknspfBCd5u2FB1gU/CoEAhbZpEoR
 ETrxGwHlVE7Xud2nKmb1MxUsnW4WrmBhLbmHeJXp32UdH5GbZmcuTrEYuNf2s07FVclBd+zsO+m
 +LNqrKGrxEfFgyaIaumkcnbjWoy8Ig6cyYVZ7BImFvA==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3001412wmg.171.1616147800803; 
 Fri, 19 Mar 2021 02:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3mEE6CSIZmWxiZ1XdIJ72ZTiVHg0YQRrSzZBZE3GwjnidS+39Es1MG0HcFFBZdOYiKYjsbTZEIXLbb0wk0kQ=
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3001400wmg.171.1616147800686; 
 Fri, 19 Mar 2021 02:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-16-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-16-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:56:29 +0100
Message-ID: <CACO55ttoFZdD6y_3sBr0aJseX=zZ=09E3bRXYyNy1djVSb2oew@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 15/19] drm/nouveau/nv50_display: Remove
 superfluous prototype for local static functions
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
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3I6Cj4KPiAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjI1MzA6MTogZXJyb3I6IGNv
bmZsaWN0aW5nIHR5cGVzIGZvciDigJhudjUwX2Rpc3BsYXlfZmluaeKAmQo+ICBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgo+
ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaDozNjo2OiBub3RlOiBwcmV2
aW91cyBkZWNsYXJhdGlvbiBvZiDigJhudjUwX2Rpc3BsYXlfZmluaeKAmSB3YXMgaGVyCj4gIElu
IGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmM6NzE6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5v
dGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBo
ZXJlCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoyNTgxOjE6IGVy
cm9yOiBzdGF0aWMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1MF9kaXNwbGF5X2Rlc3Ryb3nigJkgZm9s
bG93cyBub24tc3RhdGljIGRlY2xhcmF0aW9uCj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6NzE6Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9u
IG9mIOKAmG52NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBoZXJlCj4KPiBDYzogQmVuIFNrZWdn
cyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oIHwgMyAtLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUw
X2Rpc3BsYXkuaAo+IGluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaAo+IEBAIC0zMSw3ICszMSw0IEBACj4g
ICNpbmNsdWRlICJub3V2ZWF1X3JlZy5oIgo+Cj4gIGludCAgbnY1MF9kaXNwbGF5X2NyZWF0ZShz
dHJ1Y3QgZHJtX2RldmljZSAqKTsKPiAtdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3Qg
ZHJtX2RldmljZSAqKTsKPiAtaW50ICBudjUwX2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqKTsKPiAtdm9pZCBudjUwX2Rpc3BsYXlfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqKTsKPiAg
I2VuZGlmIC8qIF9fTlY1MF9ESVNQTEFZX0hfXyAqLwo+IC0tCj4gMi4yNy4wCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKClJldmlld2VkLWJ5
OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
