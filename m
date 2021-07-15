Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75E3CAEB8
	for <lists+nouveau@lfdr.de>; Thu, 15 Jul 2021 23:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C626E334;
	Thu, 15 Jul 2021 21:47:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA706E33F
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jul 2021 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626385645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VbJoFGn3iVtEo23nu3H2b6uKsNM79IeS4yIQ3LlXnk=;
 b=CK2kQJ3psZwU1sZAF6c73irJUfarq+07bUNA+3gwigyVCTgv7dVpdYVMwRn1+Iz4Id9/wm
 igaeGUeWKeqhNT9oLIMA4Dk3frrMCwDN7D8Yy4oy3uZTG8yTdDnBau0V5Lo2xy4CgliRft
 rcAIly7BJZ8hJtwfQ//VXgASE9DmMxU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-RT9xP38bOlOaPlcpA3sOxw-1; Thu, 15 Jul 2021 17:47:22 -0400
X-MC-Unique: RT9xP38bOlOaPlcpA3sOxw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k63-20020a37a1420000b02903b4fb67f606so4844465qke.10
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6VbJoFGn3iVtEo23nu3H2b6uKsNM79IeS4yIQ3LlXnk=;
 b=ntXatamcGwdoa9zVwsfwDQQl3zQq92jPBgAsGUPiSerJ5TpXFf/0H0/lpTPzwRUUXY
 5mNpyJ2pJc38qYp5lOz3XCr6TqpGK9ULN0xXSrI9eldwBoas8Slr8xvEoIkAVzhMiqqI
 RbBRT6Ee3Di55bzYZiZ+y7R2AVcjFztnviRkOI4iLUFNG1YkKT+M0krC3qb/ZaY1U3NL
 U47aojPZWNvuCpd7Z6zZgfOpiuw1P5yBrq9mfVWJfFfYJgP/6j1Gq7E/HKINqzt7EHwU
 PdbjaKdYCh0DfWxVSj2Py/CWNNjcvsaskPNXg+/yyE3bGfEp8M0KSdmuNGd9CBFjx9EN
 41gA==
X-Gm-Message-State: AOAM530Sf/r4OlxqAtpkuottHL89JRnQXJbG0ecb8oZEZOLCTMenRhsa
 CgRUXUEA9JIGffHXG10FFKeRwMVvjyVEDghZAuU/NsWpbSykIalZ06pC3x4pHB2zYfs9f51je7v
 IO9GDvn445DUgn4QjMFezN4kcyg==
X-Received: by 2002:a37:596:: with SMTP id 144mr6005308qkf.147.1626385642393; 
 Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf6CxMuCywKlr13sMEvKt2RmDZXJ3nQGJyosoC9dHBut/1SP4vBw0DEf6PE92oUlap1x+XxQ==
X-Received: by 2002:a37:596:: with SMTP id 144mr6005296qkf.147.1626385642176; 
 Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id u3sm2549187qtg.16.2021.07.15.14.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 14:47:21 -0700 (PDT)
Message-ID: <9c9c3878de9640239b51fb961e949d2b075dc5ac.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Thu, 15 Jul 2021 17:47:20 -0400
In-Reply-To: <20210714171523.413-1-rdunlap@infradead.org>
References: <20210714171523.413-1-rdunlap@infradead.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH -next] drm: nouveau: fix disp.c build when
 NOUVEAU_BACKLIGHT is not enabled
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBXZWQsIDIwMjEt
MDctMTQgYXQgMTA6MTUgLTA3MDAsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBGaXggYnVpbGQgZXJy
b3JzIGFuZCB3YXJuaW5ncyB3aGVuCj4gIyBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUIGlz
IG5vdCBzZXQKPiAKPiAuLi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6
IEluIGZ1bmN0aW9uCj4g4oCYbnY1MF9zb3JfYXRvbWljX2Rpc2FibGXigJk6Cj4gLi4vZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjE2NjU6NTI6IGVycm9yOiDigJhzdHJ1
Y3QKPiBub3V2ZWF1X2Nvbm5lY3RvcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGJhY2tsaWdo
dOKAmQo+IMKgIHN0cnVjdCBub3V2ZWF1X2JhY2tsaWdodCAqYmFja2xpZ2h0ID0gbnZfY29ubmVj
dG9yLT5iYWNrbGlnaHQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF5+Cj4gLi4vZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjE2
NzA6Mjg6IGVycm9yOiBkZXJlZmVyZW5jaW5nCj4gcG9pbnRlciB0byBpbmNvbXBsZXRlIHR5cGUg
4oCYc3RydWN0IG5vdXZlYXVfYmFja2xpZ2h04oCZCj4gwqAgaWYgKGJhY2tsaWdodCAmJiBiYWNr
bGlnaHQtPnVzZXNfZHBjZCkgewo+IAo+IGFuZCB0aGVuIGZpeCBzdWJzZXF1ZW50IGJ1aWxkIHdh
cm5pbmdzIGFmdGVyIHRoZSBhYm92ZSBhcmUgZml4ZWQ6Cj4gCj4gLi4vZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOiBJbiBmdW5jdGlvbgo+IOKAmG52NTBfc29yX2F0b21p
Y19kaXNhYmxl4oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YzoxNjY5OjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZQo+IOKAmHJldOKAmSBbLVd1bnVzZWQt
dmFyaWFibGVdCj4gwqAgaW50IHJldDsKPiDCoMKgwqDCoMKgIF5+fgo+IC4uL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxNjYyOjIyOiB3YXJuaW5nOiB1bnVzZWQgdmFy
aWFibGUKPiDigJhkcm3igJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+IMKgIHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtID0gbm91dmVhdV9kcm0obnZfZW5jb2Rlci0+YmFzZS5iYXNlLmRldik7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fgo+IAo+IEZpeGVzOiA2
ZWNhMzEwZTg5MjQgKCJkcm0vbm91dmVhdS9rbXMvbnY1MC06IEFkZCBiYXNpYyBEUENEIGJhY2ts
aWdodAo+IHN1cHBvcnQgZm9yIG5vdXZlYXUiKQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8wqDC
oMKgIDggKysrKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gLS0tIGxpbnV4LW5leHQtMjAyMTA3MTQub3JpZy9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiArKysgbGludXgtbmV4dC0yMDIxMDcxNC9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBAQCAtMTY1OSwyMyArMTY1OSwy
NyBAQCBzdGF0aWMgdm9pZAo+IMKgbnY1MF9zb3JfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLCBzdHJ1Y3QKPiBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiDCoHsK
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IG5vdXZlYXVfZW5jb2RlciAqbnZfZW5jb2RlciA9IG5v
dXZlYXVfZW5jb2RlcihlbmNvZGVyKTsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9k
cm0gKmRybSA9IG5vdXZlYXVfZHJtKG52X2VuY29kZXItPmJhc2UuYmFzZS5kZXYpOwo+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9jcnRjICpudl9jcnRjID0gbm91dmVhdV9jcnRjKG52
X2VuY29kZXItPmNydGMpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9jb25uZWN0
b3IgKm52X2Nvbm5lY3RvciA9Cj4gbnY1MF9vdXRwX2dldF9vbGRfY29ubmVjdG9yKHN0YXRlLCBu
dl9lbmNvZGVyKTsKPiArI2lmZGVmIENPTkZJR19EUk1fTk9VVkVBVV9CQUNLTElHSFQKPiArwqDC
oMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG52X2VuY29k
ZXItPmJhc2UuYmFzZS5kZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9iYWNr
bGlnaHQgKmJhY2tsaWdodCA9IG52X2Nvbm5lY3Rvci0+YmFja2xpZ2h0Owo+ICsjZW5kaWYKPiDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9kcF9hdXggKmF1eCA9ICZudl9jb25uZWN0b3ItPmF1
eDsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDCoMKgwqDCoMKgwqDCoMKgdTggcHdyOwo+
IMKgCj4gKyNpZmRlZiBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUCj4gwqDCoMKgwqDCoMKg
wqDCoGlmIChiYWNrbGlnaHQgJiYgYmFja2xpZ2h0LT51c2VzX2RwY2QpIHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9lZHBfYmFja2xpZ2h0X2Rpc2FibGUoYXV4
LCAmYmFja2xpZ2h0LT5lZHBfaW5mbyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAocmV0IDwgMCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBOVl9FUlJPUihkcm0sICJGYWlsZWQgdG8gZGlzYWJsZSBiYWNrbGlnaHQgb24KPiBb
Q09OTkVDVE9SOiVkOiVzXTogJWRcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudl9jb25uZWN0b3ItPmJhc2UuYmFz
ZS5pZCwgbnZfY29ubmVjdG9yLQo+ID5iYXNlLm5hbWUsIHJldCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oH0KPiArI2VuZGlmCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKG52X2VuY29kZXItPmRjYi0+
dHlwZSA9PSBEQ0JfT1VUUFVUX0RQKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGludCByZXQgPSBkcm1fZHBfZHBjZF9yZWFkYihhdXgsIERQX1NFVF9QT1dFUiwgJnB3cik7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9kcF9kcGNkX3JlYWRiKGF1
eCwgRFBfU0VUX1BPV0VSLCAmcHdyKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKHJldCA9PSAwKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcHdyICY9IH5EUF9TRVRfUE9XRVJfTUFTSzsKPiAKCi0tIApDaGVlcnMs
CiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
